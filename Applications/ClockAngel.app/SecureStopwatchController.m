@implementation SecureStopwatchController

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _TtC10ClockAngel25SecureStopwatchController *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_10000A58C(&qword_1000AF7C8);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject(&unk_10009EAD0, 40, 7);
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  v9 = sub_100011B70((uint64_t)v5, (uint64_t)&unk_1000AF7D8, (uint64_t)v7);
  swift_release(v9);
  sub_100011484((uint64_t)v5, &qword_1000AF7C8);

}

- (_TtC10ClockAngel25SecureStopwatchController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel25SecureStopwatchController *)sub_100011DDC(a3);
}

- (_TtC10ClockAngel25SecureStopwatchController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10ClockAngel25SecureStopwatchController *)sub_100011FD8(v5, v7, a4);
}

- (void)playPausedAction
{
  _TtC10ClockAngel25SecureStopwatchController *v2;

  v2 = self;
  sub_100012248();

}

- (void)lapCancelAction
{
  _TtC10ClockAngel25SecureStopwatchController *v2;

  v2 = self;
  sub_100012530();

}

- (_TtC10ClockAngel25SecureStopwatchController)init
{
  _TtC10ClockAngel25SecureStopwatchController *result;

  result = (_TtC10ClockAngel25SecureStopwatchController *)_swift_stdlib_reportUnimplementedInitializer("ClockAngel.SecureStopwatchController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->stopwatchId[OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_stopwatchId]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_stopwatchManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_stopwatch));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_observableModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_spinnyResetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_pausePlayPackage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_lapCancelButton));
}

- (void)didUpdateCurrentInterval:(double)a3 adjustedCurrentInterval:(double)a4 totalInterval:(double)a5 adjustedTotalInterval:(double)a6 isStopwatchRunning:(BOOL)a7 isStopwatchStopped:(BOOL)a8
{
  _TtC10ClockAngel25SecureStopwatchController *v11;

  v11 = self;
  sub_100015088(a8, a3, a5);

}

- (void)didClearAllLaps
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_observableModel);
  KeyPath = swift_getKeyPath(&unk_100081698, a2);
  v5 = swift_getKeyPath(&unk_1000816C0, v4);
  v6 = 0;
  swift_retain(v2);
  static Published.subscript.setter(&v6, v2, KeyPath, v5);
}

- (void)didStartLapTimer
{
  uint64_t v2;
  _TtC10ClockAngel25SecureStopwatchController *v3;

  v3 = self;
  sub_100014164((uint64_t)v3, v2);

}

- (void)didPauseLapTimer
{
  uint64_t v2;
  _TtC10ClockAngel25SecureStopwatchController *v3;

  v3 = self;
  sub_10001426C((uint64_t)v3, v2);

}

- (void)didLapLapTimer
{
  _TtC10ClockAngel25SecureStopwatchController *v2;

  v2 = self;
  sub_100014440();

}

- (void)didResetLapTimer
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC10ClockAngel25SecureStopwatchController_observableModel);
  KeyPath = swift_getKeyPath(&unk_100081650, a2);
  v5 = swift_getKeyPath(&unk_100081678, v4);
  v6 = 0;
  swift_retain(v2);
  static Published.subscript.setter(&v6, v2, KeyPath, v5);
}

- (void)didResumeLapTimer
{
  _TtC10ClockAngel25SecureStopwatchController *v2;

  v2 = self;
  sub_100014650();

}

@end
