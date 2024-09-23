@implementation IPMonitorControlCreate

void __IPMonitorControlCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  IPMonitorControlHandleResponse(a2, 1, &v6);
  if (v6)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(const __CFDictionary **)(v3 + 32);
    if (v4)
    {
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)ApplyInterfaceRank, *(void **)(v3 + 24));
      v3 = *(_QWORD *)(a1 + 32);
    }
    v5 = *(const __CFDictionary **)(v3 + 40);
    if (v5)
      CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)ApplyInterfaceAdvisory, *(void **)(v3 + 24));
  }
}

@end
