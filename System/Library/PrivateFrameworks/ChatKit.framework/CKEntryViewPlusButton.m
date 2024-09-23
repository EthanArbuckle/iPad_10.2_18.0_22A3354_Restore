@implementation CKEntryViewPlusButton

- (CKEntryViewPlusButton)initWithFrame:(CGRect)a3
{
  CKEntryViewPlusButton *result;

  EntryViewPlusButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CKEntryViewPlusButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E58A228();
}

- (BOOL)enabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKEntryViewPlusButton_enabled;
  swift_beginAccess();
  return *v2;
}

- (void)setEnabled:(BOOL)a3
{
  CKEntryViewPlusButton *v4;

  v4 = self;
  sub_18E587EA4(a3);

}

- (BOOL)automaticallyAdjustsBackgroundCornerRadius
{
  return (*(_BYTE **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView))[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius];
}

- (void)setAutomaticallyAdjustsBackgroundCornerRadius:(BOOL)a3
{
  _BYTE *v3;
  char v4;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView);
  v4 = v3[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius];
  v3[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius] = a3;
  if ((v4 & 1) == 0 && a3)
    objc_msgSend(v3, sel_setNeedsLayout);
}

- (double)backgroundCornerRadius
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView), sel__continuousCornerRadius);
  return result;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView), sel__setContinuousCornerRadius_, a3);
}

- (UIColor)plusButtonBackgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_buttonView), sel_backgroundColor);
}

- (void)setPlusButtonBackgroundColor:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_buttonView), sel_setBackgroundColor_, a3);
}

- (double)backgroundBlurRasterizationPercentage
{
  return *(double *)(*(char **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR___CKEntryViewPlusButton_blurContainerView)
                   + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView_rasterizationPercent);
}

- (void)setBackgroundBlurRasterizationPercentage:(double)a3
{
  CKEntryViewPlusButton *v4;

  v4 = self;
  sub_18E588370(a3);

}

- (double)backgroundBlurRadiusLightMode
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusLightMode);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundBlurRadiusLightMode:(double)a3
{
  sub_18E5886DC((char *)self, a3, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusLightMode);
}

- (double)backgroundBlurRadiusDarkMode
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusDarkMode);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundBlurRadiusDarkMode:(double)a3
{
  sub_18E5886DC((char *)self, a3, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusDarkMode);
}

- (CAFilter)backgroundCompositingFilterForLightMode
{
  return (CAFilter *)sub_18E588B44((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForLightMode);
}

- (void)setBackgroundCompositingFilterForLightMode:(id)a3
{
  CKEntryViewPlusButton *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E58A2DC(a3);

}

- (CAFilter)backgroundCompositingFilterForDarkMode
{
  return (CAFilter *)sub_18E588B44((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForDarkMode);
}

- (void)setBackgroundCompositingFilterForDarkMode:(id)a3
{
  CKEntryViewPlusButton *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E58A3E0(a3);

}

- (double)plusSymbolOpacity
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_iconImageView), sel_alpha);
  return result;
}

- (void)setPlusSymbolOpacity:(double)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_iconImageView), sel_setAlpha_, a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  CKEntryViewPlusButton *v6;

  v5 = a3;
  v6 = self;
  sub_18E588E58((uint64_t)a3);

}

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___CKEntryViewPlusButton_buttonView));
}

- (void)layoutSubviews
{
  CKEntryViewPlusButton *v2;

  v2 = self;
  sub_18E58910C();

}

- (void).cxx_destruct
{

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKEntryViewPlusButton_plusButtonDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForLightMode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForDarkMode));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  CKEntryViewPlusButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s7ChatKit19EntryViewPlusButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0kH0C_So0K6RegionCtF_0();

  return v9;
}

@end
