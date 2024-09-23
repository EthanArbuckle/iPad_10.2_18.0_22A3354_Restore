@implementation SICreateNewIndex

void __SICreateNewIndex_block_invoke_2(uint64_t a1, const void *a2)
{
  si_collect_block(*(_QWORD *)(a1 + 32), a2);
}

uint64_t __SICreateNewIndex_block_invoke_236(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

@end
