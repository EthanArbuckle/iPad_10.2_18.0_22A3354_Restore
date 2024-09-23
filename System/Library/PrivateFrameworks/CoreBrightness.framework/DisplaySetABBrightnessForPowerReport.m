@implementation DisplaySetABBrightnessForPowerReport

void __DisplaySetABBrightnessForPowerReport_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1272) = *(_DWORD *)(a1 + 40);
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
    __DisplaySetLogicalBrightnessInternal(*(const void **)(a1 + 32), 0x2000, *(float *)(*(_QWORD *)(a1 + 32) + 1256));
}

@end
