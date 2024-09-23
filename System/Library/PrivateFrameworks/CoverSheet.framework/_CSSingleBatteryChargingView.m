@implementation _CSSingleBatteryChargingView

- (_CSSingleBatteryChargingView)initWithFrame:(CGRect)a3
{
  _CSSingleBatteryChargingView *v3;
  void *v4;
  uint64_t v5;
  UIImage *batteryImage;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  uint64_t v10;
  UIImage *boltImage;
  uint64_t v12;
  UIImage *v13;
  uint64_t v14;
  UIImageView *boltImageView;
  UIImageView *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CSBatteryFillView *v22;
  uint64_t v23;
  CSBatteryFillView *batteryFillView;
  CSBatteryFillView *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _UIBackdropView *batteryBlurView;
  uint64_t v30;
  UIView *batteryContainerView;
  UIView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)_CSSingleBatteryChargingView;
  v3 = -[CSBatteryChargingView initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSBatteryChargingView maskImageNameForChargingBattery](CSBatteryChargingView, "maskImageNameForChargingBattery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v4, v39);
    v5 = objc_claimAutoreleasedReturnValue();
    batteryImage = v3->_batteryImage;
    v3->_batteryImage = (UIImage *)v5;

    -[UIImage size](v3->_batteryImage, "size");
    v3->_batteryImageSize.width = v7;
    v3->_batteryImageSize.height = v8;
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("bolt.fill"));
    v10 = objc_claimAutoreleasedReturnValue();
    boltImage = v3->_boltImage;
    v3->_boltImage = (UIImage *)v10;

    -[UIImage imageWithRenderingMode:](v3->_boltImage, "imageWithRenderingMode:", 2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v3->_boltImage;
    v3->_boltImage = (UIImage *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3->_boltImage);
    boltImageView = v3->_boltImageView;
    v3->_boltImageView = (UIImageView *)v14;

    -[UIImageView setPreferredSymbolConfiguration:](v3->_boltImageView, "setPreferredSymbolConfiguration:", v9);
    v16 = v3->_boltImageView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v16, "setTintColor:", v17);

    -[CSBatteryChargingView _imageViewScalingCorrectedBatterySize:](v3, "_imageViewScalingCorrectedBatterySize:", v3->_batteryImageSize.width, v3->_batteryImageSize.height);
    v19 = v18;
    v21 = v20;
    v22 = [CSBatteryFillView alloc];
    v23 = -[CSBatteryFillView initWithFrame:isInternalBattery:lowBatteryLevel:](v22, "initWithFrame:isInternalBattery:lowBatteryLevel:", 1, objc_msgSend(MEMORY[0x1E0CEA9E8], "lowBatteryLevel"), 0.0, 0.0, v19, v21);
    batteryFillView = v3->_batteryFillView;
    v3->_batteryFillView = (CSBatteryFillView *)v23;

    -[CSBatteryFillView setAutoresizingMask:](v3->_batteryFillView, "setAutoresizingMask:", 18);
    v25 = v3->_batteryFillView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryFillView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2020);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRenderingHint:", 1);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithFrame:settings:", v27, 0.0, 0.0, v19, v21);
    batteryBlurView = v3->_batteryBlurView;
    v3->_batteryBlurView = (_UIBackdropView *)v28;

    -[_UIBackdropView setAutoresizingMask:](v3->_batteryBlurView, "setAutoresizingMask:", 18);
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, v19, v21);
    batteryContainerView = v3->_batteryContainerView;
    v3->_batteryContainerView = (UIView *)v30;

    v32 = v3->_batteryContainerView;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v32, "setBackgroundColor:", v33);

    -[UIView setAutoresizingMask:](v3->_batteryContainerView, "setAutoresizingMask:", 18);
    -[UIView setClipsToBounds:](v3->_batteryContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v3->_batteryContainerView, "addSubview:", v3->_batteryBlurView);
    -[UIView addSubview:](v3->_batteryContainerView, "addSubview:", v3->_batteryFillView);
    -[UIView setAlpha:](v3->_batteryContainerView, "setAlpha:", 0.0);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v3->_batteryImage);
    objc_msgSend(v34, "setAutoresizingMask:", 18);
    objc_msgSend(v34, "setFrame:", 0.0, 0.0, v19, v21);
    objc_msgSend(v34, "setContentMode:", 0);
    -[CSBatteryFillView setMaskView:](v3->_batteryFillView, "setMaskView:", v34);
    -[_UIBackdropView inputSettings](v3->_batteryBlurView, "inputSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setGrayscaleTintMaskImage:", v3->_batteryImage);

    -[_UIBackdropView inputSettings](v3->_batteryBlurView, "inputSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setColorTintMaskImage:", v3->_batteryImage);

    -[_UIBackdropView inputSettings](v3->_batteryBlurView, "inputSettings");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFilterMaskImage:", v3->_batteryImage);

    -[_CSSingleBatteryChargingView addSubview:](v3, "addSubview:", v3->_batteryContainerView);
  }
  return v3;
}

