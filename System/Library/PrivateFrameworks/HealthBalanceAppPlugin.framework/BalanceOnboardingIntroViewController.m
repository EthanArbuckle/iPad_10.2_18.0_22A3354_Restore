@implementation BalanceOnboardingIntroViewController

- (void)viewDidLoad
{
  _TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *v2;

  v2 = self;
  sub_23DC5FD64();

}

- (void)hxui_primaryFooterButtonTapped
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v3 = sub_23DC70254();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  v9 = -[BalanceOnboardingIntroViewController navigationController](v8, sel_navigationController);
  if (v9)
  {
    v10 = v9;
    type metadata accessor for BalanceOnboardingNavigationController();
    if (swift_dynamicCastClass())
    {
      sub_23DC6BC58();

      (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BE3FB48], v3);
      sub_23DC6D028((uint64_t)v8, v7);
      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

      return;
    }

  }
  sub_23DC712E0();
  __break(1u);
}

- (void)hxui_cancelButtonTapped
{
  _TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[BalanceOnboardingIntroViewController navigationController](v2, sel_navigationController);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for BalanceOnboardingNavigationController();
    if (swift_dynamicCastClass())
    {
      sub_23DC6BC58();

      sub_23DC6D2C0();
      swift_release();
      return;
    }

  }
  sub_23DC712E0();
  __break(1u);
}

- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *result;

  result = (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *result;

  v6 = a5;
  result = (_TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23DC603F4((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController_model);
}

@end
