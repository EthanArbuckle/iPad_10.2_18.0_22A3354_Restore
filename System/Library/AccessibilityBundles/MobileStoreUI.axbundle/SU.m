@implementation SU

void __53__SU_UIBarButtonItemAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "action"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __82__SU_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilitySortedElementsWithinWithOptions__IsIBooks = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x24BE00560]);

}

uint64_t __82__SU_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "frame");
  v6 = v5;
  objc_msgSend(v4, "frame");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

uint64_t __82__SU_UICollectionViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityIndexPathOfDirectSubviewForDescendantElement:withElementKind:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityDescendantElementAtIndexPathIsValid:", v3) ^ 1;

  return v4;
}

@end
