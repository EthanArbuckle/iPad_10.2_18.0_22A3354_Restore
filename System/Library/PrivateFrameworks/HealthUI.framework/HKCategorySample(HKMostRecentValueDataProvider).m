@implementation HKCategorySample(HKMostRecentValueDataProvider)

- (HKGenericDataProviderCurrentValue)dataProviderValue
{
  HKGenericDataProviderCurrentValue *v2;
  void *v3;
  HKGenericDataProviderCurrentValue *v4;
  void *v5;

  v2 = [HKGenericDataProviderCurrentValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKGenericDataProviderCurrentValue initWithValue:](v2, "initWithValue:", v3);

  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGenericDataProviderCurrentValue setDate:](v4, "setDate:", v5);

  return v4;
}

@end
