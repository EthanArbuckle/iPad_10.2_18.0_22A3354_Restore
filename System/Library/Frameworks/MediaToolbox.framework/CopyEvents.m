@implementation CopyEvents

CFArrayRef __fpic_CopyEvents_block_invoke(uint64_t a1)
{
  _BOOL4 ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy;
  const __CFAllocator *v3;
  CFArrayRef result;

  ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy = fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(_QWORD *)(a1 + 32));
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy)
    result = CFArrayCreate(v3, 0, 0, MEMORY[0x1E0C9B378]);
  else
    result = CFArrayCreateCopy(v3, *(CFArrayRef *)(*(_QWORD *)(a1 + 48) + 184));
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

CFArrayRef __fpirc_CopyEvents_block_invoke(uint64_t a1)
{
  CFArrayRef result;

  result = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 136));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
