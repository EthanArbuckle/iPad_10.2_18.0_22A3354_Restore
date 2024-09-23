@implementation APMetadataSourceCopyMetadata

const void *__APMetadataSourceCopyMetadata_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFDictionary *v3;
  const void *result;

  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("APNowPlayingInfoArtwork")))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 24);
LABEL_11:
    result = CFDictionaryCreateCopy(v2, v3);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    return result;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("APNowPlayingInfoProgress")))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 32);
    goto LABEL_11;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("APNowPlayingInfoText")))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 40);
    goto LABEL_11;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("APNowPlayingInfoCoalesced")))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 48);
    goto LABEL_11;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("MRNowPlayingInfo")))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 56) + 56);
    goto LABEL_11;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("MRSupportedCommands")))
  {
    result = *(const void **)(*(_QWORD *)(a1 + 56) + 64);
    if (!result)
      goto LABEL_12;
    goto LABEL_21;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("MRPlaybackState")))
  {
    result = *(const void **)(*(_QWORD *)(a1 + 56) + 72);
    if (!result)
      goto LABEL_12;
    goto LABEL_21;
  }
  result = (const void *)CFEqual(*(CFTypeRef *)(a1 + 48), CFSTR("MRNowPlayingClient"));
  if ((_DWORD)result)
  {
    result = *(const void **)(*(_QWORD *)(a1 + 56) + 80);
    if (!result)
      goto LABEL_12;
LABEL_21:
    result = CFRetain(result);
    goto LABEL_12;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -6735;
  return result;
}

@end
