@implementation _UISizeTrackingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISizeTrackingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UISizeTrackingView");
  v6 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISizeTrackingView"), CFSTR("remoteViewController"), 0);
  v4 = CFSTR("_UIRemoteViewController");
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("serviceProcessIdentifier"), "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("didUpdateFocusInContext: withAnimationCoordinator:"), v7, v5, v5, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  SEL v4;
  _UISizeTrackingViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[_UISizeTrackingViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)return 1;
  v3.receiver = v5;
  v3.super_class = (Class)_UISizeTrackingViewAccessibility;
  return -[_UISizeTrackingViewAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  id v3[2];
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  _UISizeTrackingViewAccessibility *v8;
  BOOL v9;
  SEL v10;
  _UISizeTrackingViewAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  if (a3)
  {
    v3[1] = (id)MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke;
    v7 = &unk_24FF3DA40;
    v8 = v11;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v8, 0);
  }
  else
  {
    v3[0] = v11;
    AXPerformSafeBlock();
    objc_storeStrong(v3, 0);
  }
}

- (int)_accessibilityRemotePid
{
  id v3;
  id v4;
  int v5;

  v4 = (id)-[_UISizeTrackingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("remoteViewController"));
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("serviceProcessIdentifier"));
  v5 = objc_msgSend(v3, "intValue");

  return v5;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  return 1;
}

@end
