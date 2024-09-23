@implementation CNDateHelper

+ (BOOL)isComponentsEmpty:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "year") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "month") == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "day") == 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 1;

  return v5;
}

+ (id)gregorianCalendar
{
  if (gregorianCalendar_cn_once_token_1 != -1)
    dispatch_once(&gregorianCalendar_cn_once_token_1, &__block_literal_global_82);
  return (id)gregorianCalendar_cn_once_object_1;
}

void __33__CNDateHelper_gregorianCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)gregorianCalendar_cn_once_object_1;
  gregorianCalendar_cn_once_object_1 = v1;

}

+ (id)gregorianCalendarInGMT
{
  if (gregorianCalendarInGMT_onceToken != -1)
    dispatch_once(&gregorianCalendarInGMT_onceToken, &__block_literal_global_1_3);
  return (id)gregorianCalendarInGMT_sGregorianInGMT;
}

void __38__CNDateHelper_gregorianCalendarInGMT__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (id)objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)gregorianCalendarInGMT_sGregorianInGMT;
  gregorianCalendarInGMT_sGregorianInGMT = v2;

}

+ (int64_t)currentGregorianYearInGMT
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "gregorianYearInGMTFromDate:", v3);

  return v4;
}

+ (int64_t)gregorianYearInGMTFromDate:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  objc_msgSend(a1, "gregorianCalendarInGMT");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 4, v4);

  return v6;
}

+ (int64_t)gregorianYearFromDate:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  objc_msgSend(a1, "gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 4, v4);

  return v6;
}

+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateWithYear:month:day:hour:minute:second:timeZone:", a3, a4, a5, 12, 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9
{
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v16 = (objc_class *)MEMORY[0x1E0C99D78];
  v17 = a9;
  v18 = objc_alloc_init(v16);
  objc_msgSend(v18, "setYear:", a3);
  objc_msgSend(v18, "setMonth:", a4);
  objc_msgSend(v18, "setDay:", a5);
  objc_msgSend(v18, "setHour:", a6);
  objc_msgSend(v18, "setMinute:", a7);
  objc_msgSend(v18, "setSecond:", a8);
  objc_msgSend(v18, "setTimeZone:", v17);

  objc_msgSend(a1, "gregorianCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateFromComponents:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)componentsFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 2130172, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCalendar:", v5);
  return v6;
}

+ (id)componentsForJanuary1WithYear:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setYear:", a3);
  objc_msgSend(v4, "setMonth:", 1);
  objc_msgSend(v4, "setDay:", 1);
  objc_msgSend(v4, "setHour:", 0);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v6);

  return v4;
}

+ (id)dateComponentsInCalendar:(id)a3 fromGregorianDateComponents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  Class IntlUtilityClass;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  if (!v7
    || (objc_msgSend(v6, "calendarIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996C8]),
        v8,
        v9)
    || objc_msgSend(v7, "day") == 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v7, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7;
  }
  else
  {
    v12 = (void *)objc_msgSend(v7, "copy");
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    IntlUtilityClass = getIntlUtilityClass();
    objc_msgSend(a1, "gregorianCalendarInGMT");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setYearlessYear:forCalendar:](IntlUtilityClass, "setYearlessYear:forCalendar:", v13, v16);

    -[objc_class setYearlessYear:forCalendar:](getIntlUtilityClass(), "setYearlessYear:forCalendar:", v14, v6);
    if (objc_msgSend(v7, "year") == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "setYear:", objc_msgSend(v13, "year"));
      v17 = 1;
    }
    else
    {
      v18 = objc_msgSend(v7, "year");
      v17 = v18 == objc_msgSend(v13, "year");
    }
    objc_msgSend(a1, "gregorianCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateFromComponents:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "components:fromDate:", 1048606, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v21;
    if (v17 || (v22 = objc_msgSend(v21, "year"), v22 == objc_msgSend(v14, "year")))
      objc_msgSend(v10, "setYear:", 0x7FFFFFFFFFFFFFFFLL);

  }
  return v10;
}

