@implementation SmallSearchLockupView

- (_TtC20ProductPageExtension21SmallSearchLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)sub_100450B8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC20ProductPageExtension21SmallSearchLockupView *v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6.n128_f64[0] = width;
  v7 = sub_10044F944(v6, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension21SmallSearchLockupView *v2;

  v2 = self;
  sub_100451720();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC20ProductPageExtension21SmallSearchLockupView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100451CC4((uint64_t)a4, x, y);

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension21SmallSearchLockupView *v6;

  v5 = a3;
  v6 = self;
  sub_100451E00(a3);

}

- (_TtC20ProductPageExtension10RatingView)accessibilitytUserRatingView
{
  return (_TtC20ProductPageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_userRatingView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_ratingCountLabel));
}

- (BOOL)accessibilityIsAd
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_isDisplayingSearchAd);
}

- (UIButton)accessibilityAdButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchAdTransparencyButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_descriptionLabel));
}

- (_TtC20ProductPageExtension18MetadataRibbonView)accessibilityMetadataRibbonView
{
  return (_TtC20ProductPageExtension18MetadataRibbonView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataRibbonView);
}

- (_TtC20ProductPageExtension20SearchTagsRibbonView)accessibilitySearchTagsRibbonView
{
  return (_TtC20ProductPageExtension20SearchTagsRibbonView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchTagsRibbonView);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataTextSpace;
  v4 = type metadata accessor for StaticDimension(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_userRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_ratingCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_editorsChoiceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchTagsRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchAdTransparencyButton));
  swift_release();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_impressionsUpdateBlock), *(_QWORD *)&self->super.artworkView[OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_impressionsUpdateBlock]);
}

@end
