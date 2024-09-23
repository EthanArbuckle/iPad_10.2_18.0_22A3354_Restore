@implementation FPLayerStateSyncQueue

void ___FPLayerStateSyncQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.FramePacing.LayerStateSyncQueue", 0);
  v1 = (void *)qword_25430AE10;
  qword_25430AE10 = (uint64_t)v0;

}

@end
