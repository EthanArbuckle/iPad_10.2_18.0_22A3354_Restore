@implementation GenericProductReviewCollectionViewCell

- (_TtC8AppStore38GenericProductReviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38GenericProductReviewCollectionViewCell *)sub_10063C778(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore38GenericProductReviewCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore38GenericProductReviewCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_userReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_editorsChoiceReviewView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_reviewSummaryView) = 0;
  v7 = a3;

  result = (_TtC8AppStore38GenericProductReviewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GenericProductReviewCollectionViewCell.swift", 53, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_10063CA84();

}

- (void)prepareForReuse
{
  _TtC8AppStore38GenericProductReviewCollectionViewCell *v2;

  v2 = self;
  sub_10063CC5C();

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_userReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_editorsChoiceReviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38GenericProductReviewCollectionViewCell_reviewSummaryView));
}

@end
