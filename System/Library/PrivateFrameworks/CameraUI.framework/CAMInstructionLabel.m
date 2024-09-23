@implementation CAMInstructionLabel

- (CAMInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMInstructionLabel *v3;
  CAMInstructionLabel *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UILabel *label;
  CAMInstructionLabel *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMInstructionLabel _backgroundAlpha](v3, "_backgroundAlpha");
    -[CAMInstructionLabel _backgroundColorWhiteValue](v4, "_backgroundColorWhiteValue");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInstructionLabel setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v4->__label;
    v4->__label = (UILabel *)v7;

    -[UILabel setTextAlignment:](v4->__label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v4->__label, "setNumberOfLines:", 0);
    -[CAMInstructionLabel addSubview:](v4, "addSubview:", v4->__label);
    v9 = v4;
  }

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_updateLabel
{
  void *v3;
  void *v4;
  id v5;

  -[CAMInstructionLabel _label](self, "_label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel _attributedText](self, "_attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v4);

  -[CAMInstructionLabel setNeedsLayout](self, "setNeedsLayout");
  -[CAMInstructionLabel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "instructionLabelDidChangeIntrinsicContentSize:", self);

}

- (NSString)text
{
  return self->_text;
}

- (UILabel)_label
{
  return self->__label;
}

- (CAMInstructionLabelDelegate)delegate
{
  return (CAMInstructionLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setUseModeDialFontSize:(BOOL)a3
{
  if (self->_useModeDialFontSize != a3)
  {
    self->_useModeDialFontSize = a3;
    -[CAMInstructionLabel _updateAttributedText](self, "_updateAttributedText");
    -[CAMInstructionLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CAMInstructionLabel _attributedText](self, "_attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel _textInsets](self, "_textInsets");
  if (width <= 0.0 || height <= 0.0)
  {
    objc_msgSend(v6, "size");
  }
  else
  {
    v11 = width - v8 - v10;
    v12 = height - v7 - v9;
    -[CAMInstructionLabel traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

    if (IsAccessibilityCategory)
      -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", v11, v12);
    else
      objc_msgSend(v6, "boundingRectWithSize:options:context:", 1, 0, v11, v12);
  }
  -[CAMInstructionLabel _wantsPrefixActivityIndicatorView](self, "_wantsPrefixActivityIndicatorView");
  UICeilToViewScale();
  v17 = v16;
  UICeilToViewScale();
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)_textAttributes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CAMInstructionLabel _textColor](self, "_textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CAMInstructionLabel useModeDialFontSize](self, "useModeDialFontSize"))
    +[CAMFont cameraModeDialFontForContentSize:](CAMFont, "cameraModeDialFontForContentSize:", v6);
  else
    +[CAMFont cameraFontForContentSize:](CAMFont, "cameraFontForContentSize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v8, "setLineBreakMode:", 0);
  objc_msgSend(v8, "setLineBreakStrategy:", 0xFFFFLL);
  v9 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowColor:", v10);

  objc_msgSend(v9, "setShadowOffset:", 0.0, 0.0);
  objc_msgSend(v9, "setShadowBlurRadius:", 3.0);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1140]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1178]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC1198]);

  return v3;
}

- (BOOL)useModeDialFontSize
{
  return self->_useModeDialFontSize;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[CAMInstructionLabel setNeedsLayout](self, "setNeedsLayout");
  }
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[17];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CAMInstructionLabel;
  -[CAMInstructionLabel layoutSubviews](&v31, sel_layoutSubviews);
  -[CAMInstructionLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v29 = v9;
  if (-[CAMInstructionLabel _wantsPrefixActivityIndicatorView](self, "_wantsPrefixActivityIndicatorView"))
  {
    -[CAMInstructionLabel _activityIndicatorView](self, "_activityIndicatorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      -[CAMInstructionLabel set_activityIndicatorView:](self, "set_activityIndicatorView:", v11);

      -[CAMInstructionLabel _activityIndicatorView](self, "_activityIndicatorView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startAnimating");

      -[CAMInstructionLabel _activityIndicatorView](self, "_activityIndicatorView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMInstructionLabel addSubview:](self, "addSubview:", v13);

    }
  }
  -[CAMInstructionLabel _textInsets](self, "_textInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = v4 + v16;
  v27 = v6 + v14;
  v28 = v6;
  v23 = v8 - (v16 + v20);
  v26 = v29 - (v14 + v18);
  v24 = !-[CAMInstructionLabel _wantsPrefixActivityIndicatorView](self, "_wantsPrefixActivityIndicatorView");
  v25 = 0.0;
  v30[0] = MEMORY[0x1E0C809B0];
  if (!v24)
    v25 = 16.0;
  v30[1] = 3221225472;
  v30[2] = __37__CAMInstructionLabel_layoutSubviews__block_invoke;
  v30[3] = &unk_1EA32DD08;
  v30[4] = self;
  *(double *)&v30[5] = v22 + v25;
  *(double *)&v30[6] = v27;
  *(double *)&v30[7] = v23 - v25;
  *(double *)&v30[8] = v26;
  *(double *)&v30[9] = v15;
  *(double *)&v30[10] = v17;
  *(double *)&v30[11] = v19;
  *(double *)&v30[12] = v21;
  *(double *)&v30[13] = v4;
  *(double *)&v30[14] = v28;
  *(double *)&v30[15] = v8;
  *(double *)&v30[16] = v29;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v30);
  -[CAMInstructionLabel _updateLayerCornerRadius](self, "_updateLayerCornerRadius");
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  text = self->_text;
  if (text != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](text, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_text;
      self->_text = v7;

      -[CAMInstructionLabel _updateAttributedText](self, "_updateAttributedText");
      v4 = v9;
    }
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CAMInstructionLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMInstructionLabel traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMInstructionLabel _updateAttributedText](self, "_updateAttributedText");
    -[CAMInstructionLabel setNeedsLayout](self, "setNeedsLayout");
  }

}

