@implementation STUIStatusBar_WrapperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBar_Wrapper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBar"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar_Wrapper"), CFSTR("statusBar"), "@", 0);

}

- (BOOL)_accessibilityViewIsVisible
{
  void *v2;
  char v3;

  -[STUIStatusBar_WrapperAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("statusBar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (!AXProcessIsSpringBoard() || !AXDeviceHasJindo() || AXRequestingClient() != 3)
    return 0x7FFFFFFFLL;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar_WrapperAccessibility;
  return -[STUIStatusBar_WrapperAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

@end
