@implementation ReturnSurfaceToCache

void __ReturnSurfaceToCache_block_invoke(uint64_t a1, CI::SurfaceCacheEntry *a2)
{
  __IOSurface *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  signed int v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(__IOSurface **)(a1 + 32);
  v4 = CI::gCacheList;
  if (v3)
    v5 = CI::gCacheList == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = CI::gCacheList;
    while (1)
    {
      v6 = *(_QWORD *)(v6 + 8);
      if (v6 == CI::gCacheList)
        break;
      v7 = *(_QWORD *)(v6 + 16);
      if (*(__IOSurface **)(v7 + 24) == v3)
      {
        v8 = *(_QWORD *)(v7 + 88);
        if (v8 <= 0)
          __ReturnSurfaceToCache_block_invoke_cold_1();
        v9 = v8 - 1;
        *(_QWORD *)(v7 + 88) = v9;
        if (!v9)
        {
          if (*(_QWORD *)(v7 + 152))
          {
            CI::RemoveCacheEntry((CI *)v7, a2);
            v3 = (__IOSurface *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
            goto LABEL_12;
          }
          v12 = *(_DWORD *)(v7 + 96);
          if (v12 != 8)
          {
            if (v12 == -1)
              goto LABEL_21;
            if (v12 > 6 || (v13 = *(_QWORD *)(v4 + 8), v13 == v4))
            {
LABEL_32:
              v3 = (__IOSurface *)SurfaceSetVolatile(v3, v12);
            }
            else
            {
              while (1)
              {
                v14 = *(_QWORD *)(v13 + 16);
                if (*(int *)(v14 + 96) >= 7
                  && !*(_QWORD *)(v14 + 88)
                  && *(_DWORD *)(v14 + 56)
                  && *(_QWORD *)(v14 + 64)
                  && SurfaceIsVolatileNonEmpty(*(__IOSurface **)(v14 + 24)))
                {
                  break;
                }
                v13 = *(_QWORD *)(v13 + 8);
                if (v13 == v4)
                {
                  v3 = *(__IOSurface **)(v7 + 24);
                  v12 = *(_DWORD *)(v7 + 96);
                  goto LABEL_32;
                }
              }
LABEL_21:
              CI::SurfaceCacheEntry::empty((IOSurfaceRef *)v7);
            }
          }
LABEL_12:
          v3 = (__IOSurface *)CI::RemoveFromStartUntilAtOrBelowCapacity(v3);
        }
        CI::UpdateVolatilityStats(v3);
        v10 = CI_LOG_SURFACE_CACHE();
        if (v10)
          CI::LogCacheState((CI *)(v10 > 1), (uint64_t)"ReturnSurfaceToCache", v11);
        break;
      }
    }
    v3 = *(__IOSurface **)(a1 + 32);
  }
  if (v3)
    CFRelease(v3);
}

void __ReturnSurfaceToCache_block_invoke_cold_1()
{
  __assert_rtn("useCountDecrement", "surface-cache.cpp", 121, "_useCount > 0");
}

@end
