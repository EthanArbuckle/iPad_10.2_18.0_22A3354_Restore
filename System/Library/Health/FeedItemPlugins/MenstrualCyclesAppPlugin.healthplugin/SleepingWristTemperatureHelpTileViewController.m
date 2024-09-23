@implementation SleepingWristTemperatureHelpTileViewController

- (void)loadView
{
  _TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_231B05294();
  -[SleepingWristTemperatureHelpTileViewController setView:](v2, sel_setView_, v3);

}

- (void)viewDidLoad
{
  _BYTE *v2;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SleepingWristTemperatureHelpTileViewController();
  v2 = v4.receiver;
  -[SleepingWristTemperatureHelpTileViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_didSubmitAnalyticsEventForView;
  if ((v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_didSubmitAnalyticsEventForView] & 1) == 0)
  {
    sub_231B058A8(0);
    v2[v3] = 1;
  }

}

- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController *)sub_231B05E30(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController *)sub_231B05F8C(a3);
}

- (void).cxx_destruct
{
  sub_231987C50((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_context);
  sub_231B06398((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController____lazy_storage___sleepStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController____lazy_storage___tileView));
}

@end
