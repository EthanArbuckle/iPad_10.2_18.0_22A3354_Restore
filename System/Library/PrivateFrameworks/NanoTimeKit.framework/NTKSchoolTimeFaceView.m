@implementation NTKSchoolTimeFaceView

- (NTKSchoolTimeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  NTKSchoolTimeFaceView *v5;
  NTKSchoolTimeFaceView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKSchoolTimeFaceView;
  v5 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v8, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[NTKSchoolTimeFaceView setupUI](v5, "setupUI");
  return v6;
}

- (void)_unloadSnapshotContentViews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKSchoolTimeFaceView;
  -[NTKFaceView _unloadSnapshotContentViews](&v2, sel__unloadSnapshotContentViews);
}

- (void)dealloc
{
  objc_super v3;

  -[NTKSchoolTimeFaceView _stopClockUpdates](self, "_stopClockUpdates");
  -[NTKSchoolTimeFaceView _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)NTKSchoolTimeFaceView;
  -[NTKFaceView dealloc](&v3, sel_dealloc);
}

- (void)_setupNotifications
{
  -[NTKSchoolTimeFaceView _startObserving](self, "_startObserving");
  -[NTKSchoolTimeFaceView _startClockUpdates](self, "_startClockUpdates");
}

- (void)setupUI
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NTKSchoolTimeDialView *v12;
  NTKSchoolTimeDialView *v13;
  NTKSchoolTimeDialView *dialView;
  void *v15;
  NTKAnalogHandsView *v16;
  void *v17;
  NTKAnalogHandsView *v18;
  NTKAnalogHandsView *handsView;
  NTKAnalogHandsView *v20;
  NTKAnalogHandsView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDateFormatter *v26;
  NSDateFormatter *formatter;
  NSDateFormatter *v28;
  void *v29;
  NSDateFormatter *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UILabel *v37;
  UILabel *dateLabel;
  UILabel *v39;
  double v40;
  void *v41;
  UILabel *v42;
  void *v43;
  void *v44;
  CLKClockTimer *v45;
  CLKClockTimer *clockTimer;
  void *v47;
  void *v48;
  void *v49;
  NTKDigitalTimeLabel *v50;
  void *v51;
  NTKDigitalTimeLabel *v52;
  NTKDigitalTimeLabel *digitalTimeLabel;
  NTKDigitalTimeLabel *v54;
  void *v55;
  NTKDigitalTimeLabel *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _OWORD v62[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  double v67;

  v67 = 0.0;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  memset(v62, 0, sizeof(v62));
  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_4(v3, (uint64_t)v62);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSchoolTimeFaceView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[NTKFaceView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKAnalogUtilities dialSizeForDevice:](NTKAnalogUtilities, "dialSizeForDevice:", v7);
  v9 = v8;
  v11 = v10;

  v12 = [NTKSchoolTimeDialView alloc];
  v13 = -[NTKSchoolTimeDialView initWithFrame:ringWidth:](v12, "initWithFrame:ringWidth:", v5, v6, v9, v11, v67);
  dialView = self->_dialView;
  self->_dialView = v13;

  -[NTKFaceView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_dialView);

  v16 = [NTKAnalogHandsView alloc];
  -[NTKFaceView device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NTKAnalogHandsView initForDevice:](v16, "initForDevice:", v17);
  handsView = self->_handsView;
  self->_handsView = v18;

  v20 = self->_handsView;
  -[NTKSchoolTimeFaceView bounds](self, "bounds");
  -[NTKAnalogHandsView setFrame:](v20, "setFrame:");
  v21 = self->_handsView;
  +[NTKSchoolTimeFaceView schoolTimeColor](NTKSchoolTimeFaceView, "schoolTimeColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView setInlayColor:](v21, "setInlayColor:", v22);

  -[CLKUIAnalogHandsView secondHandView](self->_handsView, "secondHandView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKSchoolTimeFaceView secondHandColor](NTKSchoolTimeFaceView, "secondHandColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setColor:", v24);

  -[NTKFaceView contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", self->_handsView);

  -[NTKFaceView setTimeView:](self, "setTimeView:", self->_handsView);
  v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  formatter = self->_formatter;
  self->_formatter = v26;

  v28 = self->_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setTimeZone:](v28, "setTimeZone:", v29);

  v30 = self->_formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter setLocale:](v30, "setLocale:", v31);

  -[NSDateFormatter setDateFormat:](self->_formatter, "setDateFormat:", CFSTR("EEE d"));
  v32 = objc_alloc(MEMORY[0x1E0DC3990]);
  v33 = *MEMORY[0x1E0C9D648];
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v36 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v37 = (UILabel *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E0C9D648], v34, v35, v36);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v37;

  v39 = self->_dateLabel;
  v40 = *MEMORY[0x1E0DC1438];
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *((double *)v62 + 1), *MEMORY[0x1E0DC1438]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v39, "setFont:", v41);

  -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 1);
  v42 = self->_dateLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v42, "setTextColor:", v43);

  -[NTKFaceView contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", self->_dateLabel);

  v45 = (CLKClockTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94130]), "initWithIdentifier:", CFSTR("SchoolTime"));
  clockTimer = self->_clockTimer;
  self->_clockTimer = v45;

  -[CLKClockTimer pause](self->_clockTimer, "pause");
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *(double *)&v63, v40);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceView device](self, "device");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v61, v47, v33, v34, v35, v36, 0.0, 0.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *((double *)&v63 + 1), v40);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setDesignatorFont:", v49);

  v50 = [NTKDigitalTimeLabel alloc];
  -[NTKFaceView device](self, "device");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:clockTimer:](v50, "initWithTimeLabelOptions:forDevice:clockTimer:", 1, v51, self->_clockTimer);
  digitalTimeLabel = self->_digitalTimeLabel;
  self->_digitalTimeLabel = v52;

  -[NTKDigitalTimeLabel setStyle:](self->_digitalTimeLabel, "setStyle:", v48);
  v54 = self->_digitalTimeLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setColor:](v54, "setColor:", v55);

  -[CLKUITimeLabel setShowsDesignator:](self->_digitalTimeLabel, "setShowsDesignator:", 1);
  v56 = self->_digitalTimeLabel;
  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "timeOffset");
  -[NTKDigitalTimeLabel setTimeOffset:](v56, "setTimeOffset:");

  -[CLKUITimeLabel timeFormatter](self->_digitalTimeLabel, "timeFormatter");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setSuppressesDesignatorWhitespace:", 1);

  -[NTKFaceView contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "insertSubview:belowSubview:", self->_digitalTimeLabel, self->_handsView);

  -[NTKSchoolTimeFaceView _setupNameLabel](self, "_setupNameLabel");
  +[NTKDate faceDate](NTKDate, "faceDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSchoolTimeFaceView _updateTimeAndDate:animated:](self, "_updateTimeAndDate:animated:", v60, 0);

  -[NTKSchoolTimeFaceView bringSubviewToFront:](self, "bringSubviewToFront:", self->_handsView);
}

