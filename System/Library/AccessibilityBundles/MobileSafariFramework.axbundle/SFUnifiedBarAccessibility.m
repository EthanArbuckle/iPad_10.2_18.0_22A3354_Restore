@implementation SFUnifiedBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SFUnifiedBar"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SFUnifiedTabBar"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBar"), CFSTR("_squishedBarButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedBar"), CFSTR("_squishedContentView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBar"), CFSTR("_squishedTitleContainer"), "SFUnifiedTabBarItemTitleContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBar"), CFSTR("_showsSquishedContent"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBar"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBar"), CFSTR("searchField"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFUnifiedBarAccessibility;
  -[SFUnifiedBarAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[SFUnifiedBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_squishedBarButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_250296AF0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setIsAccessibilityElementBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_250296AA0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

uint64_t __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("_showsSquishedContent"));

  return v2;
}

id __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("subviews"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        MEMORY[0x23491571C](CFSTR("SFUnifiedTabBar"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "safeValueForKey:", CFSTR("_squishedTitleContainer"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessibilityValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (SFUnifiedBarAccessibility)initWithFrame:(CGRect)a3
{
  SFUnifiedBarAccessibility *v3;
  SFUnifiedBarAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedBarAccessibility;
  v3 = -[SFUnifiedBarAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SFUnifiedBarAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SFUnifiedBarAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsSquishedContent")))
  {
    v3 = (void *)MEMORY[0x24BDBCE30];
    -[SFUnifiedBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_squishedContentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  SFUnifiedBarAccessibility *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  SFUnifiedBarAccessibility *v14;
  objc_super v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v2 = self;
  v23 = *MEMORY[0x24BDAC8D0];
  if (-[SFUnifiedBarAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = 0;
    objc_opt_class();
    v14 = v2;
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          MEMORY[0x23491571C](CFSTR("SFUnifiedTabBar"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = 0;
            objc_opt_class();
            objc_msgSend(v9, "safeValueForKey:", CFSTR("searchField"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v11, "isFirstResponder") & 1) != 0)
            {
              v21 = v11;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              return v13;
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v6)
          continue;
        break;
      }
    }

    v2 = v14;
  }
  v15.receiver = v2;
  v15.super_class = (Class)SFUnifiedBarAccessibility;
  -[SFUnifiedBarAccessibility preferredFocusEnvironments](&v15, sel_preferredFocusEnvironments, v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
