@implementation NTKRichComplicationCircularOpenGaugeContentView

+ (int64_t)progressFillStyle
{
  return 0;
}

- (int64_t)_outerFilterStyle
{
  void *v2;
  int v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKShowGossamerUI(v2);

  if (v3)
    return 2;
  else
    return 0;
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

- (NTKRichComplicationCircularOpenGaugeContentView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationCircularOpenGaugeContentView *v4;
  NTKRichComplicationCircularOpenGaugeContentView *v5;
  void *v6;
  id v7;
  __int128 v8;
  double v9;
  void *v10;
  uint64_t v11;
  CDRichComplicationCurvedProgressView *progressView;
  void *v13;
  uint64_t v14;
  UIView *bottomView;
  void *v16;
  uint64_t v17;
  CLKUIColoringLabel *centerLabel;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NTKRichComplicationCircularOpenGaugeContentView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v22, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v21 = 0u;
    -[CDRichComplicationView device](v4, "device", 0, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_16(v6, a3, &v20);

    v7 = objc_alloc((Class)off_1E6BCA1A8);
    v8 = v21;
    v9 = 6.28318531 - *((double *)&v21 + 1);
    -[CDRichComplicationView device](v5, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v10, -[NTKRichComplicationCircularOpenGaugeContentView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), *(double *)&v8, 0.0, *((double *)&v8 + 1), v9);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v11;

    -[CDRichComplicationCurvedProgressView setFilterProvider:](v5->_progressView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_progressView);

    -[NTKRichComplicationCircularOpenGaugeContentView bottomView](v5, "bottomView");
    v14 = objc_claimAutoreleasedReturnValue();
    bottomView = v5->_bottomView;
    v5->_bottomView = (UIView *)v14;

    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_bottomView);

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v17;

  }
  return v5;
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
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
  CLKUIColoringLabel *centerLabel;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)NTKRichComplicationCircularOpenGaugeContentView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v29, sel_layoutSubviews);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_16(v3, -[CDRichComplicationView family](self, "family"), &v25);

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  centerLabel = self->_centerLabel;
  v14 = *MEMORY[0x1E0DC1448];
  v15 = *(double *)&v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v25 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", centerLabel, v18, v21, v14);

  -[CLKUIColoringLabel frame](self->_centerLabel, "frame");
  -[CLKUIColoringLabel font](self->_centerLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ascender");

  -[CDRichComplicationView device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

  -[UIView frame](self->_bottomView, "frame");
  -[CDRichComplicationView device](self, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[UIView setFrame:](self->_bottomView, "setFrame:");

}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = 0;
  v8 = 0;
  -[NTKRichComplicationCircularOpenGaugeContentView gaugeProvider:andCenterTextProvider:fromTemplate:](self, "gaugeProvider:andCenterTextProvider:fromTemplate:", &v8, &v7, a3);
  v5 = v8;
  v6 = v7;
  -[CDRichComplicationCurvedProgressView setGaugeProvider:](self->_progressView, "setGaugeProvider:", v5);
  -[CLKUIColoringLabel setTextProvider:](self->_centerLabel, "setTextProvider:", v6);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_centerLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_centerLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationCircularOpenGaugeContentView _innerFilterStyle](self, "_innerFilterStyle"), a3);
  -[CDRichComplicationCurvedProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_centerLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationCircularOpenGaugeContentView _innerFilterStyle](self, "_innerFilterStyle"));
  -[CDRichComplicationCurvedProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

- (id)bottomView
{
  OUTLINED_FUNCTION_1_0();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5
{
  OUTLINED_FUNCTION_1_0();
  NSRequestConcreteImplementation();
}

@end
