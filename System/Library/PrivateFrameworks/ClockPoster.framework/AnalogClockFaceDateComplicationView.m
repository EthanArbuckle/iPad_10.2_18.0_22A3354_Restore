@implementation AnalogClockFaceDateComplicationView

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3 options:(unint64_t)a4
{
  return (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)sub_237EDAB30(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster35AnalogClockFaceDateComplicationView *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider) = 0;
  v4 = a3;

  result = (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  return -[AnalogClockFaceDateComplicationView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  v4 = a3;
  v5 = v6.receiver;
  -[AnalogClockFaceDateComplicationView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_237EDB3D8();

}

- (_TtC11ClockPoster35AnalogClockFaceDateComplicationView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster35AnalogClockFaceDateComplicationView *result;

  result = (_TtC11ClockPoster35AnalogClockFaceDateComplicationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider));
}

@end
