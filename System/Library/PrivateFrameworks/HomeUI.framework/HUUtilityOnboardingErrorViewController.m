@implementation HUUtilityOnboardingErrorViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingErrorViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingErrorViewController)initWithContext:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (HUUtilityOnboardingErrorViewController *)UtilityOnboardingErrorViewController.init(context:error:)(v5, a4);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingErrorViewController *v2;

  v2 = self;
  sub_1B8FEDBA8();

}

- (void)finishOnboarding:(id)a3
{
  HUUtilityOnboardingErrorViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8FEE2F4();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  HUUtilityOnboardingErrorViewController *result;

  result = (HUUtilityOnboardingErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingErrorViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  HUUtilityOnboardingErrorViewController *result;

  v6 = a5;
  result = (HUUtilityOnboardingErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingErrorViewController_onboardingContext));
}

@end
