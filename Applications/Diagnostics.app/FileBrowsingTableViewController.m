@implementation FileBrowsingTableViewController

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC11Diagnostics31FileBrowsingTableViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_completion);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_remoteFiles) = (Class)&_swiftEmptyArrayStorage;
  v5 = a3;

  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/FileBrowsingTableViewController.swift", 49, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC11Diagnostics31FileBrowsingTableViewController *v4;

  v4 = self;
  sub_100047A98(a3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics31FileBrowsingTableViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10006C1D8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC11Diagnostics31FileBrowsingTableViewController *v6;
  uint64_t v7;
  int64_t v8;

  v5 = a3;
  v6 = self;
  v7 = sub_10006A958();
  v8 = *(_QWORD *)(v7 + 16);

  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, unint64_t, uint64_t);
  id v11;
  _TtC11Diagnostics31FileBrowsingTableViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (void (*)(char *, unint64_t, uint64_t))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100067750(v11, v10);

  (*(void (**)(void (*)(char *, unint64_t, uint64_t), uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithStyle:(int64_t)a3
{
  _TtC11Diagnostics31FileBrowsingTableViewController *result;

  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.FileBrowsingTableViewController", 43, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics31FileBrowsingTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11Diagnostics31FileBrowsingTableViewController *result;

  v4 = a4;
  result = (_TtC11Diagnostics31FileBrowsingTableViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.FileBrowsingTableViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_completion), *(_QWORD *)&self->completion[OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_completion]);
  v3 = (char *)self + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_directoryURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics31FileBrowsingTableViewController_remoteFiles));
}

@end
