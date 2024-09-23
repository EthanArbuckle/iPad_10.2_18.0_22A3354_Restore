@implementation InternalSettingsFeatureStateListViewController

- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *)InternalSettingsFeatureStateListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *result;

  result = (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *v2;

  v2 = self;
  InternalSettingsFeatureStateListViewController.viewDidLoad()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController_host));
}

@end
