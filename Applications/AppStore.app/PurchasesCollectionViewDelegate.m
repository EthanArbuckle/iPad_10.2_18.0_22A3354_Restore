@implementation PurchasesCollectionViewDelegate

- (void)scrollViewDidScroll:(id)a3
{
  void (*v3)(id);
  uint64_t v5;
  id v6;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v7;

  v3 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler];
    v6 = a3;
    v7 = self;
    sub_10003A340((uint64_t)v3, v5);
    v3(v6);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  char *v14;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = (char *)a4;
  v15 = self;
  sub_1002C52B0(v13, v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v17;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_artworkLoader);
  v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  v15 = a3;
  v16 = a4;
  v17 = self;
  sub_1005F1784(v16, (uint64_t)v12, v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v11;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v12;
  Class isa;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v14;
  uint64_t v15;
  uint64_t ObjectType;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v17;
  BOOL v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (_TtC8AppStore31PurchasesCollectionViewDelegate *)a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = (_TtC8AppStore31PurchasesCollectionViewDelegate *)-[PurchasesCollectionViewDelegate cellForItemAtIndexPath:](v11, "cellForItemAtIndexPath:", isa);

  if (v14)
  {
    ObjectType = swift_getObjectType(v14, v15);
    if (swift_conformsToProtocol2(ObjectType, &protocol descriptor for ComponentContainerView))
      v17 = v14;
    else
      v17 = 0;
    v18 = v17 == 0;

    v11 = v12;
    v12 = v14;
  }
  else
  {
    v18 = 0;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  id v12;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (objc_class *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  v12 = a3;
  v13 = self;
  sub_1002C4E5C((uint64_t)v10, v10, v11, v12);

  (*(void (**)(objc_class *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC8AppStore31PurchasesCollectionViewDelegate)init
{
  _TtC8AppStore31PurchasesCollectionViewDelegate *result;

  result = (_TtC8AppStore31PurchasesCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PurchasesCollectionViewDelegate", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_artworkLoader));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_pageTraits));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_shelfDataSource));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_presenter));
  sub_10003A350(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler), *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler]);
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v11;
  double v12;
  double v13;

  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_pageTraits);
  v9 = a3;
  v10 = a4;
  v11 = self;
  swift_unknownObjectRetain(v8);
  sub_1005E58E8(a5, v8, v9);
  v13 = v12;

  swift_unknownObjectRelease(v8);
  return v13;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v17;
  __n128 v18;
  double v19;
  double v20;
  __n128 v21;
  uint64_t v23;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  v14 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_pageTraits);
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = swift_unknownObjectRetain(v14);
  sub_1005E817C((uint64_t)v12, v13, v14, v15, v18);
  v20 = v19;

  v21 = swift_unknownObjectRelease(v14);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v21);
  return v20;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8AppStore31PurchasesCollectionViewDelegate *v15;
  id v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_1002C5E98((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

@end
