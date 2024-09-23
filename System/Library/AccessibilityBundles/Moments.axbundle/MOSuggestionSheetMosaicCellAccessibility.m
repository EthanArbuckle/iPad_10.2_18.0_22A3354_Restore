@implementation MOSuggestionSheetMosaicCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.MOSuggestionSheetMosaicCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.MOSuggestionSheetMosaicCell"), CFSTR("assetView"), "Optional<MOSuggestionSheetAssetView>");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MOSuggestionSheetMosaicCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOSuggestionSheetMosaicCellAccessibility;
  v3 = -[MOSuggestionSheetMosaicCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[MOSuggestionSheetMosaicCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessibilityTraits") | v3;

  return v5;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  -[MOSuggestionSheetMosaicCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("assetView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
