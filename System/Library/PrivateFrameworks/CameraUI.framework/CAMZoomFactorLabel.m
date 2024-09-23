@implementation CAMZoomFactorLabel

- (CAMZoomFactorLabel)initWithFrame:(CGRect)a3
{
  CAMZoomFactorLabel *v3;
  CAMZoomFactorLabel *v4;
  id v5;
  uint64_t v6;
  UILabel *label;
  void *v8;
  CAMZoomFactorLabel *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMZoomFactorLabel;
  v3 = -[CAMZoomFactorLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showZoomFactorSymbol = 1;
    v3->_useLeadingZero = 1;
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v4->__label;
    v4->__label = (UILabel *)v6;

    -[UILabel setTextAlignment:](v4->__label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->__label, "setTextColor:", v8);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->__label, "setAdjustsFontSizeToFitWidth:", 1);
    -[CAMZoomFactorLabel _updateFont](v4, "_updateFont");
    -[CAMZoomFactorLabel addSubview:](v4, "addSubview:", v4->__label);
    v9 = v4;
  }

  return v4;
}

- (void)_updateFont
{
  void *v3;
  void *v4;
  id v5;

  if (-[CAMZoomFactorLabel preferDefaultSizing](self, "preferDefaultSizing"))
  {
    v5 = (id)*MEMORY[0x1E0DC4918];
  }
  else
  {
    -[CAMZoomFactorLabel traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredContentSizeCategory");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[CAMZoomButton fontSizeForContentSize:](CAMZoomButton, "fontSizeForContentSize:", v5);
  +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->__label, "setFont:", v4);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMZoomFactorLabel;
  -[CAMZoomFactorLabel description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel zoomFactor](self, "zoomFactor");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" zoomFactor=%f"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  -[CAMZoomFactorLabel _label](self, "_label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMZoomFactorLabel _label](self, "_label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setUseLeadingZero:(BOOL)a3
{
  if (self->_useLeadingZero != a3)
  {
    self->_useLeadingZero = a3;
    -[CAMZoomFactorLabel _updateLabelText](self, "_updateLabelText");
  }
}

- (void)setPreferDefaultSizing:(BOOL)a3
{
  if (self->_preferDefaultSizing != a3)
  {
    self->_preferDefaultSizing = a3;
    -[CAMZoomFactorLabel _updateFont](self, "_updateFont");
  }
}

- (CGSize)intrinsicContentSize
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[CAMZoomFactorLabel _label](self, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel _labelInsets](self, "_labelInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "intrinsicContentSize");
  v13 = v12 + v7 + v11;
  v15 = v14 + v5 + v9;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (UIEdgeInsets)_labelInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v5 = CAMPixelWidthForView(self) + -1.0;
  v6 = v2;
  v7 = v3;
  v8 = v4;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CAMZoomFactorLabel;
  -[CAMZoomFactorLabel layoutSubviews](&v21, sel_layoutSubviews);
  -[CAMZoomFactorLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMZoomFactorLabel _label](self, "_label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel _labelInsets](self, "_labelInsets");
  objc_msgSend(v11, "setFrame:", v4 + v15, v6 + v12, v8 - (v15 + v13), v10 - (v12 + v14));
  -[CAMZoomFactorLabel _minimizedGlyph](self, "_minimizedGlyph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "bounds");
    -[CAMZoomFactorLabel traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayScale");
    v20 = v19;
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v17, "setFrame:", v20);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMZoomFactorLabel traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMZoomFactorLabel _updateFont](self, "_updateFont");
    -[CAMZoomFactorLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    -[CAMZoomFactorLabel _updateLabelText](self, "_updateLabelText");
  }
}

- (void)setShowZoomFactorSymbol:(BOOL)a3
{
  if (self->_showZoomFactorSymbol != a3)
  {
    self->_showZoomFactorSymbol = a3;
    -[CAMZoomFactorLabel _updateLabelText](self, "_updateLabelText");
  }
}

- (void)_updateLabelText
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[CAMZoomFactorLabel zoomFactor](self, "zoomFactor");
  if (v3 != 0.0)
  {
    -[CAMZoomFactorLabel zoomFactor](self, "zoomFactor");
    +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:useLeadingZero:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:useLeadingZero:", -[CAMZoomFactorLabel showZoomFactorSymbol](self, "showZoomFactorSymbol"), -[CAMZoomFactorLabel useLeadingZero](self, "useLeadingZero"), v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMZoomFactorLabel _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setMinimized:(BOOL)a3
{
  if (self->_minimized != a3)
  {
    self->_minimized = a3;
    -[CAMZoomFactorLabel _updateMinimizedGlyph](self, "_updateMinimizedGlyph");
  }
}

- (void)_updateMinimizedGlyph
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CAMZoomFactorLabel _minimizedGlyph](self, "_minimizedGlyph");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CAMZoomFactorLabel minimized](self, "minimized");
  if (v3 && !v8)
  {
    v4 = (void *)objc_opt_class();
    -[CAMZoomFactorLabel traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    objc_msgSend(v4, "_minimizedImageWithScale:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
    -[CAMZoomFactorLabel addSubview:](self, "addSubview:", v8);
    -[CAMZoomFactorLabel set_minimizedGlyph:](self, "set_minimizedGlyph:", v8);

  }
  -[CAMZoomFactorLabel _label](self, "_label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", (double)(v3 ^ 1));

  objc_msgSend(v8, "setAlpha:", (double)v3);
}

+ (id)_minimizedImageWithScale:(double)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CAMZoomFactorLabel__minimizedImageWithScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (_minimizedImageWithScale__onceToken != -1)
    dispatch_once(&_minimizedImageWithScale__onceToken, block);
  return (id)_minimizedImageWithScale__dotImage;
}

void __47__CAMZoomFactorLabel__minimizedImageWithScale___block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  void *v2;
  uint64_t v3;
  void *v4;
  CGSize v5;
  CGRect v6;

  v5.width = 3.0;
  v5.height = 3.0;
  UIGraphicsBeginImageContextWithOptions(v5, 0, *(CGFloat *)(a1 + 32));
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 3.0;
  v6.size.height = 3.0;
  CGContextFillEllipseInRect(CurrentContext, v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_minimizedImageWithScale__dotImage;
  _minimizedImageWithScale__dotImage = v3;

  UIGraphicsEndImageContext();
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (BOOL)showZoomFactorSymbol
{
  return self->_showZoomFactorSymbol;
}

- (BOOL)useLeadingZero
{
  return self->_useLeadingZero;
}

- (BOOL)preferDefaultSizing
{
  return self->_preferDefaultSizing;
}

- (BOOL)minimized
{
  return self->_minimized;
}

- (UILabel)_label
{
  return self->__label;
}

- (UIImageView)_minimizedGlyph
{
  return self->__minimizedGlyph;
}

- (void)set_minimizedGlyph:(id)a3
{
  objc_storeStrong((id *)&self->__minimizedGlyph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__minimizedGlyph, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

@end
