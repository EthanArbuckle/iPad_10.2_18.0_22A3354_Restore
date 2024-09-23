@implementation VUILibraryProductInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUILibraryProductInfoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryProductInfoView"), CFSTR("infos"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryProductInfoSection"), CFSTR("headerContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILibraryProductInfoSection"), CFSTR("dataViews"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUILibraryProductInfoView"), CFSTR("UIView"));

}

- (id)_accessibilityGetInfoSections
{
  void *v2;
  void *v3;
  void *v4;

  -[VUILibraryProductInfoViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __71__VUILibraryProductInfoViewAccessibility__accessibilityGetInfoSections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[VUILibraryProductInfoViewAccessibility _accessibilityGetInfoSections](self, "_accessibilityGetInfoSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "safeValueForKey:", CFSTR("headerContentView"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "axSafelyAddObject:", v10);

        objc_msgSend(v9, "safeValueForKey:", CFSTR("dataViews"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_accessibilityMarkHeaders
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
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
  -[VUILibraryProductInfoViewAccessibility _accessibilityGetInfoSections](self, "_accessibilityGetInfoSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x24BDF73C0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v8, "safeValueForKey:", CFSTR("headerContentView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setAccessibilityTraits:", v6 | objc_msgSend(v10, "accessibilityTraits"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryProductInfoViewAccessibility;
  -[VUILibraryProductInfoViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VUILibraryProductInfoViewAccessibility _accessibilityMarkHeaders](self, "_accessibilityMarkHeaders");
}

- (void)didMoveToWindow
{
  objc_super v3;

  -[VUILibraryProductInfoViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryProductInfoViewAccessibility;
  -[VUILibraryProductInfoViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
}

@end
