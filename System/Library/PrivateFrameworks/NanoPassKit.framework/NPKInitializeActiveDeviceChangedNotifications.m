@implementation NPKInitializeActiveDeviceChangedNotifications

void __NPKInitializeActiveDeviceChangedNotifications_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v1;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_DevicePaired, (CFStringRef)*MEMORY[0x24BE6B440], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_ActiveDeviceChanged, (CFStringRef)*MEMORY[0x24BE6B420], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
