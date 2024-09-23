@implementation _SFSiteIconView

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id *p_monogramLabel;
  double v18;
  double v19;
  _SFHairlineBorderView *borderView;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  double v34;
  uint64_t v35;
  _BOOL8 v36;
  double v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)_SFSiteIconView;
  -[_SFSiteIconView layoutSubviews](&v39, sel_layoutSubviews);
  -[_SFSiteIconView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  -[_SFSiteIconView _effectiveBackgroundColor](self, "_effectiveBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](self->_backgroundView, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  if (-[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance"))
  {
    if (!self->_preferredBackgroundColor
      || (objc_msgSend(MEMORY[0x1E0DC3658], "clearColor"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = WBSIsEqual(),
          v14,
          v15))
    {
      if (self->_preferredBackgroundEffect)
      {
        -[_SFSiteIconView _applyBackgroundEffect:](self, "_applyBackgroundEffect:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _applyBackgroundEffect:](self, "_applyBackgroundEffect:", v16);

      }
    }
  }
  if (self->_state == 2)
  {
    -[_SFSiteIconView _updateMonogramLabelSizeAndFont](self, "_updateMonogramLabelSizeAndFont");
    p_monogramLabel = (id *)&self->_monogramLabel;
    -[UILabel frame](self->_monogramLabel, "frame");
    v19 = _SFRoundRectToPixels(v5 + (v9 - v18) * 0.5);
  }
  else
  {
    -[_SFSiteIconView _updateGlyphConfiguration](self, "_updateGlyphConfiguration");
    -[_SFSiteIconView _imageFrame](self, "_imageFrame");
    p_monogramLabel = (id *)&self->_imageView;
  }
  objc_msgSend(*p_monogramLabel, "setFrame:", v19);
  borderView = self->_borderView;
  if (borderView || self->_shadowView)
  {
    -[_SFHairlineBorderView setFrame:](borderView, "setFrame:", v5, v7, v9, v11);
    -[UIImageView image](self->_shadowView, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alignmentRectInsets");
    UIEdgeInsetsSubtract();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UIImageView setFrame:](self->_shadowView, "setFrame:", v5 + v25, v7 + v23, v9 - (v25 + v29), v11 - (v23 + v27));
    -[UIImageView layer](self->_imageView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_action
      || (-[UIImageView image](self->_imageView, "image"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "safari_transparencyAnalysisResult"),
          v31,
          v32 != 4))
    {
      objc_msgSend(v30, "setShadowColor:", 0);
      LODWORD(v37) = 0;
      objc_msgSend(v30, "setShadowOpacity:", v37);
      if (-[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance")
        || self->_action
        || !self->_allowsDropShadow)
      {
        v36 = 1;
      }
      else if (self->_state == 2)
      {
        v36 = self->_monogramLabel == 0;
      }
      else
      {
        -[_SFSiteIconView image](self, "image");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v38 == 0;

      }
      v35 = 1;
    }
    else
    {
      objc_msgSend(v30, "setShadowRadius:", 12.0);
      objc_msgSend(v30, "setShadowOffset:", 0.0, 6.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v30, "setShadowColor:", objc_msgSend(v33, "CGColor"));

      LODWORD(v34) = *(_DWORD *)"\nף=";
      objc_msgSend(v30, "setShadowOpacity:", v34);
      v35 = 0;
      v36 = 1;
    }
    -[_SFHairlineBorderView setHidden:](self->_borderView, "setHidden:", v36);
    -[UIImageView setHidden:](self->_shadowView, "setHidden:", v36);
    -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", v35);

  }
}

- (BOOL)usesVibrantAppearance
{
  return 0;
}

- (id)_effectiveBackgroundColor
{
  void *v3;
  uint64_t v4;
  UIColor *v5;

  if (self->_action
    || (-[UIImageView image](self->_imageView, "image"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "safari_transparencyAnalysisResult"),
        v3,
        v4 != 4))
  {
    v5 = self->_preferredBackgroundColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)_updateGlyphConfiguration
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_state == 1)
  {
    -[UIImageView image](self->_imageView, "image");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isSymbolImage"))
      v4 = v3 == 0;
    else
      v4 = 1;
    if (!v4)
    {
      -[_SFSiteIconView _glyphConfiguration](self, "_glyphConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqual:", v5) & 1) == 0)
      {
        objc_msgSend(v7, "imageWithConfiguration:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setImage:](self->_imageView, "setImage:", v6);

      }
    }

  }
}

