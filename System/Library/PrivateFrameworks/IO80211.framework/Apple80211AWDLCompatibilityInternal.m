@implementation Apple80211AWDLCompatibilityInternal

intptr_t ___Apple80211AWDLCompatibilityInternal_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -3931;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t ___Apple80211AWDLCompatibilityInternal_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -3931;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
