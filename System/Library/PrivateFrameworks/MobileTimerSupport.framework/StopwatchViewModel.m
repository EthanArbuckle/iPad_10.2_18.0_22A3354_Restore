@implementation StopwatchViewModel

- (_TtC18MobileTimerSupport18StopwatchViewModel)initWithStopwatch:(id)a3 manager:(id)a4 delegate:(id)a5 dateProvider:(id)a6 registerForNotifications:(BOOL)a7 broadcastUpdates:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v14;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC18MobileTimerSupport18StopwatchViewModel *)StopwatchViewModel.init(stopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:)(a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v9, v8);
}

- (void)dealloc
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;
  objc_super v3;

  v2 = self;
  StopwatchViewModel.unregisterNotifications()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for StopwatchViewModel();
  -[StopwatchViewModel dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_internalStopwatch));
  swift_unknownObjectRelease();
  sub_1B8DA7528((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_delegate);
  swift_release();

  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_updatedCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_lapAddedCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_clearAllLapsCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_startLapTimerCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_pauseLapTimerCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_lapLapTimerCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_resetLapTimerCancellable, &qword_1ED36F568);
  sub_1B8D9D154((uint64_t)self + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_resumeLapTimerCancellable, &qword_1ED36F568);
}

- (void)updateStopwatch:(id)a3
{
  id v4;
  _TtC18MobileTimerSupport18StopwatchViewModel *v5;

  v4 = a3;
  v5 = self;
  sub_1B8DA0AFC(v4);

}

- (void)addLap:(double)a3
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v4;

  v4 = self;
  sub_1B8DA0D04(1, a3);

}

- (void)clearAllLaps
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA136C();

}

- (void)updateWithDisplayLink
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA1718();

}

- (void)invalidateDisplayLink
{
  uint64_t v3;
  void *v4;
  _TtC18MobileTimerSupport18StopwatchViewModel *v5;
  id v6;

  v3 = OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_displayLink;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_displayLink);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6 = *(Class *)((char *)&self->super.isa + v3);
  *(Class *)((char *)&self->super.isa + v3) = 0;

}

- (void)updateTime
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA18D8();

}

- (void)startLapTimer
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA1F8C();

}

- (void)pauseLapTimer
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA26FC();

}

- (void)lapLapTimer
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA32E8();

}

- (void)resetLapTimer
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA3BD0();

}

- (void)resumeLapTimer
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;

  v2 = self;
  sub_1B8DA412C();

}

- (id)getStopwatch
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;
  void *v3;

  v2 = self;
  v3 = sub_1B8DA4798();

  return v3;
}

- (double)runningTotalForLap:(int64_t)a3
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v4;
  double v5;
  double v6;

  v4 = self;
  sub_1B8DA49F0(a3);
  v6 = v5;

  return v6;
}

- (_TtC18MobileTimerSupport18StopwatchViewModel)init
{
  _TtC18MobileTimerSupport18StopwatchViewModel *result;

  result = (_TtC18MobileTimerSupport18StopwatchViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)sourceIdentifier
{
  _TtC18MobileTimerSupport18StopwatchViewModel *v2;
  void *v3;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC18MobileTimerSupport18StopwatchViewModel_broadcastUpdates) != 1)
    return 0;
  v2 = self;
  sub_1B8DFDE2C();
  sub_1B8DFE0B4();

  v3 = (void *)sub_1B8DFDB5C();
  swift_bridgeObjectRelease();
  return v3;
}

@end
