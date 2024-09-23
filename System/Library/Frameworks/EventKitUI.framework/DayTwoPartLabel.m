@implementation DayTwoPartLabel

- (DayTwoPartLabel)initWithFrame:(CGRect)a3
{
  return -[DayTwoPartLabel initWithFrame:useSeparateFormat:](self, "initWithFrame:useSeparateFormat:", CUIKIsWeekdayNameFirst(), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DayTwoPartLabel)initWithFrame:(CGRect)a3 useSeparateFormat:(BOOL)a4
{
  DayTwoPartLabel *v5;
  DayTwoPartLabel *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DayTwoPartLabel;
  v5 = -[DayTwoPartLabel initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_useSeparateFormat = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DayTwoPartLabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[DayTwoPartLabel _createSubviews](v6, "_createSubviews");
  }
  return v6;
}

- (void)_createSubviews
{
  void *v3;
  UILabel *v4;
  UILabel *firstLabel;
  void *v6;
  UILabel *v7;
  UILabel *secondLabel;
  void *v9;
  UILabel *v10;
  UILabel *entireString;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v3) == 2)
  {
    self->_useSeparateFormat = 0;
LABEL_5:
    v10 = (UILabel *)objc_opt_new();
    entireString = self->_entireString;
    self->_entireString = v10;

    -[UILabel setTextAlignment:](self->_entireString, "setTextAlignment:", 1);
    -[DayTwoPartLabel addSubview:](self, "addSubview:", self->_entireString);
    goto LABEL_6;
  }
  if (!self->_useSeparateFormat)
    goto LABEL_5;
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  firstLabel = self->_firstLabel;
  self->_firstLabel = v4;

  -[UILabel setTextAlignment:](self->_firstLabel, "setTextAlignment:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_firstLabel, "setTextColor:", v6);

  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondLabel = self->_secondLabel;
  self->_secondLabel = v7;

  -[UILabel setTextAlignment:](self->_secondLabel, "setTextAlignment:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_secondLabel, "setTextColor:", v9);

  -[DayTwoPartLabel addSubview:](self, "addSubview:", self->_firstLabel);
  -[DayTwoPartLabel addSubview:](self, "addSubview:", self->_secondLabel);
  self->_dayNameOnLeft = CUIKIsWeekdayNameFirst();
LABEL_6:

}

- (void)_resetUI
{
  int *v3;
  void *v4;
  UILabel **p_secondLabel;
  UILabel *firstLabel;
  UILabel *v7;
  id v8;

  -[DayTwoPartLabel backgroundColor](self, "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_useSeparateFormat)
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  else
    v3 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_useSeparateFormat)
  {
    -[UILabel removeFromSuperview](self->_firstLabel, "removeFromSuperview");
    p_secondLabel = &self->_secondLabel;
    -[UILabel removeFromSuperview](self->_secondLabel, "removeFromSuperview");
    firstLabel = self->_firstLabel;
    self->_firstLabel = 0;

  }
  else
  {
    p_secondLabel = &self->_entireString;
    -[UILabel removeFromSuperview](self->_entireString, "removeFromSuperview");
  }
  v7 = *p_secondLabel;
  *p_secondLabel = 0;

  -[DayTwoPartLabel _createSubviews](self, "_createSubviews");
  -[DayTwoPartLabel _updateOverlayLabel](self, "_updateOverlayLabel");
  -[DayTwoPartLabel setBackgroundColor:](self, "setBackgroundColor:", v8);
  -[DayTwoPartLabel setFont:](self, "setFont:", v4);
  -[DayTwoPartLabel setDate:](self, "setDate:", self->_date);
  -[DayTwoPartLabel setNeedsLayout](self, "setNeedsLayout");

}

- (id)dayOfWeekString
{
  int *v2;

  if (self->_dayNameOnLeft)
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  else
    v2 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "text");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDayOfWeekString:(id)a3
{
  int *v3;

  if (self->_dayNameOnLeft)
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  else
    v3 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "setText:", a3);
}

- (id)dateYearString
{
  int *v2;

  if (self->_dayNameOnLeft)
    v2 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  else
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "text");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDateYearString:(id)a3
{
  int *v3;

  if (self->_dayNameOnLeft)
    v3 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  else
    v3 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "setText:", a3);
}

- (void)setDate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_date, a3);
  if (self->_date)
  {
    if (self->_useSeparateFormat)
    {
      CUIKCalendar();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "components:fromDate:", 512, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "weekday");
      CUIKStringForDayOfWeek();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKLongStringForDateWithCommaAndYear();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DayTwoPartLabel setDayOfWeekString:](self, "setDayOfWeekString:", v7);
      -[DayTwoPartLabel setDateYearString:](self, "setDateYearString:", v8);

    }
    else
    {
      if (-[DayTwoPartLabel useEmDashFormat](self, "useEmDashFormat"))
      {
        if (self->_showOverlayDate)
          CUIKAbbreviatedEmDashDayStringForDate();
        else
          CUIKLongEmDashDayStringForDate();
      }
      else if (self->_showOverlayDate)
      {
        CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      }
      else
      {
        CUIKLongDayStringForDate();
      }
      v9 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v9;
      -[UILabel setText:](self->_entireString, "setText:", v9);
    }

    -[DayTwoPartLabel _updateOverlayLabel](self, "_updateOverlayLabel");
  }

}

