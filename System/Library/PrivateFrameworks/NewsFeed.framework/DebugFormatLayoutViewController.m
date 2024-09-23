@implementation DebugFormatLayoutViewController

- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB1F0E6C();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31DebugFormatLayoutViewController *v2;

  v2 = self;
  sub_1BB1ECAD4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8NewsFeed31DebugFormatLayoutViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BA4B07F0(0, &qword_1ED3B0568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - v7;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v9 = self;
  -[DebugFormatLayoutViewController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  v10 = objc_msgSend(*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView), sel_indexPathForSelectedRow);
  if (v10)
  {
    v11 = v10;
    sub_1BB86CBA4();

    v12 = sub_1BB86CBE0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    v13 = sub_1BB86CBE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  sub_1BB8731E0();
  sub_1BA5C699C((uint64_t)v8, &qword_1ED3B0568, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658]);

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
  -[DebugFormatLayoutViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView];
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

- (void)didTapOnOverlay:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatLayoutViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB1EE3E4(v4);

}

- (_TtC8NewsFeed31DebugFormatLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31DebugFormatLayoutViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatLayoutViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tableView));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController____lazy_storage___heatmapToolbar));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)(v3 + 16) + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5;
  int64_t result;
  uint64_t v7;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v7 = *(_QWORD *)(v5 + 16);
    if (*(_QWORD *)(v7 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v7 + 24 * a4 + 48) + 16);
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed31DebugFormatLayoutViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB1EF0A0((uint64_t)v10, (uint64_t)v9);

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
  _TtC8NewsFeed31DebugFormatLayoutViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB1F0F74();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  id result;
  void *v7;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed31DebugFormatLayoutViewController_tree);
  result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)(v5 + 16) + 16) > (unint64_t)a4)
  {
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

@end
