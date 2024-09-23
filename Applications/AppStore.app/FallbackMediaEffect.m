@implementation FallbackMediaEffect

+ (id)effectWithBrightness:(unint64_t)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___FallbackMediaEffect;
  v4 = objc_msgSendSuper2(&v7, "effectWithStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "setBrightness:", a3);
  return v5;
}

- (id)effectSettings
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FallbackMediaEffect;
  v3 = -[FallbackMediaEffect effectSettings](&v7, "effectSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[FallbackMediaEffect brightness](self, "brightness");
  switch(v5)
  {
    case 2uLL:
      -[FallbackMediaEffect applyLowLumaSettingsToSettings:](self, "applyLowLumaSettingsToSettings:", v4);
      break;
    case 1uLL:
      -[FallbackMediaEffect applyMediumLumaSettingsToSettings:](self, "applyMediumLumaSettingsToSettings:", v4);
      break;
    case 0uLL:
      -[FallbackMediaEffect applyHighLumaSettingsToSettings:](self, "applyHighLumaSettingsToSettings:", v4);
      break;
  }
  return v4;
}

- (void)applyLowLumaSettingsToSettings:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  v5 = objc_msgSend(v13, "graphicsQuality");
  objc_msgSend(v13, "setRequiresColorStatistics:", 0);
  if (v5 == (id)10 || IsReduceTransparencyEnabled)
  {
    objc_msgSend(v13, "setBackdropVisible:", 0);
    if ((objc_opt_respondsToSelector(v13, "setUsesBackdropEffectView:") & 1) != 0)
      objc_msgSend(v13, "setUsesBackdropEffectView:", 0);
    if ((objc_opt_respondsToSelector(v13, "setUsesColorTintView:") & 1) != 0)
      objc_msgSend(v13, "setUsesColorTintView:", 1);
    objc_msgSend(v13, "setGrayscaleTintLevel:", 0.0);
    objc_msgSend(v13, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v13, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v13, "setGrayscaleTintMaskImage:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0));
    objc_msgSend(v13, "setColorTint:", v8);

    objc_msgSend(v13, "setColorTintAlpha:", 0.65);
    objc_msgSend(v13, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v13, "setColorTintMaskImage:", 0);
    objc_msgSend(v13, "setBlurRadius:", 0.0);
    objc_msgSend(v13, "setSaturationDeltaFactor:", 1.0);
    objc_msgSend(v13, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v13, "setFilterMaskImage:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v13, "setLegibleColor:", v9);

    if (IsReduceTransparencyEnabled)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));

      if (v10)
        v11 = objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));
      else
        v11 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.22745098, 0.247058824, 0.254901961, 1.0));
      v12 = (void *)v11;
      objc_msgSend(v13, "setColorTint:", v11);

      objc_msgSend(v13, "setColorTintAlpha:", 1.0);
    }
  }
  else
  {
    objc_msgSend(v13, "setBackdropVisible:", 1);
    objc_msgSend(v13, "setGrayscaleTintLevel:", 0.0);
    objc_msgSend(v13, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v13, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v13, "setGrayscaleTintMaskImage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.588235294, 0.588235294, 0.588235294, 1.0));
    objc_msgSend(v13, "setColorTint:", v6);

    objc_msgSend(v13, "setColorTintAlpha:", 0.15);
    objc_msgSend(v13, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v13, "setColorTintMaskImage:", 0);
    objc_msgSend(v13, "setBlurRadius:", 90.0);
    objc_msgSend(v13, "setSaturationDeltaFactor:", 1.5);
    objc_msgSend(v13, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v13, "setFilterMaskImage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v13, "setLegibleColor:", v7);

  }
}

- (void)applyMediumLumaSettingsToSettings:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (objc_msgSend(v12, "graphicsQuality") == (id)10 || IsReduceTransparencyEnabled)
  {
    objc_msgSend(v12, "setRequiresColorStatistics:", 0);
    objc_msgSend(v12, "setBackdropVisible:", 0);
    if ((objc_opt_respondsToSelector(v12, "setUsesBackdropEffectView:") & 1) != 0)
      objc_msgSend(v12, "setUsesBackdropEffectView:", 0);
    if ((objc_opt_respondsToSelector(v12, "setUsesColorTintView:") & 1) != 0)
      objc_msgSend(v12, "setUsesColorTintView:", 1);
    objc_msgSend(v12, "setGrayscaleTintLevel:", 1.0);
    objc_msgSend(v12, "setGrayscaleTintAlpha:", 0.3);
    objc_msgSend(v12, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setGrayscaleTintMaskImage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.882352941, 0.882352941, 0.882352941, 1.0));
    objc_msgSend(v12, "setColorTint:", v7);

    objc_msgSend(v12, "setColorTintAlpha:", 0.3);
    objc_msgSend(v12, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setColorTintMaskImage:", 0);
    objc_msgSend(v12, "setBlurRadius:", 0.0);
    objc_msgSend(v12, "setSaturationDeltaFactor:", 1.0);
    objc_msgSend(v12, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v12, "setFilterMaskImage:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v12, "setLegibleColor:", v8);

    if (IsReduceTransparencyEnabled)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));

      if (v9)
        v10 = objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));
      else
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.749019608, 0.768627451, 0.776470588, 1.0));
      v11 = (void *)v10;
      objc_msgSend(v12, "setColorTint:", v10);

      objc_msgSend(v12, "setColorTintAlpha:", 1.0);
    }
  }
  else if (objc_msgSend(v12, "graphicsQuality") == (id)100)
  {
    objc_msgSend(v12, "setRequiresColorStatistics:", 0);
    objc_msgSend(v12, "setBackdropVisible:", 1);
    objc_msgSend(v12, "setGrayscaleTintLevel:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setGrayscaleTintMaskImage:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.882352941, 0.882352941, 0.882352941, 1.0));
    objc_msgSend(v12, "setColorTint:", v5);

    objc_msgSend(v12, "setColorTintAlpha:", 0.4);
    objc_msgSend(v12, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setColorTintMaskImage:", 0);
    objc_msgSend(v12, "setBlurRadius:", 90.0);
    objc_msgSend(v12, "setSaturationDeltaFactor:", 1.8);
    objc_msgSend(v12, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v12, "setFilterMaskImage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v12, "setLegibleColor:", v6);

  }
}

- (void)applyHighLumaSettingsToSettings:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (objc_msgSend(v12, "graphicsQuality") == (id)10 || IsReduceTransparencyEnabled)
  {
    objc_msgSend(v12, "setRequiresColorStatistics:", 0);
    objc_msgSend(v12, "setBackdropVisible:", 0);
    if ((objc_opt_respondsToSelector(v12, "setUsesBackdropEffectView:") & 1) != 0)
      objc_msgSend(v12, "setUsesBackdropEffectView:", 0);
    if ((objc_opt_respondsToSelector(v12, "setUsesColorTintView:") & 1) != 0)
      objc_msgSend(v12, "setUsesColorTintView:", 1);
    objc_msgSend(v12, "setGrayscaleTintLevel:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setGrayscaleTintMaskImage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0));
    objc_msgSend(v12, "setColorTint:", v7);

    objc_msgSend(v12, "setColorTintAlpha:", 0.3);
    objc_msgSend(v12, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setColorTintMaskImage:", 0);
    objc_msgSend(v12, "setBlurRadius:", 0.0);
    objc_msgSend(v12, "setSaturationDeltaFactor:", 1.0);
    objc_msgSend(v12, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v12, "setFilterMaskImage:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v12, "setLegibleColor:", v8);

    if (IsReduceTransparencyEnabled)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));

      if (v9)
        v10 = objc_claimAutoreleasedReturnValue(-[FallbackMediaEffect backgroundColorForReducedTransparency](self, "backgroundColorForReducedTransparency"));
      else
        v10 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.247058824, 0.266666667, 0.274509804, 1.0));
      v11 = (void *)v10;
      objc_msgSend(v12, "setColorTint:", v10);

      objc_msgSend(v12, "setColorTintAlpha:", 1.0);
    }
  }
  else if (objc_msgSend(v12, "graphicsQuality") == (id)100)
  {
    objc_msgSend(v12, "setRequiresColorStatistics:", 0);
    objc_msgSend(v12, "setBackdropVisible:", 1);
    objc_msgSend(v12, "setGrayscaleTintLevel:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintAlpha:", 0.0);
    objc_msgSend(v12, "setGrayscaleTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setGrayscaleTintMaskImage:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 1.0));
    objc_msgSend(v12, "setColorTint:", v5);

    objc_msgSend(v12, "setColorTintAlpha:", 0.4);
    objc_msgSend(v12, "setColorTintMaskAlpha:", 1.0);
    objc_msgSend(v12, "setColorTintMaskImage:", 0);
    objc_msgSend(v12, "setBlurRadius:", 90.0);
    objc_msgSend(v12, "setSaturationDeltaFactor:", 1.8);
    objc_msgSend(v12, "setFilterMaskAlpha:", 1.0);
    objc_msgSend(v12, "setFilterMaskImage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v12, "setLegibleColor:", v6);

  }
}

- (UIColor)backgroundColorForReducedTransparency
{
  return self->_backgroundColorForReducedTransparency;
}

- (void)setBackgroundColorForReducedTransparency:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorForReducedTransparency, a3);
}

- (unint64_t)brightness
{
  return self->_brightness;
}

- (void)setBrightness:(unint64_t)a3
{
  self->_brightness = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorForReducedTransparency, 0);
}

@end