- (void)_setupNameLabel
{
  void *v3;
  id v4;
  UILabel *v5;
  _QWORD *p_nameLabel;
  UILabel *nameLabel;
  UILabel *v8;
  void *v9;
  CLKUICurvedColoringLabel *v10;
  CLKUICurvedColoringLabel *curvedNameLabel;
  CLKUICurvedColoringLabel *v12;
  void *v13;
  void *v14;
  id v15;
  _OWORD v16[4];
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  -[NTKFaceView device](self, "device");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  memset(v16, 0, sizeof(v16));
  _LayoutConstants_4(v15, (uint64_t)v16);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *(double *)&v17, *MEMORY[0x1E0DC1438]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "deviceCategory") == 1)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    p_nameLabel = &self->_nameLabel;
    nameLabel = self->_nameLabel;
    self->_nameLabel = v5;

    -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 1);
    v8 = self->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setFont:](self->_nameLabel, "setFont:", v3);
  }
  else
  {
    v10 = (CLKUICurvedColoringLabel *)objc_opt_new();
    p_nameLabel = &self->_curvedNameLabel;
    curvedNameLabel = self->_curvedNameLabel;
    self->_curvedNameLabel = v10;

    -[CLKUICurvedColoringLabel setAlpha:](self->_curvedNameLabel, "setAlpha:", 1.0);
    -[CLKUICurvedColoringLabel setCenterAngle:](self->_curvedNameLabel, "setCenterAngle:", 0.0);
    -[CLKUICurvedColoringLabel setCircleRadius:](self->_curvedNameLabel, "setCircleRadius:", *(double *)&v18 * 0.5);
    v12 = self->_curvedNameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUICurvedColoringLabel setColor:](v12, "setColor:", v13);

    -[CLKUICurvedColoringLabel setFont:](self->_curvedNameLabel, "setFont:", v3);
    -[CLKUICurvedColoringLabel setInterior:](self->_curvedNameLabel, "setInterior:", 1);
    -[CLKUICurvedColoringLabel setMaxAngularWidth:](self->_curvedNameLabel, "setMaxAngularWidth:", NTKWhistlerBezelCircularViewDefaultMaxAngularWidth());
    -[CLKUICurvedColoringLabel setTracking:](self->_curvedNameLabel, "setTracking:", *((double *)&v18 + 1));
    -[CLKUICurvedColoringLabel setUppercase:](self->_curvedNameLabel, "setUppercase:", 1);
    -[CLKUICurvedColoringLabel setUsesLegibility:](self->_curvedNameLabel, "setUsesLegibility:", 0);
  }
  -[NTKFaceView contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", *p_nameLabel);

}

