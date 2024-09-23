@implementation SearchUICardSectionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUICardSectionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TLKLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TLKTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SearchUICardSectionCollectionViewCell"), CFSTR("_cardSectionView"), "SearchUICardSectionView");
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIDetailedRowCardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICardSectionView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICombinedCardSectionsView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUIMultiResultAppCollectionCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchUICircleButtonItemView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SearchUICircleButtonItemView"), CFSTR("SearchUIButtonItemView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SearchUIButtonItemView"), CFSTR("_buttonTitle"), "NSString");

}

- (id)accessibilityElements
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

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
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75__SearchUICardSectionCollectionViewCellAccessibility_accessibilityElements__block_invoke;
    v9[3] = &unk_25033DF88;
    v9[4] = self;
    -[SearchUICardSectionCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      -[SearchUICardSectionCollectionViewCellAccessibility _axAccessibilityElements](self, "_axAccessibilityElements");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);
  }

  return v6;
}

uint64_t __75__SearchUICardSectionCollectionViewCellAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
        NSClassFromString(CFSTR("SearchUIMultiResultAppCollectionCell"));
        isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_9;
      }
    }
    isKindOfClass = v6 != 0;
  }
LABEL_9:

  return isKindOfClass & 1;
}

- (id)_axAccessibilityElements
{
  void *v2;
  Class v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x24BEBAE08], "_accessibilityGetAllSwiftUISubviews:withFiltering:", self, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NSClassFromString(CFSTR("SwiftUI.AccessibilityNode"));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__SearchUICardSectionCollectionViewCellAccessibility__axAccessibilityElements__block_invoke;
  v6[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v6[4] = v3;
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __78__SearchUICardSectionCollectionViewCellAccessibility__axAccessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "accessibilityTraits");
    v4 = v3 != *MEMORY[0x24BDF73C8];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char isKindOfClass;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[SearchUICardSectionCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SwiftUI.AccessibilityNode"));
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("SearchUIWebCardSectionView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v3, "count");

        if (v8 == 1)
        {
          LOBYTE(v6) = 0;
          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isAccessibilityElement") ^ 1;

      goto LABEL_10;
    }
    LOBYTE(v6) = 1;
  }
  else
  {
    v6 = !-[SearchUICardSectionCollectionViewCellAccessibility _accessibilityHasAccessibleSubviews](self, "_accessibilityHasAccessibleSubviews");
  }
LABEL_10:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUICardSectionCollectionViewCellAccessibility;
  v3 = -[SearchUICardSectionCollectionViewCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[SearchUICardSectionCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))v4 = ~*MEMORY[0x24BDF7400];
  else
    v4 = -1;
  return v4 & v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SearchUICardSectionCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CD7C]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUICardSectionCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_221);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__SearchUICardSectionCollectionViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("TLKTextView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

uint64_t __72__SearchUICardSectionCollectionViewCellAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityValue");
}

- (id)automationCustomProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SearchUICardSectionCollectionViewCellAccessibility accessibilityElements](self, "accessibilityElements");
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
    v8.super_class = (Class)SearchUICardSectionCollectionViewCellAccessibility;
    -[SearchUICardSectionCollectionViewCellAccessibility automationCustomProperties](&v8, sel_automationCustomProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)_accessibilityHasAccessibleSubviews
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  if (_accessibilityHasAccessibleSubviews_onceToken != -1)
    dispatch_once(&_accessibilityHasAccessibleSubviews_onceToken, &__block_literal_global_227);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2;
  v6[3] = &unk_25033E030;
  v6[4] = self;
  -[SearchUICardSectionCollectionViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

Class __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke()
{
  Class result;

  _accessibilityHasAccessibleSubviews_webCardClass = (uint64_t)NSClassFromString(CFSTR("SearchUIWebCardSectionView"));
  _accessibilityHasAccessibleSubviews_detailedRowClass = (uint64_t)NSClassFromString(CFSTR("SearchUIDetailedRowCardSectionView"));
  _accessibilityHasAccessibleSubviews_trailersSectionClass = (uint64_t)NSClassFromString(CFSTR("SearchUITrailersCardSectionView"));
  result = NSClassFromString(CFSTR("CRKContainerCardSectionView"));
  _accessibilityHasAccessibleSubviews_cardKitSection = (uint64_t)result;
  return result;
}

uint64_t __89__SearchUICardSectionCollectionViewCellAccessibility__accessibilityHasAccessibleSubviews__block_invoke_2(uint64_t a1, void *a2)
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

- (id)accessibilityCustomActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionCollectionViewCellAccessibility _axCircleButtonViews](self, "_axCircleButtonViews");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BDF6788]);
        objc_msgSend(v8, "safeValueForKey:", CFSTR("buttonTitle"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __80__SearchUICardSectionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
        v14[3] = &unk_25033E058;
        v14[4] = v8;
        v11 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v10, v14);
        objc_msgSend(v3, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

uint64_t __80__SearchUICardSectionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

- (id)_axCircleButtonViews
{
  return (id)-[SearchUICardSectionCollectionViewCellAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_238);
}

uint64_t __74__SearchUICardSectionCollectionViewCellAccessibility__axCircleButtonViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SearchUICircleButtonItemView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
