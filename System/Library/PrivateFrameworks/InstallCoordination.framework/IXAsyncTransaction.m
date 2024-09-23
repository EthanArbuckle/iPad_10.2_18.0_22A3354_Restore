@implementation IXAsyncTransaction

void __IXAsyncTransaction_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A85A5738]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
