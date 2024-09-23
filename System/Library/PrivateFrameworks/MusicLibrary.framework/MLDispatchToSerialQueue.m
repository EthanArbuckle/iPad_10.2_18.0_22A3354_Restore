@implementation MLDispatchToSerialQueue

void ___MLDispatchToSerialQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)__ML3LogSerialQueue;
  __ML3LogSerialQueue = (uint64_t)v0;

}

@end
