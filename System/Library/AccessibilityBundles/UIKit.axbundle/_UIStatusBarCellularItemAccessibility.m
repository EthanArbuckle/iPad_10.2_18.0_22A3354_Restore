@implementation _UIStatusBarCellularItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarCellularItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBarStringView"), CFSTR("UILabel"));
  v3 = CFSTR("_UIStatusBarCellularItem");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("signalView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("callForwardingView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("networkTypeView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:"), v4, v4, v4, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("entryForDisplayItemWithIdentifier:"), v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  _UIStatusBarCellularItemAccessibility *v4;
  id v5[2];
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;
  SEL v19;
  _UIStatusBarCellularItemAccessibility *v20;

  v20 = self;
  v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  -[_UIStatusBarCellularItemAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  v17 = (id)-[_UIStatusBarCellularItemAccessibility safeUIViewForKey:](v20, "safeUIViewForKey:", CFSTR("signalView"));
  objc_msgSend(v17, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  v16 = (id)-[_UIStatusBarCellularItemAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("callForwardingView"));
  objc_msgSend(v16, "setIsAccessibilityElement:", 1);
  v2 = accessibilityLocalizedString(CFSTR("status.call.forward.icon"));
  objc_msgSend(v16, "setAccessibilityLabel:");

  v15 = (id)-[_UIStatusBarCellularItemAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("networkTypeView"));
  objc_msgSend(v15, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsDataNetwork"));
  v14 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("_UIStatusBarCellularItem")), "safeValueForKey:", CFSTR("typeDisplayIdentifier"));
  v6 = 0;
  v7 = &v6;
  v8 = 838860800;
  v9 = 48;
  v10 = __Block_byref_object_copy__30;
  v11 = __Block_byref_object_dispose__30;
  v12 = 0;
  v5[1] = &v6;
  v4 = v20;
  v5[0] = v14;
  AXPerformSafeBlock();
  v3 = (id)v7[5];
  objc_storeStrong(v5, 0);
  objc_storeStrong((id *)&v4, 0);
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  v13 = v3;
  -[_UIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](v20, v3);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
}

- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1
{
  id v2;
  id v3;
  int v4;
  id location;
  id v6;

  v6 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    v3 = axAnnotateDataNetworkViewWithType((void *)objc_msgSend(location, "type"));
    v2 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("networkTypeView"));
    objc_msgSend(v2, "setAccessibilityLabel:", v3);

    objc_storeStrong(&v3, 0);
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  id v7;
  id v8;
  char v9;
  id v13;
  id v14;
  char v15;
  id v16;
  objc_super v17;
  char v18;
  BOOL v19;
  id v20;
  id v21;
  id location[2];
  _UIStatusBarCellularItemAccessibility *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20 = 0;
  objc_storeStrong(&v20, a5);
  v19 = a6;
  v18 = 0;
  v17.receiver = v23;
  v17.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  v18 = -[_UIStatusBarCellularItemAccessibility _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](&v17, sel__updateSignalView_withUpdate_entry_forceShowingDisabledSignalBars_, location[0], v21, v20, a6);
  v15 = 0;
  objc_opt_class();
  v14 = (id)__UIAccessibilityCastAsClass();
  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16 = v13;
  v7 = location[0];
  v8 = (id)objc_msgSend(v13, "string");
  objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:");

  objc_msgSend(location[0], "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  -[_UIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](v23, v16);
  v9 = v18;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (_UIStatusBarCellularItemAccessibility)init
{
  _UIStatusBarCellularItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarCellularItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  v6 = -[_UIStatusBarCellularItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarCellularItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end
