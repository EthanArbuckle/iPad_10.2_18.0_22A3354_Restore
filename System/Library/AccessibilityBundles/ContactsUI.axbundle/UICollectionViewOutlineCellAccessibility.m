@implementation UICollectionViewOutlineCellAccessibility

uint64_t __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  char isKindOfClass;

  v4 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    *a3 = 1;
  return isKindOfClass & 1;
}

void __64___UICollectionViewOutlineCellAccessibility_accessibilityTraits__block_invoke_198(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifierForIndexPath:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
