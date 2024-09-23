@implementation PLUISensitiveUIAlertDigitButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLUISensitiveUIAlertDigitButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
