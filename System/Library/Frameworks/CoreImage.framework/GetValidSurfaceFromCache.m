@implementation GetValidSurfaceFromCache

void __GetValidSurfaceFromCache_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  CI *CacheEntryWithInfo;
  CI *v4;
  __IOSurface *v5;
  unsigned int v6;
  CI::SurfaceCacheEntry *v7;
  const void *v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v12 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 64);
  v2 = *(const __CFString **)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 80);
  CacheEntryWithInfo = (CI *)CI::FindCacheEntryWithInfo((uint64_t)&v12, *(_DWORD *)(a1 + 96), (uint64_t)&v10, *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 104), v2);
  if (!CacheEntryWithInfo)
  {
LABEL_14:
    CI::UpdateVolatilityStats(CacheEntryWithInfo);
    return;
  }
  v4 = CacheEntryWithInfo;
  v5 = (__IOSurface *)*((_QWORD *)CacheEntryWithInfo + 3);
  if (v5 && !SurfaceIsVolatileEmpty(v5))
  {
    if (SurfaceSetNonVolatile(*((__IOSurface **)v4 + 3)))
    {
      ++CI::gCacheGetCount;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *((_QWORD *)v4 + 3);
      CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v6 = *(_DWORD *)(a1 + 108);
      if (v6 < 7)
        ++v6;
      *((_DWORD *)v4 + 24) = v6;
      CI::SurfaceCacheEntry::setIdentifier(v4, *(CFTypeRef *)(a1 + 88));
      v8 = (const void *)*((_QWORD *)v4 + 10);
      if (v8)
        _Block_release(v8);
      *((_QWORD *)v4 + 10) = 0;
      v9 = *((_QWORD *)v4 + 9);
      if (v9)
        dispatch_release(v9);
      *((_QWORD *)v4 + 9) = 0;
      ++*((_QWORD *)v4 + 11);
      CacheEntryWithInfo = (CI *)CI::MoveCacheEntryToEnd(v4, v7);
    }
    else
    {
      CI::SurfaceCacheEntry::empty((IOSurfaceRef *)v4);
    }
    goto LABEL_14;
  }
}

void __GetValidSurfaceFromCache_block_invoke_2(uint64_t a1, uint64_t a2, const char *a3)
{
  CI::LogCacheState((CI *)(*(_DWORD *)(a1 + 32) > 1), (uint64_t)"GetValidSurfaceFromCache", a3);
}

@end
