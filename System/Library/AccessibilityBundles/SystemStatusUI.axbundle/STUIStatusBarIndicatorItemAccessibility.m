@implementation STUIStatusBarIndicatorItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[4];
  id v12;
  id location;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)STUIStatusBarIndicatorItemAccessibility;
  -[STUIStatusBarIndicatorItemAccessibility _accessibilityLoadAccessibilityInformation](&v18, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[STUIStatusBarIndicatorItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v9, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "safeValueForKey:", CFSTR("view"), v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIsAccessibilityElement:", 1);
        objc_initWeak(&location, self);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __85__STUIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v11[3] = &unk_25039DA40;
        objc_copyWeak(&v12, &location);
        objc_msgSend(v8, "_setAccessibilityLabelBlock:", v11);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v4);
  }

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarIndicatorItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorQuietModeItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorStudentItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorRotationLockItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorAirplaneModeItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorTTYItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorAssistantItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarVPNItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorLiquidDetectionItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorAirPlayItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorCarPlayItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorAlarmItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorLocationItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarIndicatorSatelliteItem"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarIndicatorItem"), CFSTR("STUIStatusBarItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItem"), CFSTR("displayItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItem"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarIndicatorQuietModeItem"), CFSTR("focusName"), "@", 0);

}

id __85__STUIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char isKindOfClass;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MEMORY[0x2349217D4](CFSTR("STUIStatusBarIndicatorQuietModeItem"));
  isKindOfClass = objc_opt_isKindOfClass();

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "safeStringForKey:", CFSTR("focusName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
  }
  else
  {
    v8 = &unk_2503A2DA8;
    if (!v4)
      v8 = 0;
    v9 = v8;
    v10 = objc_loadWeakRetained(v1);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained(v1);
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      accessibilityLocalizedString(v7);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v16;

  }
  return v6;
}

- (STUIStatusBarIndicatorItemAccessibility)init
{
  STUIStatusBarIndicatorItemAccessibility *v2;
  STUIStatusBarIndicatorItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarIndicatorItemAccessibility;
  v2 = -[STUIStatusBarIndicatorItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarIndicatorItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
