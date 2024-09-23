@implementation MPAVRoute

BOOL __41__MPAVRoute_MediaControls__isWiredDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") == 5;
}

@end
