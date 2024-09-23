@implementation CPUIMediaButton

- (CPUIMediaButton)initWithFrame:(CGRect)a3
{
  CPUIMediaButton *v3;
  CPUIMediaButton *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPUIMediaButton;
  v3 = -[CPUIMediaButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CPUIMediaButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7888]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    -[CPUIMediaButton setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
    -[CPUIMediaButton setAdjustsImageWhenDisabled:](v4, "setAdjustsImageWhenDisabled:", 0);
    -[CPUIMediaButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
  }
  return v4;
}

- (BOOL)canShowHighlight
{
  void *v2;
  char v3;

  -[CPUIMediaButton traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CPUITraitCollectionSupportsFocus(v2);

  return v3;
}

- (void)setShowBezelInTouch:(BOOL)a3
{
  if (self->_showBezelInTouch != a3)
  {
    self->_showBezelInTouch = a3;
    -[CPUIMediaButton _updateButtonStyle](self, "_updateButtonStyle");
  }
}

- (void)setShowHighlight:(BOOL)a3
{
  if (self->_showHighlight != a3)
  {
    self->_showHighlight = a3;
    -[CPUIMediaButton _updateButtonStyle](self, "_updateButtonStyle");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[CPUIMediaButton isHidden](self, "isHidden") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CPUIMediaButton;
    -[CPUIMediaButton setHidden:](&v6, sel_setHidden_, v3);
    if (-[CPUIMediaButton isFocused](self, "isFocused"))
    {
      if (v3)
      {
        -[CPUIMediaButton superview](self, "superview");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setNeedsFocusUpdate");

      }
    }
  }
}

- (id)_buttonBackGroundColorTouch
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
}

- (double)focusLayerCornerRadius
{
  return 7.0;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  CALayer *focusColorLayer;
  CALayer *v11;
  CALayer *v12;
  CALayer *v13;
  double v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  double v22;
  uint64_t v23;
  CALayer *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CPUIMediaButton;
  -[CPUIMediaButton layoutSubviews](&v36, sel_layoutSubviews);
  v3 = -[CPUIMediaButton canShowHighlight](self, "canShowHighlight");
  if (-[CPUIMediaButton showHighlight](self, "showHighlight"))
    v4 = 1;
  else
    v4 = -[CPUIMediaButton isHighlighted](self, "isHighlighted");
  v5 = -[CPUIMediaButton isFocused](self, "isFocused");
  v6 = -[CPUIMediaButton isSelected](self, "isSelected");
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CPUIMediaButton isHighlighted](self, "isHighlighted") & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
  else
    -[CPUIMediaButton tintColorForUnhighlightedTextLabel](self, "tintColorForUnhighlightedTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIMediaButton layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && !-[CPUIMediaButton showBezelInTouch](self, "showBezelInTouch"))
    goto LABEL_15;
  focusColorLayer = self->_focusColorLayer;
  if (!focusColorLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v11 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v12 = self->_focusColorLayer;
    self->_focusColorLayer = v11;

    -[CALayer setCornerCurve:](self->_focusColorLayer, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    -[CPUIMediaButton focusLayerCornerRadius](self, "focusLayerCornerRadius");
    -[CALayer setCornerRadius:](self->_focusColorLayer, "setCornerRadius:");
    focusColorLayer = self->_focusColorLayer;
  }
  objc_msgSend(v9, "addSublayer:", focusColorLayer);
  v13 = self->_focusColorLayer;
  -[CPUIMediaButton bounds](self, "bounds");
  -[CALayer setFrame:](v13, "setFrame:");
  LODWORD(v14) = 1.0;
  -[CALayer setOpacity:](self->_focusColorLayer, "setOpacity:", v14);
  if (!v3)
  {
LABEL_15:
    if (v6)
    {
      -[CPUIMediaButton colorForTouchContentSelected](self, "colorForTouchContentSelected");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CPUIMediaButton showBezelInTouch](self, "showBezelInTouch"))
      {
        -[CPUIMediaButton colorForTouchFocusLayerSelected](self, "colorForTouchFocusLayerSelected");
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v15 = (void *)v19;

        v20 = 0;
        v21 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      -[CPUIMediaButton updateButtonOpacityForKnobUnfocused](self, "updateButtonOpacityForKnobUnfocused");
      -[CPUIMediaButton colorForKnobFocusLayer](self, "colorForKnobFocusLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CPUIMediaButton showBezelInTouch](self, "showBezelInTouch"))
      {
        -[CPUIMediaButton colorForTouchFocusLayer](self, "colorForTouchFocusLayer");
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    v20 = 0;
    v21 = 0;
    v15 = v7;
    goto LABEL_35;
  }
  -[CPUIMediaButton colorForKnobFocusLayer](self, "colorForKnobFocusLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((v5 & 1) == 0)
      -[CPUIMediaButton updateButtonOpacityForKnobUnfocused](self, "updateButtonOpacityForKnobUnfocused");
    -[CPUIMediaButton colorForKnobFocusLayer](self, "colorForKnobFocusLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (v5)
      goto LABEL_33;
    goto LABEL_25;
  }
  if (v5)
  {
    -[CPUIMediaButton colorForKnobFocusLayerSelected](self, "colorForKnobFocusLayerSelected");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = 1;
  }
  else
  {
    if (-[CPUIMediaButton shouldUpdateButtonOpacityForKnobUnfocused](self, "shouldUpdateButtonOpacityForKnobUnfocused"))
    {
      -[CPUIMediaButton updateButtonOpacityForKnobUnfocused](self, "updateButtonOpacityForKnobUnfocused");
      v17 = 0;
      goto LABEL_32;
    }
    -[CPUIMediaButton colorForKnobFocusLayerSelected](self, "colorForKnobFocusLayerSelected");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = 0;
  }
  v15 = (void *)v16;
LABEL_32:
  -[CPUIMediaButton colorForKnobContentSelected](self, "colorForKnobContentSelected");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_33:
    -[CPUIMediaButton colorForKnobFocused](self, "colorForKnobFocused");
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = v17 != 0;
    v20 = 1;
    goto LABEL_34;
  }
LABEL_25:
  v21 = v17 != 0;
  if (!v4)
  {
    v20 = 0;
    goto LABEL_35;
  }
  LODWORD(v22) = 1.0;
  -[CALayer setOpacity:](self->_focusColorLayer, "setOpacity:", v22);
  -[CPUIMediaButton colorForKnobFocused](self, "colorForKnobFocused");
  v23 = objc_claimAutoreleasedReturnValue();

  v20 = 0;
LABEL_34:
  v15 = (void *)v23;
LABEL_35:
  v24 = self->_focusColorLayer;
  v25 = objc_retainAutorelease(v15);
  -[CALayer setBackgroundColor:](v24, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));
  -[CPUIMediaButton titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIMediaButton imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIMediaButton imageView](self, "imageView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTintColor:", v18);

  -[CPUIMediaButton setTitleColor:forState:](self, "setTitleColor:forState:", v8, 0);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A48]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C10]);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v21)
    v34 = v31;
  else
    v34 = (void *)v32;
  objc_msgSend(v29, "setCompositingFilter:", v34);
  if (v20)
    v35 = v31;
  else
    v35 = v33;
  objc_msgSend(v27, "setCompositingFilter:", v35);
  objc_msgSend(v9, "addSublayer:", v29);
  objc_msgSend(v9, "addSublayer:", v27);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CPUIMediaButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v5 = v4 + 12.0;
  -[CPUIMediaButton titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineHeight");
  v9 = v8;

  v10 = v5;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)colorForTouchFocusLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
}

- (void)updateButtonOpacityForKnobUnfocused
{
  void *v3;
  _BOOL4 v4;
  double v5;

  -[CPUIMediaButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle") == 1;

  LODWORD(v5) = dword_21B7153D8[v4];
  -[CALayer setOpacity:](self->_focusColorLayer, "setOpacity:", v5);
}

- (id)colorForKnobFocusLayer
{
  if (-[CPUIMediaButton isFocused](self, "isFocused"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
}

- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused
{
  return 1;
}

- (BOOL)showBezelInTouch
{
  return self->_showBezelInTouch;
}

- (BOOL)showHighlight
{
  return self->_showHighlight;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_focusColorLayer, 0);
}

@end
