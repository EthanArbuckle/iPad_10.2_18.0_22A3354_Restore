@implementation FMPlatterImageAndButtonGroupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMPlatterImageAndButtonGroupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMPlatterImageAndButtonGroupView"), CFSTR("setupSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMPlatterImageAndButtonGroupView"), CFSTR("titleLabel"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMPlatterImageAndButtonGroupViewAccessibility;
  -[FMPlatterImageAndButtonGroupViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[FMPlatterImageAndButtonGroupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)setupSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMPlatterImageAndButtonGroupViewAccessibility;
  -[FMPlatterImageAndButtonGroupViewAccessibility setupSubviews](&v3, sel_setupSubviews);
  -[FMPlatterImageAndButtonGroupViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
