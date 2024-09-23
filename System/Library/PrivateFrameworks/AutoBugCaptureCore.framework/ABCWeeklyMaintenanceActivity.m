@implementation ABCWeeklyMaintenanceActivity

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_60 != -1)
    dispatch_once(&sharedInstance_onceToken_60, &__block_literal_global_61);
  return (id)sharedInstance_sSharedActivity_59;
}

void __46__ABCWeeklyMaintenanceActivity_sharedInstance__block_invoke()
{
  ABCWeeklyMaintenanceActivity *v0;
  void *v1;

  v0 = objc_alloc_init(ABCWeeklyMaintenanceActivity);
  v1 = (void *)sharedInstance_sSharedActivity_59;
  sharedInstance_sSharedActivity_59 = (uint64_t)v0;

}

+ (int64_t)periodicActivityInterval
{
  return *MEMORY[0x1E0C807E8];
}

+ (const)periodicActivityID
{
  return "com.apple.SymptomFramework.MaintenanceActivity.Weekly";
}

@end
