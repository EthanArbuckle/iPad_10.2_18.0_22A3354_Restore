@implementation PosterLockupCollectionViewCell

- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30PosterLockupCollectionViewCell *)sub_1003DF304(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30PosterLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E06D0();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension30PosterLockupCollectionViewCell *v2;

  v2 = self;
  sub_1003DFC48();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension30PosterLockupCollectionViewCell *v2;

  v2 = self;
  sub_1003DEA60();

}

- (UIView)accessibilityHeadingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_headingView));
}

- (NSString)accessibilityFallbackTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->fallbackTitle[OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitle];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->fallbackTitle[OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitle]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)acccessibilityFallbackTitleView
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
}

- (_TtC11AppStoreKit11ArtworkView)acccessibilityEpicHeaderView
{
  return (_TtC11AppStoreKit11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_epicHeaderView));
}

- (_TtC20ProductPageExtension11OfferButton)accessibilityOfferButton
{
  return (_TtC20ProductPageExtension11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                            + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_offerButton));
}

- (UIView)accessibilityFooterView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_footerLabel));
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fallbackTitle[OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fallbackTitle[OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_footerText]);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_headingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_epicHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_fallbackTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30PosterLockupCollectionViewCell_mediaViewContainer));
}

@end
