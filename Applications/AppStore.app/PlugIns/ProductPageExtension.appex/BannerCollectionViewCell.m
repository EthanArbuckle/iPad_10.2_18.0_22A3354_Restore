@implementation BannerCollectionViewCell

- (_TtC20ProductPageExtension24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension24BannerCollectionViewCell *)sub_1000EB3AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000ED33C();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension24BannerCollectionViewCell *v2;

  v2 = self;
  sub_1000EBC70();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension24BannerCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1000EC2C4(a3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  v2 = v3.receiver;
  -[BannerCollectionViewCell _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_1000EBB4C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension24BannerCollectionViewCell *v2;

  v2 = self;
  sub_1000EC578();

}

- (_TtC11AppStoreKit19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC11AppStoreKit19DynamicTypeTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_messageTextView));
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_bottomSeparatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_leadingArtworkTintColor));
  sub_1000351F8((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24BannerCollectionViewCell_configuredMetrics);
}

@end
