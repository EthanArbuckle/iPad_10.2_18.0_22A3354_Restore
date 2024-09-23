@implementation EnqueuePackageWithPriority

intptr_t __ids_EnqueuePackageWithPriority_block_invoke(uint64_t a1)
{
  uint64_t v2;

  **(_QWORD **)(a1 + 32) = 0;
  v2 = *(int *)(a1 + 56);
  **(_QWORD **)(*(_QWORD *)(a1 + 40) + 16 * v2 + 104) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * v2 + 104) = *(_QWORD *)(a1 + 32);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 152));
}

void __tcp_EnqueuePackageWithPriority_block_invoke(uint64_t a1)
{
  uint64_t v2;

  **(_QWORD **)(a1 + 32) = 0;
  v2 = 3 * *(int *)(a1 + 56);
  **(_QWORD **)(*(_QWORD *)(a1 + 40) + 24 * *(int *)(a1 + 56) + 136) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v2 + 136) = *(_QWORD *)(a1 + 32);
  write(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 92), "", 1uLL);
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
