@implementation EditorialSearchResultCollectionViewCell

- (_TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell *)sub_1000C2A64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000C45AC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1000C3094();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1000C3EA8();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_subtitleLabel));
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_editorialArtworkView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_artworkGrid));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView));
}

@end
