@implementation InternalSettingsTableViewController

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)sub_231AC4DF0(a3);
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v2;

  v2 = self;
  sub_231AC4ED0();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231AC5A14(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v7;
  int64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;

  v7 = type metadata accessor for Section();
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v12 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections);
    if (*(_QWORD *)(v12 + 16) > (unint64_t)a4)
    {
      sub_231AC9604(v12+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * a4, (uint64_t)v11);
      v13 = a3;
      v14 = self;
      sub_231AC6A40();
      v16 = v15;
      sub_23191BD58((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Section);

      return v16;
    }
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v7;
  id result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v7 = type metadata accessor for Section();
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v12 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_sections);
  if (*(_QWORD *)(v12 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  sub_231AC9604(v12+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * a4, (uint64_t)v11);
  v13 = a3;
  v14 = self;
  sub_231AC6BFC();
  v16 = v15;
  sub_23191BD58((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for Section);

  if (v16)
  {
    v17 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231AC6EBC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithStyle:(int64_t)a3
{
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_analysis));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_pregnancyModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController____lazy_storage___store));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController____lazy_storage___notificationSyncStore));
  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_231AC92D8(v7, (unint64_t *)&qword_254195C30, 0x24BE46B38, "[%{public}s] Received analysis: %{public}s", &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_analysis);

}

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231AC92D8(v4, &qword_254192C30, 0x24BDD3CB0, "[%{public}s] Received update: %{public}s", &OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35InternalSettingsTableViewController_pregnancyModel);

}

@end
