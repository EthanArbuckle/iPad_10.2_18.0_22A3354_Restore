@implementation MOSuggestionInterstitialCarouselView

- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionInterstitialCarouselView.init(coder:)();
}

- (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *result;

  result = (_TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionInterstitialCarouselView", 53, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_collectionView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_assetViewModels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_denySelectionList));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_selectedAssetIdentifiers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_containerViewBottomConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_pageControlConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_pageControl));
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_controller);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService36MOSuggestionInterstitialCarouselView_queue));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)UIView.userInteractionEnabled(_:)(0);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = (id)UIView.userInteractionEnabled(_:)(1);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  MOSuggestionInterstitialCarouselView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, (uint64_t *)a5, x);

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
  _TtC16MomentsUIService36MOSuggestionInterstitialCarouselView *v20;
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
  specialized MOSuggestionInterstitialCarouselView.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)(v19, v15, v17, (uint64_t)v14);

  v21 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v21);
}

@end
