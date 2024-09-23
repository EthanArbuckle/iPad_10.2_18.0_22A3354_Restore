@implementation MOSuggestionSheetAssetView

- (_TtC16MomentsUIService26MOSuggestionSheetAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService26MOSuggestionSheetAssetView *)MOSuggestionSheetAssetView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService26MOSuggestionSheetAssetView)initWithCoder:(id)a3
{
  id v5;
  _TtC16MomentsUIService26MOSuggestionSheetAssetView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionSheetAssetView_currentSizeType) = 3;
  *(_QWORD *)&self->currentSizeType[OBJC_IVAR____TtC16MomentsUIService26MOSuggestionSheetAssetView_delegate] = 0;
  swift_unknownObjectWeakInit();
  swift_weakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionSheetAssetView_assetViewModel, 0);
  v5 = a3;

  result = (_TtC16MomentsUIService26MOSuggestionSheetAssetView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetAssetView.swift", 49, 2, 40, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionSheetAssetView_delegate);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService26MOSuggestionSheetAssetView_assetViewModel);
}

@end
