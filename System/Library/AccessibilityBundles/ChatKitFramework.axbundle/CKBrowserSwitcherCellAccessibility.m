@implementation CKBrowserSwitcherCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBrowserSwitcherCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBrowserPluginCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserSwitcherCellAccessibility;
  v3 = -[CKBrowserSwitcherCellAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return v3 & ~-[CKBrowserSwitcherCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem");
}

@end
