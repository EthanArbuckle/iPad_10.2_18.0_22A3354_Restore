@implementation VMPlayerTimelineSlider

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v2, "maximumTime");
  v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v5, "maximumTime");
  v7 = v6;

  if (v7 != a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
    objc_msgSend(v8, "setMaximumTime:", a3);

    -[VMPlayerTimelineSlider updateElapsedTimeLabelText](self, "updateElapsedTimeLabelText");
    -[VMPlayerTimelineSlider updateRemainingTimeLabelText](self, "updateRemainingTimeLabelText");
  }
}

- (double)elapsedTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v2, "elapsedTime");
  v4 = v3;

  return v4;
}

- (void)setElapsedTime:(double)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v5, "setElapsedTime:", a3);

  -[VMPlayerTimelineSlider updateElapsedTimeLabelText](self, "updateElapsedTimeLabelText");
  -[VMPlayerTimelineSlider updateRemainingTimeLabelText](self, "updateRemainingTimeLabelText");
}

- (void)setElapsedTime:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v7, "setElapsedTime:animated:", v4, a3);

  -[VMPlayerTimelineSlider updateElapsedTimeLabelText](self, "updateElapsedTimeLabelText");
  -[VMPlayerTimelineSlider updateRemainingTimeLabelText](self, "updateRemainingTimeLabelText");
}

- (double)remainingTime
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v3, "maximumTime");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  objc_msgSend(v6, "elapsedTime");
  v8 = v5 - v7;

  return v8;
}

