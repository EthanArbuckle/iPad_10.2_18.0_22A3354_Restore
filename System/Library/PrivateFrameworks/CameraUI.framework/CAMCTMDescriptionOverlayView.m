@implementation CAMCTMDescriptionOverlayView

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("QUICKTAKE_DESCRIPTION_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("CTM_DESCRIPTION_OVERLAY_CONTINUE"), &stru_1EA3325A0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("CTM_DESCRIPTION_OVERLAY_INFO"), &stru_1EA3325A0);
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double result;
  double v9;

  v5 = a4;
  v6 = a3;
  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  if (v6)
  {
    if (v5)
      goto LABEL_5;
    v9 = 270.0;
  }
  else
  {
    if (v5)
    {
LABEL_5:
      UICeilToViewScale();
      return result;
    }
    v9 = 300.0;
  }
  return v7 + v9;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double result;

  v5 = a4;
  v6 = a3;
  -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing");
  if (!v6)
  {
    if (!v5)
    {
      v8 = 240.0;
      return v7 + v8;
    }
LABEL_5:
    UICeilToViewScale();
    return result;
  }
  if (v5)
    goto LABEL_5;
  v8 = 210.0;
  return v7 + v8;
}

@end
