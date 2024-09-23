@implementation AvailableAppsTableView.Coordinator

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v7;
  unint64_t v8;
  int64_t v9;
  id v11;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v12;

  v7 = (char *)self + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_sections;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(_QWORD *)(*(_QWORD *)v7 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(*(_QWORD *)v7 + 8 * a4 + 32);
  if (v8 >> 62)
  {
LABEL_8:
    v11 = a3;
    v12 = self;
    swift_bridgeObjectRetain();
    v9 = sub_215688FD8();

    swift_bridgeObjectRelease();
    return v9;
  }
  return *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_2156872C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2156872A4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_21561D5C0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v11;
  uint64_t v12;

  v6 = sub_2156872C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2156872A4();
  v10 = a3;
  v11 = self;
  sub_21561DAEC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v4;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = sub_2156202F4();

  if (v6)
  {
    v7 = (void *)sub_215688B58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  id v7;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v8;
  id v9;
  uint64_t v10;
  id result;
  void *v12;

  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_sectionTitles);
  v10 = sub_215688B64();

  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v10 + 16) > (unint64_t)a4)
  {
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    v12 = (void *)sub_215688A80();
    swift_bridgeObjectRelease();
    return v12;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_2156203CC(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_21562089C(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_21562097C(a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation), sel_sectionForSectionIndexTitleAtIndex_, a5, a4);
}

- (_TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator)init
{
  _TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *result;

  result = (_TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV15FocusSettingsUI22AvailableAppsTableView11Coordinator_collation));
  swift_bridgeObjectRelease();
}

@end
