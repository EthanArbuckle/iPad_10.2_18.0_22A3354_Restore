@implementation CycleChartLeadingAxisView

- (_TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView_role) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView *v2;

  v2 = self;
  sub_231C32BFC();

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231C32F20(x, y, width, height);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView_overhang));
}

@end
