@implementation _UICollectionViewOrthogonalScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UICollectionViewOrthogonalScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UICollectionViewOrthogonalScrollView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UICollectionViewOrthogonalScrollView"), CFSTR("_collectionView"), "UICollectionView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("collectionViewLayout"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewLayout"), CFSTR("_orthogonalScrollingAxis"), "Q", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  id v3;
  uint64_t v4;

  v3 = (id)-[_UICollectionViewOrthogonalScrollViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_collectionView.collectionViewLayout"));
  v4 = objc_msgSend(v3, "safeUnsignedIntForKey:", CFSTR("_orthogonalScrollingAxis"));

  return v4 == 1;
}

- (BOOL)_accessibilityScrollAcrossPageBoundaries
{
  double v2;
  double v3;
  char v5;
  id v6;
  id v7;
  char v8;
  double v9;
  double v10;
  char v11;
  id v12[3];

  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)-[_UICollectionViewOrthogonalScrollViewAccessibility _accessibilityUserDefinedScrollAcrossPageBoundaries](self, "_accessibilityUserDefinedScrollAcrossPageBoundaries");
  v11 = 0;
  if (v12[0])
  {
    v11 = objc_msgSend(v12[0], "BOOLValue") & 1;
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
    v8 = 0;
    objc_opt_class();
    v7 = (id)__UIAccessibilityCastAsClass();
    v6 = v7;
    objc_storeStrong(&v7, 0);
    objc_msgSend(v6, "_interpageSpacing");
    v9 = v2;
    v10 = v3;

    v11 = !__CGSizeEqualToSize_4(v9, v10, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  }
  v5 = v11;
  objc_storeStrong(v12, 0);
  return v5 & 1;
}

@end
