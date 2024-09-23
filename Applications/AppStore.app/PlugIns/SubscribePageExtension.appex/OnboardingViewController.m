@implementation OnboardingViewController

- (_TtC22SubscribePageExtension24OnboardingViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension24OnboardingViewController *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_navController;
  v6 = objc_allocWithZone((Class)UINavigationController);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC22SubscribePageExtension24OnboardingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/OnboardingViewController.swift", 53, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC22SubscribePageExtension24OnboardingViewController *v2;

  v2 = self;
  sub_1005BC67C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22SubscribePageExtension24OnboardingViewController *v4;

  v4 = self;
  sub_1005BCD20(a3);

}

- (_TtC22SubscribePageExtension24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension24OnboardingViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.OnboardingViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_navController));
  swift_release(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC22SubscribePageExtension24OnboardingViewController_completionCallback]);
}

@end
