@implementation EditorialSearchResultContentView

- (_TtC8AppStore32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore32EditorialSearchResultContentView *)sub_100401F24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10040700C();
}

- (void)layoutSubviews
{
  _TtC8AppStore32EditorialSearchResultContentView *v2;

  v2 = self;
  sub_100402478();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore32EditorialSearchResultContentView *v6;

  v5 = a3;
  v6 = self;
  sub_1004032EC(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_subtitleLabel));
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_appEventStoryFormattedDateView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView____lazy_storage___editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_editorialArtworkView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_artworkGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32EditorialSearchResultContentView_appEventStoryFormattedDateView));
}

@end
