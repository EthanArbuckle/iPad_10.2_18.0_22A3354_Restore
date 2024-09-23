@implementation SBSystemApertureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSystemApertureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoard"), CFSTR("systemApertureControllerForMainDisplay"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureController"), CFSTR("_systemApertureViewController"), "SBSystemApertureViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSystemApertureViewController"), CFSTR("_systemApertureContainsAnyContent"), "BOOL");

}

- (BOOL)_accessibilityIsInJindo
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("_systemApertureViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "safeBoolForKey:", CFSTR("_systemApertureContainsAnyContent")) & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSystemApertureWindowAccessibility;
    -[SBSystemApertureWindowAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

@end
