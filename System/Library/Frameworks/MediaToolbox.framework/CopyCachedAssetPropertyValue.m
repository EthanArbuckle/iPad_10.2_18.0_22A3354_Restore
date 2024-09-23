@implementation CopyCachedAssetPropertyValue

CFTypeRef __remoteXPCAsset_CopyCachedAssetPropertyValue_block_invoke(uint64_t a1)
{
  CFTypeRef result;
  void *value;

  value = 0;
  result = (CFTypeRef)CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 32), *(const void **)(a1 + 48), (const void **)&value);
  if ((_DWORD)result)
  {
    if (value == (void *)*MEMORY[0x1E0C9B0D0])
      result = 0;
    else
      result = CFRetain(value);
    **(_QWORD **)(a1 + 56) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

@end
