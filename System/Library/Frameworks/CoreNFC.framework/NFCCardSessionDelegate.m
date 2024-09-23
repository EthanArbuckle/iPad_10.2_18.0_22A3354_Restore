@implementation NFCCardSessionDelegate

- (void)fieldChanged:(BOOL)a3
{
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v4;

  v4 = self;
  sub_215BED7A4(a3);

}

- (void)didReceiveAPDU:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[3];
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = sub_215BFABCC();
  v13 = v12;

  v14[1] = v11;
  v14[2] = v13 | 0x1000000000000000;
  v15 = 0;
  sub_215BE7B48(v11, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_215BE7BD4(v11, v13);

}

- (void)didConnectToReader
{
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v2;

  v2 = self;
  sub_215BED90C();

}

- (void)didDisconnectFromReader
{
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v2;

  v2 = self;
  sub_215BEDB5C();

}

- (void)didDetectField:(BOOL)a3
{
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v4;

  v4 = self;
  sub_215BEDDB4(a3);

}

- (void)didStartSession:(id)a3
{
  id v4;
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v5;

  v5 = self;
  v4 = a3;
  sub_215BEE088(a3);

}

- (void)didInvalidate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v7;
  __int128 v8;
  char v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = xmmword_215BFD520;
  v9 = 0;
  v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  sub_215BFACE0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_215BFACEC();

}

- (void)didTerminate:(id)a3
{
  id v4;
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_215BEE35C(v4);

}

- (void)hwStateDidChange:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *v9;
  __int128 v10;
  char v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC248);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 != 2)
  {
    v10 = xmmword_215BFD520;
    v11 = 0;
    v9 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
    sub_215BFACE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_215BFACEC();

  }
}

- (_TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate)init
{
  _TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *result;

  result = (_TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtC7CoreNFCP33_EFB2E886CAEE49EE896FB2304411A55622NFCCardSessionDelegate_eventStreamContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DFC240);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