- (void)setLabelsEnabled:(BOOL)a3
{
  _BOOL4 labelsEnabled;
  void *v5;
  void *v6;
  void *v7;

  if (self->_labelsEnabled != a3)
  {
    self->_labelsEnabled = a3;
    -[VMPlayerTimelineSlider unloadConstraints](self, "unloadConstraints");
    labelsEnabled = self->_labelsEnabled;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
    v6 = v5;
    if (labelsEnabled)
    {
      -[VMPlayerTimelineSlider addSubview:](self, "addSubview:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
      -[VMPlayerTimelineSlider addSubview:](self, "addSubview:", v7);
    }
    else
    {
      objc_msgSend(v5, "removeFromSuperview");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
      objc_msgSend(v7, "removeFromSuperview");
    }

    -[VMPlayerTimelineSlider setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (AVTimeFormatter)timeFormatter
{
  AVTimeFormatter *timeFormatter;
  AVTimeFormatter *v4;
  AVTimeFormatter *v5;

  timeFormatter = self->_timeFormatter;
  if (!timeFormatter)
  {
    v4 = (AVTimeFormatter *)objc_alloc_init((Class)AVTimeFormatter);
    v5 = self->_timeFormatter;
    self->_timeFormatter = v4;

    timeFormatter = self->_timeFormatter;
  }
  return timeFormatter;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  *(float *)&v6 = a3;
  objc_msgSend(v7, "setValue:animated:", v4, v6);

}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider commonInit](&v3, "commonInit");
  self->_labelsEnabled = 1;
  -[VMPlayerTimelineSlider loadView](self, "loadView");
}

- (void)loadView
{
  VMDetailSlider *v3;
  VMDetailSlider *slider;
  UILabel *v5;
  UILabel *elapsedTimeLabel;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *remainingTimeLabel;
  void *v11;
  void *v12;

  -[VMPlayerTimelineSlider setSemanticContentAttribute:](self, "setSemanticContentAttribute:", 1);
  v3 = objc_alloc_init(VMDetailSlider);
  slider = self->_slider;
  self->_slider = v3;

  -[VMDetailSlider setDelegate:](self->_slider, "setDelegate:", self);
  -[VMDetailSlider setSemanticContentAttribute:](self->_slider, "setSemanticContentAttribute:", 1);
  -[VMDetailSlider setTranslatesAutoresizingMaskIntoConstraints:](self->_slider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMPlayerTimelineSlider addSubview:](self, "addSubview:", self->_slider);
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  elapsedTimeLabel = self->_elapsedTimeLabel;
  self->_elapsedTimeLabel = v5;

  -[UILabel setBackgroundColor:](self->_elapsedTimeLabel, "setBackgroundColor:", 0);
  -[UILabel setLineBreakMode:](self->_elapsedTimeLabel, "setLineBreakMode:", 2);
  -[UILabel setOpaque:](self->_elapsedTimeLabel, "setOpaque:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/Applications/MobilePhone.app")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_DURATION"), &stru_10007F010, CFSTR("Voicemail")));
  -[UILabel setText:](self->_elapsedTimeLabel, "setText:", v8);

  -[UILabel setTextAlignment:](self->_elapsedTimeLabel, "setTextAlignment:", 2);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_elapsedTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMPlayerTimelineSlider addSubview:](self, "addSubview:", self->_elapsedTimeLabel);
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  remainingTimeLabel = self->_remainingTimeLabel;
  self->_remainingTimeLabel = v9;

  -[UILabel setBackgroundColor:](self->_remainingTimeLabel, "setBackgroundColor:", 0);
  -[UILabel setLineBreakMode:](self->_remainingTimeLabel, "setLineBreakMode:", 2);
  -[UILabel setOpaque:](self->_remainingTimeLabel, "setOpaque:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/Applications/MobilePhone.app")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_DURATION"), &stru_10007F010, CFSTR("Voicemail")));
  -[UILabel setText:](self->_remainingTimeLabel, "setText:", v12);

  -[UILabel setTextAlignment:](self->_remainingTimeLabel, "setTextAlignment:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_remainingTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMPlayerTimelineSlider addSubview:](self, "addSubview:", self->_remainingTimeLabel);
  -[VMPlayerTimelineSlider _updateTextColor](self, "_updateTextColor");
}

- (void)loadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider loadConstraints](&v27, "loadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));

  v7 = NSStringFromSelector("sliderLeadingAnchorLayoutConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setIdentifier:", v8);

  objc_msgSend(v6, "setActive:", 1);
  -[VMPlayerTimelineSlider setSliderLeadingAnchorLayoutConstraint:](self, "setSliderLeadingAnchorLayoutConstraint:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));

  v13 = NSStringFromSelector("sliderTrailingAnchorLayoutConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setIdentifier:", v14);

  objc_msgSend(v12, "setActive:", 1);
  -[VMPlayerTimelineSlider setSliderTrailingAnchorLayoutConstraint:](self, "setSliderTrailingAnchorLayoutConstraint:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider topAnchor](self, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

  v19 = NSStringFromSelector("sliderTopAnchorLayoutConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v18, "setIdentifier:", v20);

  objc_msgSend(v18, "setActive:", 1);
  -[VMPlayerTimelineSlider setSliderTopAnchorLayoutConstraint:](self, "setSliderTopAnchorLayoutConstraint:", v18);
  if (-[VMPlayerTimelineSlider labelsEnabled](self, "labelsEnabled"))
  {
    -[VMPlayerTimelineSlider loadLabelConstraints](self, "loadLabelConstraints");
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider bottomAnchor](self, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

    v25 = NSStringFromSelector("sliderBottomAnchorLayoutConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v24, "setIdentifier:", v26);

    objc_msgSend(v24, "setActive:", 1);
    -[VMPlayerTimelineSlider setSliderBottomAnchorLayoutConstraint:](self, "setSliderBottomAnchorLayoutConstraint:", v24);
    v18 = v24;
  }
  if (-[VMPlayerTimelineSlider isAccessiblityConstraintsEnabled](self, "isAccessiblityConstraintsEnabled"))-[VMPlayerTimelineSlider loadAccessibilityConstraints](self, "loadAccessibilityConstraints");

}

- (void)loadLabelConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));

  v7 = NSStringFromSelector("elapsedTimeLabelLeadingAnchorLayoutConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "setIdentifier:", v8);

  objc_msgSend(v6, "setActive:", 1);
  -[VMPlayerTimelineSlider setElapsedTimeLabelLeadingAnchorLayoutConstraint:](self, "setElapsedTimeLabelLeadingAnchorLayoutConstraint:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastBaselineAnchor"));
  -[VMPlayerTimelineSlider elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant](self, "elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:constant:", v12));

  v14 = NSStringFromSelector("elapsedTimeLabelFirstBaselineAnchorLayoutConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "setIdentifier:", v15);

  objc_msgSend(v13, "setActive:", 1);
  -[VMPlayerTimelineSlider setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:](self, "setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider bottomAnchor](self, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v18));

  v20 = NSStringFromSelector("elapsedTimeLabelBottomAnchorLayoutConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v19, "setIdentifier:", v21);

  objc_msgSend(v19, "setActive:", 1);
  -[VMPlayerTimelineSlider setElapsedTimeLabelBottomAnchorLayoutConstraint:](self, "setElapsedTimeLabelBottomAnchorLayoutConstraint:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v25));

  v27 = NSStringFromSelector("remainingTimeLabelLeadingAnchorLayoutConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v26, "setIdentifier:", v28);

  objc_msgSend(v26, "setActive:", 1);
  -[VMPlayerTimelineSlider setRemainingTimeLabelLeadingAnchorLayoutConstraint:](self, "setRemainingTimeLabelLeadingAnchorLayoutConstraint:", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider trailingAnchor](self, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));

  v33 = NSStringFromSelector("remainingTimeLabelTrailingAnchorLayoutConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v32, "setIdentifier:", v34);

  objc_msgSend(v32, "setActive:", 1);
  -[VMPlayerTimelineSlider setRemainingTimeLabelTrailingAnchorLayoutConstraint:](self, "setRemainingTimeLabelTrailingAnchorLayoutConstraint:", v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider slider](self, "slider"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastBaselineAnchor"));
  -[VMPlayerTimelineSlider remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant](self, "remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:constant:", v38));

  v40 = NSStringFromSelector("remainingTimeLabelFirstBaselineAnchorLayoutConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_msgSend(v39, "setIdentifier:", v41);

  objc_msgSend(v39, "setActive:", 1);
  -[VMPlayerTimelineSlider setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:](self, "setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:", v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider bottomAnchor](self, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:", v44));

  v46 = NSStringFromSelector("remainingTimeLabelBottomAnchorLayoutConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  objc_msgSend(v45, "setIdentifier:", v47);

  objc_msgSend(v45, "setActive:", 1);
  -[VMPlayerTimelineSlider setRemainingTimeLabelBottomAnchorLayoutConstraint:](self, "setRemainingTimeLabelBottomAnchorLayoutConstraint:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "firstBaselineAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstBaselineAnchor"));
  v52 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v51));

  objc_msgSend(v52, "setActive:", 1);
}

- (void)unloadConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider unloadConstraints](&v15, "unloadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider sliderBottomAnchorLayoutConstraint](self, "sliderBottomAnchorLayoutConstraint"));
  objc_msgSend(v3, "setActive:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider sliderLeadingAnchorLayoutConstraint](self, "sliderLeadingAnchorLayoutConstraint"));
  objc_msgSend(v4, "setActive:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider sliderTopAnchorLayoutConstraint](self, "sliderTopAnchorLayoutConstraint"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider sliderTrailingAnchorLayoutConstraint](self, "sliderTrailingAnchorLayoutConstraint"));
  objc_msgSend(v6, "setActive:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabelBottomAnchorLayoutConstraint](self, "elapsedTimeLabelBottomAnchorLayoutConstraint"));
  objc_msgSend(v7, "setActive:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabelLeadingAnchorLayoutConstraint](self, "elapsedTimeLabelLeadingAnchorLayoutConstraint"));
  objc_msgSend(v8, "setActive:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabelFirstBaselineAnchorLayoutConstraint](self, "elapsedTimeLabelFirstBaselineAnchorLayoutConstraint"));
  objc_msgSend(v9, "setActive:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabelTrailingAnchorLayoutConstraint](self, "elapsedTimeLabelTrailingAnchorLayoutConstraint"));
  objc_msgSend(v10, "setActive:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabelBottomAnchorLayoutConstraint](self, "remainingTimeLabelBottomAnchorLayoutConstraint"));
  objc_msgSend(v11, "setActive:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabelLeadingAnchorLayoutConstraint](self, "remainingTimeLabelLeadingAnchorLayoutConstraint"));
  objc_msgSend(v12, "setActive:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabelFirstBaselineAnchorLayoutConstraint](self, "remainingTimeLabelFirstBaselineAnchorLayoutConstraint"));
  objc_msgSend(v13, "setActive:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabelTrailingAnchorLayoutConstraint](self, "remainingTimeLabelTrailingAnchorLayoutConstraint"));
  objc_msgSend(v14, "setActive:", 0);

}

- (void)updateConstraintsConstants
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider updateConstraintsConstants](&v2, "updateConstraintsConstants");
}

- (void)updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider updateFonts](&v9, "updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIFootnoteShortFont](UIFont, "telephonyUIFootnoteShortFont"));
  objc_msgSend(v3, "pointSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  objc_msgSend(v8, "setFont:", v7);

}

- (id)localizedStringForTimeInterval:(double)a3 timeFormatter:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "stringFromSeconds:", a3));
}

- (void)updateElapsedTimeLabelText
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider timeFormatter](self, "timeFormatter"));
  objc_msgSend(v5, "setStyle:", 1);
  -[VMPlayerTimelineSlider elapsedTime](self, "elapsedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider localizedStringForTimeInterval:timeFormatter:](self, "localizedStringForTimeInterval:timeFormatter:", v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider elapsedTimeLabel](self, "elapsedTimeLabel"));
  objc_msgSend(v4, "setText:", v3);

}

- (void)updateRemainingTimeLabelText
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider timeFormatter](self, "timeFormatter"));
  objc_msgSend(v5, "setStyle:", 2);
  -[VMPlayerTimelineSlider remainingTime](self, "remainingTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider localizedStringForTimeInterval:timeFormatter:](self, "localizedStringForTimeInterval:timeFormatter:", v5));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider remainingTimeLabel](self, "remainingTimeLabel"));
  objc_msgSend(v4, "setText:", v3);

}

- (void)detailSliderTrackingDidBegin:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "playerTimelineSliderScrubbingDidBegin:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate"));
    objc_msgSend(v6, "playerTimelineSliderScrubbingDidBegin:", self);

  }
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "playerTimelineSliderScrubbingDidCancel:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate"));
    objc_msgSend(v6, "playerTimelineSliderScrubbingDidCancel:", self);

  }
}

- (void)detailSliderTrackingDidEnd:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "playerTimelineSliderScrubbingDidEnd:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate"));
    objc_msgSend(v6, "playerTimelineSliderScrubbingDidEnd:", self);

  }
}

