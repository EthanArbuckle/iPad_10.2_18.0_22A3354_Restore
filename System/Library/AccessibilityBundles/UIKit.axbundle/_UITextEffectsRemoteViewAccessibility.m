@implementation _UITextEffectsRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITextEffectsRemoteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UITextEffectsRemoteView"), CFSTR("_UIRemoteView"));
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPeripheralHost"), CFSTR("containerRootController"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputWindowController"), CFSTR("inputViewSet"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputViewSet"), CFSTR("inputView"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITextEffectsWindow"), CFSTR("_activeEffectsCount"), "Q");
  objc_storeStrong(v5, obj);
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9[3];
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;

  v9[2] = self;
  v9[1] = (id)a2;
  v8 = (id)objc_msgSend(MEMORY[0x24BDF6C50], "sharedInstance");
  v7 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("containerRootController"));
  v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("inputViewSet"));
  v9[0] = (id)objc_msgSend(v6, "safeUIViewForKey:", CFSTR("inputView"));

  objc_msgSend(v9[0], "bounds");
  UIAccessibilityConvertFrameToScreenCoordinates(v13, (UIView *)v9[0]);
  AX_CGRectGetCenter();
  v10 = v2;
  v11 = v3;
  objc_storeStrong(v9, 0);
  v4 = v10;
  v5 = v11;
  result.y = v5;
  result.x = v4;
  return result;
}

- (int64_t)_accessibilitySortPriority
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  id v7;
  BOOL v8;
  id location[2];
  _UITextEffectsRemoteViewAccessibility *v10;
  int64_t v11;

  v10 = self;
  location[1] = (id)a2;
  v7 = (id)-[_UITextEffectsRemoteViewAccessibility window](self, "window");
  v2 = (id)AXUIKeyboardWindow();
  v8 = v7 != v2;

  if (v8)
    return -1;
  location[0] = (id)-[_UITextEffectsRemoteViewAccessibility accessibilityContainer](v10, "accessibilityContainer");
  while (location[0])
  {
    v3 = objc_msgSend(location[0], "_accessibilitySortPriority");
    if (v3 == *MEMORY[0x24BEBAF88])
      objc_msgSend(location[0], "_accessibilitySetSortPriority:", -2);
    v4 = (id)objc_msgSend(location[0], "accessibilityContainer");
    v5 = location[0];
    location[0] = v4;

  }
  v11 = -2;
  objc_storeStrong(location, 0);
  return v11;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id location[3];
  CGPoint v6;

  v6 = a3;
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  objc_storeStrong(location, 0);
  return 0;
}

- (id)accessibilityElements
{
  id v3;
  objc_super v4;
  int v5;
  id location;
  id v7;
  id v8[2];
  _UITextEffectsRemoteViewAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[_UITextEffectsRemoteViewAccessibility window](self, "window");
  v3 = (id)objc_msgSend(v8[0], "windowScene");
  v7 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("_FBSScene"));

  location = (id)objc_msgSend(v7, "identifier");
  if ((AXUIKeyboardIsOOP() & 1) != 0
    && ((axIsAutomaticArbiterClientKeyboardActive() & 1) == 0 && (axKeyboardInSeparateProcessAndScene(v8[0]) & 1) != 0
     || (objc_msgSend(location, "isEqualToString:", *MEMORY[0x24BDFE420]) & 1) != 0))
  {
    v10 = 0;
    v5 = 1;
  }
  else
  {
    v4.receiver = v9;
    v4.super_class = (Class)_UITextEffectsRemoteViewAccessibility;
    v10 = -[_UITextEffectsRemoteViewAccessibility accessibilityElements](&v4, sel_accessibilityElements);
    v5 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v10;
}

@end
