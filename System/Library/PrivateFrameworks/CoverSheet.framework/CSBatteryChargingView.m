@implementation CSBatteryChargingView

+ (id)batteryChargingViewWithSingleBattery
{
  _CSSingleBatteryChargingView *v2;

  v2 = [_CSSingleBatteryChargingView alloc];
  return -[_CSSingleBatteryChargingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)batteryChargingViewWithDoubleBattery
{
  _CSDoubleBatteryChargingView *v2;

  v2 = [_CSDoubleBatteryChargingView alloc];
  return -[_CSDoubleBatteryChargingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

+ (id)horizontalBatteryChargingViewForBatterySize:(CGSize)a3 includeBoltImage:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  _CSSingleBatteryChargingView *v7;
  _CSSingleBatteryChargingView *v8;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v7 = [_CSSingleBatteryChargingView alloc];
  v8 = -[_CSSingleBatteryChargingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_CSSingleBatteryChargingView setBatterySize:](v8, "setBatterySize:", width, height);
  -[_CSSingleBatteryChargingView setHorizontalLayoutNeeded:](v8, "setHorizontalLayoutNeeded:", 1);
  -[_CSSingleBatteryChargingView setIncludesBoltImage:](v8, "setIncludesBoltImage:", v4);
  return v8;
}

+ (id)batteryChargingRingViewWithConfiguration:(id)a3
{
  id v3;
  CSBatteryChargingRingView *v4;
  CSBatteryChargingRingView *v5;

  v3 = a3;
  v4 = [CSBatteryChargingRingView alloc];
  v5 = -[CSBatteryChargingRingView initWithFrame:configuration:](v4, "initWithFrame:configuration:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v5;
}

+ (id)maskImageNameForChargingBattery
{
  __CFString *v2;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(CFSTR("LockScreenChargingBatteryMask"), "stringByAppendingString:", CFSTR("-RTL"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("LockScreenChargingBatteryMask");
  }
  return v2;
}

+ (id)maskImageNameForInternalChargingBattery
{
  __CFString *v2;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    objc_msgSend(CFSTR("LockScreenInternalChargingBatteryMask"), "stringByAppendingString:", CFSTR("-RTL"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("LockScreenInternalChargingBatteryMask");
  }
  return v2;
}

+ (id)maskImageNameForExternalChargingBattery
{
  return CFSTR("LockScreenExternalChargingBatteryMask");
}

- (CSBatteryChargingView)initWithFrame:(CGRect)a3
{
  CSBatteryChargingView *v3;
  CSBatteryChargingView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSBatteryChargingView;
  v3 = -[CSBatteryChargingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_alignmentPercent = 0.0;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBatteryChargingView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v5;

  p_legibilitySettings = &self->_legibilitySettings;
  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_legibilitySettings, a3);

}

- (BOOL)batteryVisible
{
  return 0;
}

- (int64_t)batteryCount
{
  return 0;
}

- (double)desiredVisibilityDuration
{
  return 0.0;
}

- (void)setAlignmentPercent:(double)a3
{
  self->_alignmentPercent = a3;
  -[CSBatteryChargingView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_updateChargeString:(id)a3 oldLabel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  objc_msgSend(a4, "removeFromSuperview");
  objc_msgSend(MEMORY[0x1E0DA9E38], "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateStrengthForStyle:", objc_msgSend(v8, "style"));
  v10 = v9;

  v11 = objc_alloc(MEMORY[0x1E0DAC5D8]);
  -[CSBatteryChargingView legibilitySettings](self, "legibilitySettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSBatteryChargingView _chargePercentFont](self, "_chargePercentFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithSettings:strength:string:font:", v12, v6, v13, v10);

  -[CSBatteryChargingView addSubview:](self, "addSubview:", v14);
  return v14;
}

- (id)_chargePercentFont
{
  return 0;
}

- (CGSize)_imageViewScalingCorrectedBatterySize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = round(a3.width * 1.0735);
  v4 = round(a3.height * 1.0735);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_batteryHeight
{
  void *v2;
  double v3;
  double v4;
  int v5;
  double result;

  objc_msgSend(MEMORY[0x1E0D1BCB0], "fontSizeForElementType:isLandscapeVariant:", 1, 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capHeight");
  v4 = round(v3);

  v5 = BSFloatEqualToFloat();
  result = 73.0;
  if (!v5)
    return v4;
  return result;
}

- (double)horizontalGapBetweenBatteryAndPercentLabel
{
  return 10.0;
}

- (CGPoint)_batteryCenter
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v6;
  double v7;
  CGPoint result;
  CGRect v9;
  CGRect v10;

  -[CSBatteryChargingView _tightFrameForElement:](self, "_tightFrameForElement:", 1);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGRectGetMidY(v10);
  SBFMainScreenScale();
  BSPointRoundForScale();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)_tightFrameForElement:(unint64_t)a3
{
  CSProminentLayoutController *prominentLayoutController;
  CSProminentLayoutController *v6;
  CSProminentLayoutController *v7;
  CSProminentLayoutController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  prominentLayoutController = self->_prominentLayoutController;
  if (prominentLayoutController)
  {
    -[CSProminentLayoutController setTraitEnvironment:](prominentLayoutController, "setTraitEnvironment:", self);
  }
  else
  {
    v6 = (CSProminentLayoutController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BCB0]), "initWithTraitEnvironment:", self);
    v7 = self->_prominentLayoutController;
    self->_prominentLayoutController = v6;

  }
  v8 = self->_prominentLayoutController;
  -[CSBatteryChargingView bounds](self, "bounds");
  -[CSProminentLayoutController frameForElements:variant:withBoundingRect:](v8, "frameForElements:variant:withBoundingRect:", a3, 1);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_prominentLayoutController, 0);
}

@end