- (void)detailSlider:(id)a3 didChangeElapsedTime:(double)a4
{
  void *v6;
  char v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "playerTimelineSlider:didChangeElapsedTime:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider delegate](self, "delegate"));
    objc_msgSend(v8, "playerTimelineSlider:didChangeElapsedTime:", self, a4);

  }
}

- (double)elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIFootnoteShortFont](UIFont, "telephonyUIFootnoteShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 16.0);
    v7 = v6;

  }
  else
  {
    v7 = 16.0;
  }

  return v7;
}

- (double)remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont telephonyUIFootnoteShortFont](UIFont, "telephonyUIFootnoteShortFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIFontDescriptorTextStyleAttribute));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", v4));
    objc_msgSend(v5, "scaledValueForValue:", 16.0);
    v7 = v6;

  }
  else
  {
    v7 = 16.0;
  }

  return v7;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMPlayerTimelineSlider;
  -[VMPlayerTimelineSlider tintColorDidChange](&v3, "tintColorDidChange");
  -[VMPlayerTimelineSlider _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3));
  -[UILabel setTextColor:](self->_elapsedTimeLabel, "setTextColor:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayerTimelineSlider _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6));
  -[UILabel setTextColor:](self->_remainingTimeLabel, "setTextColor:", v5);

}

