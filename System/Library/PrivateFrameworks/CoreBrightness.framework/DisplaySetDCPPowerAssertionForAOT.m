@implementation DisplaySetDCPPowerAssertionForAOT

void __DisplaySetDCPPowerAssertionForAOT_block_invoke(uint64_t a1)
{
  __DisplaySetBLDriverProperty(*(_QWORD *)(a1 + 40), CFSTR("dcp-power-assertion-for-aot"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

@end
