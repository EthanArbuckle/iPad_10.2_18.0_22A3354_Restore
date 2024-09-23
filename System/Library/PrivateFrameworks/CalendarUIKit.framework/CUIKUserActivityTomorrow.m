@implementation CUIKUserActivityTomorrow

- (CUIKUserActivityTomorrow)initWithDate:(id)a3 view:(unint64_t)a4 calendar:(id)a5
{
  CUIKUserActivityTomorrow *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityTomorrow;
  v5 = -[CUIKUserActivityCalendarDate initWithDate:view:calendar:](&v9, sel_initWithDate_view_calendar_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("View Tomorrow"), &stru_1E6EBAE30, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKUserActivity setActivityTitle:](v5, "setActivityTitle:", v7);

  }
  return v5;
}

- (CUIKUserActivityTomorrow)initWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CUIKUserActivityTomorrow *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("com.apple.calendarUIKit.userActivity.date"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityTomorrow;
  v9 = -[CUIKUserActivityCalendarDate initWithDictionary:](&v11, sel_initWithDictionary_, v4);

  return v9;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8.receiver = self;
  v8.super_class = (Class)CUIKUserActivityTomorrow;
  -[CUIKUserActivityCalendarDate dictionary](&v8, sel_dictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("com.apple.calendarUIKit.userActivity.tomorrow"));

  return v5;
}

- (void)updateActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityTomorrow;
  v4 = a3;
  -[CUIKUserActivityCalendarDate updateActivity:](&v9, sel_updateActivity_, v4);
  objc_msgSend(v4, "_setEligibleForPrediction:", 1, v9.receiver, v9.super_class);
  objc_msgSend(v4, "setEligibleForSearch:", 1);
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[CUIKUserActivityTomorrow dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObject:", CFSTR("com.apple.calendarUIKit.userActivity.date"));
  objc_msgSend(v8, "removeObject:", CFSTR("com.apple.calendarUIKit.userActivity.view"));
  objc_msgSend(v4, "setRequiredUserInfoKeys:", v8);

}

- (BOOL)isTomorrow
{
  return 1;
}

@end
