@implementation APBonjourBrowserCacheEnsureStarted

uint64_t ___APBonjourBrowserCacheEnsureStarted_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 232) == *(_QWORD *)(a1 + 32))
  {
    if (*(_WORD *)(result + 40))
      return _APBonjourBrowserHandleDeviceEvent((const void *)result, 0, a2, *(const void **)(result + 80));
  }
  return result;
}

uint64_t ___APBonjourBrowserCacheEnsureStarted_block_invoke_2(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 232) == *(_QWORD *)(a1 + 32))
  {
    if (*(_WORD *)(result + 40))
      return _APBonjourBrowserHandleDeviceEvent((const void *)result, 1, a2, *(const void **)(result + 80));
  }
  return result;
}

void ___APBonjourBrowserCacheEnsureStarted_block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 == *(void **)(*(_QWORD *)(a1 + 40) + 232))
    {
      objc_msgSend(v3, "invalidate");

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = 0;
    }
  }
}

@end
