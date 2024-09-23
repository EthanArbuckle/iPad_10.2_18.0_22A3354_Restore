@implementation DebugInspectViewController

- (_TtC8NewsFeed26DebugInspectViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8NewsFeed26DebugInspectViewController *result;

  v5 = OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3D48]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_searchController;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3C40]), sel_initWithSearchResultsController_, 0);

  result = (_TtC8NewsFeed26DebugInspectViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed26DebugInspectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed26DebugInspectViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed26DebugInspectViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_cloudContext));
  swift_unknownObjectRelease();
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_key, (uint64_t (*)(_QWORD))type metadata accessor for DebugGroupLayoutKey);
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_result, (uint64_t (*)(_QWORD))type metadata accessor for DebugInspectViewResult);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_factory);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1BACD5E78((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_inventory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_headlineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tagService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_webEmbedDataSourceService);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_searchController));
}

- (void)viewDidLoad
{
  _TtC8NewsFeed26DebugInspectViewController *v2;

  v2 = self;
  sub_1BB2B2680();

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
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[DebugInspectViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_tableView];
  v4 = objc_msgSend(v2, sel_view, v15.receiver, v15.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    v14 = sub_1BB2B2D08();
    objc_msgSend(v3, sel_setTableHeaderView_, v14);

  }
  else
  {
    __break(1u);
  }
}

- (void)doDismiss
{
  _TtC8NewsFeed26DebugInspectViewController *v2;
  _TtC8NewsFeed26DebugInspectViewController *v3;
  _TtC8NewsFeed26DebugInspectViewController *v4;
  _TtC8NewsFeed26DebugInspectViewController *v5;

  v5 = self;
  v2 = (_TtC8NewsFeed26DebugInspectViewController *)-[DebugInspectViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[DebugInspectViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (void)doTapToRadar
{
  _TtC8NewsFeed26DebugInspectViewController *v2;

  v2 = self;
  sub_1BB2B30CC();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v5;
  int64_t result;

  v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v5 + 16) > (unint64_t)a4)
  {
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 48 * a4 + 64) + 16);
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
  _TtC8NewsFeed26DebugInspectViewController *v11;
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
  sub_1BB2B47E8((uint64_t)v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  char *v5;
  id result;
  void *v7;

  v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 48 * a4 + 40))
  {
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  char *v5;
  id result;
  void *v7;

  v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed26DebugInspectViewDataSource_sections;
  result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (*(_QWORD *)(*(_QWORD *)v5 + 48 * a4 + 56))
  {
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed26DebugInspectViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB2B80E0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1BB22E038(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1BB2BB3FC);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  return sub_1BB22E038(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1BB2BBBD4);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC8NewsFeed26DebugInspectViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB2BAC34(v4);

}

@end
