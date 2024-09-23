@implementation PurgeCacheEntriesForImage

void __PurgeCacheEntriesForImage_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  int v7;
  const char *v8;

  v1 = *(_DWORD *)(a1 + 32);
  v2 = CI::gCacheList;
  if (v1)
    v3 = CI::gCacheList == 0;
  else
    v3 = 1;
  if (v3)
    goto LABEL_16;
  v4 = *(_QWORD *)(CI::gCacheList + 8);
  if (v4 == CI::gCacheList)
    goto LABEL_16;
  v5 = 0;
  do
  {
    v6 = *(_QWORD *)(v4 + 16);
    if (*(_DWORD *)(v6 + 60) == v1)
    {
      if (*(_QWORD *)(v6 + 88))
        *(_DWORD *)(v6 + 96) = -1;
      else
        CI::SurfaceCacheEntry::empty((IOSurfaceRef *)v6);
      v5 = 1;
    }
    v4 = *(_QWORD *)(v4 + 8);
  }
  while (v4 != v2);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    CI_LOG_SURFACE_CACHE();
  }
  else
  {
    CI::UpdateVolatilityStats((CI *)v6);
    v7 = CI_LOG_SURFACE_CACHE();
    if (v7)
      CI::LogCacheState((CI *)(v7 > 1), (uint64_t)"PurgeCacheEntriesForImage", v8);
  }
}

@end
