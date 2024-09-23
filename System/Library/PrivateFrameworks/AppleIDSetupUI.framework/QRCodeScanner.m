@implementation QRCodeScanner

- (_TtC14AppleIDSetupUI13QRCodeScanner)init
{
  return (_TtC14AppleIDSetupUI13QRCodeScanner *)sub_2366D51FC();
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  unint64_t v8;
  id v9;
  id v10;
  _TtC14AppleIDSetupUI13QRCodeScanner *v11;

  sub_2366CCE80(0, &qword_2564273F8);
  v8 = sub_2367373C0();
  v9 = a3;
  v10 = a5;
  v11 = self;
  sub_2366D6514(v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner__string;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256427420);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner___isRunning;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256426270);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC14AppleIDSetupUI13QRCodeScanner___captureDevice;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256427410);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

}

@end
