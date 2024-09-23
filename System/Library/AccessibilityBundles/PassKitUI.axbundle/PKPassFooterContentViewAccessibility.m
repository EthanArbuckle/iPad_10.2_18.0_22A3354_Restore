@implementation PKPassFooterContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassFooterContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPassFooterContentView"), CFSTR("_infoButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassFooterContentViewAccessibility;
  -[PKPassFooterContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PKPassFooterContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_infoButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("more.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
