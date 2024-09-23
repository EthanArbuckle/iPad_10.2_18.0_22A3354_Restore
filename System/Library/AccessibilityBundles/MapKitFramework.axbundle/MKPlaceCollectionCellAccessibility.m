@implementation MKPlaceCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceCollectionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCollectionCell"), CFSTR("collectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCollectionCell"), CFSTR("savedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCollectionCell"), CFSTR("savedCollectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCollectionCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCollectionViewModel"), CFSTR("placeCollection"), "@", 0);

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
  void *v11;

  -[MKPlaceCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("placeCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXPublisherDescriptionForCollection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MKPlaceCollectionCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("savedView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isHidden") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[MKPlaceCollectionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("savedCollectionLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end
