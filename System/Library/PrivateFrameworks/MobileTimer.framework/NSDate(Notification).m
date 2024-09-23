@implementation NSDate(Notification)

- (id)mtGreetingString:()Notification
{
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "bs_dayPeriodForDate:inLocale:", a1, v6);

  if (v7 > 0xA)
  {
    v10 = 0;
  }
  else
  {
    if (((1 << v7) & 0x2F0) != 0)
    {
      v8 = CFSTR("DND_BEDTIME_EVENING_GREETING_LOWERCASE");
      v9 = CFSTR("DND_BEDTIME_EVENING_GREETING");
    }
    else if (((1 << v7) & 0x10C) != 0)
    {
      v8 = CFSTR("DND_BEDTIME_AFTERNOON_GREETING_LOWERCASE");
      v9 = CFSTR("DND_BEDTIME_AFTERNOON_GREETING");
    }
    else
    {
      v8 = CFSTR("DND_BEDTIME_MORNING_GREETING_LOWERCASE");
      v9 = CFSTR("DND_BEDTIME_MORNING_GREETING");
    }
    if (a3)
      v8 = (__CFString *)v9;
    v10 = v8;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "component:fromDate:", 32, v13);

  if ((unint64_t)(v14 - 3) <= 6
    && -[__CFString hasPrefix:](v10, "hasPrefix:", CFSTR("DND_BEDTIME_EVENING_GREETING")))
  {
    v15 = CFSTR("DND_BEDTIME_MORNING_GREETING_LOWERCASE");
    if (a3)
      v15 = CFSTR("DND_BEDTIME_MORNING_GREETING");
    v16 = v15;

    v10 = v16;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.mobiletimer-framework"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v10, &stru_1E39CF258, CFSTR("Localizable_Burrito"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