- (CGRect)_imageFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  _BOOL4 imageIsTransparent;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  if (self->_state == 1)
  {
    -[UIImageView image](self->_imageView, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v5 = v4;
    -[_SFSiteIconView bounds](self, "bounds");
    x = _SFRoundRectToPixels(v7 + (v6 - v5) * 0.5);
    y = v9;
    width = v11;
    height = v13;

  }
  else
  {
    imageIsTransparent = self->_imageIsTransparent;
    -[_SFSiteIconView bounds](self, "bounds");
    x = v16;
    y = v17;
    width = v18;
    height = v19;
    if (imageIsTransparent)
    {
      v24 = CGRectInset(*(CGRect *)&v16, 6.0, 6.0);
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;
    }
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)setVisualEffectGroupName:(id)a3
{
  -[UIVisualEffectView _setGroupName:](self->_backgroundView, "_setGroupName:", a3);
}

- (void)setBackdropCaptureView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UIVisualEffectView _captureView](self->_backgroundView, "_captureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
    -[UIVisualEffectView _setCaptureView:](self->_backgroundView, "_setCaptureView:", v6);

}

- (void)setAllowsDropShadow:(BOOL)a3
{
  id v4;
  id v5;
  UIImageView *v6;
  UIImageView *shadowView;
  _SFHairlineBorderView *v8;
  _SFHairlineBorderView *borderView;
  void *v10;
  void *v11;

  if (self->_allowsDropShadow != a3)
  {
    self->_allowsDropShadow = a3;
    if (a3)
    {
      if (!self->_shadowView)
      {
        v4 = objc_alloc(MEMORY[0x1E0DC3890]);
        if (shadowImage_onceToken != -1)
          dispatch_once(&shadowImage_onceToken, &__block_literal_global_6);
        v5 = (id)shadowImage_image;
        v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
        shadowView = self->_shadowView;
        self->_shadowView = v6;

        -[_SFSiteIconView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
      }
      if (!self->_borderView)
      {
        v8 = objc_alloc_init(_SFHairlineBorderView);
        borderView = self->_borderView;
        self->_borderView = v8;

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "colorWithAlphaComponent:", 0.07);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFHairlineBorderView setBorderColor:](self->_borderView, "setBorderColor:", v11);

        -[_SFSiteIconView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_borderView, self->_imageView);
      }
    }
    -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (_SFSiteIconView)initWithFrame:(CGRect)a3
{
  _SFSiteIconView *v3;
  _SFSiteIconView *v4;
  BOOL v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *backgroundView;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *imageView;
  _SFSiteIconView *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_SFSiteIconView;
  v3 = -[_SFSiteIconView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFSiteIconView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = -[_SFSiteIconView usesVibrantAppearance](v4, "usesVibrantAppearance");
    v6 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v6;

    -[UIVisualEffectView setClipsToBounds:](v4->_backgroundView, "setClipsToBounds:", 1);
    if (v5)
    {
      v8 = 0;
    }
    else
    {
      +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIVisualEffectView contentView](v4->_backgroundView, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSiteIconView _applyBackgroundEffect:](v4, "_applyBackgroundEffect:", v10);

    }
    else
    {

      -[_SFSiteIconView _applyBackgroundEffect:](v4, "_applyBackgroundEffect:", 0);
    }
    -[_SFSiteIconView addSubview:](v4, "addSubview:", v4->_backgroundView);
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v11;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[_SFSiteIconView addSubview:](v4, "addSubview:", v4->_imageView);
    +[_SFSiteIcon cornerRadius](_SFSiteIcon, "cornerRadius");
    -[_SFSiteIconView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    v13 = v4;
  }

  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSiteIconView;
  -[_SFSiteIconView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", a3);
}

- (void)_applyBackgroundEffect:(id)a3
{
  -[UIVisualEffectView setEffect:](self->_backgroundView, "setEffect:", a3);
}

- (void)_updateMonogramLabelSizeAndFont
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  void *v10;

  v3 = -[_SFSiteIconView _inferredIconSize](self, "_inferredIconSize");
  -[_SFSiteIconView _monogramFontSize](self, "_monogramFontSize");
  v5 = v4;
  +[_SFSiteIcon labelWidthForIconSize:](_SFSiteIcon, "labelWidthForIconSize:", v3);
  v7 = v6;
  -[UILabel frame](self->_monogramLabel, "frame");
  if (v8 != v7)
  {
    v9 = (double *)MEMORY[0x1E0DC1430];
    if (!v3)
      v9 = (double *)MEMORY[0x1E0DC1440];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v5, *v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_monogramLabel, "setFont:", v10);

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", 0.0, 0.0, v7, v7);
  }
}

