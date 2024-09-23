@implementation DebugFormatCreatePackageViewController

- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB016DD4();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *v2;

  v2 = self;
  sub_1BB0138E8();

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
  -[DebugFormatCreatePackageViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_tableView];
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
  -[DebugFormatCreatePackageViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)doEndEditing
{
  id v2;
  void *v3;
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *v4;

  v4 = self;
  v2 = -[DebugFormatCreatePackageViewController view](v4, sel_view);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_endEditing_, 1);

    sub_1BB013F1C();
  }
  else
  {
    __break(1u);
  }
}

- (void)doCreatePackage
{
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *v2;

  v2 = self;
  sub_1BB0141E4();

}

- (_TtC8NewsFeed38DebugFormatCreatePackageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed38DebugFormatCreatePackageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_editorURL;
  v4 = sub_1BB86C67C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  sub_1BACB9CB0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate), *((_BYTE *)&self->super._tabElement+ OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_selectedTemplate));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_tableView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController____lazy_storage___createBarButtonItem));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 104 * a4 + 128) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB0154C4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)((char *)self
                                  + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections)
                      + 16) > (unint64_t)a4)
  {
    swift_bridgeObjectRetain();
    sub_1BB872AFC(v4);
    sub_1BB872AFC(v5);
    swift_bridgeObjectRelease();
    v6 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)((char *)self
                                  + OBJC_IVAR____TtC8NewsFeed38DebugFormatCreatePackageViewController_sections)
                      + 16) > (unint64_t)a4)
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
    return v4;
  }
  __break(1u);
  return self;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed38DebugFormatCreatePackageViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB0160B4(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
