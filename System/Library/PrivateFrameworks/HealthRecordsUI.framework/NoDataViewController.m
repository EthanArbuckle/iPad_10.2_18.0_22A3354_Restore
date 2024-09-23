@implementation NoDataViewController

- (_TtC15HealthRecordsUI20NoDataViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI20NoDataViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile) = 0;
  v4 = a3;

  result = (_TtC15HealthRecordsUI20NoDataViewController *)sub_1BC62D394();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI20NoDataViewController *v2;

  v2 = self;
  sub_1BC497FC8();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC15HealthRecordsUI20NoDataViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1BC49878C();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  _TtC15HealthRecordsUI20NoDataViewController *v12;
  id v13;
  id v14;
  id v15;
  _TtC15HealthRecordsUI20NoDataViewController *v16;
  id v17;
  uint64_t v19;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile);
  if (v10)
  {
    v11 = a3;
    v12 = self;
    v13 = v10;
  }
  else
  {
    v14 = objc_allocWithZone(MEMORY[0x1E0DC3D50]);
    v15 = a3;
    v16 = self;
    v13 = objc_msgSend(v14, sel_init);
  }
  v17 = v10;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI20NoDataViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI20NoDataViewController *result;

  result = (_TtC15HealthRecordsUI20NoDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI20NoDataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI20NoDataViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI20NoDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_profile));
  sub_1BC359B60(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._view + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tabBarItem+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tab + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tabElement+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(void **)((char *)&self->super.super._navigationItem+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile));
}

@end
