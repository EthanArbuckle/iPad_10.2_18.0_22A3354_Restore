@implementation SBControlCenterWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBControlCenterWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBControlCenterController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("handleMenuButtonTap"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SpringBoardAccessibility"), CFSTR("_accessibilityIsShowingLongLookNotification"), "B", 0);

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  char v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("handleMenuButtonTap"));
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isControlCenterVisible"))
    v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeBoolForKey:", CFSTR("_accessibilityIsShowingLongLookNotification"));
  else
    v3 = 1;

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControlCenterVisible");

  return v3;
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

@end
