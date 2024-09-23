@implementation InteractiveTimelineDateIndicator

- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231C2DB00();
}

- (void)significantTimeChange
{
  _TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator *v2;

  v2 = self;
  sub_231C2D280();

}

- (void)respondToTraitChanges
{
  _TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator *v2;

  v2 = self;
  sub_231C2C91C();
  sub_231C2CCFC();
  sub_231C2C9F0();

}

- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3
{
  _TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator *result;

  result = (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_dateLabel));
  sub_2319220C0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_cachedStartOfCurrentYear);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_previousYearsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_currentYearFormatter));
  sub_231A65778((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_cycleDay);
}

@end
