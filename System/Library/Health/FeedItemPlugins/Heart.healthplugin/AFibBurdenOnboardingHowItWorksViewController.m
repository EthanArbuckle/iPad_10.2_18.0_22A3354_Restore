@implementation AFibBurdenOnboardingHowItWorksViewController

- (void)viewDidLoad
{
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *v2;

  v2 = self;
  sub_2313BFCF8();

}

- (void)hxui_primaryFooterButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Heart44AFibBurdenOnboardingHowItWorksViewController_delegate;
  if (MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart44AFibBurdenOnboardingHowItWorksViewController_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    sub_2314130CC();
  }
}

- (void)hxui_cancelButtonTapped
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Heart44AFibBurdenOnboardingHowItWorksViewController_delegate;
  if (MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart44AFibBurdenOnboardingHowItWorksViewController_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    sub_2314130CC();
  }
}

- (_TtC5Heart44AFibBurdenOnboardingHowItWorksViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *result;

  result = (_TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart44AFibBurdenOnboardingHowItWorksViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *result;

  v6 = a5;
  result = (_TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart44AFibBurdenOnboardingHowItWorksViewController_delegate);
}

- (void)viewControllerWillEnterAdaptiveModal
{
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *v2;

  v2 = self;
  sub_2313C0324();

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  _TtC5Heart44AFibBurdenOnboardingHowItWorksViewController *v2;
  id v3;

  v2 = self;
  v3 = -[OBBaseWelcomeController navigationItem](v2, sel_navigationItem);
  objc_msgSend(v3, sel_setRightBarButtonItem_, 0);

}

@end
