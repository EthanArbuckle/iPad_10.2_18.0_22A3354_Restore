@implementation OnboardingAdPrivacyViewController

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v2;

  v2 = self;
  sub_1002E28AC();

}

- (void)viewDidLayoutSubviews
{
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v2;

  v2 = self;
  sub_1002E3000();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[OnboardingAdPrivacyViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)didTapLearnMore
{
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v2;
  NSString v3;
  id v4;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend((id)objc_opt_self(OBPrivacyPresenter), "presenterForPrivacySplashWithIdentifier:", v3);

  if (v4)
    objc_msgSend(v4, "setPresentingViewController:", v2);
  objc_msgSend(v4, "present");

}

- (void)didTapTurnOn
{
  void (*v2)(void);
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_buttonsCallback];
  v3 = self;
  v2();

}

- (void)didTapTurnOff
{
  void (*v2)(void);
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_buttonsCallback];
  v3 = self;
  v2();

}

- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *result;

  result = (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.OnboardingAdPrivacyViewController", 56, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *result;

  v6 = a5;
  result = (_TtC22SubscribePageExtension33OnboardingAdPrivacyViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.OnboardingAdPrivacyViewController", 56, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->buttonsStyle[OBJC_IVAR____TtC22SubscribePageExtension33OnboardingAdPrivacyViewController_buttonsCallback]);

}

@end
