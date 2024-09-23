@implementation _PKInkAttributesPickerView

- (_PKInkAttributesPickerView)initWithInk:(id)a3 toolConfiguration:(id)a4
{
  PKToolConfiguration *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _PKInkAttributesPickerView *v12;
  PKToolConfiguration *toolConfiguration;
  PKToolConfiguration *v14;
  _PKInkThicknessPicker *v15;
  _PKInkThicknessPicker *thicknessPicker;
  void *v17;
  _PKColorAlphaSliderIOS *v18;
  UIView *colorAlphaSliderView;
  void *v20;
  uint64_t v21;
  UIView *topSeparatorView;
  void *v23;
  uint64_t v24;
  UIView *middleSeparatorView;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v6 = (PKToolConfiguration *)a4;
  v31.receiver = self;
  v31.super_class = (Class)_PKInkAttributesPickerView;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = a3;
  v12 = -[_PKInkAttributesPickerView initWithFrame:](&v31, sel_initWithFrame_, v7, v8, v9, v10);
  v12->_minimumOpacityValue = 0.0;
  toolConfiguration = v12->_toolConfiguration;
  v12->_toolConfiguration = v6;
  v14 = v6;

  v15 = (_PKInkThicknessPicker *)-[_PKInkThicknessPicker initWithToolConfiguration:]([_PKInkThicknessPicker alloc], v14);
  thicknessPicker = v12->_thicknessPicker;
  v12->_thicknessPicker = v15;

  -[_PKInkThicknessPicker addTarget:action:forControlEvents:](v12->_thicknessPicker, "addTarget:action:forControlEvents:", v12, sel__thicknessValueChanged_, 4096);
  -[_PKInkAttributesPickerView thicknessPicker](v12, "thicknessPicker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView addSubview:](v12, "addSubview:", v17);

  v18 = -[_PKColorAlphaSliderIOS initWithFrame:]([_PKColorAlphaSliderIOS alloc], "initWithFrame:", v7, v8, v9, v10);
  colorAlphaSliderView = v12->_colorAlphaSliderView;
  v12->_colorAlphaSliderView = &v18->super;

  objc_storeStrong((id *)&v12->_colorAlphaSlider, v12->_colorAlphaSliderView);
  -[_PKColorAlphaSlider setDelegate:](v12->_colorAlphaSlider, "setDelegate:", v12);
  -[_PKColorAlphaSlider setMaxAlpha:](v12->_colorAlphaSlider, "setMaxAlpha:", 1.0);
  -[_PKInkAttributesPickerView colorAlphaSliderView](v12, "colorAlphaSliderView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView addSubview:](v12, "addSubview:", v20);

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
  topSeparatorView = v12->_topSeparatorView;
  v12->_topSeparatorView = (UIView *)v21;

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_separatorLineColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12->_topSeparatorView, "setBackgroundColor:", v23);

  -[_PKInkAttributesPickerView addSubview:](v12, "addSubview:", v12->_topSeparatorView);
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
  middleSeparatorView = v12->_middleSeparatorView;
  v12->_middleSeparatorView = (UIView *)v24;

  objc_msgSend(MEMORY[0x1E0DC3658], "pk_separatorLineColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12->_middleSeparatorView, "setBackgroundColor:", v26);

  -[_PKInkAttributesPickerView addSubview:](v12, "addSubview:", v12->_middleSeparatorView);
  -[_PKInkAttributesPickerView setInk:](v12, "setInk:", v11);
  -[_PKInkAttributesPickerView setDisplayMode:](v12, "setDisplayMode:", 0);
  -[_PKInkAttributesPickerView _setContinuousCornerRadius:](v12, "_setContinuousCornerRadius:", 8.0);
  v27 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@%@"), v28, CFSTR("_InkAttributesPicker"), v31.receiver, v31.super_class);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PKInkAttributesPickerView setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v29);
  -[_PKInkAttributesPickerView _updateUI](v12, "_updateUI");
  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", v4, v5);
  v8 = v7;
  v10 = v9;

  -[_PKInkAttributesPickerView toolConfiguration](self, "toolConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "strokeWeightButtonSize");
  v13 = v12;
  v15 = v14;

  +[_PKInkThicknessPicker sizeWithButtonCount:buttonSize:](_PKInkThicknessPicker, "sizeWithButtonCount:buttonSize:", 5, v13, v15);
  v17 = fmax(v8, v16);
  -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v4, v5);
  v20 = v19;

  if (-[_PKInkAttributesPickerView displayMode](self, "displayMode"))
  {
    if (-[_PKInkAttributesPickerView displayMode](self, "displayMode") == 2)
    {
      v21 = v17 + 24.0;
      v22 = v20 + 24.0;
    }
    else
    {
      v23 = -[_PKInkAttributesPickerView displayMode](self, "displayMode");
      if (v23 == 1)
        v22 = v10 + 24.0;
      else
        v22 = v5;
      if (v23 == 1)
        v21 = v17 + 24.0;
      else
        v21 = v4;
    }
  }
  else
  {
    v21 = v17 + 24.0;
    v22 = v10 + 48.0 + v20;
  }
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  UIView *topSeparatorView;
  void *v45;
  void *v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v47.receiver = self;
  v47.super_class = (Class)_PKInkAttributesPickerView;
  -[_PKInkAttributesPickerView layoutSubviews](&v47, sel_layoutSubviews);
  -[_PKInkAttributesPickerView ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weight");
  v5 = v4;
  -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v6[59] = v5;
    objc_msgSend(v6, "setNeedsLayout");
  }

  -[_PKInkAttributesPickerView ink](self, "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView colorAlphaSlider](self, "colorAlphaSlider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  -[_PKInkAttributesPickerView bounds](self, "bounds");
  v49 = CGRectInset(v48, 12.0, 12.0);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  if (-[_PKInkAttributesPickerView displayMode](self, "displayMode"))
  {
    if (-[_PKInkAttributesPickerView displayMode](self, "displayMode") == 2)
    {
      -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAlpha:", 1.0);

      -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", 0.0);

      -[_PKInkAttributesPickerView middleSeparatorView](self, "middleSeparatorView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlpha:", 0.0);

      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      CGRectGetMinX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      CGRectGetMinY(v51);
      -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      objc_msgSend(v18, "sizeThatFits:", CGRectGetWidth(v52), 0.0);

      -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayScale");
      UIRectIntegralWithScale();
      v20 = &OBJC_IVAR____PKInkAttributesPickerView__colorAlphaSliderView;
    }
    else
    {
      if (-[_PKInkAttributesPickerView displayMode](self, "displayMode") != 1)
        goto LABEL_10;
      -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAlpha:", 0.0);

      -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAlpha:", 1.0);

      -[_PKInkAttributesPickerView middleSeparatorView](self, "middleSeparatorView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAlpha:", 0.0);

      -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = width;
      v59.size.height = height;
      objc_msgSend(v41, "sizeThatFits:", CGRectGetWidth(v59), 0.0);
      DKDRectWithSizeAlignedToRect(2, 1, v42, v43, x, y, width, height);

      -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayScale");
      UIRectIntegralWithScale();
      v20 = &OBJC_IVAR____PKInkAttributesPickerView__thicknessPicker;
    }
  }
  else
  {
    -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 1.0);

    -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAlpha:", 1.0);

    -[_PKInkAttributesPickerView middleSeparatorView](self, "middleSeparatorView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 1.0);

    -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    objc_msgSend(v24, "sizeThatFits:", CGRectGetWidth(v53), 0.0);
    v27 = DKDRectWithSizeAlignedToRect(2, 1, v25, v26, x, y, width, height);
    v29 = v28;
    v31 = v30;
    v33 = v32;

    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    CGRectGetMinX(v54);
    v55.origin.x = v27;
    v55.origin.y = v29;
    v55.size.width = v31;
    v55.size.height = v33;
    CGRectGetMaxY(v55);
    -[_PKInkAttributesPickerView colorAlphaSliderView](self, "colorAlphaSliderView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    objc_msgSend(v34, "sizeThatFits:", CGRectGetWidth(v56), 0.0);

    v57.origin.x = v27;
    v57.origin.y = v29;
    v57.size.width = v31;
    v57.size.height = v33;
    CGRectGetMaxY(v57);
    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "displayScale");

    -[_PKInkAttributesPickerView bounds](self, "bounds");
    CGRectGetWidth(v58);
    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "displayScale");
    UIRectIntegralWithScale();
    -[_PKInkThicknessPicker setFrame:](self->_thicknessPicker, "setFrame:");

    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "displayScale");
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_colorAlphaSliderView, "setFrame:");

    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayScale");
    UIRectIntegralWithScale();
    v20 = &OBJC_IVAR____PKInkAttributesPickerView__middleSeparatorView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "setFrame:");

LABEL_10:
  topSeparatorView = self->_topSeparatorView;
  if (self->_showsTopSeparator)
  {
    -[UIView setAlpha:](topSeparatorView, "setAlpha:", 1.0);
    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "displayScale");

    -[_PKInkAttributesPickerView bounds](self, "bounds");
    CGRectGetWidth(v60);
    -[_PKInkAttributesPickerView traitCollection](self, "traitCollection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "displayScale");
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:");

  }
  else
  {
    -[UIView setAlpha:](topSeparatorView, "setAlpha:", 0.0);
  }
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  id v4;

  -[_PKInkAttributesPickerView colorAlphaSlider](self, "colorAlphaSlider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorUserInterfaceStyle:", a3);

}

