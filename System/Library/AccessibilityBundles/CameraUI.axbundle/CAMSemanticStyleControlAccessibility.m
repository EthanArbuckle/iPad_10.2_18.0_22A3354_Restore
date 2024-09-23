@implementation CAMSemanticStyleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSemanticStyleControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleControl"), CFSTR("_resetButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleControl"), CFSTR("_updateResetButtonImage"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMSemanticStyleControlAccessibility;
  -[CAMSemanticStyleControlAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CAMSemanticStyleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_resetButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &__block_literal_global_5);

}

id __82__CAMSemanticStyleControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityCameraUID6xLocalizedString(CFSTR("semantic.style.reset.button"));
}

- (void)_updateResetButtonImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStyleControlAccessibility;
  -[CAMSemanticStyleControlAccessibility _updateResetButtonImage](&v3, sel__updateResetButtonImage);
  -[CAMSemanticStyleControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
