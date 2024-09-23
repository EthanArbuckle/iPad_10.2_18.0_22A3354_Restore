@implementation NSCalendar(BaseBoard)

- (uint64_t)bs_dayPeriodForDate:()BaseBoard inLocale:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int DayPeriod;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(a4, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "components:fromDate:", 96, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hour");
  objc_msgSend(v8, "minute");
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "UTF8String");
  DayPeriod = uacal_getDayPeriod();
  v11 = 10;
  if (DayPeriod < 0xA)
    v11 = qword_18A21D290[DayPeriod];

  return v11;
}

@end
