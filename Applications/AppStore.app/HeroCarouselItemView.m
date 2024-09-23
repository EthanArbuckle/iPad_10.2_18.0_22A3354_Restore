@implementation HeroCarouselItemView

- (_TtC8AppStore20HeroCarouselItemView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20HeroCarouselItemView *)sub_1003285DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20HeroCarouselItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10032AEA8();
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC8AppStore20HeroCarouselItemView *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_overlayView);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, "preferredFocusEnvironments");
    v5 = sub_10007B804(&qword_10083DD08);
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  sub_10007B804(&qword_10083DD08);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)layoutSubviews
{
  _TtC8AppStore20HeroCarouselItemView *v2;

  v2 = self;
  sub_100328C48();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore20HeroCarouselItemView *v6;

  v5 = a3;
  v6 = self;
  sub_100328FF8(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_heroCarouselItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20HeroCarouselItemView____lazy_storage___moduleGradientView));

}

@end
