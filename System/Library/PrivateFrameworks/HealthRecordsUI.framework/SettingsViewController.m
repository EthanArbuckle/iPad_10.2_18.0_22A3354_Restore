@implementation SettingsViewController

- (_TtC15HealthRecordsUI22SettingsViewController)initWithCoder:(id)a3
{
  sub_1BC3F0010(a3);
}

- (void)dealloc
{
  _TtC15HealthRecordsUI22SettingsViewController *v3;
  _TtC15HealthRecordsUI22SettingsViewController *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_accountStateCancellable))
  {
    v3 = self;
    swift_retain();
    sub_1BC62BEAC();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SettingsViewController();
  -[SettingsViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_sourceLoadingToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_factory));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_profile));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22SettingsViewController_sourceListDataSource));
  swift_release();
}

- (void)viewDidLoad
{
  _TtC15HealthRecordsUI22SettingsViewController *v2;

  v2 = self;
  sub_1BC3F02B4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC15HealthRecordsUI22SettingsViewController *v4;

  v4 = self;
  sub_1BC3F0EFC(a3);

}

- (void)tapToRadar:(id)a3
{
  _TtC15HealthRecordsUI22SettingsViewController *v4;
  _TtC15HealthRecordsUI22SettingsViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BC62D088();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  type metadata accessor for TapToRadarManager();
  static TapToRadarManager.presentTapToRadarDialogue(from:)(self);

  sub_1BC39BD2C((uint64_t)v6);
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithUsingInsetStyling:(BOOL)a3
{
  _TtC15HealthRecordsUI22SettingsViewController *result;

  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithStyle:(int64_t)a3
{
  _TtC15HealthRecordsUI22SettingsViewController *result;

  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15HealthRecordsUI22SettingsViewController *result;

  v4 = a4;
  result = (_TtC15HealthRecordsUI22SettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)closeButtonTapped
{
  -[SettingsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI22SettingsViewController *v5;

  v4 = a3;
  v5 = self;
  SettingsViewController.sourceListDataSourceDidUpdate(_:)(v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI22SettingsViewController *v11;
  uint64_t v12;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  SettingsViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI22SettingsViewController *v11;
  uint64_t v13;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1BC4DCC30();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC15HealthRecordsUI22SettingsViewController *v5;
  unint64_t v6;
  _QWORD *v7;
  int64_t v8;

  v4 = a3;
  v5 = self;
  v6 = swift_bridgeObjectRetain();
  v7 = sub_1BC41F2A8(v6);
  swift_bridgeObjectRelease();
  v8 = v7[2];

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC15HealthRecordsUI22SettingsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1BC53EB10(a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  UITableView *v6;
  _TtC15HealthRecordsUI22SettingsViewController *v7;
  void *object;
  void *v9;

  v6 = (UITableView *)a3;
  v7 = self;
  object = SettingsViewController.tableView(_:titleForHeaderInSection:)(v6, a4).value._object;

  if (object)
  {
    v9 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC15HealthRecordsUI22SettingsViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_1BC53EDC4(a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1BC62C650();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15HealthRecordsUI22SettingsViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BC62A970();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  v10 = a3;
  v11 = self;
  v12 = SettingsViewController.tableView(_:cellForRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC15HealthRecordsUI22SettingsViewController *v12;
  id v13;
  id v14;
  _TtC15HealthRecordsUI22SettingsViewController *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v8 = sub_1BC62A970();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  sub_1BC62AEE0();
  if (swift_dynamicCastClass())
  {
    v12 = self;
    v13 = a3;
    v14 = a4;
    sub_1BC62AEC8();
  }
  else
  {
    v15 = self;
    v16 = a3;
    v17 = a4;
  }
  type metadata accessor for LoadingTableViewCell();
  v18 = swift_dynamicCastClass();
  if (v18)
    objc_msgSend(*(id *)(v18 + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner), sel_startAnimating);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC15HealthRecordsUI22SettingsViewController *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = sub_1BC62A970();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC62A934();
  sub_1BC62AEE0();
  v12 = swift_dynamicCastClass();
  v13 = a3;
  v14 = a4;
  v15 = self;
  if (v12)
    sub_1BC62AEC8();
  type metadata accessor for LoadingTableViewCell();
  v16 = swift_dynamicCastClass();
  if (v16)
    objc_msgSend(*(id *)(v16 + OBJC_IVAR____TtC15HealthRecordsUI20LoadingTableViewCell_spinner), sel_stopAnimating);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
