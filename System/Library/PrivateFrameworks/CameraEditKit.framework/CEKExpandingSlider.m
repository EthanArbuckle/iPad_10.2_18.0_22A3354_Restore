@implementation CEKExpandingSlider

- (CEKExpandingSlider)initWithTitle:(id)a3
{
  return -[CEKExpandingSlider initWithTitle:minimumValue:maximumValue:defaultValue:](self, "initWithTitle:minimumValue:maximumValue:defaultValue:", a3, -1.0, 1.0, 0.0);
}

- (CEKExpandingSlider)initWithTitle:(id)a3 minimumValue:(double)a4 maximumValue:(double)a5 defaultValue:(double)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CEKExpandingSlider *v15;
  void *v16;
  CEKSlider *v17;
  CEKSlider *slider;
  void *v19;
  void *v20;
  CEKExpandingTickMarksView *v21;
  CEKExpandingTickMarksView *ticksView;
  uint64_t v23;
  UILabel *titleLabel;
  void *v25;
  uint64_t v26;
  UILabel *valueLabel;
  void *v28;
  UIView *v29;
  UIView *levelIndicatorView;
  void *v31;
  void *v32;
  CEKAdditiveAnimator *v33;
  CEKAdditiveAnimator *animator;
  uint64_t v35;
  UILongPressGestureRecognizer *gestureRecognizer;
  objc_super v38;

  v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CEKExpandingSlider;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[CEKExpandingSlider initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider setTintColor:](v15, "setTintColor:", v16);

    v17 = -[CEKSlider initWithTitle:]([CEKSlider alloc], "initWithTitle:", v10);
    slider = v15->__slider;
    v15->__slider = v17;

    -[CEKSlider setSliderVerticalAlignment:](v15->__slider, "setSliderVerticalAlignment:", 2);
    -[CEKSlider setValueLabelVisibility:](v15->__slider, "setValueLabelVisibility:", 2);
    -[CEKSlider setTitleAlignment:](v15->__slider, "setTitleAlignment:", 2);
    -[CEKSlider setFontStyle:](v15->__slider, "setFontStyle:", 1);
    -[CEKSlider tickMarksConfiguration](v15->__slider, "tickMarksConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMainTickMarkInterval:", 5);

    -[CEKSlider tickMarksConfiguration](v15->__slider, "tickMarksConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTickMarkSpacing:", 7.0);

    -[CEKSlider setInteractiveWhenHidden:](v15->__slider, "setInteractiveWhenHidden:", 1);
    -[CEKSlider setMinimumValue:](v15->__slider, "setMinimumValue:", a4);
    -[CEKSlider setDefaultValue:](v15->__slider, "setDefaultValue:", a6);
    -[CEKSlider setMaximumValue:](v15->__slider, "setMaximumValue:", a5);
    -[CEKSlider addTarget:action:forControlEvents:](v15->__slider, "addTarget:action:forControlEvents:", v15, sel__handleSliderDidChangeValue_, 4096);
    -[CEKExpandingSlider addSubview:](v15, "addSubview:", v15->__slider);
    v21 = objc_alloc_init(CEKExpandingTickMarksView);
    ticksView = v15->__ticksView;
    v15->__ticksView = v21;

    -[CEKExpandingTickMarksView setUserInteractionEnabled:](v15->__ticksView, "setUserInteractionEnabled:", 0);
    -[CEKExpandingSlider addSubview:](v15, "addSubview:", v15->__ticksView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v15->__titleLabel;
    v15->__titleLabel = (UILabel *)v23;

    -[UILabel setUserInteractionEnabled:](v15->__titleLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v15->__titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v15->__titleLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v15->__titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15->__titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setText:](v15->__titleLabel, "setText:", v10);
    CEKFontOfSizeAndStyle(1, 14.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15->__titleLabel, "setFont:", v25);

    -[CEKExpandingSlider addSubview:](v15, "addSubview:", v15->__titleLabel);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    valueLabel = v15->__valueLabel;
    v15->__valueLabel = (UILabel *)v26;

    -[UILabel setUserInteractionEnabled:](v15->__valueLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v15->__valueLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v15->__valueLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v15->__valueLabel, "setNumberOfLines:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v15->__valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    CEKMonospacedStylisticNumeralFontOfSizeAndStyle(1, 14.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v15->__valueLabel, "setFont:", v28);

    -[CEKExpandingSlider addSubview:](v15, "addSubview:", v15->__valueLabel);
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    levelIndicatorView = v15->__levelIndicatorView;
    v15->__levelIndicatorView = v29;

    -[UIView setUserInteractionEnabled:](v15->__levelIndicatorView, "setUserInteractionEnabled:", 0);
    -[UIView layer](v15->__levelIndicatorView, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAnchorPoint:", 0.5, 0.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15->__levelIndicatorView, "setBackgroundColor:", v32);

    -[CEKExpandingSlider addSubview:](v15, "addSubview:", v15->__levelIndicatorView);
    v15->_markedValue = 1.79769313e308;
    v33 = objc_alloc_init(CEKAdditiveAnimator);
    animator = v15->__animator;
    v15->__animator = v33;

    -[CEKAdditiveAnimator setDelegate:](v15->__animator, "setDelegate:", v15);
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v15, sel__handlePress_);
    gestureRecognizer = v15->__gestureRecognizer;
    v15->__gestureRecognizer = (UILongPressGestureRecognizer *)v35;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v15->__gestureRecognizer, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v15->__gestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setDelaysTouchesEnded:](v15->__gestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UILongPressGestureRecognizer setDelegate:](v15->__gestureRecognizer, "setDelegate:", v15);
    -[CEKExpandingSlider addGestureRecognizer:](v15, "addGestureRecognizer:", v15->__gestureRecognizer);
    -[CEKExpandingSlider _updateUIForValue:animated:](v15, "_updateUIForValue:animated:", 0, 0.0);
    -[CEKExpandingSlider _updateSubviewVisibility](v15, "_updateSubviewVisibility");
    -[CEKExpandingSlider _updateLabelColorsForProgress:](v15, "_updateLabelColorsForProgress:", 0.0);
    -[CEKExpandingSlider _updateColors](v15, "_updateColors");
  }

  return v15;
}

