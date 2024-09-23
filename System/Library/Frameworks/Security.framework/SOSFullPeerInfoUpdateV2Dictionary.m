@implementation SOSFullPeerInfoUpdateV2Dictionary

const void *__SOSFullPeerInfoUpdateV2Dictionary_block_invoke(uint64_t a1, uint64_t a2, __SecKey *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SOSPeerInfoCopyWithV2DictionaryUpdate(a1, a2, *(const __CFDictionary **)(a1 + 32), a3, a4, a6, a7, a8);
}

@end
