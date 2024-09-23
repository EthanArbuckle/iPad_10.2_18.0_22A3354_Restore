@implementation FEFocusGetSensitivitySetting

void ___FEFocusGetSensitivitySetting_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_FEFocusClearCachedSensitivitySettingObserver, CFSTR("_FEFocusSensitivityUpdateNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
