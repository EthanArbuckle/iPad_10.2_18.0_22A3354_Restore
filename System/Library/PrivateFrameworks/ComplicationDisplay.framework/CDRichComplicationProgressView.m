@implementation CDRichComplicationProgressView

- (id)initForFamily:(int64_t)a3 device:(id)a4 backgroundShapeView:(id)a5 foregroundShapeView:(id)a6
{
  id v11;
  id v12;
  id v13;
  CDRichComplicationProgressView *v14;
  CDRichComplicationProgressView *v15;
  uint64_t v16;
  CAShapeLayer *ringLayer;
  CAShapeLayer *v18;
  id v19;
  CAShapeLayer *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  UIView *indicatorView;
  objc_super v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CDRichComplicationProgressView;
  v14 = -[CDRichComplicationProgressView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v15 = v14;
  if (v14)
  {
    v14->_family = a3;
    objc_storeStrong((id *)&v14->_device, a4);
    v15->_showAlternateIndicatorColor = CDShowGossamerUI(v15->_device);
    objc_storeStrong((id *)&v15->_backgroundView, a5);
    -[CDRichComplicationShapeView setFilterProvider:](v15->_backgroundView, "setFilterProvider:", v15);
    -[CDRichComplicationProgressView addSubview:](v15, "addSubview:", v15->_backgroundView);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v16 = objc_claimAutoreleasedReturnValue();
    ringLayer = v15->_ringLayer;
    v15->_ringLayer = (CAShapeLayer *)v16;

    -[CAShapeLayer setAnchorPoint:](v15->_ringLayer, "setAnchorPoint:", 0.5, 0.5);
    -[CAShapeLayer setFillRule:](v15->_ringLayer, "setFillRule:", *MEMORY[0x24BDE5988]);
    v18 = v15->_ringLayer;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v18, "setFillColor:", objc_msgSend(v19, "CGColor"));

    v20 = v15->_ringLayer;
    v27 = CFSTR("position");
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v20, "setActions:", v22);

    objc_storeStrong((id *)&v15->_foregroundView, a6);
    -[CDRichComplicationShapeView setFilterProvider:](v15->_foregroundView, "setFilterProvider:", v15);
    -[CDRichComplicationProgressView addSubview:](v15, "addSubview:", v15->_foregroundView);
    v23 = objc_opt_new();
    indicatorView = v15->_indicatorView;
    v15->_indicatorView = (UIView *)v23;

    -[CDRichComplicationProgressView addSubview:](v15, "addSubview:", v15->_indicatorView);
    -[CDRichComplicationProgressView setShowHolePunch:](v15, "setShowHolePunch:", 1);
    -[CDRichComplicationProgressView setShowIndicatorView:](v15, "setShowIndicatorView:", 1);
    -[CDRichComplicationProgressView _applyStyle](v15, "_applyStyle");
  }

  return v15;
}

