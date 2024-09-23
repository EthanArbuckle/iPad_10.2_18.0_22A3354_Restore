@implementation SBStatusBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBStatusBarWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBStatusBarWindow"), CFSTR("UIWindow"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("_wantsFocusEngine"), "B", 0);

}

- (BOOL)accessibilityElementsHidden
{
  void *v4;
  void *v5;
  char v6;

  if ((_UIApplicationIsExtension() & 1) != 0)
    return 1;
  -[SBStatusBarWindowAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[SBStatusBarWindowAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (!AXProcessIsSpringBoard() || !AXDeviceHasJindo() || AXRequestingClient() != 3)
    return 0x7FFFFFFFLL;
  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarWindowAccessibility;
  return -[SBStatusBarWindowAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  objc_super v4;

  if ((-[SBStatusBarWindowAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarWindowAccessibility;
  return -[SBStatusBarWindowAccessibility _wantsFocusEngine](&v4, sel__wantsFocusEngine);
}

@end
