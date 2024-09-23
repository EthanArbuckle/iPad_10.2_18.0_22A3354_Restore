@implementation CKIsUnexpectedlyLoggedOut

uint64_t __CKIsUnexpectedlyLoggedOut_block_invoke()
{
  __CFNotificationCenter *LocalCenter;
  uint64_t result;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKUnexpectedlyLoggedOutHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0D39588], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKUnexpectedlyLoggedOutHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0D35270], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKUnexpectedlyLoggedOutHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0D35268], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CKUnexpectedlyLoggedOutHandleDependentValueChanged, (CFStringRef)*MEMORY[0x1E0CEB350], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  result = _CKCalculateIsUnexpectedlyLoggedOutValue();
  __CKIsUnexpectedlyLoggedOut = result;
  return result;
}

@end
