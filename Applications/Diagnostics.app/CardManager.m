@implementation CardManager

- (_TtC11Diagnostics11CardManager)init
{
  return (_TtC11Diagnostics11CardManager *)sub_1000E1D68();
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter);
  swift_bridgeObjectRelease(*(_QWORD *)&self->cardFilter[OBJC_IVAR____TtC11Diagnostics11CardManager_cardFilter]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_cardsInView));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_deviceManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11Diagnostics11CardManager_bySerialNumber));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_cardStates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_cardCells));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11Diagnostics11CardManager_changeQueue));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics11CardManager *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000E5528(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC11Diagnostics11CardManager *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000E9634(a4);

  return v8;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC11Diagnostics11CardManager *v12;
  DARootViewController *v13;
  DARootViewController *v14;
  NSString v15;
  SEL v16;
  id v17;
  int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = self;
  sub_1000E96E8((uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (!v14)
    return 0;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14, v16, v17, v18, v19, v20, v21, v22);
  return v15;
}

- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  DARootViewController *v11;
  DARootViewController *v12;
  id v13;
  _TtC11Diagnostics11CardManager *v14;
  SEL v15;
  id v16;
  int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  Class isa;
  uint64_t v26;

  v7 = sub_100035CA4(&qword_10016E560);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = a4;
  v14 = self;
  sub_1000E5974(v10, v12, (uint64_t)v9);

  swift_bridgeObjectRelease(v12, v15, v16, v17, v18, v19, v20, v21);
  v22 = type metadata accessor for IndexPath(0);
  v23 = *(_QWORD *)(v22 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v9, 1, v22) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v22);
  }
  return isa;
}

@end
