@implementation VTUIEnrollmentSetupIntroViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIEnrollmentSetupIntroView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VTUIEnrollmentBaseView"), CFSTR("_orbImage"), "UIImageView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VTUIEnrollmentSetupIntroView"), CFSTR("VTUIEnrollmentBaseView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollmentSetupIntroView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VTUIEnrollmentSetupIntroView"), CFSTR("continueButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentSetupIntroViewAccessibility;
  -[VTUIEnrollmentSetupIntroViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[VTUIEnrollmentSetupIntroViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("continueButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | v4);
  -[VTUIEnrollmentSetupIntroViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_orbImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityRespondsToUserInteraction:", 0);
  objc_msgSend(v5, "_setIsAccessibilityElementBlock:", &__block_literal_global_1);

}

uint64_t __87__VTUIEnrollmentSetupIntroViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 0;
}

- (VTUIEnrollmentSetupIntroViewAccessibility)initWithFrame:(CGRect)a3
{
  VTUIEnrollmentSetupIntroViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewAccessibility;
  v3 = -[VTUIEnrollmentSetupIntroViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VTUIEnrollmentSetupIntroViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
