@implementation DebugJournalViewController

- (_TtC7NewsAds26DebugJournalViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsAds26DebugJournalViewController *result;

  v5 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3D48]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsAds26DebugJournalViewController *)sub_1BA2C257C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsAds26DebugJournalViewController *v2;

  v2 = self;
  DebugJournalViewController.viewDidLoad()();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC7NewsAds26DebugJournalViewController *v4;

  v4 = self;
  DebugJournalViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
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
  -[DebugJournalViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
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

- (void)handleDone
{
  -[DebugJournalViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC7NewsAds26DebugJournalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsAds26DebugJournalViewController *result;

  v4 = a4;
  result = (_TtC7NewsAds26DebugJournalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[9];

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[6] = *(_OWORD *)((char *)&self->super._nibBundle + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[7] = v3;
  v7[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v4 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[3] = v4;
  v5 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[4] = *(_OWORD *)((char *)&self->super._navigationItem + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[1] = v6;
  sub_1BA249CB4((uint64_t)v7);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC7NewsAds26DebugJournalViewController *v11;
  uint64_t v12;

  v6 = sub_1BA2C14C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2C149C();
  v10 = a3;
  v11 = self;
  DebugJournalViewController.tableView(_:didSelectRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC7NewsAds26DebugJournalViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = *(_QWORD *)(sub_1BA2C0A88((uint64_t)&unk_1E71F51D8) + 16);

  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC7NewsAds26DebugJournalViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1BA2C0D38(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC7NewsAds26DebugJournalViewController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_1BA2C0E4C(a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1BA2C212C();
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
  _TtC7NewsAds26DebugJournalViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1BA2C14C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA2C149C();
  v10 = a3;
  v11 = self;
  DebugJournalViewController.tableView(_:cellForRowAt:)();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

@end
