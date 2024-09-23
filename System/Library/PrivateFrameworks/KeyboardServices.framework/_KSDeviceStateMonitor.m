@implementation _KSDeviceStateMonitor

- (BOOL)isDataAvailableForClassC
{
  if (-[_KSDeviceStateMonitor deviceHasBeenUnlockedSinceBoot](self, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_KSDeviceStateMonitor deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return softLinkMKBDeviceUnlockedSinceBoot() != 0;
}

+ (id)deviceStateMonitor
{
  if (deviceStateMonitor_onceToken != -1)
    dispatch_once(&deviceStateMonitor_onceToken, &__block_literal_global_0);
  return (id)deviceStateMonitor_sharedInstance;
}

- (_KSDeviceStateMonitor)init
{
  _KSDeviceStateMonitor *v2;
  _KSDeviceStateMonitor *v3;
  int v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_KSDeviceStateMonitor;
  v2 = -[_KSDeviceStateMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isContentProtectionAvailable = 0;
    v4 = MKBDeviceFormattedForContentProtection();
    v3->_isContentProtectionAvailable = v4 != 0;
    if (v4)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      if (DarwinNotifyCenter)
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleKeyBagNotification, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0);
  v4.receiver = self;
  v4.super_class = (Class)_KSDeviceStateMonitor;
  -[_KSDeviceStateMonitor dealloc](&v4, sel_dealloc);
}

- (void)handleKeyBagLockNotification
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("KSDeviceProtectionClassDidChange"), 0);

}

- (BOOL)deviceIsPasswordConfigured
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)softLinkMGCopyAnswer((uint64_t)CFSTR("PasswordConfigured"), 0);
  v3 = v2;
  v4 = (const void *)*MEMORY[0x24BDBD270];
  if (v2)
    CFRelease(v2);
  return v3 == v4;
}

+ (BOOL)isRunningOnInternalBuild
{
  if (isRunningOnInternalBuild_onceToken != -1)
    dispatch_once(&isRunningOnInternalBuild_onceToken, &__block_literal_global_9);
  return isRunningOnInternalBuild_isInternalBuild;
}

- (BOOL)isContentProtectionAvailable
{
  return self->_isContentProtectionAvailable;
}

- (void)setIsContentProtectionAvailable:(BOOL)a3
{
  self->_isContentProtectionAvailable = a3;
}

@end