- (double)_monogramFontSize
{
  double result;

  if (self->_action)
    return 24.0;
  +[_SFSiteIcon fontPointSizeForIconSize:](_SFSiteIcon, "fontPointSizeForIconSize:", -[_SFSiteIconView _inferredIconSize](self, "_inferredIconSize"));
  return result;
}

- (void)_updateSiteIconViewWithTouchIconResponse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  if (!self->_leadingImage)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D89D00]);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60___SFSiteIconView__updateSiteIconViewWithTouchIconResponse___block_invoke;
    v16[3] = &unk_1E21E2050;
    v16[4] = self;
    objc_msgSend(v5, "setHandler:", v16);
    objc_msgSend(v4, "touchIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WebBookmark isFolder](self->_bookmark, "isFolder");
    if (v6)
    {
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v4, "extractedBackgroundColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _setSiteIcon:withBackgroundColor:](self, "_setSiteIcon:withBackgroundColor:", v6, v8);
LABEL_11:

        goto LABEL_12;
      }
      -[_SFSiteIconView _setSiteIcon:withBackgroundColor:](self, "_setSiteIcon:withBackgroundColor:", v6, 0);
    }
    else if ((v7 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0D8AD28];
      -[WebBookmark title](self->_bookmark, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E98];
      -[WebBookmark address](self->_bookmark, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_URLWithUserTypedString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "monogramStringForTitle:url:", v10, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v4, "extractedBackgroundColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _setMonogramWithString:backgroundColor:](self, "_setMonogramWithString:backgroundColor:", v8, v14);
      }
      else
      {
        +[_SFSiteIcon defaultGlyph](_SFSiteIcon, "defaultGlyph");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "extractedBackgroundColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _setGlyph:withBackgroundColor:](self, "_setGlyph:withBackgroundColor:", v14, v15);

      }
      -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_11;
    }
LABEL_12:

  }
}

- (void)_setSiteIcon:(id)a3 withBackgroundColor:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[_SFSiteIconView _setState:](self, "_setState:", 0);
  -[_SFSiteIconView _setImage:withBackgroundColor:](self, "_setImage:withBackgroundColor:", v7, v6);

}

- (void)_setState:(int64_t)a3
{
  _BOOL8 v5;
  UIImage *leadingImage;

  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = a3 == 2;
    -[UILabel setHidden:](self->_monogramLabel, "setHidden:", a3 != 2);
    -[UIImageView setHidden:](self->_imageView, "setHidden:", v5);
    if (a3 != 3)
    {
      leadingImage = self->_leadingImage;
      self->_leadingImage = 0;

    }
  }
}

- (void)_setImage:(id)a3 withBackgroundColor:(id)a4
{
  id v6;
  UIColor **p_preferredBackgroundColor;
  uint64_t v8;
  UIColor *v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIImageView setImage:](self->_imageView, "setImage:", v13);
  p_preferredBackgroundColor = &self->_preferredBackgroundColor;
  objc_storeStrong((id *)&self->_preferredBackgroundColor, a4);
  if (!-[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance") && !*p_preferredBackgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *p_preferredBackgroundColor;
    *p_preferredBackgroundColor = (UIColor *)v8;

  }
  v10 = objc_msgSend(v13, "safari_transparencyAnalysisResult");
  v11 = -[WebBookmark isFolder](self->_bookmark, "isFolder");
  if (v10 <= 4)
    v12 = (5u >> v10) & 1;
  else
    LOBYTE(v12) = 1;
  if ((v11 & 1) != 0)
    LOBYTE(v12) = 0;
  self->_imageIsTransparent = v12;
  -[_SFSiteIconView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_setMonogramWithString:(id)a3 backgroundColor:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  UILabel *monogramLabel;
  UILabel *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[_SFSiteIconView _setState:](self, "_setState:", 2);
  if (-[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance"))
  {
    +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
    {

      v6 = 0;
    }
  }
  else if (!v6)
  {
    +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UILabel text](self->_monogramLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v16))
  {
    v10 = objc_msgSend(v6, "isEqual:", self->_preferredBackgroundColor);

    if ((v10 & 1) != 0)
      goto LABEL_15;
  }
  else
  {

  }
  monogramLabel = self->_monogramLabel;
  if (!monogramLabel)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v13 = self->_monogramLabel;
    self->_monogramLabel = v12;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_monogramLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setTextAlignment:](self->_monogramLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_monogramLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_monogramLabel, "setTextColor:", v14);

    if (objc_msgSend(v16, "_isSingleEmoji"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setShadowColor:](self->_monogramLabel, "setShadowColor:", v15);

      -[UILabel setShadowOffset:](self->_monogramLabel, "setShadowOffset:", 1.0, 1.0);
    }
    -[_SFSiteIconView addSubview:](self, "addSubview:", self->_monogramLabel);
    monogramLabel = self->_monogramLabel;
  }
  -[UILabel setText:](monogramLabel, "setText:", v16);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, v6);
  -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
