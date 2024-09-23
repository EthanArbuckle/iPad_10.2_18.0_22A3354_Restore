@implementation CAMSpatialModeDescriptionOverlayView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  if (!-[CAMSpatialModeDescriptionOverlayView _didTapAcknowledgement](self, "_didTapAcknowledgement"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMSpatialModeDescriptionOverlayView;
    -[CAMDescriptionOverlayView setOrientation:animated:](&v7, sel_setOrientation_animated_, a3, v4);
  }
}

- (void)acknowledgementButtonTapped
{
  -[CAMSpatialModeDescriptionOverlayView set_didTapAcknowledgement:](self, "set_didTapAcknowledgement:", 1);
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_MODE_DESCRIPTION_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_MODE_DESCRIPTION_OVERLAY_CONTINUE"), &stru_1EA3325A0);
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
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_MODE_OVERLAY_INFO"), &stru_1EA3325A0);
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  double result;

  -[CAMSpatialModeDescriptionOverlayView _maxTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "_maxTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", a3, a4, 1.0);
  return result;
}

- (double)_maxTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  double v5;
  double result;
  double v7;

  if (a3)
    v5 = 340.0;
  else
    v5 = 370.0;
  if (a4)
  {
    UICeilToViewScale();
  }
  else
  {
    -[CAMDescriptionOverlayView additionalSpacing](self, "additionalSpacing", a5);
    return v5 + v7;
  }
  return result;
}

- (BOOL)_didTapAcknowledgement
{
  return self->__didTapAcknowledgement;
}

- (void)set_didTapAcknowledgement:(BOOL)a3
{
  self->__didTapAcknowledgement = a3;
}

@end
