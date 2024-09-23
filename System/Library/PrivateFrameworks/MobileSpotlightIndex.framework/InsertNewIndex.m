@implementation InsertNewIndex

uint64_t __InsertNewIndex_block_invoke_2(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
