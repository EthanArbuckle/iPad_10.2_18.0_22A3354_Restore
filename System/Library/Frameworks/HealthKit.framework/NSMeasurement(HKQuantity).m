@implementation NSMeasurement(HKQuantity)

- (id)hk_equivalentQuantity
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "unit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "doubleValue");
  objc_msgSend(v2, "hk_equivalentQuantityWithValue:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
