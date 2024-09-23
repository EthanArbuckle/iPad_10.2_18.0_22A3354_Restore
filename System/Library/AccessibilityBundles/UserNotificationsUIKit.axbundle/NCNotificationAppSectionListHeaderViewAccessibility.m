@implementation NCNotificationAppSectionListHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationAppSectionListHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationAppSectionListHeaderView"), CFSTR("_titleLabel"), "UILabel");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionListHeaderViewAccessibility;
  -[NCNotificationAppSectionListHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[NCNotificationAppSectionListHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
