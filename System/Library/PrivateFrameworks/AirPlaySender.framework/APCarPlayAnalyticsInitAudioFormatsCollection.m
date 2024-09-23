@implementation APCarPlayAnalyticsInitAudioFormatsCollection

void __APCarPlayAnalyticsInitAudioFormatsCollection_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFSet *Mutable;
  int v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 28))
  {
    APSLogErrorAt();
    v4 = -6709;
  }
  else
  {
    *(_WORD *)(v2 + 392) = 1;
    Mutable = *(__CFSet **)(v2 + 400);
    if (!Mutable)
    {
      Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
      *(_QWORD *)(v2 + 400) = Mutable;
    }
    CFSetRemoveAllValues(Mutable);
    v4 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

@end
