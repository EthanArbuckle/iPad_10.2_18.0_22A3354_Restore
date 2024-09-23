@implementation MKRegisterGEOMultitaskingNotifications

void __MKRegisterGEOMultitaskingNotifications_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v1;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_MKGEOAppEnteredBackground, (CFStringRef)*MEMORY[0x1E0CEB288], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_MKGEOAppEnteredForeground, (CFStringRef)*MEMORY[0x1E0CEB350], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
