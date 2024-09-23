@implementation ProductReviewCollectionViewCell

- (_TtC20ProductPageExtension31ProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31ProductReviewCollectionViewCell *)sub_1002B6BA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31ProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC20ProductPageExtension31ProductReviewCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView;
  v8 = type metadata accessor for ProductReviewView();
  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8));
  v10 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v9, "init");

  result = (_TtC20ProductPageExtension31ProductReviewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ProductReviewCollectionViewCell.swift", 58, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31ProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_1002B6F64();

}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31ProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_1002B7030();

}

- (void)moreReviewFrom:(id)a3
{
  sub_1002B7160((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreReviewTapHandler);
}

- (void)moreResponseFrom:(id)a3
{
  sub_1002B7160((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_moreResponseTapHandler);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDateLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_dateLabel));
}

- (_TtC20ProductPageExtension10RatingView)accessibilityRatingView
{
  return (_TtC20ProductPageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_ratingView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityAuthorLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_authorLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityBodyLabel
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView) + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_bodyLabel);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityResponseTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseTitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityResponseDateLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView)
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseDateLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityResponseBodyLabel
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)(*(char **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView) + OBJC_IVAR____TtC20ProductPageExtension17ProductReviewView_responseBodyLabel);
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ProductReviewCollectionViewCell_reviewsView));
}

@end
