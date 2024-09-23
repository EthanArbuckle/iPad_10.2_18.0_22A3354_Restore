@implementation HTConnectionQueue

void __HTConnectionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.hangtracer.connectionqueue", 0);
  v1 = (void *)HTConnectionQueue__htConnectionQueue;
  HTConnectionQueue__htConnectionQueue = (uint64_t)v0;

}

@end
