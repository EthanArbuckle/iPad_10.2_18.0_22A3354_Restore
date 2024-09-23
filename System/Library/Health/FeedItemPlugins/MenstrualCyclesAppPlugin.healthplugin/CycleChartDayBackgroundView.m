@implementation CycleChartDayBackgroundView

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView *v2;
  void *v3;

  v2 = self;
  sub_231C70F68();

  v3 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView *result;

  result = (_TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231C71210(x, y, width, height);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_231961BF0((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle);
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_dayIndex;
  v4 = sub_231CA1A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
