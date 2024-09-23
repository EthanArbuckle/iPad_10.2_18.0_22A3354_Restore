@implementation SearchUICombinedCardSectionsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUICombinedCardSectionsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("SearchUICombinedCardSectionsView"), CFSTR("visibleArrangedSubviews"), "@");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SearchUICombinedCardSectionsViewAccessibility _axGetFooterSectionView](self, "_axGetFooterSectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[SearchUICombinedCardSectionsViewAccessibility _axSetInfoOnButton:](self, "_axSetInfoOnButton:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SearchUICombinedCardSectionsViewAccessibility;
    -[SearchUICombinedCardSectionsViewAccessibility _accessibilitySupplementaryFooterViews](&v15, sel__accessibilitySupplementaryFooterViews);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __87__SearchUICombinedCardSectionsViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("TLKTextButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "isAccessibilityElement"))
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v10;
  const __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SearchUICombinedCardSectionsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("visibleArrangedSubviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = &stru_25033E6B0;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "accessibilityLabel", v10, v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("__AXStringForVariablesSentinel");
        __AXStringForVariables();
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v4);
  }
  else
  {
    v6 = &stru_25033E6B0;
  }

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v10;
  const __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SearchUICombinedCardSectionsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("visibleArrangedSubviews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = &stru_25033E6B0;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "accessibilityValue", v10, v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("__AXStringForVariablesSentinel");
        __AXStringForVariables();
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v4);
  }
  else
  {
    v6 = &stru_25033E6B0;
  }

  return v6;
}

- (id)_axGetFooterSectionView
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SearchUICombinedCardSectionsViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("visibleArrangedSubviews"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        NSClassFromString(CFSTR("SearchUIAttributionFooterCardSectionView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)_axSetInfoOnButton:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "setIsAccessibilityElement:", 1);
    objc_msgSend(v8, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_richTitle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeStringForKey:", CFSTR("text"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "length"))
      {
        v4 = v6;
      }
      else
      {
        objc_msgSend(v8, "safeStringForKey:", CFSTR("_title"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v4, "length"))
        {
          accessibilityLocalizedString(CFSTR("search.go.safari"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAccessibilityLabel:", v7);

          goto LABEL_8;
        }
        v6 = v4;
      }
      objc_msgSend(v8, "setAccessibilityLabel:", v6);
    }
LABEL_8:

    v3 = v8;
  }

}

@end
