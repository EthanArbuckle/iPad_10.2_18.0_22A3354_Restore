@implementation CEKApertureButton

- (CEKApertureButton)initWithFrame:(CGRect)a3
{
  CEKApertureButton *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSNumberFormatter *v26;
  NSNumberFormatter *decimalFormatter;
  void *v28;
  int v29;
  NSNumberFormatter *v30;
  NSNumberFormatter *wholeNumberFormatter;
  void *v32;
  double v33;
  double v34;
  CEKApertureButton *v35;
  void *v37;
  void *v38;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CEKApertureButton;
  v3 = -[CEKApertureButton initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKApertureButton setTintColor:](v3, "setTintColor:", v4);

    v3->_orientation = 1;
    v3->_expansionDirection = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKApertureButton _circleImageWithColor:](v3, "_circleImageWithColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v10;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    objc_storeStrong((id *)&v3->__circleOutlineView, v11);
    CEKFontOfSizeWeightStyle(1, 14.0, *MEMORY[0x1E0DC4B90]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CEKLocalizedFrameworkString(CFSTR("PORTRAIT_APERTURE_BUTTON_NO_VALUE"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CEKLocalizedFrameworkString(CFSTR("PORTRAIT_APERTURE_BUTTON_VALUE_FORMAT"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("%@"));
    v37 = v14;
    if (v15)
      LOBYTE(v15) = objc_msgSend(v14, "hasSuffix:", v13, v14);
    v3->__rightToLeftFormatting = v15;
    v16 = objc_alloc(MEMORY[0x1E0DC3990]);
    v17 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v21 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], v18, v19, v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v22);

    objc_msgSend(v21, "setFont:", v12);
    objc_msgSend(v21, "setTextAlignment:", 4);
    objc_msgSend(v21, "setText:", v13);
    objc_storeStrong((id *)&v3->__symbolLabel, v21);
    CEKMonospacedStylisticNumeralFontOfSizeAndStyle(0, 14.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v17, v18, v19, v20);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v25);

    objc_msgSend(v24, "setFont:", v23);
    objc_msgSend(v24, "setTextAlignment:", 4);
    objc_storeStrong((id *)&v3->__valueLabel, v24);
    v26 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    decimalFormatter = v3->__decimalFormatter;
    v3->__decimalFormatter = v26;

    -[NSNumberFormatter setPositiveFormat:](v3->__decimalFormatter, "setPositiveFormat:", CFSTR("0.0"));
    -[NSNumberFormatter stringFromNumber:](v3->__decimalFormatter, "stringFromNumber:", &unk_1E70B3BF0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("4,5"));

    if (v29)
      -[NSNumberFormatter setDecimalSeparator:](v3->__decimalFormatter, "setDecimalSeparator:", CFSTR("."));
    v30 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    wholeNumberFormatter = v3->__wholeNumberFormatter;
    v3->__wholeNumberFormatter = v30;

    -[NSNumberFormatter setPositiveFormat:](v3->__wholeNumberFormatter, "setPositiveFormat:", CFSTR("0"));
    -[CEKApertureButton addSubview:](v3, "addSubview:", v11);
    objc_msgSend(v11, "addSubview:", v21);
    objc_msgSend(v11, "addSubview:", v24);
    -[CEKApertureButton _updateColorsAnimated:](v3, "_updateColorsAnimated:", 0);
    objc_msgSend(v24, "setAlpha:", 0.0);
    v40 = *MEMORY[0x1E0DC32A0];
    v41[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" "), "sizeWithAttributes:", v32);

    UIRoundToViewScale();
    v3->__cachedSpaceWidth = v33;
    objc_msgSend(v21, "intrinsicContentSize");
    UICeilToViewScale();
    v3->__cachedSymbolLabelWidth = v34;
    v3->_wantsBackground = 0;
    -[CEKApertureButton _updateBackgroundView](v3, "_updateBackgroundView");
    v35 = v3;

  }
  return v3;
}

