@implementation DebugFormatInventoryViewController

- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB230230();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed34DebugFormatInventoryViewController *v2;

  v2 = self;
  sub_1BB22A14C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[DebugFormatInventoryViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setToolbarHidden_animated_, 0, 0);

  }
  sub_1BB22B034();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed34DebugFormatInventoryViewController *v2;

  v2 = self;
  sub_1BB22BA1C();

}

- (_TtC8NewsFeed34DebugFormatInventoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed34DebugFormatInventoryViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed34DebugFormatInventoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[336];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_packages, sizeof(v3));
  sub_1BAF8FB4C((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___uploadBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___versionBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController____lazy_storage___createPackageBarButtonItem));
  swift_release();
  swift_release();
}

- (void)doDismiss
{
  -[DebugFormatInventoryViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)doCompileUpload
{
  _TtC8NewsFeed34DebugFormatInventoryViewController *v2;

  v2 = self;
  sub_1BB22BE58();

}

- (void)doShowVersioningModePicker:(id)a3
{
  id v4;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB22C500((uint64_t)v4);

}

- (void)doCreatePackage
{
  _TtC8NewsFeed34DebugFormatInventoryViewController *v2;

  v2 = self;
  sub_1BB22C640();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatInventoryViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v7;
  unint64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1BB2303BC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = sub_1BB22C8CC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (uint64_t)tableView:(void *)a3 didDeselectRowAtIndexPath:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v12;

  v5 = sub_1BB86CBE0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v9 = a3;
  v10 = a1;
  sub_1BB23063C();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v13;
  uint64_t v14;

  sub_1BA4B07F0(0, &qword_1ED3B0568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - v8;
  if (a4)
  {
    sub_1BB86CBA4();
    v10 = sub_1BB86CBE0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_1BB86CBE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  sub_1BB22B034();

  sub_1BA5C699C((uint64_t)v9, &qword_1ED3B0568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658]);
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1BB22E038(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1BB23094C);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1BB22E038(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1BB230B38);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  char *v6;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v7;
  char *v8;

  v6 = (char *)a3;
  v7 = self;
  v8 = sub_1BB22E0F8(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 40.0;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC8NewsFeed34DebugFormatInventoryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB22E870(v4);

}

@end
