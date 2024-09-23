@implementation TouchController

- (_TtC17ContinuityDisplay15TouchController)init
{
  sub_100039814();
}

- (void).cxx_destruct
{
  sub_1000189E4((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay15TouchController_delegate, (uint64_t)a2);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17ContinuityDisplay15TouchController_timeSyncClock));
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay15TouchController_pencilInteraction);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay15TouchController_pan);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay15TouchController_pinch);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay15TouchController_rotate);
  sub_100018C6C(OBJC_IVAR____TtC17ContinuityDisplay15TouchController_view);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC17ContinuityDisplay15TouchController_multitouchReport));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC17ContinuityDisplay15TouchController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100039920((uint64_t)v8, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end
