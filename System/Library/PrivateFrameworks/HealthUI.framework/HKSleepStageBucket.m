@implementation HKSleepStageBucket

BOOL __42___HKSleepStageBucket__probableSleepStage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "integerValue");
  v6 = objc_msgSend(v4, "integerValue");

  return v5 > v6;
}

@end
