@implementation HKLastUpdatedDayCurrentValueDataProvider

- (id)currentValue
{
  void *v3;
  void *v4;
  HKLastUpdatedDayDataProviderCurrentValue *v5;
  void *v6;
  void *v7;

  -[HKValueDataProvider value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(HKLastUpdatedDayDataProviderCurrentValue);
    -[HKValueDataProvider value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKLastUpdatedDayDataProviderCurrentValue setDate:](v5, "setDate:", v7);

  }
  else
  {
    v5 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  return v5;
}

@end