- (void)setApertureValue:(double)a3
{
  if (self->_apertureValue != a3)
  {
    self->_apertureValue = a3;
    if (-[CEKApertureButton shouldShowApertureValue](self, "shouldShowApertureValue"))
      -[CEKApertureButton _updateValueLabel](self, "_updateValueLabel");
  }
}

- (void)setShouldShowApertureValue:(BOOL)a3
{
  -[CEKApertureButton setShouldShowApertureValue:animated:](self, "setShouldShowApertureValue:animated:", a3, 0);
}

- (void)setShouldShowApertureValue:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  if (self->_shouldShowApertureValue != a3)
  {
    v4 = a4;
    self->_shouldShowApertureValue = a3;
    if (a3)
      -[CEKApertureButton _updateValueLabel](self, "_updateValueLabel");
    -[CEKApertureButton setNeedsLayout](self, "setNeedsLayout");
    -[CEKApertureButton delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "apertureButtonNeedsLayout:animated:", self, v4);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CEKApertureButton_setShouldShowApertureValue_animated___block_invoke;
    v10[3] = &unk_1E70A52D8;
    v11 = a3;
    v10[4] = self;
    v8 = _Block_copy(v10);
    v9 = v8;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, 0.25, 0.0);
    else
      (*((void (**)(void *))v8 + 2))(v8);
    -[CEKApertureButton _updateSymbolLabelOrientationAnimated:](self, "_updateSymbolLabelOrientationAnimated:", v4);

  }
}

void __57__CEKApertureButton_setShouldShowApertureValue_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_valueLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)_updateValueLabel
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[CEKApertureButton apertureValue](self, "apertureValue");
  v4 = v3;
  if (v3 >= 10.0)
    -[CEKApertureButton _wholeNumberFormatter](self, "_wholeNumberFormatter");
  else
    -[CEKApertureButton _decimalFormatter](self, "_decimalFormatter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton _valueLabel](self, "_valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[CEKApertureButton _valueLabel](self, "_valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intrinsicContentSize");

  -[CEKApertureButton _cachedValueLabelWidth](self, "_cachedValueLabelWidth");
  v10 = v9;
  UICeilToViewScale();
  -[CEKApertureButton _setCachedValueLabelWidth:](self, "_setCachedValueLabelWidth:");
  -[CEKApertureButton _cachedValueLabelWidth](self, "_cachedValueLabelWidth");
  if (v10 != v11)
  {
    -[CEKApertureButton setNeedsLayout](self, "setNeedsLayout");
    -[CEKApertureButton delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "apertureButtonNeedsLayout:animated:", self, 0);

  }
}

- (void)setExpansionDirection:(int64_t)a3
{
  id v4;

  if (self->_expansionDirection != a3)
  {
    self->_expansionDirection = a3;
    -[CEKApertureButton setNeedsLayout](self, "setNeedsLayout");
    -[CEKApertureButton delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "apertureButtonNeedsLayout:animated:", self, 0);

  }
}

