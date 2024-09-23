@implementation GetSurfaceFromCache

uint64_t __GetSurfaceFromCache_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  __int128 v11;
  const __CFString *v12;
  uint64_t CacheEntryWithInfo;
  uint64_t v14;
  const void *v15;
  unsigned int v16;
  const void *v17;
  NSObject *v18;
  BOOL v19;
  CI::SurfaceCacheEntry *v20;
  _BYTE *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t SurfaceMemorySize;
  char v27;
  unint64_t v28;
  void (*v29)(uint64_t);
  __int128 *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  CFIndex UnusedCacheEntryWithInfo;
  unint64_t v36;
  unint64_t v37;
  int v38;
  int v39;
  _OWORD *v40;
  uint64_t v41;
  CI::SurfaceCacheEntry *v42;
  const void *v43;
  NSObject *v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const void *v49;
  CI::SurfaceCacheEntry *v50;
  CI *appended;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  _QWORD v65[2];
  void (*v66)(uint64_t);
  void *v67;
  __int128 v68;
  uint64_t v69;
  int v70;
  int v71;
  uint8_t buf[4];
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (CI_VERBOSE_SIGNPOSTS())
  {
    v2 = ci_signpost_log_cache();
    if (os_signpost_enabled(v2))
    {
      v3 = *(_DWORD *)(a1 + 136);
      v4 = *(_DWORD *)(a1 + 140);
      v5 = *(_DWORD *)(a1 + 40);
      v6 = *(_DWORD *)(a1 + 44);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 67110400;
      v73 = v3;
      v74 = 1024;
      v75 = v4;
      v76 = 1024;
      v77 = v5;
      v78 = 1024;
      v79 = v6;
      v80 = 2048;
      v81 = v7;
      v82 = 2048;
      v83 = v8;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetSurfaceFromCache", "cid:%u iid:%u [%d %d %zu %zu]", buf, 0x2Eu);
    }
  }
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 0x40000000;
  v66 = __GetSurfaceFromCache_block_invoke_26;
  v67 = &__block_descriptor_tmp_27_2;
  v9 = *(_DWORD *)(a1 + 140);
  v70 = *(_DWORD *)(a1 + 136);
  v71 = v9;
  v68 = *(_OWORD *)(a1 + 40);
  v69 = *(_QWORD *)(a1 + 56);
  ++CI::gCacheGetCount;
  v63 = v68;
  v64 = v69;
  v10 = *(_DWORD *)(a1 + 144);
  v11 = *(_OWORD *)(a1 + 64);
  v12 = *(const __CFString **)(a1 + 88);
  v62 = *(_QWORD *)(a1 + 80);
  v61 = v11;
  CacheEntryWithInfo = CI::FindCacheEntryWithInfo((uint64_t)&v63, v10, (uint64_t)&v61, v70, v9, v12);
  if (CacheEntryWithInfo)
  {
    v14 = CacheEntryWithInfo;
    v15 = *(const void **)(CacheEntryWithInfo + 24);
    if (v15)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(v15);
    v16 = *(_DWORD *)(a1 + 148);
    if (v16 < 7)
      ++v16;
    *(_DWORD *)(v14 + 96) = v16;
    CI::SurfaceCacheEntry::setIdentifier((CI::SurfaceCacheEntry *)v14, *(CFTypeRef *)(a1 + 88));
    v17 = *(const void **)(v14 + 80);
    if (v17)
      _Block_release(v17);
    *(_QWORD *)(v14 + 80) = 0;
    v18 = *(NSObject **)(v14 + 72);
    if (v18)
      dispatch_release(v18);
    *(_QWORD *)(v14 + 72) = 0;
    ++*(_QWORD *)(v14 + 88);
    v19 = SurfaceSetNonVolatile(*(__IOSurface **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v21 = *(_BYTE **)(a1 + 96);
    if (v19)
    {
      *v21 = 0;
    }
    else
    {
      *v21 = 1;
      ++CI::gCacheGetCountPurged;
    }
    v28 = (unint64_t)CI::MoveCacheEntryToEnd((CI *)v14, v20);
    v29 = __GetSurfaceFromCache_block_invoke_26;
  }
  else
  {
    ++CI::gCacheGetCountMissed;
    v22 = (unint64_t)(*(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 104) - 1)
        / *(_QWORD *)(a1 + 104)
        * *(_QWORD *)(a1 + 104);
    v23 = (unint64_t)(*(_QWORD *)(a1 + 56) + *(_QWORD *)(a1 + 112) - 1)
        / *(_QWORD *)(a1 + 112)
        * *(_QWORD *)(a1 + 112);
    v24 = atomic_load(&CI::gCacheSize);
    v25 = equivalent_uncompressed_format(*(unsigned int *)(a1 + 144));
    SurfaceMemorySize = CreateSurfaceMemorySize(v22, v23, 0x20uLL, v25);
    buf[0] = 0;
    v27 = 0;
    if (SurfaceMemorySize + v24 < CI_SURFACE_CACHE_CAPACITY())
    {
      if (CI::gCacheList)
        v27 = *(_QWORD *)(CI::gCacheList + 16) < 0x100uLL;
      else
        v27 = 1;
    }
    v30 = (__int128 *)(a1 + 64);
    if (!*(_QWORD *)(a1 + 120)
      || (v31 = *(_QWORD *)(a1 + 48),
          v32 = *(_QWORD *)(a1 + 56),
          v34 = *(_DWORD *)(a1 + 140),
          v33 = *(_DWORD *)(a1 + 144),
          v59 = *v30,
          v60 = *(_QWORD *)(a1 + 80),
          (UnusedCacheEntryWithInfo = CI::FindUnusedCacheEntryWithInfo(v31, v32, v22, v23, v33, (uint64_t)&v59, *(_DWORD *)(a1 + 136), v34, 1, buf, *(CFArrayRef *)(a1 + 128))) == 0))
    {
      v36 = *(_QWORD *)(a1 + 48);
      v37 = *(_QWORD *)(a1 + 56);
      v39 = *(_DWORD *)(a1 + 140);
      v38 = *(_DWORD *)(a1 + 144);
      v57 = *v30;
      v58 = *(_QWORD *)(a1 + 80);
      UnusedCacheEntryWithInfo = CI::FindUnusedCacheEntryWithInfo(v36, v37, v22, v23, v38, (uint64_t)&v57, *(_DWORD *)(a1 + 136), v39, v27, buf, 0);
    }
    if (buf[0])
      ++CI::gCacheGetCountInUseMissed;
    v40 = (_OWORD *)(a1 + 40);
    if (UnusedCacheEntryWithInfo)
    {
      ++CI::gCacheGetCountRecycled;
      v41 = *(_QWORD *)(a1 + 56);
      *(_OWORD *)(UnusedCacheEntryWithInfo + 32) = *v40;
      *(_QWORD *)(UnusedCacheEntryWithInfo + 48) = v41;
      *(_DWORD *)(UnusedCacheEntryWithInfo + 56) = *(_DWORD *)(a1 + 136);
      *(_DWORD *)(UnusedCacheEntryWithInfo + 60) = *(_DWORD *)(a1 + 140);
      *(_DWORD *)(UnusedCacheEntryWithInfo + 96) = *(_DWORD *)(a1 + 148);
      CI::SurfaceCacheEntry::setIdentifier((CI::SurfaceCacheEntry *)UnusedCacheEntryWithInfo, *(CFTypeRef *)(a1 + 88));
      v43 = *(const void **)(UnusedCacheEntryWithInfo + 80);
      if (v43)
        _Block_release(v43);
      *(_QWORD *)(UnusedCacheEntryWithInfo + 80) = 0;
      v44 = *(NSObject **)(UnusedCacheEntryWithInfo + 72);
      if (v44)
        dispatch_release(v44);
      *(_QWORD *)(UnusedCacheEntryWithInfo + 72) = 0;
      ++*(_QWORD *)(UnusedCacheEntryWithInfo + 88);
      CI::MoveCacheEntryToEnd((CI *)UnusedCacheEntryWithInfo, v42);
      v45 = *(const void **)(UnusedCacheEntryWithInfo + 24);
      if (v45)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(v45);
      if (*(_QWORD *)(UnusedCacheEntryWithInfo + 88) == 1)
        SurfaceSetVolatileEmpty(*(IOSurfaceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v28 = SurfaceSetNonVolatile(*(__IOSurface **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    }
    else
    {
      ++CI::gCacheCountAllocated;
      v46 = operator new();
      v55 = *v40;
      v56 = *(_QWORD *)(a1 + 56);
      v48 = *(_DWORD *)(a1 + 140);
      v47 = *(unsigned int *)(a1 + 144);
      v53 = *v30;
      v54 = *(_QWORD *)(a1 + 80);
      v49 = *(const void **)(CI::SurfaceCacheEntry::SurfaceCacheEntry(v46, &v55, v22, v23, v47, &v53, *(_DWORD *)(a1 + 136), v48, *(const void **)(a1 + 88), 0, 0)+ 24);
      if (v49)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFRetain(v49);
      CI::gCacheBytesAllocated += *(_QWORD *)(v46 + 104);
      *(_DWORD *)(v46 + 96) = *(_DWORD *)(a1 + 148);
      appended = (CI *)CI::AppendCacheEntry((CI *)v46, v50);
      ++*(_QWORD *)(v46 + 88);
      v28 = CI::RemoveFromStartUntilAtOrBelowCapacity(appended);
    }
    **(_BYTE **)(a1 + 96) = 1;
    v29 = v66;
  }
  CI::UpdateVolatilityStats((CI *)v28);
  return ((uint64_t (*)(_QWORD *))v29)(v65);
}

void __GetSurfaceFromCache_block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (CI_VERBOSE_SIGNPOSTS())
  {
    v2 = ci_signpost_log_cache();
    if (os_signpost_enabled(v2))
    {
      v3 = *(_DWORD *)(a1 + 56);
      v4 = *(_DWORD *)(a1 + 60);
      v5 = *(_DWORD *)(a1 + 32);
      v6 = *(_DWORD *)(a1 + 36);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v9[0] = 67110400;
      v9[1] = v3;
      v10 = 1024;
      v11 = v4;
      v12 = 1024;
      v13 = v5;
      v14 = 1024;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetSurfaceFromCache", "cid:%u iid:%u [%d %d %zu %zu]", (uint8_t *)v9, 0x2Eu);
    }
  }
}

void __GetSurfaceFromCache_block_invoke_29(uint64_t a1, uint64_t a2, const char *a3)
{
  CI::LogCacheState((CI *)(*(_DWORD *)(a1 + 32) > 1), (uint64_t)"GetSurfaceFromCache", a3);
}

@end
