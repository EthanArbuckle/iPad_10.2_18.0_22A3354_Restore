@implementation InteractiveTimelineDateIndicator

- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2318905C4();
}

- (void)significantTimeChange
{
  _TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator *v2;

  v2 = self;
  sub_23188FD0C();

}

- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3
{
  _TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator *result;

  result = (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator____lazy_storage___dateLabel));
  sub_2318549C8((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_cachedStartOfCurrentYear);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_previousYearsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_currentYearFormatter));
  sub_23188B928((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_timelineDay);
}

@end
