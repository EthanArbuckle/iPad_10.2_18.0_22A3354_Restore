@implementation SUUIHorizontalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIHorizontalLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("accessibilityScrollToVisible"), "B", 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SUUIHorizontalLockupCollectionViewCellAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    -[SUUIHorizontalLockupCollectionViewCellAccessibility _accessibilityParentView](self, "_accessibilityParentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPointForPoint();
    v10 = v9;
    v12 = v11;

    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0x47EFFFFFE0000000;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__0;
    v23 = __Block_byref_object_dispose__0;
    v24 = 0;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __87__SUUIHorizontalLockupCollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v18[3] = &unk_2502A6968;
    v18[6] = v10;
    v18[7] = v12;
    v18[4] = v25;
    v18[5] = &v19;
    -[SUUIHorizontalLockupCollectionViewCellAccessibility accessibilityEnumerateContainerElementsUsingBlock:](self, "accessibilityEnumerateContainerElementsUsingBlock:", v18);
    v13 = (void *)v20[5];
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)SUUIHorizontalLockupCollectionViewCellAccessibility;
      -[SUUIHorizontalLockupCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v17, sel__accessibilityHitTest_withEvent_, v7, x, y);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __87__SUUIHorizontalLockupCollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _AXAssert();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v6, "isAccessibilityElement"))
    {
      objc_msgSend(v6, "accessibilityActivationPoint");
      AX_CGPointGetDistanceToPoint();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (v4 < *(double *)(v5 + 24))
      {
        *(double *)(v5 + 24) = v4;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      }
    }
  }

}

- (BOOL)accessibilityScrollToVisible
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIHorizontalLockupCollectionViewCellAccessibility;
  v3 = -[SUUIHorizontalLockupCollectionViewCellAccessibility accessibilityScrollToVisible](&v10, sel_accessibilityScrollToVisible);
  -[SUUIHorizontalLockupCollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("SUUICollectionView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v9[0] = v6;
  v9[1] = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v4, v9, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIHorizontalLockupCollectionViewCellAccessibility;
  -[SUUIHorizontalLockupCollectionViewCellAccessibility layoutSubviews](&v4, sel_layoutSubviews);
  if (_AXSAutomationEnabled())
  {
    -[SUUIHorizontalLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockupView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

  }
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  return (id)-[SUUIHorizontalLockupCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

@end