- (void)setBatterySize:(CGSize)a3
{
  if (self->_batteryImageSize.width != a3.width || self->_batteryImageSize.height != a3.height)
  {
    self->_batteryImageSize = a3;
    -[_CSSingleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
    -[_CSSingleBatteryChargingView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  SBUILegibilityLabel *chargePercentLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CSSingleBatteryChargingView;
  -[CSBatteryChargingView setLegibilitySettings:](&v6, sel_setLegibilitySettings_, a3);
  chargePercentLabel = self->_chargePercentLabel;
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setLegibilitySettings:](chargePercentLabel, "setLegibilitySettings:", v5);

}

- (void)setIncludesBoltImage:(BOOL)a3
{
  if (self->_includesBoltImage != a3)
  {
    self->_includesBoltImage = a3;
    -[UIImageView removeFromSuperview](self->_boltImageView, "removeFromSuperview");
    if (self->_includesBoltImage)
      -[_CSSingleBatteryChargingView addSubview:](self, "addSubview:", self->_boltImageView);
  }
}

- (void)setPrimaryBatteryText:(id)a3 forBattery:(id)a4
{
  SBUILegibilityLabel *chargePercentLabel;
  id v7;
  SBUILegibilityLabel *v8;
  SBUILegibilityLabel *v9;
  CSBatteryFillView *batteryFillView;
  uint64_t v11;

  chargePercentLabel = self->_chargePercentLabel;
  v7 = a4;
  -[CSBatteryChargingView _updateChargeString:oldLabel:](self, "_updateChargeString:oldLabel:", a3, chargePercentLabel);
  v8 = (SBUILegibilityLabel *)objc_claimAutoreleasedReturnValue();
  v9 = self->_chargePercentLabel;
  self->_chargePercentLabel = v8;

  -[SBUILegibilityLabel setAdjustsFontSizeToFitWidth:](self->_chargePercentLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[CSBatteryFillView setChargePercentage:](self->_batteryFillView, "setChargePercentage:", objc_msgSend(v7, "percentCharge"));
  batteryFillView = self->_batteryFillView;
  v11 = objc_msgSend(v7, "isLowPowerModeActive");

  -[CSBatteryFillView setBatterySaverModeActive:](batteryFillView, "setBatterySaverModeActive:", v11);
  -[_CSSingleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)batteryVisible
{
  double v2;

  -[UIView alpha](self->_batteryContainerView, "alpha");
  return v2 == 1.0;
}

- (void)setBatteryVisible:(BOOL)a3
{
  UIView *batteryContainerView;
  double v5;

  batteryContainerView = self->_batteryContainerView;
  v5 = 0.0;
  if (a3)
    v5 = 1.0;
  -[UIView setAlpha:](batteryContainerView, "setAlpha:", v5);
  -[_CSSingleBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)batteryCount
{
  return 1;
}

- (double)desiredVisibilityDuration
{
  return 2.5;
}

- (void)performAnimation:(unint64_t)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)layoutSubviews
{
  -[_CSSingleBatteryChargingView _layoutBattery](self, "_layoutBattery");
  -[_CSSingleBatteryChargingView _layoutChargePercentLabel](self, "_layoutChargePercentLabel");
}

- (void)_layoutChargePercentLabel
{
  SBUILegibilityLabel *chargePercentLabel;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;

  -[SBUILegibilityLabel frame](self->_chargePercentLabel, "frame");
  chargePercentLabel = self->_chargePercentLabel;
  -[_CSSingleBatteryChargingView bounds](self, "bounds");
  -[SBUILegibilityLabel sizeThatFits:](chargePercentLabel, "sizeThatFits:", v4, 0.0);
  v6 = v5;
  v8 = v7;
  -[_CSSingleBatteryChargingView bounds](self, "bounds");
  if (v6 > v9)
  {
    -[_CSSingleBatteryChargingView bounds](self, "bounds");
    v6 = v10;
  }
  if (-[_CSSingleBatteryChargingView horizontalLayoutNeeded](self, "horizontalLayoutNeeded"))
  {
    -[_CSSingleBatteryChargingView bounds](self, "bounds");
    -[CSBatteryChargingView horizontalGapBetweenBatteryAndPercentLabel](self, "horizontalGapBetweenBatteryAndPercentLabel");
    SBFMainScreenScale();
    BSFloatRoundForScale();
    v12 = v11;
    SBFMainScreenScale();
    BSFloatRoundForScale();
    v14 = v13;
  }
  else
  {
    -[CSBatteryChargingView _tightFrameForElement:](self, "_tightFrameForElement:", 2);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    CGRectGetMidY(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetMidX(v23);
    SBFMainScreenScale();
    BSRectRoundForScale();
    v12 = v19;
    v6 = v20;
    v8 = v21;
  }
  -[SBUILegibilityLabel setFrame:](self->_chargePercentLabel, "setFrame:", v12, v14, v6, v8);
}

- (void)_layoutBattery
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[CSBatteryChargingView _imageViewScalingCorrectedBatterySize:](self, "_imageViewScalingCorrectedBatterySize:", self->_batteryImageSize.width, self->_batteryImageSize.height);
  v4 = v3;
  v6 = v5;
  if (-[_CSSingleBatteryChargingView horizontalLayoutNeeded](self, "horizontalLayoutNeeded"))
  {
    -[_CSSingleBatteryChargingView bounds](self, "bounds");
    -[CSBatteryChargingView horizontalGapBetweenBatteryAndPercentLabel](self, "horizontalGapBetweenBatteryAndPercentLabel");
    SBFMainScreenScale();
    BSFloatRoundForScale();
    v8 = v7;
    SBFMainScreenScale();
    BSFloatRoundForScale();
    v10 = v9;
  }
  else
  {
    -[CSBatteryChargingView _batteryCenter](self, "_batteryCenter");
    v10 = v11 - v6 * 0.5;
    v13 = v12 - v4 * 0.5;
    -[_CSSingleBatteryChargingView _batteryNoseOffset](self, "_batteryNoseOffset");
    v8 = v14 + v13;
  }
  if (self->_includesBoltImage)
  {
    -[UIImageView sizeThatFits:](self->_boltImageView, "sizeThatFits:", 0.0, v6);
    -[UIImageView setFrame:](self->_boltImageView, "setFrame:", v8 + (v4 - v16) * 0.5, v10 - (v15 + -2.0 - v6) * 0.5);
  }
  -[UIView setFrame:](self->_batteryContainerView, "setFrame:", v8, v10, v4, v6);
}

- (double)_batteryNoseOffset
{
  void *v2;
  int v3;
  char v4;
  double v5;
  double v6;

  v3 = __sb__runningInSpringBoard();
  v4 = v3;
  if (v3)
  {
    v5 = 3.0;
    if (SBFEffectiveDeviceClass() != 2)
      return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 3.0;
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
LABEL_6:

      return v5;
    }
  }
  SBFMainScreenScale();
  BSFloatFloorForScale();
  v5 = v6;
  if ((v4 & 1) == 0)
    goto LABEL_6;
  return v5;
}

- (id)_chargePercentFont
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D1BCB0], "fontSizeForElementType:isLandscapeVariant:", 2, 0);
  v4 = v3;
  if (-[_CSSingleBatteryChargingView horizontalLayoutNeeded](self, "horizontalLayoutNeeded"))
    v4 = 25.0;
  objc_msgSend(MEMORY[0x1E0D1BCB0], "fontWeightForElementType:", 2);
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v4, v5);
}

- (CGSize)batterySize
{
  double width;
  double height;
  CGSize result;

  width = self->_batterySize.width;
  height = self->_batterySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)horizontalLayoutNeeded
{
  return self->_horizontalLayoutNeeded;
}

- (void)setHorizontalLayoutNeeded:(BOOL)a3
{
  self->_horizontalLayoutNeeded = a3;
}

- (BOOL)includesBoltImage
{
  return self->_includesBoltImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boltImageView, 0);
  objc_storeStrong((id *)&self->_boltImage, 0);
  objc_storeStrong((id *)&self->_batteryImage, 0);
  objc_storeStrong((id *)&self->_batteryTopOffset, 0);
  objc_storeStrong((id *)&self->_batteryConstraints, 0);
  objc_storeStrong((id *)&self->_chargePercentLabel, 0);
  objc_storeStrong((id *)&self->_batteryFillView, 0);
  objc_storeStrong((id *)&self->_batteryBlurView, 0);
  objc_storeStrong((id *)&self->_batteryContainerView, 0);
}

@end
