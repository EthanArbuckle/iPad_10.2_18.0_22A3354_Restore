@implementation CKRegisterForAccountRegistrationFailureNotifications

void ___CKRegisterForAccountRegistrationFailureNotifications_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0D39590], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0CEBB70], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKRegistrationFailureHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0CEB350], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
