@implementation SleepingSampleChangesAlertTileViewController

- (void)viewDidLoad
{
  _TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *v2;

  v2 = self;
  sub_23DC402EC();

}

- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23DC70F5C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *)SleepingSampleChangesAlertTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController)initWithCoder:(id)a3
{
  return (_TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *)SleepingSampleChangesAlertTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint));
  swift_release();
  sub_23DC44B58((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel, (uint64_t)&qword_256CF47B8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_23DC440A8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph));
  sub_23DC4404C((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView));
}

- (NSString)title
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  void *v10;

  v3 = sub_23DC701A0();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_23DC70F2C();
  MEMORY[0x24BDAC7A8](v5, v6);
  v7 = self;
  sub_23DC70ED8();
  type metadata accessor for HealthBalanceAppPlugin();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23DC70194();
  sub_23DC70F74();

  v10 = (void *)sub_23DC70F38();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

@end
