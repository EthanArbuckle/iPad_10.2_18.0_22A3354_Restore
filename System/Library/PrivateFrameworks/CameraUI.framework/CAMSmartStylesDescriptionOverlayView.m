@implementation CAMSmartStylesDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_DESCRIPTION_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_DESCRIPTION_OVERLAY_SET_UP"), &stru_1EA3325A0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_DESCRIPTION_OVERLAY_CONTINUE"), &stru_1EA3325A0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SMART_STYLES_DESCRIPTION_OVERLAY_DESCRIPTION"), &stru_1EA3325A0);
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double result;

  v5 = a4;
  v6 = a3;
  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  v8 = 370.0;
  if (v6)
    v8 = 340.0;
  if (v5)
    v7 = 0.0;
  result = v8 + v7;
  if (v5)
    UICeilToViewScale();
  return result;
}

@end
