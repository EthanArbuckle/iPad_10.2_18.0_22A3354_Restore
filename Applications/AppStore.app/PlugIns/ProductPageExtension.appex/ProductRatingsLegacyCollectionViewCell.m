@implementation ProductRatingsLegacyCollectionViewCell

- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *)sub_1002D2338(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageTraits) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid;
  v8 = type metadata accessor for PageGrid(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_hasRatings) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView) = 0;
  v9 = a3;

  result = (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductRatingsLegacyCollectionViewCell.swift", 65, 2, 132, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *v2;

  v2 = self;
  sub_1002D37F8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1002D3B7C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  _TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *v2;

  v2 = self;
  sub_1002D3FE0();

}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
}

- (NSArray)accessibilityStarViews
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_starViews);
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
                  + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_progressBarViews);
  sub_100018B6C(0, (unint64_t *)&unk_10081A470, UIProgressView_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_starViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_progressBarViews));
  swift_unknownObjectRelease();
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid, &qword_10082AF10);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView));
}

@end
