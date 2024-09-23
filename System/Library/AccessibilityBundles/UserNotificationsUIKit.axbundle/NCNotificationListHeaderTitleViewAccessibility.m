@implementation NCNotificationListHeaderTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListHeaderTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListHeaderTitleView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCNotificationListHeaderTitleView"), CFSTR("_configureTitleLabelIfNecessary"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListHeaderTitleViewAccessibility;
  -[NCNotificationListHeaderTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[NCNotificationListHeaderTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityAddTrait:", *MEMORY[0x24BDF73C0]);

}

- (void)_configureTitleLabelIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListHeaderTitleViewAccessibility;
  -[NCNotificationListHeaderTitleViewAccessibility _configureTitleLabelIfNecessary](&v3, sel__configureTitleLabelIfNecessary);
  -[NCNotificationListHeaderTitleViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
