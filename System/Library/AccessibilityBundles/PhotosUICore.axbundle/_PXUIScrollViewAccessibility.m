@implementation _PXUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PXUIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPXGScrollViewElements
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXPXGScrollViewElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_PXUIScrollView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGView"), CFSTR("rootLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGLayout"), CFSTR("axGroup"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXFeedViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosUIViewController"), CFSTR("contentController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosContentController"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosViewModel"), CFSTR("headerTitle"), "@", 0);

}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  void *v3;
  BOOL v5;

  -[_PXUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXPhotoDetailsScrollView")) & 1) != 0)
  {

    return 0;
  }
  else
  {
    v5 = -[_PXUIScrollViewAccessibility _axUsesPhotosGridKit](self, "_axUsesPhotosGridKit");

    return !v5;
  }
}

- (id)_accessibilitySortedElementsWithin
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];
  char v11;

  -[_PXUIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXExplorerViewControllerScrollView"));

  if (v4)
  {
    v11 = 0;
    objc_opt_class();
    -[_PXUIScrollViewAccessibility _iosAccessibilityAttributeValue:](self, "_iosAccessibilityAttributeValue:", 2095);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66___PXUIScrollViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
    v10[3] = &unk_24FF06608;
    v10[4] = self;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_PXUIScrollViewAccessibility;
    -[_PXUIScrollViewAccessibility _accessibilitySortedElementsWithin](&v9, sel__accessibilitySortedElementsWithin);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (int64_t)_axCompareView:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double MinY;
  double v47;
  int64_t v48;
  double v50;
  double MinX;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = a4;
  v7 = a3;
  -[_PXUIScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("@firstObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeValueForKey:", CFSTR("frame"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v7, "safeValueForKey:", CFSTR("superview"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertRect:fromView:", v19, v12, v14, v16, v18);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(v6, "safeValueForKey:", CFSTR("frame"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "CGRectValue");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v6, "safeValueForKey:", CFSTR("superview"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertRect:fromView:", v37, v30, v32, v34, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v52.origin.x = v21;
  v52.origin.y = v23;
  v52.size.width = v25;
  v52.size.height = v27;
  MinX = CGRectGetMinX(v52);
  v53.origin.x = v39;
  v53.origin.y = v41;
  v53.size.width = v43;
  v53.size.height = v45;
  v50 = CGRectGetMinX(v53);
  v54.origin.x = v21;
  v54.origin.y = v23;
  v54.size.width = v25;
  v54.size.height = v27;
  MinY = CGRectGetMinY(v54);
  v55.origin.x = v39;
  v55.origin.y = v41;
  v55.size.width = v43;
  v55.size.height = v45;
  v47 = CGRectGetMinY(v55);
  if (MinX < v50)
  {
LABEL_5:
    v48 = -1;
    goto LABEL_6;
  }
  if (MinX <= v50)
  {
    if (MinY >= v47)
    {
      v48 = MinY > v47;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v48 = 1;
LABEL_6:

  return v48;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  void *v2;
  char v3;

  -[_PXUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXMemoriesScrollView"));

  return v3;
}

- (BOOL)_accessibilityScrollAcrossPageBoundaries
{
  void *v3;
  char v4;
  objc_super v6;

  -[_PXUIScrollViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXMemoriesScrollView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)_PXUIScrollViewAccessibility;
  return -[_PXUIScrollViewAccessibility _accessibilityScrollAcrossPageBoundaries](&v6, sel__accessibilityScrollAcrossPageBoundaries);
}

- (BOOL)_axUsesPhotosGridKit
{
  void *v2;
  void *v3;
  char isKindOfClass;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXGView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  AXPhotosGroupAccessibilityElement *v12;
  AXPhotosGroupAccessibilityElement *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  if (-[_PXUIScrollViewAccessibility _axUsesPhotosGridKit](self, "_axUsesPhotosGridKit"))
  {
    -[_PXUIScrollViewAccessibility _axPXGScrollViewElements](self, "_axPXGScrollViewElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v18.receiver = self;
      v18.super_class = (Class)_PXUIScrollViewAccessibility;
      -[_PXUIScrollViewAccessibility accessibilityElements](&v18, sel_accessibilityElements);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      v6 = v5;
      if (v5)
      {
        v7 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v3 = v7;

      -[_PXUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_9, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeValueForKey:", CFSTR("rootLayout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("axGroup"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v12 = [AXPhotosGroupAccessibilityElement alloc];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke_2;
      v15[3] = &unk_24FF06EE0;
      objc_copyWeak(&v16, &location);
      v13 = -[AXPhotosGroupAccessibilityElement initWithAccessibilityContainer:forGroup:inView:withAdditionalScrollViewElements:](v12, "initWithAccessibilityContainer:forGroup:inView:withAdditionalScrollViewElements:", self, v11, v9, v15);
      objc_msgSend(v3, "axSafelyAddObject:", v13);
      -[_PXUIScrollViewAccessibility _axSetPXGScrollViewElements:](self, "_axSetPXGScrollViewElements:", v3);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
    return v3;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_PXUIScrollViewAccessibility;
    -[_PXUIScrollViewAccessibility accessibilityElements](&v14, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_axSetPXGScrollViewElements:(id)a3
{
  -[_PXUIScrollViewAccessibility _setAXPXGScrollViewElements:](self, "_setAXPXGScrollViewElements:");
  if (!a3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilityIsInFeedViewController
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_PXUIScrollViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_361, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[_PXUIScrollViewAccessibility _accessibilityIsInFeedViewController](self, "_accessibilityIsInFeedViewController"))
  {
    -[_PXUIScrollViewAccessibility _accessibilityElements](self, "_accessibilityElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v11[3] = &unk_24FF06F48;
    v11[4] = &v12;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_PXUIScrollViewAccessibility;
    -[_PXUIScrollViewAccessibility _accessibilityHitTest:withEvent:](&v18, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
