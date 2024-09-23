@implementation MXExtensionMatchingMerger

void __58___MXExtensionMatchingMerger_receiveExtensions_withIndex___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 <= 2)
  {
    v3 = *(_QWORD *)(a1 + 32) + 8 * v2;
    v4 = *(id *)(a1 + 40);
    v5 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v4;

  }
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[2])
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if (v6[3])
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
    v6 = *(_QWORD **)(a1 + 32);
  }
  if (v6[4])
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:");
}

void __45___MXExtensionMatchingMerger_clearExtensions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

}

@end
