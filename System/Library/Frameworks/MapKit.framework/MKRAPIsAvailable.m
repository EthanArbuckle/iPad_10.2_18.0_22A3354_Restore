@implementation MKRAPIsAvailable

void ___MKRAPIsAvailable_block_invoke()
{
  id v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v1 = (void *)qword_1ECE2DB50;
  qword_1ECE2DB50 = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, &_MergedGlobals_152, (CFNotificationCallback)_MKRAPiCloudAccountChanged, CFSTR("ACDAccountStoreDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
