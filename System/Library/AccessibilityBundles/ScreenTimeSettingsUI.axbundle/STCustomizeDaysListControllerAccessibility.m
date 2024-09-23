@implementation STCustomizeDaysListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STCustomizeDaysListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STCustomizeDaysListController"), CFSTR("selectedDaySpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STCustomizeDaysListController"), CFSTR("timePickerSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STCustomizeDaysListController"), CFSTR("_showOrHidePickerSpecifierForSpecifier:"), "v", "@", 0);

}

- (void)_accessibilityMarkSelectedSpecifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifiers");
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
        objc_opt_class();
        __UIAccessibilityCastAsSafeCategory();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_accessibilitySetIsExpandedSTUICell:", 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_opt_class();
  -[STCustomizeDaysListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedDaySpecifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_accessibilitySetIsExpandedSTUICell:", 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  -[STCustomizeDaysListControllerAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  v18 = 0;
  objc_opt_class();
  -[STCustomizeDaysListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timePickerSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  objc_msgSend(v5, "specifiers", (_QWORD)v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (*(void **)(*((_QWORD *)&v14 + 1) + 8 * i) != v4)
        {
          v18 = 0;
          objc_opt_class();
          __UIAccessibilityCastAsSafeCategory();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            abort();
          v13 = v12;
          objc_msgSend(v12, "_accessibilitySetIsExpandableSTUICell:", 1);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v9);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  -[STCustomizeDaysListControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[STCustomizeDaysListControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STCustomizeDaysListControllerAccessibility;
  -[STCustomizeDaysListControllerAccessibility _showOrHidePickerSpecifierForSpecifier:](&v4, sel__showOrHidePickerSpecifierForSpecifier_, a3);
  -[STCustomizeDaysListControllerAccessibility _accessibilityMarkSelectedSpecifier](self, "_accessibilityMarkSelectedSpecifier");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
