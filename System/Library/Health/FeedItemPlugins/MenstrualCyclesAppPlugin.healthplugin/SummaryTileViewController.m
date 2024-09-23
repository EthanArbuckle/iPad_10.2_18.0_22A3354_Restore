@implementation SummaryTileViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *v2;

  v2 = self;
  sub_231C54478();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SummaryTileViewController();
  v2 = v3.receiver;
  -[SummaryTileViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_231C5621C();

}

- (void)respondToTraitCollectionChanges
{
  _TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *v2;

  v2 = self;
  sub_231C5593C();

}

- (void)userPreferredUnitChanged
{
  _TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *v2;

  v2 = self;
  sub_231C56E2C();

}

- (void)significantTimeChangeDidOccur
{
  _TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *v2;

  v2 = self;
  sub_231C56E7C();

}

- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *)sub_231C574AC(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *)sub_231C57674(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_supplementaryValueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_valueLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_supplementaryLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pillViewHiddenConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_relativeLabelHiddenConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_pregnancyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_daySummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_calendarCache));
  sub_23191BD58((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SummaryTileViewController_context, (uint64_t (*)(_QWORD))sub_231C58508);
  swift_release();
}

- (NSString)title
{
  _TtC24MenstrualCyclesAppPlugin25SummaryTileViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_231C57AA8();
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
