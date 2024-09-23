@implementation HearingManager

- (void)startMonitoring
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, (CFStringRef)*MEMORY[0x24BED27A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, (CFStringRef)*MEMORY[0x24BED27A0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_SharedInstance;
}

void __32__HearingManager_sharedInstance__block_invoke()
{
  HearingManager *v0;
  void *v1;

  v0 = objc_alloc_init(HearingManager);
  v1 = (void *)sharedInstance_SharedInstance;
  sharedInstance_SharedInstance = (uint64_t)v0;

}

@end
