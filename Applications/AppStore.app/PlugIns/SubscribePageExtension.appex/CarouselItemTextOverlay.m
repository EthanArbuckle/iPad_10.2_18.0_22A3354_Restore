@implementation CarouselItemTextOverlay

- (_TtC22SubscribePageExtension23CarouselItemTextOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23CarouselItemTextOverlay *)sub_10014B650(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23CarouselItemTextOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10014D3CC();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC22SubscribePageExtension23CarouselItemTextOverlay *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v3 = (objc_class *)type metadata accessor for CarouselItemTextOverlay(0);
  v12.receiver = self;
  v12.super_class = v3;
  v4 = self;
  -[CarouselItemTextOverlay layoutSubviews](&v12, "layoutSubviews");
  sub_10014BE1C(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v8 = -[CarouselItemTextOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension23CarouselItemTextOverlay *v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_10014BE1C(v12);
  v6.n128_f64[0] = width;
  v7 = sub_100604510((uint64_t)v12, v6, height);
  v9 = v8;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v12);

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
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
  _TtC22SubscribePageExtension23CarouselItemTextOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100019320((uint64_t)v3, v5);
    v3(v7);
    sub_100019310((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_callToActionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_tapGestureRecognizer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_selectionHandler), *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC22SubscribePageExtension23CarouselItemTextOverlay_selectionHandler]);
}

@end
