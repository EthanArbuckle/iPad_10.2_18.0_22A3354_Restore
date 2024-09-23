@implementation PKSearchSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSearchSuggestionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSearchSuggestionCollectionViewCell"), CFSTR("_labelSuggestion"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSearchSuggestionCollectionViewCell"), CFSTR("_imageViewIcon"), "UIImageView");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v14;

  objc_opt_class();
  -[PKSearchSuggestionCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageViewIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("assetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSearchSuggestionCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelSuggestion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("mappin.and.ellipse"));
  if (v10)
  {
    accessibilityLocalizedString(CFSTR("map.search.result"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("magnifyingglass")) & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("search.result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
LABEL_8:

LABEL_9:
  return v12;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
