@implementation CRKPlatformClassroomLockScreenMonitor

+ (CRKClassroomLockScreenMonitoring)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_95);
  return (CRKClassroomLockScreenMonitoring *)(id)sharedMonitor_monitor;
}

void __54__CRKPlatformClassroomLockScreenMonitor_sharedMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "makeMonitor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedMonitor_monitor;
  sharedMonitor_monitor = v0;

}

@end
