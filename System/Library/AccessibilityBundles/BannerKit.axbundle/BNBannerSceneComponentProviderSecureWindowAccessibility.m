@implementation BNBannerSceneComponentProviderSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_BNBannerSceneComponentProviderSecureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BNBannerSceneComponentProviderSecureWindowAccessibility;
  -[BNBannerSceneComponentProviderSecureWindowAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
