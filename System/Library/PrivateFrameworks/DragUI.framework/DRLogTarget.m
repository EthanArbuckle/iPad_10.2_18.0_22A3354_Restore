@implementation DRLogTarget

void __DRLogTarget_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.DragUI", "Dragging");
  v1 = (void *)DRLogTarget_log;
  DRLogTarget_log = (uint64_t)v0;

}

@end
