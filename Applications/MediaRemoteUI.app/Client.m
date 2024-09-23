@implementation Client

- (void)connectForBannerPresentation:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  _TtC13MediaRemoteUI6Client *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10001BCF8(v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)revokeAllBannersWithReply:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13MediaRemoteUI6Client *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_100045EE8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = static os_log_type_t.default.getter(v6);
  if (qword_1000589C0 != -1)
    swift_once(&qword_1000589C0, sub_10001E320);
  os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_10005B240, "[MainServer] revokeAllBanners", 29, 2, _swiftEmptyArrayStorage);
  sub_10002BF24(0x757165722044524DLL, 0xEB00000000747365, (uint64_t)sub_10001C80C, v5);

  swift_release(v5);
}

- (void)revokeBannerWithIdentifier:(id)a3 withReply:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _TtC13MediaRemoteUI6Client *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_100045EC0, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_100019D4C(v7, v9, (uint64_t)sub_10001C804, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (int64_t)hash
{
  _TtC13MediaRemoteUI6Client *v2;
  int64_t v3;

  v2 = self;
  v3 = UUID.hashValue.getter();

  return v3;
}

- (_TtC13MediaRemoteUI6Client)init
{
  _TtC13MediaRemoteUI6Client *result;

  result = (_TtC13MediaRemoteUI6Client *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.Client", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI6Client_identifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
