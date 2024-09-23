@implementation VSMainThreadOperationWithBlock

void __VSMainThreadOperationWithBlock_block_invoke(uint64_t a1)
{
  VSPerformBlockOnMainThread(*(void **)(a1 + 32));
}

@end
