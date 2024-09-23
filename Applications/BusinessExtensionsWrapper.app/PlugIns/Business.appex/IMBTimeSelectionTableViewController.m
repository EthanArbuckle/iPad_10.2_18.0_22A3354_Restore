@implementation IMBTimeSelectionTableViewController

- (void)viewDidLoad
{
  _TtC8Business35IMBTimeSelectionTableViewController *v2;

  v2 = self;
  sub_10008DEEC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Business35IMBTimeSelectionTableViewController *v4;

  v4 = self;
  sub_10008DFE8(a3);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "reloadData", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  id v10;
  _TtC8Business35IMBTimeSelectionTableViewController *v11;
  _BYTE v12[24];

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates, v12, 0, 0);
  v6 = *v5;
  if ((unint64_t)v6 >> 62)
  {
    if (v6 < 0)
      v9 = v6;
    else
      v9 = v6 & 0xFFFFFFFFFFFFFF8;
    v10 = a3;
    v11 = self;
    swift_bridgeObjectRetain(v6);
    v7 = _CocoaArrayWrapper.endIndex.getter(v9);

    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v7 != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC8Business35IMBTimeSelectionTableViewController *v12;
  _BYTE v13[24];

  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates, v13, 0, 0);
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
  _TtC8Business35IMBTimeSelectionTableViewController *v13;
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
  sub_10008E74C(v12);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (_TtC8Business35IMBTimeSelectionTableViewController)initWithCoder:(id)a3
{
  return (_TtC8Business35IMBTimeSelectionTableViewController *)sub_100090420(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_conflictedEvents));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedTimeslot));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo));
}

@end
