@implementation MTUIWorldClockCellView

+ (double)defaultHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  double v14;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 36.0);
  v5 = v4;
  objc_msgSend(v3, "_scaledValueForValue:", 33.0);
  v7 = v6;
  objc_msgSend(v2, "_scaledValueForValue:", 27.0);
  v9 = v5 + v7 + v8;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_defaultTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v3, "_scaledValueForValue:", 16.0);
    v9 = v9 + v14 + 40.0;
  }

  return v9;
}

- (MTUIWorldClockCellView)initWithFrame:(CGRect)a3
{
  MTUIWorldClockCellView *v3;
  MTUIWorldClockCellView *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  MTUIDigitalClockLabel *v8;
  MTUIDigitalClockLabel *digitalClock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  UILabel *nameLabel;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *combinedLabel;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MTUIWorldClockCellView;
  v3 = -[MTUIWorldClockCellView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTUIWorldClockCellView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_significantTimeChange_, *MEMORY[0x24BDF75A0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_localeChange_, *MEMORY[0x24BDBCA70], 0);

    v7 = -[UIView mtui_isRTL](v4, "mtui_isRTL");
    v8 = objc_alloc_init(MTUIDigitalClockLabel);
    digitalClock = v4->_digitalClock;
    v4->_digitalClock = v8;

    objc_msgSend(MEMORY[0x24BDF6A70], "mtui_thinTimeFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setFont:](v4->_digitalClock, "setFont:", v10);

    objc_msgSend(MEMORY[0x24BDF6A70], "mtui_defaultTimeDesignatorFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setTimeDesignatorFont:](v4->_digitalClock, "setTimeDesignatorFont:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setTextColor:](v4->_digitalClock, "setTextColor:", v12);

    -[MTUIDateLabel dateLabel](v4->_digitalClock, "dateLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v7)
      v15 = 0;
    else
      v15 = 2;
    if (v7)
      v16 = 8;
    else
      v16 = 7;
    objc_msgSend(v13, "setTextAlignment:", v15);

    -[MTUIWorldClockCellView addSubview:](v4, "addSubview:", v4->_digitalClock);
    v17 = objc_alloc(MEMORY[0x24BDF6B68]);
    v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v18;

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_primaryTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_nameLabel, "setBackgroundColor:", v21);

    -[UILabel setContentMode:](v4->_nameLabel, "setContentMode:", v16);
    -[MTUIWorldClockCellView addSubview:](v4, "addSubview:", v4->_nameLabel);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    combinedLabel = v4->_combinedLabel;
    v4->_combinedLabel = v22;

    objc_msgSend(MEMORY[0x24BDF6950], "mtui_secondaryTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_combinedLabel, "setTextColor:", v24);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v4->_combinedLabel, "setBackgroundColor:", v25);

    -[UILabel setContentMode:](v4->_combinedLabel, "setContentMode:", v16);
    -[MTUIWorldClockCellView addSubview:](v4, "addSubview:", v4->_combinedLabel);
    v4->_shouldStackViews = 0;
    -[MTUIWorldClockCellView _configureFonts](v4, "_configureFonts");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel_handleTextSizeChange_, *MEMORY[0x24BDF7670], 0);

  }
  return v4;
}

- (void)_configureFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MTUIWorldClockCellView updateLabelAdjustFontSize](self, "updateLabelAdjustFontSize");
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v5);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7808]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_combinedLabel, "setFont:", v9);

}

- (void)updateLabelAdjustFontSize
{
  _BOOL8 v3;

  v3 = !self->_shouldStackViews;
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_nameLabel, "setAdjustsFontSizeToFitWidth:", v3);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_combinedLabel, "setAdjustsFontSizeToFitWidth:", v3);
}

