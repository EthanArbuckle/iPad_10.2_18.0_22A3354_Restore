@implementation SleepingSampleHelpTileViewController

- (void)loadView
{
  _TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_23DC6827C();
  -[SleepingSampleHelpTileViewController setView:](v2, sel_setView_, v3);

}

- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_23DC70F5C();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  v10 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView) = 0;
  v11 = a4;
  if (v7)
  {
    v12 = (void *)sub_23DC70F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  v13 = -[SleepingSampleHelpTileViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v12, a4);

  return v13;
}

- (_TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  objc_super v9;

  v5 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  v7 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  return -[SleepingSampleHelpTileViewController initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_23DC55024((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context, &qword_256CF4768, (void (*)(uint64_t))sub_23DC67D94);
  sub_23DC55024((uint64_t)self + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration, qword_256CF51D0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView));
}

@end
