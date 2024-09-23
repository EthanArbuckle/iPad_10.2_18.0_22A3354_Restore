@implementation SettingsCarManager

- (_TtC12AutoSettings18SettingsCarManager)init
{
  _TtC12AutoSettings18SettingsCarManager *result;

  sub_10000D090();
  return result;
}

- (void)dismissSettingsModal
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
  if (v2)
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC12AutoSettings18SettingsCarManager *v5;

  v4 = a3;
  v5 = self;
  sub_10000F284(v4);

}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC12AutoSettings18SettingsCarManager *v6;

  v5 = a3;
  v6 = self;
  sub_1000111A0(v5);

}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC12AutoSettings18SettingsCarManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100010E3C(a4);

}

- (void)carManager:(id)a3 didRemove:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC12AutoSettings18SettingsCarManager *v10;

  v7 = sub_100005904(0, &qword_100028680, CAFCar_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100011314(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC12AutoSettings18SettingsCarManager *v7;

  v6 = a3;
  v7 = self;
  sub_10000F5E8(v6, a4);

}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _TtC12AutoSettings18SettingsCarManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000113E8();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_assetManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_subscribers));

  v3 = (char *)self + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cafCarManager[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier]);
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = sub_100005888((uint64_t *)&unk_100027E70);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
