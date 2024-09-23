@implementation IOHIDRequestAccess

intptr_t __IOHIDRequestAccess_block_invoke(uint64_t a1, int a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

@end
