@implementation _PKColorAlphaSliderIOS

- (_PKColorAlphaSliderIOS)initWithFrame:(CGRect)a3
{
  _PKColorAlphaSliderIOS *v3;
  uint64_t v4;
  UIColor *color;
  void *v6;
  void *v7;
  _PKCheckerGridView *v8;
  _PKCheckerGridView *alphaGridView;
  UIView *v10;
  UIView *colorView;
  void *v12;
  CAGradientLayer *v13;
  CAGradientLayer *alphaGridViewMaskLayer;
  CAGradientLayer *v15;
  void *v16;
  CAGradientLayer *v17;
  CAGradientLayer *colorViewMaskLayer;
  CAGradientLayer *v19;
  void *v20;
  _PKSliderKnobView *v21;
  uint64_t v22;
  _PKSliderKnobView *sliderKnobView;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)_PKColorAlphaSliderIOS;
  v3 = -[_PKColorAlphaSliderIOS initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = objc_claimAutoreleasedReturnValue();
  color = v3->_color;
  v3->_color = (UIColor *)v4;

  v3->_minAlpha = 0.0;
  v3->_maxAlpha = 1.0;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.95, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PKCheckerGridView initWithTileSize:colorA:colorB:]([_PKCheckerGridView alloc], "initWithTileSize:colorA:colorB:", v6, v7, 6.66666667);
  alphaGridView = v3->_alphaGridView;
  v3->_alphaGridView = v8;

  -[_PKCheckerGridView setUserInteractionEnabled:](v3->_alphaGridView, "setUserInteractionEnabled:", 0);
  -[_PKColorAlphaSliderIOS addSubview:](v3, "addSubview:", v3->_alphaGridView);
  v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  colorView = v3->_colorView;
  v3->_colorView = v10;

  -[_PKColorAlphaSliderIOS addSubview:](v3, "addSubview:", v3->_colorView);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__colorViewTapGestureHandler_);
  -[UIView addGestureRecognizer:](v3->_colorView, "addGestureRecognizer:", v12);
  v13 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
  alphaGridViewMaskLayer = v3->_alphaGridViewMaskLayer;
  v3->_alphaGridViewMaskLayer = v13;

  v15 = v3->_alphaGridViewMaskLayer;
  -[_PKCheckerGridView layer](v3->_alphaGridView, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMask:", v15);

  v17 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
  colorViewMaskLayer = v3->_colorViewMaskLayer;
  v3->_colorViewMaskLayer = v17;

  v19 = v3->_colorViewMaskLayer;
  -[UIView layer](v3->_colorView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMask:", v19);

  v21 = [_PKSliderKnobView alloc];
  v22 = -[_PKSliderKnobView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sliderKnobView = v3->_sliderKnobView;
  v3->_sliderKnobView = (_PKSliderKnobView *)v22;

  -[_PKColorAlphaSliderIOS addSubview:](v3, "addSubview:", v3->_sliderKnobView);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel_didPanSliderKnob_);
  objc_msgSend(v24, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v24, "setAllowableMovement:", 1.79769313e308);
  -[_PKColorAlphaSliderIOS sliderKnobView](v3, "sliderKnobView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addGestureRecognizer:", v24);

  -[_PKSliderKnobView setAccessibilityIdentifier:](v3->_sliderKnobView, "setAccessibilityIdentifier:", CFSTR("OpacitySliderKnob"));
  -[_PKColorAlphaSliderIOS setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Opacity"));

  return v3;
}

- (void)setColor:(id)a3
{
  -[_PKColorAlphaSliderIOS setColor:animated:](self, "setColor:animated:", a3, 0);
}

- (void)setColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  v4 = a4;
  -[_PKColorAlphaSliderIOS _setColorNoLayout:](self, "_setColorNoLayout:", a3);
  -[_PKColorAlphaSliderIOS setNeedsLayout](self, "setNeedsLayout");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___PKColorAlphaSliderIOS_setColor_animated___block_invoke;
  aBlock[3] = &unk_1E7778020;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v6, 0, 0.0666666667, 0.0, 1.0, 0.0);
  else
    (*((void (**)(void *))v6 + 2))(v6);

}

- (void)_setColorNoLayout:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIColor *v10;
  UIColor *color;
  id v12;

  v12 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "rgbaColorFromColorIfPossible:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alphaComponent");
    v6 = v5;
    -[_PKColorAlphaSliderIOS minAlpha](self, "minAlpha");
    v8 = fmax(v6, v7);
    -[_PKColorAlphaSliderIOS maxAlpha](self, "maxAlpha");
    objc_msgSend(v4, "colorWithAlphaComponent:", fmin(v8, v9));
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = self->_color;
    self->_color = v10;

  }
}

