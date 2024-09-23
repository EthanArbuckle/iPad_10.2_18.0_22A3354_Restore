@implementation NTKStopwatchRichComplicationBaseCircularView

- (NTKStopwatchRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  NTKStopwatchRichComplicationBaseCircularView *v3;
  NTKStopwatchRichComplicationBaseCircularView *v4;
  double *p_stopwatchImageConfigPointSize;
  void *v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  id *v22;
  void (**v23)(void *, void *);
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD aBlock[4];
  id *v50;
  id location[2];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGFloat v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v56, sel_initWithFamily_, a3);
  v4 = v3;
  if (!v3)
    return v4;
  p_stopwatchImageConfigPointSize = &v3->_layoutConstants.stopwatchImageConfigPointSize;
  -[CDRichComplicationView device](v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDRichComplicationView family](v4, "family");
  v8 = v6;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_37);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_37);
  if (!WeakRetained)
    goto LABEL_6;
  v10 = WeakRetained;
  v11 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_37);
  if (v11 != v8)
  {

LABEL_6:
    v14 = objc_storeWeak(&_LayoutConstants___cachedDevice_37, v8);
    _LayoutConstants___previousCLKDeviceVersion_37 = objc_msgSend(v8, "version");

    ___LayoutConstants_block_invoke_34(v15, v8);
    goto LABEL_7;
  }
  v12 = objc_msgSend(v8, "version");
  v13 = _LayoutConstants___previousCLKDeviceVersion_37;

  if (v12 != v13)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_37);
  if (v7 == 12)
  {
    v17 = &_LayoutConstants___constantsGraphicExtraLarge_1;
  }
  else
  {
    if (v7 != 10)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        _LayoutConstants_cold_1(v7, v16);

    }
    v17 = &_LayoutConstants___constantsGraphicCircular_1;
  }
  v18 = v17[2];
  v19 = v17[3];
  v20 = *v17;
  v52 = v17[1];
  v53 = v18;
  v54 = v19;
  v55 = *((double *)v17 + 8);
  *(_OWORD *)location = v20;

  *(_OWORD *)&v4->_layoutConstants.timeLabelMaxWidth = v52;
  *(_OWORD *)&v4->_layoutConstants.dialDiameter = v53;
  *(_OWORD *)&v4->_layoutConstants.largeTickSize.height = v54;
  v4->_layoutConstants.smallTickSize.height = v55;
  *(_OWORD *)p_stopwatchImageConfigPointSize = *(_OWORD *)location;

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke;
  aBlock[3] = &unk_1E6BD4A88;
  v22 = v4;
  v50 = v22;
  v23 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v22[75];
  v22[75] = (id)v26;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v22[74];
  v22[74] = (id)v29;

  v31 = objc_alloc_init((Class)off_1E6BCA6E0);
  v32 = v22[73];
  v22[73] = v31;

  objc_initWeak(location, v22);
  v33 = v22[73];
  v47[0] = v21;
  v47[1] = 3221225472;
  v47[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_2;
  v47[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v48, location);
  objc_msgSend(v33, "setNowProvider:", v47);
  objc_msgSend(v22[73], "setInTimeTravel:", 0);
  v34 = v22[73];
  v45[0] = v21;
  v45[1] = 3221225472;
  v45[2] = __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_3;
  v45[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v46, location);
  objc_msgSend(v34, "setNeedsResizeHandler:", v45);
  objc_msgSend(v22[73], "setMaxWidth:", v4->_layoutConstants.timeLabelMaxWidth);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v4->_layoutConstants.timeLabelFontSize, *MEMORY[0x1E0DC1448]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "CLKFontWithAlternativePunctuation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22[73], "setFont:", v36);
  objc_msgSend(v22[73], "setHidden:", 1);
  objc_msgSend(v22, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSubview:", v22[73]);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", *p_stopwatchImageConfigPointSize);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("stopwatch"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v39);
  v41 = v22[72];
  v22[72] = (id)v40;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22[72], "setTintColor:", v42);

  objc_msgSend(v22, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", v22[72]);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(location);

  return v4;
}