- (VMPlayerTimelineSliderDelegate)delegate
{
  return (VMPlayerTimelineSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)labelsEnabled
{
  return self->_labelsEnabled;
}

- (UILabel)elapsedTimeLabel
{
  return self->_elapsedTimeLabel;
}

- (UILabel)remainingTimeLabel
{
  return self->_remainingTimeLabel;
}

- (VMDetailSlider)slider
{
  return self->_slider;
}

- (void)setTimeFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_timeFormatter, a3);
}

- (NSLayoutConstraint)sliderBottomAnchorLayoutConstraint
{
  return self->_sliderBottomAnchorLayoutConstraint;
}

- (void)setSliderBottomAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sliderBottomAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)sliderLeadingAnchorLayoutConstraint
{
  return self->_sliderLeadingAnchorLayoutConstraint;
}

- (void)setSliderLeadingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sliderLeadingAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)sliderTopAnchorLayoutConstraint
{
  return self->_sliderTopAnchorLayoutConstraint;
}

- (void)setSliderTopAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sliderTopAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)sliderTrailingAnchorLayoutConstraint
{
  return self->_sliderTrailingAnchorLayoutConstraint;
}

- (void)setSliderTrailingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sliderTrailingAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)elapsedTimeLabelBottomAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelBottomAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelBottomAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabelBottomAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)elapsedTimeLabelLeadingAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelLeadingAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelLeadingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabelLeadingAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)elapsedTimeLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)elapsedTimeLabelTrailingAnchorLayoutConstraint
{
  return self->_elapsedTimeLabelTrailingAnchorLayoutConstraint;
}

- (void)setElapsedTimeLabelTrailingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeLabelTrailingAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)remainingTimeLabelBottomAnchorLayoutConstraint
{
  return self->_remainingTimeLabelBottomAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelBottomAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabelBottomAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)remainingTimeLabelLeadingAnchorLayoutConstraint
{
  return self->_remainingTimeLabelLeadingAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelLeadingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabelLeadingAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)remainingTimeLabelFirstBaselineAnchorLayoutConstraint
{
  return self->_remainingTimeLabelFirstBaselineAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabelFirstBaselineAnchorLayoutConstraint, a3);
}

- (NSLayoutConstraint)remainingTimeLabelTrailingAnchorLayoutConstraint
{
  return self->_remainingTimeLabelTrailingAnchorLayoutConstraint;
}

- (void)setRemainingTimeLabelTrailingAnchorLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTimeLabelTrailingAnchorLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingTimeLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabelBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabelBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderTopAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_sliderBottomAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_remainingTimeLabel, 0);
  objc_storeStrong((id *)&self->_elapsedTimeLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
