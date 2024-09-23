@implementation AMSMetricsEventDeepCopyJSONArray

id __AMSMetricsEventDeepCopyJSONArray_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)MEMORY[0x18D78A1C4]();
  AMSMetricsEventDeepCopyJSONObject(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v3);

  return v4;
}

@end
