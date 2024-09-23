@implementation NTKTimeTravelModuleView

- (NTKTimeTravelModuleView)initWithMaximumWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NTKTimeTravelModuleView *v8;
  NTKTimeTravelModuleView *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  float v18;
  UIView *v19;
  UIView *backgroundView;
  uint64_t v21;
  UILabel *timeScrubDifferenceLabel;
  UILabel *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  UILabel *timeScrubNowLabel;
  UILabel *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSCalendar *cal;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)NTKTimeTravelModuleView;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[NTKModuleView initWithFrame:](&v55, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[NTKModuleView device](v8, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sizeClass");

    if (v11)
      v12 = 16.0;
    else
      v12 = 15.0;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E6CA88C0, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v12;
    if (v15)
    {
      objc_msgSend(v15, "objectAtIndex:", v11 != 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v16 = v18;

    }
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v19;

    -[UIView setUserInteractionEnabled:](v9->_backgroundView, "setUserInteractionEnabled:", 0);
    -[NTKTimeTravelModuleView insertSubview:atIndex:](v9, "insertSubview:atIndex:", v9->_backgroundView, 0);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    timeScrubDifferenceLabel = v9->_timeScrubDifferenceLabel;
    v9->_timeScrubDifferenceLabel = (UILabel *)v21;

    v23 = v9->_timeScrubDifferenceLabel;
    v24 = *MEMORY[0x1E0DC1438];
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v12, *MEMORY[0x1E0DC1438]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CLKFontWithMonospacedNumbers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "CLKFontWithAlternativePunctuation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v27);

    -[UILabel setTextAlignment:](v9->_timeScrubDifferenceLabel, "setTextAlignment:", 1);
    v28 = v9->_timeScrubDifferenceLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v28, "setTextColor:", v29);

    -[NTKModuleView contentView](v9, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v9->_timeScrubDifferenceLabel);

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
    timeScrubNowLabel = v9->_timeScrubNowLabel;
    v9->_timeScrubNowLabel = (UILabel *)v31;

    v33 = v9->_timeScrubNowLabel;
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v16, v24);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v33, "setFont:", v34);

    -[UILabel setTextAlignment:](v9->_timeScrubNowLabel, "setTextAlignment:", 1);
    v35 = v9->_timeScrubNowLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    -[NTKModuleView contentView](v9, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v9->_timeScrubNowLabel);

    v38 = v9->_timeScrubNowLabel;
    NTKClockFaceLocalizedString(CFSTR("TIME_TRAVEL_DATE_NOW"), CFSTR("Text shown when Time Travel reaches the current time"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v38, "setText:", v39);

    -[UILabel sizeToFit](v9->_timeScrubNowLabel, "sizeToFit");
    v9->_shouldUseNowText = 1;
    if ((CLKFloatEqualsFloat() & 1) == 0)
    {
      v40 = (void *)objc_opt_class();
      -[NTKModuleView device](v9, "device");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_actualCornerRadiusForDevice:", v41);
      v43 = a3 + v42 * -2.0;

      -[UILabel bounds](v9->_timeScrubNowLabel, "bounds");
      if (v44 > v43)
        v9->_shouldUseNowText = 0;
    }
    v9->_nowLabelCenterY = 0.0;
    objc_msgSend((id)objc_opt_class(), "timeTravelColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_backgroundView, "setBackgroundColor:", v45);
    v46 = (void *)objc_opt_class();
    -[NTKModuleView device](v9, "device");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_actualCornerRadiusForDevice:", v47);
    v49 = v48;

    -[UIView layer](v9->_backgroundView, "layer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setCornerRadius:", v49);

    NTKColorByPremultiplyingAlpha(v45, 0.82);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModuleView setHighlightBackgroundColor:](v9, "setHighlightBackgroundColor:", v51);

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v52 = objc_claimAutoreleasedReturnValue();
    cal = v9->_cal;
    v9->_cal = (NSCalendar *)v52;

    -[NTKTimeTravelModuleView _setupBorder](v9, "_setupBorder");
  }
  return v9;
}

