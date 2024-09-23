@implementation AMSMetricsEventDeepCopyJSONDictionary

AMSPair *__AMSMetricsEventDeepCopyJSONDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  AMSPair *v7;
  void *v8;
  AMSPair *v9;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x18D78A1C4]();
  v7 = [AMSPair alloc];
  AMSMetricsEventDeepCopyJSONObject(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSPair initWithFirst:second:](v7, "initWithFirst:second:", v4, v8);

  objc_autoreleasePoolPop(v6);
  return v9;
}

@end
