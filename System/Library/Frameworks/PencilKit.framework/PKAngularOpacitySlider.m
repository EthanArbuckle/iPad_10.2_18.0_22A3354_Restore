@implementation PKAngularOpacitySlider

- (double)initWithFrame:(double)a3 startAngle:(double)a4 endAngle:(double)a5 arcRadius:(double)a6 arcWidth:(double)a7
{
  double *v13;
  double *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _PKCheckerGridView *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  PKAngularOpacitySliderKnobView *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  objc_super v39;

  if (!a1)
    return 0;
  v39.receiver = a1;
  v39.super_class = (Class)PKAngularOpacitySlider;
  v13 = (double *)objc_msgSendSuper2(&v39, sel_initWithFrame_);
  v14 = v13;
  if (v13)
  {
    v13[58] = a6;
    v13[59] = a7;
    v13[60] = a8;
    v13[61] = a9;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v14 + 53);
    *((_QWORD *)v14 + 53) = v15;

    v14[57] = 0.0;
    v14[56] = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.95, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_PKCheckerGridView initWithTileSize:colorA:colorB:]([_PKCheckerGridView alloc], "initWithTileSize:colorA:colorB:", v17, v18, a9 / 3.0);
    v20 = (void *)*((_QWORD *)v14 + 64);
    *((_QWORD *)v14 + 64) = v19;

    objc_msgSend(*((id *)v14 + 64), "setUserInteractionEnabled:", 0);
    objc_msgSend(v14, "addSubview:", *((_QWORD *)v14 + 64));
    v21 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v22 = (void *)*((_QWORD *)v14 + 62);
    *((_QWORD *)v14 + 62) = v21;

    objc_msgSend(v14, "addSubview:", *((_QWORD *)v14 + 62));
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v14, sel__colorViewTapGestureHandler_);
    objc_msgSend(v23, "setDelegate:", v14);
    objc_msgSend(*((id *)v14 + 62), "addGestureRecognizer:", v23);
    v24 = objc_alloc_init(MEMORY[0x1E0CD2790]);
    v25 = (void *)*((_QWORD *)v14 + 63);
    *((_QWORD *)v14 + 63) = v24;

    objc_msgSend(*((id *)v14 + 63), "setType:", *MEMORY[0x1E0CD2F50]);
    objc_msgSend(*((id *)v14 + 63), "setStartPoint:", 0.5, 0.5);
    objc_msgSend(*((id *)v14 + 63), "setEndPoint:", 0.5, 1.0);
    v26 = *((_QWORD *)v14 + 63);
    objc_msgSend(*((id *)v14 + 62), "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setMask:", v26);

    v28 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    v29 = (void *)*((_QWORD *)v14 + 67);
    *((_QWORD *)v14 + 67) = v28;

    objc_msgSend(*((id *)v14 + 67), "setLineCap:", *MEMORY[0x1E0CD3010]);
    objc_msgSend(*((id *)v14 + 67), "setStrokeStart:", 0.0);
    objc_msgSend(*((id *)v14 + 67), "setStrokeEnd:", 1.0);
    objc_msgSend(*((id *)v14 + 67), "setFillColor:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*((id *)v14 + 67), "setStrokeColor:", objc_msgSend(v30, "CGColor"));

    v31 = *((_QWORD *)v14 + 67);
    objc_msgSend(v14, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMask:", v31);

    objc_msgSend(v14, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMasksToBounds:", 1);

    v34 = [PKAngularOpacitySliderKnobView alloc];
    v35 = -[PKAngularOpacitySliderKnobView initWithFrame:](v34, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v36 = (void *)*((_QWORD *)v14 + 66);
    *((_QWORD *)v14 + 66) = v35;

    objc_msgSend(v14, "addSubview:", *((_QWORD *)v14 + 66));
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v14, sel__didPanSliderKnob_);
    objc_msgSend(v37, "setMinimumPressDuration:", 0.0);
    objc_msgSend(v37, "setAllowableMovement:", 1.79769313e308);
    objc_msgSend(*((id *)v14 + 66), "addGestureRecognizer:", v37);
    objc_msgSend(*((id *)v14 + 66), "setAccessibilityIdentifier:", CFSTR("OpacitySliderKnob"));
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Opacity"));
    objc_msgSend(v14, "setAccessibilityLabel:", CFSTR("Opacity"));

  }
  return v14;
}

- (void)dealloc
{
  CGPath *baseShapeLayerPathForHitTesting;
  objc_super v4;

  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKAngularOpacitySlider;
  -[PKAngularOpacitySlider dealloc](&v4, sel_dealloc);
}

- (void)setColor:(id)a3
{
  -[PKAngularOpacitySlider setColor:animated:](self, "setColor:animated:", a3, 0);
}

- (void)setColor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIColor *v17;
  UIColor *color;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28[4];
  BOOL v29;
  id location;

  v4 = a4;
  v6 = a3;
  -[PKAngularOpacitySlider color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alphaComponent");
  v9 = v8;

  v10 = v6;
  if (self && (-[UIColor isEqual:](self->_color, "isEqual:", v10) & 1) == 0)
  {
    +[_PKColorAlphaSliderIOS rgbaColorFromColorIfPossible:](_PKColorAlphaSliderIOS, "rgbaColorFromColorIfPossible:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alphaComponent");
    v13 = v12;
    -[PKAngularOpacitySlider minAlpha](self, "minAlpha");
    v15 = fmax(v13, v14);
    -[PKAngularOpacitySlider maxAlpha](self, "maxAlpha");
    objc_msgSend(v11, "colorWithAlphaComponent:", fmin(v15, v16));
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    color = self->_color;
    self->_color = v17;

  }
  -[PKAngularOpacitySlider setNeedsLayout](self, "setNeedsLayout");
  if (v4)
  {
    objc_msgSend(v10, "alphaComponent");
    v20 = vabdd_f64(*(double *)&v9, v19);
    v21 = *(double *)&v9 <= v19;
    v22 = v20 * 0.0666666667;
    v23 = (void *)(uint64_t)fmax(v20 / 0.01, 1.0);
    objc_initWeak(&location, self);
    v24 = MEMORY[0x1E0C809B0];
    v25 = (void *)MEMORY[0x1E0DC3F10];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke;
    v27[3] = &unk_1E777D3E8;
    v28[1] = v23;
    v28[2] = v9;
    v29 = v21;
    v28[3] = (id)0x3F847AE147AE147BLL;
    objc_copyWeak(v28, &location);
    v27[4] = self;
    v26[0] = v24;
    v26[1] = 3221225472;
    v26[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke_3;
    v26[3] = &unk_1E7778650;
    v26[4] = self;
    objc_msgSend(v25, "animateKeyframesWithDuration:delay:options:animations:completion:", 6, v27, v26, v22, 0.0);
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAngularOpacitySlider layoutIfNeeded](self, "layoutIfNeeded");
  }

}

void __44__PKAngularOpacitySlider_setColor_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  _QWORD v11[5];
  id v12[2];

  v1 = *(_QWORD *)(a1 + 48);
  if (v1 >= 1)
  {
    v3 = 0;
    v4 = (id *)(a1 + 40);
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = -(double)v3;
      if (*(_BYTE *)(a1 + 72))
        v6 = (double)v3;
      v7 = *(double *)(a1 + 56) + v6 * *(double *)(a1 + 64);
      v8 = (double)v3 / (double)v1;
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __44__PKAngularOpacitySlider_setColor_animated___block_invoke_2;
      v11[3] = &unk_1E777D3C0;
      v10 = 1.0 / (double)v1;
      objc_copyWeak(v12, v4);
      v11[4] = *(_QWORD *)(a1 + 32);
      v12[1] = *(id *)&v7;
      objc_msgSend(v9, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v11, v8, v10);
      objc_destroyWeak(v12);
      ++v3;
      v1 = *(_QWORD *)(a1 + 48);
    }
    while (v3 < v1);
  }
}

