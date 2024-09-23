@implementation AnalogClockFaceView

- (_TtC11ClockPoster19AnalogClockFaceView)initWithFrame:(CGRect)a3
{
  return (_TtC11ClockPoster19AnalogClockFaceView *)sub_237EAEC94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster19AnalogClockFaceView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_237EB06D8();
}

- (void)layoutSubviews
{
  _TtC11ClockPoster19AnalogClockFaceView *v2;

  v2 = self;
  sub_237EAEE00();

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  return -[AnalogClockFaceView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  v4 = a3;
  v5 = v6.receiver;
  -[AnalogClockFaceView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_237EAF9EC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView));
  swift_release();
}

@end