void __37__CAMInstructionLabel_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "_label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  CGAffineTransformMakeScale(&v8, 0.6, 0.6);
  objc_msgSend(*(id *)(a1 + 32), "_activityIndicatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v3, "setTransform:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "_activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 80), 0.0, 10.0, *(double *)(a1 + 128));

  v5 = objc_msgSend(*(id *)(a1 + 32), "_wantsPrefixActivityIndicatorView") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "_activityIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

}

- (void)_updateAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  -[CAMInstructionLabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAMInstructionLabel _textAttributes](self, "_textAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
    -[CAMInstructionLabel _symbolPrefixName](self, "_symbolPrefixName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMInstructionLabel _symbolSuffixName](self, "_symbolSuffixName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v16, "insertAttributedString:atIndex:", v10, 0);

        objc_msgSend(v16, "insertAttributedString:atIndex:", v9, 0);
      }

    }
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v16, "appendAttributedString:", v14);

        objc_msgSend(v16, "appendAttributedString:", v13);
      }

    }
    objc_msgSend(v16, "addAttributes:range:", v4, 0, objc_msgSend(v16, "length"));

    v15 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = v15;
  -[CAMInstructionLabel set_attributedText:](self, "set_attributedText:", v15);
  -[CAMInstructionLabel _updateLabel](self, "_updateLabel");

}

- (void)_updateLayerCornerRadius
{
  double v3;
  double v4;
  int64_t v5;
  double v6;
  id v7;

  -[CAMInstructionLabel _defaultCornerRadius](self, "_defaultCornerRadius");
  v4 = v3;
  v5 = -[CAMInstructionLabel style](self, "style");
  if (v5 == 2)
  {
    -[CAMInstructionLabel bounds](self, "bounds");
    v4 = v6 * 0.5;
  }
  else if (v5 == 1)
  {
    v4 = 2.0;
  }
  -[CAMInstructionLabel layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v4);

}

- (UIEdgeInsets)_textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = CAMPixelWidthForView(self);
  v3 = v2 * 2.0 + 2.0;
  v4 = 11.0;
  v5 = 10.0;
  v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIColor)_textColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (double)_backgroundAlpha
{
  return 0.5;
}

- (double)_backgroundColorWhiteValue
{
  return 0.0;
}

- (NSString)_symbolPrefixName
{
  return 0;
}

- (BOOL)_wantsPrefixActivityIndicatorView
{
  return 0;
}

- (double)_defaultCornerRadius
{
  return 0.0;
}

- (NSAttributedString)_attributedText
{
  return self->__attributedText;
}

- (void)set_attributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (UIActivityIndicatorView)_activityIndicatorView
{
  return self->__activityIndicatorView;
}

- (void)set_activityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->__activityIndicatorView, a3);
}

- (NSString)_symbolSuffixName
{
  return self->__symbolSuffixName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__symbolSuffixName, 0);
  objc_storeStrong((id *)&self->__activityIndicatorView, 0);
  objc_storeStrong((id *)&self->__attributedText, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
