@implementation CMKShutterButton

- (void)_commonCMKShutterButtonInitialization
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *outerView;
  UIView *v10;
  UIView *innerView;

  self->_buttonMode = 0;
  self->_spec = *(CMKShutterButtonSpec *)ymmword_20D66AAF0;
  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  outerView = self->__outerView;
  self->__outerView = v8;

  v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v5, v6, v7);
  innerView = self->__innerView;
  self->__innerView = v10;

  -[UIView setUserInteractionEnabled:](self->__outerView, "setUserInteractionEnabled:", 0);
  -[UIView setUserInteractionEnabled:](self->__innerView, "setUserInteractionEnabled:", 0);
  -[CMKShutterButton addSubview:](self, "addSubview:", self->__outerView);
  -[CMKShutterButton addSubview:](self, "addSubview:", self->__innerView);
  -[CMKShutterButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[CMKShutterButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 0);
  -[CMKShutterButton setShowsTouchWhenHighlighted:](self, "setShowsTouchWhenHighlighted:", 0);
  -[CMKShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
}

- (CMKShutterButton)initWithFrame:(CGRect)a3
{
  CMKShutterButton *v3;
  CMKShutterButton *v4;
  CMKShutterButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMKShutterButton;
  v3 = -[CMKShutterButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CMKShutterButton _commonCMKShutterButtonInitialization](v3, "_commonCMKShutterButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (CMKShutterButton)initWithCoder:(id)a3
{
  CMKShutterButton *v3;
  CMKShutterButton *v4;
  CMKShutterButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMKShutterButton;
  v3 = -[CMKShutterButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CMKShutterButton _commonCMKShutterButtonInitialization](v3, "_commonCMKShutterButtonInitialization");
    v5 = v4;
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double outerRingDiameter;
  double v3;
  CGSize result;

  outerRingDiameter = self->_spec.outerRingDiameter;
  v3 = outerRingDiameter;
  result.height = v3;
  result.width = outerRingDiameter;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double outerRingDiameter;
  double v4;
  CGSize result;

  outerRingDiameter = self->_spec.outerRingDiameter;
  v4 = outerRingDiameter;
  result.height = v4;
  result.width = outerRingDiameter;
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
  void *v12;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)CMKShutterButton;
  -[CMKShutterButton layoutSubviews](&v13, sel_layoutSubviews);
  -[CMKShutterButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView setFrame:](self->__outerImageView, "setFrame:");
  -[UIView setFrame:](self->__outerView, "setFrame:", v4, v6, v8, v10);
  -[UIView layer](self->__outerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  objc_msgSend(v11, "setCornerRadius:", ceil(CGRectGetWidth(v14) * 0.5));

  -[CMKShutterButton _sizeForMode:](self, "_sizeForMode:", self->_buttonMode);
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->__innerView, "setFrame:", 0);
  -[UIView layer](self->__innerView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMKShutterButton _cornerRadiusForMode:](self, "_cornerRadiusForMode:", self->_buttonMode);
  objc_msgSend(v12, "setCornerRadius:");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CMKShutterButton isHighlighted](self, "isHighlighted");
  v6.receiver = self;
  v6.super_class = (Class)CMKShutterButton;
  -[CMKShutterButton setHighlighted:](&v6, sel_setHighlighted_, v3);
  if (v5 != v3)
    -[CMKShutterButton _performHighlightAnimation](self, "_performHighlightAnimation");
}

- (void)setButtonMode:(int64_t)a3
{
  -[CMKShutterButton setButtonMode:animated:](self, "setButtonMode:animated:", a3, 0);
}

- (void)setButtonMode:(int64_t)a3 animated:(BOOL)a4
{
  int64_t buttonMode;
  _BOOL8 v5;

  buttonMode = self->_buttonMode;
  if (buttonMode != a3)
  {
    v5 = a4;
    self->_buttonMode = a3;
    -[CMKShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
    -[CMKShutterButton _performModeSwitchAnimationFromMode:toMode:animated:](self, "_performModeSwitchAnimationFromMode:toMode:animated:", buttonMode, self->_buttonMode, v5);
  }
}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3)
    self->_pulsing = a3;
}

