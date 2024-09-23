@implementation EditorialSearchResultContentView

- (_TtC22SubscribePageExtension32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32EditorialSearchResultContentView *)sub_100228988(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10022D8F8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension32EditorialSearchResultContentView *v2;

  v2 = self;
  sub_100228EDC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension32EditorialSearchResultContentView *v6;

  v5 = a3;
  v6 = self;
  sub_100229D50(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_subtitleLabel));
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_appEventStoryFormattedDateView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView____lazy_storage___editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_editorialArtworkView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_videoView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_artworkGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialSearchResultContentView_appEventStoryFormattedDateView));
}

@end
