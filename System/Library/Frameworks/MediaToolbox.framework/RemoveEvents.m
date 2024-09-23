@implementation RemoveEvents

void __fpic_RemoveEvents_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  uint64_t v3;
  unint64_t v4;
  const void *ValueAtIndex;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v2 = *(const __CFArray **)(a1 + 64);
  if (!v2)
    v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 72) + 184);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayGetCount(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v3 >= 1)
  {
    v4 = v3 + 1;
    do
    {
      v10 = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(v2, v4 - 2);
      fpic_RemoveEventIfNotPlaying(*(const void **)(a1 + 80), ValueAtIndex, *(__CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), &v10);
      if (v10)
      {
        v6 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 72) + 80))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), ValueAtIndex);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        FigPlayerInterstitialEventGetResumptionOffset(v6, (uint64_t)&v8);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        *(_OWORD *)(v7 + 32) = v8;
        *(_QWORD *)(v7 + 48) = v9;
      }
      --v4;
    }
    while (v4 > 1);
  }
}

@end
