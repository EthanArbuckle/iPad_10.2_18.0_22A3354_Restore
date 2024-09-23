@implementation HKCategorySample(HKSleep)

+ (id)categorySampleWithType:()HKSleep value:clampedInterval:
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  v11 = v10;

  objc_msgSend(v8, "maximumAllowedDuration");
  if (v11 < v12)
    v12 = v11;
  objc_msgSend(v9, "dateByAddingTimeInterval:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", v8, a4, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
