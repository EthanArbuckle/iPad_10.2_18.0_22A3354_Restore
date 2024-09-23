@implementation GetFreeSpaceDispatchQueue

dispatch_queue_t __GetFreeSpaceDispatchQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("freeSpaceDispatchQueue", 0);
  GetFreeSpaceDispatchQueue___queue = (uint64_t)result;
  return result;
}

@end
