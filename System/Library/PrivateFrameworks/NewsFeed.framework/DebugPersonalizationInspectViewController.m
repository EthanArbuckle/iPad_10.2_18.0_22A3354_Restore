@implementation DebugPersonalizationInspectViewController

- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB7AF6A8();
}

- (_TtC8NewsFeed41DebugPersonalizationInspectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed41DebugPersonalizationInspectViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_cloudContext));
  swift_unknownObjectRelease();
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_key, (uint64_t (*)(_QWORD))type metadata accessor for DebugGroupLayoutKey);
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_bindings, (uint64_t (*)(_QWORD))type metadata accessor for GroupLayoutBindingContext);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_1BACD5E78((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_inventory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitContainerView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_headlineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_tagService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_webEmbedDataSourceService);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_header));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_titleView));
}

- (void)viewDidLoad
{
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v2;

  v2 = self;
  sub_1BB7A9B04();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v2;

  v2 = self;
  sub_1BB7AA334();

}

- (void)viewDidLayoutSubviews
{
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v2;

  v2 = self;
  sub_1BB7AA46C();

}

- (void)doDismiss
{
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v2;
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v3;
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v4;
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v5;

  v5 = self;
  v2 = (_TtC8NewsFeed41DebugPersonalizationInspectViewController *)-[DebugPersonalizationInspectViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[DebugPersonalizationInspectViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (void)doTapToRadar
{
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v3;
  void *v4;
  void *v5;

  swift_getObjectType();
  v3 = self;
  sub_1BB86EC14();
  sub_1BA49A224(0, (unint64_t *)&qword_1ED3B9850);
  v4 = (void *)sub_1BB87345C();
  sub_1BB86E98C();
  swift_release();

  v5 = (void *)sub_1BB87345C();
  sub_1BB86E9B0();

  swift_release();
  swift_release();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v3;

  v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v5;
  int64_t result;

  v5 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
  result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)v5 + 16) > (unint64_t)a4)
  {
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + (a4 << 6) + 64) + 16);
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
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v11;
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
  sub_1BB7AC774(v10, v9);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8NewsFeed41DebugPersonalizationInspectViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1BB7AEC0C((uint64_t)v6, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  char *v5;
  id result;
  void *v7;

  v5 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewController_dataSource)
     + OBJC_IVAR____TtC8NewsFeed41DebugPersonalizationInspectViewDataSource_sections;
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
  if (*(_QWORD *)(*(_QWORD *)v5 + (a4 << 6) + 88))
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

- (double)tableView:heightForRowAtIndexPath:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  uint64_t v6;

  v0 = sub_1BB86CBE0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v4 = *MEMORY[0x1E0DC53D8];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

@end
