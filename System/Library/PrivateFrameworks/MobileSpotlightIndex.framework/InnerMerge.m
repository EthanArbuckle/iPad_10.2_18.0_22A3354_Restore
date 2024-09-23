@implementation InnerMerge

uint64_t __InnerMerge_block_invoke(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 1, 0);
}

void __InnerMerge_block_invoke_600(uint64_t a1, uint64_t a2)
{
  makeThreadId();
  if (a2 == 1)
  {
    index_optimize_disk_space(*(_QWORD *)(a1 + 40));
  }
  else if (!a2)
  {
    recalculateTopK(*(_QWORD *)(a1 + 32));
  }
}

@end
