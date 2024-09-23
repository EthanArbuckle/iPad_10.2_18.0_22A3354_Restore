@implementation CKNanoSendMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoSendMenuButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("messaging.apps.button.text"));
}

- (id)_accessibilityFocusRingTintColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
}

@end
