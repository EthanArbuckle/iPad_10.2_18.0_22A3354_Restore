@implementation CalFloatingDateHelper

+ (void)_initCustomCalendar
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)floatingDateCustomCalendar;
  floatingDateCustomCalendar = v3;

}

+ (id)dateInTimeZone:(id)a3 fromFloatingDateInGMT:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (floatingDatePredicate != -1)
      dispatch_once(&floatingDatePredicate, &__block_literal_global_26);
    v7 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v9);
    objc_msgSend(v8, "components:fromDate:", 252, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)floatingDateCustomCalendar;
    objc_sync_enter(v11);
    objc_msgSend((id)floatingDateCustomCalendar, "setTimeZone:", v5);
    objc_msgSend((id)floatingDateCustomCalendar, "dateFromComponents:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __62__CalFloatingDateHelper_dateInTimeZone_fromFloatingDateInGMT___block_invoke()
{
  return +[CalFloatingDateHelper _initCustomCalendar](CalFloatingDateHelper, "_initCustomCalendar");
}

+ (id)dateInFloatingTimeZoneFromDate:(id)a3 inTimeZone:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (floatingDatePredicate != -1)
      dispatch_once(&floatingDatePredicate, &__block_literal_global_4_0);
    v7 = (id)floatingDateCustomCalendar;
    objc_sync_enter(v7);
    objc_msgSend((id)floatingDateCustomCalendar, "setTimeZone:", v6);
    objc_msgSend((id)floatingDateCustomCalendar, "components:fromDate:", 252, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v7);

    v9 = objc_alloc(MEMORY[0x1E0C99D48]);
    v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", v11);
    objc_msgSend(v10, "dateFromComponents:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __67__CalFloatingDateHelper_dateInFloatingTimeZoneFromDate_inTimeZone___block_invoke()
{
  return +[CalFloatingDateHelper _initCustomCalendar](CalFloatingDateHelper, "_initCustomCalendar");
}

@end
