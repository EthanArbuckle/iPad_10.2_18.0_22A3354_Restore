@implementation NTKRichComplicationBaseCircularOpenMeteredGaugeImageView

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

- (NTKRichComplicationBaseCircularOpenMeteredGaugeImageView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *v4;
  NTKRichComplicationBaseCircularOpenMeteredGaugeImageView *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  CDRichComplicationCurvedProgressView *progressView;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  CDRichComplicationImageView *centerImageView;
  void *v16;
  uint64_t v17;
  CLKUIColoringLabel *smallLabel;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v20, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    -[CDRichComplicationView device](v4, "device", 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _layoutConstraintsWithDevice:family:](v5, "_layoutConstraintsWithDevice:family:", v6, a3);

    v7 = objc_alloc((Class)off_1E6BCA1A8);
    -[CDRichComplicationView device](v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v8, -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), 0.0, 0.0, 0.0, 6.28318531 - 0.0);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v9;

    -[CDRichComplicationCurvedProgressView setFilterProvider:](v5->_progressView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5->_progressView);

    v12 = objc_alloc((Class)off_1E6BCA1B0);
    -[CDRichComplicationView device](v5, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithDevice:useAccentColor:", v13, 1);
    centerImageView = v5->_centerImageView;
    v5->_centerImageView = (CDRichComplicationImageView *)v14;

    -[CDRichComplicationImageView setPaused:](v5->_centerImageView, "setPaused:", -[CDRichComplicationView paused](v5, "paused"));
    -[CDRichComplicationImageView setFilterProvider:](v5->_centerImageView, "setFilterProvider:", v5);
    -[NTKRichComplicationCircularBaseView contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v5->_centerImageView);

    -[NTKRichComplicationCircularBaseView _createAndAddColoringLabel](v5, "_createAndAddColoringLabel");
    v17 = objc_claimAutoreleasedReturnValue();
    smallLabel = v5->_smallLabel;
    v5->_smallLabel = (CLKUIColoringLabel *)v17;

    -[CLKUIColoringLabel setUppercase:](v5->_smallLabel, "setUppercase:", 0);
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  objc_super v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v46, sel_layoutSubviews);
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _layoutConstraintsWithDevice:family:](self, "_layoutConstraintsWithDevice:family:", v3, -[CDRichComplicationView family](self, "family"));

  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView progressView](self, "progressView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[CDRichComplicationView device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _smallLabelFontWeight](self, "_smallLabelFontWeight");
  v26 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:](self, "_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:", v24, v29, v32, v26);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "font");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "ascender");

  -[CDRichComplicationView device](self, "device");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  -[CDRichComplicationView setPaused:](&v6, sel_setPaused_);
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaused:", v3);

}

- (int64_t)tritiumUpdateMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;
  objc_super v8;

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tritiumUpdateMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "integerValue");
    if (v5 >= 2)
      v6 = 2;
    else
      v6 = v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
    v6 = -[CDRichComplicationTemplateView tritiumUpdateMode](&v8, sel_tritiumUpdateMode);
  }

  return v6;
}

+ (int64_t)progressFillStyle
{
  return 2;
}

- (double)_smallLabelFontWeight
{
  return *MEMORY[0x1E0DC1448];
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)_layoutConstraintsWithDevice:(SEL)a3 family:(id)a4
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  $8502DCEA08BBBE1AB2005217B3838BBD *result;

  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_39);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_39);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_39);
    if (v10 == v7)
    {
      v11 = objc_msgSend(v7, "version");
      v12 = _LayoutConstants___previousCLKDeviceVersion_39;

      if (v11 == v12)
        goto LABEL_6;
    }
    else
    {

    }
  }
  v13 = objc_storeWeak(&_LayoutConstants___cachedDevice_39, v7);
  _LayoutConstants___previousCLKDeviceVersion_39 = objc_msgSend(v7, "version");

  ___LayoutConstants_block_invoke_36(v14, v7);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_39);
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  if (a5 == 12)
  {
    v16 = &_LayoutConstants__constantsGraphicExtraLarge;
  }
  else
  {
    if (a5 != 10)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _layoutConstraintsWithDevice:family:].cold.1(a5, v15);

    }
    v16 = &_LayoutConstants__constants_0;
  }
  v17 = v16[1];
  *(_OWORD *)&retstr->var0 = *v16;
  *(_OWORD *)&retstr->var2 = v17;
  v18 = v16[3];
  *(_OWORD *)&retstr->var4 = v16[2];
  *(_OWORD *)&retstr->var6 = v18;

  return result;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKRichComplicationBaseCircularOpenMeteredGaugeImageView;
  v4 = (void (**)(id, void *))a3;
  -[CDRichComplicationView _enumerateLabelsWithBlock:](&v6, sel__enumerateLabelsWithBlock_, v4);
  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (void)_editingDidEnd
{
  id v2;

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editingDidEnd");

}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToMonochromeWithFraction:", a3);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionToMonochromeWithFraction:style:", -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _innerFilterStyle](self, "_innerFilterStyle"), a3);

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView progressView](self, "progressView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionToMonochromeWithFraction:", a3);

}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  id v5;

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView centerImageView](self, "centerImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMonochromeColor");

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView smallLabel](self, "smallLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateMonochromeColorWithStyle:", -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView _innerFilterStyle](self, "_innerFilterStyle"));

  -[NTKRichComplicationBaseCircularOpenMeteredGaugeImageView progressView](self, "progressView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMonochromeColor");

}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (CDRichComplicationImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
  objc_storeStrong((id *)&self->_centerImageView, a3);
}

- (CLKUIColoringLabel)smallLabel
{
  return self->_smallLabel;
}

- (void)setSmallLabel:(id)a3
{
  objc_storeStrong((id *)&self->_smallLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smallLabel, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

- (void)_layoutConstraintsWithDevice:(uint64_t)a1 family:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "const OpenMeteredGaugeViewLayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

@end
