@implementation EKUICalendarListViewHeader

- (EKUICalendarListViewHeader)initWithReuseIdentifier:(id)a3
{
  EKUICalendarListViewHeader *v3;
  EKUICalendarListViewHeader *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUICalendarListViewHeader;
  v3 = -[EKUICalendarListViewHeader initWithReuseIdentifier:](&v7, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    -[EKUICalendarListViewHeader calendarListContentConfiguration](v3, "calendarListContentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUICalendarListViewHeader setContentConfiguration:](v4, "setContentConfiguration:", v5);

  }
  return v4;
}

- (void)configureWithDate:(id)a3 timeZone:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[EKUICalendarListViewHeader calendarListContentConfiguration](self, "calendarListContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (CUIKNSDateIsToday())
    {
      CUIKAppTintColor();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D0C420], "calendarDateWithDate:timeZone:", v19, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "calendarDateForEndOfDay");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKNowDate();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "compare:", v12);

      if (v13 == -1)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v8;
    objc_msgSend(v7, "setMainTextColor:", v8);
    objc_msgSend((id)objc_opt_class(), "_mainDateStringWithDate:timeZone:abbreviate:", v19, v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainText:", v15);

    objc_msgSend((id)objc_opt_class(), "_mainDateStringWithDate:timeZone:abbreviate:", v19, v6, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainTextAbbr:", v16);

    objc_msgSend((id)objc_opt_class(), "_weekNumberStringWithDate:timeZone:", v19, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWeekNumberText:", v17);

    objc_msgSend((id)objc_opt_class(), "_overlayCalendarDateStringWithDate:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltCalendarText:", v18);

    -[EKUICalendarListViewHeader setContentConfiguration:](self, "setContentConfiguration:", v7);
  }

}

+ (id)_overlayCalendarDateStringWithDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  CUIKGetOverlayCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D0CD50], "monthDayStringForDate:inCalendar:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_weekNumberStringWithDate:(id)a3 timeZone:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showWeekNumbers");

  if (v6)
  {
    objc_msgSend(v4, "localizedWeekNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("W%@"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_mainDateStringWithDate:(id)a3 timeZone:(id)a4 abbreviate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a3;
  if ((objc_msgSend(a1, "_isDateInCurrentYear:timeZone:", v8, a4) & 1) != 0 || !v5)
  {
    CUIKLongEmDashDayStringForDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CUIKAbbreviatedEmDashDayStringForDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)_isDateInCurrentYear:(id)a3 timeZone:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D0C420];
  v7 = a4;
  CUIKNowDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarDateWithDate:timeZone:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "calendarDateForYear");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendarDateForEndOfYear");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "compare:", v12) != -1 && objc_msgSend(v5, "compare:", v13) != 1;

  return v14;
}

- (id)calendarListContentConfiguration
{
  EKUICalendarListContentConfiguration *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(EKUICalendarListContentConfiguration);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICalendarListContentConfiguration setMainTextColor:](v2, "setMainTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUICalendarListContentConfiguration setSecondaryTextColor:](v2, "setSecondaryTextColor:", v4);

  return v2;
}

@end
