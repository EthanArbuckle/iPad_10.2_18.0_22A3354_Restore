@implementation FeatureOnboardingTileViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI35FeatureOnboardingTileViewController *v2;

  v2 = self;
  sub_1A985C2AC();

}

- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController *)FeatureOnboardingTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI35FeatureOnboardingTileViewController *)FeatureOnboardingTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1A970AD84((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController_headerImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___headerImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___headerTitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___bulletStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35FeatureOnboardingTileViewController____lazy_storage___buttonStack));
  swift_bridgeObjectRelease();
}

@end
