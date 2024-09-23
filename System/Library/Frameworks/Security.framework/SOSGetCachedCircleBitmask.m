@implementation SOSGetCachedCircleBitmask

uint64_t __SOSGetCachedCircleBitmask_block_invoke(uint64_t a1, int token, int a3)
{
  if (a3)
    notify_get_state(token, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return 0;
}

@end
