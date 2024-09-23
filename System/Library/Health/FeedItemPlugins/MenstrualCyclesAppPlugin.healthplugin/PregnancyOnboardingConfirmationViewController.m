@implementation PregnancyOnboardingConfirmationViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *v2;

  v2 = self;
  sub_231A23E04();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);

  }
  sub_231C9E2CC();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[PregnancyOnboardingConfirmationViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
  sub_231C9E2C0();
  v5 = sub_231A23990();
  objc_msgSend(v5, sel_hidesBusyIndicator, v8.receiver, v8.super_class);

  v6 = objc_msgSend(v4, sel_navigationController);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setNavigationBarHidden_, 0);

    v4 = v7;
  }

}

- (void)hxui_primaryFooterButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *v2;
  id v3;
  char v4;

  v2 = self;
  v3 = sub_231A23990();
  objc_msgSend(v3, sel_showsBusyIndicator);

  v4 = *((_BYTE *)&v2->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController_onboardingStep);
  swift_retain();
  sub_231C67D00(v4, 2);

  swift_release();
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController____lazy_storage___primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45PregnancyOnboardingConfirmationViewController_animationView));
}

@end
