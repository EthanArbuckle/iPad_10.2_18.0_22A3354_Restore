@implementation _WGWidgetRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_WGWidgetRemoteViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_WGWidgetRemoteViewController"), CFSTR("_UIRemoteViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteViewController"), CFSTR("_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:"), "B", "@", 0);

}

- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  objc_super v10;
  char v11;

  v4 = a3;
  v11 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_accessibilityIsFKARunningForFocusItem");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_WGWidgetRemoteViewControllerAccessibility;
    v8 = -[_WGWidgetRemoteViewControllerAccessibility _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:](&v10, sel__wantsKeyboardEnvironmentEventDeferringForFocusOnScreen_, v4);
  }

  return v8;
}

@end