- (void)dealloc
{
  NSNumber *updateToken;
  objc_super v4;

  if (self->_updateToken)
  {
    -[CLKGaugeProvider stopUpdatesForToken:](self->_gaugeProvider, "stopUpdatesForToken:");
    updateToken = self->_updateToken;
    self->_updateToken = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)CDRichComplicationProgressView;
  -[CDRichComplicationProgressView dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  double Width;
  CGFloat Height;
  double progress;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)CDRichComplicationProgressView;
  -[CDRichComplicationProgressView layoutSubviews](&v13, sel_layoutSubviews);
  -[CDRichComplicationProgressView bounds](self, "bounds");
  -[CDRichComplicationShapeView setFrame:](self->_backgroundView, "setFrame:");
  -[CDRichComplicationProgressView bounds](self, "bounds");
  -[CDRichComplicationShapeView setFrame:](self->_foregroundView, "setFrame:");
  -[CDRichComplicationProgressView bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[CDRichComplicationProgressView bounds](self, "bounds");
  Height = CGRectGetHeight(v15);
  -[CAShapeLayer setBounds:](self->_ringLayer, "setBounds:", 0.0, 0.0, Width + Width, Height + Height);
  -[CDRichComplicationProgressView _updateRingShape](self, "_updateRingShape");
  progress = self->_progress;
  *(float *)&progress = progress;
  -[CDRichComplicationShapeView pointAtProgress:](self->_backgroundView, "pointAtProgress:", progress);
  v7 = v6;
  v9 = v8;
  -[CAShapeLayer setPosition:](self->_ringLayer, "setPosition:", v8, v6, *MEMORY[0x24BDBEFB0]);
  -[CDRichComplicationShapeView _shapeLineWidth](self->_foregroundView, "_shapeLineWidth");
  v11 = v10 * 0.5;
  -[UIView setBounds:](self->_indicatorView, "setBounds:", 0.0, 0.0, v11 + v11, v11 + v11);
  -[UIView layer](self->_indicatorView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  -[UIView setCenter:](self->_indicatorView, "setCenter:", v9, v7);
}

- (void)setGradientColors:(id)a3
{
  CDRichComplicationShapeView *backgroundView;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_gradientColors, a3);
  v7 = a3;
  backgroundView = self->_backgroundView;
  -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:](self, "overrideBackgroundGradientColorsForGradientColors:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationShapeView setGradientColors:](backgroundView, "setGradientColors:", v6);

  -[CDRichComplicationShapeView setGradientColors:](self->_foregroundView, "setGradientColors:", v7);
}

- (void)setGradientColors:(id)a3 locations:(id)a4
{
  CDRichComplicationShapeView *backgroundView;
  id v7;
  void *v8;
  id v9;

  backgroundView = self->_backgroundView;
  v7 = a4;
  v9 = a3;
  -[CDRichComplicationProgressView overrideBackgroundGradientColorsForGradientColors:locations:](self, "overrideBackgroundGradientColorsForGradientColors:locations:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationShapeView setGradientColors:locations:](backgroundView, "setGradientColors:locations:", v8, v7);

  -[CDRichComplicationShapeView setGradientColors:locations:](self->_foregroundView, "setGradientColors:locations:", v9, v7);
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  return a3;
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  return a3;
}

- (void)setProgress:(double)a3
{
  double v4;

  v4 = fmin(a3, 1.0);
  if (v4 < 0.0)
    v4 = 0.0;
  self->_progress = v4;
  -[CDRichComplicationShapeView setProgress:](self->_foregroundView, "setProgress:");
  -[CDRichComplicationProgressView setNeedsLayout](self, "setNeedsLayout");
}

- (void)animateToProgress:(float)a3 duration:(double)a4
{
  double progress;
  float v7;
  float v8;
  void (**v9)(double);
  _QWORD aBlock[4];
  id v11;
  float v12;
  float v13;
  id location;

  objc_initWeak(&location, self);
  progress = self->_progress;
  v7 = progress;
  v8 = a3 - progress;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CDRichComplicationProgressView_animateToProgress_duration___block_invoke;
  aBlock[3] = &unk_24CF213C0;
  objc_copyWeak(&v11, &location);
  v12 = v7;
  v13 = v8;
  v9 = (void (**)(double))_Block_copy(aBlock);
  v9[2](1.0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __61__CDRichComplicationProgressView_animateToProgress_duration___block_invoke(uint64_t a1, double a2)
{
  double *WeakRetained;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[58] = *(float *)(a1 + 40) + *(float *)(a1 + 44) * a2;
    v12 = WeakRetained;
    v6 = objc_msgSend(WeakRetained, "style");
    if ((unint64_t)(v6 - 1) < 2)
    {
      objc_msgSend(*((id *)v12 + 63), "setProgress:", v12[58]);
LABEL_6:
      v5 = v12;
      goto LABEL_7;
    }
    v5 = v12;
    if (!v6)
    {
      v7 = v12[58];
      *(float *)&v7 = v7;
      objc_msgSend(*((id *)v12 + 62), "pointAtProgress:", v7);
      v9 = v8;
      v11 = v10;
      objc_msgSend(*((id *)v12 + 65), "setPosition:");
      objc_msgSend(*((id *)v12 + 61), "setCenter:", v9, v11);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[CDRichComplicationProgressView _applyStyle](self, "_applyStyle");
}

- (void)setGaugeProvider:(id)a3
{
  CLKGaugeProvider *v5;
  id *p_gaugeProvider;
  CLKGaugeProvider *gaugeProvider;
  NSNumber *updateToken;
  id v9;
  NSNumber *v10;
  NSNumber *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (CLKGaugeProvider *)a3;
  if (v5)
  {
    p_gaugeProvider = (id *)&self->_gaugeProvider;
    gaugeProvider = self->_gaugeProvider;
    if (gaugeProvider != v5)
    {
      if (self->_updateToken)
      {
        -[CLKGaugeProvider stopUpdatesForToken:](gaugeProvider, "stopUpdatesForToken:");
        updateToken = self->_updateToken;
        self->_updateToken = 0;

      }
      objc_storeStrong((id *)&self->_gaugeProvider, a3);
      -[CDRichComplicationProgressView _updateUIFromGaugeProvider](self, "_updateUIFromGaugeProvider");
      if (objc_msgSend(*p_gaugeProvider, "needsTimerUpdates"))
      {
        objc_initWeak(&location, self);
        v9 = *p_gaugeProvider;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __51__CDRichComplicationProgressView_setGaugeProvider___block_invoke;
        v12[3] = &unk_24CF213E8;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v9, "startUpdatesWithHandler:", v12);
        v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v11 = self->_updateToken;
        self->_updateToken = v10;

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __51__CDRichComplicationProgressView_setGaugeProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progressFractionForNow:", v5);
  v7 = v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&v7 = v7;
  LODWORD(v8) = LODWORD(v7);
  objc_msgSend(WeakRetained, "animateToProgress:duration:", v8, 0.300000012);

}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[CDRichComplicationProgressView _applyStyle](self, "_applyStyle");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  double v5;
  _BOOL4 v6;
  uint64_t v7;
  id WeakRetained;
  id v9;

  -[CDRichComplicationShapeView transitionToMonochromeWithFraction:](self->_foregroundView, "transitionToMonochromeWithFraction:");
  -[CDRichComplicationShapeView transitionToMonochromeWithFraction:](self->_backgroundView, "transitionToMonochromeWithFraction:", a3);
  *(float *)&v5 = a3;
  -[CDRichComplicationProgressView _adjustBackgroundViewAlphaWithPercentage:](self, "_adjustBackgroundViewAlphaWithPercentage:", v5);
  v6 = -[UIView isHidden](self->_indicatorView, "isHidden");
  v7 = a3 < 1.0 || v6;
  -[CDRichComplicationProgressView setShowHolePunch:](self, "setShowHolePunch:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "colorForView:accented:", self, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView setBackgroundColor:](self->_indicatorView, "setBackgroundColor:", v9);
  -[UIView setAlpha:](self->_indicatorView, "setAlpha:", a3);

}

- (void)updateMonochromeColor
{
  double v3;
  id WeakRetained;
  id v5;

  -[CDRichComplicationShapeView updateMonochromeColor](self->_foregroundView, "updateMonochromeColor");
  -[CDRichComplicationShapeView updateMonochromeColor](self->_backgroundView, "updateMonochromeColor");
  LODWORD(v3) = 1.0;
  -[CDRichComplicationProgressView _adjustBackgroundViewAlphaWithPercentage:](self, "_adjustBackgroundViewAlphaWithPercentage:", v3);
  -[CDRichComplicationProgressView setShowHolePunch:](self, "setShowHolePunch:", -[UIView isHidden](self->_indicatorView, "isHidden"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  objc_msgSend(WeakRetained, "colorForView:accented:", self, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView setBackgroundColor:](self->_indicatorView, "setBackgroundColor:", v5);
  -[UIView setAlpha:](self->_indicatorView, "setAlpha:", 1.0);

}

- (void)_updateUIFromGaugeProvider
{
  CLKGaugeProvider *gaugeProvider;
  void *v4;
  double v5;
  float v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CLKGaugeProviderStyle v12;
  CLKGaugeProviderStyle v13;

  gaugeProvider = self->_gaugeProvider;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKGaugeProvider progressFractionForNow:](gaugeProvider, "progressFractionForNow:", v4);
  v6 = v5;

  -[CDRichComplicationProgressView setProgress:](self, "setProgress:", v6);
  LODWORD(v7) = *MEMORY[0x24BDB8658];
  -[CDRichComplicationProgressView setEnabled:](self, "setEnabled:", *MEMORY[0x24BDB8658] != v6, v7);
  -[CLKGaugeProvider gaugeColorLocations](self->_gaugeProvider, "gaugeColorLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[CLKGaugeProvider gaugeColors](self->_gaugeProvider, "gaugeColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CLKGaugeProvider gaugeColorLocations](self->_gaugeProvider, "gaugeColorLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationProgressView setGradientColors:locations:](self, "setGradientColors:locations:", v10, v11);

  }
  else
  {
    -[CDRichComplicationProgressView setGradientColors:](self, "setGradientColors:", v10);
  }

  v12 = -[CLKGaugeProvider style](self->_gaugeProvider, "style");
  if (v12 == *MEMORY[0x24BDB85E8])
    -[CDRichComplicationProgressView setStyle:](self, "setStyle:", 2);
  v13 = -[CLKGaugeProvider style](self->_gaugeProvider, "style");
  if ((unint64_t)v13 <= CLKGaugeProviderStyleFill)
    -[CDRichComplicationProgressView setStyle:](self, "setStyle:", v13);
}

- (void)_adjustBackgroundViewAlphaWithPercentage:(float)a3
{
  int64_t style;
  double v6;

  style = self->_style;
  if (style != 1 && (style || self->_enabled))
  {
    -[CDRichComplicationShapeView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
  }
  else
  {
    CLKInterpolateBetweenFloatsClipped();
    *(float *)&v6 = v6;
    -[CDRichComplicationShapeView setAlpha:](self->_backgroundView, "setAlpha:", *(float *)&v6);
    self->_currentBackgroundViewAlphaPercentage = a3;
  }
}

- (void)_applyStyle
{
  double v2;
  int64_t style;
  _BOOL8 v5;
  _BOOL8 v6;

  style = self->_style;
  switch(style)
  {
    case 2:
      -[CDRichComplicationShapeView setHidden:](self->_backgroundView, "setHidden:", 1);
      goto LABEL_6;
    case 1:
LABEL_6:
      -[CDRichComplicationProgressView setShowIndicatorView:](self, "setShowIndicatorView:", 0);
      v5 = !self->_enabled;
      goto LABEL_7;
    case 0:
      -[CDRichComplicationProgressView setShowIndicatorView:](self, "setShowIndicatorView:", self->_enabled);
      v5 = 1;
LABEL_7:
      -[CDRichComplicationShapeView setHidden:](self->_foregroundView, "setHidden:", v5);
      break;
  }
  *(float *)&v2 = self->_currentBackgroundViewAlphaPercentage;
  -[CDRichComplicationProgressView _adjustBackgroundViewAlphaWithPercentage:](self, "_adjustBackgroundViewAlphaWithPercentage:", v2);
  v6 = !self->_showAlternateIndicatorColor || self->_style || !self->_enabled;
  -[UIView setHidden:](self->_indicatorView, "setHidden:", v6);
}

- (void)_updateRingShape
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_213031000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

- (void)setShowHolePunch:(BOOL)a3
{
  if (self->_showHolePunch != a3)
  {
    self->_showHolePunch = a3;
    -[CDRichComplicationProgressView _updateRingShape](self, "_updateRingShape");
  }
}

- (void)setShowIndicatorView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CAShapeLayer *ringLayer;
  void *v8;
  CAShapeLayer *v9;
  id v10;

  if (self->_showIndicatorView != a3)
  {
    v3 = a3;
    self->_showIndicatorView = a3;
    -[CDRichComplicationShapeView layer](self->_foregroundView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      ringLayer = self->_ringLayer;
    else
      ringLayer = 0;
    objc_msgSend(v5, "setMask:", ringLayer);

    -[CDRichComplicationShapeView layer](self->_backgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v9 = self->_ringLayer;
    else
      v9 = 0;
    v10 = v8;
    objc_msgSend(v8, "setMask:", v9);

  }
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationProgressView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CDRichComplicationProgressView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationProgressView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interpolatedColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationProgressView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)style
{
  return self->_style;
}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (BOOL)showHolePunch
{
  return self->_showHolePunch;
}

- (BOOL)showIndicatorView
{
  return self->_showIndicatorView;
}

- (BOOL)showAlternateIndicatorColor
{
  return self->_showAlternateIndicatorColor;
}

- (void)setShowAlternateIndicatorColor:(BOOL)a3
{
  self->_showAlternateIndicatorColor = a3;
}

- (UIView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_indicatorView, a3);
}

- (CDRichComplicationShapeView)backgroundView
{
  return self->_backgroundView;
}

- (CDRichComplicationShapeView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)ringView
{
  return self->_ringView;
}

- (CAShapeLayer)ringLayer
{
  return self->_ringLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
