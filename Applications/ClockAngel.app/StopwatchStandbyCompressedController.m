@implementation StopwatchStandbyCompressedController

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  _TtC10ClockAngel36StopwatchStandbyCompressedController *v14;

  v14 = self;
  sub_1000453FC(a7, a8, a3, a4, a5, a6);

}

- (void)didPauseLapTimer
{
  _TtC10ClockAngel36StopwatchStandbyCompressedController *v2;

  v2 = self;
  sub_1000455C8();

}

- (void)didResumeLapTimer
{
  _TtC10ClockAngel36StopwatchStandbyCompressedController *v2;

  v2 = self;
  sub_100045684();

}

- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel36StopwatchStandbyCompressedController *)sub_100045810(a3);
}

- (_TtC10ClockAngel36StopwatchStandbyCompressedController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC10ClockAngel36StopwatchStandbyCompressedController *)sub_100045A5C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100045924);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel36StopwatchStandbyCompressedController_minimalAnimation));
}

@end
