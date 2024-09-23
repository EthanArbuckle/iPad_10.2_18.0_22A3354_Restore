@implementation SBDashBoardSetupViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDashBoardSetupViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardSetupViewController"), CFSTR("_infoButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardSetupViewController"), CFSTR("_regulatoryInfoButtonTapped:"), "v", "@", 0);

}

- (void)_infoButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewControllerAccessibility;
  -[SBDashBoardSetupViewControllerAccessibility _infoButtonTapped:](&v3, sel__infoButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_regulatoryInfoButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewControllerAccessibility;
  -[SBDashBoardSetupViewControllerAccessibility _regulatoryInfoButtonTapped:](&v3, sel__regulatoryInfoButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
