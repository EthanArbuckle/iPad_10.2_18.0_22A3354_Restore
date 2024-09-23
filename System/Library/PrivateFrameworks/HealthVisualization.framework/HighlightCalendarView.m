@implementation HighlightCalendarView

- (_TtC19HealthVisualization21HighlightCalendarView)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  _TtC19HealthVisualization21HighlightCalendarView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_longWeekdayStrings) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_shortWeekdayStrings) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView____lazy_storage___ringsRenderer) = 0;
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_weekdayLabels) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_monthLabels) = v4;
  v5 = a3;

  result = (_TtC19HealthVisualization21HighlightCalendarView *)sub_1BCAB65C4();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization21HighlightCalendarView)initWithFrame:(CGRect)a3
{
  _TtC19HealthVisualization21HighlightCalendarView *result;

  result = (_TtC19HealthVisualization21HighlightCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization21HighlightCalendarView)initWithArrangedSubviewRows:(id)a3
{
  _TtC19HealthVisualization21HighlightCalendarView *result;

  result = (_TtC19HealthVisualization21HighlightCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView____lazy_storage___ringsRenderer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSArray)accessibilityWeekdayLabels
{
  void *v2;

  sub_1BC9A649C(0, &qword_1ED6C5B28);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BCAB600C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)accessibilityMonthLabels
{
  void *v2;

  swift_beginAccess();
  sub_1BC9A649C(0, &qword_1ED6C5B28);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BCAB600C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end
