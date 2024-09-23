@implementation CDRichComplicationRingView

- (CDRichComplicationRingView)initWithCurveWidth:(double)a3 padding:(double)a4 forDevice:(id)a5 withFilterStyle:(int64_t)a6
{
  CDRichComplicationRingView *v8;
  CDRichComplicationRingView *v9;
  UIView *v10;
  UIView *foregroundView;
  uint64_t v12;
  CAShapeLayer *headLayer;
  uint64_t v14;
  CAShapeLayer *tailStrokeLayer;
  id v16;
  uint64_t v17;
  CAShapeLayer *tailLayer;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CDRichComplicationRingView;
  v8 = -[CDRichComplicationShapeView initForDevice:withFilterStyle:](&v20, sel_initForDevice_withFilterStyle_, a5, a6);
  v9 = v8;
  if (v8)
  {
    v8->_curveWidth = a3;
    v8->_padding = a4;
    v8->_clockwise = 1;
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    foregroundView = v9->_foregroundView;
    v9->_foregroundView = v10;

    -[CDRichComplicationRingView addSubview:](v9, "addSubview:", v9->_foregroundView);
    -[CDRichComplicationRingView _createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:](v9, "_createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:", 0, -1.57079633, 1.57079633, 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    headLayer = v9->_headLayer;
    v9->_headLayer = (CAShapeLayer *)v12;

    -[CDRichComplicationRingView _createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:](v9, "_createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:", 1, -1.57079633, 1.57079633, 2.0);
    v14 = objc_claimAutoreleasedReturnValue();
    tailStrokeLayer = v9->_tailStrokeLayer;
    v9->_tailStrokeLayer = (CAShapeLayer *)v14;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v9->_tailStrokeLayer, "setFillColor:", objc_msgSend(v16, "CGColor"));

    -[CDRichComplicationRingView _createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:](v9, "_createHeadTailViewWithStartAngle:endAngle:clockwise:additionalWidth:", 1, 0.0, 6.28318531, 0.0);
    v17 = objc_claimAutoreleasedReturnValue();
    tailLayer = v9->_tailLayer;
    v9->_tailLayer = (CAShapeLayer *)v17;

  }
  return v9;
}

- (void)setClockwise:(BOOL)a3
{
  self->_clockwise = a3;
  -[CDRichComplicationRingView _updateGradient](self, "_updateGradient");
  -[CDRichComplicationShapeView _updatePath](self, "_updatePath");
}

- (void)layoutSubviews
{
  CAShapeLayer *tailStrokeLayer;
  CAShapeLayer *tailLayer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView layoutSubviews](&v5, sel_layoutSubviews);
  -[CDRichComplicationRingView bounds](self, "bounds");
  -[UIView setFrame:](self->_foregroundView, "setFrame:");
  -[CDRichComplicationRingView bringSubviewToFront:](self, "bringSubviewToFront:", self->_foregroundView);
  -[CDRichComplicationRingView _layoutHeadTailView:forProgress:](self, "_layoutHeadTailView:forProgress:", self->_headLayer, 0.0);
  tailStrokeLayer = self->_tailStrokeLayer;
  -[CDRichComplicationShapeView progress](self, "progress");
  -[CDRichComplicationRingView _layoutHeadTailView:forProgress:](self, "_layoutHeadTailView:forProgress:", tailStrokeLayer);
  tailLayer = self->_tailLayer;
  -[CDRichComplicationShapeView progress](self, "progress");
  -[CDRichComplicationRingView _layoutHeadTailView:forProgress:](self, "_layoutHeadTailView:forProgress:", tailLayer);
}

- (void)setProgress:(double)a3
{
  double v4;
  objc_super v5;

  if (a3 == 0.0)
    v4 = 0.001;
  else
    v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView setProgress:](&v5, sel_setProgress_, v4);
  -[CAShapeLayer setHidden:](self->_headLayer, "setHidden:", v4 >= 1.0);
  -[CAShapeLayer setHidden:](self->_tailLayer, "setHidden:", v4 < 0.95);
  -[CAShapeLayer setHidden:](self->_tailStrokeLayer, "setHidden:", -[CAShapeLayer isHidden](self->_tailLayer, "isHidden"));
  -[CDRichComplicationRingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView transitionToMonochromeWithFraction:](&v7, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationShapeView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAShapeLayer setFilters:](self->_headLayer, "setFilters:", v6);
    -[CAShapeLayer setFilters:](self->_tailLayer, "setFilters:", v6);
  }

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView updateMonochromeColor](&v5, sel_updateMonochromeColor);
  -[CDRichComplicationShapeView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAShapeLayer setFilters:](self->_headLayer, "setFilters:", v4);
    -[CAShapeLayer setFilters:](self->_tailLayer, "setFilters:", v4);
  }

}

