@implementation SOSCachedViewBitmask

uint64_t __SOSCachedViewBitmask_block_invoke(uint64_t a1, int token, uint64_t a3)
{
  if ((_DWORD)a3)
    notify_get_state(token, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return a3;
}

@end