- (void)_layoutCurvedNameLabel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BYTE v11[72];
  double v12;

  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_4(v3, (uint64_t)v11);
  v4 = v12;

  -[CLKUICurvedColoringLabel sizeToFit](self->_curvedNameLabel, "sizeToFit");
  v9 = 0.0;
  v10 = 0.0;
  -[CLKUICurvedColoringLabel getTextCenter:startAngle:endAngle:](self->_curvedNameLabel, "getTextCenter:startAngle:endAngle:", &v9, 0, 0);
  v5 = MEMORY[0x1BCCA72B8](-[NTKSchoolTimeFaceView bounds](self, "bounds"));
  v6 = v5 - v9 + 0.0;
  v8 = v4 + v7 - v10;
  -[CLKUICurvedColoringLabel frame](self->_curvedNameLabel, "frame");
  -[CLKUICurvedColoringLabel setFrame:](self->_curvedNameLabel, "setFrame:", v6, v8);
}

- (void)_tearDownUI
{
  -[NTKSchoolTimeDialView removeFromSuperview](self->_dialView, "removeFromSuperview");
  -[NTKAnalogHandsView removeFromSuperview](self->_handsView, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_dateLabel, "removeFromSuperview");
  -[NTKDigitalTimeLabel removeFromSuperview](self->_digitalTimeLabel, "removeFromSuperview");
  -[CLKUICurvedColoringLabel removeFromSuperview](self->_curvedNameLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_nameLabel, "removeFromSuperview");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MinY;
  double v10;
  double v11;
  double v12;
  UILabel *dateLabel;
  void *v14;
  double v15;
  NTKDigitalTimeLabel *digitalTimeLabel;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  NTKAnalogHandsView *handsView;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;

  v35.receiver = self;
  v35.super_class = (Class)NTKSchoolTimeFaceView;
  -[NTKFaceView layoutSubviews](&v35, sel_layoutSubviews);
  v34 = 0.0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_4(v3, (uint64_t)&v28);

  v4 = MEMORY[0x1BCCA72B8](-[NTKSchoolTimeFaceView bounds](self, "bounds"));
  v6 = v5;
  v7 = v34;
  v8 = *((double *)&v31 + 1);
  -[NTKSchoolTimeDialView setCenter:](self->_dialView, "setCenter:");
  -[NTKSchoolTimeDialView frame](self->_dialView, "frame");
  MinY = CGRectGetMinY(v36);
  -[NTKSchoolTimeDialView bounds](self->_dialView, "bounds");
  v11 = v10 + v7 * -0.5 * 2.0 - v8 * 2.0;
  v12 = MEMORY[0x1BCCA72B8](-[NTKSchoolTimeFaceView bounds](self, "bounds")) + v11 * -0.5;
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[UILabel font](dateLabel, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = NTKSingleLineHeight((uint64_t)v14, 0);

    -[UILabel setFrame:](self->_dateLabel, "setFrame:", v12, *(double *)&v29 + MinY + *(double *)&v28 - v15, v11, v15);
  }
  digitalTimeLabel = self->_digitalTimeLabel;
  if (digitalTimeLabel)
  {
    -[CLKUITimeLabel font](digitalTimeLabel, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = NTKSingleLineHeight((uint64_t)v17, 0);

    -[NTKDigitalTimeLabel setFrame:](self->_digitalTimeLabel, "setFrame:", v12, *(double *)&v31 + MinY + *((double *)&v29 + 1) - v18, v11, v18);
  }
  -[NTKFaceView device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "deviceCategory");

  if (v20 == 1)
  {
    -[NTKSchoolTimeDialView frame](self->_dialView, "frame");
    MaxY = CGRectGetMaxY(v37);
    v22 = MaxY + *((double *)&v32 + 1);
    -[NTKSchoolTimeFaceView bounds](self, "bounds");
    v24 = v23;
    -[NTKSchoolTimeFaceView bounds](self, "bounds");
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, v22, v24, v25 - MaxY);
  }
  else
  {
    -[NTKSchoolTimeFaceView _layoutCurvedNameLabel](self, "_layoutCurvedNameLabel");
  }
  -[NTKAnalogHandsView setCenter:](self->_handsView, "setCenter:", v4, v6);
  handsView = self->_handsView;
  -[NTKSchoolTimeFaceView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](handsView, "ntk_setBoundsAndPositionFromFrame:");
  -[NTKFaceView contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bringSubviewToFront:", self->_handsView);

}

- (void)_applyDataMode
{
  int64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKSchoolTimeFaceView;
  -[NTKFaceView _applyDataMode](&v5, sel__applyDataMode);
  v3 = -[NTKFaceView dataMode](self, "dataMode");
  switch(v3)
  {
    case 1:
      -[NTKFaceView setOverrideDate:duration:](self, "setOverrideDate:duration:", 0, 0.0);
      -[NTKSchoolTimeFaceView _startClockUpdates](self, "_startClockUpdates");
      return;
    case 3:
      NTKIdealizedDate();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKFaceView setOverrideDate:duration:](self, "setOverrideDate:duration:", v4, 0.0);

      goto LABEL_7;
    case 2:
LABEL_7:
      -[NTKSchoolTimeFaceView _stopClockUpdates](self, "_stopClockUpdates");
      break;
  }
}

