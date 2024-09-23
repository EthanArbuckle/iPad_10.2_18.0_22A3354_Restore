@implementation NSCalendarDate(EKMSUIDAdditions)

- (id)ekmsuidGMTDateToDateInTimeZone:()EKMSUIDAdditions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a1, "dateByAddingYears:months:days:hours:minutes:seconds:", 0, 0, 0, 0, 0, -objc_msgSend(v4, "secondsFromGMTForDate:", a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);
  objc_msgSend(v4, "daylightSavingTimeOffsetForDate:", a1);
  v7 = v6;
  objc_msgSend(v4, "daylightSavingTimeOffsetForDate:", v5);
  v9 = v8;

  if (vabdd_f64(v7, v9) >= 2.22044605e-16)
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", v9 - v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  return v5;
}

- (id)ekmsuidStringForYearMonthDay
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptionWithCalendarFormat:timeZone:locale:", CFSTR("%Y%m%d"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
