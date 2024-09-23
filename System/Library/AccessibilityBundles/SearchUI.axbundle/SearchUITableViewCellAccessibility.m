@implementation SearchUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIMovieCardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIWebCardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIDetailedRowCardSectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUITableViewCell"), CFSTR("rowModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRowModel"), CFSTR("cardSection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUIRowModel"), CFSTR("isTappable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SearchUIRowModel"), CFSTR("identifyingResult"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SFSearchResult"), CFSTR("contentType"), "@");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SFTableHeaderRowCardSection"), CFSTR("tableIdentifier"));
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("SFTableHeaderRowCardSection"), CFSTR("SFCardSection"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNActionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("TLKStoreButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIDetailedRowCardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIHomeScreenAppIconView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUICardSectionTableCell"), CFSTR("SearchUITableViewCell"));

}

- (BOOL)_accessibilityUsesOverrideContainerProtocol
{
  void *v2;
  BOOL v3;

  -[SearchUITableViewCellAccessibility _accessibilitySearchCellElements](self, "_accessibilitySearchCellElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUITableViewCellAccessibility;
  -[SearchUITableViewCellAccessibility accessibilityElements](&v7, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
  }
  else
  {
    -[SearchUITableViewCellAccessibility _accessibilitySearchCellElements](self, "_accessibilitySearchCellElements");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_accessibilitySearchCellElements
{
  void *v2;
  id v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SearchUITableViewCellAccessibility__accessibilitySearchCellElements__block_invoke;
  v5[3] = &unk_25033DF88;
  v5[4] = self;
  -[SearchUITableViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t __70__SearchUITableViewCellAccessibility__accessibilitySearchCellElements__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
    }
    else
    {
      NSClassFromString(CFSTR("SearchUICardSectionView"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSClassFromString(CFSTR("SearchUIHomeScreenAppIconView"));
        isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_9;
      }
    }
    isKindOfClass = v6 != 0;
  }
LABEL_9:

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SearchUITableViewCellAccessibility contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindDescendant:", &__block_literal_global_13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUITableViewCellAccessibility;
    -[SearchUITableViewCellAccessibility _accessibilityRetrieveTableViewCellText](&v7, sel__accessibilityRetrieveTableViewCellText);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __77__SearchUITableViewCellAccessibility__accessibilityRetrieveTableViewCellText__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SCKPMediaControlCardSectionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("SearchUIMovieCardSectionView"));
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;

  -[SearchUITableViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
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
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }

  }
  return v4;
}

- (id)automationCustomProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SearchUITableViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "automationCustomProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUITableViewCellAccessibility;
    -[SearchUITableViewCellAccessibility automationCustomProperties](&v8, sel_automationCustomProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SearchUITableViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUITableViewCellAccessibility;
    -[SearchUITableViewCellAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[SearchUITableViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    NSClassFromString(CFSTR("SearchUICardSectionTableCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isAccessibilityElement") ^ 1;

    }
  }
  else
  {
    v5 = !-[SearchUITableViewCellAccessibility _accessibilityHasAccessibleSubviews](self, "_accessibilityHasAccessibleSubviews");
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[SearchUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isTappable"));

  if (v4)
    return *MEMORY[0x24BDF73B0];
  v6.receiver = self;
  v6.super_class = (Class)SearchUITableViewCellAccessibility;
  return -[SearchUITableViewCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  if (_accessibilityHasAccessibleSubviews_onceToken_1 != -1)
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken_1, &__block_literal_global_243_0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_25033E030;
  v6[4] = self;
  -[SearchUITableViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

Class __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  Class result;

  _accessibilityHasAccessibleSubviews_webCardClass_1 = (uint64_t)NSClassFromString(CFSTR("SearchUIWebCardSectionView"));
  _accessibilityHasAccessibleSubviews_detailedRowClass_1 = (uint64_t)NSClassFromString(CFSTR("SearchUIDetailedRowCardSectionView"));
  _accessibilityHasAccessibleSubviews_trailersSectionClass_1 = (uint64_t)NSClassFromString(CFSTR("SearchUITrailersCardSectionView"));
  result = NSClassFromString(CFSTR("CRKContainerCardSectionView"));
  _accessibilityHasAccessibleSubviews_cardKitSection_1 = (uint64_t)result;
  return result;
}

uint64_t __73__SearchUITableViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
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

- (BOOL)_accessibilityShouldSortTableViewCellChildren
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  _QWORD v5[5];
  objc_super v6;

  if (-[SearchUITableViewCellAccessibility _accessibilityContainsCombinedView](self, "_accessibilityContainsCombinedView"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUITableViewCellAccessibility;
    -[SearchUITableViewCellAccessibility _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_accessibilitySupplementaryFooterViews_onceToken_0 != -1)
      dispatch_once(&_accessibilitySupplementaryFooterViews_onceToken_0, &__block_literal_global_250);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2;
    v5[3] = &unk_25033E0C0;
    v5[4] = self;
    -[SearchUITableViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

Class __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("TLKTextButton"));
  _accessibilitySupplementaryFooterViews_footnoteButtonClass_0 = (uint64_t)result;
  return result;
}

uint64_t __76__SearchUITableViewCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2(uint64_t a1, void *a2)
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

- (BOOL)_accessibilityContainsSportsGrid
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;

  -[SearchUITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rowModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("cardSection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSProtocolFromString(CFSTR("SFTableHeaderRowCardSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conformsToProtocol:", v4);

  if (v5)
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("tableIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Period Scores"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_accessibilityContainsCombinedView
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
  -[SearchUITableViewCellAccessibility accessibilityElements](self, "accessibilityElements", 0, 0);
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
        NSClassFromString(CFSTR("SearchUICombinedCardSectionsView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

@end
