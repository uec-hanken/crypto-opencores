`timescale 1ns/1ps
module tb ();

reg		iClk, iRstn;
reg		iStart;
reg		iWrM, iWrE, iWrN;
wire	[63:0]	iM, iE, iN;
reg		iRdR;
wire	[63:0]	oR;
wire		oDone;

integer		i;
reg	[1023:0]M, E, N, R;

RSA_ModExp U0 (
	.iClk	(iClk),
	.iRstn	(iRstn),
	.iStart	(iStart),
	.iWrM	(iWrM),
	.iWrE	(iWrE),
	.iWrN	(iWrN),
	.iM	(iM),
	.iE	(iE),
	.iN	(iN),
	.iRdR	(iRdR),
	.oR	(oR),
	.oDone	(oDone)	);

always #5 iClk = ~iClk;

assign iM = M[63:0];
assign iE = E[63:0];
assign iN = N[63:0];

initial begin
	iClk	= 1'b0;
	iRstn	= 1'b0;
	iStart	= 1'b0;
	iWrM	= 1'b0;
	iWrE	= 1'b0;
	iWrN	= 1'b0;
	M	= 1024'b0;
	E	= 1024'b0;
	N	= 1024'b0;
	iRdR	= 1'b0;
#16	iRstn	= 1'b1;
/****************** TEST 1 ******************/
#20	M	= 1024'd2;
	E	= 1024'd4;
	N	= 1024'd3;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 1");
	if(R==1024'd1)	$display("Value get: %d CORRECT",R);
	else		$display("Value get: %d WRONG!",R);
/****************** TEST 2 ******************/
#10	M	= 1024'd3;
	E	= 1024'd6;
	N	= 1024'd10;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 9");
	if(R==1024'd9)	$display("Value get: %d CORRECT",R);
	else		$display("Value get: %d WRONG!",R);
/****************** TEST 3 ******************/
#10	M	= 1024'd7;
	E	= 1024'd5;
	N	= 1024'd9;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 4");
	if(R==1024'd4)	$display("Value get: %d CORRECT",R);
	else		$display("Value get: %d WRONG!",R);
/****************** TEST 4 ******************/
#10	M	= 1024'd8;
	E	= 1024'd6;
	N	= 1024'd13;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 12");
	if(R==1024'd12)	$display("Value get: %d CORRECT",R);
	else		$display("Value get: %d WRONG!",R);
/****************** TEST 5 ******************/
#10	M	= 1024'd65;
	E	= 1024'd17;
	N	= 1024'd3233;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 2790");
	if(R==1024'd2790)	$display("Value get: %d CORRECT",R);
	else			$display("Value get: %d WRONG!",R);
/****************** TEST 6 ******************/
#10	M	= 1024'd2790;
	E	= 1024'd413;
	N	= 1024'd3233;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 65");
	if(R==1024'd65)	$display("Value get: %d CORRECT",R);
	else		$display("Value get: %d WRONG!",R);
/****************** TEST 7 ******************/
/*#10	M	= 1024'h0008df668ac99f93ab900fd3ba636a00cc747142e129d188480440eda318bc0697b0b689745d228be9ddf1cf1292ad6da790c1188845a8f20d54b11ba993e3fab7bb70c136e28d980e5548f14b4455981307cf6aa392cd259d2386788aa636216c4b39f91d715ba7ebdb674c2e1166522727ea0339834b5badc752627a7e74d2;
	E	= 1024'h000016ad1c9b2a8f40a2235152d54b1662e578f2542235740325649a504f3a206d8a237500c716b1163168604c117a0967cb51b06e8a06c53d727b4144651fe243cd18c110e20bb33d66443d5ecd390166496ceb5639328372e01238237c0c7f660c37134b6b58c03a87397b08d96cba1b787a450f4c05fa285501314f0118d3;
	N	= 1024'h00154424e24caec8527571745f1da82e25b3aa4dc32ded41ef068a9b5c66b5f4e7ae797b6417505e60f312c420f989726cae1ab5a20d5d413d4fcdf2b3df3fa060722812d635ad3a72aa003b957c85f63b39ae11dbee6116b36748f6866d0932017c218e7665b4cac76c5914ca477aca167c890e2cb4d4d9a8e179927d44ea71;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111ffffffff0123456798765432");
	if(R==1024'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111ffffffff0123456798765432)
		$display("Value get: %h CORRECT",R);
	else	$display("Value get: %h WRONG!",R);*/
/****************** TEST 8 ******************/
/*#10	M	= 1024'h49099483331a355f9e1e9446231f1f36d9a7cba76b83c06c6ec752dbf112342d5513e8285f4c7afb8b166e69a3e6f72991ce6a8d7247f163eb2d8419c00b1524a2990ba14983f23dc36c71530c337c55de75ca6dca538a64887552c28c4e5837d9a2e4391a4605efef28844e858f168269a3d58f9e2ff138eda6a3207c64632f;
	E	= 1024'h032ed7f38db0a3f026aa85f35c8835d8add52e62f631d5a99a6b6fe407c3711dc429cb5846b40fe560fd82b18a83bad21209382584e635ec21b38299d1651797246d69cbc0e23e674ce70a905109583a5b2ec87b0de762594c813f89c06d3ee2a19bfa0ffd78c26bb29d426f7647020434341b4735a2972b6aa653c662d710e7;
	N	= 1024'hc8883f0573e9a5f512fb65ed0adf2649b03237edf4faa6b259f89d7ed59d30d6fe052ef8dd68c9d672c9ac4ddb1edcf0102b8214dbd8478c7c87dfca0ad26cf5a9f73701e8525e059d1be2c568b42e39d0549bb772ed43135a39c79071b76e6604a05523be68ffa9b1c28f37f30bdb0bf78ddd85daff7054c9ab471bb483a065;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : C847D03E2E5FA8AE543E35E47143BC6D0C172889418E2161398171222CD9AEAC4C70F4E1E96425FE555FD492B8A5B45AE9A0AF6BA22DF257B6B354705819C9018C724032D54DA56821F945D8FAB1EADA5107494A4E72D5CE98FCCF03A8AF05331F2A7121A0A9201494D1CE896A104323FD475D3E33D570D6CC426EA7F2B0646F");
	if(R==1024'hC847D03E2E5FA8AE543E35E47143BC6D0C172889418E2161398171222CD9AEAC4C70F4E1E96425FE555FD492B8A5B45AE9A0AF6BA22DF257B6B354705819C9018C724032D54DA56821F945D8FAB1EADA5107494A4E72D5CE98FCCF03A8AF05331F2A7121A0A9201494D1CE896A104323FD475D3E33D570D6CC426EA7F2B0646F)
		$display("Value get: %h CORRECT",R);
	else	$display("Value get: %h WRONG!",R);*/
/****************** TEST 9 ******************/
#10	M	= 1024'hc847d03e2e5fa8ae543e35e47143bc6d0c172889418e2161398171222cd9aeac4c70f4e1e96425fe555fd492b8a5b45ae9a0af6ba22df257b6b354705819c9018c724032d54da56821f945d8fab1eada5107494a4e72d5ce98fccf03a8af05331f2a7121a0a9201494d1ce896a104323fd475d3e33d570d6cc426ea7f2b0646f;
	E	= 1024'ha9e9df5a55fe9eeccd16fd651c2d7f13a9942e7418052b4ae1b98f8ca3f3e828532a453289bd47b363738f866debf04222abeecac1e11f980b6f115f097f4540aa7735b993f17f55083caeb6a80f80d092c59d2f895f783fab56a353b58a8c4316eacf3012c77e6fbfdb4be7;
	N	= 1024'hc8883f0573e9a5f512fb65ed0adf2649b03237edf4faa6b259f89d7ed59d30d6fe052ef8dd68c9d672c9ac4ddb1edcf0102b8214dbd8478c7c87dfca0ad26cf5a9f73701e8525e059d1be2c568b42e39d0549bb772ed43135a39c79071b76e6604a05523be68ffa9b1c28f37f30bdb0bf78ddd85daff7054c9ab471bb483a065;
	iWrM	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	M = {M[63:0],M[1023:64]};
#10	M	= {M[63:0],M[1023:64]};
	iWrM	= 1'b0;
	iWrE	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	E = {E[63:0],E[1023:64]};
#10	E	= {E[63:0],E[1023:64]};
	iWrE	= 1'b0;
	iWrN	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	N = {N[63:0],N[1023:64]};
#10	N	= {N[63:0],N[1023:64]};
	iWrN	= 1'b0;
	iStart	= 1'b1;
#10	iStart	= 1'b0;
	while(!oDone)	#10;
#10	iRdR	= 1'b1;
	for(i=0;i<15;i=i+1)	#10	R = {oR,R[1023:64]};
#10	R	= {oR,R[1023:64]};
	iRdR	= 1'b0;
	$display("Expected : 49099483331A355F9E1E9446231F1F36D9A7CBA76B83C06C6EC752DBF112342D5513E8285F4C7AFB8B166E69A3E6F72991CE6A8D7247F163EB2D8419C00B1524A2990BA14983F23DC36C71530C337C55DE75CA6DCA538A64887552C28C4E5837D9A2E4391A4605EFEF28844E858F168269A3D58F9E2FF138EDA6A3207C64632F");
	if(R==1024'h49099483331A355F9E1E9446231F1F36D9A7CBA76B83C06C6EC752DBF112342D5513E8285F4C7AFB8B166E69A3E6F72991CE6A8D7247F163EB2D8419C00B1524A2990BA14983F23DC36C71530C337C55DE75CA6DCA538A64887552C28C4E5837D9A2E4391A4605EFEF28844E858F168269A3D58F9E2FF138EDA6A3207C64632F)
		$display("Value get: %h CORRECT",R);
	else	$display("Value get: %h WRONG!",R);
end

endmodule

