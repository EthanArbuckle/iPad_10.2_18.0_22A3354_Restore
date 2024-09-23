@implementation IsScopeActive

void __IsScopeActive_block_invoke(uint64_t a1)
{
  const __CFArray *v1;
  _QWORD context[4];
  __int128 v3;
  uint64_t v4;
  CFRange v5;

  v1 = (const __CFArray *)sLogSettings;
  if (sLogSettings)
  {
    context[0] = MEMORY[0x24BDAC760];
    context[1] = 0x40000000;
    context[2] = __IsScopeActive_block_invoke_2;
    context[3] = &unk_24C7B97C0;
    v3 = *(_OWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v5.length = CFArrayGetCount((CFArrayRef)sLogSettings);
    v5.location = 0;
    CFArrayApplyFunction(v1, v5, (CFArrayApplierFunction)apply_block_1, context);
  }
}

uint64_t __IsScopeActive_block_invoke_2(uint64_t result, const __CFSet *cf)
{
  const __CFSet *v2;
  uint64_t v3;
  CFTypeID v4;
  BOOL v5;
  CFTypeID v6;
  CFTypeID v7;

  if (cf)
  {
    v2 = cf;
    v3 = result;
    v4 = CFGetTypeID(cf);
    result = CFSetGetTypeID();
    if (v4 == result
      || (v6 = CFGetTypeID(v2), result = CFDictionaryGetTypeID(), v6 == result)
      && (result = (uint64_t)CFDictionaryGetValue(v2, *(const void **)(v3 + 40))) != 0
      && (v2 = (const __CFSet *)result, v7 = CFGetTypeID((CFTypeRef)result), result = CFSetGetTypeID(), v7 == result))
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24))
      {
        v5 = CFSetContainsValue(v2, CFSTR("-")) != 0;
        result = CFSetContainsValue(v2, *(const void **)(v3 + 48));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = v5 ^ ((_DWORD)result != 0);
      }
    }
  }
  return result;
}

@end
