@implementation NTKExtraLargeTimeView

- (NTKExtraLargeTimeView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NTKExtraLargeTimeView *v11;
  NTKExtraLargeTimeView *v12;
  CLKDevice **p_device;
  uint64_t v14;
  NTKDigitalTimeLabel *timeHourView;
  NTKDigitalTimeLabel *v16;
  void *v17;
  uint64_t v18;
  NTKDigitalTimeLabel *timeMinuteView;
  NTKDigitalTimeLabel *v20;
  void *v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NTKExtraLargeTimeView;
  v11 = -[NTKExtraLargeTimeView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_device = &v11->_device;
    objc_storeStrong((id *)&v11->_device, a4);
    v12->_numberSystem = -1;
    +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 1024, *p_device);
    v14 = objc_claimAutoreleasedReturnValue();
    timeHourView = v12->_timeHourView;
    v12->_timeHourView = (NTKDigitalTimeLabel *)v14;

    v16 = v12->_timeHourView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeLabel setTextColor:](v16, "setTextColor:", v17);

    -[NTKExtraLargeTimeView addSubview:](v12, "addSubview:", v12->_timeHourView);
    +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 2057, *p_device);
    v18 = objc_claimAutoreleasedReturnValue();
    timeMinuteView = v12->_timeMinuteView;
    v12->_timeMinuteView = (NTKDigitalTimeLabel *)v18;

    v20 = v12->_timeMinuteView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeLabel setTextColor:](v20, "setTextColor:", v21);

    -[NTKExtraLargeTimeView addSubview:](v12, "addSubview:", v12->_timeMinuteView);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v12, (CFNotificationCallback)_handleNumbersChangedNotification, CFSTR("AppleNumberPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[NTKExtraLargeTimeView _configureTimeLabelsFont](v12, "_configureTimeLabelsFont");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKExtraLargeTimeView setBackgroundColor:](v12, "setBackgroundColor:", v23);

  }
  return v12;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AppleNumberPreferencesChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)NTKExtraLargeTimeView;
  -[NTKExtraLargeTimeView dealloc](&v4, sel_dealloc);
}

- (NSArray)fontScaleFactorForNumberSystemOverrides
{
  NSArray *fontScaleFactorForNumberSystemOverrides;

  fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  if (!fontScaleFactorForNumberSystemOverrides)
  {
    self->_fontScaleFactorForNumberSystemOverrides = (NSArray *)&unk_1E6CA8C20;

    fontScaleFactorForNumberSystemOverrides = self->_fontScaleFactorForNumberSystemOverrides;
  }
  return fontScaleFactorForNumberSystemOverrides;
}