- (void)prepareToAppear
{
  -[UILabel setHidden:](self->_timeScrubDifferenceLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_timeScrubNowLabel, "setHidden:", 0);
}

+ (id)timeTravelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.239, 0.949, 0.937, 1.0);
}

+ (double)cornerRadius
{
  return 0.0;
}

+ (double)_actualCornerRadiusForDevice:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend(a1, "_defaultHeightForDevice:", v4);
  objc_msgSend(a1, "_defaultHeightForDevice:", v4);
  CLKValueForDeviceMetrics();
  v6 = v5;

  return v6;
}

+ (double)_defaultHeightForDevice:(id)a3
{
  double result;

  CLKValueForDeviceMetrics();
  return result;
}

- (void)_setupBorder
{
  CALayer *v3;
  CALayer *borderLayer;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (!self->_borderLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
    borderLayer = self->_borderLayer;
    self->_borderLayer = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_borderLayer, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    v6 = (void *)objc_opt_class();
    -[NTKModuleView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_actualCornerRadiusForDevice:", v7);
    -[CALayer setCornerRadius:](self->_borderLayer, "setCornerRadius:", v8 + 1.0);

    -[NTKTimeTravelModuleView layer](self, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSublayer:atIndex:", self->_borderLayer, 0);

  }
}

- (void)layoutSubviews
{
  UIView *backgroundView;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)NTKTimeTravelModuleView;
  -[NTKModuleView layoutSubviews](&v4, sel_layoutSubviews);
  backgroundView = self->_backgroundView;
  -[NTKTimeTravelModuleView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  -[NTKTimeTravelModuleView bounds](self, "bounds");
  v6 = CGRectInset(v5, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)_layoutContentView
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[UILabel sizeToFit](self->_timeScrubDifferenceLabel, "sizeToFit");
  -[NTKTimeTravelModuleView bounds](self, "bounds");
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sizeClass");

  -[UILabel bounds](self->_timeScrubDifferenceLabel, "bounds");
  -[NTKModuleView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredAboutPointForDevice();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UILabel ntk_setBoundsAndPositionFromFrame:](self->_timeScrubDifferenceLabel, "ntk_setBoundsAndPositionFromFrame:", v7, v9, v11, v13);
  if (self->_nowLabelCenterY == 0.0)
  {
    v14 = 15.0;
    if (!v4)
      v14 = 14.0;
    -[UILabel _setFirstLineBaselineFrameOriginY:](self->_timeScrubNowLabel, "_setFirstLineBaselineFrameOriginY:", v14);
    -[UILabel center](self->_timeScrubNowLabel, "center");
    self->_nowLabelCenterY = v15;
  }
  -[UILabel bounds](self->_timeScrubNowLabel, "bounds");
  -[NTKModuleView device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredAboutPointForDevice();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[UILabel ntk_setBoundsAndPositionFromFrame:](self->_timeScrubNowLabel, "ntk_setBoundsAndPositionFromFrame:", v18, v20, v22, v24);
}

- (void)scrubToDate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id obj;

  NTKRoundDateDownToNearestMinute(a3, a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((-[NSDate isEqual:](self->_date, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, obj);
    +[NTKDate faceDate](NTKDate, "faceDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKRoundDateDownToNearestMinute(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKTimeTravelModuleView _formatDateStringForIntervalBetweenReferenceDate:andOverrideDate:](self, "_formatDateStringForIntervalBetweenReferenceDate:andOverrideDate:", v6, obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_timeScrubDifferenceLabel, "setText:", v7);
    -[UILabel setHidden:](self->_timeScrubDifferenceLabel, "setHidden:", v7 == 0);
    -[UILabel setHidden:](self->_timeScrubNowLabel, "setHidden:", v7 != 0);
    -[NTKTimeTravelModuleView sizeToFit](self, "sizeToFit");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if ((-[UILabel isHidden](self->_timeScrubDifferenceLabel, "isHidden", a3.width, a3.height) & 1) != 0)
  {
    -[UILabel bounds](self->_timeScrubNowLabel, "bounds");
  }
  else
  {
    -[UILabel sizeToFit](self->_timeScrubDifferenceLabel, "sizeToFit");
    -[UILabel sizeThatFits:](self->_timeScrubDifferenceLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  v4 = (void *)objc_opt_class();
  -[NTKModuleView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_actualCornerRadiusForDevice:", v5);

  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();
  v8 = v7;

  -[NTKModuleView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKTimeTravelModuleView _defaultHeightForDevice:](NTKTimeTravelModuleView, "_defaultHeightForDevice:", v9);
  v11 = v10;

  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  BOOL v22;
  CGPoint v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  -[NTKTimeTravelModuleView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);
  objc_msgSend(WeakRetained, "timeTravelModuleTouchInsets");
  v17 = v10 + v16;
  v20 = v12 - (v18 + v19);
  v25.size.height = v14 - (v16 + v21);
  v25.origin.x = v8 + v18;
  v25.origin.y = v17;
  v25.size.width = v20;
  v24.x = x;
  v24.y = y;
  v22 = CGRectContainsPoint(v25, v24);

  return v22;
}

- (id)_formatDateStringForIntervalBetweenReferenceDate:(id)a3 andOverrideDate:(id)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  NSDateComponentsFormatter *offsetDateFormatter;
  NSDateComponentsFormatter *v10;
  NSDateComponentsFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  v6 = v5;
  v7 = fabs(v5);
  if (v7 < 60.0 && self->_shouldUseNowText)
  {
    v8 = 0;
  }
  else
  {
    offsetDateFormatter = self->_offsetDateFormatter;
    if (!offsetDateFormatter)
    {
      v10 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
      v11 = self->_offsetDateFormatter;
      self->_offsetDateFormatter = v10;

      -[NSDateComponentsFormatter setMaximumUnitCount:](self->_offsetDateFormatter, "setMaximumUnitCount:", 2);
      -[NSDateComponentsFormatter setFormattingContext:](self->_offsetDateFormatter, "setFormattingContext:", 2);
      -[NSDateComponentsFormatter setAllowedUnits:](self->_offsetDateFormatter, "setAllowedUnits:", 96);
      -[NSDateComponentsFormatter setUnitsStyle:](self->_offsetDateFormatter, "setUnitsStyle:", 0);
      -[NSDateComponentsFormatter setZeroFormattingBehavior:](self->_offsetDateFormatter, "setZeroFormattingBehavior:", 0x10000);
      offsetDateFormatter = self->_offsetDateFormatter;
    }
    -[NSDateComponentsFormatter stringFromTimeInterval:](offsetDateFormatter, "stringFromTimeInterval:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKLocaleCurrentNumberSystem() == 1)
      v15 = CFSTR("\u200F");
    else
      v15 = &stru_1E6BDC918;
    v16 = CFSTR("-");
    if (v6 >= 0.0)
      v16 = CFSTR("+");
    v17 = v16;
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("en")))
    {
      objc_msgSend(v12, "uppercaseStringWithLocale:", v13);
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v18;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v15, v17, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)setTapDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_tapDelegate);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->_tapDelegate);
      -[NTKTimeTravelModuleView removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", v7, 0, 0xFFFFFFFFLL);

    }
    v8 = objc_storeWeak((id *)&self->_tapDelegate, obj);
    v9 = objc_msgSend(obj, "conformsToProtocol:", &unk_1F8EBD240);

    v5 = obj;
    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_tapDelegate);
      -[NTKTimeTravelModuleView addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", v10, sel_performTimeTravelModuleTapAction, 64);

      v5 = obj;
    }
  }

}

- (NTKTimeTravelModuleViewTapClient)tapDelegate
{
  return (NTKTimeTravelModuleViewTapClient *)objc_loadWeakRetained((id *)&self->_tapDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapDelegate);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_cal, 0);
  objc_storeStrong((id *)&self->_offsetDateFormatter, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeScrubNowLabel, 0);
  objc_storeStrong((id *)&self->_timeScrubDifferenceLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