- (void)setSpinning:(BOOL)a3
{
  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    -[CMKShutterButton _updateSpinningAnimations](self, "_updateSpinningAnimations");
  }
}

- (void)_setSpec:(CMKShutterButtonSpec)a3
{
  self->_spec = a3;
  -[CMKShutterButton _updateOuterAndInnerLayers](self, "_updateOuterAndInnerLayers");
}

- (double)_innerCircleDiameter
{
  double v2;
  double v3;

  -[CMKShutterButton spec](self, "spec");
  return v2 + v3 * -2.0 + -4.0;
}

- (id)_colorForMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 > 7)
    return 0;
  if (((1 << a3) & 0xEE) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.961, 0.2, 0.2, 1.0, v3, v4);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)_sizeForMode:(int64_t)a3
{
  double v3;
  double stopSquareSideLength;
  CGSize result;

  if ((unint64_t)(a3 - 4) < 4)
  {
    stopSquareSideLength = self->_spec.stopSquareSideLength;
    v3 = stopSquareSideLength;
  }
  else if ((unint64_t)a3 > 3)
  {
    v3 = *MEMORY[0x24BDBF148];
    stopSquareSideLength = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    -[CMKShutterButton _innerCircleDiameter](self, "_innerCircleDiameter");
    stopSquareSideLength = v3;
  }
  result.height = stopSquareSideLength;
  result.width = v3;
  return result;
}

- (double)_cornerRadiusForMode:(int64_t)a3
{
  double v3;

  if ((unint64_t)(a3 - 4) < 4)
    return self->_spec.stopSquareCornerRadius;
  if ((unint64_t)a3 > 3)
    return 0.0;
  -[CMKShutterButton _innerCircleDiameter](self, "_innerCircleDiameter");
  return ceil(v3 * 0.5);
}

- (double)_borderWidthForMode:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 7)
    return self->_spec.outerRingStrokeWidth;
  return result;
}

- (id)_outerImageForMode:(int64_t)a3
{
  return 0;
}

- (BOOL)_isStopMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

- (BOOL)_shouldUseImageViewForMode:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)_shouldUseTimelapseOuterViewForMode:(int64_t)a3
{
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_updateOuterAndInnerLayers
{
  UIImageView *outerImageView;
  id v4;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (-[CMKShutterButton _shouldUseImageViewForMode:](self, "_shouldUseImageViewForMode:", self->_buttonMode))
  {
    outerImageView = self->__outerImageView;
    if (!outerImageView)
    {
      v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
      -[UIView frame](self->__outerView, "frame");
      v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
      v6 = self->__outerImageView;
      self->__outerImageView = v5;

      -[CMKShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->__outerImageView, self->__outerView);
      outerImageView = self->__outerImageView;
    }
    -[CMKShutterButton _outerImageForMode:](self, "_outerImageForMode:", self->_buttonMode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](outerImageView, "setImage:", v7);

  }
  -[CMKShutterButton _outerView](self, "_outerView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMKShutterButton _borderWidthForMode:](self, "_borderWidthForMode:", self->_buttonMode);
  objc_msgSend(v8, "setBorderWidth:");
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v9, "CGColor"));

  -[CMKShutterButton _innerView](self, "_innerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMKShutterButton _colorForMode:](self, "_colorForMode:", self->_buttonMode);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

}

- (void)setShowDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  double v10;
  id v11;

  if (self->_showDisabled != a3)
  {
    v3 = a3;
    self->_showDisabled = a3;
    -[CMKShutterButton _innerView](self, "_innerView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMKShutterButton _outerView](self, "_outerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v9 = 0.4;
    else
      v9 = 1.0;
    *(float *)&v8 = v9;
    objc_msgSend(v5, "setOpacity:", v8);
    *(float *)&v10 = v9;
    objc_msgSend(v7, "setOpacity:", v10);

  }
}

- (void)_performHighlightAnimation
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v3 = -[CMKShutterButton isHighlighted](self, "isHighlighted");
  -[CMKShutterButton _innerView](self, "_innerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "valueForKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    LODWORD(v6) = 1045220557;
    objc_msgSend(v15, "setOpacity:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v5);
    UIAnimationDragCoefficient();
    objc_msgSend(v7, "setDuration:", v8 * 0.49);
    LODWORD(v9) = 1041812769;
    LODWORD(v10) = 1043018044;
    LODWORD(v11) = 1044413908;
    LODWORD(v12) = 1.0;
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v13);

    objc_msgSend(v7, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v15, "addAnimation:forKey:", v7, CFSTR("transformAnimation"));
    LODWORD(v14) = 1.0;
    objc_msgSend(v15, "setOpacity:", v14);

  }
}

