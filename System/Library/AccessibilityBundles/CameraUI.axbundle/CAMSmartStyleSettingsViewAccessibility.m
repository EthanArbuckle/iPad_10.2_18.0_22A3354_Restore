@implementation CAMSmartStyleSettingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSmartStyleSettingsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSmartStyleSettingsView"), CFSTR("_selectAssetsButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMSmartStyleSettingsViewAccessibility;
  -[CAMSmartStyleSettingsViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CAMSmartStyleSettingsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectAssetsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_1);

}

id __84__CAMSmartStyleSettingsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityCameraUI3LocalizedString(CFSTR("select.assets"));
}

@end