- (void)_updateOverlayLabel
{
  _BOOL4 showOverlayDate;
  UILabel *overlayLabel;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  NSDate *date;
  void *v11;
  id v12;

  showOverlayDate = self->_showOverlayDate;
  overlayLabel = self->_overlayLabel;
  if (showOverlayDate)
  {
    if (!overlayLabel)
    {
      v5 = (UILabel *)objc_opt_new();
      v6 = self->_overlayLabel;
      self->_overlayLabel = v5;

      -[UILabel font](self->_entireString, "font");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_overlayLabel, "setFont:", v7);

      -[DayTwoPartLabel addSubview:](self, "addSubview:", self->_overlayLabel);
    }
  }
  else if (overlayLabel)
  {
    -[UILabel removeFromSuperview](overlayLabel, "removeFromSuperview");
    v8 = self->_overlayLabel;
    self->_overlayLabel = 0;

  }
  if (self->_showOverlayDate)
  {
    v9 = (void *)MEMORY[0x1E0D0CD50];
    date = self->_date;
    CUIKGetOverlayCalendar();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "yearMonthDayStringForDate:inCalendar:", date, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_overlayLabel, "setText:", v11);

  }
}

- (void)setShowOverlayDate:(BOOL)a3
{
  if (self->_showOverlayDate != a3)
  {
    self->_showOverlayDate = a3;
    -[DayTwoPartLabel _resetUI](self, "_resetUI");
  }
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;
  int *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_useSeparateFormat)
  {
    -[UILabel setFont:](self->_firstLabel, "setFont:", v4);
    v5 = v7;
    v6 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else
  {
    v5 = v4;
    v6 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "setFont:", v5);
  if (self->_showOverlayDate)
    -[UILabel setFont:](self->_overlayLabel, "setFont:", v7);

}

