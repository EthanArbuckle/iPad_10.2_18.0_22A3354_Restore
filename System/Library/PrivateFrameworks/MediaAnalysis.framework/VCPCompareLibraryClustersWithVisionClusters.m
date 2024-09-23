@implementation VCPCompareLibraryClustersWithVisionClusters

void __VCPCompareLibraryClustersWithVisionClusters_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "intersectsSet:"))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v7 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v6, "minusSet:", v8);
    objc_msgSend(v7, "minusSet:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v6, "count"))
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    if (objc_msgSend(v7, "count"))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
    objc_msgSend(*(id *)(a1 + 64), "removeIndex:", a2);
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

  }
}

@end
