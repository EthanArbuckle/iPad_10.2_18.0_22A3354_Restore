@implementation ProductReviewActionsCell

- (_TtC8AppStore24ProductReviewActionsCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ProductReviewActionsCell *)sub_10015CF6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ProductReviewActionsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10015D45C();
}

- (void)layoutSubviews
{
  _TtC8AppStore24ProductReviewActionsCell *v2;

  v2 = self;
  sub_10015D1FC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_productReviewActionsView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_productReviewActionsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ProductReviewActionsCell_separatorView));
}

@end