- (UIFont)font
{
  int *v2;

  if (self->_useSeparateFormat)
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  else
    v2 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "font");
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  int *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DayTwoPartLabel;
  -[DayTwoPartLabel setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  if (self->_useSeparateFormat)
  {
    -[UILabel setBackgroundColor:](self->_firstLabel, "setBackgroundColor:", v4);
    v5 = &OBJC_IVAR___DayTwoPartLabel__secondLabel;
  }
  else
  {
    v5 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setBackgroundColor:", v4);
  if (self->_showOverlayDate)
    -[UILabel setBackgroundColor:](self->_overlayLabel, "setBackgroundColor:", v4);

}

- (void)layoutSubviews
{
  _BOOL4 useSeparateFormat;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *firstLabel;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UILabel *secondLabel;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  UILabel *entireString;
  double v25;
  double v26;
  double v27;
  double MaxX;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v34.receiver = self;
  v34.super_class = (Class)DayTwoPartLabel;
  -[DayTwoPartLabel layoutSubviews](&v34, sel_layoutSubviews);
  useSeparateFormat = self->_useSeparateFormat;
  -[DayTwoPartLabel bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (useSeparateFormat)
  {
    firstLabel = self->_firstLabel;
    -[UILabel frame](firstLabel, "frame");
    -[UILabel sizeThatFits:](firstLabel, "sizeThatFits:", v11, v12);
    v14 = v13;
    -[UILabel setFrame:](self->_firstLabel, "setFrame:", v5, v7, v13, v9);
    -[DayTwoPartLabel bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v35.origin.x = v5;
    v35.origin.y = v7;
    v35.size.width = v14;
    v35.size.height = v9;
    v5 = CGRectGetMaxX(v35) + 10.0;
    secondLabel = self->_secondLabel;
    -[UILabel frame](secondLabel, "frame");
    -[UILabel sizeThatFits:](secondLabel, "sizeThatFits:", v20, v21);
    v23 = v22;
    -[UILabel setFrame:](self->_secondLabel, "setFrame:", v5, v16, v22, v18);
  }
  else
  {
    entireString = self->_entireString;
    -[UILabel frame](entireString, "frame");
    -[UILabel sizeThatFits:](entireString, "sizeThatFits:", v25, v26);
    v23 = v27;
    -[UILabel setFrame:](self->_entireString, "setFrame:", v5, v7, v27, v9);
    v16 = v7;
    v18 = v9;
  }
  v36.origin.x = v5;
  v36.origin.y = v16;
  v36.size.width = v23;
  v36.size.height = v18;
  MaxX = CGRectGetMaxX(v36);
  if (self->_showOverlayDate)
  {
    v29 = MaxX;
    -[DayTwoPartLabel bounds](self, "bounds");
    v31 = v30;
    v33 = v32;
    -[UILabel frame](self->_overlayLabel, "frame");
    -[UILabel setFrame:](self->_overlayLabel, "setFrame:", v29 + 10.0, v31, CGRectGetWidth(v37), v33);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UILabel *firstLabel;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *secondLabel;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UILabel *entireString;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;
  CGRect v26;
  CGRect v27;

  if (self->_useSeparateFormat)
  {
    firstLabel = self->_firstLabel;
    -[UILabel frame](firstLabel, "frame", a3.width, a3.height);
    -[UILabel sizeThatFits:](firstLabel, "sizeThatFits:", v5, v6);
    v8 = v7;
    v10 = v9;
    secondLabel = self->_secondLabel;
    -[UILabel frame](secondLabel, "frame");
    -[UILabel sizeThatFits:](secondLabel, "sizeThatFits:", v12, v13);
    v15 = fmax(v10, v14);
    v17 = v8 + v16 + 10.0;
  }
  else
  {
    entireString = self->_entireString;
    -[UILabel frame](entireString, "frame", a3.width, a3.height);
    -[UILabel sizeThatFits:](entireString, "sizeThatFits:", v19, v20);
    v17 = v21;
    v15 = v22;
  }
  if (self->_showOverlayDate)
  {
    -[UILabel sizeToFit](self->_overlayLabel, "sizeToFit");
    -[UILabel frame](self->_overlayLabel, "frame");
    v17 = v17 + CGRectGetWidth(v26) + 10.0;
    -[UILabel frame](self->_overlayLabel, "frame");
    v15 = fmax(v15, CGRectGetHeight(v27));
  }
  v23 = v17;
  v24 = v15;
  result.height = v24;
  result.width = v23;
  return result;
}

- (id)createCopy
{
  DayTwoPartLabel *v3;
  void *v4;

  v3 = objc_alloc_init(DayTwoPartLabel);
  -[DayTwoPartLabel frame](self, "frame");
  -[DayTwoPartLabel setFrame:](v3, "setFrame:");
  -[DayTwoPartLabel backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DayTwoPartLabel setBackgroundColor:](v3, "setBackgroundColor:", v4);

  v3->_showOverlayDate = self->_showOverlayDate;
  objc_storeStrong((id *)&v3->_date, self->_date);
  v3->_useSeparateFormat = self->_useSeparateFormat;
  v3->_dayNameOnLeft = self->_dayNameOnLeft;
  -[DayTwoPartLabel _resetUI](v3, "_resetUI");
  -[DayTwoPartLabel _copyLabelParametersFrom:to:](self, "_copyLabelParametersFrom:to:", self->_firstLabel, v3->_firstLabel);
  -[DayTwoPartLabel _copyLabelParametersFrom:to:](self, "_copyLabelParametersFrom:to:", self->_secondLabel, v3->_secondLabel);
  -[DayTwoPartLabel _copyLabelParametersFrom:to:](self, "_copyLabelParametersFrom:to:", self->_entireString, v3->_entireString);
  -[DayTwoPartLabel _copyLabelParametersFrom:to:](self, "_copyLabelParametersFrom:to:", self->_overlayLabel, v3->_overlayLabel);
  -[DayTwoPartLabel sizeToFit](v3, "sizeToFit");
  return v3;
}

- (void)_copyLabelParametersFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v6, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  objc_msgSend(v6, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v8);

  objc_msgSend(v6, "backgroundColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v9);
}

- (double)baselineOffsetFromBoundsTop
{
  int *v2;
  id v3;
  double MinY;
  double v5;
  double v6;
  CGRect v8;

  if (self->_useSeparateFormat)
    v2 = &OBJC_IVAR___DayTwoPartLabel__firstLabel;
  else
    v2 = &OBJC_IVAR___DayTwoPartLabel__entireString;
  v3 = *(id *)((char *)&self->super.super.super.isa + *v2);
  objc_msgSend(v3, "frame");
  MinY = CGRectGetMinY(v8);
  objc_msgSend(v3, "_firstLineBaselineOffsetFromBoundsTop");
  v6 = v5;

  return MinY + v6;
}

- (BOOL)showOverlayDate
{
  return self->_showOverlayDate;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)useSeparateFormat
{
  return self->_useSeparateFormat;
}

- (void)setUseSeparateFormat:(BOOL)a3
{
  self->_useSeparateFormat = a3;
}

- (BOOL)useEmDashFormat
{
  return self->_useEmDashFormat;
}

- (void)setUseEmDashFormat:(BOOL)a3
{
  self->_useEmDashFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_overlayLabel, 0);
  objc_storeStrong((id *)&self->_entireString, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
}

@end
