@implementation DOCSidebarItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SaveToFiles.DOCSidebarItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewListCellAccessibility"), CFSTR("_accessibilityTrailingViews"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SaveToFiles.DOCEjectButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SaveToFiles.DOCEjectButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SaveToFiles.DOCSidebarItemCell"), CFSTR("UICollectionViewListCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCSidebarItemCell"), CFSTR("accessibilityShowFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCSidebarItemCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCSidebarItemCell"), CFSTR("accessibilityIsEjectable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCSidebarItemCell"), CFSTR("accessibilityTitleTextField"), "@", 0);

}

- (id)_accessibilityRoleDescription
{
  void *v2;

  if (-[DOCSidebarItemCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityShowFolder")))
  {
    accessibilityUIKitLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)DOCSidebarItemCellAccessibility;
  -[DOCSidebarItemCellAccessibility accessibilityCustomActions](&v15, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  if (-[DOCSidebarItemCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsEjectable")))
  {
    objc_initWeak(&location, self);
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("eject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __61__DOCSidebarItemCellAccessibility_accessibilityCustomActions__block_invoke;
    v12 = &unk_2503323B0;
    objc_copyWeak(&v13, &location);
    v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v9);
    objc_msgSend(v3, "addObject:", v7, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __61__DOCSidebarItemCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("_accessibilityTrailingViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        NSClassFromString(CFSTR("SaveToFiles.DOCEjectButton"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          __UIAccessibilityCastAsClass();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "sendActionsForControlEvents:", 64);

            v12 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DOCSidebarItemCellAccessibility;
  -[DOCSidebarItemCellAccessibility accessibilityValue](&v9, sel_accessibilityValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "localizedScannerWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v3, "scanInt:", &v8);
    if (v8 >= 1)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("badge.unread.count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringWithFormat:", v5, v8);
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
    }

  }
  return v2;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  if (-[DOCSidebarItemCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsEjectable")))
  {
    accessibilityLocalizedString(CFSTR("ejectable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[DOCSidebarItemCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCSidebarItemCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilitySubtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF73B0];
  v4 = objc_msgSend(v2, "isSelected");

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCSidebarItemCellAccessibility;
  -[DOCSidebarItemCellAccessibility _accessibilitySupplementaryFooterViews](&v5, sel__accessibilitySupplementaryFooterViews);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", &__block_literal_global_0);
  return v3;
}

uint64_t __73__DOCSidebarItemCellAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("SaveToFiles.DOCEjectButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
