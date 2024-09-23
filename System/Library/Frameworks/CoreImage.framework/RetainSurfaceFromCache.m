@implementation RetainSurfaceFromCache

void __RetainSurfaceFromCache_block_invoke(CI *a1)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;

  v1 = *((_QWORD *)a1 + 4);
  if (v1)
    v2 = CI::gCacheList == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v3 = CI::gCacheList;
    while (1)
    {
      v3 = *(_QWORD *)(v3 + 8);
      if (v3 == CI::gCacheList)
        break;
      v4 = *(_QWORD *)(v3 + 16);
      if (*(_QWORD *)(v4 + 24) == v1)
      {
        ++*(_QWORD *)(v4 + 88);
        CI::UpdateVolatilityStats(a1);
        v5 = CI_LOG_SURFACE_CACHE();
        if (v5)
          CI::LogCacheState((CI *)(v5 > 1), (uint64_t)"RetainSurfaceFromCache", v6);
        return;
      }
    }
  }
}

@end
