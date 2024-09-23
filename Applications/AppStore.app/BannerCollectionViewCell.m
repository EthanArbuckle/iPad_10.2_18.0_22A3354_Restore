@implementation BannerCollectionViewCell

- (_TtC8AppStore24BannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24BannerCollectionViewCell *)sub_10054BB7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24BannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10054DB0C();
}

- (void)layoutSubviews
{
  _TtC8AppStore24BannerCollectionViewCell *v2;

  v2 = self;
  sub_10054C440();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore24BannerCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_10054CA94(a3);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BannerCollectionViewCell(0);
  v2 = v3.receiver;
  -[BannerCollectionViewCell _dynamicUserInterfaceTraitDidChange](&v3, "_dynamicUserInterfaceTraitDidChange");
  sub_10054C31C();

}

- (void)prepareForReuse
{
  _TtC8AppStore24BannerCollectionViewCell *v2;

  v2 = self;
  sub_10054CD48();

}

- (_TtC11AppStoreKit19DynamicTypeTextView)accessibilityMessageTextView
{
  return (_TtC11AppStoreKit19DynamicTypeTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_messageTextView));
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_roundedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_bottomSeparatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_leadingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_leadingArtworkTintColor));
  sub_10008F03C((uint64_t)self + OBJC_IVAR____TtC8AppStore24BannerCollectionViewCell_configuredMetrics);
}

@end