- (void)_performModeSwitchAnimationFromMode:(int64_t)a3 toMode:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  float v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  float v76;
  double v77;
  double v78;
  float v79;
  unint64_t v80;
  void *v81;
  float v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  float v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  void *v95;
  float v96;
  double v97;
  float v98;
  double v99;
  double v100;
  void *v101;
  int64_t v102;
  void *v103;
  _BOOL4 v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  _BOOL4 v109;
  _BOOL4 v110;
  _BOOL4 v111;
  _BOOL4 v112;
  _BOOL4 v113;
  void *v114;
  void *v115;
  id v116;

  v5 = a5;
  -[CMKShutterButton _innerView](self, "_innerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v116 = (id)objc_claimAutoreleasedReturnValue();

  -[CMKShutterButton _outerView](self, "_outerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMKShutterButton _outerImageView](self, "_outerImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMKShutterButton _colorForMode:](self, "_colorForMode:", a4);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[CMKShutterButton _shouldUseImageViewForMode:](self, "_shouldUseImageViewForMode:", a4);
  v15 = -[CMKShutterButton _shouldUseTimelapseOuterViewForMode:](self, "_shouldUseTimelapseOuterViewForMode:", a4);
  if (v5)
  {
    objc_msgSend(v116, "presentationLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v15;
    v111 = v14;
    v104 = v5;
    v102 = a3;
    if (v16)
    {
      objc_msgSend(v116, "presentationLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "valueForKeyPath:", CFSTR("backgroundColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v116, "valueForKeyPath:", CFSTR("backgroundColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v101 = v18;

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("backgroundColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v18);
    objc_msgSend(v19, "setToValue:", v13);
    UIAnimationDragCoefficient();
    objc_msgSend(v19, "setDuration:", v20 * 0.25);
    v107 = v13;
    v21 = *MEMORY[0x24BDE5D20];
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v22);

    v23 = *MEMORY[0x24BDE5970];
    objc_msgSend(v19, "setFillMode:", *MEMORY[0x24BDE5970]);
    objc_msgSend(v116, "addAnimation:forKey:", v19, CFSTR("backgroundColorAnimation"));
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD16E0];
    -[UIView alpha](self->__outerView, "alpha");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", v26);

    UIAnimationDragCoefficient();
    objc_msgSend(v24, "setDuration:", v27 * 0.25);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v28);

    objc_msgSend(v24, "setFillMode:", v23);
    objc_msgSend(v115, "addAnimation:forKey:", v24, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x24BDD16E0];
    -[UIImageView alpha](self->__outerImageView, "alpha");
    objc_msgSend(v30, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFromValue:", v31);

    UIAnimationDragCoefficient();
    objc_msgSend(v29, "setDuration:", v32 * 0.25);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimingFunction:", v33);

    objc_msgSend(v29, "setFillMode:", v23);
    objc_msgSend(v114, "addAnimation:forKey:", v29, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    UIAnimationDragCoefficient();
    objc_msgSend(v34, "setDuration:", v35 * 0.25);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTimingFunction:", v36);

    v13 = v107;
    objc_msgSend(v34, "setFillMode:", v23);
    objc_msgSend(0, "addAnimation:forKey:", v34, CFSTR("opacity"));

    v15 = v109;
    v14 = v111;
    v5 = v104;
    a3 = v102;
  }
  if (-[CMKShutterButton _isStopMode:](self, "_isStopMode:", a4, v101))
  {
    -[CMKShutterButton _sizeForMode:](self, "_sizeForMode:", a4);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      LODWORD(v38) = 1041812769;
      LODWORD(v39) = 1043018044;
      LODWORD(v40) = 1044413908;
      LODWORD(v41) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "presentationLayer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v15;
      v112 = v14;
      if (v43)
      {
        objc_msgSend(v116, "presentationLayer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "valueForKeyPath:", CFSTR("bounds.size"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("bounds.size"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("bounds.size"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFromValue:", v45);
      objc_msgSend(v58, "setToValue:", v37);
      UIAnimationDragCoefficient();
      objc_msgSend(v58, "setDuration:", v59 * 0.265);
      objc_msgSend(v58, "setTimingFunction:", v42);
      v60 = *MEMORY[0x24BDE5970];
      objc_msgSend(v58, "setFillMode:", *MEMORY[0x24BDE5970]);
      objc_msgSend(v116, "presentationLayer");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        objc_msgSend(v116, "presentationLayer");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "valueForKeyPath:", CFSTR("cornerRadius"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("cornerRadius"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setFromValue:", v63);
      objc_msgSend(v64, "setToValue:", &unk_24C7562B8);
      UIAnimationDragCoefficient();
      objc_msgSend(v64, "setDuration:", v65 * 0.265);
      objc_msgSend(v64, "setTimingFunction:", v42);
      objc_msgSend(v64, "setFillMode:", v60);
      objc_msgSend(v116, "presentationLayer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        objc_msgSend(v116, "presentationLayer");
        v105 = v58;
        v67 = v60;
        v68 = v42;
        v69 = v37;
        v70 = v63;
        v71 = v45;
        v72 = v13;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "valueForKeyPath:", CFSTR("transform.scale.xy"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v72;
        v45 = v71;
        v63 = v70;
        v37 = v69;
        v42 = v68;
        v60 = v67;
        v58 = v105;
      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("transform.scale.xy"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setFromValue:", v74);
      objc_msgSend(v75, "setToValue:", &unk_24C7562C8);
      UIAnimationDragCoefficient();
      objc_msgSend(v75, "setDuration:", v76 * 0.36);
      objc_msgSend(v116, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v78 = v77;
      UIAnimationDragCoefficient();
      objc_msgSend(v75, "setBeginTime:", v78 + v79 * 0.085);
      objc_msgSend(v75, "setFillMode:", v60);
      objc_msgSend(v75, "setTimingFunction:", v42);
      objc_msgSend(v116, "addAnimation:forKey:", v58, CFSTR("sizeAnimation"));
      objc_msgSend(v116, "addAnimation:forKey:", v64, CFSTR("cornerRadiusAnimation"));
      objc_msgSend(v116, "addAnimation:forKey:", v75, CFSTR("transformAnimation"));

      v57 = v116;
      v15 = v110;
      v14 = v112;
    }
    else
    {
      objc_msgSend(v116, "removeAllAnimations");
      v57 = v116;
    }
    objc_msgSend(v57, "setValue:forKeyPath:", v37, CFSTR("bounds.size"));
    objc_msgSend(v116, "setValue:forKeyPath:", &unk_24C7562B8, CFSTR("cornerRadius"));
    objc_msgSend(v116, "setValue:forKeyPath:", &unk_24C7562C8, CFSTR("transform.scale.xy"));
  }
  else
  {
    if (!-[CMKShutterButton _isStopMode:](self, "_isStopMode:", a3))
      goto LABEL_35;
    -[CMKShutterButton _sizeForMode:](self, "_sizeForMode:", a4);
    v47 = v46;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", ceil(v47 * 0.5));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      LODWORD(v49) = 1041812769;
      LODWORD(v50) = 1043018044;
      LODWORD(v51) = 1044413908;
      LODWORD(v52) = 1.0;
      objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "presentationLayer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v14;
      if (v54)
      {
        objc_msgSend(v116, "presentationLayer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "valueForKeyPath:", CFSTR("bounds.size"));
        v56 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("bounds.size"));
        v56 = objc_claimAutoreleasedReturnValue();
      }

      v80 = 0x24BDE5000uLL;
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("bounds.size"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setFromValue:", v56);
      objc_msgSend(v81, "setToValue:", v37);
      UIAnimationDragCoefficient();
      objc_msgSend(v81, "setDuration:", v82 * 0.49);
      objc_msgSend(v81, "setTimingFunction:", v53);
      v106 = *MEMORY[0x24BDE5970];
      objc_msgSend(v81, "setFillMode:");
      objc_msgSend(v116, "presentationLayer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v13;
      v103 = (void *)v56;
      if (v83)
      {
        objc_msgSend(v116, "presentationLayer");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "valueForKeyPath:", CFSTR("cornerRadius"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("cornerRadius"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setFromValue:", v85);
      objc_msgSend(v86, "setToValue:", v48);
      UIAnimationDragCoefficient();
      objc_msgSend(v86, "setDuration:", v87 * 0.395);
      objc_msgSend(v86, "setTimingFunction:", v53);
      objc_msgSend(v86, "setFillMode:", v106);
      objc_msgSend(v116, "presentationLayer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (v88)
      {
        objc_msgSend(v116, "presentationLayer");
        v89 = v48;
        v90 = v53;
        v91 = v85;
        v92 = v15;
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "valueForKeyPath:", CFSTR("transform.scale.xy"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v92;
        v85 = v91;
        v53 = v90;
        v48 = v89;
        v80 = 0x24BDE5000;
      }
      else
      {
        objc_msgSend(v116, "valueForKeyPath:", CFSTR("transform.scale.xy"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(*(id *)(v80 + 1608), "animationWithKeyPath:", CFSTR("transform.scale.xy"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setFromValue:", v94);
      objc_msgSend(v95, "setToValue:", &unk_24C7562C8);
      UIAnimationDragCoefficient();
      objc_msgSend(v95, "setDuration:", v96 * 0.49);
      objc_msgSend(v95, "setFillMode:", v106);
      objc_msgSend(v95, "setTimingFunction:", v53);
      objc_msgSend(v116, "addAnimation:forKey:", v81, CFSTR("sizeAnimation"));
      objc_msgSend(v116, "addAnimation:forKey:", v86, CFSTR("cornerRadiusAnimation"));
      objc_msgSend(v116, "addAnimation:forKey:", v95, CFSTR("transformAnimation"));

      v13 = v108;
      v14 = v113;
    }
    else
    {
      objc_msgSend(v116, "removeAllAnimations");
    }
    objc_msgSend(v116, "setValue:forKeyPath:", v37, CFSTR("bounds.size"));
    objc_msgSend(v116, "setValue:forKeyPath:", v48, CFSTR("cornerRadius"));
    objc_msgSend(v116, "setValue:forKeyPath:", &unk_24C7562C8, CFSTR("transform.scale.xy"));

  }
LABEL_35:
  objc_msgSend(v116, "setValue:forKeyPath:", v13, CFSTR("backgroundColor"));
  v98 = 1.0;
  if (v14 || v15)
    *(float *)&v97 = 0.0;
  else
    *(float *)&v97 = 1.0;
  objc_msgSend(v115, "setOpacity:", v97);
  if (v15)
    *(float *)&v99 = 0.0;
  else
    *(float *)&v99 = 1.0;
  if (!v15)
    v98 = 0.0;
  objc_msgSend(v114, "setOpacity:", v99);
  *(float *)&v100 = v98;
  objc_msgSend(0, "setOpacity:", v100);

}

- (void)_updateSpinningAnimations
{
  UIActivityIndicatorView *progressActivityIndicatorView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  progressActivityIndicatorView = self->__progressActivityIndicatorView;
  if (!progressActivityIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 101);
    v5 = self->__progressActivityIndicatorView;
    self->__progressActivityIndicatorView = v4;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->__progressActivityIndicatorView, "setColor:", v6);

    -[UIActivityIndicatorView setAnimationDuration:](self->__progressActivityIndicatorView, "setAnimationDuration:", 1.0);
    -[UIActivityIndicatorView sizeThatFits:](self->__progressActivityIndicatorView, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[CMKShutterButton bounds](self, "bounds");
    UIRectCenteredIntegralRectScale();
    -[UIActivityIndicatorView setFrame:](self->__progressActivityIndicatorView, "setFrame:", 0);
    progressActivityIndicatorView = self->__progressActivityIndicatorView;
  }
  -[CMKShutterButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", progressActivityIndicatorView, self->__innerView);
  if (self->_spinning)
  {
    -[UIView setAlpha:](self->__innerView, "setAlpha:", 0.0);
    -[UIActivityIndicatorView setAlpha:](self->__progressActivityIndicatorView, "setAlpha:", 1.0);
    -[UIActivityIndicatorView startAnimating](self->__progressActivityIndicatorView, "startAnimating");
  }
  else
  {
    v7[4] = self;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__CMKShutterButton__updateSpinningAnimations__block_invoke;
    v8[3] = &unk_24C755B60;
    v8[4] = self;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__CMKShutterButton__updateSpinningAnimations__block_invoke_2;
    v7[3] = &unk_24C755B88;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 327680, v8, v7, 0.3, 0.0);
  }
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (CMKShutterButtonSpec)spec
{
  double outerRingDiameter;
  double outerRingStrokeWidth;
  double stopSquareSideLength;
  double stopSquareCornerRadius;
  CMKShutterButtonSpec result;

  outerRingDiameter = self->_spec.outerRingDiameter;
  outerRingStrokeWidth = self->_spec.outerRingStrokeWidth;
  stopSquareSideLength = self->_spec.stopSquareSideLength;
  stopSquareCornerRadius = self->_spec.stopSquareCornerRadius;
  result.stopSquareCornerRadius = stopSquareCornerRadius;
  result.stopSquareSideLength = stopSquareSideLength;
  result.outerRingStrokeWidth = outerRingStrokeWidth;
  result.outerRingDiameter = outerRingDiameter;
  return result;
}

- (BOOL)isPulsing
{
  return self->_pulsing;
}

- (BOOL)isSpinning
{
  return self->_spinning;
}

- (BOOL)showDisabled
{
  return self->_showDisabled;
}

- (UIView)_outerView
{
  return self->__outerView;
}

- (UIImageView)_outerImageView
{
  return self->__outerImageView;
}

- (UIView)_innerView
{
  return self->__innerView;
}

- (UIActivityIndicatorView)_progressActivityIndicatorView
{
  return self->__progressActivityIndicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->__innerView, 0);
  objc_storeStrong((id *)&self->__outerImageView, 0);
  objc_storeStrong((id *)&self->__outerView, 0);
}

uint64_t __45__CMKShutterButton__updateSpinningAnimations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "setAlpha:", 1.0);
}

uint64_t __45__CMKShutterButton__updateSpinningAnimations__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "removeFromSuperview");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 792), "stopAnimating");
}

+ (id)shutterButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v2, "_setSpec:", 66.0, 6.0, 28.0, 4.0);
  return v2;
}

+ (id)smallShutterButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v2, "_setSpec:", 47.0, 5.0, 19.0, 4.0);
  return v2;
}

+ (id)tinyShutterButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v2, "_setSpec:", 28.0, 5.0, 11.0, 2.0);
  return v2;
}

+ (id)shutterButtonWithDesiredSpec:(CMKShutterButtonSpec)a3
{
  double stopSquareCornerRadius;
  double stopSquareSideLength;
  double outerRingStrokeWidth;
  double outerRingDiameter;
  void *v7;

  stopSquareCornerRadius = a3.stopSquareCornerRadius;
  stopSquareSideLength = a3.stopSquareSideLength;
  outerRingStrokeWidth = a3.outerRingStrokeWidth;
  outerRingDiameter = a3.outerRingDiameter;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "_setSpec:", outerRingDiameter, outerRingStrokeWidth, stopSquareSideLength, stopSquareCornerRadius);
  return v7;
}

@end
