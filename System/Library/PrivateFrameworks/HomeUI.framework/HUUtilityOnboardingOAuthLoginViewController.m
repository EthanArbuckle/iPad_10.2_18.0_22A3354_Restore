@implementation HUUtilityOnboardingOAuthLoginViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingOAuthLoginViewController *)UtilityOnboardingOAuthLoginView.init(context:)((char *)a3);
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B8ECFB24();
}

- (void)viewDidLoad
{
  HUUtilityOnboardingOAuthLoginViewController *v2;

  v2 = self;
  sub_1B8ECE338();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1B8ECF8F0(self, (uint64_t)a2, a3, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1B8ECF8F0(self, (uint64_t)a2, a3, 0);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4;
  HUUtilityOnboardingOAuthLoginViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8ECFBB8();

  return v6;
}

- (Class)onboardingFlowClass
{
  sub_1B8ECFDDC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingOAuthLoginViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  HUUtilityOnboardingOAuthLoginViewController *result;

  v4 = a4;
  result = (HUUtilityOnboardingOAuthLoginViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingOAuthLoginViewController_loginManager));
  swift_bridgeObjectRelease();
}

@end
