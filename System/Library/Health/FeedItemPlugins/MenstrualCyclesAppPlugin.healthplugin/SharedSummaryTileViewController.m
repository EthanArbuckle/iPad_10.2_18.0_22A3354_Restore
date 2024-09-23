@implementation SharedSummaryTileViewController

- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController *)sub_23199B810(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23199E134();
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController *v2;

  v2 = self;
  sub_23199BB80();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23199E248();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_valueLabel));
  sub_231996A70((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_projectionViewModel, qword_254192800, (void (*)(uint64_t))type metadata accessor for SharedProjectionHighlightTileViewModelContextData);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___dayDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___monthDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___yearDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___longMonthDayDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController____lazy_storage___monthDayYearDateFormatter));
  sub_231987C50((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController_context);
}

- (NSString)title
{
  _TtC24MenstrualCyclesAppPlugin31SharedSummaryTileViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_23199DD88();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
