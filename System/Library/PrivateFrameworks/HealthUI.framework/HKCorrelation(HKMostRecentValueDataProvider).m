@implementation HKCorrelation(HKMostRecentValueDataProvider)

- (HKBloodPressureDataProviderCurrentValue)dataProviderValue
{
  void *v2;
  uint64_t v3;
  HKBloodPressureDataProviderCurrentValue *v4;

  objc_msgSend(a1, "correlationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code");

  if (v3 == 80)
    v4 = -[HKBloodPressureDataProviderCurrentValue initWithCorrelation:]([HKBloodPressureDataProviderCurrentValue alloc], "initWithCorrelation:", a1);
  else
    v4 = 0;
  return v4;
}

@end
