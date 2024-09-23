@implementation AnalogClockFaceAlarmComplicationView

- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label) = 0;

  result = (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label) = 0;
  v4 = a3;

  result = (_TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  return -[AnalogClockFaceAlarmComplicationView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  v4 = a3;
  v5 = v6.receiver;
  -[AnalogClockFaceAlarmComplicationView setTintColor:](&v6, sel_setTintColor_, v4);
  sub_237ED8D94();

}

- (void)layoutSubviews
{
  _TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *v2;

  v2 = self;
  sub_237ED8FD8();

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[AnalogClockFaceAlarmComplicationView sizeThatFits:](self, sel_sizeThatFits_, 9.22337204e18, 9.22337204e18);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11ClockPoster36AnalogClockFaceAlarmComplicationView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_237ED91C8(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label));
}

@end
