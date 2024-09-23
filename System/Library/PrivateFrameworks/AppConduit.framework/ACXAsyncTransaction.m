@implementation ACXAsyncTransaction

void __ACXAsyncTransaction_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D8267F64]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
