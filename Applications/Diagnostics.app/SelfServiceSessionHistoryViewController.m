@implementation SelfServiceSessionHistoryViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelfServiceSessionHistoryViewController();
  v2 = v3.receiver;
  -[SelfServiceSessionHistoryViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100043718();
  sub_100043A9C();
  sub_100043C58();

}

- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *result;

  result = (_TtC11Diagnostics39SelfServiceSessionHistoryViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSessionHistoryViewController", 51, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC11Diagnostics39SelfServiceSessionHistoryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *result;

  v6 = a5;
  result = (_TtC11Diagnostics39SelfServiceSessionHistoryViewController *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.SelfServiceSessionHistoryViewController", 51, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  id v7;
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  id v15;
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *v16;
  uint64_t v17;

  v6 = *(void **)(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC11Diagnostics39SelfServiceSessionHistoryViewController_suiteManager]
                + OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState);
  if (v6)
  {
    v7 = a3;
    v8 = self;
    v9 = objc_msgSend(v6, "history");
    v10 = sub_100037118(0, &qword_10016E1A0, &off_100131AA0);
    v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    v12 = sub_100044A04(v11);
    if (!((unint64_t)v12 >> 62))
    {
LABEL_3:
      v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);

      goto LABEL_4;
    }
  }
  else
  {
    v15 = a3;
    v16 = self;
    v12 = (uint64_t)_swiftEmptyArrayStorage;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
      goto LABEL_3;
  }
  if (v12 < 0)
    v17 = v12;
  else
    v17 = v12 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v12);
  v13 = _CocoaArrayWrapper.endIndex.getter(v17);

  swift_bridgeObjectRelease(v12);
LABEL_4:
  swift_bridgeObjectRelease(v12);

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *v12;
  char *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100044478(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics39SelfServiceSessionHistoryViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100044C1C(v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
