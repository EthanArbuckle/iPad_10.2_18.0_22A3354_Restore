@implementation SU_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUICarouselPageSection"), CFSTR("_modelObjects"), "NSArray");
}

- (BOOL)_axIsCollectionViewCarousel
{
  void *v3;
  char v4;
  void *v5;

  -[SU_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShelfCollectionView")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SU_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("SUUICarouselCollection"));

  }
  return v4;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  objc_super v4;

  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SU_UICollectionViewAccessibility;
  return -[SU_UICollectionViewAccessibility _accessibilityOnlyComparesByXAxis](&v4, sel__accessibilityOnlyComparesByXAxis);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SU_UICollectionViewAccessibility;
  -[SU_UICollectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
  {
    -[SU_UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SUUICarouselPageSection"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

  }
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
  {
    -[SU_UICollectionViewAccessibility _accessibilityModelCellCount](self, "_accessibilityModelCellCount");
    v3 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("top.shelf.carousel.status"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SU_UICollectionViewAccessibility;
    -[SU_UICollectionViewAccessibility _accessibilityScrollStatus](&v8, sel__accessibilityScrollStatus);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_accessibilityUseXRightOffsetForScrollOpaqueElementIntoViewDirection:(int64_t)a3
{
  int v5;

  v5 = -[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel");
  if (v5)
  {
    if (a3 == 2)
    {
      LOBYTE(v5) = -[SU_UICollectionViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") ^ 1;
    }
    else if (a3 == 1)
    {
      LOBYTE(v5) = -[SU_UICollectionViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];

  v4 = a3;
  if (_accessibilitySortedElementsWithinWithOptions__onceToken != -1)
    dispatch_once(&_accessibilitySortedElementsWithinWithOptions__onceToken, &__block_literal_global_2);
  if (_accessibilitySortedElementsWithinWithOptions__IsIBooks
    && -[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
  {
    -[SU_UICollectionViewAccessibility subviews](self, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_202);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__SU_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_3;
    v11[3] = &unk_2502A6D48;
    v11[4] = self;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "removeObjectsAtIndexes:", v7);

      v6 = v8;
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SU_UICollectionViewAccessibility;
    -[SU_UICollectionViewAccessibility _accessibilitySortedElementsWithinWithOptions:](&v10, sel__accessibilitySortedElementsWithinWithOptions_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit
{
  unint64_t v3;
  double result;
  unint64_t v5;
  double v6;
  objc_super v7;
  objc_super v8;

  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
  {
    if (-[SU_UICollectionViewAccessibility _accessibilityApplicationIsRTL](self, "_accessibilityApplicationIsRTL"))v3 = -[SU_UICollectionViewAccessibility _accessibilityActualCellCount](self, "_accessibilityActualCellCount");
    else
      v3 = -[SU_UICollectionViewAccessibility _accessibilityModelCellCount](self, "_accessibilityModelCellCount");
    v5 = v3;
    if (-[SU_UICollectionViewAccessibility _accessibilityShouldOverrideScrollViewContentOffsetLimits](self, "_accessibilityShouldOverrideScrollViewContentOffsetLimits"))
    {
      -[SU_UICollectionViewAccessibility _accessibilityCellWidth](self, "_accessibilityCellWidth");
      return v6 * (double)(v5 - 1);
    }
    else
    {
      -[SU_UICollectionViewAccessibility _accessibilityRightOpaqueScrollViewContentOffsetLimit](&v8, sel__accessibilityRightOpaqueScrollViewContentOffsetLimit, v7.receiver, v7.super_class, self, SU_UICollectionViewAccessibility);
    }
  }
  else
  {
    -[SU_UICollectionViewAccessibility _accessibilityRightOpaqueScrollViewContentOffsetLimit](&v7, sel__accessibilityRightOpaqueScrollViewContentOffsetLimit, self, SU_UICollectionViewAccessibility, v8.receiver, v8.super_class);
  }
  return result;
}

- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit
{
  double v3;
  unint64_t v4;
  double v5;
  double result;
  objc_super v7;
  objc_super v8;

  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
  {
    v3 = 0.0;
    if (-[SU_UICollectionViewAccessibility _accessibilityApplicationIsRTL](self, "_accessibilityApplicationIsRTL"))
    {
      v4 = -[SU_UICollectionViewAccessibility _accessibilityActualCellCount](self, "_accessibilityActualCellCount");
      v3 = (double)(v4
                  + ~-[SU_UICollectionViewAccessibility _accessibilityModelCellCount](self, "_accessibilityModelCellCount"));
    }
    if (-[SU_UICollectionViewAccessibility _accessibilityShouldOverrideScrollViewContentOffsetLimits](self, "_accessibilityShouldOverrideScrollViewContentOffsetLimits"))
    {
      -[SU_UICollectionViewAccessibility _accessibilityCellWidth](self, "_accessibilityCellWidth");
      return v3 * v5;
    }
    else
    {
      -[SU_UICollectionViewAccessibility _accessibilityLeftOpaqueScrollViewContentOffsetLimit](&v8, sel__accessibilityLeftOpaqueScrollViewContentOffsetLimit, v7.receiver, v7.super_class, self, SU_UICollectionViewAccessibility);
    }
  }
  else
  {
    -[SU_UICollectionViewAccessibility _accessibilityLeftOpaqueScrollViewContentOffsetLimit](&v7, sel__accessibilityLeftOpaqueScrollViewContentOffsetLimit, self, SU_UICollectionViewAccessibility, v8.receiver, v8.super_class);
  }
  return result;
}

- (BOOL)_accessibilityShouldOverrideScrollViewContentOffsetLimits
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
    return 0;
  -[SU_UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUICarouselPageSection"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_modelObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_accessibilityModelCellCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
    return 0;
  -[SU_UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SUUICarouselPageSection"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_modelObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

- (unint64_t)_accessibilityActualCellCount
{
  if (-[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel"))
    return -[SU_UICollectionViewAccessibility numberOfItemsInSection:](self, "numberOfItemsInSection:", 0);
  else
    return 0;
}

- (double)_accessibilityCellWidth
{
  _BOOL4 v3;
  double result;
  double v5;

  v3 = -[SU_UICollectionViewAccessibility _axIsCollectionViewCarousel](self, "_axIsCollectionViewCarousel");
  result = 0.0;
  if (v3)
  {
    -[SU_UICollectionViewAccessibility contentSize](self, "contentSize", 0.0);
    return v5
         / (double)-[SU_UICollectionViewAccessibility _accessibilityActualCellCount](self, "_accessibilityActualCellCount");
  }
  return result;
}

@end
