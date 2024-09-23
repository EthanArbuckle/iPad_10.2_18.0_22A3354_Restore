@implementation SessionSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ClockAngel20SessionSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10001DC58(v8, v9);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ClockAngel20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001DE44();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC10ClockAngel20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001B7B0(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC10ClockAngel20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001E5B4(25, 0xD000000000000017, (void *)0x8000000100085C40);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC10ClockAngel20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001E5B4(28, 0xD00000000000001ALL, (void *)0x8000000100085C20);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC10ClockAngel20SessionSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10001E5B4(27, 0xD000000000000019, (void *)0x8000000100085C00);

}

- (void)dealloc
{
  void *v3;
  _TtC10ClockAngel20SessionSceneDelegate *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  NSString v10;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)objc_opt_self(MTSessionUtilities);
  v4 = self;
  v5 = -[SessionSceneDelegate description](v4, "description");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  v12 = v6;
  v13 = v8;
  v9._countAndFlagsBits = 0x74696E696564203ALL;
  v9._object = (void *)0xE800000000000000;
  String.append(_:)(v9);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v3, "logInfo:", v10);

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SessionSceneDelegate(0);
  -[SessionSceneDelegate dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_observerId]);
  sub_100011484((uint64_t)self + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_timerAttributes, &qword_1000AFBB0);
  sub_100011484((uint64_t)self + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_alarmAttributes, &qword_1000AFBB8);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_stopwatchAttributes));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_currentSessionScene));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_timerApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_alarmApertureElementProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_stopwatchApertureElementProvider));

  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel20SessionSceneDelegate_dataStoerObserverId]);
}

- (_TtC10ClockAngel20SessionSceneDelegate)init
{
  return (_TtC10ClockAngel20SessionSceneDelegate *)sub_10001BE64();
}

@end
