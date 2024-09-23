@implementation StopwatchLockscreenController

- (id)_childViewControllersForAlwaysOnTimelines
{
  uint64_t v3;
  id result;
  void *v5;
  id v6;
  Class isa;
  id v8;

  v3 = sub_10000A58C((uint64_t *)&unk_1000B2750);
  result = (id)swift_allocObject(v3, 40, 7);
  *((_OWORD *)result + 1) = xmmword_100084610;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView);
  if (v5)
  {
    *((_QWORD *)result + 4) = v5;
    v8 = result;
    specialized Array._endMutation()();
    v6 = v5;
    sub_10000A58C((uint64_t *)&unk_1000B2770);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC10ClockAngel29StopwatchLockscreenController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StopwatchLockscreenController();
  return -[SecureStopwatchController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC10ClockAngel29StopwatchLockscreenController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC10ClockAngel29StopwatchLockscreenController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for StopwatchLockscreenController();
  v11 = -[SecureStopwatchController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel29StopwatchLockscreenController_customTrailingView));
}

@end
