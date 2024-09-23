@implementation CycleChartLeadingAxisHeaderFooterView

- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *)sub_231938044(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  _TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView_header;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView_footer;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231938290(x, y, width, height);

}

@end
