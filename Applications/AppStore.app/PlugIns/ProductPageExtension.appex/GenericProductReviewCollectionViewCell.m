@implementation GenericProductReviewCollectionViewCell

- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *)sub_10012D998(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/GenericProductReviewCollectionViewCell.swift", 65, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_10012DCA4();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_10012DE7C();

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView));
}

@end
