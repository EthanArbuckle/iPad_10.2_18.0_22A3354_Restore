@implementation RadioOptionsViewController

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioOptionsViewController();
  v2 = (char *)v3.receiver;
  -[RadioPopoverViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView], "setDataSource:", v2, v3.receiver, v3.super_class);

}

- (void)invalidate
{
  _TtC5Media26RadioOptionsViewController *v2;

  v2 = self;
  sub_10000F0D0();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC5Media26RadioOptionsViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100010084();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC5Media26RadioOptionsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000100EC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media26RadioOptionsViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10000F278(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 < 1)
    return 0;
  else
    return objc_msgSend(objc_allocWithZone((Class)UIView), "init", v4, v5);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 0.0;
  if (a4 > 0)
    return 12.0;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media26RadioOptionsViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100010140();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void).cxx_destruct
{
  sub_100010074(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Media26RadioOptionsViewController_completion), *(_QWORD *)&self->super.super.tableView[OBJC_IVAR____TtC5Media26RadioOptionsViewController_completion]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Media26RadioOptionsViewController_nowPlaying);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media26RadioOptionsViewController_dataSource);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media26RadioOptionsViewController_cancelSet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media26RadioOptionsViewController_sortOptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Media26RadioOptionsViewController_actionOptions));
}

@end
