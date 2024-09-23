@implementation GetSurfaceCacheNonVolatileSizeForContext

uint64_t __GetSurfaceCacheNonVolatileSizeForContext_block_invoke(uint64_t result)
{
  int v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_DWORD *)(result + 40);
  if (v1)
    v2 = CI::gCacheList == 0;
  else
    v2 = 1;
  if (v2 || (v3 = *(_QWORD *)(CI::gCacheList + 8), v3 == CI::gCacheList))
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(v3 + 16);
      if (*(_DWORD *)(v5 + 56) == v1 && *(_QWORD *)(v5 + 88))
        v4 += *(_QWORD *)(v5 + 104);
      v3 = *(_QWORD *)(v3 + 8);
    }
    while (v3 != CI::gCacheList);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v4;
  return result;
}

@end
