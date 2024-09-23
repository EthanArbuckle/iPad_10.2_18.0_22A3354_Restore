@implementation OnboardingLocationPrivacyViewController

- (void)viewDidLoad
{
  _TtC8AppStore39OnboardingLocationPrivacyViewController *v2;

  v2 = self;
  sub_100511620();

}

- (void)viewDidLayoutSubviews
{
  _TtC8AppStore39OnboardingLocationPrivacyViewController *v2;

  v2 = self;
  sub_100511A7C();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC8AppStore39OnboardingLocationPrivacyViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[OnboardingLocationPrivacyViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)didTapContinue
{
  void (*v2)(void);
  _TtC8AppStore39OnboardingLocationPrivacyViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore39OnboardingLocationPrivacyViewController_continueCallback];
  v3 = self;
  v2();

}

- (void)didTapManage
{
  void (*v2)(void);
  _TtC8AppStore39OnboardingLocationPrivacyViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore39OnboardingLocationPrivacyViewController_manageCallback];
  v3 = self;
  v2();

}

- (_TtC8AppStore39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC8AppStore39OnboardingLocationPrivacyViewController *result;

  result = (_TtC8AppStore39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.OnboardingLocationPrivacyViewController", 48, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore39OnboardingLocationPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC8AppStore39OnboardingLocationPrivacyViewController *result;

  v6 = a5;
  result = (_TtC8AppStore39OnboardingLocationPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.OnboardingLocationPrivacyViewController", 48, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->continueCallback[OBJC_IVAR____TtC8AppStore39OnboardingLocationPrivacyViewController_continueCallback]);
  swift_release(*(_QWORD *)&self->continueCallback[OBJC_IVAR____TtC8AppStore39OnboardingLocationPrivacyViewController_manageCallback]);

}

@end
