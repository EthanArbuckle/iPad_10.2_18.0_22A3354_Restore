@implementation HUUtilityOnboardingEnterOTPViewController

- (HUConfigurationViewControllerDelegate)delegate
{
  swift_beginAccess();
  return (HUConfigurationViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUUtilityOnboardingEnterOTPViewController)initWithContext:(id)a3
{
  return (HUUtilityOnboardingEnterOTPViewController *)UtilityOnboardingEnterOTP.init(context:)(a3);
}

- (void)viewDidLoad
{
  HUUtilityOnboardingEnterOTPViewController *v2;

  v2 = self;
  sub_1B8EF67E8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UtilityOnboardingEnterOTP();
  v4 = (char *)v5.receiver;
  -[HUUtilityOnboardingEnterOTPViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField], sel_becomeFirstResponder, v5.receiver, v5.super_class);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for UtilityOnboardingEnterOTP();
  v4 = (char *)v6.receiver;
  -[HUUtilityOnboardingEnterOTPViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController))
  {
    v5 = (id *)&v4[OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_delegate];
    swift_beginAccess();
    if (*v5)
      objc_msgSend(*v5, sel_viewControllerDidGoBack_, v4);
  }

}

- (void)clearButtonTapped:(id)a3
{
  HUUtilityOnboardingEnterOTPViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.super.super.isa+ OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField), sel_clearText);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)navBarButtonTapped:(id)a3
{
  HUUtilityOnboardingEnterOTPViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8EF6FC4();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (id)hu_preloadContent
{
  return objc_msgSend((id)objc_opt_self(), sel_futureWithNoResult);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  HUUtilityOnboardingEnterOTPViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1B93EDDB4();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B8EF97D8(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (Class)onboardingFlowClass
{
  sub_1B8E23A60(0, (unint64_t *)&qword_1EF20ABD0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (HUUtilityOnboardingEnterOTPViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v7;
  id v8;
  HUUtilityOnboardingEnterOTPViewController *result;

  v7 = a5;
  v8 = a6;
  result = (HUUtilityOnboardingEnterOTPViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_onboardingContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_codeTextField));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUUtilityOnboardingEnterOTPViewController_nextButton));
}

@end
