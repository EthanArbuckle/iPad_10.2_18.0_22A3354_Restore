@implementation NSObject(AXAssertionHelpers)

- (uint64_t)_accessibilityIsSpeakThisTemporarilyDisabled
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetSpeakThisTemporarilyDisabled:()AXAssertionHelpers
{
  return __UIAccessibilitySetAssociatedBool();
}

@end
