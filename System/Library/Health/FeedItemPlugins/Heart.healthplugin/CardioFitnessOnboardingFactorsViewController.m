@implementation CardioFitnessOnboardingFactorsViewController

- (void)viewDidLoad
{
  _TtC5Heart44CardioFitnessOnboardingFactorsViewController *v2;

  v2 = self;
  sub_2313416C4();

}

- (void)hxui_primaryFooterButtonTapped
{
  uint64_t v3;
  void *v4;
  _TtC5Heart44CardioFitnessOnboardingFactorsViewController *v5;

  v3 = MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart44CardioFitnessOnboardingFactorsViewController_delegate, a2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = self;
    sub_2313CC1DC(v5, v4);

    sub_2314130CC();
  }
}

- (void)hxui_cancelButtonTapped
{
  _TtC5Heart44CardioFitnessOnboardingFactorsViewController *v3;

  if (MEMORY[0x2348DE3BC]((char *)self + OBJC_IVAR____TtC5Heart44CardioFitnessOnboardingFactorsViewController_delegate, a2))
  {
    v3 = self;
    sub_231341F30();

    sub_2314130CC();
  }
}

- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Heart44CardioFitnessOnboardingFactorsViewController *result;

  result = (_TtC5Heart44CardioFitnessOnboardingFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart44CardioFitnessOnboardingFactorsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC5Heart44CardioFitnessOnboardingFactorsViewController *result;

  v6 = a5;
  result = (_TtC5Heart44CardioFitnessOnboardingFactorsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D2854((uint64_t)self + OBJC_IVAR____TtC5Heart44CardioFitnessOnboardingFactorsViewController_delegate);
}

@end
