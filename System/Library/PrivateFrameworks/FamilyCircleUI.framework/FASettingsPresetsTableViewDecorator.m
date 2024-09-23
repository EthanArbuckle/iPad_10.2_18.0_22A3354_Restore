@implementation FASettingsPresetsTableViewDecorator

- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 parentViewController:(id)a5
{
  id v8;
  objc_super v10;

  swift_unknownObjectUnownedInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator____lazy_storage___settingsPresetsVC) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator_ruiTableView) = (Class)a4;
  swift_unknownObjectUnownedAssign();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FASettingsPresetsTableViewDecorator();
  v8 = a4;
  return -[FATableViewDecorator initWithTableView:](&v10, sel_initWithTableView_, a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v7;
  UITableViewDataSource *v9;
  id v10;

  v6 = a3;
  v7 = self;
  if ((sub_20DF7E158(a4) & 1) != 0)
  {

    return 1;
  }
  else
  {
    v9 = -[FATableViewDecorator dataSource](v7, sel_dataSource);
    if (v9)
    {
      v10 = -[UITableViewDataSource tableView:numberOfRowsInSection:](v9, sel_tableView_numberOfRowsInSection_, v6, a4);

      swift_unknownObjectRelease();
      return (int64_t)v10;
    }
    else
    {

      return 0;
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_20E07BD08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E07BCF0();
  v10 = a3;
  v11 = self;
  sub_20DF7E5B0((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *v11;
  double v12;
  double v13;
  uint64_t v15;

  v6 = sub_20E07BD08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E07BCF0();
  v10 = a3;
  v11 = self;
  sub_20DF7EBC4((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator)initWithTableView:(id)a3
{
  _TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *result;

  swift_unknownObjectRetain();
  result = (_TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator_ruiTableView));
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI35FASettingsPresetsTableViewDecorator____lazy_storage___settingsPresetsVC));
}

@end
