@implementation DisplayStartFastEDRRamp

void __DisplayStartFastEDRRamp_block_invoke(uint64_t a1)
{
  double Current;
  int v3;

  if (*(double *)(a1 + 32) <= 0.0)
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1328) | 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12624) = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12628) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12624);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12608) = 0;
    __DisplaySetLogicalBrightnessInternal(*(const void **)(a1 + 40), v3 | 0x40, *(float *)(*(_QWORD *)(a1 + 40) + 1256));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12608) = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12624) = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12632) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 12628);
    Current = CFAbsoluteTimeGetCurrent();
    *(double *)(*(_QWORD *)(a1 + 40) + 12616) = Current;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12640) = 0;
    LODWORD(Current) = 1007192201;
    __DisplayStartFade(*(_BYTE **)(a1 + 40), Current);
  }
}

@end
