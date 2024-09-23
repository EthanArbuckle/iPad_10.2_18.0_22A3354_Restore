@implementation GetKeybagAssertionQueue

dispatch_queue_t __GetKeybagAssertionQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result;

  result = dispatch_queue_create("AKS Lock Assertion Queue", 0);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
