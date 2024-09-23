@implementation HUCalendarScrubberCollectionViewCell

- (HUCalendarScrubberCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUCalendarScrubberCollectionViewCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *circleView;
  void *v11;
  uint64_t v12;
  UILabel *dateLabel;
  void *v14;
  void *v15;
  uint64_t v16;
  UILabel *dayMonthLabel;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  v3 = -[HUCalendarScrubberCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    circleView = v3->_circleView;
    v3->_circleView = (UIView *)v9;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_circleView, "setBackgroundColor:", v11);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v12;

    -[UILabel setTextAlignment:](v3->_dateLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_dateLabel, "setFont:", v14);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_dateLabel, "setAdjustsFontForContentSizeCategory:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_dateLabel, "setTextColor:", v15);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    dayMonthLabel = v3->_dayMonthLabel;
    v3->_dayMonthLabel = (UILabel *)v16;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 14.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_dayMonthLabel, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_dayMonthLabel, "setAdjustsFontForContentSizeCategory:", 0);
    -[UILabel setTextAlignment:](v3->_dayMonthLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_dayMonthLabel, "setTextColor:", v19);

    -[HUCalendarScrubberCollectionViewCell addSubview:](v3, "addSubview:", v3->_circleView);
    -[HUCalendarScrubberCollectionViewCell addSubview:](v3, "addSubview:", v3->_dateLabel);
    -[HUCalendarScrubberCollectionViewCell addSubview:](v3, "addSubview:", v3->_dayMonthLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  -[HUCalendarScrubberCollectionViewCell layoutSubviews](&v17, sel_layoutSubviews);
  -[HUCalendarScrubberCollectionViewCell circleView](self, "circleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberCollectionViewCell dateLabel](self, "dateLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberCollectionViewCell dayMonthLabel](self, "dayMonthLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCalendarScrubberCollectionViewCell bounds](self, "bounds");
  v7 = v6;
  v8 = v6 * 0.5;
  v10 = v9 - v6 + -4.0;
  objc_msgSend(v3, "setFrame:", 0.0, v10, v6, v6);
  objc_msgSend(v3, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v8);

  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7, 16.0);
  objc_msgSend(v3, "center");
  objc_msgSend(v4, "setCenter:");
  -[HUCalendarScrubberCollectionViewCell dayMonthLabel](self, "dayMonthLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intrinsicContentSize");
  v14 = v13;

  objc_msgSend(v5, "setFrame:", 0.0, v10 + -16.0, v14, 16.0);
  objc_msgSend(v4, "center");
  v16 = v15;
  objc_msgSend(v5, "center");
  objc_msgSend(v5, "setCenter:", v16);

}

- (void)setDateString:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_dateString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_dateString, a3);
    -[HUCalendarScrubberCollectionViewCell dateLabel](self, "dateLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setDayOfWeekString:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_dayOfWeekString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_dayOfWeekString, a3);
    -[HUCalendarScrubberCollectionViewCell dayMonthLabel](self, "dayMonthLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v7);

    -[HUCalendarScrubberCollectionViewCell dayMonthLabel](self, "dayMonthLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeToFit");

  }
}

- (void)setSelected:(BOOL)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCalendarScrubberCollectionViewCell;
  -[HUCalendarScrubberCollectionViewCell setSelected:](&v15, sel_setSelected_);
  -[HUCalendarScrubberCollectionViewCell circleView](self, "circleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v5, "setAlpha:", 0.0);
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v14, &v13, 0.1, 0.1);
    v12 = v14;
    objc_msgSend(v5, "setTransform:", &v12);
    v8 = (void *)MEMORY[0x1E0CEABB0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__HUCalendarScrubberCollectionViewCell_setSelected___block_invoke;
    v10[3] = &unk_1E6F4D988;
    v11 = v5;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 65538, v10, 0, 0.35, 0.0, 0.5, 0.7);
    v9 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v9);
  }

}

uint64_t __52__HUCalendarScrubberCollectionViewCell_setSelected___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_enabled = a3;
  -[HUCalendarScrubberCollectionViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  if (v3)
    v5 = 1.0;
  else
    v5 = 0.319999993;
  -[HUCalendarScrubberCollectionViewCell dateLabel](self, "dateLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[HUCalendarScrubberCollectionViewCell dayMonthLabel](self, "dayMonthLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

}

- (NSString)dayOfWeekString
{
  return self->_dayOfWeekString;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (UILabel)dayMonthLabel
{
  return self->_dayMonthLabel;
}

- (void)setDayMonthLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dayMonthLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayMonthLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_dayOfWeekString, 0);
}

@end
