@implementation NTKDigitalTimeComplicationView

- (NTKDigitalTimeComplicationView)init
{
  NTKDigitalTimeComplicationView *v2;
  void *v3;
  uint64_t v4;
  CLKDevice *device;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKDigitalTimeComplicationView;
  v2 = -[NTKDigitalTimeComplicationView init](&v11, sel_init);
  if (v2)
  {
    +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (CLKDevice *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_timeOffsetChanged, CFSTR("NTKTimeOffsetChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeComplicationView setBackgroundColor:](v2, "setBackgroundColor:", v7);

    v2->_showsSeconds = 1;
    -[NTKDigitalTimeComplicationView _labelFont](v2, "_labelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeComplicationView _createLabelViewWithFont:](v2, "_createLabelViewWithFont:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitalTimeComplicationView addSubview:](v2, "addSubview:", v9);

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDigitalTimeComplicationView;
  -[NTKDigitalTimeComplicationView layoutSubviews](&v3, sel_layoutSubviews);
  MEMORY[0x1BCCA72B8](-[NTKDigitalTimeComplicationView bounds](self, "bounds"));
  -[NTKDigitalTimeLabel setCenter:](self->_timeLabel, "setCenter:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[CLKUITimeLabel sizeThatFits:](self->_timeLabel, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[NTKDigitalTimeComplicationView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_43(v8);
  v10 = v9;

  v11 = v5 + v10;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_labelFont
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  -[NTKDigitalTimeComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LayoutConstants_43(v2);

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v3, *MEMORY[0x1E0DC1448]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CLKFontWithAlternativePunctuation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createLabelViewWithFont:(id)a3
{
  id v4;
  void *v5;
  NTKDigitalTimeLabel *v6;
  NTKDigitalTimeLabel *timeLabel;
  void *v8;

  v4 = a3;
  -[NTKDigitalTimeComplicationView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKUITimeLabel labelWithOptions:forDevice:](NTKDigitalTimeLabel, "labelWithOptions:forDevice:", 0, v5);
  v6 = (NTKDigitalTimeLabel *)objc_claimAutoreleasedReturnValue();
  timeLabel = self->_timeLabel;
  self->_timeLabel = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKDigitalTimeLabel setBackgroundColor:](self->_timeLabel, "setBackgroundColor:", v8);

  -[CLKUITimeLabel setShowSeconds:](self->_timeLabel, "setShowSeconds:", self->_showsSeconds);
  -[CLKUITimeLabel setFont:](self->_timeLabel, "setFont:", v4);

  -[NTKDigitalTimeComplicationView timeOffsetChanged](self, "timeOffsetChanged");
  return self->_timeLabel;
}

- (void)timeOffsetChanged
{
  NTKDigitalTimeLabel *timeLabel;
  id v3;

  timeLabel = self->_timeLabel;
  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeOffset");
  -[NTKDigitalTimeLabel setTimeOffset:](timeLabel, "setTimeOffset:");

}

- (void)setOverrideDate:(id)a3
{
  -[NTKDigitalTimeLabel setOverrideDate:duration:](self->_timeLabel, "setOverrideDate:duration:", a3, 0.0);
  -[CLKUITimeLabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[NTKDigitalTimeComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CLKUITimeLabel textColor](self->_timeLabel, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
    -[NTKDigitalTimeLabel setTextColor:](self->_timeLabel, "setTextColor:", v6);

}

- (UIColor)textColor
{
  return -[CLKUITimeLabel textColor](self->_timeLabel, "textColor");
}

- (void)setFont:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CLKUITimeLabel font](self->_timeLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[CLKUITimeLabel setFont:](self->_timeLabel, "setFont:", v6);
    -[CLKUITimeLabel sizeToFit](self->_timeLabel, "sizeToFit");
  }

}

- (UIFont)font
{
  return -[CLKUITimeLabel font](self->_timeLabel, "font");
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  objc_storeStrong((id *)&self->_template, a3);
  -[NTKDigitalTimeComplicationView updateDate](self, "updateDate");
  -[NTKDigitalTimeComplicationView setNeedsLayout](self, "setNeedsLayout");
}

- (id)complicationTemplate
{
  return self->_template;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return *MEMORY[0x1E0C93EA8] == a3;
}

- (unint64_t)timelineAnimationFadeTypeOverride
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CLKComplicationTemplate metadata](self->_template, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NTKComplicationTimelineAnimationFadeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeOffset");
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKDigitalTimeComplicationView setTimeTravelDate:](self, "setTimeTravelDate:", v7);
  -[NTKDigitalTimeComplicationView updateDate](self, "updateDate");

}

- (void)updateDate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[NTKDigitalTimeComplicationView template](self, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[NTKDigitalTimeComplicationView timeTravelDate](self, "timeTravelDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NTKDigitalTimeComplicationView timeTravelDate](self, "timeTravelDate");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5)
    {
      -[NTKDigitalTimeComplicationView setOverrideDate:](self, "setOverrideDate:", 0);
      goto LABEL_7;
    }
    NTKIdealizedDate();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  -[NTKDigitalTimeComplicationView setOverrideDate:](self, "setOverrideDate:", v7);

LABEL_7:
}

- (CDComplicationDisplayObserver)displayObserver
{
  return (CDComplicationDisplayObserver *)objc_loadWeakRetained((id *)&self->displayObserver);
}

- (void)setDisplayObserver:(id)a3
{
  objc_storeWeak((id *)&self->displayObserver, a3);
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (BOOL)showsSeconds
{
  return self->_showsSeconds;
}

- (void)setShowsSeconds:(BOOL)a3
{
  self->_showsSeconds = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NTKDigitalTimeLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (CLKComplicationTemplate)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_template, a3);
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
}

@end
