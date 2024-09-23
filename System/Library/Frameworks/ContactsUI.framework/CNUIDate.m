@implementation CNUIDate

+ (void)initialize
{
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

    v4 = dispatch_queue_create(0, 0);
    v5 = (void *)calendarQueue;
    calendarQueue = (uint64_t)v4;

  }
}

+ (void)localeDidChange:(id)a3
{
  dispatch_async((dispatch_queue_t)calendarQueue, &__block_literal_global_4834);
}

+ (id)currentCalendarGMT
{
  dispatch_sync((dispatch_queue_t)calendarQueue, &__block_literal_global_2_4833);
  return (id)currentCalendar;
}

+ (id)gregorianCalendarGMT
{
  if (gregorianCalendarGMT_onceToken != -1)
    dispatch_once(&gregorianCalendarGMT_onceToken, &__block_literal_global_5_4832);
  return (id)gregorianCalendarGMT_calendar;
}

+ (id)GMTComponentsFromDate:(id)a3 sourceCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "gregorianCalendarGMT");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsFromDate:sourceCalendar:destinationCalendar:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)componentsFromDate:(id)a3 sourceCalendar:(id)a4 destinationCalendar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend(v8, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v11);

  objc_msgSend(v8, "components:fromDate:", 1048606, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v12))
    objc_msgSend(a1, "yearlessComponentsFromDate:calendar:", v9, v10);
  else
    objc_msgSend(v10, "components:fromDate:", 1048606, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)yearlessGregorianComponentsFromGMTDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "gregorianCalendarGMT");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "yearlessComponentsFromDate:calendar:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)yearlessComponentsFromDate:(id)a3 calendar:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(v5, "components:fromDate:", 24, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCalendar:", v5);

  return v6;
}

+ (id)dateFromComponents:(id)a3 destinationCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

  }
  else
  {
    +[CNUIDate gregorianCalendarGMT](CNUIDate, "gregorianCalendarGMT");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v11, "setHour:", 12);
  objc_msgSend(v11, "setMinute:", 0);
  objc_msgSend(v11, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);

  if (+[CNUIDate isYearlessComponents:](CNUIDate, "isYearlessComponents:", v11))
  {
    objc_msgSend(v11, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(a1, "currentCalendarGMT");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCalendar:", v14);

    }
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getEra:year:month:day:fromDate:", &v24, 0, 0, 0, v15);

    objc_msgSend(v11, "setEra:", v24);
    objc_msgSend(MEMORY[0x1E0D3EFB0], "setYearlessYear:forCalendar:", v11, v9);
    objc_msgSend(v9, "dateFromComponents:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v9)
  {
    objc_msgSend(v11, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:", 2097182, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v9;
    v21 = v19;
LABEL_11:
    objc_msgSend(v20, "dateFromComponents:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend(v11, "calendar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(a1, "currentCalendarGMT");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    v21 = v11;
    goto LABEL_11;
  }
  objc_msgSend(v11, "date");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v17 = (void *)v16;
LABEL_12:

  return v17;
}

+ (id)dateByNormalizingToGMT:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99D48];
    v4 = a3;
    objc_msgSend(v3, "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setHour:", 12);
    objc_msgSend(v6, "setMinute:", 0);
    objc_msgSend(v6, "setSecond:", 0);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v7);

    objc_msgSend(v5, "dateFromComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)isYearlessComponents:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(v3, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isYearlessDate:forCalendar:", v3, v6);

  }
  return v4;
}

void __32__CNUIDate_gregorianCalendarGMT__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)gregorianCalendarGMT_calendar;
  gregorianCalendarGMT_calendar = v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)gregorianCalendarGMT_calendar, "setTimeZone:", v3);

}

void __30__CNUIDate_currentCalendarGMT__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (!currentCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)currentCalendar;
    currentCalendar = v0;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)currentCalendar, "setTimeZone:", v2);

  }
}

void __28__CNUIDate_localeDidChange___block_invoke()
{
  void *v0;

  v0 = (void *)currentCalendar;
  currentCalendar = 0;

}

@end
