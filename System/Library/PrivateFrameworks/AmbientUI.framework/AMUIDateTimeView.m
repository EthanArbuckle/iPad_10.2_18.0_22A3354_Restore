@implementation AMUIDateTimeView

- (AMUIDateTimeView)initWithFrame:(CGRect)a3
{
  AMUIDateTimeView *v3;
  uint64_t v4;
  UIFont *timeFont;
  uint64_t v6;
  UIFont *dateFont;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UILabel *dateLabel;
  uint64_t v15;
  UILabel *timeLabel;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *date;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *timeLabelYOffsetConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[8];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)AMUIDateTimeView;
  v3 = -[AMUIDateTimeView initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeFont");
    v4 = objc_claimAutoreleasedReturnValue();
    timeFont = v3->_timeFont;
    v3->_timeFont = (UIFont *)v4;

    objc_msgSend((id)objc_opt_class(), "defaultDateFont");
    v6 = objc_claimAutoreleasedReturnValue();
    dateFont = v3->_dateFont;
    v3->_dateFont = (UIFont *)v6;

    v8 = objc_alloc(MEMORY[0x24BDF6B68]);
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v13;

    -[UILabel setFont:](v3->_dateLabel, "setFont:", v3->_dateFont);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    timeLabel = v3->_timeLabel;
    v3->_timeLabel = (UILabel *)v15;

    -[UILabel setFont:](v3->_timeLabel, "setFont:", v3->_timeFont);
    v17 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_timeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v3->_timeLabel);
    v18 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v54[0] = v3->_dateLabel;
    v54[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithArrangedSubviews:", v19);

    objc_msgSend(v20, "setAxis:", 1);
    objc_msgSend(v20, "setAlignment:", 1);
    objc_msgSend(v20, "setSpacing:", -8.0);
    objc_msgSend(v20, "setDistribution:", 3);
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AMUIDateTimeView addSubview:](v3, "addSubview:", v20);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v21 = objc_claimAutoreleasedReturnValue();
    date = v3->_date;
    v3->_date = (NSDate *)v21;

    -[AMUIDateTimeView _updateLabels](v3, "_updateLabels");
    -[UILabel setHidden:](v3->_dateLabel, "setHidden:", 1);
    -[UILabel centerYAnchor](v3->_timeLabel, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
    timeLabelYOffsetConstraint = v3->_timeLabelYOffsetConstraint;
    v3->_timeLabelYOffsetConstraint = (NSLayoutConstraint *)v25;

    -[AMUIDateTimeView setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");
    v42 = (void *)MEMORY[0x24BDD1628];
    -[AMUIDateTimeView leadingAnchor](v3, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v49;
    -[AMUIDateTimeView trailingAnchor](v3, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v46;
    -[AMUIDateTimeView topAnchor](v3, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v43;
    -[AMUIDateTimeView bottomAnchor](v3, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v38;
    -[UILabel centerXAnchor](v3->_timeLabel, "centerXAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v27;
    v53[5] = v3->_timeLabelYOffsetConstraint;
    v40 = v17;
    objc_msgSend(v17, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel widthAnchor](v3->_timeLabel, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v30;
    objc_msgSend(v17, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel heightAnchor](v3->_timeLabel, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "activateConstraints:", v34);

  }
  return v3;
}

+ (id)defaultDateFont
{
  if (defaultDateFont_onceToken != -1)
    dispatch_once(&defaultDateFont_onceToken, &__block_literal_global_7);
  return (id)defaultDateFont___defaultDateFont;
}

void __35__AMUIDateTimeView_defaultDateFont__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v2, "fontWithDescriptor:size:", v1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultDateFont___defaultDateFont;
  defaultDateFont___defaultDateFont = v3;

}

+ (id)defaultTimeFont
{
  if (defaultTimeFont_onceToken != -1)
    dispatch_once(&defaultTimeFont_onceToken, &__block_literal_global_7);
  return (id)defaultTimeFont___defaultTimeFont;
}

void __35__AMUIDateTimeView_defaultTimeFont__block_invoke()
{
  CTFontRef v0;
  void *v1;

  v0 = CTFontCreateWithNameAndOptions(CFSTR(".SFSoftNumeric-Semibold"), 93.0, 0, 0x20000uLL);
  v1 = (void *)defaultTimeFont___defaultTimeFont;
  defaultTimeFont___defaultTimeFont = (uint64_t)v0;

}

- (void)setTimeFont:(id)a3
{
  id v4;
  UIFont *v5;
  UIFont *timeFont;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  if ((-[UIFont isEqual:](self->_timeFont, "isEqual:", v4) & 1) == 0)
  {
    v5 = (UIFont *)objc_msgSend(v7, "copy");
    timeFont = self->_timeFont;
    self->_timeFont = v5;

    -[UILabel setFont:](self->_timeLabel, "setFont:", self->_timeFont);
    -[AMUIDateTimeView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setDateFont:(id)a3
{
  id v4;
  UIFont *v5;
  UIFont *dateFont;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultDateFont");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  if ((-[UIFont isEqual:](self->_dateFont, "isEqual:", v4) & 1) == 0)
  {
    v5 = (UIFont *)objc_msgSend(v7, "copy");
    dateFont = self->_dateFont;
    self->_dateFont = v5;

    -[UILabel setFont:](self->_dateLabel, "setFont:", self->_dateFont);
  }

}

- (void)setDate:(id)a3
{
  NSDate *v4;
  NSDate *date;
  id v6;

  v6 = a3;
  if ((-[NSDate isEqual:](self->_date, "isEqual:") & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    date = self->_date;
    self->_date = v4;

    -[AMUIDateTimeView _updateLabels](self, "_updateLabels");
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  UIColor *textColor;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    textColor = self->_textColor;
    self->_textColor = v4;

    -[AMUIDateTimeView _updateLabels](self, "_updateLabels");
  }

}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMUIDateTimeView;
  -[AMUIDateTimeView updateConstraints](&v6, sel_updateConstraints);
  -[UIFont lineHeight](self->_timeFont, "lineHeight");
  v4 = v3;
  -[UIFont ascender](self->_timeFont, "ascender");
  -[NSLayoutConstraint setConstant:](self->_timeLabelYOffsetConstraint, "setConstant:", -(v4 - v5));
}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BE0BDF8];
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatterForDateAsTimeNoAMPMWithLocale:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTimeZone:", 0);
  objc_msgSend(v14, "stringFromDate:", self->_date);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self->_date)
    v6 = v5;
  else
    v6 = &stru_250764378;
  -[UILabel setText:](self->_timeLabel, "setText:", v6);
  -[UILabel setTextColor:](self->_timeLabel, "setTextColor:", self->_textColor);
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setTimeZone:", 0);
  v8 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFormatFromTemplate:options:locale:", CFSTR("EEEd"), 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateFormat:", v10);

  objc_msgSend(v7, "stringFromDate:", self->_date);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uppercaseString");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (self->_date)
    v13 = v12;
  else
    v13 = &stru_250764378;
  -[UILabel setText:](self->_dateLabel, "setText:", v13);
  -[UILabel setTextColor:](self->_dateLabel, "setTextColor:", self->_textColor);

}

- (UIFont)timeFont
{
  return self->_timeFont;
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (NSDate)date
{
  return self->_date;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
  objc_storeStrong((id *)&self->_timeLabelYOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