- (void)_applyFrozen
{
  _BOOL8 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKSchoolTimeFaceView;
  -[NTKFaceView _applyFrozen](&v4, sel__applyFrozen);
  v3 = -[NTKFaceView isFrozen](self, "isFrozen");
  -[CLKUIAnalogHandsView setFrozen:](self->_handsView, "setFrozen:", v3);
  -[NTKDigitalTimeLabel setFrozen:](self->_digitalTimeLabel, "setFrozen:", v3);
}

- (void)setName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  UILabel *nameLabel;
  CLKUICurvedColoringLabel *curvedNameLabel;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0C944B0];
  v5 = a3;
  objc_msgSend(v4, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceCategory");

  if (v7 == 1)
  {
    nameLabel = self->_nameLabel;
    objc_msgSend(v5, "uppercaseString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[UILabel setText:](nameLabel, "setText:", v13);
  }
  else
  {
    curvedNameLabel = self->_curvedNameLabel;
    v10 = (void *)MEMORY[0x1E0C94530];
    objc_msgSend(v5, "uppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "textProviderWithText:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUICurvedColoringLabel setTextProvider:](curvedNameLabel, "setTextProvider:", v12);

    -[NTKSchoolTimeFaceView _layoutCurvedNameLabel](self, "_layoutCurvedNameLabel");
  }
}

- (void)_setDate:(id)a3
{
  UILabel *dateLabel;
  void *v4;
  id v5;

  dateLabel = self->_dateLabel;
  -[NSDateFormatter stringFromDate:](self->_formatter, "stringFromDate:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](dateLabel, "setText:", v4);

}

- (void)_startClockUpdates
{
  CLKClockTimer *clockTimer;
  CLKClockTimerToken *v4;
  CLKClockTimerToken *clockTimerToken;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, id *);
  void *v9;
  id v10;
  id location;

  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    clockTimer = self->_clockTimer;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke;
    v9 = &unk_1E6BCED08;
    objc_copyWeak(&v10, &location);
    -[CLKClockTimer startUpdatesWithUpdateFrequency:withHandler:identificationLog:](clockTimer, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, &v6, &__block_literal_global_28);
    v4 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  -[CLKClockTimer unpause](self->_clockTimer, "unpause", v6, v7, v8, v9);
}

void __43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  _QWORD *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTimeForRealTime:", *a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_timeDidUpdate:", v7);

    v8 = (void *)WeakRetained[110];
    +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeOffset");
    objc_msgSend(v8, "setTimeOffset:");

  }
}

