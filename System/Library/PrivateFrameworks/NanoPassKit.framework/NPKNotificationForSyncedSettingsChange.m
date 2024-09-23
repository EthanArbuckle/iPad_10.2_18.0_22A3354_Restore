@implementation NPKNotificationForSyncedSettingsChange

void __NPKNotificationForSyncedSettingsChange_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, "NPKSyncedSettings", (CFNotificationCallback)SyncedSettingsDidChange, CFSTR("com.apple.nanopassbook.syncedsettingschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
