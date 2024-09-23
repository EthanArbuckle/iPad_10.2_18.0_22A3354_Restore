@implementation SecTrustGetVerifyTime

void __SecTrustGetVerifyTime_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const __CFAllocator *v3;

  v2 = *(_QWORD **)(a1 + 40);
  if (v2[8])
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = MEMORY[0x18D76F188](v2[8]);
  }
  else
  {
    v3 = CFGetAllocator(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = CFDateCreate(v3, *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
}

@end