LABEL_15:

}

- (void)setBookmark:(id)a3
{
  WebBookmark *v5;
  UIImage *leadingImage;
  UIAction *action;
  WebBookmark *v8;

  v5 = (WebBookmark *)a3;
  leadingImage = self->_leadingImage;
  v8 = v5;
  if (self->_bookmark != v5)
  {
    if (!leadingImage)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (leadingImage)
  {
LABEL_5:
    -[_SFSiteIconView _setState:](self, "_setState:", 2);
LABEL_6:
    action = self->_action;
    self->_action = 0;

    objc_storeStrong((id *)&self->_bookmark, a3);
    -[_SFSiteIconView updateBookmarkData](self, "updateBookmarkData");
  }

}

- (UIAction)action
{
  return self->_action;
}

- (void)updateBookmarkData
{
  WebBookmark *v3;
  void *v4;
  void *v5;
  id v6;
  WebBookmark *v7;
  void *v8;
  id touchIconRequestToken;
  _QWORD v10[4];
  id v11;
  WebBookmark *v12;
  id v13;
  id location;

  -[_SFSiteIconView _cancelTouchIconRequest](self, "_cancelTouchIconRequest");
  if (*(_OWORD *)&self->_bookmark == 0)
  {
    -[_SFSiteIconView _setSiteIcon:withBackgroundColor:](self, "_setSiteIcon:withBackgroundColor:", 0, 0);
    -[_SFSiteIconView setHidden:](self, "setHidden:", 1);
  }
  else
  {
    objc_initWeak(&location, self);
    -[_SFSiteIconView setHidden:](self, "setHidden:", 0);
    if (-[WebBookmark isFolder](self->_bookmark, "isFolder"))
      -[_SFSiteIconView _displayDefaultFolderIcon](self, "_displayDefaultFolderIcon");
    else
      -[_SFSiteIconView _updateSiteIconViewWithTouchIconResponse:](self, "_updateSiteIconViewWithTouchIconResponse:", 0);
    v3 = self->_bookmark;
    +[SFBookmarkTouchIconRequest requestWithBookmark:iconGenerationEnabled:](SFBookmarkTouchIconRequest, "requestWithBookmark:iconGenerationEnabled:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFSiteMetadataManager sharedSiteMetadataManager](_SFSiteMetadataManager, "sharedSiteMetadataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37___SFSiteIconView_updateBookmarkData__block_invoke;
    v10[3] = &unk_1E21E30D0;
    objc_copyWeak(&v13, &location);
    v6 = v4;
    v11 = v6;
    v7 = v3;
    v12 = v7;
    objc_msgSend(v5, "registerRequest:priority:responseHandler:", v6, 2, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    touchIconRequestToken = self->_touchIconRequestToken;
    self->_touchIconRequestToken = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelTouchIconRequest
{
  void *v3;
  id touchIconRequestToken;

  if (self->_touchIconRequestToken)
  {
    +[_SFSiteMetadataManager sharedSiteMetadataManager](_SFSiteMetadataManager, "sharedSiteMetadataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithToken:", self->_touchIconRequestToken);

    touchIconRequestToken = self->_touchIconRequestToken;
    self->_touchIconRequestToken = 0;

  }
}

- (int64_t)_inferredIconSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t result;
  double v11;
  double v12;
  double v13;
  double v14;

  +[_SFSiteIcon sizeForIconSize:](_SFSiteIcon, "sizeForIconSize:", 0);
  v4 = v3;
  v6 = v5;
  -[_SFSiteIconView bounds](self, "bounds");
  result = 0;
  if (v7 > v4 && v8 > v6)
  {
    v11 = v7;
    v12 = v8;
    +[_SFSiteIcon sizeForIconSize:](_SFSiteIcon, "sizeForIconSize:", 1);
    if (v12 > v14 && v11 > v13)
      return 2;
    else
      return 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFSiteIconView _cancelTouchIconRequest](self, "_cancelTouchIconRequest");
  v3.receiver = self;
  v3.super_class = (Class)_SFSiteIconView;
  -[_SFSiteIconView dealloc](&v3, sel_dealloc);
}

- (void)setImage:(id)a3
{
  WebBookmark *bookmark;
  id v5;
  UIAction *action;

  bookmark = self->_bookmark;
  self->_bookmark = 0;
  v5 = a3;

  action = self->_action;
  self->_action = 0;

  -[_SFSiteIconView _cancelTouchIconRequest](self, "_cancelTouchIconRequest");
  -[_SFSiteIconView _setState:](self, "_setState:", 0);
  -[_SFSiteIconView _setImage:withBackgroundColor:](self, "_setImage:withBackgroundColor:", v5, 0);

  -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAction:(id)a3
{
  -[_SFSiteIconView setAction:backgroundEffect:](self, "setAction:backgroundEffect:", a3, 0);
}

- (void)setAction:(id)a3 backgroundEffect:(id)a4
{
  id v7;
  WebBookmark *bookmark;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_action, a3);
    if (v12)
    {
      bookmark = self->_bookmark;
      self->_bookmark = 0;

      -[_SFSiteIconView _cancelTouchIconRequest](self, "_cancelTouchIconRequest");
      v9 = -[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance");
      objc_msgSend(v12, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        if (v7)
        {
          -[_SFSiteIconView _setGlyph:withBackgroundEffect:](self, "_setGlyph:withBackgroundEffect:", v10, v7);
LABEL_10:

          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _setGlyph:withBackgroundEffect:](self, "_setGlyph:withBackgroundEffect:", v10, v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSiteIconView _setGlyph:withBackgroundColor:](self, "_setGlyph:withBackgroundColor:", v10, v11);
      }

      goto LABEL_10;
    }
    -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_11:

}

- (int64_t)imageContentMode
{
  return -[UIImageView contentMode](self->_imageView, "contentMode");
}

- (void)setImageContentMode:(int64_t)a3
{
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", a3);
}

- (void)_displayDefaultFolderIcon
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[_SFSiteIconView usesVibrantAppearance](self, "usesVibrantAppearance");
  -[_SFSiteIconView _tintedFolderImage](self, "_tintedFolderImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "_sf_defaultStartPageBackgroundEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView _setGlyph:withBackgroundEffect:](self, "_setGlyph:withBackgroundEffect:", v5, v4);
  }
  else
  {
    +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSiteIconView _setGlyph:withBackgroundColor:](self, "_setGlyph:withBackgroundColor:", v5, v4);
  }

}

- (void)updateSiteIconViewWithLinkMetadata:(id)a3 requiredImageSize:(CGSize)a4 fallbackIcon:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "platformImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "icon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "platformImage");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 2);
  v16 = objc_alloc_init(MEMORY[0x1E0D89D00]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __85___SFSiteIconView_updateSiteIconViewWithLinkMetadata_requiredImageSize_fallbackIcon___block_invoke;
  v37[3] = &unk_1E21E2050;
  v37[4] = self;
  objc_msgSend(v16, "setHandler:", v37);
  if (!v14)
    goto LABEL_14;
  objc_msgSend(v14, "size");
  if (v17 < width)
  {
    objc_msgSend(v14, "size");
    if (v18 < height)
      goto LABEL_14;
  }
  objc_msgSend(v14, "size");
  v20 = v19;
  objc_msgSend(v14, "size");
  v22 = v21;
  objc_msgSend(v14, "size");
  if (v20 >= v22)
    v25 = v24;
  else
    v25 = v23;
  objc_msgSend(v14, "size");
  v27 = v26;
  objc_msgSend(v14, "size");
  v29 = v28;
  objc_msgSend(v14, "size");
  if (v27 <= v29)
    v30 = v31;
  if (v25 / v30 > 0.3)
  {
    -[_SFSiteIconView setImage:](self, "setImage:", v14);
  }
  else
  {
LABEL_14:
    v32 = (void *)MEMORY[0x1E0D8AD28];
    objc_msgSend(v9, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "monogramStringForTitle:url:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v35, "length"))
    {
      if (v14)
        objc_msgSend(MEMORY[0x1E0D8AC90], "keyColorForIcon:", v14);
      else
        +[_SFSiteIcon defaultIconKeyColor](_SFSiteIcon, "defaultIconKeyColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSiteIconView _setMonogramWithString:backgroundColor:](self, "_setMonogramWithString:backgroundColor:", v35, v36);
      -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");

    }
    else
    {
      -[_SFSiteIconView setImage:](self, "setImage:", v10);
    }

  }
}

- (NSString)visualEffectGroupName
{
  return (NSString *)-[UIVisualEffectView _groupName](self->_backgroundView, "_groupName");
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return (_UIVisualEffectBackdropView *)-[UIVisualEffectView _captureView](self->_backgroundView, "_captureView");
}

- (void)setLeadingImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_leadingImage, a3);
  v5 = a3;
  -[_SFSiteIconView _setState:](self, "_setState:", 3);
  -[_SFSiteIconView _setImage:withBackgroundColor:](self, "_setImage:withBackgroundColor:", v5, 0);

}

