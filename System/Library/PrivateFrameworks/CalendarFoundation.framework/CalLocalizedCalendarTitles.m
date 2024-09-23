@implementation CalLocalizedCalendarTitles

+ (id)localizedTitleForTitle:(id)a3 isSuggestedEventCalendar:(BOOL)a4 isBirthdayCalendar:(BOOL)a5 allowsReminders:(BOOL)a6 isIntegrationCalendar:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  void *v14;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("DEFAULT_CALENDAR_NAME")))
  {
    objc_msgSend(a1, "localizedDefaultCalendarTitle");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("DEFAULT_TASK_CALENDAR_NAME")))
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("VIRTUAL_APP_CALENDAR_NAME")))
      {
        objc_msgSend(a1, "localizedVirtualCalendarTitle");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (v7)
      {
        objc_msgSend(a1, "localizedScheduledRemindersCalendarTitle");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (+[CalCompatibility isProgramSDKAtLeast:](CalCompatibility, "isProgramSDKAtLeast:", 0x7E30901FFFFFFFFLL))
      {
        if (v10)
        {
          objc_msgSend(a1, "localizedSiriSuggestedEventsCalendarTitle");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (v9)
        {
          objc_msgSend(a1, "localizedBirthdayCalendarTitle");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      if (!v8 || !objc_msgSend(v12, "isEqualToString:", CFSTR("Reminders")))
      {
        v13 = v12;
        goto LABEL_17;
      }
    }
    objc_msgSend(a1, "localizedDefaultReminderListTitle");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_17:
  v14 = v13;

  return v14;
}

+ (id)localizedDefaultCalendarTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Default calendar name"), CFSTR("Calendar"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedDefaultReminderListTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("default reminders list name"), CFSTR("Reminders"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedVirtualCalendarTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("virtual calendar name"), CFSTR("Calendar"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedSiriSuggestedEventsCalendarTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Siri Suggestions"), &stru_1E2A86598, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedBirthdayCalendarTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Birthdays"), &stru_1E2A86598, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedScheduledRemindersCalendarTitle
{
  void *v2;
  void *v3;

  +[CalFoundationBundle bundle](CalFoundationBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Scheduled Reminders"), &stru_1E2A86598, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
