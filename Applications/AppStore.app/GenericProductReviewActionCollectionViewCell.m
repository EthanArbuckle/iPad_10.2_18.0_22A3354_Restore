@implementation GenericProductReviewActionCollectionViewCell

- (void)layoutSubviews
{
  _TtC8AppStore44GenericProductReviewActionCollectionViewCell *v2;

  v2 = self;
  sub_1002A167C();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell(0);
  v2 = v3.receiver;
  -[GenericProductReviewActionCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1002A1664(0);
  sub_1002A1670(0);

}

- (_TtC8AppStore44GenericProductReviewActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_itemLayoutContext;
  v9 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productTapToRateView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productReviewActionsView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell(0);
  return -[GenericProductReviewActionCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore44GenericProductReviewActionCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productTapToRateView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productReviewActionsView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GenericProductReviewActionCollectionViewCell(0);
  return -[GenericProductReviewActionCollectionViewCell initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productTapToRateView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore44GenericProductReviewActionCollectionViewCell_productReviewActionsView));
}

@end
