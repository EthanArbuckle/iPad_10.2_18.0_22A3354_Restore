@implementation UICollectionViewAccessibility__Memories__UIKit

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
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MiroEditorFlowLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MiroEditorFlowLayout"), CFSTR("_sizeForItemAtIndexPath:"), "{CGSize=dd}", "@", 0);

}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  void *v3;
  char v4;
  objc_super v6;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return -[UICollectionViewAccessibility__Memories__UIKit accessibilityCollectionViewBehavesLikeUIViewAccessibility](&v6, sel_accessibilityCollectionViewBehavesLikeUIViewAccessibility);
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  void *v3;
  char v4;
  objc_super v6;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return -[UICollectionViewAccessibility__Memories__UIKit isAccessibilityOpaqueElementProvider](&v6, sel_isAccessibilityOpaqueElementProvider);
}

- (double)_accessibilityScrollWidthDistance
{
  void *v3;
  int v4;
  UICollectionViewAccessibility__Memories__UIKit *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  id v12;
  UICollectionViewAccessibility__Memories__UIKit *v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  double (*v22)(uint64_t);
  void *v23;
  id v24;
  UICollectionViewAccessibility__Memories__UIKit *v25;
  uint64_t *v26;
  uint64_t *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  void *v37;
  __int128 v38;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if (v4)
  {
    v5 = self;
    -[UICollectionViewAccessibility__Memories__UIKit collectionViewLayout](v5, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348C07D8](CFSTR("MiroEditorFlowLayout"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UICollectionViewAccessibility__Memories__UIKit contentSize](v5, "contentSize");
      v8 = v7;
      v10 = v9;
      v34 = 0;
      v35 = (double *)&v34;
      v36 = 0x3010000000;
      v11 = (double *)MEMORY[0x24BDBF148];
      v37 = &unk_230B87453;
      v38 = *MEMORY[0x24BDBF148];
      v30 = 0;
      v31 = (double *)&v30;
      v32 = 0x2020000000;
      v33 = 0xBFF0000000000000;
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __83__UICollectionViewAccessibility__Memories__UIKit__accessibilityScrollWidthDistance__block_invoke;
      v23 = &unk_24FEF7078;
      v26 = &v34;
      v12 = v6;
      v24 = v12;
      v13 = v5;
      v25 = v13;
      v27 = &v30;
      v28 = v8;
      v29 = v10;
      AXPerformSafeBlock();
      v14 = v35[4];
      if (v14 != *v11)
        goto LABEL_6;
      if (v35[5] == v11[1])
      {
        v15 = 1;
      }
      else
      {
LABEL_6:
        v16 = v31[3];
        v8 = v14 + v16;
        v15 = v16 < 0.0;
      }

      _Block_object_dispose(&v30, 8);
      _Block_object_dispose(&v34, 8);
      if (!v15)
      {

        return v8;
      }
    }

  }
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  -[UICollectionViewAccessibility__Memories__UIKit _accessibilityScrollWidthDistance](&v19, sel__accessibilityScrollWidthDistance);
  return v17;
}

- (int64_t)accessibilityElementCount
{
  void *v3;
  char v4;
  objc_super v6;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
  return -[UICollectionViewAccessibility__Memories__UIKit accessibilityElementCount](&v6, sel_accessibilityElementCount);
}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  UICollectionViewAccessibility__Memories__UIKit *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  char v14;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if (!v4)
    goto LABEL_5;
  v5 = self;
  -[UICollectionViewAccessibility__Memories__UIKit collectionViewLayout](v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("MiroEditorFlowLayout"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
    -[UICollectionViewAccessibility__Memories__UIKit accessibilityElements](&v13, sel_accessibilityElements);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  v14 = 0;
  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("snappedIndexPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCE30];
  -[UICollectionViewAccessibility__Memories__UIKit cellForItemAtIndexPath:](v5, "cellForItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v5;
  int v6;
  UICollectionViewAccessibility__Memories__UIKit *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  char v14;

  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if (!v6)
    goto LABEL_5;
  v7 = self;
  -[UICollectionViewAccessibility__Memories__UIKit collectionViewLayout](v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C07D8](CFSTR("MiroEditorFlowLayout"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
    -[UICollectionViewAccessibility__Memories__UIKit accessibilityElementAtIndex:](&v13, sel_accessibilityElementAtIndex_, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  v14 = 0;
  objc_opt_class();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("snappedIndexPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UICollectionViewAccessibility__Memories__UIKit cellForItemAtIndexPath:](v7, "cellForItemAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  objc_super v9;

  v4 = a3;
  -[UICollectionViewAccessibility__Memories__UIKit accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AccessibilityMiroUICollectionView"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UICollectionViewAccessibility__Memories__UIKit;
    v7 = -[UICollectionViewAccessibility__Memories__UIKit indexOfAccessibilityElement:](&v9, sel_indexOfAccessibilityElement_, v4);
  }

  return (int64_t)v7;
}

@end
