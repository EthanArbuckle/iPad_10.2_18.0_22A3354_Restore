@implementation NTKConfigureFaceDefaultsChangedNotification

void __NTKConfigureFaceDefaultsChangedNotification_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_FaceDefaultsChanged, CFSTR("NanoTimeKitFaceDefaultsChangedDarwinNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

@end
