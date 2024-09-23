@implementation MOSuggestionCarouselView

- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCarouselView.init(coder:)();
}

- (_TtC16MomentsUIService24MOSuggestionCarouselView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService24MOSuggestionCarouselView *result;

  result = (_TtC16MomentsUIService24MOSuggestionCarouselView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionCarouselView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_pageControl));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_assetViewModels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_selectedAssetIdentifiers));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService24MOSuggestionCarouselView_controller);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t (*v5)(void);
  id v6;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xB0);
  v6 = a3;
  v7 = self;
  v8 = v5();
  v9 = v8;
  if ((unint64_t)v8 >> 62)
  {
    if (v8 >= 0)
      v8 &= 0xFFFFFFFFFFFFFF8uLL;
    v10 = _CocoaArrayWrapper.endIndex.getter(v8);
  }
  else
  {
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease(v9);
  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  MOSuggestionCarouselView.collectionView(_:cellForItemAt:)(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  MOSuggestionCarouselView.collectionView(_:willDisplay:forItemAt:)(v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  @objc MOSuggestionSheetAssetGridView.collectionView(_:didSelectItemAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))specialized MOSuggestionCarouselView.collectionView(_:didSelectItemAt:));
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  @objc MOSuggestionSheetAssetGridView.collectionView(_:didSelectItemAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))specialized MOSuggestionCarouselView.collectionView(_:didDeselectItemAt:));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  CGSize result;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = objc_opt_self(UICollectionViewFlowLayout);
  v14 = (void *)swift_dynamicCastObjCClass(a4, v13);
  v15 = a4;
  v16 = v15;
  if (v14)
  {
    v17 = v15;
    v18 = a3;
    v19 = self;
    objc_msgSend(v14, "minimumInteritemSpacing");
    v21 = v20;
    objc_msgSend(v14, "sectionInset");
    v23 = v21 + v22;
  }
  else
  {
    v24 = a3;
    v25 = self;
    v23 = 0.0;
  }
  objc_msgSend(a3, "frame");
  v27 = v26;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v28 = v27 - v23 + -40.0;
  v29 = v28;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC16MomentsUIService24MOSuggestionCarouselView *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  MOSuggestionCarouselView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, &a5->x, x);

}

@end
