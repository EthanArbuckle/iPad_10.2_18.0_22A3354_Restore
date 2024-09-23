@implementation RootNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RootNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RootNavigationController"), CFSTR("UINavigationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RootNavigationController"), CFSTR("todayPressed"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RootNavigationController"), CFSTR("_compactMonthDividedListSwitchBarButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RootNavigationController"), CFSTR("_listViewSwitchBarButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RootNavigationController"), CFSTR("_listToggleBarButtonItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RootNavigationController"), CFSTR("_dividedMonthToggleBarButtonItem"), "UIBarButtonItem");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RootNavigationControllerAccessibility;
  -[RootNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[RootNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_listToggleBarButtonItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("list.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[RootNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dividedMonthToggleBarButtonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("list.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)todayPressed
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[RootNavigationControllerAccessibility topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_AXShouldFocusOnTodayStorageKey"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_accessibilitySetBoolValue:forKey:", 1, CFSTR("_AXShouldFocusOnTodayStorageKey"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)RootNavigationControllerAccessibility;
  -[RootNavigationControllerAccessibility todayPressed](&v11, sel_todayPressed);
  v10 = v3;
  v9 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __53__RootNavigationControllerAccessibility_todayPressed__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityRemoveValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey"));
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "childViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_accessibilityRemoveValueForKey:", CFSTR("_AXShouldFocusOnTodayStorageKey"));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_compactMonthDividedListSwitchBarButtonItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RootNavigationControllerAccessibility;
  -[RootNavigationControllerAccessibility _compactMonthDividedListSwitchBarButtonItem](&v5, sel__compactMonthDividedListSwitchBarButtonItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("list.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)_axCurrentDayViewMode
{
  unint64_t v2;
  void *v3;

  v2 = -[RootNavigationControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("currentDayViewMode"));
  if (v2 <= 2)
  {
    accessibilityLocalizedString(off_25027D650[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_listViewSwitchBarButtonItem
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RootNavigationControllerAccessibility;
  -[RootNavigationControllerAccessibility _listViewSwitchBarButtonItem](&v8, sel__listViewSwitchBarButtonItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__RootNavigationControllerAccessibility__listViewSwitchBarButtonItem__block_invoke;
  v5[3] = &unk_25027D630;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __69__RootNavigationControllerAccessibility__listViewSwitchBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axCurrentDayViewMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
