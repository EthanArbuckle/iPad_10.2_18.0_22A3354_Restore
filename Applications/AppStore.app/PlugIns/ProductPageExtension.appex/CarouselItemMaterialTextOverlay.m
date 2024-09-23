@implementation CarouselItemMaterialTextOverlay

- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension31CarouselItemMaterialTextOverlay *result;

  sub_100359158(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC20ProductPageExtension31CarouselItemMaterialTextOverlay)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10035BE10();
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC20ProductPageExtension31CarouselItemMaterialTextOverlay *v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v3 = (objc_class *)type metadata accessor for CarouselItemMaterialTextOverlay(0);
  v19.receiver = self;
  v19.super_class = v3;
  v4 = self;
  -[CarouselItemMaterialTextOverlay layoutSubviews](&v19, "layoutSubviews");
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_materialBackground), "setFrame:", LayoutMarginsAware<>.layoutFrame.getter(v3));
  sub_100359C58(0, v16, v5);
  v6 = v17;
  v7 = v18;
  sub_100010F08(v16, v17);
  v8 = LayoutMarginsAware<>.layoutFrame.getter(v3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[CarouselItemMaterialTextOverlay traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v15, v6, v7, v8, v10, v12, v14);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v16);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension31CarouselItemMaterialTextOverlay *v5;
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
  sub_100359C58(1, v12, v6);
  v7 = sub_1005F25A4((uint64_t)v12, width, height);
  v9 = v8;
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v12);

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
  _TtC20ProductPageExtension31CarouselItemMaterialTextOverlay *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_100018918((uint64_t)v3, v5);
    v3(v7);
    sub_100018908((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_descriptionLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTertiaryTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_callToActionLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_displayOptions;
  v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_materialBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_callToActionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_tapGestureRecognizer));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler), *(_QWORD *)&self->materialBackground[OBJC_IVAR____TtC20ProductPageExtension31CarouselItemMaterialTextOverlay_selectionHandler]);
}

@end
