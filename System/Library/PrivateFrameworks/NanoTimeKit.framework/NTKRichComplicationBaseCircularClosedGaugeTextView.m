@implementation NTKRichComplicationBaseCircularClosedGaugeTextView

- (NTKRichComplicationBaseCircularClosedGaugeTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularClosedGaugeTextView *v4;
  NTKRichComplicationBaseCircularClosedGaugeTextView *v5;
  void *v6;
  double v7;
  NTKRichComplicationRingProgressView *v8;
  void *v9;
  uint64_t v10;
  NTKRichComplicationRingProgressView *progressView;
  void *v12;
  uint64_t v13;
  CLKUIColoringLabel *centerLabel;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v16, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    -[CDRichComplicationView device](v4, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _LayoutConstants_5(v6, a3);

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

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v13 = objc_claimAutoreleasedReturnValue();
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v13;

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CLKUIColoringLabel *centerLabel;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v24, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_5(v3, -[CDRichComplicationView family](self, "family"));
  v5 = v4;
  v7 = v6;

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[NTKRichComplicationRingProgressView setFrame:](self->_progressView, "setFrame:", v10, v12, v14, v16);
  centerLabel = self->_centerLabel;
  v18 = *MEMORY[0x1E0DC1448];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", centerLabel, v20, v22, v18);

  -[CLKUIColoringLabel frame](self->_centerLabel, "frame");
  -[CDRichComplicationView device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  objc_super v7;
  BOOL v8[8];
  id v9;
  double v10;

  v8[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v9 = v5;
  v10 = var2;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v7, sel__setFontConfiguration_, v8);
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_centerLabel, a3->var2);

  }
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_centerLabel, "editingDidEnd");
}

- (int64_t)_innerFilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 0;
  else
    return 2;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_centerLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularClosedGaugeTextView _innerFilterStyle](self, "_innerFilterStyle"), a3);
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_centerLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularClosedGaugeTextView _innerFilterStyle](self, "_innerFilterStyle"));
  -[CDRichComplicationProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centerLabel, a3);
}

- (NTKRichComplicationRingProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
}

@end
