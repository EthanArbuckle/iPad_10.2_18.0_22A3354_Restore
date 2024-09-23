@implementation MOSuggestionCollectionViewSingleAssetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.MOSuggestionCollectionViewSingleAssetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewSingleAssetCell"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewSingleAssetCell"), CFSTR("subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionCollectionViewSingleAssetCell"), CFSTR("assetGridView"), "MOSuggestionSheetAssetGridView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionSheetAssetGridView"), CFSTR("gridCollectionView"), "Optional<MOSuggestionSheetGridCollectionView>");

}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MOSuggestionCollectionViewSingleAssetCellAccessibility _accessibilityGridCollectionView](self, "_accessibilityGridCollectionView");
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

  -[MOSuggestionCollectionViewSingleAssetCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSuggestionCollectionViewSingleAssetCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSuggestionCollectionViewSingleAssetCellAccessibility _accessibilityGridCollectionView](self, "_accessibilityGridCollectionView");
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

- (id)_accessibilityGridCollectionView
{
  void *v2;
  void *v3;

  -[MOSuggestionCollectionViewSingleAssetCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetGridView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("gridCollectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
