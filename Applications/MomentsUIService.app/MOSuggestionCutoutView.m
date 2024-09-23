@implementation MOSuggestionCutoutView

- (_TtC16MomentsUIService22MOSuggestionCutoutView)init
{
  return (_TtC16MomentsUIService22MOSuggestionCutoutView *)MOSuggestionCutoutView.init()();
}

- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MomentsUIService22MOSuggestionCutoutView *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService22MOSuggestionCutoutView_fillLayer;
  v6 = objc_allocWithZone((Class)CAShapeLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MomentsUIService22MOSuggestionCutoutView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionInterstitialListAssetView.swift", 60, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MomentsUIService22MOSuggestionCutoutView *v2;

  v2 = self;
  MOSuggestionCutoutView.layoutSubviews()();

}

- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionCutoutView", 39);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService22MOSuggestionCutoutView_fillLayer));
}

@end
