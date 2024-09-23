@implementation HUUtilityOnboardingSelectLocationViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingSelectLocationViewController)initWithHome:(id)a3 context:(id)a4
{
  return (HUUtilityOnboardingSelectLocationViewController *)UtilityOnboardingLocationSelection.init(home:context:)(a3, (char *)a4);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingSelectLocationViewController *v2;

  v2 = self;
  sub_1B8FD02AC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingLocationSelection();
  v4 = (char *)v6.receiver;
  -[HUUtilityOnboardingSelectLocationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_delegate];
    swift_beginAccess();
    if (*v5)
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
  }

}

- (void)goToConnectedScreen:(id)a3
{
  HUUtilityOnboardingSelectLocationViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8FD0668();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)hu_preloadContent
{
  return objc_msgSend((id)objc_opt_self(), sel_futureWithNoResult);
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingSelectLocationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7
{
  id v8;
  id v9;
  HUUtilityOnboardingSelectLocationViewController *result;

  v8 = a5;
  v9 = a7;
  result = (HUUtilityOnboardingSelectLocationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_home));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_onboardingContext));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingSelectLocationViewController_connectAccountButton));
}

@end
