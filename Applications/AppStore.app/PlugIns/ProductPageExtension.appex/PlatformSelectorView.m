@implementation PlatformSelectorView

- (_TtC20ProductPageExtension20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20PlatformSelectorView *)sub_10043A8AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20PlatformSelectorView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC20ProductPageExtension20PlatformSelectorView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_numberOfBadges) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC20ProductPageExtension20PlatformSelectorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/PlatformSelectorView.swift", 47, 2, 132, 0);
  __break(1u);
  return result;
}

- (void)didTapSelectorView
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension20PlatformSelectorView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->descriptionWithBadgesAsHeadingLabel[OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension20PlatformSelectorView *v2;

  v2 = self;
  sub_10043AFA8();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _TtC20ProductPageExtension20PlatformSelectorView *v8;
  id v9;
  uint64_t v11;

  v3 = type metadata accessor for BadgeDisplayStyle(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_numberOfBadges);
  v8 = self;
  static BadgeDisplayStyle.style(forBadgeCount:pageTraits:indentForBadges:)(v7, v8, 0, 1);
  v9 = sub_10043B25C((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC11AppStoreKit16DynamicTypeLabel *)v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithBadgesAsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithBadgesInlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithTwoColumnsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_accessoryImageView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler), *(_QWORD *)&self->descriptionWithBadgesAsHeadingLabel[OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler]);
}

@end
