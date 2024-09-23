@implementation IOPSSetPowerSourceDetails

uint64_t __IOPSSetPowerSourceDetails_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = setPowerSourceDetails(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
