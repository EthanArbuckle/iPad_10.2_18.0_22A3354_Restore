@implementation GenericProductReviewCollectionViewCell

- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *)sub_100035A54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/GenericProductReviewCollectionViewCell.swift", 67, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_100035D60();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_100035F38();

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38GenericProductReviewCollectionViewCell_reviewSummaryView));
}

@end
