@implementation CAMPhotoModeDepthDescriptionOverlayView

- (CAMPhotoModeDepthDescriptionOverlayView)initWithFrame:(CGRect)a3
{
  CAMPhotoModeDepthDescriptionOverlayView *v3;
  CAMDepthEffectSuggestionButton *v4;
  CAMDepthEffectSuggestionButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  v3 = -[CAMDescriptionOverlayView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMDepthEffectSuggestionButton);
    button = v3->__button;
    v3->__button = v4;

    -[CAMDepthEffectSuggestionButton addTarget:action:forControlEvents:](v3->__button, "addTarget:action:forControlEvents:", v3, sel__handleDidTapButton_, 64);
    -[CAMPhotoModeDepthDescriptionOverlayView addSubview:](v3, "addSubview:", v3->__button);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double width;
  double height;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  -[CAMDescriptionOverlayView layoutSubviews](&v6, sel_layoutSubviews);
  -[CAMPhotoModeDepthDescriptionOverlayView _button](self, "_button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  CEKRectWithSize();
  v8 = CGRectInset(v7, -29.0, -16.0);
  width = v8.size.width;
  height = v8.size.height;
  -[CAMDescriptionOverlayView viewportFrame](self, "viewportFrame", v8.origin.x, v8.origin.y);
  objc_msgSend(v3, "setFrame:", 0.0, CGRectGetMaxY(v9) - height, width, height);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CAMPhotoModeDepthDescriptionOverlayView;
  -[CAMDescriptionOverlayView setOrientation:animated:](&v8, sel_setOrientation_animated_);
  -[CAMPhotoModeDepthDescriptionOverlayView _button](self, "_button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOrientation:animated:", a3, v4);

}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("PHOTO_MODE_DEPTH_OVERLAY_TITLE"), &stru_1EA3325A0);
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return CAMLocalizedFrameworkString(CFSTR("PHOTO_MODE_DEPTH_DESCRIPTION_OVERLAY_CONTINUE"), &stru_1EA3325A0);
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  CAMLocalizedFrameworkString(CFSTR("PHOTO_MODE_DEPTH_OVERLAY_DESCRIPTION_%@_GLYPH"), &stru_1EA3325A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
  v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("%@"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("f.cursive.circle.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceCharactersInRange:withAttributedString:", v7, v8, v11);

  }
  return v4;
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

- (void)setCustomSubviewsVisible:(BOOL)a3
{
  double v3;
  id v4;

  v3 = (double)a3;
  -[CAMPhotoModeDepthDescriptionOverlayView _button](self, "_button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

}

- (void)_handleDidTapButton:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "mode");
  v4 = v3;
  if (v3 <= 2)
    v4 = qword_1DB9A7900[v3];
  objc_msgSend(v5, "setMode:", v4);

}

- (CAMDepthEffectSuggestionButton)_button
{
  return self->__button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__button, 0);
}

@end
