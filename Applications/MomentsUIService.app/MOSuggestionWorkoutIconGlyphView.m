@implementation MOSuggestionWorkoutIconGlyphView

- (void)layoutSubviews
{
  _TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView *v2;
  double v3;
  id v4;
  id v5;

  v2 = self;
  -[MOSuggestionWorkoutIconGlyphView bounds](v2, "bounds");
  v4 = -[MOSuggestionWorkoutIconGlyphView _setCornerRadius:](v2, "_setCornerRadius:", v3 * 0.5);
  v5 = (id)(*(uint64_t (**)(id))((swift_isaMask & (uint64_t)v2->super.super.super.isa) + 0x58))(v4);
  MOSuggestionInterstitialExpandableListViewCellConstants.init()();
  objc_msgSend(v5, "setFrame:");

}

- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_iconView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionActivityIconAssetView.swift", 56, 2, 103, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.MOSuggestionWorkoutIconGlyphView", 49);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_iconView));
}

@end
