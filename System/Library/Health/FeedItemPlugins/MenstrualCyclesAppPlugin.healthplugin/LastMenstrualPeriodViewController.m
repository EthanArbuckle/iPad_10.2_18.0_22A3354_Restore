@implementation LastMenstrualPeriodViewController

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)init
{
  return -[LastMenstrualPeriodViewController initWithNibName:bundle:](self, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *)sub_231AAF8AC(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *)sub_231AAF9F4(a3);
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *v2;

  v2 = self;
  sub_231AAFAE0();

}

- (void)dismiss:(id)a3
{
  sub_231AB02B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_231AB0434);
}

- (void)logMenstrualCycle:(id)a3
{
  sub_231AB02B4(self, (uint64_t)a2, (uint64_t)a3, sub_231AB05E4);
}

- (void)confirmMenstrualCycle:(id)a3
{
  sub_231AB02B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_231AB06AC);
}

- (void).cxx_destruct
{
  sub_231AB0E9C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_eventHandler);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_dateRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_cycleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_detailsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_confirmCycleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_logLastCycleButton));
}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231AB0C14();

}

@end
