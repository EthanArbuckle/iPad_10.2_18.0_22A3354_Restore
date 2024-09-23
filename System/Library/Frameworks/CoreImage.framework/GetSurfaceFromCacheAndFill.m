@implementation GetSurfaceFromCacheAndFill

uint64_t __GetSurfaceFromCacheAndFill_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  int v11;
  uint64_t CacheEntryWithInfo;
  uint64_t v13;
  const void *v14;
  CI::SurfaceCacheEntry *v15;
  uint64_t v16;
  CI *v17;
  void (*v18)(uint64_t);
  unint64_t v19;
  unint64_t SurfaceMemorySize;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  CFIndex UnusedCacheEntryWithInfo;
  CI::SurfaceCacheEntry *v29;
  _OWORD *v30;
  uint64_t v31;
  CI::SurfaceCacheEntry *v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  __int128 v39;
  const void *v40;
  CI::SurfaceCacheEntry *v41;
  CI *appended;
  const void *v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[3];
  __int128 v51;
  uint64_t v52;
  _QWORD v53[2];
  void (*v54)(uint64_t);
  void *v55;
  __int128 v56;
  uint64_t v57;
  int v58;
  int v59;
  uint8_t buf[4];
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (CI_VERBOSE_SIGNPOSTS())
  {
    v2 = ci_signpost_log_cache();
    if (os_signpost_enabled(v2))
    {
      v3 = *(_DWORD *)(a1 + 96);
      v4 = *(_DWORD *)(a1 + 100);
      v5 = *(_DWORD *)(a1 + 56);
      v6 = *(_DWORD *)(a1 + 60);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 67110400;
      v61 = v3;
      v62 = 1024;
      v63 = v4;
      v64 = 1024;
      v65 = v5;
      v66 = 1024;
      v67 = v6;
      v68 = 2048;
      v69 = v7;
      v70 = 2048;
      v71 = v8;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GetSurfaceFromCacheAndFill", "cid:%u iid:%u [%d %d %zu %zu]", buf, 0x2Eu);
    }
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 0x40000000;
  v54 = __GetSurfaceFromCacheAndFill_block_invoke_19;
  v55 = &__block_descriptor_tmp_20_0;
  v9 = *(_DWORD *)(a1 + 100);
  v58 = *(_DWORD *)(a1 + 96);
  v59 = v9;
  v56 = *(_OWORD *)(a1 + 56);
  ++CI::gCacheGetCount;
  v10 = *(const __CFString **)(a1 + 80);
  v57 = *(_QWORD *)(a1 + 72);
  v51 = v56;
  v52 = v57;
  v11 = *(_DWORD *)(a1 + 104);
  memset(v50, 0, sizeof(v50));
  CacheEntryWithInfo = CI::FindCacheEntryWithInfo((uint64_t)&v51, v11, (uint64_t)v50, v58, v9, v10);
  if (CacheEntryWithInfo)
  {
    v13 = CacheEntryWithInfo;
    v14 = *(const void **)(CacheEntryWithInfo + 24);
    if (v14)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(v14);
    *(_DWORD *)(v13 + 96) = 1;
    CI::SurfaceCacheEntry::setIdentifier((CI::SurfaceCacheEntry *)v13, *(CFTypeRef *)(a1 + 80));
    ++*(_QWORD *)(v13 + 88);
    if (!SurfaceSetNonVolatile(*(__IOSurface **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
    {
      CI::SurfaceCacheEntry::setFillBlock(v13, *(void **)(a1 + 32));
      CI::SurfaceCacheEntry::setFillQueue((CI::SurfaceCacheEntry *)v13, *(dispatch_object_t *)(a1 + 88));
      CI::SurfaceCacheEntry::fillAsync((CI::SurfaceCacheEntry *)v13);
      ++CI::gCacheGetCountPurged;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v13;
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v16)
      CI::Object::ref(v16);
    v17 = (CI *)CI::MoveCacheEntryToEnd((CI *)v13, v15);
    v18 = __GetSurfaceFromCacheAndFill_block_invoke_19;
  }
  else
  {
    ++CI::gCacheGetCountMissed;
    v19 = atomic_load(&CI::gCacheSize);
    SurfaceMemorySize = CreateSurfaceMemorySize(*(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 72), 0x20uLL, *(unsigned int *)(a1 + 104));
    buf[0] = 0;
    v21 = SurfaceMemorySize + v19;
    v22 = CI_SURFACE_CACHE_CAPACITY();
    v23 = 0;
    if (v21 < v22)
    {
      if (CI::gCacheList)
        v23 = *(_QWORD *)(CI::gCacheList + 16) < 0x100uLL;
      else
        v23 = 1;
    }
    v24 = *(_QWORD *)(a1 + 64);
    v25 = *(_QWORD *)(a1 + 72);
    v27 = *(_DWORD *)(a1 + 100);
    v26 = *(_DWORD *)(a1 + 104);
    memset(v49, 0, sizeof(v49));
    UnusedCacheEntryWithInfo = CI::FindUnusedCacheEntryWithInfo(v24, v25, v24, v25, v26, (uint64_t)v49, *(_DWORD *)(a1 + 96), v27, v23, buf, 0);
    v29 = (CI::SurfaceCacheEntry *)UnusedCacheEntryWithInfo;
    if (buf[0])
      ++CI::gCacheGetCountInUseMissed;
    v30 = (_OWORD *)(a1 + 56);
    if (UnusedCacheEntryWithInfo)
    {
      ++CI::gCacheGetCountRecycled;
      v31 = *(_QWORD *)(a1 + 72);
      *(_OWORD *)(UnusedCacheEntryWithInfo + 32) = *v30;
      *(_QWORD *)(UnusedCacheEntryWithInfo + 48) = v31;
      *(_DWORD *)(UnusedCacheEntryWithInfo + 56) = *(_DWORD *)(a1 + 96);
      *(_DWORD *)(UnusedCacheEntryWithInfo + 60) = *(_DWORD *)(a1 + 100);
      *(_DWORD *)(UnusedCacheEntryWithInfo + 96) = 1;
      CI::SurfaceCacheEntry::setIdentifier((CI::SurfaceCacheEntry *)UnusedCacheEntryWithInfo, *(CFTypeRef *)(a1 + 80));
      CI::SurfaceCacheEntry::setFillBlock((uint64_t)v29, *(void **)(a1 + 32));
      CI::SurfaceCacheEntry::setFillQueue(v29, *(dispatch_object_t *)(a1 + 88));
      ++*((_QWORD *)v29 + 11);
      CI::MoveCacheEntryToEnd(v29, v32);
      v33 = (const void *)*((_QWORD *)v29 + 3);
      if (v33)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(v33);
      if (*((_QWORD *)v29 + 11) == 1)
        SurfaceSetVolatileEmpty(*(IOSurfaceRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      SurfaceSetNonVolatile(*(__IOSurface **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    }
    else
    {
      ++CI::gCacheCountAllocated;
      v29 = (CI::SurfaceCacheEntry *)operator new();
      v47 = *v30;
      v48 = *(_QWORD *)(a1 + 72);
      v34 = *(_QWORD *)(a1 + 64);
      v35 = *(_QWORD *)(a1 + 72);
      v37 = *(_DWORD *)(a1 + 100);
      v36 = *(unsigned int *)(a1 + 104);
      v46 = 0;
      v38 = *(_DWORD *)(a1 + 96);
      v39 = *(_OWORD *)(a1 + 80);
      v44 = *(const void **)(a1 + 32);
      v45 = 0uLL;
      v40 = *(const void **)(CI::SurfaceCacheEntry::SurfaceCacheEntry((uint64_t)v29, &v47, v34, v35, v36, &v45, v38, v37, (const void *)v39, *((NSObject **)&v39 + 1), v44)+ 24);
      if (v40)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(v40);
      CI::gCacheBytesAllocated += *((_QWORD *)v29 + 13);
      appended = (CI *)CI::AppendCacheEntry(v29, v41);
      ++*((_QWORD *)v29 + 11);
      CI::RemoveFromStartUntilAtOrBelowCapacity(appended);
    }
    CI::SurfaceCacheEntry::fillAsync(v29);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v29;
    v17 = *(CI **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v17)
      v17 = (CI *)CI::Object::ref((uint64_t)v17);
    v18 = v54;
  }
  CI::UpdateVolatilityStats(v17);
  return ((uint64_t (*)(_QWORD *))v18)(v53);
}

void __GetSurfaceFromCacheAndFill_block_invoke_19(uint64_t a1)
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
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GetSurfaceFromCacheAndFill", "cid:%u iid:%u [%d %d %zu %zu]", (uint8_t *)v9, 0x2Eu);
    }
  }
}

void __GetSurfaceFromCacheAndFill_block_invoke_22(uint64_t a1, uint64_t a2, const char *a3)
{
  CI::LogCacheState((CI *)(*(_DWORD *)(a1 + 32) > 1), (uint64_t)"GetSurfaceFromCacheAndFill", a3);
}

@end
