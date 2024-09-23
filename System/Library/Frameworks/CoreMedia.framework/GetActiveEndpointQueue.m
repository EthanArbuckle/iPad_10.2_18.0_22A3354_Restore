@implementation GetActiveEndpointQueue

dispatch_queue_t __GetActiveEndpointQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("FigEndpointServerActiveEndpointQueue", 0);
  gActiveEndpointQueue = (uint64_t)result;
  return result;
}

@end
