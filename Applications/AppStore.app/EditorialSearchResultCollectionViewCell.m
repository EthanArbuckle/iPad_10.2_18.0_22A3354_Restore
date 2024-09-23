@implementation EditorialSearchResultCollectionViewCell

- (_TtC8AppStore39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39EditorialSearchResultCollectionViewCell *)sub_10063A0C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39EditorialSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10063C54C();
}

- (void)layoutSubviews
{
  _TtC8AppStore39EditorialSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_10063A6F8();

}

- (void)prepareForReuse
{
  _TtC8AppStore39EditorialSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_10063B50C();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_subtitleLabel));
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_editorialArtworkView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_artworkGrid));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView));
}

@end
