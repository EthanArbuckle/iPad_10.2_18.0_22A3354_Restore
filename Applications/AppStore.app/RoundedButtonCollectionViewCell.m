@implementation RoundedButtonCollectionViewCell

- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31RoundedButtonCollectionViewCell *)sub_10060E1C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31RoundedButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10060F538();
}

- (void)layoutSubviews
{
  _TtC8AppStore31RoundedButtonCollectionViewCell *v2;

  v2 = self;
  sub_10060E4DC();

}

- (void)didTapButton:(id)a3
{
  id v4;
  _TtC8AppStore31RoundedButtonCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10060EB50(v4);

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_dividerView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31RoundedButtonCollectionViewCell_action, (uint64_t *)&unk_100852F70);
}

@end