- (void)layoutSubviews
{
  _BOOL4 IsBoldTextEnabled;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double *v10;
  double v11;
  double *v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  _LayoutConstants_3(self->_device, (uint64_t)&v19);
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  -[NTKExtraLargeTimeView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = (double *)&v22 + 1;
  if (!IsBoldTextEnabled)
    v8 = (double *)&v20 + 1;
  v9 = *v8;
  if (IsBoldTextEnabled)
    v10 = (double *)&v23;
  else
    v10 = (double *)&v21;
  v11 = *v10;
  if (self->_statusBarVisible)
  {
    v12 = (double *)&v23 + 1;
    if (!IsBoldTextEnabled)
      v12 = (double *)&v21 + 1;
    v9 = v9 + *v12;
    v13 = (double *)&v24;
    if (!IsBoldTextEnabled)
      v13 = (double *)&v22;
    v11 = v11 + *v13;
  }
  v14 = *(double *)&v20;
  -[CLKUITimeLabel sizeToFit](self->_timeHourView, "sizeToFit");
  -[CLKUITimeLabel sizeToFit](self->_timeMinuteView, "sizeToFit");
  -[NTKDigitalTimeLabel frame](self->_timeHourView, "frame");
  v16 = v7 * 0.5;
  -[NTKDigitalTimeLabel setFrame:](self->_timeHourView, "setFrame:", v5 - v15 - v14, v9, v15, v16);
  if (self->_numberSystem == 13)
    v17 = 0.0;
  else
    v17 = v11;
  -[NTKDigitalTimeLabel frame](self->_timeMinuteView, "frame");
  -[NTKDigitalTimeLabel setFrame:](self->_timeMinuteView, "setFrame:", v5 - v18 - v14, v16 + v17, v18, v16);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKExtraLargeTimeView;
  v4 = a3;
  -[NTKExtraLargeTimeView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[NTKExtraLargeTimeView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legibilityWeight");
  v7 = objc_msgSend(v4, "legibilityWeight");

  if (v6 != v7)
  {
    -[NTKExtraLargeTimeView _configureTimeLabelsFont](self, "_configureTimeLabelsFont");
    -[NTKExtraLargeTimeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTopColor:(id)a3
{
  -[NTKDigitalTimeLabel setTextColor:](self->_timeHourView, "setTextColor:", a3);
}

- (void)setBottomColor:(id)a3
{
  -[NTKDigitalTimeLabel setTextColor:](self->_timeMinuteView, "setTextColor:", a3);
}

- (void)_configureTimeLabelsFont
{
  id v3;

  -[NTKExtraLargeTimeView _timeLabelFont](self, "_timeLabelFont");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUITimeLabel setTimeFont:designatorFont:](self->_timeHourView, "setTimeFont:designatorFont:", v3, v3);
  -[CLKUITimeLabel setTimeFont:designatorFont:](self->_timeMinuteView, "setTimeFont:designatorFont:", v3, v3);

}

- (id)_timeLabelFont
{
  _BOOL4 IsBoldTextEnabled;
  double *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _OWORD v13[5];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  _LayoutConstants_3(self->_device, (uint64_t)v13);
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v4 = (double *)v13 + 1;
  if (!IsBoldTextEnabled)
    v4 = (double *)v13;
  v5 = *v4;
  if (NTKShowIndicScriptNumerals(self->_device))
  {
    if (self->_numberSystem != -1)
    {
      -[NTKExtraLargeTimeView fontScaleFactorForNumberSystemOverrides](self, "fontScaleFactorForNumberSystemOverrides");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", self->_numberSystem);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");

      CLKRoundForDevice();
      v5 = v8;
    }
    +[NTKSFCompactFont numericSoftFontOfSize:weight:](NTKSFCompactFont, "numericSoftFontOfSize:weight:", v5, *MEMORY[0x1E0DC1438]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944D0], "compactSoftFontOfSize:weight:", v5, *MEMORY[0x1E0DC1438]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKLocaleCurrentNumberSystem() == 2)
    {
      objc_msgSend(v9, "CLKFontWithMonospacedNumbers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "CLKFontWithAlternativePunctuation");
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
  }
  return v9;
}

- (void)setStatusBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  if (self->_statusBarVisible != a3)
  {
    v4 = a4;
    self->_statusBarVisible = a3;
    -[NTKExtraLargeTimeView setNeedsLayout](self, "setNeedsLayout");
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__NTKExtraLargeTimeView_setStatusBarVisible_animated___block_invoke;
    aBlock[3] = &unk_1E6BCD5F0;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v7 = v6;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.2);
    else
      (*((void (**)(void *))v6 + 2))(v6);

  }
}

uint64_t __54__NTKExtraLargeTimeView_setStatusBarVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  NTKDigitalTimeLabel *timeHourView;
  id v6;
  void *v7;
  id v8;

  timeHourView = self->_timeHourView;
  v6 = a3;
  -[CLKUITimeLabel timeFormatter](timeHourView, "timeFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverrideDate:", v6);

  -[CLKUITimeLabel timeFormatter](self->_timeMinuteView, "timeFormatter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideDate:", v6);

}

- (void)setTimeOffset:(double)a3
{
  -[NTKDigitalTimeLabel setTimeOffset:](self->_timeHourView, "setTimeOffset:");
  -[NTKDigitalTimeLabel setTimeOffset:](self->_timeMinuteView, "setTimeOffset:", a3);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
  -[CLKUITimeLabel setPaused:](self->_timeHourView, "setPaused:");
  -[CLKUITimeLabel setPaused:](self->_timeMinuteView, "setPaused:", self->_frozen);
}

- (void)_updateNumbers
{
  -[NTKExtraLargeTimeView _configureTimeLabelsFont](self, "_configureTimeLabelsFont");
  -[NTKExtraLargeTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  void *v5;
  void *v6;

  self->_numberSystem = a3;
  -[NTKExtraLargeTimeView timeHourView](self, "timeHourView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForcedNumberSystem:", a3);

  -[NTKExtraLargeTimeView timeMinuteView](self, "timeMinuteView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setForcedNumberSystem:", a3);

  -[NTKExtraLargeTimeView _configureTimeLabelsFont](self, "_configureTimeLabelsFont");
  -[NTKExtraLargeTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFontScaleFactorForNumberSystemOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, a3);
}

- (NTKDigitalTimeLabel)timeHourView
{
  return self->_timeHourView;
}

- (void)setTimeHourView:(id)a3
{
  objc_storeStrong((id *)&self->_timeHourView, a3);
}

- (NTKDigitalTimeLabel)timeMinuteView
{
  return self->_timeMinuteView;
}

- (void)setTimeMinuteView:(id)a3
{
  objc_storeStrong((id *)&self->_timeMinuteView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMinuteView, 0);
  objc_storeStrong((id *)&self->_timeHourView, 0);
  objc_storeStrong((id *)&self->_fontScaleFactorForNumberSystemOverrides, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
