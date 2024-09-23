@implementation NSDate(CLSNSDateExtensions)

- (id)dateByAddingDays:()CLSNSDateExtensions
{
  return +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", a3, a1);
}

- (id)nextWeekend
{
  return +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", (7 - +[CLSCalendar dayFromDate:](CLSCalendar, "dayFromDate:", a1)) % 7, a1);
}

- (id)previousWeekend
{
  return +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", -+[CLSCalendar dayOfWeekFromDate:](CLSCalendar, "dayOfWeekFromDate:", a1), a1);
}

+ (id)dateFromString:()CLSNSDateExtensions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  if (!v3)
    goto LABEL_13;
  if (dateFromString__onceToken != -1)
    dispatch_once(&dateFromString__onceToken, &__block_literal_global_1914);
  objc_msgSend((id)dateFromString__formatter1, "dateFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend((id)dateFromString__formatter2, "dateFromString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          objc_msgSend((id)dateFromString__calendar, "components:fromDate:", 252, v5),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v7, 0), v4 = (void *)objc_claimAutoreleasedReturnValue(), v6, v7, !v4))
    {
      objc_msgSend((id)dateFromString__formatter3, "dateFromString:", v3);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8
        || (v9 = (void *)v8,
            objc_msgSend((id)dateFromString__calendar, "components:fromDate:", 28, v8),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v10, 0), v4 = (void *)objc_claimAutoreleasedReturnValue(), v9, v10, !v4))
      {
        objc_msgSend((id)dateFromString__formatter4, "dateFromString:", v3);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_11;
        v12 = (void *)v11;
        v13 = (void *)dateFromString__calendar;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "components:fromDate:", 28, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)dateFromString__calendar, "components:fromDate:", 224, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHour:", objc_msgSend(v16, "hour"));
        objc_msgSend(v15, "setMinute:", objc_msgSend(v16, "minute"));
        objc_msgSend(v15, "setSecond:", objc_msgSend(v16, "second"));
        +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v15, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
LABEL_11:
          objc_msgSend((id)dateFromString__formatter5, "dateFromString:", v3);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            v19 = (void *)dateFromString__calendar;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "components:fromDate:", 28, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)dateFromString__calendar, "components:fromDate:", 96, v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setHour:", objc_msgSend(v22, "hour"));
            objc_msgSend(v21, "setMinute:", objc_msgSend(v22, "minute"));
            +[CLSCalendar dateFromComponents:inTimeZone:](CLSCalendar, "dateFromComponents:inTimeZone:", v21, 0);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }
LABEL_13:
          v4 = 0;
        }
      }
    }
  }
LABEL_14:

  return v4;
}

+ (id)dateComponentsFromString:()CLSNSDateExtensions
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (v3)
  {
    if (dateComponentsFromString__onceToken != -1)
      dispatch_once(&dateComponentsFromString__onceToken, &__block_literal_global_14);
    objc_msgSend((id)dateComponentsFromString__formatter1, "dateFromString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)dateComponentsFromString__calendar;
      v7 = (void *)dateComponentsFromString__formatter1;
    }
    else
    {
      objc_msgSend((id)dateComponentsFromString__formatter2, "dateFromString:", v3);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v5 = (void *)v9;
        v6 = (void *)dateComponentsFromString__calendar;
        v7 = (void *)dateComponentsFromString__formatter2;
      }
      else
      {
        objc_msgSend((id)dateComponentsFromString__formatter3, "dateFromString:", v3);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v5 = (void *)v10;
          v6 = (void *)dateComponentsFromString__calendar;
          v7 = (void *)dateComponentsFromString__formatter3;
        }
        else
        {
          objc_msgSend((id)dateComponentsFromString__formatter4, "dateFromString:", v3);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (void *)v11;
            v6 = (void *)dateComponentsFromString__calendar;
            v7 = (void *)dateComponentsFromString__formatter4;
          }
          else
          {
            objc_msgSend((id)dateComponentsFromString__formatter5, "dateFromString:", v3);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v5)
            {
              v8 = 0;
              goto LABEL_16;
            }
            v6 = (void *)dateComponentsFromString__calendar;
            v7 = (void *)dateComponentsFromString__formatter5;
          }
        }
      }
    }
    objc_msgSend(v7, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsInTimeZone:fromDate:", v12, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

@end
