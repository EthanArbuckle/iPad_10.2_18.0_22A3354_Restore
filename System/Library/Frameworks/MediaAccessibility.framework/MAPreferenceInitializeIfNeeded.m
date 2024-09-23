@implementation MAPreferenceInitializeIfNeeded

void __MAPreferenceInitializeIfNeeded_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_settingsChangedNotificationHandler, CFSTR("com.apple.mediaaccessibility.captionAppearanceSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_settingsChangedNotificationHandler, CFSTR("com.apple.mediaaccessibility.audibleMediaSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  MAPreferenceAddPublicWriteableKey(CFSTR("MACaptionPreferredLanguages"));
  MAPreferenceAddPublicWriteableKey(CFSTR("MACaptionDisplayType"));
}

@end
