@implementation HeroCarouselItemView

- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20HeroCarouselItemView *)sub_1001437F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001460D8();
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC20ProductPageExtension20HeroCarouselItemView *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_overlayView);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, "preferredFocusEnvironments");
    v5 = sub_10000DAF8(&qword_100811138);
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  sub_10000DAF8(&qword_100811138);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension20HeroCarouselItemView *v2;

  v2 = self;
  sub_100143E60();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension20HeroCarouselItemView *v6;

  v5 = a3;
  v6 = self;
  sub_100144210(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_heroCarouselItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView____lazy_storage___moduleGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20HeroCarouselItemView_overlayView));
}

@end
