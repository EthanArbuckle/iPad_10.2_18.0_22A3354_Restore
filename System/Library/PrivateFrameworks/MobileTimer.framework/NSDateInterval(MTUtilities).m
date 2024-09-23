@implementation NSDateInterval(MTUtilities)

- (uint64_t)mtContainsDate:()MTUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToDate:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToDate:", v4) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(a1, "containsDate:", v4);

  }
  return v6;
}

+ (id)mtDateIntervalWithEndDate:()MTUtilities duration:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3588];
  v6 = a4;
  v7 = [v5 alloc];
  objc_msgSend(v6, "dateByAddingTimeInterval:", -a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v6);

  return v9;
}

@end
