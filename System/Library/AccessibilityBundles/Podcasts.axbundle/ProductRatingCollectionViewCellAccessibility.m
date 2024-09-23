@implementation ProductRatingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductRatingCollectionViewCellElements
{
  return objc_getAssociatedObject(self, &__ProductLockupCollectionViewCellAccessibility___accessibilityProductRatingCollectionViewCellElements);
}

- (void)_setAccessibilityProductRatingCollectionViewCellElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("setRatingWithProportion:at:"), "v", "f", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("clearAllRatings"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("accessibilityCurrentRatingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("accessibilityOutOfRatingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("accessibilityRatingBreakdownStack"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ProductRatingCollectionViewCell"), CFSTR("accessibilityRatingCountLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[ProductRatingCollectionViewCellAccessibility _accessibilityProductRatingCollectionViewCellElements](self, "_accessibilityProductRatingCollectionViewCellElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDBCE30];
    -[ProductRatingCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCurrentRatingLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProductRatingCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOutOfRatingLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBADA8]), "initWithAccessibilityContainer:representedElements:", self, v7);
    objc_msgSend(v3, "axSafelyAddObject:", v8);
    v23 = 0;
    objc_opt_class();
    -[ProductRatingCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRatingBreakdownStack"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "arrangedSubviews");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v3, "axSafelyAddObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    v23 = 0;
    objc_opt_class();
    -[ProductRatingCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRatingCountLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      abort();
    objc_msgSend(v3, "axSafelyAddObject:", v17);
    -[ProductRatingCollectionViewCellAccessibility _setAccessibilityProductRatingCollectionViewCellElements:](self, "_setAccessibilityProductRatingCollectionViewCellElements:", v3);

  }
  return v3;
}

- (void)setRatingWithProportion:(float)a3 at:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ProductRatingCollectionViewCellAccessibility;
  -[ProductRatingCollectionViewCellAccessibility setRatingWithProportion:at:](&v5, sel_setRatingWithProportion_at_, a4);
  -[ProductRatingCollectionViewCellAccessibility _setAccessibilityProductRatingCollectionViewCellElements:](self, "_setAccessibilityProductRatingCollectionViewCellElements:", 0);
}

- (void)clearAllRatings
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProductRatingCollectionViewCellAccessibility;
  -[ProductRatingCollectionViewCellAccessibility clearAllRatings](&v3, sel_clearAllRatings);
  -[ProductRatingCollectionViewCellAccessibility _setAccessibilityProductRatingCollectionViewCellElements:](self, "_setAccessibilityProductRatingCollectionViewCellElements:", 0);
}

@end