- (void)setWantsBackground:(BOOL)a3
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    -[CEKApertureButton _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKApertureButton;
  -[CEKApertureButton tintColorDidChange](&v3, sel_tintColorDidChange);
  if (-[CEKApertureButton isActive](self, "isActive"))
    -[CEKApertureButton _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEKApertureButton;
  -[CEKApertureButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (!-[CEKApertureButton isActive](self, "isActive"))
    -[CEKApertureButton _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[CEKApertureButton isActive](self, "isActive", a3))
  {
    -[CEKApertureButton tintColor](self, "tintColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[CEKApertureButton isActive](self, "isActive"))
  {
    -[CEKApertureButton tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CEKApertureButton _circleOutlineView](self, "_circleOutlineView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v10);

  -[CEKApertureButton _symbolLabel](self, "_symbolLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v5);

  -[CEKApertureButton _valueLabel](self, "_valueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v5);

}

- (void)_updateBackgroundView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  CEKApertureButton *v10;
  id v11;

  -[CEKApertureButton _circleBackgroundView](self, "_circleBackgroundView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CEKApertureButton wantsBackground](self, "wantsBackground");
  if (!v11 && v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    CEKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CEKButtonBackgroundPad"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "size");
    objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    -[CEKApertureButton set_circleBackgroundView:](self, "set_circleBackgroundView:");

  }
  objc_msgSend(v11, "superview");
  v10 = (CEKApertureButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v10 != self)
      -[CEKApertureButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v11, 0);
  }
  else if (v10 == self)
  {
    objc_msgSend(v11, "removeFromSuperview");
  }

}

- (UIEdgeInsets)_expansionInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (-[CEKApertureButton shouldShowApertureValue](self, "shouldShowApertureValue"))
  {
    -[CEKApertureButton _cachedSymbolLabelWidth](self, "_cachedSymbolLabelWidth");
    v8 = v7;
    -[CEKApertureButton _cachedSpaceWidth](self, "_cachedSpaceWidth");
    v10 = v8 + v9;
    -[CEKApertureButton _cachedValueLabelWidth](self, "_cachedValueLabelWidth");
    v12 = v10 + v11 + -2.0 + -2.0;
    v13 = -[CEKApertureButton expansionDirection](self, "expansionDirection");
    switch(v13)
    {
      case 2:
        UIRoundToViewScale();
        v4 = v4 + v14;
        v6 = v6 + v12 - v14;
        break;
      case 1:
        v6 = v6 + v12;
        break;
      case 0:
        v4 = v4 + v12;
        break;
    }
  }
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v18 = v6;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = 22.0;
  v4 = 22.0;
  if (-[CEKApertureButton wantsBackground](self, "wantsBackground"))
  {
    -[CEKApertureButton _circleBackgroundView](self, "_circleBackgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v4 = v7;
    v3 = v8;

  }
  v9 = v4;
  v10 = v3;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[CEKApertureButton tappableEdgeInsets](self, "tappableEdgeInsets");
  -[CEKApertureButton _expansionInsets](self, "_expansionInsets");
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MaxX;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46.receiver = self;
  v46.super_class = (Class)CEKApertureButton;
  -[CEKApertureButton layoutSubviews](&v46, sel_layoutSubviews);
  -[CEKApertureButton _circleOutlineView](self, "_circleOutlineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton _circleBackgroundView](self, "_circleBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton _symbolLabel](self, "_symbolLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton _valueLabel](self, "_valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v42 = v11;
  v43 = v12;
  -[CEKApertureButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  -[CEKApertureButton _cachedSymbolLabelWidth](self, "_cachedSymbolLabelWidth");
  v44 = v13;
  -[CEKApertureButton _cachedValueLabelWidth](self, "_cachedValueLabelWidth");
  v45 = v14;
  v15 = -[CEKApertureButton shouldShowApertureValue](self, "shouldShowApertureValue");
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  -[CEKApertureButton _expansionInsets](self, "_expansionInsets");
  UIRectInset();
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v3);
  -[CEKApertureButton tappableEdgeInsets](self, "tappableEdgeInsets");
  objc_msgSend(v4, "setFrame:", v8 + v19, v10 + v16, v42 - (v19 + v17), v43 - (v16 + v18));
  objc_msgSend(v3, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (v15)
  {
    UIRoundToViewScale();
    v29 = v28;
    v47.origin.x = v21;
    v47.origin.y = v23;
    v47.size.width = v25;
    v47.size.height = v27;
    CGRectGetMaxX(v47);
    UIRoundToViewScale();
    v31 = v44;
  }
  else
  {
    v31 = v44;
    UIRoundToViewScale();
    v29 = v32;
    v48.origin.x = v21;
    v48.origin.y = v23;
    v48.size.width = v25;
    v48.size.height = v27;
    MaxX = CGRectGetMaxX(v48);
  }
  v33 = MaxX - v45;
  if (-[CEKApertureButton _isRightToLeftFormatting](self, "_isRightToLeftFormatting"))
  {
    v49.origin.x = v21;
    v49.origin.y = v23;
    v49.size.width = v25;
    v49.size.height = v27;
    v34 = CGRectGetMaxX(v49);
    v35 = v29;
    v36 = v23;
    v37 = v21;
    v38 = v31;
    v39 = v34;
    v50.origin.y = 0.0;
    v50.origin.x = v35;
    v50.size.width = v38;
    v50.size.height = v27;
    v40 = v39 - CGRectGetMaxX(v50);
    v51.origin.x = v37;
    v51.origin.y = v36;
    v29 = v40;
    v51.size.width = v25;
    v51.size.height = v27;
    v41 = CGRectGetMaxX(v51);
    v52.origin.y = 0.0;
    v52.origin.x = v33;
    v52.size.width = v45;
    v52.size.height = v27;
    v33 = v41 - CGRectGetMaxX(v52);
    v31 = v38;
  }
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v5, v29, 0.0, v31, v27);
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v6, v33, 0.0, v45, v27);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[CEKApertureButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)CEKApertureButton;
  -[CEKApertureButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CEKApertureButton _circleOutlineView](self, "_circleOutlineView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKApertureButton _setLayer:highlighted:animated:](self, "_setLayer:highlighted:animated:", v7, v3, 1);

  }
}

- (void)setActive:(BOOL)a3
{
  -[CEKApertureButton setActive:animated:](self, "setActive:animated:", a3, 0);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;

  v4 = a4;
  v5 = a3;
  v7 = -[CEKApertureButton isActive](self, "isActive");
  -[CEKApertureButton setSelected:](self, "setSelected:", v5);
  if (v7 != v5)
    -[CEKApertureButton _updateColorsAnimated:](self, "_updateColorsAnimated:", v4);
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CEKApertureButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CEKApertureButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CEKApertureButton _updateSymbolLabelOrientationAnimated:](self, "_updateSymbolLabelOrientationAnimated:", a4);
  }
}

- (void)_updateSymbolLabelOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  id v6;

  v3 = a3;
  if (-[CEKApertureButton shouldShowApertureValue](self, "shouldShowApertureValue"))
    v5 = 1;
  else
    v5 = -[CEKApertureButton orientation](self, "orientation");
  -[CEKApertureButton _symbolLabel](self, "_symbolLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CEKApertureButton _rotateView:withInterfaceOrientation:animated:](self, "_rotateView:withInterfaceOrientation:animated:", v6, v5, v3);

}

- (id)_circleImageWithColor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  -[CEKApertureButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  v15.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v15.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D648] + 8);
  v15.size.width = 22.0;
  v15.size.height = 22.0;
  v16 = CGRectInset(v15, 1.0 / v7 * 3.0 * 0.5, 1.0 / v7 * 3.0 * 0.5);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v16.origin.x = 22.0;
  v16.origin.y = 22.0;
  UIGraphicsBeginImageContextWithOptions((CGSize)v16.origin, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v4, "setStroke");

  CGContextSetLineWidth(CurrentContext, 1.0 / v7 * 3.0);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGContextStrokeEllipseInRect(CurrentContext, v17);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (void)_setCenterAndBoundsForView:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double v6;
  double v7;
  id v8;

  height = a4.size.height;
  width = a4.size.width;
  v8 = a3;
  UIRectGetCenter();
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v8, "setCenter:");
  objc_msgSend(v8, "setBounds:", v6, v7, width, height);

}

- (void)_rotateView:(id)a3 withInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __int128 v9;
  __int128 v10;
  CGFloat v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  CGAffineTransform v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;

  v5 = a5;
  v8 = a3;
  memset(&v20, 0, sizeof(v20));
  switch(a4)
  {
    case 0:
    case 1:
      v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v20.c = v9;
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      goto LABEL_7;
    case 2:
      v11 = 3.14159265;
      goto LABEL_6;
    case 3:
      v11 = 1.57079633;
      goto LABEL_6;
    case 4:
      v11 = -1.57079633;
LABEL_6:
      CGAffineTransformMakeRotation(&v20, v11);
      v16 = v20;
      UIIntegralTransform();
      *(_OWORD *)&v20.a = v17;
      *(_OWORD *)&v20.c = v18;
      v10 = v19;
LABEL_7:
      *(_OWORD *)&v20.tx = v10;
      break;
    default:
      break;
  }
  aBlock[1] = 3221225472;
  v15 = v20;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __67__CEKApertureButton__rotateView_withInterfaceOrientation_animated___block_invoke;
  aBlock[3] = &unk_1E70A5328;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v12, 0, 0.3, 0.0);
  else
    (*((void (**)(void *))v12 + 2))(v12);

}

