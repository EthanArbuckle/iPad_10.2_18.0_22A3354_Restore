@implementation GetDispatchControlQueue

dispatch_queue_t __GetDispatchControlQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("security scope control", MEMORY[0x24BDAC9C0]);
  GetDispatchControlQueue_sLoggingScopeControlQueue = (uint64_t)result;
  return result;
}

@end
