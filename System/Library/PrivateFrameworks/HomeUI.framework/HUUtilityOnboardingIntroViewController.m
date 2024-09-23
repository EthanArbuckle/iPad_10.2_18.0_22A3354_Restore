@implementation HUUtilityOnboardingIntroViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingIntroViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingIntroViewController)initWithContext:(id)a3 foundUtilities:(id)a4 nearbyUtilities:(id)a5
{
  uint64_t v5;
  unint64_t v7;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    v7 = 0;
    if (!a5)
      return (HUUtilityOnboardingIntroViewController *)UtilityOnboardingIntroViewController.init(context:foundUtilities:nearbyUtilities:)(a3, v7, v5);
    goto LABEL_3;
  }
  v7 = sub_1B93EDD00();
  if (v5)
LABEL_3:
    v5 = sub_1B93EDF4C();
  return (HUUtilityOnboardingIntroViewController *)UtilityOnboardingIntroViewController.init(context:foundUtilities:nearbyUtilities:)(a3, v7, v5);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingIntroViewController *v2;

  v2 = self;
  sub_1B8F2E6F4();

}

- (void)continueButtonTapped:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8F2EB8C);
}

- (void)cancelButtonTapped:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8F2F1D4);
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  HUUtilityOnboardingIntroViewController *result;

  result = (HUUtilityOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  HUUtilityOnboardingIntroViewController *result;

  v6 = a5;
  result = (HUUtilityOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingIntroViewController_onboardingContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingIntroViewController_continueButton));
}

@end
