@implementation SBSwitcherControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitcherController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_updateContentViewControllerIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("switcherCoordinator"), "@", 0);

}

- (void)_updateContentViewControllerIfNeeded
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherControllerAccessibility;
  -[SBSwitcherControllerAccessibility _updateContentViewControllerIfNeeded](&v4, sel__updateContentViewControllerIfNeeded);
  -[SBSwitcherControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("switcherCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
