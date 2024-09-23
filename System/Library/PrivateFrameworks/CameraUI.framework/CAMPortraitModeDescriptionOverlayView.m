@implementation CAMPortraitModeDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("PORTRAIT_MODE_DESCRIPTION_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("PORTRAIT_MODE_DESCRIPTION_OVERLAY_CONTINUE"), &stru_1EA3325A0);
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __CFString *v7;

  v3 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "arePortraitEffectsSupported");

  v6 = CFSTR("PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_DESCRIPTION");
  if (v3)
    v6 = CFSTR("PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_DESCRIPTION_NO_NEWLINE");
  if (v5)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("PORTRAIT_MODE_DESCRIPTION_OVERLAY_DESCRIPTION");
  return CAMLocalizedFrameworkString(v7, &stru_1EA3325A0);
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  void *v3;
  int v4;
  __CFString *v5;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "arePortraitEffectsSupported");

  if (v4)
    v5 = CFSTR("PORTRAIT_MODE_LIGHTING_DESCRIPTION_OVERLAY_INFO");
  else
    v5 = CFSTR("PORTRAIT_MODE_DESCRIPTION_OVERLAY_INFO");
  return CAMLocalizedFrameworkString(v5, &stru_1EA3325A0);
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  _BOOL4 v5;
  void *v8;
  int v9;
  double v10;
  double result;
  BOOL v12;

  v5 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "arePortraitEffectsSupported");

  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  if (v9 && a3)
  {
    if (v5)
      UICeilToViewScale();
    else
      return v10 + 312.0;
  }
  else
  {
    if (v9)
    {
      result = v10 * 3.0 + 343.0;
      v12 = !v5;
    }
    else
    {
      v12 = !v5;
      result = 375.0;
    }
    if (!v12)
      return 440.0;
  }
  return result;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  _BOOL4 v5;
  void *v8;
  int v9;
  double v10;
  double result;
  double v12;

  v5 = a4;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "arePortraitEffectsSupported");

  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  if (v9 && a3)
  {
    if (v5)
    {
      UICeilToViewScale();
      return result;
    }
    v12 = 293.0;
    return v10 + v12;
  }
  if (v9)
  {
    if (v5)
    {
      v12 = 470.0;
      return v10 + v12;
    }
    return v10 * 3.0 + 294.0;
  }
  else
  {
    result = v10 + 470.0;
    if (!v5)
      return 376.0;
  }
  return result;
}

@end
