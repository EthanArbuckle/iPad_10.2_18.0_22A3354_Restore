@implementation SBFTouchPassThroughViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFTouchPassThroughView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFTouchPassThroughView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_isTransparentFocusRegion"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  objc_super v9;

  -[SBFTouchPassThroughViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PIP-SBInteractionPassThroughView"));

  if (v5)
  {
    -[SBFTouchPassThroughViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "accessibilityActivate");

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFTouchPassThroughViewAccessibility;
    return -[SBFTouchPassThroughViewAccessibility accessibilityActivate](&v9, sel_accessibilityActivate);
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[SBFTouchPassThroughViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PIP-SBInteractionPassThroughView"));

  if ((v5 & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)SBFTouchPassThroughViewAccessibility;
  return -[SBFTouchPassThroughViewAccessibility _accessibilitySupportsActivateAction](&v7, sel__accessibilitySupportsActivateAction);
}

- (BOOL)_isTransparentFocusRegion
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFTouchPassThroughViewAccessibility;
  LOBYTE(v3) = -[SBFTouchPassThroughViewAccessibility _isTransparentFocusRegion](&v5, sel__isTransparentFocusRegion);
  if (-[SBFTouchPassThroughViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))return -[SBFTouchPassThroughViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("canBecomeFocused")) ^ 1;
  return v3;
}

@end
