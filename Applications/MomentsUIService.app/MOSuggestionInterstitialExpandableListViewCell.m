@implementation MOSuggestionInterstitialExpandableListViewCell

- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell *)MOSuggestionInterstitialExpandableListViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionInterstitialExpandableListViewCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_stackView));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_didToggle), *(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_didToggle]);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_keyColor);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_assetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_checkmarkView));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell_viewModel);
}

- (void)didTapCheckmark
{
  _TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell *v2;

  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.didTapCheckmark()();

}

- (void)handleTraitChange
{
  _TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell *v2;

  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.handleTraitChange()();

}

- (void)prepareForReuse
{
  _TtC16MomentsUIService46MOSuggestionInterstitialExpandableListViewCell *v2;

  v2 = self;
  MOSuggestionInterstitialExpandableListViewCell.prepareForReuse()();

}

@end
