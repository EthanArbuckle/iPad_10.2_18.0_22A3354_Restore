@implementation DebugFormatGroupViewController

- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8NewsFeed30DebugFormatGroupViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_contentSizeObserver) = 0;
  v5 = OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3D48]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed30DebugFormatGroupViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC8NewsFeed30DebugFormatGroupViewController *v2;

  v2 = self;
  sub_1BB17FCB4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_contentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed30DebugFormatGroupViewController *v2;

  v2 = self;
  sub_1BB17FDC8();

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
  -[DebugFormatGroupViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_tableView];
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

- (_TtC8NewsFeed30DebugFormatGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed30DebugFormatGroupViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed30DebugFormatGroupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections))[2];
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
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 32 * a4 + 56) + 16);
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
  _TtC8NewsFeed30DebugFormatGroupViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB1805B8();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = self;
  v5 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed30DebugFormatGroupViewController_sections);
  if (*(_QWORD *)(v5 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return self;
  }
  v6 = v5 + 32 * a4;
  v7 = *(_QWORD *)(v6 + 32);
  v8 = *(_QWORD *)(v6 + 40);
  v9 = *(_BYTE *)(v6 + 48);
  v10 = a3;
  v11 = v4;
  sub_1BB1827B4(v7, v8, v9);
  sub_1BB61B648(v7, v8, v9);
  v13 = v12;
  sub_1BB1827CC(v7, v8, v9);

  if (v13)
  {
    v14 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed30DebugFormatGroupViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB181B1C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
