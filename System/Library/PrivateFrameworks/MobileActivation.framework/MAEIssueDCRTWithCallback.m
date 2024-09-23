@implementation MAEIssueDCRTWithCallback

uint64_t __MAEIssueDCRTWithCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
