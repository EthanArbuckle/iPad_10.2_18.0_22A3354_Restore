@implementation STUIStatusBarCellularItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  -[STUIStatusBarCellularItemAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarCellularItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("signalView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  -[STUIStatusBarCellularItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("callForwardingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("status.call.forward.icon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[STUIStatusBarCellularItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("networkTypeView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsDataNetwork"));
  objc_msgSend((id)MEMORY[0x2349217D4](CFSTR("STUIStatusBarCellularItem")), "safeValueForKey:", CFSTR("typeDisplayIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v9 = v7;
  AXPerformSafeBlock();
  v8 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  -[STUIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](self, v8);

}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a6;
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  v10 = a5;
  v11 = a3;
  LOBYTE(v6) = -[STUIStatusBarCellularItemAccessibility _updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:](&v14, sel__updateSignalView_withUpdate_entry_forceShowingDisabledSignalBars_, v11, a4, v10, v6);
  objc_msgSend(v10, "safeStringForKey:", CFSTR("string"), v14.receiver, v14.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AXStatusBarSignalViewServiceKey"));

  objc_msgSend(v11, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  -[STUIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](self, v10);

  return v6;
}

- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    AXAnnotateDataNetworkViewWithType(objc_msgSend(a2, "safeIntegerForKey:", CFSTR("type")));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "safeValueForKey:", CFSTR("networkTypeView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v4);

  }
}

void __84__STUIStatusBarCellularItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryForDisplayItemWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarCellularItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarStringView"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("typeDisplayIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("signalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("callForwardingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("networkTypeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:"), "@", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularItem"), CFSTR("entryForDisplayItemWithIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataCellularEntry"), CFSTR("string"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataCellularEntry"), CFSTR("type"), "q", 0);

}

- (STUIStatusBarCellularItemAccessibility)init
{
  STUIStatusBarCellularItemAccessibility *v2;
  STUIStatusBarCellularItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  v2 = -[STUIStatusBarCellularItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarCellularItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
