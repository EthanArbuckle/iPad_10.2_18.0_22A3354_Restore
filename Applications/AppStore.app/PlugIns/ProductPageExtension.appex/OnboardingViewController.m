@implementation OnboardingViewController

- (_TtC20ProductPageExtension24OnboardingViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC20ProductPageExtension24OnboardingViewController *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension24OnboardingViewController_navController;
  v6 = objc_allocWithZone((Class)UINavigationController);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC20ProductPageExtension24OnboardingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/OnboardingViewController.swift", 51, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC20ProductPageExtension24OnboardingViewController *v2;

  v2 = self;
  sub_1005CE6C0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20ProductPageExtension24OnboardingViewController *v4;

  v4 = self;
  sub_1005CED50(a3);

}

- (_TtC20ProductPageExtension24OnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20ProductPageExtension24OnboardingViewController *result;

  v4 = a4;
  result = (_TtC20ProductPageExtension24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.OnboardingViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension24OnboardingViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24OnboardingViewController_navController));
  swift_release(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC20ProductPageExtension24OnboardingViewController_completionCallback]);
}

@end
