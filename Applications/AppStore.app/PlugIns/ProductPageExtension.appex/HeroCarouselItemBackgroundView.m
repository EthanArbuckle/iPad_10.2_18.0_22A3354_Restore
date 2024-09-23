@implementation HeroCarouselItemBackgroundView

- (_TtC20ProductPageExtension30HeroCarouselItemBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30HeroCarouselItemBackgroundView *)sub_1000FD344(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30HeroCarouselItemBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _TtC20ProductPageExtension30HeroCarouselItemBackgroundView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselItemBackgroundView_mediaViewContainer;
  objc_allocWithZone((Class)type metadata accessor for MediaView());
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1003A37C4(0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  v7 = OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselItemBackgroundView_artworkView;
  v8 = type metadata accessor for ArtworkView(0);
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8)), "init");

  result = (_TtC20ProductPageExtension30HeroCarouselItemBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/HeroCarouselItemBackgroundView.swift", 57, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC20ProductPageExtension30HeroCarouselItemBackgroundView *v4;
  void *v5;
  double v6;
  objc_super v7;

  v3 = (objc_class *)type metadata accessor for HeroCarouselItemBackgroundView();
  v7.receiver = self;
  v7.super_class = v3;
  v4 = self;
  -[HeroCarouselItemBackgroundView layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselItemBackgroundView_mediaViewContainer);
  v6 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselItemBackgroundView_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30HeroCarouselItemBackgroundView_artworkView));
}

@end
