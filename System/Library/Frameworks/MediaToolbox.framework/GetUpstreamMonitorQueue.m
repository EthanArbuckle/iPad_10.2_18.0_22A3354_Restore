@implementation GetUpstreamMonitorQueue

void __GetUpstreamMonitorQueue_block_invoke()
{
  GetUpstreamMonitorQueue_queue = (uint64_t)dispatch_queue_create(0, 0);
  dispatch_set_context((dispatch_object_t)GetUpstreamMonitorQueue_queue, &GetUpstreamMonitorQueue_context);
}

@end
