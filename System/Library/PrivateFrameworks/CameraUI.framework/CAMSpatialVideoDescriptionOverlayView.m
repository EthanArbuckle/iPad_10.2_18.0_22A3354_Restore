@implementation CAMSpatialVideoDescriptionOverlayView

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v7;

  v4 = a4;
  if (!-[CAMSpatialVideoDescriptionOverlayView _didTapDetail](self, "_didTapDetail"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
    -[CAMDescriptionOverlayView setOrientation:animated:](&v7, sel_setOrientation_animated_, a3, v4);
  }
}

- (BOOL)isTitleMultiline
{
  return 1;
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_CAPTURE_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_CAPTURE_OVERLAY_SET_UP_LATER"), &stru_1EA3325A0);
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_CAPTURE_OVERLAY_DESCRIPTION"), &stru_1EA3325A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CB3778]);
  CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_CAPTURE_OVERLAY_DESCRIPTION_LINK"), &stru_1EA3325A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  v10 = *MEMORY[0x1E0DC1140];
  CAMYellowColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:value:range:", v10, v11, 0, objc_msgSend(v9, "length"));

  v12 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowColor:", v13);

  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);
  objc_msgSend(v12, "setShadowBlurRadius:", 3.0);
  objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1198], v12, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v3, "appendAttributedString:", v6);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  objc_msgSend(v3, "appendAttributedString:", v14);

  objc_msgSend(v3, "appendAttributedString:", v9);
  return v3;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  double result;

  -[CAMSpatialVideoDescriptionOverlayView _maxTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "_maxTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", a3, a4, 1.0);
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

- (void)detailButtonTapped
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
  -[CAMDescriptionOverlayView detailButtonTapped](&v3, sel_detailButtonTapped);
  -[CAMSpatialVideoDescriptionOverlayView set_didTapDetail:](self, "set_didTapDetail:", 1);
}

- (void)handleDescriptionLabelTapped:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMSpatialVideoDescriptionOverlayView;
  -[CAMDescriptionOverlayView handleDescriptionLabelTapped:](&v4, sel_handleDescriptionLabelTapped_, a3);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/guide/iphone/record-spatial-videos-for-apple-vision-pro-iph6e3a6d4fe/ios"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMOpenURL(v3, MEMORY[0x1E0C9AA70]);

}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_CAPTURE_OVERLAY_CONTINUE"), &stru_1EA3325A0);
}

- (BOOL)detailTextShouldHaveVibrancyEffect
{
  return 0;
}

- (int64_t)buttonStyle
{
  return 1;
}

- (BOOL)_didTapDetail
{
  return self->__didTapDetail;
}

- (void)set_didTapDetail:(BOOL)a3
{
  self->__didTapDetail = a3;
}

@end
