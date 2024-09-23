@implementation CardioFitnessOnboardingStartViewController

- (void)viewDidLoad
{
  _TtC5Heart42CardioFitnessOnboardingStartViewController *v2;

  v2 = self;
  sub_2312D22DC();

}

- (void)hxui_primaryFooterButtonTapped
{
  uint64_t v3;
  void *v4;
  _TtC5Heart42CardioFitnessOnboardingStartViewController *v5;

  v3 = MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart42CardioFitnessOnboardingStartViewController_delegate, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    sub_2313CBD30(v5, v4);

    sub_2314130CC();
  }
}

- (void)hxui_cancelButtonTapped
{
  uint64_t v3;
  uint64_t v4;
  _TtC5Heart42CardioFitnessOnboardingStartViewController *v5;

  v3 = MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart42CardioFitnessOnboardingStartViewController_delegate, a2);
  if (v3)
  {
    v4 = v3;
    v5 = self;
    sub_231341F2C(v4);

    sub_2314130CC();
  }
}

- (_TtC5Heart42CardioFitnessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Heart42CardioFitnessOnboardingStartViewController *result;

  result = (_TtC5Heart42CardioFitnessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart42CardioFitnessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Heart42CardioFitnessOnboardingStartViewController *result;

  v6 = a5;
  result = (_TtC5Heart42CardioFitnessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart42CardioFitnessOnboardingStartViewController_delegate);
}

@end
