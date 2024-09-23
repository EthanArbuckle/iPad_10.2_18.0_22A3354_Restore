@implementation MCMRunTransactionalTaskWithDelay

void __MCMRunTransactionalTaskWithDelay_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  JUMPOUT(0x1D17D7874);
}

@end
