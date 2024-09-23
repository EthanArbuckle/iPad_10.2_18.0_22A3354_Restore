@implementation CycleChartDayView

- (NSString)description
{
  _TtC24MenstrualCyclesAppPlugin17CycleChartDayView *v2;
  void *v3;

  v2 = self;
  sub_231C982F8();

  v3 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin17CycleChartDayView)initWithCoder:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin17CycleChartDayView *result;

  result = (_TtC24MenstrualCyclesAppPlugin17CycleChartDayView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin17CycleChartDayView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_231C983FC(x, y, width, height);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle, type metadata accessor for CycleChartCycle);
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex;
  v4 = sub_231CA1A58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_day, (uint64_t (*)(_QWORD))type metadata accessor for CycleChartDay);
  swift_release();
}

@end
