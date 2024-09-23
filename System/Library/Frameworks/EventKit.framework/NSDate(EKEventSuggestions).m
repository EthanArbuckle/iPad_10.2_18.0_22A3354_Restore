@implementation NSDate(EKEventSuggestions)

- (id)nextDateMatchingTimeComponents
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v2, a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isBeforeDate:", v2))
  {
    objc_msgSend(v2, "dateByAddingDays:inCalendar:", 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithDatePartFromDate:timePartFromDate:inCalendar:", v4, a1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (id)localizedShortTimeInTimeZone:()EKEventSuggestions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)_dateWithTimeZoneFormatter;
  if (!_dateWithTimeZoneFormatter)
  {
    v6 = objc_opt_new();
    v7 = (void *)_dateWithTimeZoneFormatter;
    _dateWithTimeZoneFormatter = v6;

    v8 = (void *)_dateWithTimeZoneFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocale:", v9);

    objc_msgSend((id)_dateWithTimeZoneFormatter, "setTimeStyle:", 1);
    v5 = (void *)_dateWithTimeZoneFormatter;
  }
  objc_msgSend(v5, "setTimeZone:", v4);
  objc_msgSend((id)_dateWithTimeZoneFormatter, "stringFromDate:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
