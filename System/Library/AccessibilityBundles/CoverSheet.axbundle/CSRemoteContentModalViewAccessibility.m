@implementation CSRemoteContentModalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSRemoteContentModalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSRemoteContentModalView"), CFSTR("backgroundDismissButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentModalViewAccessibility;
  -[CSRemoteContentModalViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CSRemoteContentModalViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundDismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
