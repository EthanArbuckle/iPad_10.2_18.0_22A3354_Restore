@implementation ClinicalAuthorizationAccountsOverviewViewController

- (void)viewDidLoad
{
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *v2;

  v2 = self;
  sub_1D7B1C648();

}

- (void)nextButtonPressed:(id)a3
{
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *v4;
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1D7B1D5C4();

  sub_1D7AB1290((uint64_t)v6);
}

- (void)cancelButtonPressed:(id)a3
{
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *v4;
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D7B4A770();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1D7B1D7B4();

  sub_1D7AB1290((uint64_t)v6);
}

- (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *result;

  result = (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *result;

  v5 = a5;
  result = (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *result;

  result = (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *result;

  v6 = a5;
  result = (_TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI51ClinicalAuthorizationAccountsOverviewViewController_tableSourceAndDelegate));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end
