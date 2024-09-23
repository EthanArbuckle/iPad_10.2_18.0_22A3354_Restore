@implementation MSHistoryMultiPointRoute(MSgEvRoute)

- (double)requiredBatteryCharge
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "requiredCharge");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

@end
