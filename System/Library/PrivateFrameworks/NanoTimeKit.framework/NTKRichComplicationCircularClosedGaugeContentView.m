@implementation NTKRichComplicationCircularClosedGaugeContentView

- (NTKRichComplicationCircularClosedGaugeContentView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationCircularClosedGaugeContentView *v4;
  NTKRichComplicationCircularClosedGaugeContentView *v5;
  void *v6;
  double v7;
  NTKRichComplicationRingProgressView *v8;
  void *v9;
  uint64_t v10;
  NTKRichComplicationRingProgressView *progressView;
  void *v12;
  uint64_t v13;
  UIView *innerView;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKRichComplicationCircularClosedGaugeContentView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v17, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    -[CDRichComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _LayoutConstants_26(v6, a3);

    v8 = [NTKRichComplicationRingProgressView alloc];
    -[CDRichComplicationView device](v5, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NTKRichComplicationRingProgressView initWithFamily:curveWidth:padding:forDevice:](v8, "initWithFamily:curveWidth:padding:forDevice:", a3, v9, v7, 0.0);
    progressView = v5->_progressView;
    v5->_progressView = (NTKRichComplicationRingProgressView *)v10;

    -[CDRichComplicationProgressView setFilterProvider:](v5->_progressView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_progressView);

    -[NTKRichComplicationCircularClosedGaugeContentView innerView](v5, "innerView");
    v13 = objc_claimAutoreleasedReturnValue();
    innerView = v5->_innerView;
    v5->_innerView = (UIView *)v13;

    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5->_innerView);

  }
  return v5;
}

- (NTKRichComplicationRingProgressView)progressView
{
  return self->_progressView;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationCircularClosedGaugeContentView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v14, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_26(v3, -[CDRichComplicationView family](self, "family"));

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[NTKRichComplicationRingProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  -[CDRichComplicationView device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[UIView setFrame:](self->_innerView, "setFrame:");

}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  NTKRichComplicationRingProgressView *progressView;
  void *v6;

  progressView = self->_progressView;
  -[NTKRichComplicationCircularClosedGaugeContentView gaugeProviderFromTemplate:](self, "gaugeProviderFromTemplate:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationProgressView setGaugeProvider:](progressView, "setGaugeProvider:", v6);

  -[CDRichComplicationProgressView setStyle:](self->_progressView, "setStyle:", 1);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CDRichComplicationProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
}

- (id)innerView
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (id)gaugeProviderFromTemplate:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

@end
