@implementation RoundedButtonCollectionViewCell

- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell *)sub_1005EB750(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005ECAC0();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31RoundedButtonCollectionViewCell *v2;

  v2 = self;
  sub_1005EBA64();

}

- (void)didTapButton:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension31RoundedButtonCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1005EC0D8(v4);

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_dividerView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31RoundedButtonCollectionViewCell_action, &qword_10081C260);
}

@end
