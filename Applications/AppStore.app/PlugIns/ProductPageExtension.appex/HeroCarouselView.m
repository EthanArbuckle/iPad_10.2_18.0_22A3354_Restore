@implementation HeroCarouselView

- (_TtC20ProductPageExtension16HeroCarouselView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16HeroCarouselView *)sub_10054C418(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension16HeroCarouselView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10054E8BC();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16HeroCarouselView *v2;

  v2 = self;
  sub_10054C828();

}

- (void)pageControlDidChange
{
  _TtC20ProductPageExtension16HeroCarouselView *v2;

  v2 = self;
  sub_10054D3DC();

}

- (void)reduceMotionStatusDidChange:(id)a3
{
  sub_10054E37C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10054DB74);
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
  _TtC20ProductPageExtension16HeroCarouselView *v5;

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
    sub_1002DBD44(v4);

    return 1;
  }
  return v3;
}

- (void)voiceOverStatusDidChange:(id)a3
{
  sub_10054E37C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10054E2C0);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10054E80C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_carouselDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_scrollView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_carouselItemViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_autoScrollConfiguration;
  v4 = type metadata accessor for AutoScrollConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16HeroCarouselView_autoScrollTimer));
}

@end
