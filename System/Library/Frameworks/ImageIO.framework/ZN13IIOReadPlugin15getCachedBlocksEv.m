@implementation ZN13IIOReadPlugin15getCachedBlocksEv

const char *___ZN13IIOReadPlugin15getCachedBlocksEv_block_invoke(uint64_t a1, char *a2)
{
  uint64_t v4;
  const char *result;
  int v6;
  unsigned int v8;
  int v9;

  v4 = *(_QWORD *)(a1 + 32);
  result = (const char *)imageio_key_is_equal(a2, (char *)(a1 + 40), 0);
  if ((_DWORD)result)
  {
    v6 = *((_DWORD *)a2 + 9);
    if (v6 != *(_DWORD *)(a1 + 76))
    {
      if ((gIIODebugFlags & 0x300) == 0x100 || (gIIODebugFlags & 0x400000000000) != 0)
        result = ImageIOLog("::: adjusting rowBytes to cached value: %d -> %d\n", *(_DWORD *)(a1 + 76), v6);
      v8 = *(_DWORD *)(a1 + 80);
      if (v8 && (v9 = *((_DWORD *)a2 + 9), v8 >= *((_DWORD *)a2 + 5) * v9))
      {
        *(_DWORD *)(v4 + 300) = v9;
      }
      else
      {
        ImageIOLog(":::::::::::::::::::::::::::::::::::::::::::::::::::\n");
        ImageIOLog("::: cannot adjust rowBytes: cacheKey:%d  key:%d  alloc:%d\n", *(_DWORD *)(a1 + 76), *((_DWORD *)a2 + 9), *(_DWORD *)(a1 + 80));
        return ImageIOLog(":::::::::::::::::::::::::::::::::::::::::::::::::::\n");
      }
    }
  }
  return result;
}

@end
