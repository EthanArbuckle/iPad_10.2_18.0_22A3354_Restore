@implementation CAGetRootQueue

NSObject *__CAGetRootQueue_block_invoke()
{
  NSObject *result;

  result = CACreateQueueWithWorkloop("com.apple.coreanimation.workloop_queue");
  CA::_root_queue = (uint64_t)result;
  return result;
}

@end
