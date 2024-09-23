@implementation DebugFormatSelectPackageViewController

- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAF5AF84();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *v2;

  v2 = self;
  sub_1BAF59488();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[DebugFormatSelectPackageViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setToolbarHidden_animated_, 0, 0);

    v4 = v6;
  }

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[DebugFormatSelectPackageViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_tableView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)doDismissView
{
  -[DebugFormatSelectPackageViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)doNext
{
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *v2;

  v2 = self;
  sub_1BAF59D10();

}

- (_TtC8NewsFeed38DebugFormatSelectPackageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed38DebugFormatSelectPackageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_editorURL;
  v4 = sub_1BB86C67C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BAF5B440(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate), *((_BYTE *)&self->super._tabElement+ OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_selectedTemplate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController____lazy_storage___nextBarButtonItem));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatSelectPackageViewController_templates))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BAF5A0CC((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)sub_1BB872970();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5;
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1BAF5B0D8();

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed38DebugFormatSelectPackageViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BAF5B328();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
