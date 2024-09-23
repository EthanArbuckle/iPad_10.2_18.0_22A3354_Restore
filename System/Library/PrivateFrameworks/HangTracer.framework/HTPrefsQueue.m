@implementation HTPrefsQueue

void __HTPrefsQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.hangtracer.prefsqueue", 0);
  v1 = (void *)HTPrefsQueue__htPrefsQueue;
  HTPrefsQueue__htPrefsQueue = (uint64_t)v0;

}

@end
