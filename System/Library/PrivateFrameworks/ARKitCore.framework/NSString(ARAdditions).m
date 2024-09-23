@implementation NSString(ARAdditions)

+ (uint64_t)ar_hoursMinutesSecondsWithTimeInterval:()ARAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%02lu:%02lu"), (unint64_t)a1 / 0xE10, (unint64_t)a1 % 0xE10 / 0x3C, (unint64_t)a1 % 0xE10 % 0x3C);
}

+ (id)ar_timestampWithDate:()ARAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E80];
  v5 = a3;
  objc_msgSend(v4, "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ar_timestampWithDate:timeZone:locale:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ar_timestampWithDate:()ARAdditions timeZone:locale:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0C99D48];
    v8 = a5;
    v9 = a4;
    v10 = a3;
    objc_msgSend(v7, "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v8);
    objc_msgSend(v11, "setTimeZone:", v9);
    objc_msgSend(v11, "components:fromDate:", 33020, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)rint((double)objc_msgSend(v12, "nanosecond") / 1000.0);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setDateFormat:", CFSTR("Z"));
    objc_msgSend(v14, "setLocale:", v8);

    objc_msgSend(v14, "setTimeZone:", v9);
    objc_msgSend(v14, "stringFromDate:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld %02ld:%02ld:%02ld.%06ld %@"), objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day"), objc_msgSend(v12, "hour"), objc_msgSend(v12, "minute"), objc_msgSend(v12, "second"), v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)ar_pathSafeTimestampWithDate:()ARAdditions
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ar_removePrefix:()ARAdditions
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasPrefix:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (id)ar_removeSuffix:()ARAdditions
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "hasSuffix:", v4) & 1) != 0)
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  v6 = v5;

  return v6;
}

@end
