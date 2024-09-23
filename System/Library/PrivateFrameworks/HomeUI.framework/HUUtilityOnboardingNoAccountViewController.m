@implementation HUUtilityOnboardingNoAccountViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingNoAccountViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingNoAccountViewController *)UtilityOnboardingNoAccountViewController.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingNoAccountViewController *v2;

  v2 = self;
  sub_1B8FA5A40();

}

- (void)closeButtonWith_sender:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8FA60F8);
}

- (void)editDetails:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8FA65A0);
}

- (void)providerAccount:(id)a3
{
  sub_1B8ED8650(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B8FA686C);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4;
  HUUtilityOnboardingNoAccountViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8ECFBB8();

  return v6;
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  HUUtilityOnboardingNoAccountViewController *result;

  result = (HUUtilityOnboardingNoAccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HUUtilityOnboardingNoAccountViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  HUUtilityOnboardingNoAccountViewController *result;

  v6 = a5;
  result = (HUUtilityOnboardingNoAccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_onboardingContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_loginManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_editButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingNoAccountViewController_providerAccountButton));
}

@end
