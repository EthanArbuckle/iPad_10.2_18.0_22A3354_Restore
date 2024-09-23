@implementation CycleChartsHeaderView

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)init
{
  return (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView *)sub_231A295BC();
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231A2A99C();
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithFrame:(CGRect)a3
{
  sub_2319C529C();
}

- (void).cxx_destruct
{
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_activeCycle, (uint64_t (*)(_QWORD))sub_231971C50);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_daysCountView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_dateIntervalLabel));
}

@end
