@implementation PerformWithCCUnitToBigEndian

uint64_t __PerformWithCCUnitToBigEndian_block_invoke(uint64_t a1)
{
  CFDataGetLength(*(CFDataRef *)(a1 + 40));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  ccn_write_uint_padded();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
