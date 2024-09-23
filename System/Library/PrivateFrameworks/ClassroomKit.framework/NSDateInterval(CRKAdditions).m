@implementation NSDateInterval(CRKAdditions)

- (uint64_t)crk_containsCurrentDate
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "containsDate:", v2);

  return v3;
}

- (id)crk_dateIntervalByAddingTimeInterval:()CRKAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStartDate:endDate:", v5, v7);
  return v8;
}

@end
