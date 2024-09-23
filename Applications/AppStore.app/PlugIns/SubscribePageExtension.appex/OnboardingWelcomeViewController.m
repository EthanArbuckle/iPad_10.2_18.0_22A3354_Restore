@implementation OnboardingWelcomeViewController

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension31OnboardingWelcomeViewController *v2;

  v2 = self;
  sub_100083DC8();

}

- (unint64_t)supportedInterfaceOrientations
{
  _TtC22SubscribePageExtension31OnboardingWelcomeViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[OnboardingWelcomeViewController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (void)didTapContinue
{
  void (*v2)(void);
  _TtC22SubscribePageExtension31OnboardingWelcomeViewController *v3;

  v2 = *(void (**)(void))&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension31OnboardingWelcomeViewController_primaryButtonCallback];
  v3 = self;
  v2();

}

- (_TtC22SubscribePageExtension31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC22SubscribePageExtension31OnboardingWelcomeViewController *result;

  result = (_TtC22SubscribePageExtension31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.OnboardingWelcomeViewController", 54, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension31OnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC22SubscribePageExtension31OnboardingWelcomeViewController *result;

  v6 = a5;
  result = (_TtC22SubscribePageExtension31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.OnboardingWelcomeViewController", 54, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->primaryButtonCallback[OBJC_IVAR____TtC22SubscribePageExtension31OnboardingWelcomeViewController_primaryButtonCallback]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension31OnboardingWelcomeViewController_privacyIdentifiers]);
}

@end