+ (id)gregorianDateComponentsFromDateComponents:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  Class IntlUtilityClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C996C8]);

    if (!v9)
    {
      v11 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v11, "calendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v11, "setCalendar:", v13);

      objc_msgSend(v4, "timeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v4, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "calendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!v15)
      {
        objc_msgSend(a1, "gregorianCalendarInGMT");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v4, "year") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v4, "era") == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "dateComponentsInGregorianYearlessYearForYearlessDateComponents:timeZone:", v4, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18)
        {
          IntlUtilityClass = getIntlUtilityClass();
          objc_msgSend(v11, "calendar");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class setYearlessYear:forCalendar:](IntlUtilityClass, "setYearlessYear:forCalendar:", v11, v22);

          objc_msgSend(a1, "gregorianCalendarInGMT");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "calendar");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dateFromComponents:", v11);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "componentsInTimeZone:fromDate:", v15, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNDateHelper dateComponentsFromDateComponents:preservingUnits:](CNDateHelper, "dateComponentsFromDateComponents:preservingUnits:", v26, 1048606);
          v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
          goto LABEL_17;
        }
        v20 = v18;
        v19 = v20;
      }
      else
      {
        objc_msgSend(a1, "gregorianCalendarInGMT");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "calendar");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "dateFromComponents:", v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsInTimeZone:fromDate:", v15, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        +[CNDateHelper dateComponentsFromDateComponents:preservingUnits:](CNDateHelper, "dateComponentsFromDateComponents:preservingUnits:", v19, 1048606);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v20;
      goto LABEL_16;
    }
  }
  v10 = v4;
LABEL_17:

  return v10;
}

+ (id)dateComponentsInGregorianYearlessYearForYearlessDateComponents:(id)a3 timeZone:(id)a4
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
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "gregorianCalendarInGMT");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  -[objc_class setYearlessYear:forCalendar:](getIntlUtilityClass(), "setYearlessYear:forCalendar:", v9, v8);
  objc_msgSend(v9, "setMonth:", 1);
  objc_msgSend(v9, "setDay:", 1);
  objc_msgSend(v9, "setCalendar:", v8);
  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v11, "setSecond:", 1);
  objc_msgSend(v7, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "nextDateAfterDate:matchingComponents:options:", v10, v11, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v14, "setYear:", objc_msgSend(v14, "year") + 1);
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "compare:", v15) == -1)
    {
      objc_msgSend(v8, "componentsInTimeZone:fromDate:", v6, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNDateHelper dateComponentsFromDateComponents:preservingUnits:](CNDateHelper, "dateComponentsFromDateComponents:preservingUnits:", v17, 1048606);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)dateComponentsFromDateComponents:(id)a3 preservingUnits:(unint64_t)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v6, "setHour:", objc_msgSend(v5, "hour"));
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "minute"));
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v6, "setSecond:", objc_msgSend(v5, "second"));
  if ((v4 & 0x8000) == 0)
  {
LABEL_9:
    if ((v4 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v6, "setNanosecond:", objc_msgSend(v5, "nanosecond"));
  if ((v4 & 0x200) == 0)
  {
LABEL_10:
    if ((v4 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v6, "setWeekday:", objc_msgSend(v5, "weekday"));
  if ((v4 & 0x400) == 0)
  {
LABEL_11:
    if ((v4 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v6, "setWeekdayOrdinal:", objc_msgSend(v5, "weekdayOrdinal"));
  if ((v4 & 0x800) == 0)
  {
LABEL_12:
    if ((v4 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v6, "setQuarter:", objc_msgSend(v5, "quarter"));
  if ((v4 & 0x1000) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v6, "setWeekOfMonth:", objc_msgSend(v5, "weekOfMonth"));
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v6, "setWeekOfYear:", objc_msgSend(v5, "weekOfYear"));
  if ((v4 & 0x4000) == 0)
  {
LABEL_15:
    if ((v4 & 0x100000) == 0)
      goto LABEL_16;
LABEL_33:
    objc_msgSend(v5, "calendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCalendar:", v9);

    if ((v4 & 0x200000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  objc_msgSend(v6, "setYearForWeekOfYear:", objc_msgSend(v5, "yearForWeekOfYear"));
  if ((v4 & 0x100000) != 0)
    goto LABEL_33;
LABEL_16:
  if ((v4 & 0x200000) != 0)
  {
LABEL_17:
    objc_msgSend(v5, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

  }
LABEL_18:

  return v6;
}

+ (BOOL)isGregorianDerivedCalendar:(id)a3
{
  void *v4;

  objc_msgSend(a3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isGregorianDerivedCalendarIdentifier:", v4);

  return (char)a1;
}

+ (BOOL)isGregorianDerivedCalendarIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996C8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C99708]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C996D8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C99698]);
  }

  return v4;
}

@end
