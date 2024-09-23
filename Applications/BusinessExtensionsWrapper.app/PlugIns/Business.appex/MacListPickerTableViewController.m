@implementation MacListPickerTableViewController

- (_TtC8Business32MacListPickerTableViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC8Business32MacListPickerTableViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths) = (Class)&_swiftEmptySetSingleton;
  v4 = a3;

  result = (_TtC8Business32MacListPickerTableViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/MacListPickerTableViewController.swift", 47, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8Business32MacListPickerTableViewController *v2;

  v2 = self;
  sub_10009D728();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC8Business32MacListPickerTableViewController *v9;
  int64_t v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
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
  uint64_t v4;
  int64_t v5;
  uint64_t v8;
  int64_t v9;
  id v11;
  _TtC8Business32MacListPickerTableViewController *v12;
  uint64_t v13;
  id v14;
  _TtC8Business32MacListPickerTableViewController *v15;
  uint64_t v16;
  int64_t v17;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (!v4)
    return 0;
  v5 = a4;
  v8 = *(_QWORD *)(v4 + 24);
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(v8 + 8 * a4 + 32) + 40);
      if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
        return *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_15;
    }
    __break(1u);
LABEL_15:
    v14 = a3;
    v15 = self;
    swift_bridgeObjectRetain(v5);
    goto LABEL_16;
  }
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v8);
  v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v8);
  swift_bridgeObjectRelease(v8);
  v5 = *(_QWORD *)(v13 + 40);
  swift_bridgeObjectRetain(v5);
  swift_unknownObjectRelease(v13);
  if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    v9 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease(v5);
    return v9;
  }
LABEL_16:
  if (v5 < 0)
    v16 = v5;
  else
    v16 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v17 = _CocoaArrayWrapper.endIndex.getter(v16);

  swift_bridgeObjectRelease_n(v5, 2);
  return v17;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Business32MacListPickerTableViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_10009E9B4(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC8Business32MacListPickerTableViewController *v6;
  double v7;

  v5 = a3;
  v6 = self;
  if ((uint64_t)objc_msgSend(v5, "numberOfSections") <= 1)
    v7 = 0.0;
  else
    v7 = UITableViewAutomaticDimension;

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8Business32MacListPickerTableViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_10009EF0C(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC8Business32MacListPickerTableViewController *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_10009F1E0(v12, (uint64_t)v11, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t);
  Class isa;
  uint64_t v17;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100007D40(&qword_1000ECC88);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v13, 1, 1, v5);
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v13, 1, v5) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v14(v13, v5);
  }
  return isa;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths));
}

@end
