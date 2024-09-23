@implementation CarouselItemCollectionLockupOverlay

- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay *result;

  sub_1003A6F3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A8FF0();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay *v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v3 = (objc_class *)type metadata accessor for CarouselItemCollectionLockupOverlay(0);
  v13.receiver = self;
  v13.super_class = v3;
  v4 = self;
  -[CarouselItemCollectionLockupOverlay layoutSubviews](&v13, "layoutSubviews");
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_materialBackground), "setFrame:", LayoutMarginsAware<>.layoutFrame.getter(v3));
  sub_1003A7974(0, v10, v5);
  v6 = v11;
  v7 = v12;
  sub_100011064(v10, v11);
  v8 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v9 = -[CarouselItemCollectionLockupOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v9, v6, v7, v8);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay *v5;
  __n128 v6;
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
  sub_1003A7974(1, v13, v6);
  v7.n128_f64[0] = width;
  v8 = sub_100604510((uint64_t)v13, v7, height);
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
  _TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler];
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
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_descriptionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_collectionArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_tapGestureRecognizer));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler), *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC22SubscribePageExtension35CarouselItemCollectionLockupOverlay_selectionHandler]);
}

@end
