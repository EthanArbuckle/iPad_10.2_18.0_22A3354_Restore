@implementation NSPredicate(HKDayIndex)

+ (id)hk_predicateForSamplesInDayIndexRange:()HKDayIndex
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "hk_earliestPossibleDateWithDayIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 <= 0)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = a4 + a3 - 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_latestPossibleDateWithDayIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
