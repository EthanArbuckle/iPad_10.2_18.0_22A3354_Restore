@implementation NTKAlarmRichComplicationBaseCircularView

- (NTKAlarmRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  NTKAlarmRichComplicationBaseCircularView *v3;
  NTKAlarmRichComplicationBaseCircularView *v4;
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  CLKUIColoringLabel *v21;
  CLKUIColoringLabel *timeLabel;
  CLKUIColoringLabel *v23;
  void *v24;
  void *v25;
  CLKUIColoringLabel *v26;
  CLKUIColoringLabel *designatorLabel;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIImageView *idleImageView;
  uint64_t v45;
  UIImageView *snoozeImageView;
  __CFString *v47;
  id v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  UIImageView *v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  NTKRichComplicationRingProgressView *v58;
  double snoozeRingStrokeWidth;
  void *v60;
  uint64_t v61;
  NTKRichComplicationRingProgressView *snoozeProgressView;
  void *v63;
  id *v65;
  id *v66;
  void *v67;
  void *v68;
  _QWORD v70[4];
  id v71;
  id from;
  _QWORD aBlock[4];
  id v74;
  id location[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  objc_super v84;
  _QWORD v85[5];

  v85[2] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  v3 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v84, sel_initWithFamily_);
  v4 = v3;
  if (!v3)
    return v4;
  v3->_layout = 0;
  -[CDRichComplicationView device](v3, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_38);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_38);
  if (!WeakRetained)
    goto LABEL_6;
  v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_38);
  if (v7 != v5)
  {

LABEL_6:
    v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_38, v5);
    _LayoutConstants___previousCLKDeviceVersion_38 = objc_msgSend(v5, "version");

    ___LayoutConstants_block_invoke_35(v11, (uint64_t)v5);
    goto LABEL_7;
  }
  v8 = objc_msgSend(v5, "version");
  v9 = v8 == _LayoutConstants___previousCLKDeviceVersion_38;

  if (!v9)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_38);
  if (a3 == 12)
  {
    v13 = &_LayoutConstants___constantsGraphicExtraLarge_2;
  }
  else
  {
    if (a3 != 10)
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        _LayoutConstants_cold_1(a3, v12);

    }
    v13 = &_LayoutConstants___constantsGraphicCircular_2;
  }
  v14 = v13[6];
  v15 = v13[7];
  v16 = v13[4];
  v80 = v13[5];
  v81 = v14;
  v17 = v13[8];
  v82 = v15;
  v83 = v17;
  v18 = v13[2];
  v78 = v13[3];
  v79 = v16;
  v19 = *v13;
  v76 = v13[1];
  v77 = v18;
  *(_OWORD *)location = v19;

  *(_OWORD *)&v4->_layoutConstants.designatorLabelFontSize = v80;
  *(_OWORD *)&v4->_layoutConstants.designatorLabel12HourTimeLeadingLayoutBottom = v81;
  *(_OWORD *)&v4->_layoutConstants.snoozeIconTop = v82;
  *(_OWORD *)&v4->_layoutConstants.alarmSymbolPointSize = v83;
  *(_OWORD *)&v4->_layoutConstants.timeLabel12HourTimeLeadingLayoutBottom = v76;
  *(_OWORD *)&v4->_layoutConstants.timeLabel24HourLayoutFontSize = v77;
  *(_OWORD *)&v4->_layoutConstants.timeLabel24HourLayoutBottom = v78;
  *(_OWORD *)&v4->_layoutConstants.timeLabelSnoozeLayoutMaxWidth = v79;
  *(_OWORD *)&v4->_layoutConstants.timeLabel12HourLayoutFontSize = *(_OWORD *)location;

  objc_initWeak(location, v4);
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke;
  aBlock[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v74, location);
  v68 = _Block_copy(aBlock);
  v21 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E6BCA6E0);
  timeLabel = v4->_timeLabel;
  v4->_timeLabel = v21;

  -[CLKUIColoringLabel setInTimeTravel:](v4->_timeLabel, "setInTimeTravel:", 0);
  -[CLKUIColoringLabel setNeedsResizeHandler:](v4->_timeLabel, "setNeedsResizeHandler:", v68);
  -[CLKUIColoringLabel setHidden:](v4->_timeLabel, "setHidden:", 1);
  objc_initWeak(&from, v4);
  v23 = v4->_timeLabel;
  v70[0] = v20;
  v70[1] = 3221225472;
  v70[2] = __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke_2;
  v70[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v71, &from);
  -[CLKUIColoringLabel setNowProvider:](v23, "setNowProvider:", v70);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v4->_timeLabel, "setTextColor:", v24);

  -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v4->_timeLabel);

  v26 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E6BCA6E0);
  designatorLabel = v4->_designatorLabel;
  v4->_designatorLabel = v26;

  -[CLKUIColoringLabel setInTimeTravel:](v4->_designatorLabel, "setInTimeTravel:", 0);
  -[CLKUIColoringLabel setNeedsResizeHandler:](v4->_designatorLabel, "setNeedsResizeHandler:", v68);
  -[CLKUIColoringLabel setHidden:](v4->_designatorLabel, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v4->_layoutConstants.designatorLabelFontSize, *MEMORY[0x1E0DC1448]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "CLKFontWithAlternativePunctuation");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUIColoringLabel setFont:](v4->_designatorLabel, "setFont:", v67);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v4->_designatorLabel, "setTextColor:", v29);

  -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v4->_designatorLabel);

  if (-[NTKAlarmRichComplicationBaseCircularView _pairedDeviceSupportsComplicationSymbols](v4, "_pairedDeviceSupportsComplicationSymbols"))
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", v4->_layoutConstants.alarmSymbolPointSize, &v74, &v71);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v33;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_configurationWithHierarchicalColors:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "configurationByApplyingConfiguration:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("alarm"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", v4->_layoutConstants.snoozeSymbolPointSize);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("zzz"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "imageWithTintColor:renderingMode:", v41, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v38);
    idleImageView = v4->_idleImageView;
    v4->_idleImageView = (UIImageView *)v43;

    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v42);
    snoozeImageView = v4->_snoozeImageView;
    v4->_snoozeImageView = (UIImageView *)v45;

  }
  else
  {
    if (a3 == 12)
      v47 = CFSTR("graphicExtraLargeSnooze");
    else
      v47 = CFSTR("graphicCircularSnooze");
    v48 = objc_alloc(MEMORY[0x1E0DC3890]);
    if (a3 == 12)
      v49 = CFSTR("graphicExtraLargeAlarm");
    else
      v49 = CFSTR("graphicCircularAlarm");
    NTKImageNamed(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v48, "initWithImage:", v50, &v74, &v71);
    v52 = v4->_idleImageView;
    v4->_idleImageView = (UIImageView *)v51;

    v53 = objc_alloc(MEMORY[0x1E0DC3890]);
    NTKImageNamed(v47);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "initWithImage:", v31);
    v36 = v4->_snoozeImageView;
    v4->_snoozeImageView = (UIImageView *)v54;
  }

  -[UIImageView setHidden:](v4->_idleImageView, "setHidden:", 0);
  -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addSubview:", v4->_idleImageView);

  -[UIImageView setHidden:](v4->_snoozeImageView, "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v4->_snoozeImageView, "setTintColor:", v56);

  -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addSubview:", v4->_snoozeImageView);

  v58 = [NTKRichComplicationRingProgressView alloc];
  snoozeRingStrokeWidth = v4->_layoutConstants.snoozeRingStrokeWidth;
  -[CDRichComplicationView device](v4, "device");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[NTKRichComplicationRingProgressView initWithFamily:curveWidth:padding:forDevice:](v58, "initWithFamily:curveWidth:padding:forDevice:", a3, v60, snoozeRingStrokeWidth, 0.0);
  snoozeProgressView = v4->_snoozeProgressView;
  v4->_snoozeProgressView = (NTKRichComplicationRingProgressView *)v61;

  -[CDRichComplicationProgressView setFilterProvider:](v4->_snoozeProgressView, "setFilterProvider:", v4);
  -[CDRichComplicationProgressView setStyle:](v4->_snoozeProgressView, "setStyle:", 1);
  -[NTKRichComplicationRingProgressView setHidden:](v4->_snoozeProgressView, "setHidden:", 1);
  -[NTKRichComplicationCircularBaseView contentView](v4, "contentView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v4->_snoozeProgressView);

  objc_destroyWeak(v66);
  objc_destroyWeak(&from);

  objc_destroyWeak(v65);
  objc_destroyWeak(location);
  return v4;
}

void __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

id __59__NTKAlarmRichComplicationBaseCircularView_initWithFamily___block_invoke_2(uint64_t a1)
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

- (BOOL)_pairedDeviceSupportsComplicationSymbols
{
  void *v2;
  char v3;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningGloryGMOrLater");

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t layout;
  double *p_timeLabel12HourLayoutMaxWidth;
  double *p_timeLabel12HourDesignatorLeadingLayoutBottom;
  double designatorLabel12HourDesignatorLeadingLayoutBottom;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double designatorLabelMaxWidth;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v36, sel_layoutSubviews);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v32 = v5;
  v34 = v4;
  v7 = v6;
  v9 = v8;

  layout = self->_layout;
  switch(layout)
  {
    case 2uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel12HourLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel12HourDesignatorLeadingLayoutBottom;
      designatorLabel12HourDesignatorLeadingLayoutBottom = self->_layoutConstants.designatorLabel12HourDesignatorLeadingLayoutBottom;
      goto LABEL_9;
    case 3uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel24HourLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel24HourLayoutBottom;
      goto LABEL_7;
    case 4uLL:
      p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabelSnoozeLayoutMaxWidth;
      p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabelSnoozeLayoutBottom;
LABEL_7:
      designatorLabel12HourDesignatorLeadingLayoutBottom = 0.0;
      goto LABEL_9;
  }
  p_timeLabel12HourLayoutMaxWidth = &self->_layoutConstants.timeLabel12HourLayoutMaxWidth;
  p_timeLabel12HourDesignatorLeadingLayoutBottom = &self->_layoutConstants.timeLabel12HourTimeLeadingLayoutBottom;
  designatorLabel12HourDesignatorLeadingLayoutBottom = self->_layoutConstants.designatorLabel12HourTimeLeadingLayoutBottom;
LABEL_9:
  v14 = *p_timeLabel12HourLayoutMaxWidth;
  v15 = *p_timeLabel12HourDesignatorLeadingLayoutBottom;
  -[CLKUIColoringLabel setMaxWidth:](self->_timeLabel, "setMaxWidth:", *p_timeLabel12HourLayoutMaxWidth, v32, v34);
  -[CLKUIColoringLabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_timeLabel, "frame");
  v18 = v17;
  if (v16 < v14)
    v14 = v16;
  -[CLKUIColoringLabel font](self->_timeLabel, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ascender");
  *(float *)&v20 = v15 - v20;
  v21 = ceilf(*(float *)&v20);

  -[CLKUIColoringLabel setFrame:](self->_timeLabel, "setFrame:", (v7 - v14) * 0.5, v21, v14, v18);
  -[CLKUIColoringLabel sizeToFit](self->_designatorLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_designatorLabel, "frame");
  v24 = v23;
  if (v22 >= self->_layoutConstants.designatorLabelMaxWidth)
    designatorLabelMaxWidth = self->_layoutConstants.designatorLabelMaxWidth;
  else
    designatorLabelMaxWidth = v22;
  -[CLKUIColoringLabel font](self->_designatorLabel, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ascender");
  *(float *)&v27 = designatorLabel12HourDesignatorLeadingLayoutBottom - v27;
  v28 = ceilf(*(float *)&v27);

  -[CLKUIColoringLabel setFrame:](self->_designatorLabel, "setFrame:", (v7 - designatorLabelMaxWidth) * 0.5, v28, designatorLabelMaxWidth, v24);
  -[UIImageView sizeToFit](self->_idleImageView, "sizeToFit");
  -[UIImageView frame](self->_idleImageView, "frame");
  -[UIImageView setFrame:](self->_idleImageView, "setFrame:", (v7 - v29) * 0.5, (v9 - v30) * 0.5);
  -[UIImageView sizeToFit](self->_snoozeImageView, "sizeToFit");
  -[UIImageView frame](self->_snoozeImageView, "frame");
  -[UIImageView setFrame:](self->_snoozeImageView, "setFrame:", (v7 - v31) * 0.5, self->_layoutConstants.snoozeIconTop);
  -[NTKRichComplicationRingProgressView setFrame:](self->_snoozeProgressView, "setFrame:", v35, v33, v7, v9);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataStateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("NTKAlarmComplicationMetadataStateValue_Idle")))
  {
    objc_msgSend(v26, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataTimeTextProviderKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("NTKAlarmComplicationMetadataStateValue_Set")))
    {
      objc_msgSend(v26, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataDesignatorTextProviderKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataDesignatorExistsKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v8 && v10 && v13)
      {
        -[UIImageView setHidden:](self->_idleImageView, "setHidden:", 1);
        objc_msgSend(v26, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataDesignatorLeadsKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v16)
          v17 = 2;
        else
          v17 = 1;
        self->_layout = v17;
        -[CLKUIColoringLabel setHidden:](self->_timeLabel, "setHidden:", 0);
        -[CLKUIColoringLabel setTextProvider:](self->_timeLabel, "setTextProvider:", v8);
        objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], self->_layoutConstants.timeLabel12HourLayoutFontSize, *MEMORY[0x1E0DC1448]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "CLKFontWithAlternativePunctuation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKUIColoringLabel setFont:](self->_timeLabel, "setFont:", v19);

        -[CLKUIColoringLabel setHidden:](self->_designatorLabel, "setHidden:", 0);
        -[CLKUIColoringLabel setTextProvider:](self->_designatorLabel, "setTextProvider:", v10);
      }
      else
      {
        self->_layout = 3;
        -[UIImageView setHidden:](self->_idleImageView, "setHidden:", 1);
        -[CLKUIColoringLabel setHidden:](self->_timeLabel, "setHidden:", 0);
        -[CLKUIColoringLabel setTextProvider:](self->_timeLabel, "setTextProvider:", v8);
        objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], self->_layoutConstants.timeLabel24HourLayoutFontSize, *MEMORY[0x1E0DC1448]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "CLKFontWithAlternativePunctuation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CLKUIColoringLabel setFont:](self->_timeLabel, "setFont:", v25);

        -[CLKUIColoringLabel setHidden:](self->_designatorLabel, "setHidden:", 1);
      }
      -[UIImageView setHidden:](self->_snoozeImageView, "setHidden:", 1);
      -[NTKRichComplicationRingProgressView setHidden:](self->_snoozeProgressView, "setHidden:", 1);
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("NTKAlarmComplicationMetadataStateValue_Snooze")))
      {
LABEL_16:

        goto LABEL_17;
      }
      self->_layout = 4;
      -[UIImageView setHidden:](self->_idleImageView, "setHidden:", 1);
      -[CLKUIColoringLabel setHidden:](self->_timeLabel, "setHidden:", 0);
      -[CLKUIColoringLabel setTextProvider:](self->_timeLabel, "setTextProvider:", v8);
      -[CLKUIColoringLabel textProvider](self->_timeLabel, "textProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setPaused:", 0);

      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], self->_layoutConstants.timeLabelSnoozeLayoutFontSize, *MEMORY[0x1E0DC1448]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CLKFontWithAlternativePunctuation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setFont:](self->_timeLabel, "setFont:", v22);

      -[CLKUIColoringLabel setHidden:](self->_designatorLabel, "setHidden:", 1);
      -[UIImageView setHidden:](self->_snoozeImageView, "setHidden:", 0);
      -[NTKRichComplicationRingProgressView setHidden:](self->_snoozeProgressView, "setHidden:", 0);
      objc_msgSend(v26, "metadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataGaugeProviderKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CDRichComplicationProgressView setGaugeProvider:](self->_snoozeProgressView, "setGaugeProvider:", v10);
    }

    goto LABEL_16;
  }
  self->_layout = 0;
  -[UIImageView setHidden:](self->_idleImageView, "setHidden:", 0);
  -[CLKUIColoringLabel setHidden:](self->_timeLabel, "setHidden:", 1);
  -[CLKUIColoringLabel setHidden:](self->_designatorLabel, "setHidden:", 1);
  -[UIImageView setHidden:](self->_snoozeImageView, "setHidden:", 1);
  -[NTKRichComplicationRingProgressView setHidden:](self->_snoozeProgressView, "setHidden:", 1);
