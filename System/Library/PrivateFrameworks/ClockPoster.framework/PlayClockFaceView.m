@implementation PlayClockFaceView

- (_TtC11ClockPoster17PlayClockFaceView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster17PlayClockFaceView *)sub_237EE0C84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster17PlayClockFaceView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC11ClockPoster17PlayClockFaceView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView) = 0;
  v4 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_237EE1008();

  result = (_TtC11ClockPoster17PlayClockFaceView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11ClockPoster17PlayClockFaceView *v2;

  v2 = self;
  sub_237EE0ECC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView));

}

@end
