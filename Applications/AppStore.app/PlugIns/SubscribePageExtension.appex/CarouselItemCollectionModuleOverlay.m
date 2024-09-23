@implementation CarouselItemCollectionModuleOverlay

- (_TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay *)sub_100604864(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100605758();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v4 = self;
  -[CarouselItemCollectionModuleOverlay layoutSubviews](&v12, "layoutSubviews");
  sub_100604BF8(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v8 = -[CarouselItemCollectionModuleOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay *v5;
  double v6;
  __n128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1001432DC(width, height);
  sub_100604BF8(v13);
  v7.n128_f64[0] = v6;
  v8 = sub_10060451C((uint64_t)v13, sub_1001432DC, v7, height);
  v10 = v9;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v13);

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)handleSelection:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->headerView[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_tapGestureRecognizer));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler), *(_QWORD *)&self->headerView[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionModuleOverlay_selectionHandler]);
}

@end
