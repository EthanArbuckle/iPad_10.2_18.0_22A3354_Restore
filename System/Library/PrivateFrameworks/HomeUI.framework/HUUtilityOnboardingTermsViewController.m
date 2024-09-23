@implementation HUUtilityOnboardingTermsViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingTermsViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingTermsViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingTermsViewController *)UtilityOnboardingTermsViewController.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingTermsViewController *v2;

  v2 = self;
  sub_1B90055B8();

}

- (void)cancelOnboardingWithSender:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B9005E10);
}

- (void)didAcceptConsentWithSender:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B90062A8);
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingTermsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7;
  id v8;
  HUUtilityOnboardingTermsViewController *result;

  v7 = a5;
  v8 = a6;
  result = (HUUtilityOnboardingTermsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingTermsViewController_onboardingContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingTermsViewController_agreeButton));
}

@end
