@implementation CAMApplicationDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMApplicationDelegate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMApplicationDelegate"), CFSTR("captureController"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMApplicationDelegateAccessibility;
  -[CAMApplicationDelegateAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CAMApplicationDelegateAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("captureController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
