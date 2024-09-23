@implementation MRUMediaSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUMediaSuggestionCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMediaSuggestionCollectionViewCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMediaSuggestionCollectionViewCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUMediaSuggestionCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMediaSuggestionCollectionViewCell"), CFSTR("artworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUArtworkView"), CFSTR("iconImage"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  void *v10;
  void *v12;

  -[MRUMediaSuggestionCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("iconImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("media.source.app.description"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[MRUMediaSuggestionCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityValue
{
  void *v3;
  objc_super v5;

  if (-[MRUMediaSuggestionCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
  {
    accessibilityLocalizedString(CFSTR("media.item.loading"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MRUMediaSuggestionCollectionViewCellAccessibility;
    -[MRUMediaSuggestionCollectionViewCellAccessibility accessibilityValue](&v5, sel_accessibilityValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
