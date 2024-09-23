@implementation ML3ExceptionNSFileLockingError

intptr_t __ML3ExceptionNSFileLockingError_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
