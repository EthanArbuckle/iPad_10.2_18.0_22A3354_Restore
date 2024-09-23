@implementation MOSuggestionSheetAssetGridView

- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView *)MOSuggestionSheetAssetGridView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService30MOSuggestionSheetAssetGridView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetAssetGridView.init(coder:)();
}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionSheetAssetGridView();
  v2 = v4.receiver;
  v3 = -[MOSuggestionSheetAssetGridView layoutSubviews](&v4, "layoutSubviews");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x1E8))(v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_gridCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_mosaicLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_addedView));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_delegate);
  outlined consume of MOWeakArray<MOSuggestionSheetAssetViewModel>?(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_assetViewModels), *(_QWORD *)&self->gridCollectionView[OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_assetViewModels]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionSheetAssetGridView_selectedAssetIdentifiers));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t (*v5)(void);
  id v6;
  _TtC16MomentsUIService30MOSuggestionSheetAssetGridView *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v16;

  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x150);
  v6 = a3;
  v7 = self;
  v8 = v5();
  if (v8)
  {
    v10 = v8;
    v11 = v9;
    if ((unint64_t)v8 >> 62)
    {
      if (v8 >= 0)
        v16 = v8 & 0xFFFFFFFFFFFFFF8;
      else
        v16 = v8;
      swift_bridgeObjectRetain(v8);
      v12 = _CocoaArrayWrapper.endIndex.getter(v16);
      swift_bridgeObjectRelease(v10);
    }
    else
    {
      v12 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v10);
    v13 = swift_bridgeObjectRelease(v11);
    v14 = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v7->super.super.super.isa) + 0x1F8))(v13);

    if (v14 >= v12)
      return v12;
    else
      return v14;
  }
  else
  {

    return 0;
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(void);
  id v16;
  id v17;
  _TtC16MomentsUIService30MOSuggestionSheetAssetGridView *v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for MOSuggestionSheetMosaicCell();
  v14 = (_QWORD *)swift_dynamicCastClass(a4, v13);
  if (v14)
  {
    v15 = *(void (**)(void))((swift_isaMask & *v14) + 0x170);
    v16 = a3;
    v17 = a4;
    v18 = self;
    v15();

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  _TtC16MomentsUIService30MOSuggestionSheetAssetGridView *v12;
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
  MOSuggestionSheetAssetGridView.collectionView(_:cellForItemAt:)(v11, (uint64_t)v10);
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
  _TtC16MomentsUIService30MOSuggestionSheetAssetGridView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  MOSuggestionSheetAssetGridView.collectionView(_:willDisplay:forItemAt:)(v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  @objc MOSuggestionSheetAssetGridView.collectionView(_:didSelectItemAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))specialized MOSuggestionSheetAssetGridView.collectionView(_:didSelectItemAt:));
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  @objc MOSuggestionSheetAssetGridView.collectionView(_:didSelectItemAt:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))specialized MOSuggestionSheetAssetGridView.collectionView(_:didDeselectItemAt:));
}

@end
