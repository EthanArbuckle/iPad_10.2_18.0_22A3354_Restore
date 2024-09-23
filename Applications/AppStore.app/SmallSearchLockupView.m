@implementation SmallSearchLockupView

- (_TtC8AppStore21SmallSearchLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21SmallSearchLockupView *)sub_1000F771C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC8AppStore21SmallSearchLockupView *v5;
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
  v7 = sub_1000F8098(v6, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore21SmallSearchLockupView *v2;

  v2 = self;
  sub_1000F87E8();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC8AppStore21SmallSearchLockupView *v9;
  uint64_t v10;
  id v11;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v11 = sub_1000F8D8C((uint64_t)a4, v10, x, y);

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore21SmallSearchLockupView *v6;

  v5 = a3;
  v6 = self;
  sub_1000F8EC8(a3);

}

- (_TtC8AppStore10RatingView)accessibilitytUserRatingView
{
  return (_TtC8AppStore10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                              + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_userRatingView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_ratingCountLabel));
}

- (BOOL)accessibilityIsAd
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_isDisplayingSearchAd);
}

- (UIButton)accessibilityAdButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_searchAdTransparencyButton));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_descriptionLabel));
}

- (_TtC8AppStore18MetadataRibbonView)accessibilityMetadataRibbonView
{
  return (_TtC8AppStore18MetadataRibbonView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_metadataRibbonView));
}

- (_TtC8AppStore20SearchTagsRibbonView)accessibilitySearchTagsRibbonView
{
  return (_TtC8AppStore20SearchTagsRibbonView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_searchTagsRibbonView));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_metadataTextSpace;
  v4 = type metadata accessor for StaticDimension(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_userRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_ratingCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_editorsChoiceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_metadataRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_searchTagsRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_searchAdTransparencyButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_impressionsCalculator));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_impressionsUpdateBlock), *(_QWORD *)&self->super.artworkView[OBJC_IVAR____TtC8AppStore21SmallSearchLockupView_impressionsUpdateBlock]);
}

@end
