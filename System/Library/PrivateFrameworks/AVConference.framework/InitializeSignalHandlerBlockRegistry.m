@implementation InitializeSignalHandlerBlockRegistry

id __InitializeSignalHandlerBlockRegistry_block_invoke()
{
  NSObject *CustomRootQueue;
  id result;

  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  gSignalHandlerBlockRegistry1_0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSignalHandler.registryQueue1", 0, CustomRootQueue);
  gSignalHandlerBlockRegistry2_0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSignalHandler.registryQueue2", 0, CustomRootQueue);
  gSignalHandlerBlockRegistry3_0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSignalHandler.registryQueue3", 0, CustomRootQueue);
  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  gSignalHandlerBocks = (uint64_t)result;
  return result;
}

@end