NTKRichComplicationDialView *__63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NTKRichComplicationDialView *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = -[NTKRichComplicationDialView initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:]([NTKRichComplicationDialView alloc], "initWithLargeTickCount:smallTickCountPerLargeTick:largeTickSize:smallTickSize:dialRange:startAngle:", 12, 5, *(double *)(*(_QWORD *)(a1 + 32) + 656), *(double *)(*(_QWORD *)(a1 + 32) + 664), *(double *)(*(_QWORD *)(a1 + 32) + 672), *(double *)(*(_QWORD *)(a1 + 32) + 680), 6.28318531, 0.0);
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "CGColor");
  -[NTKRichComplicationDialView largeTickLayer](v4, "largeTickLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "CGColor");

  -[NTKRichComplicationDialView smallTickLayer](v4, "smallTickLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[NTKRichComplicationDialView setHidden:](v4, "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v4);

  return v4;
}

id __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x1E0C944A0];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __63__NTKStopwatchRichComplicationBaseCircularView_initWithFamily___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)dealloc
{
  void *v3;
  NSNumber *updateToken;
  objc_super v5;

  if (self->_updateToken)
  {
    -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_updateToken);

    updateToken = self->_updateToken;
    self->_updateToken = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[NTKStopwatchRichComplicationBaseCircularView dealloc](&v5, sel_dealloc);
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
  double v17;
  double v18;
  double v19;
  double timeLabelBottom;
  double timeLabelMaxWidth;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v27, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[CDRichComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CLKSizeCenteredInRectForDevice();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[NTKRichComplicationDialView setFrame:](self->_backDial, "setFrame:", v10, v12, v14, v16);
  -[NTKRichComplicationDialView setFrame:](self->_frontDial, "setFrame:", v10, v12, v14, v16);
  -[CLKUIColoringLabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_timeLabel, "frame");
  v19 = v18;
  timeLabelBottom = self->_layoutConstants.timeLabelBottom;
  if (v17 >= self->_layoutConstants.timeLabelMaxWidth)
    timeLabelMaxWidth = self->_layoutConstants.timeLabelMaxWidth;
  else
    timeLabelMaxWidth = v17;
  -[CLKUIColoringLabel font](self->_timeLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ascender");
  *(float *)&v23 = timeLabelBottom - v23;
  v24 = ceilf(*(float *)&v23);

  -[CLKUIColoringLabel setFrame:](self->_timeLabel, "setFrame:", (v5 - timeLabelMaxWidth) * 0.5, v24, timeLabelMaxWidth, v19);
  -[UIImageView sizeToFit](self->_stopwatchImageView, "sizeToFit");
  -[UIImageView frame](self->_stopwatchImageView, "frame");
  -[UIImageView setFrame:](self->_stopwatchImageView, "setFrame:", (v5 - v25) * 0.5, (v7 - v26) * 0.5 + v7 * -0.02);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5;
  void *v6;
  NSNumber *updateToken;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  NSNumber *v19;
  _QWORD v20[4];
  id v21;
  id location;

  v5 = a3;
  if (self->_updateToken)
  {
    -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopUpdatesForToken:", self->_updateToken);

    updateToken = self->_updateToken;
    self->_updateToken = 0;

  }
  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NTKStopwatchComplicationMetadataStateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("NTKStopwatchComplicationMetadataStateValue_Running")))
  {
    self->_showPlatter = 0;
    -[NTKRichComplicationDialView setHidden:](self->_backDial, "setHidden:", 0);
    -[NTKRichComplicationDialView setHidden:](self->_frontDial, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;
    -[CLKUIColoringLabel setTextColor:](self->_timeLabel, "setTextColor:", v10);

    v12 = 0;
    v13 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("NTKStopwatchComplicationMetadataStateValue_Paused")))
  {
    self->_showPlatter = 0;
    -[NTKRichComplicationDialView setHidden:](self->_backDial, "setHidden:", 0);
    -[NTKRichComplicationDialView setHidden:](self->_frontDial, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = 1;
  self->_showPlatter = 1;
  -[NTKRichComplicationDialView setHidden:](self->_backDial, "setHidden:", 1);
  -[NTKRichComplicationDialView setHidden:](self->_frontDial, "setHidden:", 1);
  v13 = 0;
LABEL_9:
  -[CLKUIColoringLabel setHidden:](self->_timeLabel, "setHidden:", v12);
  -[UIImageView setHidden:](self->_stopwatchImageView, "setHidden:", v13);
  -[NTKRichComplicationCircularBaseView _updatePlatterColor](self, "_updatePlatterColor");
  if ((-[CLKUIColoringLabel isHidden](self->_timeLabel, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("NTKStopwatchComplicationMetadataTimeTextProviderKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTintColor:", v16);

    objc_msgSend(v15, "setPaused:", 0);
    -[CLKUIColoringLabel setTextProvider:](self->_timeLabel, "setTextProvider:", v15);

  }
  objc_initWeak(&location, self);
  -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__NTKStopwatchRichComplicationBaseCircularView__handleTemplate_reason___block_invoke;
  v20[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v17, "startUpdatesWithHandler:", v20);
  v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v19 = self->_updateToken;
  self->_updateToken = v18;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __71__NTKStopwatchRichComplicationBaseCircularView__handleTemplate_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDialProgress");

}

- (void)_editingDidEnd
{
  -[CLKUIColoringLabel editingDidEnd](self->_timeLabel, "editingDidEnd");
}

- (void)_applyPausedUpdate
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[CDRichComplicationView _applyPausedUpdate](&v5, sel__applyPausedUpdate);
  v3 = -[CDRichComplicationView paused](self, "paused");
  -[UIImageView layer](self->_stopwatchImageView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", v3);

}

- (void)_updateDialProgress
{
  double v3;
  float v4;
  float v5;
  double v6;
  NTKRichComplicationDialView *frontDial;
  float v8;
  double v9;

  -[NTKStopwatchRichComplicationBaseCircularView _stopwatchCurrentTime](self, "_stopwatchCurrentTime");
  v4 = v3;
  v5 = fmodf(v4, 120.0);
  *(float *)&v6 = fmodf(v4, 60.0);
  frontDial = self->_frontDial;
  v8 = *(float *)&v6 / 60.0;
  if (v5 >= 60.0)
  {
    LODWORD(v6) = -1.0;
    -[NTKRichComplicationDialView setProgressDirection:](frontDial, "setProgressDirection:", v6);
    v8 = 1.0 - v8;
  }
  else
  {
    LODWORD(v6) = 1.0;
    -[NTKRichComplicationDialView setProgressDirection:](frontDial, "setProgressDirection:", v6);
  }
  *(float *)&v9 = v8;
  -[NTKRichComplicationDialView setProgress:](self->_frontDial, "setProgress:", v9);
}

- (double)_stopwatchCurrentTime
{
  return 0.0;
}

- (BOOL)templateWantsPlatter
{
  return self->_showPlatter;
}

- (int64_t)_backgroundFilterStyle
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

- (int64_t)_foregroundFilterStyle
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v13, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKStopwatchRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIImageView layer](self->_stopwatchImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

    -[NTKRichComplicationDialView layer](self->_backDial, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v6);

    -[NTKRichComplicationDialView layer](self->_frontDial, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v6);

  }
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKStopwatchRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CLKUIColoringLabel layer](self->_timeLabel, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v11);

  }
}

- (void)updateMonochromeColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKStopwatchRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView updateMonochromeColor](&v11, sel_updateMonochromeColor);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKStopwatchRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIImageView layer](self->_stopwatchImageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v4);

    -[NTKRichComplicationDialView layer](self->_backDial, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v4);

    -[NTKRichComplicationDialView layer](self->_frontDial, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v4);

  }
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:", self, -[NTKStopwatchRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CLKUIColoringLabel layer](self->_timeLabel, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_backDial, 0);
  objc_storeStrong((id *)&self->_frontDial, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_stopwatchImageView, 0);
}

@end
