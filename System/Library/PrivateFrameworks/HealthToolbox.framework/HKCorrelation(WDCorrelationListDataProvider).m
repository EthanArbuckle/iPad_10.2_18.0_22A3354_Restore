@implementation HKCorrelation(WDCorrelationListDataProvider)

- (id)quantitySampleForType:()WDCorrelationListDataProvider
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectsForType:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
