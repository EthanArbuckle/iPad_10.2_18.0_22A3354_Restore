@implementation C3DLightingSystemGetLightingContext

uint64_t __C3DLightingSystemGetLightingContext_block_invoke(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_OWORD *)(*(_QWORD *)(result + 40) + 536);
  *(_OWORD *)(v4 + 44) = *(_OWORD *)(*(_QWORD *)(result + 40) + 552);
  *(_OWORD *)(v4 + 28) = v5;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 24) & 0x807F | (a2 << 7);
  if (a2)
  {
    v7 = result;
    v8 = 0;
    v9 = 8 * a2;
    do
    {
      result = C3DLightGetCategoryBitMask(*(_QWORD *)(a4 + v8));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 8) + v8 + 64) = result;
      v8 += 8;
    }
    while (v9 != v8);
  }
  return result;
}

@end
