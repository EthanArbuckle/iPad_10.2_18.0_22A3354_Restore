@implementation MOSuggestionInterstitialSupplementaryCheckmarkView

- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView *)specialized MOSuggestionInterstitialSupplementaryCheckmarkView.init(frame:)();
}

- (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView *result;

  v4 = OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_checkmarkView;
  v5 = one-time initialization token for CHECK_PLATTER_VIEW_SIZE;
  v6 = a3;
  if (v5 != -1)
    swift_once(&one-time initialization token for CHECK_PLATTER_VIEW_SIZE, one-time initialization function for CHECK_PLATTER_VIEW_SIZE);
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MOSuggestionInterstitialCarouselCheckMarkView()), "initWithFrame:", 0.0, 0.0, static MOSuggestionInterstitialCarouselViewConstants.CHECK_PLATTER_VIEW_SIZE);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_keyColor) = 0;

  result = (_TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionInterstitialSupplementaryCheckmarkView.swift", 73, 2, 31, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_checkmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService50MOSuggestionInterstitialSupplementaryCheckmarkView_keyColor));
}

@end
