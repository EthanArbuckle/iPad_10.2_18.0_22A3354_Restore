@implementation CUIKUserActivityRemindersListDate

- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3 calendar:(id)a4
{
  id v7;
  id v8;
  CUIKUserActivityRemindersListDate *v9;
  CUIKUserActivityRemindersListDate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CUIKUserActivityRemindersListDate;
  v9 = -[CUIKUserActivity initWithType:](&v17, sel_initWithType_, 3);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a3);
    +[CUIKDateStrings mediumStringForDate:inCalendar:](CUIKDateStrings, "mediumStringForDate:inCalendar:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Reminders on date"), CFSTR("Reminders on %@"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivityTitle:](v10, "setActivityTitle:", v15);

    -[CUIKUserActivity setActivitySubtitle:](v10, "setActivitySubtitle:", &stru_1E6EBAE30);
  }

  return v10;
}

- (CUIKUserActivityRemindersListDate)initWithDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CUIKUserActivityRemindersListDate *v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CUIKUserActivityRemindersListDate initWithDate:calendar:](self, "initWithDate:calendar:", v5, v6);

  return v7;
}

- (CUIKUserActivityRemindersListDate)initWithDictionary:(id)a3
{
  id v4;
  CUIKUserActivityRemindersListDate *v5;
  double v6;
  CUIKUserActivityRemindersListDate *v7;
  uint64_t v8;
  NSDate *date;
  char v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CUIKUserActivityRemindersListDate;
  v5 = -[CUIKUserActivity initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_5;
  v11 = 0;
  objc_msgSend((id)objc_opt_class(), "_doubleFromDictionary:key:error:", v4, CFSTR("com.apple.calendarUIKit.userActivity.date"), &v11);
  if (!v11)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v6);
    date = v5->_date;
    v5->_date = (NSDate *)v8;

LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v10.receiver = self;
  v10.super_class = (Class)CUIKUserActivityRemindersListDate;
  -[CUIKUserActivity dictionary](&v10, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v11 = CFSTR("com.apple.calendarUIKit.userActivity.date");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);

  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
