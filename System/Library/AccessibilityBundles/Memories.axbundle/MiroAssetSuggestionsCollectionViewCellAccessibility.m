@implementation MiroAssetSuggestionsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MiroAssetSuggestionsCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MiroAssetSuggestionsCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroAssetSuggestionsCollectionViewCell"), CFSTR("configureWithAsset: selected:"), "v", "@", "B", 0);

}

- (void)configureWithAsset:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MiroAssetSuggestionsCollectionViewCellAccessibility;
  v6 = a3;
  -[MiroAssetSuggestionsCollectionViewCellAccessibility configureWithAsset:selected:](&v7, sel_configureWithAsset_selected_, v6, v4);
  -[MiroAssetSuggestionsCollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXAsset"), v7.receiver, v7.super_class);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73C8];
  v3 = -[MiroAssetSuggestionsCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)_axPHAsset
{
  return (id)-[MiroAssetSuggestionsCollectionViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAsset"));
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MiroAssetSuggestionsCollectionViewCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoDescription
{
  void *v2;
  void *v3;

  -[MiroAssetSuggestionsCollectionViewCellAccessibility _axPHAsset](self, "_axPHAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
