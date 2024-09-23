@implementation HistoryTableViewController

- (_TtC11Diagnostics26HistoryTableViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D6D20();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC11Diagnostics26HistoryTableViewController *v4;

  v4 = self;
  sub_1000D5D38(a3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntriesRendered);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  DARootViewController *v10;
  id v11;
  _TtC11Diagnostics26HistoryTableViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (DARootViewController *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000D5E48(v11, v10);
  v14 = v13;

  (*(void (**)(DARootViewController *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (_TtC11Diagnostics26HistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11Diagnostics26HistoryTableViewController *result;

  v4 = a4;
  result = (_TtC11Diagnostics26HistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.HistoryTableViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_state));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_historyEntries));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_deviceStateChangedObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26HistoryTableViewController_noHistoryView));
}

- (void)donePressed
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  SEL v24;
  id v25;
  int v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v0 = (void *)qword_10016B3C0;
  if (qword_10016B3C0)
  {
    v1 = type metadata accessor for SelfServiceDestinationPickerViewController();
    if (!swift_dynamicCastClass(v0, v1))
    {
      v22 = v0;
      goto LABEL_20;
    }
  }
  if (qword_10016A600 != -1)
    swift_once(&qword_10016A600, sub_1000490B8);
  v2 = objc_msgSend((id)qword_100172310, "viewControllers");
  v3 = sub_100037118(0, (unint64_t *)&qword_10016C200, UIViewController_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  if (!((unint64_t)v4 >> 62))
  {
    v12 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_7;
LABEL_18:
    swift_bridgeObjectRelease((DARootViewController *)v4, v5, v6, v7, v8, v9, v10, v11);
    if (qword_10016A5F8 == -1)
    {
LABEL_19:
      v22 = (id)qword_100172300;
      goto LABEL_20;
    }
LABEL_25:
    swift_once(&qword_10016A5F8, sub_100048E78);
    goto LABEL_19;
  }
  if (v4 < 0)
    v23 = v4;
  else
    v23 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  v12 = _CocoaArrayWrapper.endIndex.getter(v23);
  swift_bridgeObjectRelease((DARootViewController *)v4, v24, v25, v26, v27, v28, v29, v30);
  if (!v12)
    goto LABEL_18;
LABEL_7:
  v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_22;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_22:
    v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v4);
    goto LABEL_12;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v13 >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v14 = *(id *)(v4 + 8 * v13 + 32);
LABEL_12:
  v31 = v14;
  swift_bridgeObjectRelease((DARootViewController *)v4, v15, v16, v17, v18, v19, v20, v21);
  v22 = v31;
LABEL_20:
  v32 = v22;
  objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