- (void)handleTextSizeChange:(id)a3
{
  gLabelMetrics_0 = 0;
  -[MTUIWorldClockCellView _configureFonts](self, "_configureFonts", a3);
  -[MTUIWorldClockCellView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double rect;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  if ((gLabelMetrics_0 & 1) == 0)
  {
    gLabelMetrics_0 = 1;
    -[UILabel effectiveLayoutSizeFittingSize:](self->_nameLabel, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
    gLabelMetrics_1 = v3;
    -[UILabel effectiveFirstBaselineOffsetFromTop](self->_nameLabel, "effectiveFirstBaselineOffsetFromTop");
    gLabelMetrics_2 = v4;
    -[UILabel font](self->_nameLabel, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_scaledValueForValue:", 33.0);
    gLabelMetrics_3 = v6;

    -[UILabel effectiveLayoutSizeFittingSize:](self->_combinedLabel, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
    gLabelMetrics_4 = v7;
    -[UILabel effectiveFirstBaselineOffsetFromTop](self->_combinedLabel, "effectiveFirstBaselineOffsetFromTop");
    gLabelMetrics_5 = v8;
    -[UILabel font](self->_combinedLabel, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", 36.0);
    gLabelMetrics_6 = v10;

  }
  v48.receiver = self;
  v48.super_class = (Class)MTUIWorldClockCellView;
  -[MTUIWorldClockCellView layoutSubviews](&v48, sel_layoutSubviews);
  -[MTUIWorldClockCellView layoutMargins](self, "layoutMargins");
  v12 = v11;
  v14 = v13;
  -[MTUIWorldClockCellView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = -[UIView mtui_isRTL](self, "mtui_isRTL");
  v43 = *(double *)&gLabelMetrics_5;
  v44 = *(double *)&gLabelMetrics_6;
  v41 = *(double *)&gLabelMetrics_2;
  v42 = *(double *)&gLabelMetrics_3;
  if (v23)
    v24 = v14;
  else
    v24 = v12;
  v46 = v24;
  v49.origin.x = v16;
  v49.origin.y = v18;
  v49.size.width = v20;
  v49.size.height = v22;
  v25 = CGRectGetWidth(v49) - v12;
  -[MTUIDigitalClockLabel effectiveLayoutSizeFittingSize:](self->_digitalClock, "effectiveLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v47 = v26;
  rect = v27;
  v28 = v12;
  if (!self->_shouldStackViews)
  {
    v28 = v12;
    if (!v23)
    {
      v50.origin.x = v16;
      v50.origin.y = v18;
      v50.size.width = v20;
      v50.size.height = v22;
      v28 = CGRectGetMaxX(v50) - v47 - v14;
    }
  }
  v29 = v25 - v14;
  if (!self->_editing && !self->_shouldStackViews)
  {
    v30 = 0;
    v31 = v28;
    v32 = v47;
    v33 = rect;
    if (v23)
    {
      v34 = CGRectGetMaxX(*(CGRect *)&v31) + 8.0;
      v51.origin.x = v16;
      v51.origin.y = v18;
      v51.size.width = v20;
      v51.size.height = v22;
      v46 = v34;
      v29 = CGRectGetMaxX(v51) - v34 - v14;
    }
    else
    {
      v29 = CGRectGetMinX(*(CGRect *)&v31) + -8.0 - v12;
      v46 = v12;
    }
  }
  v35 = *(double *)&gLabelMetrics_1;
  v36 = *(double *)&gLabelMetrics_4;
  v37 = *(double *)&gLabelMetrics_6 + *(double *)&gLabelMetrics_3;
  if (self->_shouldStackViews)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_scaledValueForValue:", 16.0);
    v37 = v37 + v39 + 40.0;

  }
  -[MTUIDigitalClockLabel effectiveFirstBaselineOffsetFromTop](self->_digitalClock, "effectiveFirstBaselineOffsetFromTop");
  -[MTUIDigitalClockLabel setFrame:](self->_digitalClock, "setFrame:", v28, v37 - v40 + 0.0, v47, rect);
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v46, v44 + v42 - v41, v29, v35);
  -[UILabel setFrame:](self->_combinedLabel, "setFrame:", v46, v44 - v43, v29, v36);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;

  if (self->_editing != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_editing = a3;
    if (a4)
      objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", CFSTR("WorldClockCell"), 0);
    if (self->_shouldStackViews)
    {
      if (!v4)
      {
LABEL_7:
        -[MTUIWorldClockCellView setNeedsLayout](self, "setNeedsLayout");
        return;
      }
    }
    else
    {
      -[MTUIDigitalClockLabel setHidden:](self->_digitalClock, "setHidden:", v5);
      if (!v4)
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
    goto LABEL_7;
  }
}

- (void)significantTimeChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone", a3);
  -[MTUIWorldClockCellView updateTime](self, "updateTime");
  v4 = (void *)gTodayFormatter;
  if (gTodayFormatter)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeZone:", v5);

  }
}

- (void)start
{
  if (!self->_started)
  {
    -[MTUIWorldClockCellView updateTime](self, "updateTime");
    self->_started = 1;
    +[MTUIAnalogClockView registerClock:](MTUIAnalogClockView, "registerClock:", self);
  }
}

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    +[MTUIAnalogClockView unregisterClock:](MTUIAnalogClockView, "unregisterClock:", self);
  }
}

- (int64_t)runMode
{
  return 2;
}

- (void)updateTimeContinuously:(int64_t)a3
{
  id WeakRetained;

  if (self->_nowInMinutes != a3)
  {
    self->_nowInMinutes = a3;
    -[MTUIWorldClockCellView updateTime](self, "updateTime");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "timeDidChangeForClockCell:", self);

  }
}

- (double)updateInterval
{
  return 1.0;
}

- (double)coarseUpdateInterval
{
  return 60.0;
}

- (void)updateTime
{
  NSTimeZone *timeZone;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  timeZone = self->_timeZone;
  if (timeZone)
  {
    v4 = -[NSTimeZone secondsFromGMT](timeZone, "secondsFromGMT");
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 - objc_msgSend(v5, "secondsFromGMT");

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:", v11, v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_combinedLabel, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
      -[UILabel setText:](self->_combinedLabel, "setText:", v7);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTUIDateLabel setDate:](self->_digitalClock, "setDate:", v10);

    -[MTUIWorldClockCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v5;
  NSTimeZone *v6;

  v5 = (NSTimeZone *)a3;
  if (self->_timeZone != v5)
  {
    v6 = v5;
    -[MTUIDateLabel setTimeZone:](self->_digitalClock, "setTimeZone:", v5);
    objc_storeStrong((id *)&self->_timeZone, a3);
    self->_nowInMinutes = vcvtmd_s64_f64(CFAbsoluteTimeGetCurrent() / 60.0);
    -[MTUIWorldClockCellView updateTime](self, "updateTime");
    v5 = v6;
  }

}

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6
{
  return (id)objc_msgSend(a1, "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:hoursOnly:", a3, a4, a5, a6, 0);
}

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  int64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  int64_t v34;
  __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __CFString *v48;
  int64_t v49;
  __CFString *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;

  v53 = a7;
  v7 = a6;
  v10 = a3;
  v11 = a5;
  if (!gNumberFormatter)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v13 = (void *)gNumberFormatter;
    gNumberFormatter = (uint64_t)v12;

    objc_msgSend((id)gNumberFormatter, "setNumberStyle:", 1);
    v14 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v15 = (void *)gTodayFormatter;
    gTodayFormatter = (uint64_t)v14;

    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gTodayFormatter, "setTimeZone:", v16);
    objc_msgSend((id)gTodayFormatter, "setDateStyle:", 2);
    objc_msgSend((id)gTodayFormatter, "setTimeStyle:", 0);
    objc_msgSend((id)gTodayFormatter, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend((id)gTodayFormatter, "setFormattingContext:", 4);
    v17 = objc_opt_new();
    v18 = (void *)gDateComponentsFormatter;
    gDateComponentsFormatter = v17;

    objc_msgSend((id)gDateComponentsFormatter, "setUnitsStyle:", 0);
  }
  v19 = (void *)gTodayFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v10;
  if (!a4)
  {
    objc_msgSend((id)gNumberFormatter, "stringFromNumber:", &unk_24F019620);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("DAY_FORMAT_HOURS_AHEAD");
    v26 = CFSTR("HOURS_AHEAD");
    if (!v11)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (a4 >= 0)
    v22 = a4;
  else
    v22 = -a4;
  if (v22 <= 0xE0F)
  {
    v23 = CFSTR("DAY_FORMAT_MINUTES_BEHIND");
    if (a4 <= 0)
    {
      v24 = CFSTR("MINUTES_BEHIND");
    }
    else
    {
      v23 = CFSTR("DAY_FORMAT_MINUTES_AHEAD");
      v24 = CFSTR("MINUTES_AHEAD");
    }
    v25 = v23;
    v26 = v24;
    v27 = (void *)gNumberFormatter;
    if (a4 / 60 >= 0)
      v28 = a4 / 60;
    else
      v28 = a4 / -60;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringFromNumber:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (v22 == 3600)
  {
    v32 = CFSTR("DAY_FORMAT_ONE_HOUR_BEHIND");
    if (a4 <= 0)
    {
      v33 = CFSTR("ONE_HOUR_BEHIND");
    }
    else
    {
      v32 = CFSTR("DAY_FORMAT_ONE_HOUR_AHEAD");
      v33 = CFSTR("ONE_HOUR_AHEAD");
    }
    v25 = v32;
    v26 = v33;
    objc_msgSend((id)gNumberFormatter, "stringFromNumber:", &unk_24F019638);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_33;
LABEL_32:
    -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("_TZ"));
    v37 = objc_claimAutoreleasedReturnValue();

    v25 = (__CFString *)v37;
    goto LABEL_33;
  }
  if (a4 / 3600 >= 0)
    v34 = a4 / 3600;
  else
    v34 = a4 / -3600;
  if (a4 % 3600)
  {
    v35 = CFSTR("DAY_FORMAT_HOURS_MINUTES_BEHIND");
    if (a4 <= 0)
    {
      v36 = CFSTR("HOURS_MINUTES_BEHIND");
    }
    else
    {
      v35 = CFSTR("DAY_FORMAT_HOURS_MINUTES_AHEAD");
      v36 = CFSTR("HOURS_MINUTES_AHEAD");
    }
    v25 = v35;
    v26 = v36;
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setHour:", v34);
    objc_msgSend(v29, "setMinute:", (2185 * (v22 % 0xE10)) >> 17);
    objc_msgSend((id)gDateComponentsFormatter, "stringFromDateComponents:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v31 = (void *)v30;

    if (!v11)
      goto LABEL_33;
    goto LABEL_32;
  }
  v48 = CFSTR("DAY_FORMAT_HOURS_BEHIND");
  if (a4 > 0)
    v48 = CFSTR("DAY_FORMAT_HOURS_AHEAD");
  v49 = v34;
  if (a4 <= 0)
    v50 = CFSTR("HOURS_BEHIND");
  else
    v50 = CFSTR("HOURS_AHEAD");
  v25 = v48;
  v26 = v50;
  v51 = (void *)gNumberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v49);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "stringFromNumber:", v52);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_32;
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", v25, &stru_24F014C90, CFSTR("MobileTimerUI"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", CFSTR("_SPACE"));
    v40 = objc_claimAutoreleasedReturnValue();

    v26 = (__CFString *)v40;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localizedStringForKey:value:table:", v26, &stru_24F014C90, CFSTR("MobileTimerUI"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v42, v31);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v39, v21, v43, v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v53)
    v44 = v43;
  v46 = v44;

  return v46;
}

- (MTUIWorldClockCellViewDelegate)delegate
{
  return (MTUIWorldClockCellViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (MTUIDigitalClockLabel)digitalClock
{
  return self->_digitalClock;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (UILabel)combinedLabel
{
  return self->_combinedLabel;
}

- (BOOL)shouldStackViews
{
  return self->_shouldStackViews;
}

- (void)setShouldStackViews:(BOOL)a3
{
  self->_shouldStackViews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_digitalClock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