uint64_t __67__CEKApertureButton__rotateView_withInterfaceOrientation_animated___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)_setLayer:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  float v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  CATransform3D v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v36;
  CATransform3D v37;
  CATransform3D v38;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "presentationLayer");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  objc_msgSend(v12, "valueForKeyPath:", CFSTR("transform.scale.xy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  memset(&v38, 0, sizeof(v38));
  objc_msgSend(v12, "valueForKeyPath:", CFSTR("transform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "CATransform3DValue");
  else
    memset(&v38, 0, sizeof(v38));

  memset(&v37, 0, sizeof(v37));
  CATransform3DMakeScale(&v37, v15, v15, 1.0);
  memset(&v36, 0, sizeof(v36));
  a = v37;
  CATransform3DInvert(&b, &a);
  a = v38;
  CATransform3DConcat(&v36, &a, &b);
  if (v6)
  {
    v18 = CEKIsPadLayoutForView(self);
    v19 = 0.9;
    if (v18)
      v19 = 0.94;
    memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&a, v19, v19, 1.0);
    v32 = v36;
    v31 = a;
    CATransform3DConcat(&v33, &v32, &v31);
    v36 = v33;
  }
  if (v5)
  {
    UIAnimationDragCoefficient();
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMass:", 0.8);
    objc_msgSend(v22, "setVelocity:", 0.0);
    objc_msgSend(v22, "setDamping:", 12.0 / v21);
    objc_msgSend(v22, "setStiffness:", 300.0 / (float)(v21 * v21));
    objc_msgSend(v22, "durationForEpsilon:", 0.01);
    objc_msgSend(v22, "setDuration:");
    LODWORD(v23) = 1041865114;
    LODWORD(v24) = 0;
    LODWORD(v25) = 0.5;
    LODWORD(v26) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingFunction:", v27);

    a = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFromValue:", v28);

    a = v36;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setToValue:", v29);

    objc_msgSend(v8, "addAnimation:forKey:", v22, CFSTR("highlightScaleAnimation"));
  }
  v30 = v36;
  objc_msgSend(v8, "setTransform:", &v30);

}

- (CEKApertureButtonDelegate)delegate
{
  return (CEKApertureButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)apertureValue
{
  return self->_apertureValue;
}

- (BOOL)shouldShowApertureValue
{
  return self->_shouldShowApertureValue;
}

- (int64_t)expansionDirection
{
  return self->_expansionDirection;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_circleOutlineView
{
  return self->__circleOutlineView;
}

- (UILabel)_symbolLabel
{
  return self->__symbolLabel;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__circleBackgroundView, a3);
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (NSNumberFormatter)_wholeNumberFormatter
{
  return self->__wholeNumberFormatter;
}

- (BOOL)_isRightToLeftFormatting
{
  return self->__rightToLeftFormatting;
}

- (double)_cachedSpaceWidth
{
  return self->__cachedSpaceWidth;
}

- (double)_cachedSymbolLabelWidth
{
  return self->__cachedSymbolLabelWidth;
}

- (double)_cachedValueLabelWidth
{
  return self->__cachedValueLabelWidth;
}

- (void)_setCachedValueLabelWidth:(double)a3
{
  self->__cachedValueLabelWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wholeNumberFormatter, 0);
  objc_storeStrong((id *)&self->__decimalFormatter, 0);
  objc_storeStrong((id *)&self->__circleBackgroundView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__symbolLabel, 0);
  objc_storeStrong((id *)&self->__circleOutlineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
