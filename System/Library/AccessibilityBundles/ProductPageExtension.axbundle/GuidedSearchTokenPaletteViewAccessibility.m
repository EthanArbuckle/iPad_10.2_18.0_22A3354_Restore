@implementation GuidedSearchTokenPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.GuidedSearchTokenPaletteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.GuidedSearchTokenPaletteView"), CFSTR("tokens"), "Array<Token>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.GuidedSearchTokenPaletteView"), CFSTR("collectionView"), "Optional<UICollectionView>");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GuidedSearchTokenPaletteViewAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("tokens"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_opt_class();
  -[GuidedSearchTokenPaletteViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "axSafelyAddObject:", v10);
    }
  }

  return v3;
}

@end
