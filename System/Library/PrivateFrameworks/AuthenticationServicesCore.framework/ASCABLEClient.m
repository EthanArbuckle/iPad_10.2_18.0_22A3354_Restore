@implementation ASCABLEClient

- (NSURL)qrCodeURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v8;
  void *v9;
  _OWORD v11[2];
  _OWORD v12[2];

  v3 = sub_20E6E9BC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_OWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 8];
  v11[0] = *(_OWORD *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct);
  v11[1] = v7;
  v12[0] = *(_OWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 24];
  *(_DWORD *)((char *)v12 + 15) = *(_DWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct
                                                               + 39];
  v8 = self;
  sub_20E68A454((uint64_t)v6);

  v9 = (void *)sub_20E6E9B60();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v9;
}

- (_TtC26AuthenticationServicesCore13ASCABLEClient)initWithDelegate:(id)a3 isRegistrationRequest:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  swift_unknownObjectRetain();
  return (_TtC26AuthenticationServicesCore13ASCABLEClient *)ASCABLEClient.init(delegate:isRegistrationRequest:)((char *)a3, v4);
}

- (void)performAuthenticationOperation:(int64_t)a3 forRelyingPartyIdentifier:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v12;

  v7 = _Block_copy(a5);
  v8 = sub_20E6EA1CC();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_20E67D3A0(a3, v8, v10, (uint64_t)sub_20E67BB78, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)cancelIfNecessary
{
  _TtC26AuthenticationServicesCore13ASCABLEClient *v2;

  v2 = self;
  sub_20E681C44();

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v5;

  v4 = a3;
  v5 = self;
  sub_20E67DC98(v4);

}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  id v6;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_20E682114(a4);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC26AuthenticationServicesCore13ASCABLEClient *v14;

  v10 = sub_20E6EA154();
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_20E682318((uint64_t)v12, v10);

  swift_bridgeObjectRelease();
}

- (_TtC26AuthenticationServicesCore13ASCABLEClient)init
{
  _TtC26AuthenticationServicesCore13ASCABLEClient *result;

  result = (_TtC26AuthenticationServicesCore13ASCABLEClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 8];
  v4 = *(_QWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct + 16];
  sub_20E6673F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct), *(_QWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_qrCodeStruct]);
  sub_20E6673F4(v3, v4);
  sub_20E683BAC((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_bluetoothManager));
  swift_release();
  swift_bridgeObjectRelease();
  sub_20E66AA28(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_clientDataJSON), *(_QWORD *)&self->qrCodeStruct[OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_clientDataJSON]);

  sub_20E67BD44((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_authenticatorAdvertisement, &qword_254A2E330);
  sub_20E67BADC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_completionHandler));

  sub_20E67BD44((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore13ASCABLEClient_testDelegate, &qword_254A2E350);
}

@end
