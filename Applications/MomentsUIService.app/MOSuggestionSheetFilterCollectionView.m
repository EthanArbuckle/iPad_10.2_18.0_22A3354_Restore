@implementation MOSuggestionSheetFilterCollectionView

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)init
{
  return (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *)MOSuggestionSheetFilterCollectionView.init()();
}

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionSheetFilterCollectionView.init(coder:)();
}

- (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *result;

  v4 = a4;
  result = (_TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionSheetFilterCollectionView", 54, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView_layout));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView_filterViewModel));
  outlined destroy of MOSuggestionSheetFilterCollectionViewDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView_filterDelegate);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t (*v5)(void);
  id v6;
  _TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *v7;
  uint64_t v8;
  int64_t v9;

  v5 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x68);
  v6 = a3;
  v7 = self;
  v8 = v5();
  v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 112))(v8);

  swift_release(v8);
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)MOSuggestionSheetFilterCollectionView.collectionView(_:cellForItemAt:)(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGSize result;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  specialized MOSuggestionSheetFilterCollectionView.collectionView(_:layout:sizeForItemAt:)((uint64_t)v9);
  v11 = v10;
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC16MomentsUIService37MOSuggestionSheetFilterCollectionView *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  MOSuggestionSheetFilterCollectionView.collectionView(_:didSelectItemAt:)(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
