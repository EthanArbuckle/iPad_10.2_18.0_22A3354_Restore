@implementation MOSuggestionCollectionView

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v8;

  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xF8);
  v5 = a3;
  v8 = self;
  v6 = v4();
  if (v6)
  {
    v7 = v6;
    MOSuggestionCollectionViewModel.initiateAuthentication()();

    swift_release(v7);
  }
  else
  {

  }
}

- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCollectionView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC16MomentsUIService26MOSuggestionCollectionView *v2;

  v2 = self;
  MOSuggestionCollectionView.layoutSubviews()();

}

- (_TtC16MomentsUIService26MOSuggestionCollectionView)initWithFrame:(CGRect)a3
{
  _TtC16MomentsUIService26MOSuggestionCollectionView *result;

  result = (_TtC16MomentsUIService26MOSuggestionCollectionView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionCollectionView", 43, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_suggestionCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_onboardingManager));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_engagementWriter));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_controller);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_presentationDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_dialogDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_segmentedVisibilityDelegate);
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_newEntryHeaderDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_options));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_privacyBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_privacyBadgeTopConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_tipCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_protectedContentShield));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionCollectionView_supportingLoadingTextLabel));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t (*v6)(void);
  id v7;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;

  v6 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xF8);
  v7 = a3;
  v8 = self;
  v9 = v6();
  if (v9)
  {
    v10 = v9;
    v11 = (*(uint64_t (**)(int64_t))(*(_QWORD *)v9 + 600))(a4);

    swift_release(v10);
    return v11;
  }
  else
  {

    return 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = MOSuggestionCollectionView.collectionView(_:cellForItemAt:)((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xF8);
  v5 = a3;
  v6 = self;
  v7 = v4();
  if (v7)
  {
    v8 = v7;
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 608))(v7);

    swift_release(v8);
    return v9;
  }
  else
  {

    return 1;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(void);
  void *v14;
  void *v15;
  id v16;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v17;
  _QWORD *v18;
  __n128 v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = MOSuggestionCollectionView.collectionView(_:viewForSupplementaryElementOfKind:at:)(v16, v13, v15, (uint64_t)v12);

  v19 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  specialized MOSuggestionCollectionView.collectionView(_:didSelectItemAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v15;
  CGFloat v16;
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
  v16 = MOSuggestionCollectionView.collectionView(_:layout:sizeForItemAt:)((uint64_t)v13, v14, (uint64_t)v12);
  v18 = v17;

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8;
  id v9;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = specialized MOSuggestionCollectionView.collectionView(_:layout:referenceSizeForHeaderInSection:)(v8, a5);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  uint64_t (*v8)(void);
  id v9;
  id v10;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  CGSize result;

  v8 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xF8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = v8();
  if (v12)
  {
    v13 = v12;
    if (((*(uint64_t (**)(int64_t))(*(_QWORD *)v12 + 656))(a5) & 1) != 0)
    {
      objc_msgSend(v9, "frame");
      width = v14;

      swift_release(v13);
      height = 80.0;
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;

      swift_release(v13);
    }
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;

  }
  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v10;
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
  double v21;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = specialized MOSuggestionCollectionView.collectionView(_:layout:insetForSectionAt:)(v9, a5);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
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
  _TtC16MomentsUIService26MOSuggestionCollectionView *v20;
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
  specialized MOSuggestionCollectionView.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:)(v19, v15, v17);

  v21 = swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v21);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = specialized MOSuggestionCollectionView.collectionView(_:contextMenuConfigurationForItemAt:point:)((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  specialized MOSuggestionCollectionView.collectionView(_:didEndDisplaying:forItemAt:)((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC16MomentsUIService26MOSuggestionCollectionView *v6;

  v4 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x248);
  v5 = a3;
  v6 = self;
  v4();

}

@end
