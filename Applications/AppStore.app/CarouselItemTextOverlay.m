@implementation CarouselItemTextOverlay

- (_TtC8AppStore23CarouselItemTextOverlay)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23CarouselItemTextOverlay *)sub_10048F0BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23CarouselItemTextOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100490BE8();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC8AppStore23CarouselItemTextOverlay *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v3 = (objc_class *)type metadata accessor for CarouselItemTextOverlay(0);
  v18.receiver = self;
  v18.super_class = v3;
  v4 = self;
  -[CarouselItemTextOverlay layoutSubviews](&v18, "layoutSubviews");
  sub_10048F888(v15);
  v5 = v16;
  v6 = v17;
  sub_100060B40(v15, v16);
  *(_QWORD *)&v7 = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[CarouselItemTextOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore23CarouselItemTextOverlay *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[5];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_10048F888(v11);
  v6 = sub_1005725C0((uint64_t)v11, width, height);
  v8 = v7;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v11);

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
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
  _TtC8AppStore23CarouselItemTextOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_callToActionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_tapGestureRecognizer));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_selectionHandler), *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC8AppStore23CarouselItemTextOverlay_selectionHandler]);
}

@end
