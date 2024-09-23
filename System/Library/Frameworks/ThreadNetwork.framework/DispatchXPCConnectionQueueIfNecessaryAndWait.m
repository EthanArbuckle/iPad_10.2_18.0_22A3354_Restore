@implementation DispatchXPCConnectionQueueIfNecessaryAndWait

void __DispatchXPCConnectionQueueIfNecessaryAndWait_block_invoke()
{
  if (dispatch_get_xpc_connection_queue_onceToken != -1)
    dispatch_once(&dispatch_get_xpc_connection_queue_onceToken, &__block_literal_global_23);
  dispatch_queue_set_specific((dispatch_queue_t)dispatch_get_xpc_connection_queue__xpcConnectionQueue, (const void *)DispatchXPCConnectionQueueIfNecessaryAndWait_xpcConnectionQueueMarker, (void *)DispatchXPCConnectionQueueIfNecessaryAndWait_xpcConnectionQueueMarker, 0);
}

@end
