@implementation ModalCardHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ModalCardHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ModalCardHeaderView"), CFSTR("_customInit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ModalCardHeaderView"), CFSTR("_titleLabel"), "UILabel");

}

- (void)_customInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ModalCardHeaderViewAccessibility;
  -[ModalCardHeaderViewAccessibility _customInit](&v3, sel__customInit);
  -[ModalCardHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ModalCardHeaderViewAccessibility;
  -[ModalCardHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[ModalCardHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