- (int64_t)colorUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  -[_PKInkAttributesPickerView colorAlphaSlider](self, "colorAlphaSlider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorUserInterfaceStyle");

  return v3;
}

- (void)setMinimumOpacityValue:(double)a3
{
  if (self->_minimumOpacityValue != a3)
  {
    self->_minimumOpacityValue = a3;
    -[_PKInkAttributesPickerView _updateUI](self, "_updateUI");
  }
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (self->_showsTopSeparator != a3)
  {
    self->_showsTopSeparator = a3;
    -[_PKInkAttributesPickerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateUI
{
  double v3;
  double v4;
  id v5;

  -[_PKInkAttributesPickerView minimumOpacityValue](self, "minimumOpacityValue");
  v4 = v3;
  -[_PKInkAttributesPickerView colorAlphaSlider](self, "colorAlphaSlider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinAlpha:", v4);

}

- (void)setInk:(id)a3
{
  -[_PKInkAttributesPickerView setInk:animated:](self, "setInk:animated:", a3, 0);
}

- (void)setInk:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  objc_storeStrong((id *)&self->_ink, a3);
  -[_PKInkAttributesPickerView setNeedsLayout](self, "setNeedsLayout");
  -[_PKInkAttributesPickerView ink](self, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  v8 = v7;
  -[_PKInkAttributesPickerView thicknessPicker](self, "thicknessPicker");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v9[59] = v8;
    objc_msgSend(v9, "setNeedsLayout");
  }

  -[_PKInkAttributesPickerView colorAlphaSlider](self, "colorAlphaSlider");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView ink](self, "ink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:animated:", v12, v4);

}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
  -[_PKInkAttributesPickerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_thicknessValueChanged:(id)a3
{
  double *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v4 = (double *)a3;
  -[_PKInkAttributesPickerView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v6 = v4[59];
  else
    v6 = 0.0;

  +[PKInk inkFromInk:weight:](PKInk, "inkFromInk:weight:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView setInk:](self, "setInk:", v7);

  -[_PKInkAttributesPickerView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inkAttributesPickerViewDidChangeInkThickness:", self);

}

- (void)_opacityValueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_PKInkAttributesPickerView ink](self, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKInkAttributesPickerView setInk:](self, "setInk:", v7);

  -[_PKInkAttributesPickerView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inkAttributesPickerViewDidChangeInkOpacity:", self);

}

- (void)_colorAlphaSliderUserDidStartDraggingSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[_PKInkAttributesPickerView delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_PKInkAttributesPickerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[_PKInkAttributesPickerView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_inkAttributesPickerViewUserDidStartDraggingSlider:", self);

    }
  }
}

- (void)_colorAlphaSliderUserDidEndDraggingSlider:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[_PKInkAttributesPickerView delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_PKInkAttributesPickerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[_PKInkAttributesPickerView delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_inkAttributesPickerViewUserDidEndDraggingSlider:", self);

    }
  }
}

- (_PKInkAttributesPickerViewDelegate)delegate
{
  return (_PKInkAttributesPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKInk)ink
{
  return self->_ink;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (double)minimumOpacityValue
{
  return self->_minimumOpacityValue;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (_PKInkThicknessPicker)thicknessPicker
{
  return self->_thicknessPicker;
}

- (void)setThicknessPicker:(id)a3
{
  objc_storeStrong((id *)&self->_thicknessPicker, a3);
}

- (UIView)colorAlphaSliderView
{
  return self->_colorAlphaSliderView;
}

- (void)setColorAlphaSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_colorAlphaSliderView, a3);
}

- (_PKColorAlphaSlider)colorAlphaSlider
{
  return self->_colorAlphaSlider;
}

- (void)setColorAlphaSlider:(id)a3
{
  objc_storeStrong((id *)&self->_colorAlphaSlider, a3);
}

- (PKToolConfiguration)toolConfiguration
{
  return self->_toolConfiguration;
}

- (void)setToolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_toolConfiguration, a3);
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparatorView, a3);
}

- (UIView)middleSeparatorView
{
  return self->_middleSeparatorView;
}

- (void)setMiddleSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_middleSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_toolConfiguration, 0);
  objc_storeStrong((id *)&self->_colorAlphaSlider, 0);
  objc_storeStrong((id *)&self->_colorAlphaSliderView, 0);
  objc_storeStrong((id *)&self->_thicknessPicker, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
