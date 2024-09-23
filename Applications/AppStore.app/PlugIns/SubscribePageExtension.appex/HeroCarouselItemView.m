@implementation HeroCarouselItemView

- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20HeroCarouselItemView *)sub_1004F2204(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004F4AE8();
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC22SubscribePageExtension20HeroCarouselItemView *v3;
  id v4;
  uint64_t v5;
  double *v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_overlayView);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, "preferredFocusEnvironments");
    v5 = sub_10000DF3C(&qword_1008144E8);
    v6 = (double *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  sub_10000DF3C(&qword_1008144E8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension20HeroCarouselItemView *v2;

  v2 = self;
  sub_1004F2870();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension20HeroCarouselItemView *v6;

  v5 = a3;
  v6 = self;
  sub_1004F2C20(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_heroCarouselItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView____lazy_storage___moduleGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20HeroCarouselItemView_overlayView));
}

@end
