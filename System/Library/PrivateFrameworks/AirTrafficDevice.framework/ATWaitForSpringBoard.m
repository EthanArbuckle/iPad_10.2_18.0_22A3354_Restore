@implementation ATWaitForSpringBoard

intptr_t __ATWaitForSpringBoard_block_invoke(uint64_t a1, int token)
{
  intptr_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (state64)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return result;
}

@end
