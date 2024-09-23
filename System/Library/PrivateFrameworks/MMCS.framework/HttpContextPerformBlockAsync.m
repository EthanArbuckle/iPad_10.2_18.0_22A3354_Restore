@implementation HttpContextPerformBlockAsync

void __HttpContextPerformBlockAsync_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "hc") + 592))
    os_retain(*(void **)(objc_msgSend(*(id *)(a1 + 32), "hc") + 592));
  objc_msgSend(*(id *)(a1 + 32), "hc");
  voucher_adopt();
  v2 = (void *)MEMORY[0x1D8253730]();
  objc_msgSend(MEMORY[0x1E0D03748], "annotateCallstackForContainerType:block:", objc_msgSend(*(id *)(a1 + 32), "containerType"), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
  v3 = (void *)voucher_adopt();
  if (v3)
    os_release(v3);
}

@end
