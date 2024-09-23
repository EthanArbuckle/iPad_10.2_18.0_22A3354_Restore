@implementation ProductRatingsLegacyCollectionViewCell

- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *)sub_10023F144(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageTraits) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid;
  v8 = type metadata accessor for PageGrid(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_hasRatings) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView) = 0;
  v9 = a3;

  result = (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductRatingsLegacyCollectionViewCell.swift", 67, 2, 132, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *v2;

  v2 = self;
  sub_100240604();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100240988(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *v2;

  v2 = self;
  sub_100240DEC();

}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
}

- (NSArray)accessibilityStarViews
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_starViews);
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSArray)accessibilityProgressBarViews
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_progressBarViews);
  sub_100019574(0, &qword_100802A90, UIProgressView_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_progressBarViews));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageTraits));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid, &qword_1008027B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView));
}

@end
