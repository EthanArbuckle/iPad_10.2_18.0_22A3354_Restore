@implementation OnboardingStackedItemViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI35OnboardingStackedItemViewController *v2;

  v2 = self;
  sub_1A976D700();

}

- (void)nextButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI35OnboardingStackedItemViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A976E2F0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)widthDesignationDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC18HealthExperienceUI35OnboardingStackedItemViewController *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1A976ED38();
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35OnboardingStackedItemViewController_contentViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35OnboardingStackedItemViewController_titleToItemsTopConstraint));
  swift_bridgeObjectRelease();
}

@end
