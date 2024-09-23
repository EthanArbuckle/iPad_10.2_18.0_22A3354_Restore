@implementation IMBListPickerTableViewController

- (_TtC8Business32IMBListPickerTableViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Business32IMBListPickerTableViewController *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_multipleSelectionEnabled) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_cellShouldHaveSelectionIcon) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_listRequest) = 0;
  v4 = OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_selectedItems;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_10004DD84((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC8Business32IMBListPickerTableViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBListPickerTableViewController.swift", 47, 2, 43, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8Business32IMBListPickerTableViewController *v2;

  v2 = self;
  sub_10001E404();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC8Business32IMBListPickerTableViewController *v9;
  int64_t v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_listRequest);
  if (!v3)
    return 1;
  v4 = *(_QWORD *)(v3 + 24);
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = *(_QWORD *)(v3 + 24);
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRetain(v4);
  v10 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC8Business32IMBListPickerTableViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100020F50(a4);

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
  _TtC8Business32IMBListPickerTableViewController *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v15 = (void *)sub_10002010C(v12, (uint64_t)v11, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v15;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8Business32IMBListPickerTableViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100020738(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 140.0;
}

- (uint64_t)tableView:(void *)a3 didSelectRowAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = a1;
  sub_10001EACC((uint64_t)v11);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC8Business32IMBListPickerTableViewController *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  Class isa;
  uint64_t v22;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007D40(&qword_1000ECC88);
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = a3;
  v17 = self;
  if (sub_10002DA10() == 2)
  {
    v18 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v11, v7);
    v18 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v15, v18, 1, v7);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v15, 1, v7) == 1)
    return 0;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v19(v15, v7);
  return isa;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_listRequest));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_selectedItems));
}

@end
