@implementation SIShutdownSetup

uint64_t ___SIShutdownSetup_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= indexClosing(a2);
  return 1;
}

@end
