@implementation ProductTapToRateCollectionViewCell

- (_TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell *)sub_10024C630(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell_productTapToRateView;
  v6 = type metadata accessor for ProductTapToRateView(0);
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");

  result = (_TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ProductTapToRateCollectionViewCell.swift", 63, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell *v2;

  v2 = self;
  sub_10024C8D8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10024CB0C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ProductTapToRateCollectionViewCell_productTapToRateView));
}

@end
