@implementation NTKRichComplicationBaseCircularOpenGaugeSimpleTextView

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

- (NTKRichComplicationBaseCircularOpenGaugeSimpleTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *v4;
  NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  CDRichComplicationCurvedProgressView *progressView;
  void *v14;
  uint64_t v15;
  CLKUIColoringLabel *smallLabel;
  uint64_t v17;
  CLKUIColoringLabel *centerLabel;
  __int128 v20;
  __int128 v21;
  double v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v23, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v22 = 0.0;
    v21 = 0u;
    -[CDRichComplicationView device](v4, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_25(v6, a3, (uint64_t)&v20);

    v7 = objc_alloc((Class)off_1E6BCA1A8);
    v8 = *((double *)&v21 + 1);
    v9 = v22;
    v10 = 6.28318531 - v22;
    -[CDRichComplicationView device](v5, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v11, -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _outerFilterStyle](v5, "_outerFilterStyle"), 0, v8, 0.0, v9, v10);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v12;

    -[CDRichComplicationCurvedProgressView setFilterProvider:](v5->_progressView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_progressView);

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    smallLabel = v5->_smallLabel;
    v5->_smallLabel = (CLKUIColoringLabel *)v15;

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v17;

  }
  return v5;
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
  CLKUIColoringLabel *smallLabel;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  objc_super v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v41, sel_layoutSubviews);
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_25(v3, -[CDRichComplicationView family](self, "family"), (uint64_t)&v35);

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
  v15 = *(double *)&v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v36);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v35 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", centerLabel, v18, v21, v14);

  -[CLKUIColoringLabel frame](self->_centerLabel, "frame");
  -[CLKUIColoringLabel text](self->_centerLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "length");

  -[CLKUIColoringLabel font](self->_centerLabel, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ascender");

  -[CDRichComplicationView device](self, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

  smallLabel = self->_smallLabel;
  v26 = *(double *)&v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v37 + 1));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", smallLabel, v29, v32, v14);

  -[CLKUIColoringLabel frame](self->_smallLabel, "frame");
  -[CLKUIColoringLabel font](self->_smallLabel, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "ascender");

  -[CDRichComplicationView device](self, "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_smallLabel, "setFrame:");

}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  id v5;
  double var2;
  id v7;
  double v8;
  objc_super v9;
  BOOL v10[8];
  id v11;
  double v12;

  v10[0] = a3->var0;
  v5 = a3->var1;
  var2 = a3->var2;
  v11 = v5;
  v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v9, sel__setFontConfiguration_, v10);
  v7 = a3->var1;
  if (v7)
  {
    v8 = a3->var2;
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_smallLabel, v7, v8);
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_centerLabel, v7, v8);
  }

}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, CLKUIColoringLabel *);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](&v5, sel__enumerateLabelsWithBlock_, v4);
  v4[2](v4, self->_smallLabel);
  v4[2](v4, self->_centerLabel);

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_smallLabel, "editingDidEnd");
  -[CLKUIColoringLabel editingDidEnd](self->_centerLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_centerLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _innerFilterStyle](self, "_innerFilterStyle"), a3);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_smallLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _outerFilterStyle](self, "_outerFilterStyle"), a3);
  -[CDRichComplicationCurvedProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_centerLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _innerFilterStyle](self, "_innerFilterStyle"));
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_smallLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _outerFilterStyle](self, "_outerFilterStyle"));
  -[CDRichComplicationCurvedProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (CLKUIColoringLabel)smallLabel
{
  return self->_smallLabel;
}

- (void)setSmallLabel:(id)a3
{
  objc_storeStrong((id *)&self->_smallLabel, a3);
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centerLabel, a3);
}

- (CDRichComplicationCurvedProgressView)progressView
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
  objc_storeStrong((id *)&self->_smallLabel, 0);
}

@end
