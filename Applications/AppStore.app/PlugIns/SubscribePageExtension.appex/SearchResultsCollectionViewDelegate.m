@implementation SearchResultsCollectionViewDelegate

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_1000C6084(v7);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = sub_1000C6B40(v14, (uint64_t)v12);
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  unint64_t v5;
  unint64_t v6;
  NSDictionary v7;

  v5 = sub_1000C6CAC();
  if (v5)
  {
    v6 = v5;
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_10023DBB4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, char *))sub_10035A4C8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_10023DBB4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, char *))sub_10035B850);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  dispatch thunk of SearchResultsPresenter.didSelectResult(at:)(v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *v20;
  __n128 v21;
  uint64_t v22;

  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v18 = a3;
  v19 = a4;
  v20 = self;
  sub_1003625C4(v19, v15, v17);

  v21 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v21);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  type metadata accessor for SearchTransparencyView();
  v18 = a3;
  v19 = a4;
  v20 = self;
  v22 = static UICollectionReusableView.elementKind.getter();
  v23 = v21;
  if (v15 == v22 && v17 == v21)
  {
    v24 = swift_bridgeObjectRelease(v17);
  }
  else
  {
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v22, v21, 0);
    v24 = swift_bridgeObjectRelease(v23);
    if ((v25 & 1) == 0)
    {
LABEL_7:

      swift_bridgeObjectRelease(v17);
      goto LABEL_8;
    }
  }
  v26 = dispatch thunk of SearchResultsPresenter.transparencyLink.getter(v24);
  if (!v26)
    goto LABEL_7;
  v27 = v26;
  sub_10035E98C(v26, (uint64_t)v20);

  swift_bridgeObjectRelease(v17);
  swift_release(v27);
LABEL_8:

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_compoundScrollObserver), "scrollViewWillBeginDecelerating:", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_compoundScrollObserver), "scrollViewDidEndDecelerating:", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_compoundScrollObserver), "scrollViewDidScroll:", a3);
}

- (_TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate)init
{
  _TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *result;

  result = (_TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.SearchResultsCollectionViewDelegate", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_presenter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_objectGraph));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_artworkLoader));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_artworkIconFetcher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_impressionsCalculator));
  sub_100011088((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_containerImpressionMetrics, (uint64_t *)&unk_1007F7740);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_pageTraits));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_maxSizeForRowCache));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_infiniteScrollObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_videoPlaybackCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_advertRotationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35SearchResultsCollectionViewDelegate_compoundScrollObserver));
}

@end
