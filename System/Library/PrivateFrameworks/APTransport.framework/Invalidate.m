@implementation Invalidate

void __queryManagerGetInfo_Invalidate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  int v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 16))
  {
    v4 = -72233;
  }
  else
  {
    v3 = DerivedStorage;
    CFDictionaryApplyBlock();
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(v3 + 24));
    v4 = 0;
    *(_BYTE *)(v3 + 16) = 1;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
}

@end