- (void)_setupGradientLayer:(id)a3
{
  uint64_t v3;
  id v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v3 = *MEMORY[0x24BDE5C50];
  v4 = a3;
  objc_msgSend(v4, "setType:", v3);
  objc_msgSend(v4, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v4, "setEndPoint:", 0.5, 1.0);
  CGAffineTransformMakeRotation(&v6, 3.14159265);
  v5 = v6;
  objc_msgSend(v4, "setAffineTransform:", &v5);

}

- (double)_shapeLineWidth
{
  return self->_curveWidth;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  float v12;
  __float2 v13;
  double v14;
  double v15;
  CGPoint result;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[CDRichComplicationRingView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v9 = CGRectGetWidth(v17) * 0.5;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v10 = CGRectGetHeight(v18) * 0.5;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19) * 0.5 - self->_curveWidth * 0.5 - self->_padding;
  v12 = a3 * 6.28318531;
  v13 = __sincosf_stret(v12);
  v14 = v10 + v13.__sinval * v11;
  v15 = v9 + v13.__cosval * v11;
  result.y = v14;
  result.x = v15;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  return a3;
}

- (CGPath)_generatePath
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  id v9;
  CGPath *v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[CDRichComplicationRingView bounds](self, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v7 = CGRectGetWidth(v12) * 0.5;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v8 = CGRectGetHeight(v13) * 0.5;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", self->_clockwise, v7, v8, CGRectGetWidth(v14) * 0.5 - self->_curveWidth * 0.5 - self->_padding, -1.57079633, 4.71238898);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (CGPath *)objc_msgSend(v9, "CGPath");

  return v10;
}

- (BOOL)_shouldReverseGradient
{
  return !self->_clockwise;
}

- (void)_updateGradient
{
  CAShapeLayer *headLayer;
  void *v4;
  id v5;
  CAShapeLayer *tailLayer;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDRichComplicationRingView;
  -[CDRichComplicationShapeView _updateGradient](&v9, sel__updateGradient);
  headLayer = self->_headLayer;
  -[CDRichComplicationShapeView gradientColors](self, "gradientColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](headLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

  tailLayer = self->_tailLayer;
  -[CDRichComplicationShapeView gradientColors](self, "gradientColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](tailLayer, "setFillColor:", objc_msgSend(v8, "CGColor"));

}

- (id)_createHeadTailViewWithStartAngle:(double)a3 endAngle:(double)a4 clockwise:(BOOL)a5 additionalWidth:(double)a6
{
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v7 = self->_curveWidth + a6;
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", a5, v7 * 0.5, v7 * 0.5, v7 * 0.5, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_disabledLayerActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDE5758]);
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
  objc_msgSend(v10, "setBounds:", 0.0, 0.0, v7, v7);
  objc_msgSend(v10, "setActions:", v9);
  -[UIView layer](self->_foregroundView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v10);

  return v10;
}

- (void)_layoutHeadTailView:(id)a3 forProgress:(double)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v18.c = v14;
  *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v6 = a3;
  -[CDRichComplicationRingView bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[CDRichComplicationRingView bounds](self, "bounds");
  v10 = v9;
  v11 = v9 * 0.5;
  *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
  *(_OWORD *)&v17.c = v14;
  *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
  CGAffineTransformTranslate(&v18, &v17, v8, 0.0);
  v16 = v18;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v11);
  v18 = v17;
  v16 = v17;
  CGAffineTransformRotate(&v17, &v16, a4 * 3.14159265 + a4 * 3.14159265);
  v18 = v17;
  v12 = -(v10 * 0.5) - self->_padding;
  v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v12);
  v18 = v17;
  v13 = self->_curveWidth * 0.5;
  v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, 0.0, v13);
  v18 = v17;
  v15 = v17;
  objc_msgSend(v6, "setAffineTransform:", &v15);

}

+ (id)_disabledLayerActions
{
  if (_disabledLayerActions_onceToken != -1)
    dispatch_once(&_disabledLayerActions_onceToken, &__block_literal_global);
  return (id)_disabledLayerActions__dictionary;
}

void __51__CDRichComplicationRingView__disabledLayerActions__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = CFSTR("instanceTransform");
  v3[1] = CFSTR("contentsMultiplyColor");
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = CFSTR("transform");
  v3[3] = CFSTR("hidden");
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = CFSTR("position");
  v3[5] = CFSTR("opacity");
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = CFSTR("instanceCount");
  v3[7] = CFSTR("instanceDelay");
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = CFSTR("backgroundColor");
  v4[8] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_disabledLayerActions__dictionary;
  _disabledLayerActions__dictionary = v1;

}

- (BOOL)clockwise
{
  return self->_clockwise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailStrokeLayer, 0);
  objc_storeStrong((id *)&self->_tailLayer, 0);
  objc_storeStrong((id *)&self->_headLayer, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end
