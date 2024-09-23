@implementation SBAppSwitcherPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppSwitcherPageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppSwitcherPageView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_focusFallbackScroller"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBAppSwitcherPageView"), CFSTR("_hitTestBlocker"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPageView"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherItemContainer"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherContentView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("appLayout"), "@", 0);

}

- (BOOL)_accessibilityIsNotFirstElement
{
  void *v2;
  char v3;

  -[SBAppSwitcherPageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXBundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDFE3E0]);

  return v3;
}

- (id)_accessibilityBundleIdentifier
{
  return (id)-[SBAppSwitcherPageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXBundleIdentifier"));
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  -[SBAppSwitcherPageViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runningAppProcesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__SBAppSwitcherPageViewAccessibility_accessibilityValue__block_invoke;
  v12[3] = &unk_250367D50;
  v6 = v3;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  v11.receiver = self;
  v11.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  -[SBAppSwitcherPageViewAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v16 + 24) && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFE420]) & 1) == 0)
  {
    accessibilityLocalizedString(CFSTR("app.running.status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __56__SBAppSwitcherPageViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SBAppSwitcherPageViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBAppSwitcherItemScrollView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("currentPage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedIntegerValue");

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "count");
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("app.switcher.location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_accessibilityScrollToVisible
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  v2 = -[SBAppSwitcherPageViewAccessibility _accessibilityScrollToVisible](&v4, sel__accessibilityScrollToVisible);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
  return v2;
}

- (CGRect)_accessibilityVisibleFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  -[SBAppSwitcherPageViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBAppSwitcherPageViewAccessibility window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v27.origin.x = v12;
  v27.origin.y = v13;
  v27.size.width = v14;
  v27.size.height = v15;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectIntersection(v24, v27);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_accessibilityElementVisibilityAffectsLayout
{
  return 1;
}

- (id)_accessibilityPreferredScrollActions
{
  return &unk_250381868;
}

- (id)_focusFallbackScroller
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  objc_super v10;
  objc_super v11;

  if (-[SBAppSwitcherPageViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[SBAppSwitcherPageViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("scrollView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SBAppSwitcherPageViewAccessibility;
      -[SBAppSwitcherPageViewAccessibility _focusFallbackScroller](&v11, sel__focusFallbackScroller);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    return v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBAppSwitcherPageViewAccessibility;
    -[SBAppSwitcherPageViewAccessibility _focusFallbackScroller](&v10, sel__focusFallbackScroller);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __60__SBAppSwitcherPageViewAccessibility__focusFallbackScroller__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBFluidSwitcherViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  v3 = -[SBAppSwitcherPageViewAccessibility canBecomeFocused](&v9, sel_canBecomeFocused);
  if (-[SBAppSwitcherPageViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBMainSwitcherWindow"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "isAppSwitcherVisible");

    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_viewToAddFocusLayer
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBAppSwitcherPageViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFluidSwitcherItemContainer")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ax-focusLayerView"));
  return v4;
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;

  -[SBAppSwitcherPageViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppSwitcherPageViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  UIRectInsetEdges();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)MEMORY[0x24BDF6870];
  objc_msgSend(v4, "cornerRadius");
  v15 = v14;
  -[SBAppSwitcherPageViewAccessibility _viewToAddFocusLayer](self, "_viewToAddFocusLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_axScaleTransformForFocusLayerLineWidth");
  objc_msgSend(v13, "_bezierPathWithArcRoundedRect:cornerRadius:", v6, v8, v10, v12, v15 / v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBAppSwitcherPageViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFluidSwitcherItemContainer")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBAppSwitcherPageViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFluidSwitcherContentView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("appLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_axElementForAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