- (double)value
{
  void *v2;
  double v3;
  double v4;

  -[CEKExpandingSlider _slider](self, "_slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (void)setValue:(double)a3
{
  -[CEKExpandingSlider setValue:animated:](self, "setValue:animated:", 0, a3);
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  void *v8;

  v4 = a4;
  -[CEKExpandingSlider value](self, "value");
  if (v7 != a3)
  {
    -[CEKExpandingSlider _slider](self, "_slider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:", a3);

    -[CEKExpandingSlider _updateUIForValue:animated:](self, "_updateUIForValue:animated:", v4, a3);
  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CEKExpandingSlider _slider](self, "_slider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CEKExpandingSlider _slider](self, "_slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[CEKExpandingSlider _slider](self, "_slider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    -[CEKExpandingSlider setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setExpanded:(BOOL)a3
{
  -[CEKExpandingSlider setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  -[CEKExpandingSlider _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", a3, a4, 0);
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 expanded;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  if (self->_expanded != a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = a3;
    self->_expanded = a3;
    v9 = 1.0;
    if (!a3)
    {
      -[CEKExpandingSlider _updateSubviewVisibility](self, "_updateSubviewVisibility");
      v9 = 0.0;
    }
    -[CEKExpandingSlider _ticksView](self, "_ticksView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExpanded:animated:", v7, v6);

    -[CEKExpandingSlider setNeedsLayout](self, "setNeedsLayout");
    if (v6)
    {
      -[CEKExpandingSlider _setExpansionAnimationCounter:](self, "_setExpansionAnimationCounter:", -[CEKExpandingSlider _expansionAnimationCounter](self, "_expansionAnimationCounter") + 1);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CEKExpandingSlider _animator](self, "_animator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", CFSTR("CEKExpandingSliderAnimatorProgressKey"), v11, v9, 0.35);

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v11);
      v16[4] = self;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke;
      v17[3] = &unk_1E70A4B18;
      v17[4] = self;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke_2;
      v16[3] = &unk_1E70A4B88;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v17, v16, 0.35, 0.0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

      if (!v5)
        return;
    }
    else
    {
      -[CEKExpandingSlider _updateLabelColorsForProgress:](self, "_updateLabelColorsForProgress:", v9);
      -[CEKExpandingSlider _updateMarkedValueAnimated:](self, "_updateMarkedValueAnimated:", 0);
      if (!v5)
        return;
    }
    expanded = self->_expanded;
    -[CEKExpandingSlider delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (expanded)
      objc_msgSend(v14, "sliderWillExpand:", self);
    else
      objc_msgSend(v14, "sliderWillCollapse:", self);

  }
}

uint64_t __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __57__CEKExpandingSlider__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setExpansionAnimationCounter:", objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "_expansionAnimationCounter");
  if (!result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSubviewVisibility");
    return objc_msgSend(*(id *)(a1 + 32), "_updateMarkedValueAnimated:", 1);
  }
  return result;
}

- (void)_updateSubviewVisibility
{
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v3 = 1.0;
  else
    v3 = 0.0;
  -[CEKExpandingSlider _slider](self, "_slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v5 = 0.0;
  else
    v5 = 1.0;
  -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v7 = 0.0;
  else
    v7 = 1.0;
  -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v9 = 0.0;
  else
    v9 = 1.0;
  -[CEKExpandingSlider _ticksView](self, "_ticksView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlpha:", v9);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v11 = 0.0;
  else
    v11 = 1.0;
  -[CEKExpandingSlider _levelIndicatorView](self, "_levelIndicatorView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", v11);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)CEKExpandingSlider;
  -[CEKExpandingSlider hitTest:withEvent:](&v15, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider bounds](self, "bounds");
  v9 = v8;
  if (!-[CEKExpandingSlider expanded](self, "expanded"))
  {
    -[CEKExpandingSlider _ticksView](self, "_ticksView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intrinsicContentSize");
    v12 = v11;

    -[CEKExpandingSlider collapsedCenterX](self, "collapsedCenterX");
    v17.origin.x = v13 + v12 * -0.5;
    v17.origin.y = 0.0;
    v17.size.width = v12;
    v17.size.height = v9;
    v16.x = x;
    v16.y = y;
    if (!CGRectContainsPoint(v17, v16))
    {

      v7 = 0;
    }
  }
  return v7;
}

- (void)setCollapsedCenterX:(double)a3
{
  if (self->_collapsedCenterX != a3)
  {
    self->_collapsedCenterX = a3;
    -[CEKExpandingSlider setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CEKExpandingSlider tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider _slider](self, "_slider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  -[CEKExpandingSlider tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider _levelIndicatorView](self, "_levelIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (!-[CEKExpandingSlider expanded](self, "expanded"))
    -[CEKExpandingSlider _updateLabelColorsForProgress:](self, "_updateLabelColorsForProgress:", 0.0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKExpandingSlider;
  -[CEKExpandingSlider tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CEKExpandingSlider _updateColors](self, "_updateColors");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CEKExpandingSlider;
  -[CEKExpandingSlider traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CEKExpandingSlider _updateColors](self, "_updateColors");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CEKExpandingSlider _ticksView](self, "_ticksView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  CGFloat v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  CGFloat v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  CGFloat v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  char v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  objc_super v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  v92.receiver = self;
  v92.super_class = (Class)CEKExpandingSlider;
  -[CEKExpandingSlider layoutSubviews](&v92, sel_layoutSubviews);
  -[CEKExpandingSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKExpandingSlider _slider](self, "_slider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v6;
  v87 = v4;
  v84 = v10;
  v85 = v8;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
    v12 = 1.0;
  else
    v12 = 0.0;
  -[CEKExpandingSlider _animator](self, "_animator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v12;
  objc_msgSend(v13, "setValue:forKey:duration:timingCurve:", CFSTR("CEKExpandingSliderAnimatorProgressKey"), 0, v12, 0.0);

  -[CEKExpandingSlider _slider](self, "_slider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frameForTitleLabel");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CEKExpandingSlider _slider](self, "_slider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v23, v16, v18, v20, v22);
  v90 = v24;
  v91 = v25;
  v27 = v26;
  v29 = v28;

  -[CEKExpandingSlider _slider](self, "_slider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "frameForValueLabel");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[CEKExpandingSlider _slider](self, "_slider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v39, v32, v34, v36, v38);
  v83 = v40;

  -[CEKExpandingSlider _slider](self, "_slider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frameForLevelIndicator");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[CEKExpandingSlider _slider](self, "_slider");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v50, v43, v45, v47, v49);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;

  -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "intrinsicContentSize");
  v61 = v60;

  -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "intrinsicContentSize");
  v64 = v63;

  if (-[CEKExpandingSlider expanded](self, "expanded"))
  {
    v93.origin.x = v90;
    v93.size.width = v91;
    v93.origin.y = v27;
    v93.size.height = v29;
    v65 = CGRectGetMaxX(v93) - v61;
    -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setFrame:", v65, v27, v61, 18.0);

    v94.origin.y = v86;
    v94.origin.x = v87;
    v94.size.height = v84;
    v94.size.width = v85;
    CGRectGetMidX(v94);
    UIRoundToViewScale();
    v68 = v67;
    -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setFrame:", v68, v83, v64, 18.0);

  }
  else
  {
    -[CEKExpandingSlider collapsedCenterX](self, "collapsedCenterX");
    v88 = v56;
    UIRoundToViewScale();
    v70 = v29;
    v72 = v71;
    -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFrame:", v72, v27, v61, 18.0);

    -[CEKExpandingSlider collapsedCenterX](self, "collapsedCenterX");
    UIRoundToViewScale();
    v75 = v74;
    v95.origin.x = v90;
    v95.size.width = v91;
    v95.origin.y = v27;
    v95.size.height = v70;
    v76 = CGRectGetMaxY(v95) + -1.0;
    -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setFrame:", v75, v76, v64, 18.0);

    -[CEKExpandingSlider collapsedCenterX](self, "collapsedCenterX");
    v79 = v78 + -0.5;
    v56 = v88;
    v96.origin.x = v52;
    v96.origin.y = v54;
    v96.size.width = v88;
    v96.size.height = v58;
    v54 = CGRectGetMaxY(v96) + -10.0;
    v58 = 10.0;
    v52 = v79;
  }
  -[CEKExpandingSlider _levelIndicatorView](self, "_levelIndicatorView", *(_QWORD *)&v83);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setFrame:", v52, v54, v56, v58);

  -[CEKExpandingSlider _animator](self, "_animator");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "isAnimating");

  if ((v82 & 1) == 0)
    -[CEKExpandingSlider _updateTickViewFrameForProgress:](self, "_updateTickViewFrameForProgress:", v89);
}

- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4
{
  void *v5;
  double v6;
  double v7;

  -[CEKExpandingSlider _animator](self, "_animator", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("CEKExpandingSliderAnimatorProgressKey"));
  v7 = v6;

  -[CEKExpandingSlider _updateTickViewFrameForProgress:](self, "_updateTickViewFrameForProgress:", v7);
  -[CEKExpandingSlider _updateLabelColorsForProgress:](self, "_updateLabelColorsForProgress:", v7);
}

- (void)_updateTickViewFrameForProgress:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  -[CEKExpandingSlider _ticksView](self, "_ticksView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;

  -[CEKExpandingSlider _slider](self, "_slider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameForTicksView");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CEKExpandingSlider _slider](self, "_slider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider convertRect:fromView:](self, "convertRect:fromView:", v19, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[CEKExpandingSlider collapsedCenterX](self, "collapsedCenterX");
  v27 = CEKInterpolate(v26 + v7 * -0.5, v21, a3);
  v28 = CEKInterpolate(v7, v25, a3);
  -[CEKExpandingSlider _ticksView](self, "_ticksView");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v27, v23, v28, v9);

}

- (void)_updateLabelColorsForProgress:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;

  v5 = CEKInterpolateClamped(1.0, 0.6, a3);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider _titleLabel](self, "_titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  if (-[CEKExpandingSlider expanded](self, "expanded"))
  {
    v16 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    -[CEKExpandingSlider tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColorWithTraitCollection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "getRed:green:blue:alpha:", &v17, &v16, &v15, 0);
    v17 = CEKInterpolateClamped(1.0, v17, a3);
    v16 = CEKInterpolateClamped(1.0, v16, a3);
    v15 = CEKInterpolateClamped(1.0, v15, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v17, v16, v15, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v11);

  }
}

- (void)_updateMarkedValueAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = a3;
  -[CEKExpandingSlider _gestureRecognizer](self, "_gestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if ((unint64_t)(v6 - 1) < 2
    || (-[CEKExpandingSlider _markedValueAnimationTimer](self, "_markedValueAnimationTimer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    -[CEKExpandingSlider markedValue](self, "markedValue");
    v9 = v8;
  }
  else
  {
    v9 = 1.79769313e308;
  }
  -[CEKExpandingSlider _slider](self, "_slider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMarkedValue:animated:", v3, v9);

}

- (void)_handlePress:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 1)
    {
      -[CEKExpandingSlider _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 1, 1, 1);
      -[CEKExpandingSlider _markedValueAnimationTimer](self, "_markedValueAnimationTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      -[CEKExpandingSlider _setMarkedValueAnimationTimer:](self, "_setMarkedValueAnimationTimer:", 0);
      -[CEKExpandingSlider _expansionAnimationTimer](self, "_expansionAnimationTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidate");

      -[CEKExpandingSlider _setExpansionAnimationTimer:](self, "_setExpansionAnimationTimer:", 0);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E88];
    -[CEKExpandingSlider _slider](self, "_slider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animationDuration");
    objc_msgSend(v5, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleMarkedValueAnimationTimerFired_, 0, 0, 1.0 - v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _setMarkedValueAnimationTimer:](self, "_setMarkedValueAnimationTimer:", v8);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _markedValueAnimationTimer](self, "_markedValueAnimationTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C99860];
    objc_msgSend(v9, "addTimer:forMode:", v10, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleExpansionAnimationTimerFired_, 0, 0, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _setExpansionAnimationTimer:](self, "_setExpansionAnimationTimer:", v12);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[CEKExpandingSlider _expansionAnimationTimer](self, "_expansionAnimationTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTimer:forMode:", v13, v11);

  }
}

- (void)_handleMarkedValueAnimationTimerFired:(id)a3
{
  -[CEKExpandingSlider _setMarkedValueAnimationTimer:](self, "_setMarkedValueAnimationTimer:", 0);
  -[CEKExpandingSlider _updateMarkedValueAnimated:](self, "_updateMarkedValueAnimated:", 1);
}

- (void)_handleExpansionAnimationTimerFired:(id)a3
{
  -[CEKExpandingSlider _setExpansionAnimationTimer:](self, "_setExpansionAnimationTimer:", 0);
  -[CEKExpandingSlider _setExpanded:animated:shouldNotify:](self, "_setExpanded:animated:shouldNotify:", 0, 1, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_handleSliderDidChangeValue:(id)a3
{
  objc_msgSend(a3, "value");
  -[CEKExpandingSlider _updateUIForValue:animated:](self, "_updateUIForValue:animated:", 0);
  -[CEKExpandingSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_updateUIForValue:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  -[CEKExpandingSlider _slider](self, "_slider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 * 100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedIntegerStringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEKExpandingSlider _valueLabel](self, "_valueLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

  -[CEKExpandingSlider _ticksView](self, "_ticksView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedValue:animated:", v4, a3);

  -[CEKExpandingSlider setNeedsLayout](self, "setNeedsLayout");
}

- (CEKExpandingSliderDelegate)delegate
{
  return (CEKExpandingSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)markedValue
{
  return self->_markedValue;
}

- (void)setMarkedValue:(double)a3
{
  self->_markedValue = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (double)collapsedCenterX
{
  return self->_collapsedCenterX;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (UIView)_levelIndicatorView
{
  return self->__levelIndicatorView;
}

- (CEKExpandingTickMarksView)_ticksView
{
  return self->__ticksView;
}

- (CEKSlider)_slider
{
  return self->__slider;
}

- (UILongPressGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (unint64_t)_expansionAnimationCounter
{
  return self->__expansionAnimationCounter;
}

- (void)_setExpansionAnimationCounter:(unint64_t)a3
{
  self->__expansionAnimationCounter = a3;
}

- (NSTimer)_expansionAnimationTimer
{
  return self->__expansionAnimationTimer;
}

- (void)_setExpansionAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->__expansionAnimationTimer, a3);
}

- (NSTimer)_markedValueAnimationTimer
{
  return self->__markedValueAnimationTimer;
}

- (void)_setMarkedValueAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->__markedValueAnimationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__markedValueAnimationTimer, 0);
  objc_storeStrong((id *)&self->__expansionAnimationTimer, 0);
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__slider, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__levelIndicatorView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
