@implementation RAPInstructionIncorrectViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RAPInstructionIncorrectView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RAPInstructionIncorrectView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RAPInstructionIncorrectView"), CFSTR("_flagView"), "UIImageView");

}

- (void)_axAnnotateFlagView
{
  id v2;

  -[RAPInstructionIncorrectViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_flagView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("Flag"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPInstructionIncorrectViewAccessibility;
  -[RAPInstructionIncorrectViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[RAPInstructionIncorrectViewAccessibility _axAnnotateFlagView](self, "_axAnnotateFlagView");
}

- (RAPInstructionIncorrectViewAccessibility)initWithFrame:(CGRect)a3
{
  RAPInstructionIncorrectViewAccessibility *v3;
  RAPInstructionIncorrectViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPInstructionIncorrectViewAccessibility;
  v3 = -[RAPInstructionIncorrectViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RAPInstructionIncorrectViewAccessibility _axAnnotateFlagView](v3, "_axAnnotateFlagView");
  return v4;
}

@end
