@implementation UICollectionViewAccessibility

double __83__UICollectionViewAccessibility__Memories__UIKit__accessibilityScrollWidthDistance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sizeForItemAtIndexPath:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;

  v7 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", 0);
  result = (*(double *)(a1 + 64) - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) * (double)v7)
         / (double)(v7 - 1);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

@end
