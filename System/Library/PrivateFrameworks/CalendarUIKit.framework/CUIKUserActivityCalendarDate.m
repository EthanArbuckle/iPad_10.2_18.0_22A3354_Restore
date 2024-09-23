@implementation CUIKUserActivityCalendarDate

- (void)updateActivity:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CUIKUserActivityCalendarDate;
  -[CUIKUserActivity updateActivity:](&v5, sel_updateActivity_, v4);
  objc_msgSend(v4, "_setEligibleForPrediction:", 0);
  if (-[CUIKUserActivity type](self, "type") == 4097)
    objc_msgSend(v4, "_setEligibleForUserActivityIndexing:", 0);

}

- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5
{
  id v9;
  id v10;
  CUIKUserActivityCalendarDate *v11;
  CUIKUserActivityCalendarDate *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v9 = a3;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CUIKUserActivityCalendarDate;
  v11 = -[CUIKUserActivity initWithType:](&v22, sel_initWithType_, 4097);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    v12->_view = a4;
    switch(a4)
    {
      case 0uLL:
        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar");
        goto LABEL_9;
      case 1uLL:
        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar Day View");
        goto LABEL_9;
      case 2uLL:
        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar Week View");
        goto LABEL_9;
      case 3uLL:
      case 6uLL:
        +[CUIKDateStrings yearMonthStringForDate:inCalendar:](CUIKDateStrings, "yearMonthStringForDate:inCalendar:", v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKUserActivity setActivityTitle:](v12, "setActivityTitle:", v13);

        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar Month View");
        goto LABEL_9;
      case 4uLL:
        +[CUIKDateStrings yearStringForDate:inCalendar:](CUIKDateStrings, "yearStringForDate:inCalendar:", v9, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKUserActivity setActivityTitle:](v12, "setActivityTitle:", v17);

        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar Year View");
        goto LABEL_9;
      case 5uLL:
        CUIKBundle();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = CFSTR("Calendar List View");
LABEL_9:
        objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E6EBAE30, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKUserActivity setActivitySubtitle:](v12, "setActivitySubtitle:", v18);

        break;
      default:
        break;
    }
    -[CUIKUserActivity activityTitle](v12, "activityTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      +[CUIKDateStrings longStringForDate:inCalendar:](CUIKDateStrings, "longStringForDate:inCalendar:", v9, v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKUserActivity setActivityTitle:](v12, "setActivityTitle:", v20);

    }
  }

  return v12;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityCalendarDate;
  -[CUIKUserActivity dictionary](&v11, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v12[0] = CFSTR("com.apple.calendarUIKit.userActivity.date");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("com.apple.calendarUIKit.userActivity.view");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_view);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

- (CUIKUserActivityCalendarDate)initWithDate:(id)a3 view:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  CUIKUserActivityCalendarDate *v9;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a3;
  objc_msgSend(v6, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CUIKUserActivityCalendarDate initWithDate:view:calendar:](self, "initWithDate:view:calendar:", v7, a4, v8);

  return v9;
}

- (CUIKUserActivityCalendarDate)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityCalendarDate *v5;
  double v6;
  CUIKUserActivityCalendarDate *v7;
  uint64_t v8;
  NSDate *date;
  uint64_t v10;
  unint64_t v11;
  char v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CUIKUserActivityCalendarDate;
  v5 = -[CUIKUserActivity initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (!v5)
  {
LABEL_8:
    v7 = v5;
    goto LABEL_9;
  }
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.date"), &v13);
  if (!v13)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v6);
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v10 = objc_msgSend((id)objc_opt_class(), "_unsignedIntegerFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.view"), &v13);
    if (v13)
      v11 = 0;
    else
      v11 = v10;
    v5->_view = v11;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)isTomorrow
{
  return 0;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)view
{
  return self->_view;
}

@end
