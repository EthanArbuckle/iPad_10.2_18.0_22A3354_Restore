@implementation MOSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.MOSuggestionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewCell"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewCell"), CFSTR("subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewCell"), CFSTR("journalButton"), "MOSuggestionSheetJournalButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewCell"), CFSTR("assetGridView"), "MOSuggestionSheetAssetGridView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionSheetAssetGridView"), CFSTR("gridCollectionView"), "Optional<MOSuggestionSheetGridCollectionView>");

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MOSuggestionCollectionViewCellAccessibility _accessibilityGridCollectionView](self, "_accessibilityGridCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234916C80]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[MOSuggestionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSuggestionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSuggestionCollectionViewCellAccessibility _accessibilityGridCollectionView](self, "_accessibilityGridCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityJurassicLocalizedString(CFSTR("suggestion.elements"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityJurassicLocalizedString(CFSTR("suggestion.cell.collapsed.hint"));
}

- (id)accessibilityCustomActions
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
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[MOSuggestionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetGridView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("gridCollectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)MOSuggestionCollectionViewCellAccessibility;
  -[MOSuggestionCollectionViewCellAccessibility accessibilityCustomActions](&v29, sel_accessibilityCustomActions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "visibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "accessibilityCustomActions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v24 = 0;
  objc_opt_class();
  -[MOSuggestionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("journalButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityJurassicLocalizedString(CFSTR("suggestion.write.about.this"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __73__MOSuggestionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v22 = &unk_2502BE258;
    v23 = v14;
    v17 = (void *)objc_msgSend(v15, "initWithName:actionHandler:", v16, &v19);

    objc_msgSend(v6, "addObject:", v17, v19, v20, v21, v22);
  }

  return v6;
}

uint64_t __73__MOSuggestionCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

- (id)_accessibilityGridCollectionView
{
  void *v2;
  void *v3;

  -[MOSuggestionCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetGridView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("gridCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
