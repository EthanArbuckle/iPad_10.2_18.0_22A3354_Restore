@implementation HUUtilityOnboardingLoadingViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingLoadingViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingLoadingViewController *)UtilityOnboardingLoadingViewController.init(context:)(a3);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingLoadingViewController *v2;

  v2 = self;
  sub_1B8F502D4();

}

- (void)viewWillAppear:(BOOL)a3
{
  HUUtilityOnboardingLoadingViewController *v4;

  v4 = self;
  sub_1B8F50928(a3);

}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  HUUtilityOnboardingLoadingViewController *result;

  result = (HUUtilityOnboardingLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingLoadingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  HUUtilityOnboardingLoadingViewController *result;

  v6 = a5;
  result = (HUUtilityOnboardingLoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_onboardingContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingLoadingViewController_rootVC));
}

@end
