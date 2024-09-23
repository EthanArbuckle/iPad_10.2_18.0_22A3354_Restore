@implementation NCNotificationManagementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationManagementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCNotificationManagementView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationManagementView"), CFSTR("_configureTitleIfNeccessary:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewAccessibility;
  -[NCNotificationManagementViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[NCNotificationManagementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityAddTrait:", *MEMORY[0x24BDF73C0]);

}

- (void)_configureTitleIfNeccessary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationManagementViewAccessibility;
  -[NCNotificationManagementViewAccessibility _configureTitleIfNeccessary:](&v4, sel__configureTitleIfNeccessary_, a3);
  -[NCNotificationManagementViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
