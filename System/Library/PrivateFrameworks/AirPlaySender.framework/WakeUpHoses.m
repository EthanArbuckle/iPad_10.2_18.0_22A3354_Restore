@implementation WakeUpHoses

uint64_t __audioHoseManagerBuffered_WakeUpHoses_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 56) = 0;
  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 312) != 1886614642)
  {
    result = mach_absolute_time();
    *(_QWORD *)(a3 + 48) = result;
  }
  return result;
}

@end
