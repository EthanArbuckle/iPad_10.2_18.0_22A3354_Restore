@implementation SFUnifiedTabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFUnifiedTabBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_titleContainer"), "SFUnifiedTabBarItemTitleContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("searchField"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_voiceSearchButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_closeButton"), "SFUnifiedTabBarItemViewCloseButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_accessoryButtonArrangement"), "SFUnifiedTabBarItemAccessoryButtonArrangement");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_active"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemAccessoryButtonArrangement"), CFSTR("leadingButtonTypes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemAccessoryButtonArrangement"), CFSTR("trailingButtonTypes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_viewForAccessoryButtonOfType:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("showsCloseButton"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SFUnifiedTabBar"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("SFUnifiedBarItemView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedBarItemView"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBar"), CFSTR("itemArrangement"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemArrangement"), CFSTR("items"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_extensionButtonConfiguration"), "SFWebExtensionButtonConfiguration");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFWebExtensionButtonConfiguration"), CFSTR("buttons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_firstExtensionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_secondExtensionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("setExtensionButtonConfiguration:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFWebExtensionButton"), CFSTR("extension"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WBSWebExtensionData"), CFSTR("displayShortName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_overlayView"), "SFURLFieldOverlayView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("setOverlayConfiguration:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFURLFieldOverlayView"), CFSTR("_textLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFURLFieldOverlayView"), CFSTR("_secondaryTextLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFURLFieldOverlayView"), CFSTR("_buttons"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFUnifiedTabBarItemView"), CFSTR("_hasHiddenElements"), "BOOL");

}

- (BOOL)_axSearchFieldIsActive
{
  void *v2;
  char v3;

  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (id)_axScribbleOverlay
{
  void *v2;
  void *v3;
  id v4;

  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_overlayView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "_accessibilityViewIsVisible"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  char v10;

  -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_textLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "text");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    -[SFUnifiedTabBarItemViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_8;
    if (!-[SFUnifiedTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_active")))
    {
      v7 = 0;
      goto LABEL_8;
    }
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

LABEL_8:
  return v7;
}

- (_NSRange)_accessibilityVisibleTextRange
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  objc_super v9;
  _NSRange result;

  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityVisibleTextRange");
    v6 = v5;

    v7 = v4;
    v8 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    v7 = (NSUInteger)-[SFUnifiedTabBarItemViewAccessibility _accessibilityVisibleTextRange](&v9, sel__accessibilityVisibleTextRange);
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilitySetSelectedTextRange:", location, length);

  }
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilityReplaceCharactersAtCursor:withString:", a3, v7);

  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  unint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  objc_super v10;

  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "accessibilityTraits");

    return v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    v6 = -[SFUnifiedTabBarItemViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
    -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      return *MEMORY[0x24BDF73E0];
    }
    else
    {
      v8 = -[SFUnifiedTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_active"));
      v9 = *MEMORY[0x24BEBB188];
      if (v8)
        v9 = 0;
      return v9 | v6;
    }
  }
}

- (_NSRange)_accessibilityRowRange
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  if ((-[SFUnifiedTabBarItemViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_active")) & 1) != 0)
  {
    v3 = 0;
    v4 = 0x7FFFFFFFLL;
  }
  else
  {
    -[SFUnifiedTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23491571C](CFSTR("SFUnifiedTabBar"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("itemArrangement"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeArrayForKey:", CFSTR("items"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFUnifiedTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "indexOfObject:", v8);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = 0;
        v3 = 0;
      }
      else
      {
        v4 = v9;
        v3 = objc_msgSend(v7, "count");
      }

    }
    else
    {
      v4 = 0;
      v3 = 0;
    }

  }
  v10 = v4;
  v11 = v3;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)_accessibilityResponderElement
{
  void *v3;

  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  objc_super v9;
  _NSRange result;

  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilitySelectedTextRange");
    v6 = v5;

    v7 = v4;
    v8 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
    v7 = (NSUInteger)-[SFUnifiedTabBarItemViewAccessibility _accessibilitySelectedTextRange](&v9, sel__accessibilitySelectedTextRange);
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v2;
  id v3;
  SFUnifiedTabBarItemViewAccessibility *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = self;
    if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_accessibilitySupplementaryHeaderViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v6);
            objc_msgSend(v3, "axSafelyAddObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v7);
      }

      v4 = self;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SFUnifiedTabBarItemViewAccessibility safeValueForKey:](v4, "safeValueForKey:", CFSTR("_accessoryButtonArrangement"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeArrayForKey:", CFSTR("leadingButtonTypes"));
    obj = (id)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(obj);
          v18 = 0;
          v19 = &v18;
          v20 = 0x3032000000;
          v21 = __Block_byref_object_copy__1;
          v22 = __Block_byref_object_dispose__1;
          v23 = 0;
          AXPerformSafeBlock();
          v14 = (id)v19[5];
          _Block_object_dispose(&v18, 8);

          objc_msgSend(v3, "axSafelyAddObject:", v14);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v11);
    }

  }
  return v3;
}

void __78__SFUnifiedTabBarItemViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  void *v20;
  SFUnifiedTabBarItemViewAccessibility *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = self;
  -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  if (v4)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "safeArrayForKey:", CFSTR("_buttons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "axSafelyAddObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v6);
    }
  }
  else
  {
    if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("searchField"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_accessibilitySupplementaryFooterViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v33 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(v3, "axSafelyAddObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v11);
      }

      self = v21;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SFUnifiedTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryButtonArrangement"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeArrayForKey:", CFSTR("trailingButtonTypes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v5);
          v22 = 0;
          v23 = &v22;
          v24 = 0x3032000000;
          v25 = __Block_byref_object_copy__1;
          v26 = __Block_byref_object_dispose__1;
          v27 = 0;
          AXPerformSafeBlock();
          v18 = (id)v23[5];
          _Block_object_dispose(&v22, 8);

          objc_msgSend(v3, "axSafelyAddObject:", v18);
        }
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v15);
    }
  }

  return v3;
}

void __78__SFUnifiedTabBarItemViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_viewForAccessoryButtonOfType:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_accessibilityUpdateWebExtensionLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SFUnifiedTabBarItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_extensionButtonConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("buttons"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_secondExtensionButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("extension.displayShortName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

  }
  if (objc_msgSend(v10, "count"))
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_firstExtensionButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("extension.displayShortName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v9);

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
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
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  -[SFUnifiedTabBarItemViewAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.voicesearch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_voiceSearchButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.mediaStateMute"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_mediaStateMuteButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.moreMenu"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_moreMenuButtonContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v7);

  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.reload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_reloadButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v9);

  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.stop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stopButton"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v11);

  accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.manageExtensions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_multipleExtensionsButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

  objc_initWeak(&location, self);
  -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_formatMenuButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __82__SFUnifiedTabBarItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v19 = &unk_250296AA0;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v15, "setAccessibilityLabelBlock:", &v16);

  -[SFUnifiedTabBarItemViewAccessibility _accessibilityUpdateWebExtensionLabels](self, "_accessibilityUpdateWebExtensionLabels", v16, v17, v18, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __82__SFUnifiedTabBarItemViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("_hasHiddenElements"));

  if (v2)
    accessibilitySafariScribbleLocalizedString(CFSTR("buttonbar.formatMenu.distractions.hidden"));
  else
    accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.formatMenu"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SFUnifiedTabBarItemViewAccessibility)initWithFrame:(CGRect)a3
{
  SFUnifiedTabBarItemViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  v3 = -[SFUnifiedTabBarItemViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SFUnifiedTabBarItemViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;
  char v11;

  -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_secondaryTextLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "text");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v6;

    goto LABEL_9;
  }
  if (-[SFUnifiedTabBarItemViewAccessibility _axSearchFieldIsActive](self, "_axSearchFieldIsActive"))
  {
    v7 = CFSTR("searchField");
LABEL_7:
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v10.receiver = self;
  v10.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  -[SFUnifiedTabBarItemViewAccessibility accessibilityValue](&v10, sel_accessibilityValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v7 = CFSTR("_titleContainer");
    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  -[SFUnifiedTabBarItemViewAccessibility accessibilityHint](&v6, sel_accessibilityHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SFUnifiedTabBarItemViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityHint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setExtensionButtonConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  -[SFUnifiedTabBarItemViewAccessibility setExtensionButtonConfiguration:](&v4, sel_setExtensionButtonConfiguration_, a3);
  -[SFUnifiedTabBarItemViewAccessibility _accessibilityUpdateWebExtensionLabels](self, "_accessibilityUpdateWebExtensionLabels");
}

- (void)setOverlayConfiguration:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedTabBarItemViewAccessibility;
  -[SFUnifiedTabBarItemViewAccessibility setOverlayConfiguration:](&v5, sel_setOverlayConfiguration_, a3);
  -[SFUnifiedTabBarItemViewAccessibility _axScribbleOverlay](self, "_axScribbleOverlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
