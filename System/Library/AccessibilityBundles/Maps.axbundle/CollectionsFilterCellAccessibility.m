@implementation CollectionsFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CollectionsFilterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CollectionsFilterCarouselView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterCell"), CFSTR("filterLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterCell"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterViewModel"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterCarouselView"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterCarouselView"), CFSTR("logicController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionsFilterLogicController"), CFSTR("filters"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CollectionsFilterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("filterLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73B0];
  -[CollectionsFilterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSelected"));

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  if (accessibilityRowRange_onceToken != -1)
    dispatch_once(&accessibilityRowRange_onceToken, &__block_literal_global_4);
  -[CollectionsFilterCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", accessibilityRowRange_carouselViewClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("collectionView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "safeValueForKey:", CFSTR("logicController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    v9 = 0x7FFFFFFFLL;
    if (v5 && v6)
    {
      objc_msgSend(v6, "safeArrayForKey:", CFSTR("filters"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "indexPathForCell:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v9 = objc_msgSend(v12, "item");
          v8 = objc_msgSend(v10, "count");
        }
        else
        {
          v8 = 0;
          v9 = 0x7FFFFFFFLL;
        }

      }
      else
      {
        v8 = 0;
        v9 = 0x7FFFFFFFLL;
      }

    }
  }
  else
  {
    v8 = 0;
    v9 = 0x7FFFFFFFLL;
  }

  v13 = v9;
  v14 = v8;
  result.length = v14;
  result.location = v13;
  return result;
}

uint64_t __59__CollectionsFilterCellAccessibility_accessibilityRowRange__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x2349135AC](CFSTR("CollectionsFilterCarouselView"));
  accessibilityRowRange_carouselViewClass = result;
  return result;
}

@end
