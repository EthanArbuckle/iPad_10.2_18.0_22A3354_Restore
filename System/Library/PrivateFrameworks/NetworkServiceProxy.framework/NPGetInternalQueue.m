@implementation NPGetInternalQueue

void __NPGetInternalQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("NetworkServiceProxy internal queue", 0);
  v1 = (void *)qword_1ED062A20;
  qword_1ED062A20 = (uint64_t)v0;

}

@end
