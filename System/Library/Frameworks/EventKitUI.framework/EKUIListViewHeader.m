@implementation EKUIListViewHeader

+ (id)headerWithTableView:(id)a3 reuseIdentifier:(id)a4 date:(id)a5 timeZone:(id)a6 currentYearStart:(id *)a7 currentYearEnd:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = a5;
  v15 = a6;
  objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "_stringForHeaderDate:currentYearStart:currentYearEnd:timeZone:", v14, a7, a8, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v18);
    objc_msgSend(v17, "setPrefersSideBySideTextAndSecondaryText:", 1);
    if (CUIKNSDateIsToday())
      CUIKAppTintColor();
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColor:", v19);

    CUIKGetOverlayCalendar();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D0CD50], "monthDayStringForDate:inCalendar:", v14, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSecondaryText:", v22);

    }
    else
    {
      objc_msgSend(v17, "setSecondaryText:", 0);
    }

  }
  objc_msgSend(v16, "setContentConfiguration:", v17);

  return v16;
}

+ (id)_stringForHeaderDate:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a3;
  if (objc_msgSend(a1, "_isDateInCurrentYear:currentYearStart:currentYearEnd:timeZone:", v10, a4, a5, a6))
    CUIKLongDayStringForDateNoYear();
  else
    CUIKLongDayStringForDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedUppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)_isDateInCurrentYear:(id)a3 currentYearStart:(id *)a4 currentYearEnd:(id *)a5 timeZone:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v9 = a3;
  v10 = a6;
  if (!*a4)
  {
    v11 = (void *)MEMORY[0x1E0D0C420];
    CUIKNowDate();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calendarDateWithDate:timeZone:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "calendarDateForYear");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "calendarDateForEndOfYear");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_msgSend(v9, "compare:") != -1 && objc_msgSend(v9, "compare:", *a5) != 1;

  return v16;
}

@end
