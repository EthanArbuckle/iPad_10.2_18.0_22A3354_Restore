@implementation RemoveCacheEntriesForContext

void __RemoveCacheEntriesForContext_block_invoke(CI *a1, unint64_t a2)
{
  int v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  CI **v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  CI **v12;
  uint64_t v13;
  CI **v14;
  CI *v15;
  int v16;
  const char *v17;
  char *v18;
  CI **v19;
  char *v20;

  v2 = *((_DWORD *)a1 + 8);
  v3 = CI::gCacheList;
  if (v2)
    v4 = CI::gCacheList == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_37;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  v5 = *(_QWORD *)(CI::gCacheList + 8);
  if (v5 == CI::gCacheList)
    goto LABEL_37;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)(v5 + 16);
    if (*(_DWORD *)(v8 + 56) == v2 && !*(_QWORD *)(v8 + 88))
    {
      if (v6 >= (CI **)v20)
      {
        v9 = ((char *)v6 - v18) >> 3;
        if ((unint64_t)(v9 + 1) >> 61)
          abort();
        v10 = (v20 - v18) >> 2;
        if (v10 <= v9 + 1)
          v10 = v9 + 1;
        if ((unint64_t)(v20 - v18) >= 0x7FFFFFFFFFFFFFF8)
          a2 = 0x1FFFFFFFFFFFFFFFLL;
        else
          a2 = v10;
        if (a2)
          a1 = (CI *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v20, a2);
        else
          a1 = 0;
        v11 = (_QWORD *)((char *)a1 + 8 * v9);
        *v11 = v8;
        v6 = (CI **)(v11 + 1);
        v12 = v19;
        if (v19 != (CI **)v18)
        {
          do
          {
            v13 = (uint64_t)*--v12;
            *--v11 = v13;
          }
          while (v12 != (CI **)v18);
          v12 = (CI **)v18;
        }
        v18 = (char *)v11;
        v20 = (char *)a1 + 8 * a2;
        if (v12)
          operator delete(v12);
      }
      else
      {
        *v6++ = (CI *)v8;
      }
      v19 = v6;
      v7 = 1;
    }
    v5 = *(_QWORD *)(v5 + 8);
  }
  while (v5 != v3);
  v14 = (CI **)v18;
  if (v18 != (char *)v6)
  {
    do
    {
      v15 = *v14;
      CI::RemoveCacheEntry(*v14, (CI::SurfaceCacheEntry *)a2);
      if (v15)
        a1 = (CI *)(*(uint64_t (**)(CI *))(*(_QWORD *)v15 + 8))(v15);
      ++v14;
    }
    while (v14 != v6);
    v6 = (CI **)v18;
  }
  if (v6)
    operator delete(v6);
  if ((v7 & 1) == 0)
  {
LABEL_37:
    CI_LOG_SURFACE_CACHE();
  }
  else
  {
    CI::UpdateVolatilityStats(a1);
    v16 = CI_LOG_SURFACE_CACHE();
    if (v16)
      CI::LogCacheState((CI *)(v16 > 1), (uint64_t)"RemoveCacheEntriesForContext", v17);
  }
}

@end