LABEL_17:
  -[NTKAlarmRichComplicationBaseCircularView setNeedsLayout](self, "setNeedsLayout");
  -[NTKRichComplicationCircularBaseView _updatePlatterColor](self, "_updatePlatterColor");

}

- (int64_t)_backgroundFilterStyle
{
  return 0;
}

- (int64_t)_foregroundFilterStyle
{
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
  v13.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v13, sel_transitionToMonochromeWithFraction_);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKAlarmRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIImageView layer](self->_idleImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v6);

    -[CLKUIColoringLabel layer](self->_designatorLabel, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFilters:", v6);

    -[UIImageView layer](self->_snoozeImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v6);

  }
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filtersForView:style:fraction:", self, -[NTKAlarmRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"), a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CLKUIColoringLabel layer](self->_timeLabel, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFilters:", v11);

  }
  -[CDRichComplicationProgressView transitionToMonochromeWithFraction:](self->_snoozeProgressView, "transitionToMonochromeWithFraction:", a3);

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
  v11.super_class = (Class)NTKAlarmRichComplicationBaseCircularView;
  -[NTKRichComplicationCircularBaseView updateMonochromeColor](&v11, sel_updateMonochromeColor);
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKAlarmRichComplicationBaseCircularView _backgroundFilterStyle](self, "_backgroundFilterStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIImageView layer](self->_idleImageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v4);

    -[CLKUIColoringLabel layer](self->_designatorLabel, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v4);

    -[UIImageView layer](self->_snoozeImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", v4);

  }
  -[CDRichComplicationView filterProvider](self, "filterProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:", self, -[NTKAlarmRichComplicationBaseCircularView _foregroundFilterStyle](self, "_foregroundFilterStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CLKUIColoringLabel layer](self->_timeLabel, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v9);

  }
  -[CDRichComplicationProgressView updateMonochromeColor](self->_snoozeProgressView, "updateMonochromeColor");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snoozeProgressView, 0);
  objc_storeStrong((id *)&self->_snoozeImageView, 0);
  objc_storeStrong((id *)&self->_designatorLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_idleImageView, 0);
}

@end
