@implementation NSDate(SFAnalytics)

- (double)timeIntervalSince1970WithBucket:()SFAnalytics
{
  double v1;
  double v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "bucketToRoundingFactor:");
  v2 = v1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  return v5 + v2 - (double)((uint64_t)v5 % (uint64_t)v2);
}

- (double)bucketToRoundingFactor:()SFAnalytics
{
  double result;

  result = 60.0;
  if (a3 != 1)
    result = 1.0;
  if (a3 == 2)
    return 3600.0;
  return result;
}

@end
