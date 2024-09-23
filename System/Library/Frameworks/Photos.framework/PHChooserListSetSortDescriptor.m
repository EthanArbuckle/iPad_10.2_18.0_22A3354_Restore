@implementation PHChooserListSetSortDescriptor

void __PHChooserListSetSortDescriptor_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _sortedInfosFromChooserInfos(*(void **)(*(_QWORD *)(a1 + 32) + 72), *(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

void __PHChooserListSetSortDescriptor_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _sortedInfosFromChooserInfos(*(void **)(*(_QWORD *)(a1 + 32) + 80), *(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

@end
