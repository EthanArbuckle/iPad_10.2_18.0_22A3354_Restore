@implementation CAMLowLightStatusIndicator

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[CAMControlStatusIndicator setNeedsUpdateValueText](self, "setNeedsUpdateValueText");
  }
}

- (void)setLowLightMode:(int64_t)a3
{
  if (self->_lowLightMode != a3)
  {
    self->_lowLightMode = a3;
    -[CAMControlStatusIndicator updateImage](self, "updateImage");
  }
}

- (void)setLowLightDisabled:(BOOL)a3
{
  -[CAMLowLightStatusIndicator setLowLightDisabled:animated:](self, "setLowLightDisabled:animated:", a3, 0);
}

- (void)setLowLightDisabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_lowLightDisabled != a3)
  {
    self->_lowLightDisabled = a3;
    -[CAMControlStatusIndicator updateImageAnimated:](self, "updateImageAnimated:", a4);
  }
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (unint64_t)(-[CAMLowLightStatusIndicator lowLightMode](self, "lowLightMode") - 1) < 2;
}

- (BOOL)shouldShowOutlineForCurrentState
{
  return 1;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.nightmode");
}

- (BOOL)canShowValue
{
  return 1;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (id)valueText
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "integerFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLowLightStatusIndicator duration](self, "duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(round(v4), 1.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CAMLocalizedFrameworkString(CFSTR("LOW_LIGHT_DURATION_TEXT"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%@"), 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarLowLightButton");
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMLowLightStatusIndicator shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("CAMLowLightButtonOff-AXHUD");
  }
  else
  {
    -[CAMLowLightStatusIndicator imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (BOOL)isLowLightDisabled
{
  return self->_lowLightDisabled;
}

@end
