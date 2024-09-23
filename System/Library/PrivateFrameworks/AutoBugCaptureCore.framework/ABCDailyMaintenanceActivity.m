@implementation ABCDailyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_15);
  return (id)sharedInstance_sSharedActivity;
}

void __45__ABCDailyMaintenanceActivity_sharedInstance__block_invoke()
{
  ABCDailyMaintenanceActivity *v0;
  void *v1;

  v0 = objc_alloc_init(ABCDailyMaintenanceActivity);
  v1 = (void *)sharedInstance_sSharedActivity;
  sharedInstance_sSharedActivity = (uint64_t)v0;

}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x1E0C807B8];
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.Daily";
}

@end
