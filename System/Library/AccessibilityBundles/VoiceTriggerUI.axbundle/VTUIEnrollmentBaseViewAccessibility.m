@implementation VTUIEnrollmentBaseViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIEnrollmentBaseView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollmentBaseView"), CFSTR("_setupUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollmentBaseView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollmentBaseView"), CFSTR("_orbImage"), "UIImageView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollmentBaseViewAccessibility;
  -[VTUIEnrollmentBaseViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("siri.icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orbImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  v5 = *MEMORY[0x24BDF73C0];
  -[VTUIEnrollmentBaseViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", v5);

}

- (void)_setupUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentBaseViewAccessibility;
  -[VTUIEnrollmentBaseViewAccessibility _setupUI](&v3, sel__setupUI);
  -[VTUIEnrollmentBaseViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
