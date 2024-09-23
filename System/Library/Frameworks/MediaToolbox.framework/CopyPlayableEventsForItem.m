@implementation CopyPlayableEventsForItem

CFIndex __fpic_CopyPlayableEventsForItem_block_invoke(uint64_t a1)
{
  CFIndex result;
  uint64_t v3;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v6;
  CFTypeRef *v7;

  result = (CFIndex)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  **(_BYTE **)(a1 + 40) = 0;
  v3 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(v3 + 975))
  {
    if (*(_QWORD *)(v3 + 152) == *(_QWORD *)(a1 + 56))
    {
      **(_BYTE **)(a1 + 40) = 1;
      result = fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(_QWORD *)(a1 + 64));
      if (!(_DWORD)result)
      {
        for (i = 0; ; ++i)
        {
          result = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 184);
          if (result)
            result = CFArrayGetCount((CFArrayRef)result);
          if (i >= result)
            break;
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 48) + 184), i);
          v6 = (const void *)(*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 48) + 80))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), ValueAtIndex);
          if (*(_QWORD *)(a1 + 56) == (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 48)
                                                                                               + 88))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), ValueAtIndex)&& !FigPlayerInterstitialEventDidLastPlaybackFail((uint64_t)v6))
          {
            if (FigPlayerInterstitialEventCueOnce((uint64_t)v6))
            {
              v7 = FigPlayerInterstitialEventCopyIdentifier((uint64_t)v6);
              FigCFDictionaryGetInt32IfPresent();
              if (v7)
                CFRelease(v7);
            }
            fpic_EnsureEventHasResolvedProperties(*(const void **)(a1 + 64), *(_QWORD *)(a1 + 72), ValueAtIndex, 0);
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v6);
          }
        }
      }
    }
  }
  return result;
}

const __CFArray *__fpirc_CopyPlayableEventsForItem_block_invoke(uint64_t a1)
{
  CFIndex v2;
  const __CFArray *result;
  const void *ValueAtIndex;
  const void *v5;

  v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  **(_BYTE **)(a1 + 40) = 1;
  while (1)
  {
    result = *(const __CFArray **)(*(_QWORD *)(a1 + 48) + 136);
    if (result)
      result = (const __CFArray *)CFArrayGetCount(result);
    if (v2 >= (uint64_t)result)
      break;
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 48) + 136), v2);
    v5 = (const void *)(*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 48) + 72))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), ValueAtIndex);
    if (*(_QWORD *)(a1 + 72) == (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 48) + 80))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), ValueAtIndex))CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v5);
    ++v2;
  }
  return result;
}

@end
