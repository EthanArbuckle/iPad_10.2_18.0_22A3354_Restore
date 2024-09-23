@implementation DisplayClockCapRamp

void __DisplayClockCapRamp_block_invoke(uint64_t a1, double a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12712) = 1;
  LODWORD(a2) = 1015580809;
  __DisplayStartFade(*(_BYTE **)(a1 + 32), a2);
}

@end
