@implementation NSDate(IRExntensions)

- (BOOL)isEarlierThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == -1;
}

+ (uint64_t)isDate:()IRExntensions inSameDayAsDate:forTimeZoneInSeconds:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = (objc_class *)MEMORY[0x24BDBCE48];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  v11 = (void *)objc_msgSend(v10, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);
  v13 = objc_msgSend(v11, "isDate:inSameDayAsDate:", v9, v8);

  return v13;
}

+ (uint64_t)daysFromDate:()IRExntensions toDate:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (objc_class *)MEMORY[0x24BDBCE48];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "day");
  return v11;
}

- (BOOL)isLaterThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != -1;
}

- (BOOL)isEarlierThanOrEqualTo:()IRExntensions
{
  return objc_msgSend(a1, "compare:") != 1;
}

- (BOOL)isLaterThan:()IRExntensions
{
  return objc_msgSend(a1, "compare:") == 1;
}

@end
