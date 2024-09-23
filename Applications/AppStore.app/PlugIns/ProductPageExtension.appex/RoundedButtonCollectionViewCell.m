@implementation RoundedButtonCollectionViewCell

- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell *)sub_1004CCB78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004CDEE8();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31RoundedButtonCollectionViewCell *v2;

  v2 = self;
  sub_1004CCE8C();

}

- (void)didTapButton:(id)a3
{
  id v4;
  _TtC20ProductPageExtension31RoundedButtonCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1004CD500(v4);

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_dividerView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31RoundedButtonCollectionViewCell_action, &qword_100827620);
}

@end
