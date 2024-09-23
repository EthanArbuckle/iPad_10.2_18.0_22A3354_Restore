@implementation IPCAURegistrar

void __IPCAURegistrar_InitServer_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  FindIPCAURegistrationsFromAppBundles2();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)ApplicationsChanged, (CFStringRef)*MEMORY[0x1E0CA57B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
