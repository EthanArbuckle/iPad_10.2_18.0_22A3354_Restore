@implementation GKSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("GKSectionHeaderView"), CFSTR("_leftLabel"), "GKLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKSectionHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (GKSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  GKSectionHeaderViewAccessibility *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSectionHeaderViewAccessibility;
  v3 = -[GKSectionHeaderViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[GKSectionHeaderViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_leftLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  return v3;
}

@end