- (void)_setGlyph:(id)a3 withBackgroundColor:(id)a4
{
  UIColor *v6;
  id v7;
  UIColor *preferredBackgroundColor;
  UIColor *v9;
  UIVisualEffect *preferredBackgroundEffect;

  v6 = (UIColor *)a4;
  v7 = a3;
  -[_SFSiteIconView _setState:](self, "_setState:", 1);
  -[UIImageView setImage:](self->_imageView, "setImage:", v7);

  preferredBackgroundColor = self->_preferredBackgroundColor;
  self->_preferredBackgroundColor = v6;
  v9 = v6;

  preferredBackgroundEffect = self->_preferredBackgroundEffect;
  self->_preferredBackgroundEffect = 0;

  -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setGlyph:(id)a3 withBackgroundEffect:(id)a4
{
  UIVisualEffect *v6;
  id v7;
  UIColor *preferredBackgroundColor;
  UIVisualEffect *preferredBackgroundEffect;

  v6 = (UIVisualEffect *)a4;
  v7 = a3;
  -[_SFSiteIconView _setState:](self, "_setState:", 1);
  -[UIImageView setImage:](self->_imageView, "setImage:", v7);

  preferredBackgroundColor = self->_preferredBackgroundColor;
  self->_preferredBackgroundColor = 0;

  preferredBackgroundEffect = self->_preferredBackgroundEffect;
  self->_preferredBackgroundEffect = v6;

  -[_SFSiteIconView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_glyphConfiguration
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0DC3888];
  -[_SFSiteIconView _monogramFontSize](self, "_monogramFontSize");
  if (self->_action)
    v4 = 4;
  else
    v4 = 3;
  return (id)objc_msgSend(v3, "configurationWithPointSize:weight:scale:", v4, 2);
}

- (id)_tintedFolderImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC3870];
  -[_SFSiteIconView _glyphConfiguration](self, "_glyphConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:withConfiguration:", CFSTR("folder"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flattenedImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safari_setTransparencyAnalysisResult:", 2);
  return v7;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (UIImage)leadingImage
{
  return self->_leadingImage;
}

- (_SFSiteIconViewUpdateObserver)updateObserver
{
  return (_SFSiteIconViewUpdateObserver *)objc_loadWeakRetained((id *)&self->_updateObserver);
}

- (void)setUpdateObserver:(id)a3
{
  objc_storeWeak((id *)&self->_updateObserver, a3);
}

- (BOOL)allowsDropShadow
{
  return self->_allowsDropShadow;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateObserver);
  objc_storeStrong((id *)&self->_leadingImage, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong(&self->_touchIconRequestToken, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
