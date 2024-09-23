@implementation RadioStationDataSource

- (void)invalidate
{
  uint64_t *v3;
  uint64_t v4;
  _TtC5Media22RadioStationDataSource *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media22RadioStationDataSource_cancelSet);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media22RadioStationDataSource_cancelSet, v9, 1, 0);
  v4 = *v3;
  *v3 = (uint64_t)&_swiftEmptySetSingleton;
  v5 = self;
  swift_bridgeObjectRelease(v4);
  v6 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC5Media22RadioStationDataSource_stationCancelSet);
  swift_beginAccess((char *)v5 + OBJC_IVAR____TtC5Media22RadioStationDataSource_stationCancelSet, &v8, 1, 0);
  v7 = *v6;
  *v6 = (uint64_t)&_swiftEmptySetSingleton;

  swift_bridgeObjectRelease(v7);
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC5Media22RadioStationDataSource *v13;
  uint64_t v14;
  int64_t v15;
  char v16;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media22RadioStationDataSource_sections);
  v12 = a3;
  v13 = self;
  v14 = swift_bridgeObjectRetain(v11);
  v15 = sub_1000512B8(v14, v8, v10);
  LOBYTE(v8) = v16;

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);
  if ((v8 & 1) != 0)
    return a5;
  else
    return v15;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC5Media22RadioStationDataSource *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v6 = a3;
  v7 = self;
  sub_10004C758(a4);
  v9 = v8;

  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v4;
  _TtC5Media22RadioStationDataSource *v5;
  uint64_t v6;
  NSArray v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100051418();

  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC5Media22RadioStationDataSource_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC5Media22RadioStationDataSource *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000514AC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media22RadioStationDataSource *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10004CD38(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC5Media22RadioStationDataSource)init
{
  _TtC5Media22RadioStationDataSource *result;

  result = (_TtC5Media22RadioStationDataSource *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioStationDataSource", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->groupingStrategy[OBJC_IVAR____TtC5Media22RadioStationDataSource_activeCategory]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media22RadioStationDataSource_tableView);
  swift_bridgeObjectRelease(*(_QWORD *)&self->groupingStrategy[OBJC_IVAR____TtC5Media22RadioStationDataSource_emptyTitle]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media22RadioStationDataSource_sections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Media22RadioStationDataSource_cancelSet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Media22RadioStationDataSource_stationCancelSet));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media22RadioStationDataSource_carManager);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media22RadioStationDataSource_currentPlayingStation), v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Media22RadioStationDataSource_currentBandStations));
}

@end
