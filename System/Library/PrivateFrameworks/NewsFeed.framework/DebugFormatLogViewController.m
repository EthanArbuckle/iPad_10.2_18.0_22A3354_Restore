@implementation DebugFormatLogViewController

- (_TtC8NewsFeed28DebugFormatLogViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB5454F4();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed28DebugFormatLogViewController *v2;

  v2 = self;
  sub_1BB542AA8();

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
  -[DebugFormatLogViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_tableView];
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

- (void)doNow
{
  _TtC8NewsFeed28DebugFormatLogViewController *v2;

  v2 = self;
  sub_1BB543900();

}

- (void)doClearLog
{
  uint64_t v2;
  _TtC8NewsFeed28DebugFormatLogViewController *v3;

  v2 = qword_1EF2A6C58;
  v3 = self;
  if (v2 != -1)
    swift_once();
  swift_retain();
  sub_1BB86ED4C();

  swift_release();
}

- (_TtC8NewsFeed28DebugFormatLogViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed28DebugFormatLogViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed28DebugFormatLogViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_consolePaneDisplayController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController____lazy_storage___nowBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController____lazy_storage___clearLogBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_searchBar));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t *v6;
  unint64_t v7;
  int64_t v8;
  id v10;
  _TtC8NewsFeed28DebugFormatLogViewController *v11;

  v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8NewsFeed28DebugFormatLogViewController_entries);
  swift_beginAccess();
  v7 = *v6;
  if (!(v7 >> 62))
    return *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  v8 = sub_1BB873F30();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed28DebugFormatLogViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB543BFC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed28DebugFormatLogViewController *v11;
  double v12;
  double v13;
  uint64_t v15;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB543FA4(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8NewsFeed28DebugFormatLogViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB544174();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8NewsFeed28DebugFormatLogViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1BB54425C((uint64_t)v6, a4);

}

- (uint64_t)scrollViewWillBeginDragging:(void *)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  swift_retain();
  sub_1BB86E4A0();

  return swift_release();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed28DebugFormatLogViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB5443CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8NewsFeed28DebugFormatLogViewController *v10;

  v6 = sub_1BB8729A0();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1BB545688(v6, v8);

  swift_bridgeObjectRelease();
}

@end
