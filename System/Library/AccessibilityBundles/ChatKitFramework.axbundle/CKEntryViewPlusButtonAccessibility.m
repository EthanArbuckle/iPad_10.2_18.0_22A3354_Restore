@implementation CKEntryViewPlusButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKEntryViewPlusButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("messaging.apps.button.text"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKEntryViewPlusButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CKEntryViewPlusButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)accessibilityActivate
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEntryViewPlusButtonAccessibility;
  v2 = -[CKEntryViewPlusButtonAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  return v2;
}

@end
