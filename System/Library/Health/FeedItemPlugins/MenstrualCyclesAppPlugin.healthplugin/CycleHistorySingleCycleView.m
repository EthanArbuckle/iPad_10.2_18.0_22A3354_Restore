@implementation CycleHistorySingleCycleView

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)init
{
  return (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *)sub_231A3D1E0();
}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231A3F374();
}

- (void)respondToContentSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *v2;

  v2 = self;
  sub_231A3DAFC();

}

- (void)respondToHorizontalSizeChanges
{
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *v2;

  v2 = self;
  sub_231A3E504();

}

- (void)viewModelProviderDidUpdate:(id)a3
{
  void *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleView);
  v5 = a3;
  v6 = self;
  v7 = v4;
  sub_231BCB588();

}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithFrame:(CGRect)a3
{
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *result;

  result = (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_daysLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_factorsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_periodLengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleViewModelProvider));
  sub_231A3F294((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_currentViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_disclosureIndicator));
}

@end
