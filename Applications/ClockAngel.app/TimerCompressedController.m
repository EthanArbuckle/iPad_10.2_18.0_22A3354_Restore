@implementation TimerCompressedController

- (_TtC10ClockAngel25TimerCompressedController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel25TimerCompressedController *)sub_10002BE18(a3);
}

- (_TtC10ClockAngel25TimerCompressedController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10ClockAngel25TimerCompressedController *)sub_10002BFC4(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10ClockAngel25TimerCompressedController *v4;

  v4 = self;
  sub_10002C874(a3);

}

- (_TtC10ClockAngel25TimerCompressedController)init
{
  _TtC10ClockAngel25TimerCompressedController *result;

  result = (_TtC10ClockAngel25TimerCompressedController *)_swift_stdlib_reportUnimplementedInitializer("ClockAngel.TimerCompressedController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel25TimerCompressedController_observerId]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel25TimerCompressedController_compressedCountdownAnimation));
  swift_bridgeObjectRelease(*(_QWORD *)&self->observerId[OBJC_IVAR____TtC10ClockAngel25TimerCompressedController_sessionId]);
}

@end
