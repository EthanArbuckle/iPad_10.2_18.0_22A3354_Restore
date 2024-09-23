@implementation NTKRichComplicationBaseCircularOpenGaugeRangeTextView

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

- (NTKRichComplicationBaseCircularOpenGaugeRangeTextView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularOpenGaugeRangeTextView *v4;
  NTKRichComplicationBaseCircularOpenGaugeRangeTextView *v5;
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
  CLKUIColoringLabel *leadingSmallLabel;
  uint64_t v17;
  CLKUIColoringLabel *trailingSmallLabel;
  uint64_t v19;
  CLKUIColoringLabel *centerLabel;
  __int128 v22;
  __int128 v23;
  double v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v25, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v24 = 0.0;
    v23 = 0u;
    -[CDRichComplicationView device](v4, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_52(v6, a3, (uint64_t)&v22);

    v7 = objc_alloc((Class)off_1E6BCA1A8);
    v8 = *((double *)&v23 + 1);
    v9 = v24;
    v10 = 6.28318531 - v24;
    -[CDRichComplicationView device](v5, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v11, -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), v8, 0.0, v9, v10);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v12;

    -[CDRichComplicationCurvedProgressView setFilterProvider:](v5->_progressView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_progressView);

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v15 = objc_claimAutoreleasedReturnValue();
    leadingSmallLabel = v5->_leadingSmallLabel;
    v5->_leadingSmallLabel = (CLKUIColoringLabel *)v15;

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    trailingSmallLabel = v5->_trailingSmallLabel;
    v5->_trailingSmallLabel = (CLKUIColoringLabel *)v17;

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v19 = objc_claimAutoreleasedReturnValue();
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v19;

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
  void *v25;
  CLKUIColoringLabel *leadingSmallLabel;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CLKUIColoringLabel *trailingSmallLabel;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  objc_super v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v54, sel_layoutSubviews);
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_52(v3, -[CDRichComplicationView family](self, "family"), (uint64_t)&v47);

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
  v15 = *(double *)&v48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v47);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v47 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
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

  -[CLKUIColoringLabel text](self->_leadingSmallLabel, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "length");

  -[CLKUIColoringLabel text](self->_trailingSmallLabel, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "length");

  leadingSmallLabel = self->_leadingSmallLabel;
  v27 = *(double *)&v51;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v51);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *(double *)&v49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v49);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v32;
  v33 = *((double *)&v49 + 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v49 + 1));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", leadingSmallLabel, v30, v35, v14);

  -[CLKUIColoringLabel frame](self->_leadingSmallLabel, "frame");
  -[CLKUIColoringLabel font](self->_leadingSmallLabel, "font");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "ascender");

  -[CDRichComplicationView device](self, "device");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_leadingSmallLabel, "setFrame:");

  trailingSmallLabel = self->_trailingSmallLabel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", trailingSmallLabel, v41, v44, v14);

  -[CLKUIColoringLabel frame](self->_trailingSmallLabel, "frame");
  -[CLKUIColoringLabel font](self->_trailingSmallLabel, "font");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "ascender");

  -[CDRichComplicationView device](self, "device");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_trailingSmallLabel, "setFrame:");

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
  v9.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  -[CDRichComplicationView _setFontConfiguration:](&v9, sel__setFontConfiguration_, v10);
  v7 = a3->var1;
  if (v7)
  {
    v8 = a3->var2;
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_leadingSmallLabel, v7, v8);
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_trailingSmallLabel, v7, v8);
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_centerLabel, v7, v8);
  }

}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_leadingSmallLabel, "editingDidEnd");
  -[CLKUIColoringLabel editingDidEnd](self->_trailingSmallLabel, "editingDidEnd");
  -[CLKUIColoringLabel editingDidEnd](self->_centerLabel, "editingDidEnd");
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_centerLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _innerFilterStyle](self, "_innerFilterStyle"), a3);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_leadingSmallLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](self, "_outerFilterStyle"), a3);
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_trailingSmallLabel, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](self, "_outerFilterStyle"), a3);
  -[CDRichComplicationCurvedProgressView transitionToMonochromeWithFraction:](self->_progressView, "transitionToMonochromeWithFraction:", a3);
}

- (void)updateMonochromeColor
{
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_centerLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _innerFilterStyle](self, "_innerFilterStyle"));
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_leadingSmallLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](self, "_outerFilterStyle"));
  -[CLKUIColoringLabel updateMonochromeColorWithStyle:](self->_trailingSmallLabel, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](self, "_outerFilterStyle"));
  -[CDRichComplicationCurvedProgressView updateMonochromeColor](self->_progressView, "updateMonochromeColor");
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CLKUIColoringLabel)leadingSmallLabel
{
  return self->_leadingSmallLabel;
}

- (void)setLeadingSmallLabel:(id)a3
{
  objc_storeStrong((id *)&self->_leadingSmallLabel, a3);
}

- (CLKUIColoringLabel)trailingSmallLabel
{
  return self->_trailingSmallLabel;
}

- (void)setTrailingSmallLabel:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSmallLabel, a3);
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_trailingSmallLabel, 0);
  objc_storeStrong((id *)&self->_leadingSmallLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
