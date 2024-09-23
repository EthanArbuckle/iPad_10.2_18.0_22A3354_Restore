@implementation CondensedEditorialSearchResultContentView

- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView *)CondensedEditorialSearchResultContentView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView *v2;

  v2 = self;
  CondensedEditorialSearchResultContentView.layoutSubviews()();

}

- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100017564();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView *v6;
  _TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CondensedEditorialSearchResultContentView.traitCollectionDidChange(_:)(v8);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeaderLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_headerLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_titleLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100011088((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_viewButton));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_configuration;
  v4 = type metadata accessor for CondensedSearchResultCardLayout.Configuration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_iconGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_action));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_buttonHandler), *(_QWORD *)&self->headerLabel[OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_buttonHandler]);
}

@end
