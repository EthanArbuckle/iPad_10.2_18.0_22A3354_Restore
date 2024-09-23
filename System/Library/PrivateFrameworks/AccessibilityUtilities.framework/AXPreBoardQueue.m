@implementation AXPreBoardQueue

void __AXPreBoardQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXPreBoardQueue", 0);
  v1 = (void *)AXPreBoardQueue_PreBoardQueue;
  AXPreBoardQueue_PreBoardQueue = (uint64_t)v0;

}

@end
