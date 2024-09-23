@implementation VideosUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIEdgeInsets)_accessibilityContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  char v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  double v24;
  objc_super v25;
  UIEdgeInsets result;

  v25.receiver = self;
  v25.super_class = (Class)VideosUICollectionViewAccessibility;
  -[VideosUICollectionViewAccessibility _accessibilityContentInset](&v25, sel__accessibilityContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VideosUICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AXRelatedStoreItems"));

  if (v12)
  {
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x2020000000;
    v24 = v4;
    v20 = 0;
    objc_opt_class();
    -[VideosUICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __65__VideosUICollectionViewAccessibility__accessibilityContentInset__block_invoke;
    v19[3] = &unk_2503A3190;
    v19[4] = &v21;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
    v4 = v22[3];

    _Block_object_dispose(&v21, 8);
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

void __65__VideosUICollectionViewAccessibility__accessibilityContentInset__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("frame"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CGRectValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24)
                                                                - v4;

  }
}

- (id)_accessibilityOtherCollectionViewItems
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VideosUICollectionViewAccessibility;
  -[VideosUICollectionViewAccessibility _accessibilityOtherCollectionViewItems](&v16, sel__accessibilityOtherCollectionViewItems);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXRelatedStoreItems"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_opt_class();
    -[VideosUICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __77__VideosUICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke;
    v12[3] = &unk_2503A31B8;
    v13 = v3;
    v14 = v6;
    v9 = v6;
    v10 = v3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __77__VideosUICollectionViewAccessibility__accessibilityOtherCollectionViewItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "ax_enqueueObject:", v3);

}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

@end
