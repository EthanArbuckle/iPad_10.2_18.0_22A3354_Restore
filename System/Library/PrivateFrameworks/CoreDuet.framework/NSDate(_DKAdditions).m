@implementation NSDate(_DKAdditions)

- (double)timeSinceMidnight:()_DKAdditions
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  if (timeSinceMidnight__initialized != -1)
    dispatch_once(&timeSinceMidnight__initialized, &__block_literal_global_34);
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend((id)timeSinceMidnight__calendar, "components:fromDate:", 28, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)timeSinceMidnight__calendar, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v7);
  v9 = v8;
  if (a3)
  {

    objc_autoreleasePoolPop(v5);
    v10 = objc_retainAutorelease(v7);
    *a3 = v10;

  }
  else
  {

    objc_autoreleasePoolPop(v5);
  }
  return v9;
}

- (uint64_t)floorDateWithTotalSlotsInDay:()_DKAdditions
{
  double v5;

  objc_msgSend(a1, "timeSinceMidnight:", 0);
  return objc_msgSend(a1, "dateByAddingTimeInterval:", (double)((uint64_t)(v5 / 86400.0 * (double)a3) * (86400 / a3)) - v5);
}

- (uint64_t)slotFromMidnightWithTotalSlotsInDay:()_DKAdditions
{
  double v4;

  objc_msgSend(a1, "timeSinceMidnight:", 0);
  return (int)(v4 / 86400.0 * (double)a3);
}

@end
