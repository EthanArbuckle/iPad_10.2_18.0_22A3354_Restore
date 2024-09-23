@implementation CycleChartSectionView

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin21CycleChartSectionView *v2;
  void *v3;

  v2 = self;
  sub_231960720();

  v3 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView *)sub_2319607E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231961C70();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC24MenstrualCyclesAppPlugin21CycleChartSectionView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231960A08(x, y, width, height);

}

- (void).cxx_destruct
{
  sub_23194B094((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartSectionView_cycle);
  swift_release();
}

@end
