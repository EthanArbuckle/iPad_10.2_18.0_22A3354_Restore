@implementation HKCategorySample(WDSleepStageSampleBucket)

- (uint64_t)sleep_belongsInBucket:()WDSleepStageSampleBucket
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "evaluateWithObject:", a1);

  return v5;
}

@end
