@implementation MIUIMedicalIDNavigationBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MIUIMedicalIDNavigationBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("medical.id"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIUIMedicalIDNavigationBarViewAccessibility;
  -[MIUIMedicalIDNavigationBarViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySetOverridesInvalidFrames:", 1);

}

@end
