@implementation FigRemoteQueueReceiverSetHandler

void __FigRemoteQueueReceiverSetHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v4 = 0;
  v2 = 0;
  v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
