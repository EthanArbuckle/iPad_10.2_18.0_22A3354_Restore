@implementation HUUtilityOnboardingQuickLookupViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingQuickLookupViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingQuickLookupViewController *)UtilityOnboardingQuickLookup.init(context:)((char *)a3);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingQuickLookupViewController *v2;

  v2 = self;
  sub_1B8F558C4();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingQuickLookup();
  v4 = (char *)v6.receiver;
  -[HUUtilityOnboardingQuickLookupViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_delegate];
    swift_beginAccess();
    if (*v5)
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
  }

}

- (void)editAccountDetailsButtonTapped
{
  HUUtilityOnboardingQuickLookupViewController *v2;

  v2 = self;
  sub_1B8F55F78();

}

- (void)verifyAddressAndSubmitTAF
{
  HUUtilityOnboardingQuickLookupViewController *v2;

  v2 = self;
  sub_1B8F56288();

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

- (HUUtilityOnboardingQuickLookupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7;
  id v8;
  HUUtilityOnboardingQuickLookupViewController *result;

  v7 = a5;
  v8 = a6;
  result = (HUUtilityOnboardingQuickLookupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_context));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_rootVC));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingQuickLookupViewController_accountDetails));
}

@end
