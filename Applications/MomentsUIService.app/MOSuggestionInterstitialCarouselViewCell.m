@implementation MOSuggestionInterstitialCarouselViewCell

- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell *)specialized MOSuggestionInterstitialCarouselViewCell.init(frame:)();
}

- (_TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionInterstitialCarouselViewCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_assetView));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_blockUserInteraction), *(_QWORD *)&self->assetView[OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_blockUserInteraction]);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_unBlockUserInteraction), *(_QWORD *)&self->assetView[OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_unBlockUserInteraction]);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_assetViewModel);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOSuggestionInterstitialCarouselViewCell();
  v2 = (char *)v4.receiver;
  -[MOSuggestionInterstitialCarouselViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MomentsUIService40MOSuggestionInterstitialCarouselViewCell_assetView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

@end
