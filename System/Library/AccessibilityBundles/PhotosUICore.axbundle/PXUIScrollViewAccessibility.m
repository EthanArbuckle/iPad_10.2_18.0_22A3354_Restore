@implementation PXUIScrollViewAccessibility

uint64_t __66___PXUIScrollViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axCompareView:toView:", a2, a3);
}

uint64_t __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348C1678](CFSTR("PXGView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "subviews");
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __68___PXUIScrollViewAccessibility__accessibilityIsInFeedViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXFeedViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  __int128 v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2;
  v6[3] = &__block_descriptor_48_e8_B16__0_8l;
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(a2, "_accessibilityFindDescendant:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

BOOL __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(CGPoint *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  CGRect v6;

  v3 = a2;
  if (objc_msgSend(v3, "isAccessibilityElement"))
  {
    objc_msgSend(v3, "accessibilityFrame");
    v4 = CGRectContainsPoint(v6, a1[2]);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
