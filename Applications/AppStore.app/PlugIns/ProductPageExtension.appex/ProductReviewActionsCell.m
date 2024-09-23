@implementation ProductReviewActionsCell

- (_TtC20ProductPageExtension24ProductReviewActionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24ProductReviewActionsCell *)sub_100564DC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24ProductReviewActionsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005652B8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24ProductReviewActionsCell *v2;

  v2 = self;
  sub_100565058();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsCell_productReviewActionsView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsCell_productReviewActionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsCell_separatorView));
}

@end
