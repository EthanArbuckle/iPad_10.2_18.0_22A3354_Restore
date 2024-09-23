@implementation OSLogIndex

uint64_t __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "_setLogEvent:rangeUUIDIndex:machTimebase:", a3, *a2, a2 + 1);
  if (*(_DWORD *)a3 == 3
    && objc_msgSend(*(id *)(a1 + 48), "type") == 1024
    && objc_msgSend(*(id *)(a1 + 48), "_oversizeIdentifier"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v8 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v10);

          if (objc_msgSend(v8, "matches:procinfo:", objc_msgSend(*(id *)(a1 + 48), "_oversizeIdentifier"), *(_QWORD *)(a3 + 1104)))
          {
            objc_msgSend(v8, "fillProxy:", *(_QWORD *)(a1 + 48));
            objc_msgSend(*(id *)(a1 + 32), "oversizeChunks");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObject:", v8);
            goto LABEL_18;
          }
          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
      v12 = v8;
    }
    else
    {
      v12 = 0;
    }
    v8 = 0;
LABEL_18:

  }
  else
  {
    v8 = 0;
  }
  v13 = (void *)MEMORY[0x1A1AEC1C8]();
  v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v13);
  objc_msgSend(*(id *)(a1 + 48), "_assertBalanced");

  return v14;
}

uint64_t __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  char v3;
  void *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1A1AEC1C8]();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  memset(v38, 0, sizeof(v38));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v7 = *a3;
  if (*a3 == 3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56) = *((_QWORD *)a3 + 132) + 16;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 72) = *((_QWORD *)a3 + 133);
    v11 = *((_QWORD *)a3 + 139);
    _chunk_support_context_update((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *((int **)a3 + 134));
    _chunk_support_convert_tracepoint(v11, (uint64_t)&v31, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
    v12 = 0;
    if ((_DWORD)v31 == 1024 && DWORD2(v41))
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
      if (v14)
      {
        v15 = v14;
        v12 = 0;
        v16 = *(_QWORD *)v28;
        while (2)
        {
          v17 = 0;
          v18 = v12;
          do
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v12 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v17);

            if (objc_msgSend(v12, "matches:procinfo:", DWORD2(v41), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 88)))
            {
              objc_msgSend(v12, "fillMessage:", (char *)&v34 + 8);
              objc_msgSend(*(id *)(a1 + 32), "oversizeChunks");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "removeObject:", v12);
              goto LABEL_25;
            }
            ++v17;
            v18 = v12;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
          if (v15)
            continue;
          break;
        }
        v19 = v12;
      }
      else
      {
        v19 = 0;
      }
      v12 = 0;
LABEL_25:

    }
    v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if ((_DWORD)v31 == 2560)
    {
      free(*(void **)&v38[2]);
      *(_QWORD *)&v38[2] = 0;
    }

  }
  else
  {
    if (v7 == 2)
    {
      v20 = *((_QWORD *)a3 + 1);
      v21 = *((_BYTE *)a3 + 1072);
      v22 = *((unsigned __int8 *)a3 + 1073);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v31 = 0uLL;
      v32 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
      v37 = 0uLL;
      memset(v38, 0, sizeof(v38));
      v39 = 0uLL;
      v40 = 0uLL;
      v41 = 0uLL;
      v42 = 0uLL;
      v43 = 0uLL;
      *(_OWORD *)((char *)&v38[1] + 12) = *((_OWORD *)a3 + 66);
      LODWORD(v31) = 1280;
      *(_QWORD *)&v39 = 1;
      BYTE8(v40) = v21;
      if (v22)
        *(_QWORD *)&v39 = 3;
      v24 = *(_QWORD *)(v23 + 120);
      if (!v24)
        goto LABEL_21;
      v25 = _timesync_continuous_to_wall_time(v24, (_OWORD *)((char *)&v38[1] + 12), v20, v38);
      v9 = v25 / 0x3B9ACA00;
      v10 = v25 % 0x3B9ACA00;
LABEL_20:
      *(_QWORD *)&v37 = v9;
      DWORD2(v37) = v10 / 0x3E8;
LABEL_21:
      v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_29;
    }
    if (v7 == 1)
    {
      v42 = 0uLL;
      v43 = 0uLL;
      v40 = 0uLL;
      v41 = 0uLL;
      v39 = 0uLL;
      v37 = 0uLL;
      memset(v38, 0, sizeof(v38));
      v35 = 0uLL;
      v36 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      v31 = 0uLL;
      v32 = 0uLL;
      *(_OWORD *)((char *)&v38[1] + 12) = *((_OWORD *)a3 + 66);
      LODWORD(v31) = 1280;
      v8 = *((_QWORD *)a3 + 136);
      *((_QWORD *)&v39 + 1) = *((_QWORD *)a3 + 135);
      *(_QWORD *)&v40 = v8;
      *(_QWORD *)&v35 = *((_QWORD *)&v39 + 1);
      *(_QWORD *)&v38[0] = *((_QWORD *)a3 + 137);
      v9 = v8 / 0x3B9ACA00;
      v10 = v8 % 0x3B9ACA00;
      goto LABEL_20;
    }
  }
LABEL_29:
  objc_autoreleasePoolPop(v6);
  return v3 & 1;
}

uint64_t __36___OSLogIndex__readArchiveMetadata___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end
