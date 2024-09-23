@implementation SearchUICollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUICollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUICardSectionView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIDetailedRowCardSectionView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIHomeScreenAppIconView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIWebCardSectionView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUICombinedCardSectionsView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIHeroCardSectionView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUILabel"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIMapPlaceCardSectionView"));
  objc_msgSend(v4, "validateClass:", CFSTR("SearchUIFlightCardSectionView"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUICardKitProviderSupport.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v4, "validateClass:", CFSTR("SCKPMediaControlCardSectionView"));
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITableViewCell"), CFSTR("rowModel"), "@", 0);
  objc_msgSend(v4, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRowModel"), CFSTR("isTappable"), "B", 0);
  objc_msgSend(v4, "validateClass:hasProperty:withType:", CFSTR("SearchUIRowModel"), CFSTR("identifyingResult"), "@");
  objc_msgSend(v4, "validateClass:hasProperty:withType:", CFSTR("SFSearchResult"), CFSTR("contentType"), "@");

}

- (id)accessibilityElements
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityChildren"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__SearchUICollectionViewCellAccessibility_accessibilityElements__block_invoke;
    v8[3] = &unk_25033DF88;
    v8[4] = self;
    -[SearchUICollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);
  }

  return v6;
}

uint64_t __64__SearchUICollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;

  v5 = a2;
  v6 = v5;
  if (*(id *)(a1 + 32) == v5 || !objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    isKindOfClass = 0;
  }
  else
  {
    NSClassFromString(CFSTR("SearchUICombinedCardSectionsView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *a3 = 1;
LABEL_7:
      isKindOfClass = v6 != 0;
      goto LABEL_8;
    }
    NSClassFromString(CFSTR("SearchUICardSectionView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    NSClassFromString(CFSTR("SCKPMediaControlCardSectionView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      NSClassFromString(CFSTR("SearchUIMultiResultAppCollectionCell"));
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
LABEL_8:

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  -[SearchUICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C]();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (-[SearchUICollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    || AXDoesRequestingClientDeserveAutomation())
  {
    if (!v4)
    {
      -[SearchUICollectionViewCellAccessibility _accessibilityLabelFallback](self, "_accessibilityLabelFallback");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[SearchUICollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDD9968], *MEMORY[0x24BDD9980], *MEMORY[0x24BDD9960], *MEMORY[0x24BDD9978], *MEMORY[0x24BDD9988], *MEMORY[0x24BDD9970], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SearchUIDetailedRowModel"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("identifyingResult"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeStringForKey:", CFSTR("contentType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "containsObject:", v8))
      {
        accessibilityLocalizedString(CFSTR("siri.shortcut"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v9 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v9;
      }

    }
    v4 = v4;

    v10 = v4;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SearchUICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICollectionViewCellAccessibility;
    -[SearchUICollectionViewCellAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;
  void *v5;

  -[SearchUICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (-[SearchUICollectionViewCellAccessibility _accessibilityContainsNestedAccessibilityView](self, "_accessibilityContainsNestedAccessibilityView"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isAccessibilityElement") ^ 1;

    }
  }
  else
  {
    v4 = !-[SearchUICollectionViewCellAccessibility _accessibilityHasAccessibleSubviews](self, "_accessibilityHasAccessibleSubviews");
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUICollectionViewCellAccessibility;
  v3 = -[SearchUICollectionViewCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[SearchUICollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isTappable"));
  v6 = *MEMORY[0x24BDF73B0];
  if (!v5)
    v6 = 0;
  v7 = v6 | v3;

  return v7;
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  if (_accessibilityHasAccessibleSubviews_onceToken_0 != -1)
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken_0, &__block_literal_global_7);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_25033E030;
  v6[4] = self;
  -[SearchUICollectionViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

Class __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  Class result;

  _accessibilityHasAccessibleSubviews_webCardClass_0 = (uint64_t)NSClassFromString(CFSTR("SearchUIWebCardSectionView"));
  _accessibilityHasAccessibleSubviews_detailedRowClass_0 = (uint64_t)NSClassFromString(CFSTR("SearchUIDetailedRowCardSectionView"));
  _accessibilityHasAccessibleSubviews_trailersSectionClass_0 = (uint64_t)NSClassFromString(CFSTR("SearchUITrailersCardSectionView"));
  result = NSClassFromString(CFSTR("CRKContainerCardSectionView"));
  _accessibilityHasAccessibleSubviews_cardKitSection_0 = (uint64_t)result;
  return result;
}

uint64_t __78__SearchUICollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int isKindOfClass;
  char v5;
  int v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = objc_opt_isKindOfClass();
  v6 = objc_opt_isKindOfClass();
  v7 = objc_opt_isKindOfClass();
  v8 = 0;
  if (*(id *)(a1 + 32) != v3 && ((v6 | isKindOfClass | v7) & 1) != 0 && (v5 & 1) == 0)
    v8 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  _QWORD v5[5];
  objc_super v6;

  if (-[SearchUICollectionViewCellAccessibility _accessibilityContainsCombinedView](self, "_accessibilityContainsCombinedView"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUICollectionViewCellAccessibility;
    -[SearchUICollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_accessibilitySupplementaryFooterViews_onceToken != -1)
      dispatch_once(&_accessibilitySupplementaryFooterViews_onceToken, &__block_literal_global_243);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
    v5[3] = &unk_25033E0C0;
    v5[4] = self;
    -[SearchUICollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

Class __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("TLKTextButton"));
  _accessibilitySupplementaryFooterViews_footnoteButtonClass = (uint64_t)result;
  return result;
}

uint64_t __81__SearchUICollectionViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  uint64_t v5;

  v3 = a2;
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (*(id *)(a1 + 32) != v3 && (isKindOfClass & 1) != 0)
    v5 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v5;
}

- (BOOL)_accessibilityContainsCombinedView
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityContainsCombinedView"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    if (_accessibilityContainsCombinedView_onceToken != -1)
      dispatch_once(&_accessibilityContainsCombinedView_onceToken, &__block_literal_global_249);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SearchUICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
          {
            v7 = 1;
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v7 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_17:

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);
  }

  return v7;
}

Class __77__SearchUICollectionViewCellAccessibility__accessibilityContainsCombinedView__block_invoke()
{
  Class result;

  _accessibilityContainsCombinedView_combinedSectionView = (uint64_t)NSClassFromString(CFSTR("SearchUICombinedCardSectionsView"));
  result = NSClassFromString(CFSTR("SearchUIHeroCardSectionView"));
  _accessibilityContainsCombinedView_heroSectionView = (uint64_t)result;
  return result;
}

- (BOOL)_accessibilityContainsNestedAccessibilityView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SearchUICollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        NSClassFromString(CFSTR("SearchUIInfoCardSectionView"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSClassFromString(CFSTR("SearchUIMapPlaceCardSectionView"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSClassFromString(CFSTR("SearchUIFlightCardSectionView"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSClassFromString(CFSTR("SCKPMediaControlCardSectionView"));
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
            }
          }
        }
        v7 = 1;
        goto LABEL_15;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v7 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)_accessibilityLabelFallback
{
  void *v3;
  id *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v14;
  const __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityLabel"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_accessibilityLabelFallback_onceToken != -1)
      dispatch_once(&_accessibilityLabelFallback_onceToken, &__block_literal_global_255);
    -[SearchUICollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_256);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      v6 = &stru_25033E6B0;
      do
      {
        v11 = 0;
        v12 = v6;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "accessibilityLabel", v14, v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v11;
          v12 = v6;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v9);
    }
    else
    {
      v6 = &stru_25033E6B0;
    }
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);

  }
  return v6;
}

Class __70__SearchUICollectionViewCellAccessibility__accessibilityLabelFallback__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SearchUILabel"));
  _accessibilityLabelFallback_searchUILabel = (uint64_t)result;
  return result;
}

uint64_t __70__SearchUICollectionViewCellAccessibility__accessibilityLabelFallback__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

@end
