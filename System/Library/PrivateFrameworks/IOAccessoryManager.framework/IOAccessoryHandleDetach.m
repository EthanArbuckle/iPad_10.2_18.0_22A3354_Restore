@implementation IOAccessoryHandleDetach

uint64_t __IOAccessoryHandleDetach_block_invoke(uint64_t a1)
{
  return performEisMeasurement(*(void **)(a1 + 32));
}

@end
