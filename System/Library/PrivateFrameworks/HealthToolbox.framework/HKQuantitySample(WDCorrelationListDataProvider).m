@implementation HKQuantitySample(WDCorrelationListDataProvider)

- (id)quantitySampleForType:()WDCorrelationListDataProvider
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    v7 = a1;
  else
    v7 = 0;
  return v7;
}

@end
