@implementation HKMedicationsSharedAnalyticsQueue

void __HKMedicationsSharedAnalyticsQueue_block_invoke()
{
  uint64_t v0;
  void *v1;

  HKCreateSerialDispatchQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HKMedicationsSharedAnalyticsQueue_analyticsQueue;
  HKMedicationsSharedAnalyticsQueue_analyticsQueue = v0;

}

@end
