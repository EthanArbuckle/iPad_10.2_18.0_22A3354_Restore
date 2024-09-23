@implementation MUPlaceAppLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceAppLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlaceAppLockupView"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("MUAppLockupViewModel"), CFSTR("titleText"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceAppLockupView"), CFSTR("_punchoutButton"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MUPlaceAppLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("titleText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MUPlaceAppLockupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_punchoutButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
