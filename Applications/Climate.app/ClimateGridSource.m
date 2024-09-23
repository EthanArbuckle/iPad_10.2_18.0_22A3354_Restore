@implementation ClimateGridSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  id v8;
  _TtC7Climate17ClimateGridSource *v9;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate17ClimateGridSource_viewableSettingItems);
  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate17ClimateGridSource_viewableSettingItems);
    else
      v7 = v3 & 0xFFFFFFFFFFFFFF8;
    v8 = a3;
    v9 = self;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v7);

    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v4)
    return 2;
  else
    return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC7Climate17ClimateGridSource *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000116E8(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Climate17ClimateGridSource *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_10000E764(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC7Climate17ClimateGridSource)init
{
  _TtC7Climate17ClimateGridSource *result;

  result = (_TtC7Climate17ClimateGridSource *)_swift_stdlib_reportUnimplementedInitializer("Climate.ClimateGridSource", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate17ClimateGridSource_flowItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate17ClimateGridSource_surfaceItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7Climate17ClimateGridSource_viewableSettingItems));
  sub_100011920(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache), *(_QWORD *)&self->flowItems[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache], *(_QWORD *)&self->surfaceItems[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache], *(_QWORD *)&self->viewableSettingItems[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache], *(_QWORD *)&self->settingsCache[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache], *(_QWORD *)&self->settingsCache[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache + 8], *(_QWORD *)&self->settingsCache[OBJC_IVAR____TtC7Climate17ClimateGridSource_settingsCache + 16]);

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Climate17ClimateGridSource_climateGrid);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7Climate17ClimateGridSource_navigationController);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Climate17ClimateGridSource *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10000FA2C(v11, (uint64_t)v10, v13);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = IndexPath.section.getter(v9) == 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (char)a4;
}

@end
