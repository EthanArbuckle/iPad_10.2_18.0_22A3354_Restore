@implementation AGPEventListenerForMCSession

void __AGPEventListenerForMCSession_block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  v2 = (void *)MEMORY[0x212BB19AC]();
  v3 = 1;
  objc_msgSend(*(id *)(a1 + 32), "syncHandleNetworkEvent:pid:freeEventWhenDone:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), &v3);
  if (v3)
    free(*(void **)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

@end
