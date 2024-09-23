@implementation NSDate(NNMKAdditions)

+ (id)nnmk_startOfCurrentDay
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "components:fromDate:", 252, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setHour:", 0);
  objc_msgSend(v2, "setMinute:", 0);
  objc_msgSend(v2, "setSecond:", 0);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)nnmk_isToday
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "nnmk_startOfCurrentDay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) != -1;

  return v3;
}

@end