void __44__PKAngularOpacitySlider_setColor_animated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;

  v2 = -[PKAngularOpacitySlider _knobViewFrameForColorAlpha:](*(double **)(a1 + 32), *(double *)(a1 + 48));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sliderKnob");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);

}

- (double)_knobViewFrameForColorAlpha:(double *)a1
{
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
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  double v28;
  CGRect v30;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "minAlpha");
  v5 = fmax(a2, v4);
  objc_msgSend(a1, "maxAlpha");
  v7 = fmin(v5, v6);
  objc_msgSend(a1, "minAlpha");
  v9 = v8;
  objc_msgSend(a1, "maxAlpha");
  v11 = a1[58] + (a1[59] - a1[58]) * ((a2 - v9) / (v10 - v9));
  objc_msgSend(a1, "bounds");
  UIRectGetCenter();
  PKPointOnArc(v12, v13, a1[60], v11);
  v14 = a2 - v7;
  v15 = 0.0;
  if (v14 != 0.0)
  {
    +[_PKColorAlphaSliderIOS _outputForResistanceFunction:factor:](_PKColorAlphaSliderIOS, "_outputForResistanceFunction:factor:", v14, 0.176776695);
    v15 = v16 * 44.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  UIRectCenteredAboutPointScale();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v30.origin.x = v19;
  v30.origin.y = v21;
  v30.size.width = v23;
  v30.size.height = v25;
  CGRectOffset(v30, v15, 0.0);
  objc_msgSend(a1, "traitCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "displayScale");
  UIRectIntegralWithScale();
  v28 = v27;

  return v28;
}

uint64_t __44__PKAngularOpacitySlider_setColor_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setMinAlpha:(double)a3
{
  self->_minAlpha = a3;
  -[PKAngularOpacitySlider setNeedsLayout](self, "setNeedsLayout");
}

- (void)setMaxAlpha:(double)a3
{
  self->_maxAlpha = a3;
  -[PKAngularOpacitySlider setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double startAngle;
  double arcRadius;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double arcWidth;
  double endAngle;
  void *v43;
  id v44;
  const CGPath *v45;
  CGPath *baseShapeLayerPathForHitTesting;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[3];
  CGRect v55;
  CGRect v56;

  v54[2] = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)PKAngularOpacitySlider;
  -[PKAngularOpacitySlider layoutSubviews](&v53, sel_layoutSubviews);
  startAngle = 0.0;
  arcRadius = 0.0;
  if (self)
    arcRadius = self->_arcRadius;
  -[PKAngularOpacitySlider bounds](self, "bounds");
  UIRectGetCenter();
  v6 = v5;
  v8 = v7;
  -[PKAngularOpacitySlider bounds](self, "bounds");
  CGRectGetWidth(v55);
  -[PKAngularOpacitySlider bounds](self, "bounds");
  CGRectGetHeight(v56);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  UIRectCenteredAboutPointScale();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[PKAngularOpacitySlider color](self, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAngularOpacitySlider colorView](self, "colorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v19, "_setContinuousCornerRadius:", arcRadius);
  objc_msgSend(v19, "setClipsToBounds:", 1);
  objc_msgSend(v18, "colorWithAlphaComponent:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v20);

  -[PKAngularOpacitySlider colorViewMaskLayer](self, "colorViewMaskLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  +[PKAngularOpacitySlider _layoutGradientMaskLayer:frame:isReversed:](v22, v23, v24, v25, (uint64_t)PKAngularOpacitySlider, v21);

  -[PKAngularOpacitySlider alphaGridView](self, "alphaGridView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v26, "_setContinuousCornerRadius:", arcRadius);
  objc_msgSend(v26, "setClipsToBounds:", 1);
  -[PKAngularOpacitySlider alphaGridViewMaskLayer](self, "alphaGridViewMaskLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  +[PKAngularOpacitySlider _layoutGradientMaskLayer:frame:isReversed:](v28, v29, v30, v31, (uint64_t)PKAngularOpacitySlider, v27);

  objc_msgSend(v18, "alphaComponent");
  v33 = -[PKAngularOpacitySlider _knobViewFrameForColorAlpha:]((double *)self, v32);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[PKAngularOpacitySlider sliderKnob](self, "sliderKnob");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  arcWidth = 0.0;
  endAngle = 0.0;
  if (self)
  {
    arcWidth = self->_arcWidth;
    startAngle = self->_startAngle;
    endAngle = self->_endAngle;
  }
  -[PKAngularOpacitySlider baseShapeLayer](self, "baseShapeLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setLineWidth:", arcWidth);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, arcRadius, startAngle, endAngle);
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v45 = (const CGPath *)objc_msgSend(v44, "CGPath");

  objc_msgSend(v43, "setPath:", v45);
  baseShapeLayerPathForHitTesting = self->_baseShapeLayerPathForHitTesting;
  if (baseShapeLayerPathForHitTesting)
  {
    CGPathRelease(baseShapeLayerPathForHitTesting);
    self->_baseShapeLayerPathForHitTesting = 0;
  }
  self->_baseShapeLayerPathForHitTesting = CGPathCreateCopyByStrokingPath(v45, 0, arcWidth, kCGLineCapRound, kCGLineJoinRound, 0.0);
  v47 = endAngle + -1.57079633;
  *(float *)&v47 = (startAngle + -1.57079633) / 6.28318531;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v48;
  *(float *)&v49 = (endAngle + -1.57079633) / 6.28318531;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAngularOpacitySlider colorViewMaskLayer](self, "colorViewMaskLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setLocations:", v51);

}

+ (void)_layoutGradientMaskLayer:(double)a3 frame:(double)a4 isReversed:(uint64_t)a5
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 0.0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16[0] = objc_msgSend(v12, "CGColor");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithAlphaComponent:", 1.0);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16[1] = objc_msgSend(v14, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColors:", v15);

  objc_msgSend(v10, "setFrame:", a1, a2, a3, a4);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double arcWidth;

  if (self)
    arcWidth = self->_arcWidth;
  else
    arcWidth = 0.0;
  result.height = arcWidth;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  objc_super v9;
  CGPoint v10;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)PKAngularOpacitySlider;
  -[PKAngularOpacitySlider hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self || (v10.x = x, v10.y = y, !CGPathContainsPoint(self->_baseShapeLayerPathForHitTesting, 0, v10, 0)))
  {

    v7 = 0;
  }
  return v7;
}

- (void)_colorViewTapGestureHandler:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") == 3)
  {
    objc_msgSend(v14, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    v9 = -[PKAngularOpacitySlider _angleForSliderKnobPosition:]((double *)self, v6, v8);
    v10 = -[PKAngularOpacitySlider _colorAlphaForSliderKnobAngle:]((double *)self, v9);
    -[PKAngularOpacitySlider color](self, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAngularOpacitySlider setColor:animated:](self, "setColor:animated:", v12, 1);

    -[PKAngularOpacitySlider delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_colorAlphaSliderUserDidChangeSlider:", self);

  }
}

- (double)_angleForSliderKnobPosition:(double)a3
{
  double v6;
  double v7;
  long double v8;
  double v9;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "bounds");
  UIRectGetCenter();
  v8 = atan2(a3 - v7, a2 - v6);
  v9 = fmod(v8, 6.28318531);
  if (v8 <= 6.28318531 && v8 >= 0.0)
    v9 = v8;
  if (v9 < 0.0)
    v9 = v9 + 6.28318531;
  if (v9 == 0.0)
    v11 = 0.0;
  else
    v11 = v9;
  objc_msgSend(a1, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alphaComponent");
  v14 = v13;
  objc_msgSend(a1, "minAlpha");
  v16 = v15;
  objc_msgSend(a1, "maxAlpha");
  v18 = a1[58] + (a1[59] - a1[58]) * ((v14 - v16) / (v17 - v16));

  v19 = v11 + 6.28318531;
  v20 = vabdd_f64(v11, v18);
  if (vabdd_f64(v11 + 6.28318531, v18) >= v20)
  {
    v19 = v11;
    if (vabdd_f64(v11 + -6.28318531, v18) < v20)
      v19 = v11 + -6.28318531;
  }
  return fmin(fmax(v19, a1[58]), a1[59]);
}

- (double)_colorAlphaForSliderKnobAngle:(double *)a1
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (!a1)
    return 0.0;
  v3 = (a2 - a1[58]) / (a1[59] - a1[58]);
  objc_msgSend(a1, "minAlpha");
  v5 = v4;
  objc_msgSend(a1, "maxAlpha");
  return v6 * v3 + v5 * (1.0 - v3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5;

  objc_msgSend(a4, "locationInView:", self);
  return self && CGPathContainsPoint(self->_baseShapeLayerPathForHitTesting, 0, *(CGPoint *)&v5, 0);
}

- (void)_didPanSliderKnob:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "locationInView:", self);
  v6 = -[PKAngularOpacitySlider _angleForSliderKnobPosition:]((double *)self, v4, v5);
  v7 = -[PKAngularOpacitySlider _colorAlphaForSliderKnobAngle:]((double *)self, v6);
  -[PKAngularOpacitySlider color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAngularOpacitySlider setColor:](self, "setColor:", v9);

  -[PKAngularOpacitySlider delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "state") == 1)
  {
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "_colorAlphaSliderUserDidStartDraggingSlider:", self);
  }
  else if ((objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 4 || objc_msgSend(v11, "state") == 5)
         && v10
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "_colorAlphaSliderUserDidEndDraggingSlider:", self);
  }
  objc_msgSend(v10, "_colorAlphaSliderUserDidChangeSlider:", self);

}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    -[PKAngularOpacitySlider setNeedsLayout](self, "setNeedsLayout");
  }
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

- (PKAngularOpacitySliderKnobView)sliderKnob
{
  return self->_sliderKnob;
}

- (void)setSliderKnob:(id)a3
{
  objc_storeStrong((id *)&self->_sliderKnob, a3);
}

- (CAShapeLayer)baseShapeLayer
{
  return self->_baseShapeLayer;
}

- (void)setBaseShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_baseShapeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseShapeLayer, 0);
  objc_storeStrong((id *)&self->_sliderKnob, 0);
  objc_storeStrong((id *)&self->_alphaGridViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_alphaGridView, 0);
  objc_storeStrong((id *)&self->_colorViewMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
