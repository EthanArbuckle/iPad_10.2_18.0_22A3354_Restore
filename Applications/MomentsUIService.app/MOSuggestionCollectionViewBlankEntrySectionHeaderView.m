@implementation MOSuggestionCollectionViewBlankEntrySectionHeaderView

- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView *)MOSuggestionCollectionViewBlankEntrySectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MOSuggestionCollectionViewBlankEntrySectionHeaderView.init(coder:)();
}

- (void)pressedSegmentControl
{
  _TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView *v2;

  v2 = self;
  MOSuggestionCollectionViewBlankEntrySectionHeaderView.pressedSegmentControl()();

}

- (void)pressedNewEntryButton
{
  _TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView *v2;

  v2 = self;
  MOSuggestionCollectionViewBlankEntrySectionHeaderView.pressedNewEntryButton()();

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_segmentedDelegate));
  outlined destroy of MOSuggestionSheetNewEntryButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_newEntryDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_suggestionSegmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_newEntryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_privacyTipView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_privacyTipModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_stateOfMindTipView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_stateOfMindTipModel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_layoutConstrains));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_privacyTipConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_stateOfMindTipConstraints));
}

@end
