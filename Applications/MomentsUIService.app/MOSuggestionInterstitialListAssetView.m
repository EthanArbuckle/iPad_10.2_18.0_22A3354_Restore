@implementation MOSuggestionInterstitialListAssetView

- (_TtC16MomentsUIService37MOSuggestionInterstitialListAssetView)init
{
  _TtC16MomentsUIService37MOSuggestionInterstitialListAssetView *v2;
  objc_super v4;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionInterstitialListAssetView_shouldBeRounded) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionInterstitialListAssetView();
  v2 = -[MOSuggestionInterstitialListAssetView initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[MOSuggestionInterstitialListAssetView _setCornerRadius:](v2, "_setCornerRadius:", 7.0);
  -[MOSuggestionInterstitialListAssetView setClipsToBounds:](v2, "setClipsToBounds:", 1);

  return v2;
}

- (_TtC16MomentsUIService37MOSuggestionInterstitialListAssetView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MomentsUIService37MOSuggestionInterstitialListAssetView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MomentsUIService37MOSuggestionInterstitialListAssetView_shouldBeRounded) = 0;
  v4 = a3;

  result = (_TtC16MomentsUIService37MOSuggestionInterstitialListAssetView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionInterstitialListAssetView.swift", 60, 2, 303, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService37MOSuggestionInterstitialListAssetView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionInterstitialListAssetView", 54);
}

@end
