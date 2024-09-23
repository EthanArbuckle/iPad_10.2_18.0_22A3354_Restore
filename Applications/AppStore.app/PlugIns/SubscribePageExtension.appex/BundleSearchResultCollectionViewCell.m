@implementation BundleSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *)sub_100500158(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_lockupView;
  v6 = objc_allocWithZone((Class)type metadata accessor for SmallSearchLockupView(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_bundleView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BundleView(0)), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/BundleSearchResultCollectionViewCell.swift", 65, 2, 38, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  id v3;
  uint64_t v4;
  Swift::Bool v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BundleSearchResultCollectionViewCell();
  v2 = v6.receiver;
  v3 = -[BundleSearchResultCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  sub_1001537D4((uint64_t)v3, v4, v5);
  sub_1005E9790();

}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_100500464();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36BundleSearchResultCollectionViewCell_bundleView));
}

@end
