@implementation AnalogClockDialView

- (_TtC11ClockPoster19AnalogClockDialView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster19AnalogClockDialView *)sub_237E53914(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster19AnalogClockDialView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_237E55D90();
}

- (void)layoutSubviews
{
  _TtC11ClockPoster19AnalogClockDialView *v2;

  v2 = self;
  sub_237E54148();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_majorTickLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_minorTickMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_minorTickBackgroundLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