const __CFString *__43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke_31()
{
  return CFSTR("NTKSchoolTimeViewController");
}

- (void)_stopClockUpdates
{
  CLKClockTimerToken *clockTimerToken;

  -[CLKClockTimer pause](self->_clockTimer, "pause");
  if (self->_clockTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_clockTimer, "stopUpdatesForToken:");
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)_timeDidUpdate:(id)a3
{
  -[NTKSchoolTimeFaceView _updateTimeAndDate:animated:](self, "_updateTimeAndDate:animated:", a3, 1);
}

- (void)_updateTimeAndDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NTKSchoolTimeDialView *dialView;
  id v7;

  v4 = a4;
  dialView = self->_dialView;
  v7 = a3;
  -[NTKSchoolTimeDialView setActiveHour:animated:](dialView, "setActiveHour:animated:", NTKDateHourIn12HourTime(v7), v4);
  -[NTKSchoolTimeFaceView _setDate:](self, "_setDate:", v7);

}

- (void)_startObserving
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleChangeNotification, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleChangeNotification, *MEMORY[0x1E0DC4838], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleChangeNotification, CFSTR("NTKTimeOffsetChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleChangeNotification, *MEMORY[0x1E0C99690], 0);

}

- (void)_stopObserving
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("NTKTimeOffsetChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);

}

- (void)_handleChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NTKSchoolTimeFaceView__handleChangeNotification__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__NTKSchoolTimeFaceView__handleChangeNotification__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[NTKDate faceDate](NTKDate, "faceDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateTimeAndDate:animated:", v2, 1);

}

+ (id)schoolTimeColor
{
  if (schoolTimeColor_onceToken != -1)
    dispatch_once(&schoolTimeColor_onceToken, &__block_literal_global_39);
  return (id)schoolTimeColor___color;
}

void __40__NTKSchoolTimeFaceView_schoolTimeColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.905882353, 0.733333333, 0.125490196, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)schoolTimeColor___color;
  schoolTimeColor___color = v0;

}

+ (id)secondHandColor
{
  if (secondHandColor_onceToken != -1)
    dispatch_once(&secondHandColor_onceToken, &__block_literal_global_40);
  return (id)secondHandColor___color;
}

void __40__NTKSchoolTimeFaceView_secondHandColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.894117647, 0.592156863, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secondHandColor___color;
  secondHandColor___color = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_clockTimer, 0);
  objc_storeStrong((id *)&self->_curvedNameLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabel, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
}

@end
