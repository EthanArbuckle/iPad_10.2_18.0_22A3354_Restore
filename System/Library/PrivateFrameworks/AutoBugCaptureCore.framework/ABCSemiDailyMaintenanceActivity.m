@implementation ABCSemiDailyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_54 != -1)
    dispatch_once(&sharedInstance_onceToken_54, &__block_literal_global_55);
  return (id)sharedInstance_sSharedActivity_53;
}

void __49__ABCSemiDailyMaintenanceActivity_sharedInstance__block_invoke()
{
  ABCSemiDailyMaintenanceActivity *v0;
  void *v1;

  v0 = objc_alloc_init(ABCSemiDailyMaintenanceActivity);
  v1 = (void *)sharedInstance_sSharedActivity_53;
  sharedInstance_sSharedActivity_53 = (uint64_t)v0;

}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x1E0C807B8] / 2;
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.SemiDaily";
}

@end
