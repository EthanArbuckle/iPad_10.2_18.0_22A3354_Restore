@implementation BRCRemoveFolderInAutoreleasepool

uint64_t __BRCRemoveFolderInAutoreleasepool_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1D17A6BE8]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  return v3;
}

@end
