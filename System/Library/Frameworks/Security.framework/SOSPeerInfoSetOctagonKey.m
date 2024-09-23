@implementation SOSPeerInfoSetOctagonKey

uint64_t __SOSPeerInfoSetOctagonKey_block_invoke(uint64_t a1, uint64_t a2, __CFString **a3)
{
  __CFDictionary *v4;
  const void *v5;

  if (a2
    && (v4 = *(__CFDictionary **)(a2 + 16)) != 0
    && *(_QWORD *)(a1 + 32)
    && (v5 = *(const void **)(a1 + 40)) != 0)
  {
    CFDictionarySetValue(v4, v5, *(const void **)(a1 + 32));
  }
  else
  {
    SecError(-50, a3, CFSTR("Bad key bytes or dictionary key"));
  }
  return 1;
}

@end
