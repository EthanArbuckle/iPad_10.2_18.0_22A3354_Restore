@implementation DCSXPCQueue

dispatch_queue_t __DCSXPCQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.DictionaryServiceHelper_queue", 0);
  DCSXPCQueue__XPCQueue = (uint64_t)result;
  return result;
}

@end
