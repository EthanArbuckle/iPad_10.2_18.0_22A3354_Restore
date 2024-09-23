@implementation SIRestoreCacheData

void __SIRestoreCacheData_block_invoke(uint64_t a1, void *aBlock)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088);
  v3 = _Block_copy(aBlock);
  si_enqueue_work(v2, (uint64_t)runBlock, (uint64_t)v3);
}

@end
