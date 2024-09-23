@implementation HeroCarouselView

- (_TtC8AppStore16HeroCarouselView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16HeroCarouselView *)sub_1003B4D14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore16HeroCarouselView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003B7148();
}

- (void)layoutSubviews
{
  _TtC8AppStore16HeroCarouselView *v2;

  v2 = self;
  sub_1003B5124();

}

- (void)pageControlDidChange
{
  _TtC8AppStore16HeroCarouselView *v2;

  v2 = self;
  sub_1003B5CD8();

}

- (void)reduceMotionStatusDidChange:(id)a3
{
  sub_1003B6C78(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1003B6470);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HeroCarouselView(0);
  -[HeroCarouselView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v3;
  unsigned __int8 v4;
  _TtC8AppStore16HeroCarouselView *v5;

  if (a3 == 1)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v3 = 0;
  if (a3 == 2)
  {
    v4 = 1;
LABEL_5:
    v5 = self;
    sub_1004E147C(v4);

    return 1;
  }
  return v3;
}

- (void)voiceOverStatusDidChange:(id)a3
{
  sub_1003B6C78(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1003B6BBC);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1003B7108((uint64_t)self + OBJC_IVAR____TtC8AppStore16HeroCarouselView_carouselDelegate);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore16HeroCarouselView_carouselItemViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore16HeroCarouselView_autoScrollConfiguration;
  v4 = type metadata accessor for AutoScrollConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
