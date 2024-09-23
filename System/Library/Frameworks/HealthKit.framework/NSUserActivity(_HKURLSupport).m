@implementation NSUserActivity(_HKURLSupport)

+ (id)_hk_userActivityForElectrocardiogramType
{
  void *v0;
  void *v1;

  +[HKObjectType electrocardiogramType](HKElectrocardiogramType, "electrocardiogramType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateActivityForSampleType(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_userActivityForAtrialFibrillationEventType
{
  void *v0;
  void *v1;

  +[HKObjectType atrialFibrillationEventType](HKObjectType, "atrialFibrillationEventType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateActivityForSampleType(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