- (void)setMinAlpha:(double)a3
{
  self->_minAlpha = a3;
  -[_PKColorAlphaSliderIOS setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMaxAlpha:(double)a3
{
  self->_maxAlpha = a3;
  -[_PKColorAlphaSliderIOS setNeedsLayout](self, "setNeedsLayout");
}

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
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v51.receiver = self;
  v51.super_class = (Class)_PKColorAlphaSliderIOS;
  -[_PKColorAlphaSliderIOS layoutSubviews](&v51, sel_layoutSubviews);
  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  CGRectGetWidth(v52);
  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  UIRectCenteredAboutPointScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v14 = CGRectGetHeight(v53) * 0.5;
  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setContinuousCornerRadius:", v14);

  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClipsToBounds:", 1);

  -[_PKColorAlphaSliderIOS color](self, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool convertColor:fromUserInterfaceStyle:to:](PKInkingTool, "convertColor:fromUserInterfaceStyle:to:", v17, 1, -[_PKColorAlphaSliderIOS _uiColorUserInterfaceStyle](self, "_uiColorUserInterfaceStyle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_opt_class();
  -[_PKColorAlphaSliderIOS colorViewMaskLayer](self, "colorViewMaskLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorAlphaSliderIOS colorView](self, "colorView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  objc_msgSend(v21, "_layoutGradientMaskLayer:frame:isReversed:", v22, 0);

  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  CGRectGetWidth(v54);
  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  UIRectCenteredAboutPointScale();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[_PKColorAlphaSliderIOS alphaGridView](self, "alphaGridView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  -[_PKColorAlphaSliderIOS alphaGridView](self, "alphaGridView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetHeight(v55) * 0.5;
  -[_PKColorAlphaSliderIOS alphaGridView](self, "alphaGridView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_setContinuousCornerRadius:", v35);

  -[_PKColorAlphaSliderIOS alphaGridView](self, "alphaGridView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setClipsToBounds:", 1);

  v38 = (void *)objc_opt_class();
  -[_PKColorAlphaSliderIOS alphaGridViewMaskLayer](self, "alphaGridViewMaskLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorAlphaSliderIOS alphaGridView](self, "alphaGridView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  objc_msgSend(v38, "_layoutGradientMaskLayer:frame:isReversed:", v39, 1);

  -[_PKColorAlphaSliderIOS color](self, "color");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "alphaComponent");
  -[_PKColorAlphaSliderIOS _knobViewFrameForColorAlpha:](self, "_knobViewFrameForColorAlpha:");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[_PKColorAlphaSliderIOS sliderKnobView](self, "sliderKnobView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 20.0;
  result.height = v3;
  return result;
}

- (void)_colorViewTapGestureHandler:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 3)
  {
    objc_msgSend(v12, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v4);
    v6 = v5;

    -[_PKColorAlphaSliderIOS colorAlphaForSliderKnobXPosition:](self, "colorAlphaForSliderKnobXPosition:", v6);
    v8 = v7;
    -[_PKColorAlphaSliderIOS color](self, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PKColorAlphaSliderIOS setColor:animated:](self, "setColor:animated:", v10, 1);

    -[_PKColorAlphaSliderIOS delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_colorAlphaSliderUserDidChangeSlider:", self);

  }
}

- (double)_sliderKnobViewWidth
{
  void *v2;
  double v3;
  double v4;

  -[_PKColorAlphaSliderIOS sliderKnobView](self, "sliderKnobView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v4 = v3;

  return v4;
}

- (double)sliderKnobXPositionForColorAlpha:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double Width;
  double v10;
  double v11;
  double v12;
  CGRect v14;

  -[_PKColorAlphaSliderIOS minAlpha](self, "minAlpha");
  v6 = v5;
  -[_PKColorAlphaSliderIOS maxAlpha](self, "maxAlpha");
  v8 = (a3 - v6) / (v7 - v6);
  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[_PKColorAlphaSliderIOS _sliderKnobViewWidth](self, "_sliderKnobViewWidth");
  v11 = Width - v10;
  -[_PKColorAlphaSliderIOS _sliderKnobViewWidth](self, "_sliderKnobViewWidth");
  return v12 * 0.5 + v8 * v11;
}

- (double)colorAlphaForSliderKnobXPosition:(double)a3
{
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;

  -[_PKColorAlphaSliderIOS _sliderKnobViewWidth](self, "_sliderKnobViewWidth");
  v6 = a3 + v5 * -0.5;
  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[_PKColorAlphaSliderIOS _sliderKnobViewWidth](self, "_sliderKnobViewWidth");
  v9 = v6 / (Width - v8);
  -[_PKColorAlphaSliderIOS minAlpha](self, "minAlpha");
  v11 = v10;
  -[_PKColorAlphaSliderIOS maxAlpha](self, "maxAlpha");
  return v12 * v9 + v11 * (1.0 - v9);
}

- (void)didPanSliderKnob:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "locationInView:", self);
  -[_PKColorAlphaSliderIOS colorAlphaForSliderKnobXPosition:](self, "colorAlphaForSliderKnobXPosition:");
  v5 = v4;
  -[_PKColorAlphaSliderIOS color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKColorAlphaSliderIOS setColor:](self, "setColor:", v7);

  if (objc_msgSend(v18, "state") == 1)
  {
    -[_PKColorAlphaSliderIOS delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_PKColorAlphaSliderIOS delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[_PKColorAlphaSliderIOS delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_colorAlphaSliderUserDidStartDraggingSlider:", self);
LABEL_11:

      }
    }
  }
  else if (objc_msgSend(v18, "state") == 3 || objc_msgSend(v18, "state") == 4 || objc_msgSend(v18, "state") == 5)
  {
    -[_PKColorAlphaSliderIOS delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[_PKColorAlphaSliderIOS delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        -[_PKColorAlphaSliderIOS delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_colorAlphaSliderUserDidEndDraggingSlider:", self);
        goto LABEL_11;
      }
    }
  }
  -[_PKColorAlphaSliderIOS delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_colorAlphaSliderUserDidChangeSlider:", self);

}

- (CGRect)_knobViewFrameForColorAlpha:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  -[_PKColorAlphaSliderIOS minAlpha](self, "minAlpha");
  v6 = fmax(a3, v5);
  -[_PKColorAlphaSliderIOS maxAlpha](self, "maxAlpha");
  v8 = fmin(v6, v7);
  -[_PKColorAlphaSliderIOS sliderKnobXPositionForColorAlpha:](self, "sliderKnobXPositionForColorAlpha:", v8);
  v9 = a3 - v8;
  v10 = 0.0;
  if (v9 != 0.0)
  {
    +[_PKColorAlphaSliderIOS _outputForResistanceFunction:factor:](_PKColorAlphaSliderIOS, "_outputForResistanceFunction:factor:", v9, 0.176776695);
    v10 = v11 * 44.0;
  }
  -[_PKColorAlphaSliderIOS sliderKnobView](self, "sliderKnobView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  -[_PKColorAlphaSliderIOS bounds](self, "bounds");
  CGRectGetMidY(v35);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  UIRectCenteredAboutPointScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v36.origin.x = v15;
  v36.origin.y = v17;
  v36.size.width = v19;
  v36.size.height = v21;
  CGRectOffset(v36, v10, 0.0);
  -[_PKColorAlphaSliderIOS traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayScale");
  UIRectIntegralWithScale();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (double)_outputForResistanceFunction:(double)a3 factor:(double)a4
{
  double v4;

  if (a3 == 0.0)
    return 0.0;
  v4 = fabs(a3);
  return a3 / v4 * (a4 * a4 * -0.5 + a4 * sqrt(v4 + a4 * a4 * 0.25));
}

+ (id)rgbaColorFromColorIfPossible:(id)a3
{
  id v3;
  id v4;
  void *v5;
  double v7;
  double v8[4];

  v8[3] = *(double *)MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "getRed:green:blue:alpha:", 0, 0, 0, 0))
  {
    v4 = v3;
  }
  else
  {
    if (!objc_msgSend(v3, "getWhite:alpha:", &v7, v8))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v7, v7, v7, v8[0]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (void)_layoutGradientMaskLayer:(id)a3 frame:(CGRect)a4 isReversed:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[3];

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v5)
    v12 = 1.0;
  else
    v12 = 0.0;
  if (v5)
    v13 = 0.0;
  else
    v13 = 1.0;
  objc_msgSend(v10, "setStartPoint:", v12, 0.5);
  objc_msgSend(v11, "setEndPoint:", v13, 0.5);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.0);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19[0] = objc_msgSend(v15, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 1.0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19[1] = objc_msgSend(v17, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColors:", v18);

  objc_msgSend(v11, "setFrame:", x, y, width, height);
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[_PKColorAlphaSliderIOS setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)_uiColorUserInterfaceStyle
{
  void *v4;
  int64_t v5;

  if (-[_PKColorAlphaSliderIOS colorUserInterfaceStyle](self, "colorUserInterfaceStyle"))
    return -[_PKColorAlphaSliderIOS colorUserInterfaceStyle](self, "colorUserInterfaceStyle");
  -[_PKColorAlphaSliderIOS traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  return v5;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (_PKColorAlphaSliderDelegate)delegate
{
  return (_PKColorAlphaSliderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (double)maxAlpha
{
  return self->_maxAlpha;
}

- (double)minAlpha
{
  return self->_minAlpha;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (CAGradientLayer)colorViewMaskLayer
{
  return self->_colorViewMaskLayer;
}

- (void)setColorViewMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_colorViewMaskLayer, a3);
}

- (_PKCheckerGridView)alphaGridView
{
  return self->_alphaGridView;
}

- (void)setAlphaGridView:(id)a3
{
  objc_storeStrong((id *)&self->_alphaGridView, a3);
}

- (CAGradientLayer)alphaGridViewMaskLayer
{
  return self->_alphaGridViewMaskLayer;
}

- (void)setAlphaGridViewMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_alphaGridViewMaskLayer, a3);
}

- (_PKSliderKnobView)sliderKnobView
{
  return self->_sliderKnobView;
}

- (void)setSliderKnobView:(id)a3
{
  objc_storeStrong((id *)&self->_sliderKnobView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderKnobView, 0);
  objc_storeStrong((id *)&self->_alphaGridViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_alphaGridView, 0);
  objc_storeStrong((id *)&self->_colorViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
