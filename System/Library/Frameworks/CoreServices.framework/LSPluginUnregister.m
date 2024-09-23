@implementation LSPluginUnregister

uint64_t ___LSPluginUnregister_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a3)
  {
    _CSArrayRemoveValueAtIndex();
    result = _CSArrayGetCount();
    if (!(_DWORD)result)
    {
      _CSArrayDispose();
      result = _CSStoreWriteToUnit();
    }
    *a4 = 1;
  }
  return result;
}

void ___LSPluginUnregister_block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  softLink_ISInvalidateCacheEntriesForBundleIdentifier(*(NSString **)(a1 + 32));
  objc_autoreleasePoolPop(v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
