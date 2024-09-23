@implementation MBRunLoopPerformBlockAndWait

intptr_t __MBRunLoopPerformBlockAndWait_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
