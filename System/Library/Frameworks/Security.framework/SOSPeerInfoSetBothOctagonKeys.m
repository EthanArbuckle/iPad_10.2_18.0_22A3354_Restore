@implementation SOSPeerInfoSetBothOctagonKeys

uint64_t __SOSPeerInfoSetBothOctagonKeys_block_invoke(uint64_t a1, uint64_t a2, __CFString **a3)
{
  __CFDictionary *v5;
  const void *v6;

  if (a2
    && (v5 = *(__CFDictionary **)(a2 + 16)) != 0
    && *(_QWORD *)(a1 + 32)
    && (v6 = *(const void **)(a1 + 40)) != 0
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(a1 + 56))
  {
    CFDictionarySetValue(v5, v6, *(const void **)(a1 + 32));
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), *(const void **)(a1 + 56), *(const void **)(a1 + 48));
  }
  else
  {
    SecError(-50, a3, CFSTR("Bad key bytes or dictionary key"));
  }
  return 1;
}

@end
