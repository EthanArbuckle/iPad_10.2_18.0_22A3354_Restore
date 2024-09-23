@implementation HKQuantitySample(HKMostRecentValueDataProvider)

- (HKGenericQuantityDataProviderCurrentValue)dataProviderValue
{
  HKGenericQuantityDataProviderCurrentValue *v2;
  void *v3;
  HKGenericQuantityDataProviderCurrentValue *v4;
  void *v5;

  v2 = [HKGenericQuantityDataProviderCurrentValue alloc];
  objc_msgSend(a1, "quantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKGenericQuantityDataProviderCurrentValue initWithQuantity:](v2, "initWithQuantity:", v3);

  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGenericQuantityDataProviderCurrentValue setDate:](v4, "setDate:", v5);

  return v4;
}

@end
