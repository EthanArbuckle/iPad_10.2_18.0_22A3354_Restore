@implementation RadioFavoritesViewController

- (_TtC5Media28RadioFavoritesViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000289F8();
}

- (void)viewDidLayoutSubviews
{
  _TtC5Media28RadioFavoritesViewController *v2;

  v2 = self;
  sub_100024DF8();

}

- (void)viewDidLoad
{
  _TtC5Media28RadioFavoritesViewController *v2;

  v2 = self;
  sub_100025038();

}

- (void)invalidate
{
  uint64_t *v3;
  uint64_t v4;
  _TtC5Media28RadioFavoritesViewController *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _BYTE v10[24];
  _BYTE v11[24];
  _BYTE v12[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_cancelSet);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_cancelSet, v12, 1, 0);
  v4 = *v3;
  *v3 = (uint64_t)&_swiftEmptySetSingleton;
  v5 = self;
  swift_bridgeObjectRelease(v4);
  v6 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesCancelSet);
  swift_beginAccess((char *)v5 + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesCancelSet, v11, 1, 0);
  v7 = *v6;
  *v6 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v7);
  v8 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesObserverSet);
  swift_beginAccess((char *)v5 + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesObserverSet, v10, 1, 0);
  v9 = *v8;
  *v8 = (uint64_t)&_swiftEmptySetSingleton;

  swift_bridgeObjectRelease(v9);
}

- (void)longPressGestureChangedWithGesture:(id)a3
{
  id v4;
  _TtC5Media28RadioFavoritesViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10002699C(v4);

}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t);
  Class isa;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v22 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v22 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  v19(v16, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v19(v18, v9);
  return isa;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media28RadioFavoritesViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100028B7C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media28RadioFavoritesViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_100028CAC();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC5Media28RadioFavoritesViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_100028E54((uint64_t)v15, (uint64_t)v13);

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 16.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7;
  id v8;
  id v9;
  _TtC5Media28RadioFavoritesViewController *v10;
  unsigned __int128 v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v7 = qword_1000A08D8;
  v8 = a3;
  v9 = a4;
  v10 = self;
  if (v7 != -1)
    swift_once(&qword_1000A08D8, sub_100024658);
  v11 = xmmword_1000A62C0;
  v12 = qword_1000A62D0;
  v13 = qword_1000A62D8;

  *(_QWORD *)&v15 = v11 >> 64;
  *(_QWORD *)&v14 = v11;
  v16 = *(double *)&v12;
  v17 = *(double *)&v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 12.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  CGSize result;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_itemSize);
  v12 = *(double *)&self->carManager[OBJC_IVAR____TtC5Media28RadioFavoritesViewController_itemSize];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v10;
  id v11;
  _TtC5Media28RadioFavoritesViewController *v12;
  _BYTE v13[24];

  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favorites);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favorites, v13, 0, 0);
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

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Media28RadioFavoritesViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100027380(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (_TtC5Media28RadioFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC5Media28RadioFavoritesViewController *result;

  v4 = a4;
  result = (_TtC5Media28RadioFavoritesViewController *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioFavoritesViewController", 34, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_carManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_emptyLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_cancelSet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favorites));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesCancelSet));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesObserverSet));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_longPressRecognizer));
  swift_release(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Media28RadioFavoritesViewController_currentPlayingStation), v3);
}

@end
