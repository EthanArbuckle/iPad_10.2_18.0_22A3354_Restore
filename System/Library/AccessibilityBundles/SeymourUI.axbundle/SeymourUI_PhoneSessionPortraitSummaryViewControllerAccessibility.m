@implementation SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.PhoneSessionPortraitSummaryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.PhoneSessionPortraitSummaryViewController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility;
  -[SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SeymourUI_PhoneSessionPortraitSummaryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

@end
