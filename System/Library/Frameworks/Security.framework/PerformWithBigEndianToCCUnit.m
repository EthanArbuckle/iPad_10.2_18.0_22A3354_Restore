@implementation PerformWithBigEndianToCCUnit

uint64_t __PerformWithBigEndianToCCUnit_block_invoke(uint64_t a1)
{
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 56));
  ccn_read_uint();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
