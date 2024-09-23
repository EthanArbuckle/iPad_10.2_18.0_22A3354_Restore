@implementation EnqueueOnNewGroup

void ___EnqueueOnNewGroup_block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
