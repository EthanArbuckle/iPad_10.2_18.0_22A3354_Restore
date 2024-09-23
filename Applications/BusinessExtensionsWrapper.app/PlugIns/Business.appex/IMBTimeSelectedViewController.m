@implementation IMBTimeSelectedViewController

- (void)viewDidLoad
{
  _TtC8Business29IMBTimeSelectedViewController *v2;

  v2 = self;
  sub_100094214();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  v4 = (char *)v6.receiver;
  -[IMBTimeSelectedViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
  objc_msgSend(v5, "setPreservesSuperviewLayoutMargins:", 1, v6.receiver, v6.super_class);
  objc_msgSend(v5, "layoutMargins");
  objc_msgSend(v5, "setLayoutMargins:");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC8Business29IMBTimeSelectedViewController *v12;
  _BYTE v13[24];

  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v13, 0, 0);
  v7 = *v6;
  if (!((unint64_t)v7 >> 62))
    return *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7 < 0)
    v10 = v7;
  else
    v10 = v7 & 0xFFFFFFFFFFFFFF8;
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v10);

  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Business29IMBTimeSelectedViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_100096240(v12);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Business29IMBTimeSelectedViewController *v13;
  double v14;
  double v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_100097028((uint64_t)v11);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Business29IMBTimeSelectedViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_100096930(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (_TtC8Business29IMBTimeSelectedViewController)initWithCoder:(id)a3
{
  return (_TtC8Business29IMBTimeSelectedViewController *)sub_100096CDC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_warningLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_containerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent));
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v5;
  _TtC8Business29IMBTimeSelectedViewController *v6;
  unsigned int v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10002DA10();

  return v7 < 2;
}

@end
