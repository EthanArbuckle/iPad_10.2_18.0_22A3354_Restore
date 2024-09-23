@implementation SOSPeerInfoCopyWithV2DictionaryUpdate

void __SOSPeerInfoCopyWithV2DictionaryUpdate_block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 80), a2, a3);
}

@end
