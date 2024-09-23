@implementation BannerCollectionViewCell

- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension24BannerCollectionViewCell *)sub_1000D2988(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D4CA8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension24BannerCollectionViewCell *v2;

  v2 = self;
  sub_1000D35DC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension24BannerCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1000D3C30(a3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  v2 = v3.receiver;
  -[BannerCollectionViewCell _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_1000D34B8();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension24BannerCollectionViewCell *v2;

  v2 = self;
  sub_1000D3EE4();

}

- (_TtC11AppStoreKit19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC11AppStoreKit19DynamicTypeTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_messageTextView));
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_bottomSeparatorView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_leadingArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_leadingArtworkTintColor));
  sub_1000D4EC4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24BannerCollectionViewCell_configuredMetrics);
}

@end
