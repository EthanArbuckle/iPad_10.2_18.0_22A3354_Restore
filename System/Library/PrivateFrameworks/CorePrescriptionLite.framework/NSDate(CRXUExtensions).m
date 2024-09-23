@implementation NSDate(CRXUExtensions)

- (id)crxu_dateByAddingDays:()CRXUExtensions
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x24BDBCE48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, a3, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)crxu_yearMonthDayComponents
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDBCE48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v3, "components:fromDate:", 28, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)crxu_dateWithYear:()CRXUExtensions month:day:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setDay:", a5);
  objc_msgSend(v8, "setMonth:", a4);
  objc_msgSend(v8, "setYear:", a3);
  v9 = objc_alloc(MEMORY[0x24BDBCE48]);
  v10 = (void *)objc_msgSend(v9, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v10, "dateFromComponents:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)crxu_numberOfDaysAfterDate:()CRXUExtensions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x24BDBCE48];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v14 = 0;
  objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 16, &v14, 0, v5);

  v8 = v14;
  v13 = 0;
  objc_msgSend(v7, "rangeOfUnit:startDate:interval:forDate:", 16, &v13, 0, a1);
  v9 = v13;
  objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  return v11;
}

- (BOOL)crxu_isAfter:()CRXUExtensions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v8 = v7;

  return v6 > v8;
}

- (BOOL)crxu_isBefore:()CRXUExtensions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v8 = v7;

  return v6 < v8;
}

+ (double)crxu_now
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSinceReferenceDate");
  v2 = v1;

  return v2;
}

@end
