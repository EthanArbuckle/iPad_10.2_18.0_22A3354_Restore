@implementation MOSuggestionInterstitialExpandableListView

- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionInterstitialExpandableListView.init(coder:)();
}

- (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView *result;

  result = (_TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionInterstitialExpandableListView", 59, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_collectionView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_assetViewModels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_selectedAssetIdentifiers));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_controller);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView_queue));
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MomentsUIService42MOSuggestionInterstitialExpandableListView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  specialized MOSuggestionInterstitialExpandableListView.collectionView(_:willDisplay:forItemAt:)(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end
