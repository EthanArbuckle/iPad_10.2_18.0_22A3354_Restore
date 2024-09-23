@implementation HKMonthDayCell

- (HKMonthDayCell)initWithDateCache:(id)a3
{
  HKMonthDayCell *v3;
  HKMonthDayCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMonthDayCell;
  v3 = -[HKCalendarDayCell initWithDateCache:](&v6, sel_initWithDateCache_, a3);
  v4 = v3;
  if (v3)
  {
    -[HKCalendarDayCell setDayDiameter:](v3, "setDayDiameter:", 35.0);
    -[HKMonthDayCell _updateFontAndCircle](v4, "_updateFontAndCircle");
  }
  return v4;
}

+ (double)dayLabelFontSize
{
  uint64_t v2;
  _BOOL4 IsLargerThanSizeCategory;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v2 = *MEMORY[0x1E0DC48D0];
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC48D0]);
  v4 = (void *)MEMORY[0x1E0DC1350];
  v5 = *MEMORY[0x1E0DC4A88];
  if (IsLargerThanSizeCategory)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_scaledValueForValue:", 16.0);
    v9 = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scaledValueForValue:", 16.0);
    v9 = v10;
  }

  return v9;
}

- (void)_updateFontAndCircle
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend((id)objc_opt_class(), "dayLabelFontSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarDayCell setFont:](self, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarDayCell setBoldFont:](self, "setBoldFont:", v6);

  -[HKCalendarDayCell circleSize](self, "circleSize");
  v8 = v7;
  v10 = v9;
  -[HKCalendarDayCell circle](self, "circle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKMonthDayCell;
  -[HKMonthDayCell dealloc](&v4, sel_dealloc);
}

- (void)_setCircleState:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  id v15;

  self->_circleState = a3;
  switch(a3)
  {
    case 2:
      -[HKCalendarDayCell circle](self, "circle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCalendarDayCell date](self, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isDateInToday:", v11);

      if (v12)
        HKHealthKeyColor();
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = objc_msgSend(v13, "CGColor");

      -[HKCalendarDayCell circle](self, "circle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5;
      v6 = v14;
      goto LABEL_11;
    case 1:
      -[HKCalendarDayCell circle](self, "circle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

      -[HKCalendarDayCell circle](self, "circle");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

LABEL_12:
      return;
    case 0:
      -[HKCalendarDayCell circle](self, "circle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 1);

      -[HKCalendarDayCell circle](self, "circle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5;
      v6 = 0;
LABEL_11:
      objc_msgSend(v5, "setBackgroundColor:", v6);
      goto LABEL_12;
  }
}

- (BOOL)_representsWeekendDay
{
  void *v3;
  void *v4;
  char v5;

  -[HKCalendarDayCell dateCache](self, "dateCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dayOfWeek);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isDayOfWeekNumberOnWeekend:", v4);

  return v5;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKMonthDayCell;
  v6 = a3;
  -[HKCalendarDayCell updateWithDate:dayOfMonth:](&v12, sel_updateWithDate_dayOfMonth_, v6, a4);
  -[HKMonthDayCell _setCircleState:](self, "_setCircleState:", 0, v12.receiver, v12.super_class);
  -[HKMonthDayCell setSelected:](self, "setSelected:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 512, v6);

  self->_dayOfWeek = v8;
  if (-[HKCalendarDayCell representsToday](self, "representsToday"))
  {
    HKHealthKeyColor();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[HKMonthDayCell _representsWeekendDay](self, "_representsWeekendDay"))
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  -[HKCalendarDayCell setTextColor:](self, "setTextColor:", v9);

  -[HKMonthDayCell _updateFontAndCircle](self, "_updateFontAndCircle");
  -[HKCalendarDayCell textColor](self, "textColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCalendarDayCell updateDateTextForDayNumber:textColor:](self, "updateDateTextForDayNumber:textColor:", a4, v11);

}

- (void)pressToTransition:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[HKMonthDayCell circleState](self, "circleState") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.3);
    -[HKMonthDayCell _setCircleState:](self, "_setCircleState:", v3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKMonthDayCell;
  -[HKCalendarDayCell setSelected:](&v6, sel_setSelected_);
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  -[HKMonthDayCell _setCircleState:](self, "_setCircleState:", v5);
}

- (int64_t)circleState
{
  return self->_circleState;
}

@end
