uint64_t _FillNextTokenInCache(_QWORD *a1, CFTypeRef cf, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t NextToken;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _DWORD *IfNeeded;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  _DWORD *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t log;
  NSObject *loga;
  __int128 __src;
  uint64_t v62;
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a1[2];
  v7 = a1[48];
  if (v7 <= 0)
  {
    v8 = (_QWORD *)*a1;
    if (!*(_QWORD *)(*a1 + 32))
      v8[4] = CFRetain(cf);
    v9 = v8[10];
    if (v9 >= v8[9] - 1)
    {
      NextToken = _fetchNextToken((uint64_t)v8);
      if (NextToken < 0)
        return -1;
    }
    else
    {
      NextToken = v9 + 1;
      if (v9 + 1 < 0)
        return -1;
    }
    v11 = _tokenEntryAtRealIndex((uint64_t)v8, (v8[12] + NextToken) % v8[9]);
    v8[10] = NextToken;
    if (!v11)
      return -1;
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)(v11 + 8);
    v14 = (uint64_t)(*(_QWORD *)v11 << 32) >> 48;
    v15 = (uint64_t)(int)v13 >> 16;
    if (*(int *)v11 >> 16 == (_DWORD)v15)
    {
      v16 = (uint64_t)(v13 - (v12 & 0xFFFFFFFF00000000)) >> 32;
LABEL_23:
      v27 = *((_QWORD *)cf + 2);
      v28 = *(_QWORD *)(v27 + 48 * (*(int *)v11 >> 16) + 32)
          + (v12 >> 32)
          - *(_QWORD *)(v27 + 48 * (*(int *)v11 >> 16) + 16);
      if (v28 < a3)
      {
        if (_FillNextTokenInCache_sOnce != -1)
          dispatch_once(&_FillNextTokenInCache_sOnce, &__block_literal_global_1057);
        return -1;
      }
      *(_QWORD *)&__src = *(_QWORD *)v11;
      *((_QWORD *)&__src + 1) = v13;
      if (*(_BYTE *)(v11 + 24))
      {
        v29 = 0;
        if (*(unsigned __int8 *)(v11 + 24) >= 0x13u)
          v30 = 19;
        else
          v30 = *(unsigned __int8 *)(v11 + 24);
        v31 = &v62;
        do
        {
          *(_OWORD *)v31 = *(_OWORD *)(*(_QWORD *)(v11 + 16) + v29);
          v31 += 2;
          v29 += 32;
        }
        while (32 * v30 != v29);
        v7 = v30 + 1;
      }
      else
      {
        v7 = 1;
      }
      goto LABEL_34;
    }
    v17 = v14 - v15;
    if (v14 > v15)
    {
      v16 = 0;
      goto LABEL_23;
    }
    v18 = 0;
    v16 = 0;
    v19 = *((_QWORD *)cf + 2);
    v20 = (_QWORD *)(v19 + 48 * (int)v15 + 16);
    v21 = v19 + 48 * (*(int *)v11 >> 16);
    v22 = (_QWORD *)(v21 + 16);
    v23 = (_QWORD *)(v21 + 24);
    v24 = (_DWORD *)(v21 + 40);
    while (v18)
    {
      if (v17 != v18)
      {
        v25 = *((_QWORD *)v24 - 2);
LABEL_19:
        v26 = v25 + v16;
        if (((*v24 >> 26) & 7u) - 1 >= 4)
          v16 = v26;
        else
          v16 = v26 + 1;
        goto LABEL_22;
      }
      v16 = v16 + (v13 >> 32) - *v20;
LABEL_22:
      --v18;
      v24 += 12;
      if (v17 - 1 == v18)
        goto LABEL_23;
    }
    v25 = *v22 - (v12 >> 32) + *v23;
    goto LABEL_19;
  }
  v57 = a1[8];
  v13 = a1[9];
  v27 = *((_QWORD *)cf + 2);
  v28 = *(_QWORD *)(v27 + 48 * ((int)v57 >> 16) + 32) + (v57 >> 32) - *(_QWORD *)(v27 + 48 * ((int)v57 >> 16) + 16);
  v16 = (uint64_t)(v13 - (v57 & 0xFFFFFFFF00000000)) >> 32;
  __memcpy_chk();
  a1[48] = 0;
LABEL_34:
  if (v16 > 200)
    return -1;
  v32 = v28 - v6;
  if (v28 - v6 + v16 > 200)
  {
    a1[48] = v7;
    memcpy(a1 + 8, &__src, 16 * v7);
    return -1;
  }
  if (v32 > a3)
  {
    while (1)
    {
      IfNeeded = (_DWORD *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, a3);
      if (!IfNeeded)
        return -1;
      *IfNeeded = v6 + a3++;
      if (a3 >= v32)
      {
        v27 = *((_QWORD *)cf + 2);
        break;
      }
    }
  }
  log = (uint64_t)(int)v13 >> 16;
  v34 = v27 + 48 * (int)log;
  v35 = *(_QWORD *)(v34 + 32);
  v36 = *(_QWORD *)(v34 + 16);
  v37 = DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, a3);
  if (!v37)
    return -1;
  v38 = v37;
  v39 = v13 >> 32;
  v40 = v35 + (v13 >> 32) - (v6 + v36);
  v41 = *(_QWORD *)v37;
  v42 = *(uint64_t *)v37 >> 48;
  if (v7 <= 1)
  {
    v43 = (uint64_t)(int)v13 >> 16;
    if ((int)v42 < 2)
    {
LABEL_45:
      v45 = v41 & 0xFFFFFFFFFFFFLL | 0x1000000000000;
      *(_QWORD *)v38 = v45;
LABEL_46:
      *(_OWORD *)(v38 + 8) = __src;
      v46 = v45 & 0xFFFF000000000000 | 0x100000000;
LABEL_59:
      v50 = v28;
      goto LABEL_60;
    }
    v44 = v13 >> 32;
    free(*(void **)(v37 + 8));
LABEL_44:
    v41 = *(_QWORD *)v38;
    v39 = v44;
    goto LABEL_45;
  }
  v44 = v13 >> 32;
  if (v42 >= v7)
    goto LABEL_56;
  if ((int)v42 <= 1)
  {
    v47 = 16 * v7;
    v48 = malloc_type_malloc(16 * v7, 0x1000040451B5BE8uLL);
    if (!v48)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      LODWORD(v43) = log;
      loga = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v64 = v47;
        _os_log_error_impl(&dword_19BC07000, loga, OS_LOG_TYPE_ERROR, "TokenCache could not alloc space to cache %ld ranges", buf, 0xCu);
      }
      goto LABEL_44;
    }
    goto LABEL_55;
  }
  v49 = 16 * v7;
  v48 = malloc_type_realloc(*(void **)(v37 + 8), 16 * v7, 0x1000040451B5BE8uLL);
  if (v48)
  {
LABEL_55:
    *(_QWORD *)(v38 + 8) = v48;
    *(_WORD *)(v38 + 6) = v7;
LABEL_56:
    memcpy(*(void **)(v38 + 8), &__src, 16 * v7);
    v45 = *(_QWORD *)v38;
    goto LABEL_57;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v56 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v64 = v49;
    _os_log_error_impl(&dword_19BC07000, v56, OS_LOG_TYPE_ERROR, "TokenCache could not realloc space to cache %ld ranges", buf, 0xCu);
  }
  v45 = *(_QWORD *)v38;
  v7 = *(uint64_t *)v38 >> 48;
  if (v7 == 1)
  {
    LODWORD(v43) = log;
    v39 = v44;
    goto LABEL_46;
  }
  if (v45 >= 0x2000000000000)
    goto LABEL_56;
LABEL_57:
  v46 = v45 & 0xFFFF000000000000 | ((unint64_t)(unsigned __int16)v7 << 32);
  if ((v7 & 0x8000000000000000) == 0)
  {
    LODWORD(v43) = log;
    v39 = v44;
    goto LABEL_59;
  }
  v50 = 0xFFFFFFFFLL;
  LODWORD(v43) = log;
  v39 = v44;
LABEL_60:
  *(_QWORD *)v38 = v50 | v46;
  v51 = *((_QWORD *)cf + 2) + 48 * (int)v43;
  v52 = v39 + *(_QWORD *)(v51 + 32) - (v6 + *(_QWORD *)(v51 + 16));
  v53 = a3 + 1;
  if (a3 + 1 < v52)
  {
    v54 = a3 + v6;
    while (1)
    {
      v55 = (_DWORD *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v53);
      if (!v55)
        break;
      *v55 = v54;
      if (++v53 >= v52)
        return v40;
    }
    return -1;
  }
  return v40;
}

uint64_t DDLexerDeterministicScan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t **v11;
  int v12;
  uint64_t v13;
  UText *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int Next;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  uint64_t *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 *v44;
  int v45;
  int v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v60;
  uint64_t *v61;
  uint64_t result;
  uint64_t v63;
  uint64_t *v64;
  int v65;
  uint64_t *v66;
  _QWORD *v67;
  unsigned __int16 *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = 16 * a4;
  v8 = MEMORY[0x1E0C80A78]();
  v10 = v9;
  v11 = &(&v72)[-2 * v9];
  v13 = (uint64_t)v12 >> 16;
  if (v13 == *(_QWORD *)(v8 + 40))
  {
    v14 = *(UText **)(a1 + 32);
  }
  else
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 48 * (int)v13;
    *(_QWORD *)(a1 + 40) = v13;
    *(_BYTE *)(a1 + 48) = (*(_DWORD *)(v15 + 40) & 0x40000000) != 0;
    v14 = (UText *)CFStringOpenUText();
    *(_QWORD *)(a1 + 32) = v14;
  }
  utext_setNativeIndex(v14, a2 >> 32);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(_QWORD *)(v16 + 8);
  v79 = *(_QWORD *)(v16 + 16);
  v81 = *(unsigned int *)(v17 + 4);
  v82 = a1;
  v85 = a1;
  v86 = a2;
  v87 = *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 48 * (int)v13 + 16);
  v18 = *(uint64_t (**)(_QWORD, uint64_t))(a1 + 8);
  if (!v18)
    return 0;
  v19 = v82;
  v20 = v18(*(_QWORD *)(v82 + 16), a2);
  v22 = v21;
  Next = getNext(&v85);
  if (!*(_QWORD *)(v19 + 56) || Next == -1 || v10 < 1)
    return 0;
  v73 = a3;
  v84 = v17 + 16;
  v24 = Next;
  bzero(v11, v7);
  v25 = v24;
  v26 = 0;
  v27 = 0;
  v80 = 0;
  v28 = (uint64_t *)v11;
  v29 = 0;
  v30 = 0;
  v31 = 4294901760;
  v32 = -1;
  v33 = v81;
  v72 = v28;
  v78 = v28;
  v34 = v10;
  do
  {
    v83 = v25;
    if (v25 == -1)
    {
      if (v27 == 1)
        break;
      v27 = 1;
      v26 = 1;
    }
    else if (v27)
    {
      v27 = 1;
    }
    else
    {
      if (HIWORD(v25))
      {
        if (HIWORD(v25) > 0x10u)
        {
          v36 = *(unsigned __int16 *)(*(_QWORD *)(v82 + 56) + 104);
        }
        else
        {
          v37 = v31;
          v38 = v25;
          v39 = v82;
          v40 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v82 + 56) + 88))(*(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v82 + 56) + 72) + 2 * (((v25 >> 10) & 0x1F) + 4 * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v82 + 56) + 72) + 2 * (((v25 >> 10) + 55232) >> 5)))));
          v41 = *(_QWORD *)(v39 + 56);
          if (v40 < 1)
            v36 = *(unsigned __int16 *)(v41 + 104);
          else
            v36 = *(unsigned __int16 *)(*(_QWORD *)(v41 + 72)
                                      + 2
                                      * ((v38 & 0x1F)
                                       + 4
                                       * *(unsigned __int16 *)(*(_QWORD *)(v41 + 72) + 2 * (v40 + ((v38 >> 5) & 0x1F)))));
          v31 = v37;
        }
      }
      else
      {
        if (v25 >> 10 == 54)
          v35 = 320;
        else
          v35 = 0;
        v36 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v82 + 56) + 72)
                                  + 2
                                  * ((v25 & 0x1F)
                                   + 4
                                   * *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(v82 + 56) + 72)
                                                         + 2 * (v35 + (v25 >> 5)))));
      }
      v27 = 0;
      v26 = v36 & 0xFFFFBFFF;
    }
    v42 = *(_WORD *)(v84 + v33 + 2 * (v26 >> 5) + 6);
    if (v42 < 0)
      v43 = v42 & 0x7FFF;
    else
      v43 = *(unsigned __int16 *)(v79 + 2 * (v26 & 0x1F | (32 * (v42 & 0x7FFFu))));
    v33 = (v43 * v81);
    v44 = (__int16 *)(v84 + v33);
    if (v32 < 0)
    {
      v32 = -1;
    }
    else if (v43 != v32)
    {
      v45 = *v44 == -1 ? v44[2] : -1;
      v32 = -1;
      if ((int)v31 >> 16 != -1)
      {
        v46 = v80;
        if (v80 != v45)
        {
          v47 = v78;
          *v78 = v31;
          *((_DWORD *)v47 + 2) = v46;
          v78 = v47 + 2;
          --v34;
          v30 = (v30 + 1);
        }
      }
    }
    if (*v44 != -1)
      goto LABEL_41;
    v80 = v44[2];
    v48 = (uint64_t)(int)v20 >> 16;
    v31 = v86;
    if ((_DWORD)v48 == -1)
    {
      v32 = v43;
LABEL_41:
      v25 = v83;
      goto LABEL_42;
    }
    v75 = v26;
    v76 = v30;
    v77 = v34;
    v53 = 0;
    v54 = HIDWORD(v86);
    v74 = v86 << 32;
    v55 = v86;
    v56 = (uint64_t)(int)v86 >> 16;
    while (HIDWORD(v20) != (_DWORD)v54 || v48 != v56)
    {
      if (v48 < v56 || SHIDWORD(v20) < (int)v54 && v48 <= v56)
      {
        v58 = (uint64_t)(int)v22 >> 16;
        if ((int)v56 >= (int)v58 && ((int)v56 > (int)v58 || (int)v54 >= SHIDWORD(v22)))
        {
          if ((_DWORD)v56 == (_DWORD)v58 && (_DWORD)v54 == HIDWORD(v22))
            v53 = 1;
          v20 = (*(uint64_t (**)(_QWORD, uint64_t))(v82 + 8))(*(_QWORD *)(v82 + 16), v55);
          v22 = v60;
          v48 = (uint64_t)(int)v20 >> 16;
          if ((_DWORD)v48 != -1)
            continue;
        }
      }
      if (!v53)
      {
        v32 = v43;
        v30 = v76;
        v34 = v77;
        v25 = v83;
        v31 = v55;
        goto LABEL_79;
      }
      break;
    }
    v30 = v76;
    v34 = v77;
    if (v77 < 1)
    {
      v34 = 0;
      v32 = -1;
    }
    else
    {
      v32 = -1;
      if (v80 != -1 && (v74 >> 48) != 0xFFFFFFFFLL)
      {
        v61 = v78;
        *v78 = v55;
        *((_DWORD *)v61 + 2) = v80;
        v78 = v61 + 2;
        v30 = (v30 + 1);
        --v34;
      }
    }
    v31 = 4294901760;
    v25 = v83;
LABEL_79:
    v26 = v75;
LABEL_42:
    if (v43)
      v49 = v27;
    else
      v49 = 1;
    if ((v49 & 1) != 0)
    {
      if (!v43)
        break;
    }
    else
    {
      v50 = v26;
      v51 = v31;
      v25 = getNext(&v85);
      v31 = v51;
      v26 = v50;
    }
    if (v34 < 1)
      break;
  }
  while (v29++ < 0x12C);
  v63 = v73;
  if (v32 < 0)
  {
    v64 = v72;
  }
  else
  {
    v64 = v72;
    if (v34 >= 1)
    {
      v65 = v80;
      if (v80 != -1 && (int)v31 >> 16 != 0xFFFFFFFFLL)
      {
        v66 = v78;
        *v78 = v31;
        *((_DWORD *)v66 + 2) = v65;
        LODWORD(v30) = v30 + 1;
      }
    }
  }
  result = (int)v30;
  if ((int)v30 >= 1)
  {
    v67 = (_QWORD *)(v63 + 8);
    v68 = (unsigned __int16 *)(v64 + 1);
    v69 = (int)v30;
    do
    {
      v70 = *((_QWORD *)v68 - 1);
      v71 = *v68;
      v68 += 8;
      *(v67 - 1) = v70 & 0xFFFFFFFFFFFF0000 | v71;
      *v67 = 0;
      v67[1] = 0;
      v67[2] = 0;
      v67 += 4;
      --v69;
    }
    while (v69);
  }
  return result;
}

uint64_t getNext(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  UText *v4;
  uint64_t chunkOffset;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;

  while (1)
  {
    v2 = a1[1];
    v3 = a1[3] + a1[2];
    if (v3 <= v2 >> 32)
      goto LABEL_6;
    v4 = *(UText **)(*a1 + 32);
    chunkOffset = v4->chunkOffset;
    if ((int)chunkOffset < v4->chunkLength)
    {
      v6 = v4->chunkContents[chunkOffset];
      if (v6 >> 11 <= 0x1A)
        break;
    }
    v7 = utext_next32(*(UText **)(*a1 + 32));
    if ((_DWORD)v7 != -1)
    {
      v6 = v7;
      goto LABEL_11;
    }
    v2 = a1[1];
LABEL_6:
    v8 = *a1;
    v9 = *(_QWORD *)(*a1 + 24);
    v10 = (uint64_t)(int)v2 >> 16;
    if (v10 >= *(_QWORD *)(v9 + 32) - 1)
      return 0xFFFFFFFFLL;
    v11 = *(_QWORD *)(v9 + 16);
    v12 = 48 * v10;
    v13 = (*(_DWORD *)(v11 + 48 * v10 + 40) >> 26) & 7;
    v14 = v10 + 1;
    v12 += 48;
    v15 = *(_OWORD *)(v11 + v12 + 16);
    *((_OWORD *)a1 + 1) = v15;
    a1[1] = ((_DWORD)v14 << 16) | (unint64_t)(unsigned __int16)v2 | ((_QWORD)v15 << 32);
    v16 = *(_QWORD *)(*(_QWORD *)(v8 + 24) + 16) + v12;
    *(_QWORD *)(v8 + 40) = v14;
    *(_BYTE *)(v8 + 48) = (*(_DWORD *)(v16 + 40) & 0x40000000) != 0;
    *(_QWORD *)(v8 + 32) = CFStringOpenUText();
    if (v13)
    {
      v6 = 32;
      switch(v13)
      {
        case 1:
          return v6;
        case 2:
          v6 = 9;
          break;
        case 3:
          v6 = 10;
          break;
        case 4:
          v6 = 31;
          break;
        default:
          return 0xFFFFFFFFLL;
      }
      return v6;
    }
  }
  v4->chunkOffset = chunkOffset + 1;
LABEL_11:
  if (v6 >> 2 == 0x3FFF
    || ((_DWORD)v6 != 10 ? (v17 = (_DWORD)v6 == 8232) : (v17 = 1),
        !v17 ? (v18 = (_DWORD)v6 == 13) : (v18 = 1),
        v18 && *(_BYTE *)(*a1 + 48)))
  {
    v6 = 32;
  }
  v19 = v4->chunkOffset;
  if ((int)v19 <= v4->nativeIndexingLimit)
    v20 = v4->chunkNativeStart + v19;
  else
    v20 = ((uint64_t (*)(UText *))v4->pFuncs->mapOffsetToNative)(v4);
  for (;
        v20 < v3;
        v20 = (int)v23 <= v4->nativeIndexingLimit
            ? v4->chunkNativeStart + v23
            : ((uint64_t (*)(UText *))v4->pFuncs->mapOffsetToNative)(v4))
  {
    v21 = v4->chunkOffset;
    if ((int)v21 < v4->chunkLength)
    {
      v22 = v4->chunkContents[v21];
      if (v22 >> 11 <= 0x1A)
        goto LABEL_43;
    }
    v22 = utext_current32(v4);
LABEL_43:
    if (v22 >> 1 != 4103 || !utext_moveIndex32(v4, 1))
      break;
    v23 = v4->chunkOffset;
  }
  *((_DWORD *)a1 + 3) = v20;
  return v6;
}

uint64_t nextToken(uint64_t a1, uint64_t a2)
{
  return DDTokenCacheGetTokenOrSubtokenAtPosition(*(_QWORD **)(a1 + 40), *(_QWORD **)(a1 + 56), a2);
}

uint64_t DDTokenCacheGetTokenOrSubtokenAtPosition(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *TokensAtPosition;
  uint64_t result;
  uint64_t v6;
  char *v7;
  int *i;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;

  v12 = 0;
  TokensAtPosition = DDTokenCacheGetTokensAtPosition(a1, a2, a3, &v12);
  if (!TokensAtPosition)
    return 4294901760;
  if (TokensAtPosition == (uint64_t *)1)
    return *(_QWORD *)v12;
  if ((uint64_t)TokensAtPosition < 1)
    return 4294901760;
  v6 = (uint64_t)(int)a3 >> 16;
  v7 = (char *)TokensAtPosition + 1;
  for (i = (int *)(v12 + 16 * (_QWORD)TokensAtPosition - 8); ; i -= 4)
  {
    result = *((_QWORD *)i - 1);
    v9 = (uint64_t)(int)result >> 16;
    if ((int)v9 < (int)v6 || ((int)v9 <= (int)v6 ? (v10 = SHIDWORD(result) <= SHIDWORD(a3)) : (v10 = 0), v10))
    {
      if (*i >> 16 >= (int)v6 && (*i >> 16 > (int)v6 || (int)HIDWORD(*(_QWORD *)i) > SHIDWORD(a3)))
        break;
    }
    if ((unint64_t)--v7 <= 1)
      return 4294901760;
  }
  return result;
}

double _DDScannerHandleState(uint64_t a1, uint64_t *a2, int a3, double result)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int v24;
  __int128 v25;
  unsigned int v26;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int16 *v41;
  int v42;
  uint64_t v43;
  unsigned __int16 *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  _OWORD *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int16 *v68;
  unsigned int v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int16 *v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  unsigned __int16 *v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  unsigned int v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  __int128 *v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  BOOL v100;
  __int128 *v101;
  __int128 v102;
  __int128 v103;
  unint64_t v104;
  CFStringRef CopySubStringFromPos;
  unsigned int v108;
  _QWORD *v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  _OWORD v116[200];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  if (*(uint64_t *)(a1 + 184) > 30000)
    return result;
  v108 = a3 + 1;
  while (2)
  {
    v6 = a2[2];
    v5 = a2[3];
    v109 = (_QWORD *)a2[1];
    v110 = *a2;
    v115 = 0;
    v7 = computeLexemsAtPosition();
    if (v7 >= 50 && (*(_BYTE *)(a1 + 232) & 2) == 0)
    {
      CopySubStringFromPos = DDScanQueryCopySubStringFromPos(*(_QWORD *)(a1 + 56), v6);
      CFRelease(CopySubStringFromPos);
      *(_BYTE *)(a1 + 232) |= 2u;
    }
    v8 = v5 << 16 >> 48;
    v9 = (int)v5;
    if ((unint64_t)((int)v5 - 7901) < 0xFFFFFFFFFFFFE0BFLL || (v10 = *(_QWORD *)(a1 + 208)) == 0)
    {
      v11 = v5;
      v15 = 0;
      goto LABEL_123;
    }
    v11 = v5;
    v12 = v10 + (int)v5;
    v13 = *(_QWORD *)(a1 + 16);
    if (v7 <= 0)
    {
      v17 = 0;
      v16 = 0;
      v15 = 0;
      v14 = 0;
      v20 = *(_QWORD *)(v13 + 8);
      v19 = v8 + 1;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = v115;
      v19 = v8 + 1;
      v20 = *(_QWORD *)(v13 + 8);
      v21 = *(_QWORD *)(v20 + 8);
      do
      {
        v22 = (uint64_t *)(v18 + 32 * (v7 - 1));
        v23 = *v22;
        LODWORD(result) = *((_DWORD *)v22 + 2);
        v24 = *((_DWORD *)v22 + 3);
        v25 = *((_OWORD *)v22 + 1);
        v100 = v14 <= (__int16)*v22;
        v14 = (__int16)*v22;
        if (v100)
          v17 = 0;
        v26 = *(_DWORD *)(v21 + 4 * v19);
        if ((v14 - 1) > 6)
        {
          if ((_DWORD)v14 == 40 && (v26 & 0x1000000) != 0)
            goto LABEL_61;
        }
        else if (((HIBYTE(v26) >> v14) & 1) != 0)
        {
          goto LABEL_61;
        }
        v28 = *(_DWORD *)(v21 + 4 * v8);
        v29 = v28 << 8 >> 8;
        v30 = (uint64_t)(v28 << 8) >> 8;
        v31 = ((int)(v26 << 8) >> 8) - 1;
        if (v17 <= 0)
          v32 = v31;
        else
          v32 = v17;
        if (v32 == v29)
        {
          v33 = *(_QWORD *)(v20 + 16);
          v34 = (unsigned __int16 *)(v33 + 4 * v30);
          v35 = *v34 >> 1;
          if (v35 == (_DWORD)v14
            || v35 < (int)v14 && *(unsigned __int8 *)(*(_QWORD *)(v20 + 24) + v30) + v35 >= (int)v14)
          {
            v36 = *(unsigned int *)v34;
            if ((v36 & 1) != 0)
              goto LABEL_48;
            goto LABEL_25;
          }
          goto LABEL_61;
        }
        if (v32 <= v30)
          goto LABEL_61;
        v33 = *(_QWORD *)(v20 + 16);
        v41 = (unsigned __int16 *)(v33 + 4 * v30);
        v42 = *v41 >> 1;
        if (v42 > (int)v14)
          goto LABEL_61;
        if (v42 == (_DWORD)v14 || (v43 = *(_QWORD *)(v20 + 24), *(unsigned __int8 *)(v43 + v30) + v42 >= (int)v14))
        {
          v36 = *(unsigned int *)v41;
          if ((v36 & 1) != 0)
            goto LABEL_48;
          goto LABEL_25;
        }
        v44 = (unsigned __int16 *)(v33 + 4 * v32);
        v45 = *v44 >> 1;
        if (v45 > (int)v14)
        {
          v46 = v32 - 1;
          if (v46 <= v30)
          {
LABEL_41:
            if ((int)v14 > 40)
              v17 = v46;
            goto LABEL_61;
          }
          v47 = v30 + 1;
          while (1)
          {
            v30 = (v47 + v46) / 2;
            v48 = *(unsigned __int16 *)(v33 + 4 * v30) >> 1;
            if (v48 <= (int)v14)
            {
              if (v48 == (_DWORD)v14)
              {
                v48 = v14;
LABEL_72:
                if ((int)v14 > 40)
                  v17 = v30 - (v48 == (_DWORD)v14);
                v36 = *(unsigned int *)(v33 + 4 * v30);
                if ((v36 & 1) != 0)
                {
LABEL_48:
                  v49 = v33 + 4 * v30;
                  goto LABEL_49;
                }
LABEL_25:
                v37 = v36 >> 16;
LABEL_26:
                v38 = *(_QWORD *)(v20 + 40);
                v39 = *(unsigned __int16 *)(v38 + 2 * v37);
                if (*(_WORD *)(v38 + 2 * v37))
                {
                  v40 = v38 + 2 * v37 + 2;
                  goto LABEL_50;
                }
                goto LABEL_61;
              }
              if (*(unsigned __int8 *)(v43 + v30) + v48 >= (int)v14)
                goto LABEL_72;
              v47 = v30 + 1;
            }
            else
            {
              v46 = v30 - 1;
            }
            if (v47 > v46)
              goto LABEL_41;
          }
        }
        if (v45 == (_DWORD)v14 || *(unsigned __int8 *)(v43 + v32) + v45 >= (int)v14)
        {
          if ((int)v14 > 40)
            v17 = v32 - (v45 == (_DWORD)v14);
          v58 = *(unsigned int *)v44;
          if ((v58 & 1) == 0)
          {
            v37 = v58 >> 16;
            goto LABEL_26;
          }
          v49 = v33 + 4 * v32;
LABEL_49:
          v40 = v49 + 2;
          v39 = 1;
LABEL_50:
          v50 = 0;
          v51 = v23 & 0xFFFFFFFFFFFF0000;
          v52 = ((_DWORD)v14 << 17) | HIWORD(v24) & 1;
          do
          {
            v53 = *(unsigned __int16 *)(v40 + 2 * v50);
            if ((v53 & 1) != 0)
            {
              if (v15 <= 99)
              {
                v57 = &v116[2 * v15];
                *(_QWORD *)v57 = v51;
                *((_DWORD *)v57 + 2) = LODWORD(result);
                *((_DWORD *)v57 + 3) = v52 | v53 & 0xFFFE | 0x10000;
                v57[1] = v25;
                ++v15;
              }
            }
            else if (v15 <= 99)
            {
              v54 = v53 >> 1;
              v55 = v16;
              while (v55 >= 1)
              {
                v56 = *(unsigned __int16 *)(v10 + v9 - 2 + 2 * v55--);
                if (v54 == v56)
                  goto LABEL_60;
              }
              HIDWORD(v116[2 * v15]) = HIDWORD(v116[2 * v15]) & 0xFFFE0001 | v53 & 0xFFFE;
              ++v15;
              *(_WORD *)(v12 + 2 * v16++) = v54;
            }
LABEL_60:
            ++v50;
          }
          while (v50 != v39);
        }
LABEL_61:
        v100 = v7-- <= 1;
      }
      while (!v100);
    }
    v59 = *(int *)(v20 + 4);
    if (v14 <= v59)
      v17 = 0;
    v60 = *(_QWORD *)(v20 + 8);
    v61 = *(_DWORD *)(v60 + 4 * v19);
    if ((v59 - 1) >= 7)
    {
      if ((_DWORD)v59 == 40 && (v61 & 0x1000000) != 0)
        goto LABEL_123;
    }
    else if (((HIBYTE(v61) >> v59) & 1) != 0)
    {
      goto LABEL_123;
    }
    v62 = *(_DWORD *)(v60 + 4 * v8);
    v63 = v62 << 8 >> 8;
    v64 = (uint64_t)(v62 << 8) >> 8;
    v65 = ((int)(v61 << 8) >> 8) - 1;
    if (v17 <= 0)
      v66 = v65;
    else
      v66 = v17;
    if (v66 == v63)
    {
      v67 = *(_QWORD *)(v20 + 16);
      v68 = (unsigned __int16 *)(v67 + 4 * v64);
      v69 = *v68;
      if ((_DWORD)v59 != v69 >> 1)
      {
        v86 = v69 >> 1;
        if ((int)v59 <= v86 || *(unsigned __int8 *)(*(_QWORD *)(v20 + 24) + v64) + v86 < (int)v59)
          goto LABEL_123;
      }
      v70 = *(unsigned int *)v68;
      if ((v70 & 1) == 0)
      {
LABEL_90:
        v71 = v70 >> 16;
        goto LABEL_91;
      }
      goto LABEL_113;
    }
    if (v66 <= v64)
      goto LABEL_123;
    v67 = *(_QWORD *)(v20 + 16);
    v75 = (unsigned __int16 *)(v67 + 4 * v64);
    v76 = *v75;
    if ((int)v59 < (int)(v76 >> 1))
      goto LABEL_123;
    v77 = v76 >> 1;
    if ((_DWORD)v59 == v76 >> 1
      || (v78 = *(_QWORD *)(v20 + 24), (int)(*(unsigned __int8 *)(v78 + v64) + v77) >= (int)v59))
    {
      v70 = *(unsigned int *)v75;
      if ((v70 & 1) == 0)
        goto LABEL_90;
LABEL_113:
      v87 = v67 + 4 * v64;
      goto LABEL_114;
    }
    v79 = (unsigned __int16 *)(v67 + 4 * v66);
    v80 = *v79;
    if ((int)v59 >= (int)(v80 >> 1))
    {
      if ((_DWORD)v59 != v80 >> 1 && (int)(*(unsigned __int8 *)(v78 + v66) + (v80 >> 1)) < (int)v59)
        goto LABEL_123;
      v104 = *(unsigned int *)v79;
      if ((v104 & 1) == 0)
        goto LABEL_143;
      v87 = v67 + 4 * v66;
LABEL_114:
      v74 = v87 + 2;
      v73 = 1;
      goto LABEL_115;
    }
    v81 = v66 - 1;
    if (v81 <= v64)
      goto LABEL_123;
    v82 = v64 + 1;
    while (1)
    {
      v83 = v82 + v81;
      if (v82 + v81 < 0 != __OFADD__(v82, v81))
        ++v83;
      v84 = v83 >> 1;
      v85 = *(unsigned __int16 *)(v67 + 4 * v84);
      if ((int)v59 >= (int)(v85 >> 1))
        break;
      v81 = v84 - 1;
LABEL_107:
      if (v82 > v81)
        goto LABEL_123;
    }
    if ((_DWORD)v59 != v85 >> 1 && (int)(*(unsigned __int8 *)(v78 + v84) + (v85 >> 1)) < (int)v59)
    {
      v82 = v84 + 1;
      goto LABEL_107;
    }
    v104 = *(unsigned int *)(v67 + 4 * v84);
    if ((v104 & 1) != 0)
    {
      v87 = v67 + 4 * v84;
      goto LABEL_114;
    }
LABEL_143:
    v71 = v104 >> 16;
LABEL_91:
    v72 = *(_QWORD *)(v20 + 40);
    v73 = *(unsigned __int16 *)(v72 + 2 * v71);
    if (*(_WORD *)(v72 + 2 * v71))
    {
      v74 = v72 + 2 * v71 + 2;
LABEL_115:
      v88 = 0;
      v89 = v10 + v9 - 2;
      do
      {
        if (v15 <= 99)
        {
          v90 = *(unsigned __int16 *)(v74 + 2 * v88);
          v91 = v90 >> 1;
          v92 = v16;
          while (v92 >= 1)
          {
            v93 = *(unsigned __int16 *)(v89 + 2 * v92--);
            if (v91 == v93)
              goto LABEL_122;
          }
          HIDWORD(v116[2 * v15]) = HIDWORD(v116[2 * v15]) & 0xFFFE0001 | v90 & 0xFFFE;
          ++v15;
          *(_WORD *)(v12 + 2 * v16++) = v91;
        }
LABEL_122:
        ++v88;
      }
      while (v88 != v73);
    }
LABEL_123:
    if (a3 > 69)
      goto LABEL_149;
    v94 = *(_QWORD *)(a1 + 176);
    if (v94 < 0)
      goto LABEL_125;
    if (v94 < v9)
    {
LABEL_149:
      if (v15 >= 1)
        v15 = 1;
      if ((*(_BYTE *)(a1 + 232) & 2) == 0)
        *(_BYTE *)(a1 + 232) |= 2u;
      v95 = v15 - 1;
      goto LABEL_134;
    }
    *(_QWORD *)(a1 + 176) = -1;
LABEL_125:
    v95 = v15 - 1;
    if (v15 <= 1)
    {
LABEL_134:
      if (v15 < 1)
        return result;
      v113 = 0u;
      v114 = 0u;
      v101 = &v116[2 * v95];
      v102 = v101[1];
      v111 = *v101;
      v112 = v102;
      if (!processToken(a1, v8, v6, v11 >> 48, v110, v109, v9, (uint64_t)&v111, (uint64_t *)&v113))
        return result;
      result = *(double *)&v113;
      v103 = v114;
      *(_OWORD *)a2 = v113;
      *((_OWORD *)a2 + 1) = v103;
      if (*(uint64_t *)(a1 + 184) >= 30001)
        return result;
      continue;
    }
    break;
  }
  v96 = v116;
  v97 = 1;
  while (1)
  {
    v98 = v96[1];
    v111 = *v96;
    v112 = v98;
    v113 = 0u;
    v114 = 0u;
    if (processToken(a1, v8, v6, v11 >> 48, v110, v109, v9, (uint64_t)&v111, (uint64_t *)&v113))
    {
      v111 = v113;
      v112 = v114;
      _DDScannerHandleState(a1, &v111, v108);
    }
    v99 = *(_QWORD *)(a1 + 176);
    v100 = v99 >= 1 && v99 < v9;
    if (v100)
      return result;
    v96 += 2;
    if (v15 == ++v97)
      goto LABEL_134;
  }
}

uint64_t processToken(uint64_t a1, uint64_t a2, int64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  __int16 *v19;
  unint64_t v20;
  int v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  char v76;
  int v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int16 *v81;
  uint64_t v82;
  unint64_t v83;
  int64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;

  v9 = a7;
  v10 = a6;
  v12 = a2;
  v14 = a9;
  v15 = *(_DWORD *)(a8 + 12);
  if ((v15 & 0x10000) == 0)
  {
    v16 = *(_QWORD *)(a1 + 16);
    v17 = *(_QWORD *)(v16 + 16);
    v18 = (unsigned __int16)v15 >> 1;
    v19 = (__int16 *)(v17 + 12 * ((unsigned __int16)v15 >> 1));
    v20 = *((unsigned __int8 *)v19 + 10);
    if (*((_BYTE *)v19 + 10))
    {
      v21 = *((unsigned __int8 *)v19 + 10);
      do
      {
        v22 = v10;
        v10 = (_QWORD *)*v10;
        --v21;
      }
      while (v21);
      v12 = v22[1];
    }
    if ((*(_BYTE *)(v17 + 12 * ((unsigned __int16)v15 >> 1) + 11) & 2) != 0)
      v23 = -1;
    else
      v23 = (unint64_t)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v16 + 8) + 64)
                                              + 4
                                              * (*(int *)(*(_QWORD *)(*(_QWORD *)(v16 + 8) + 56) + 4 * v12)
                                               + (unint64_t)(unsigned __int16)v19[3])) >> 17;
    v45 = *(_QWORD *)(a1 + 192);
    v46 = (v45 & 0x40000000) == 0;
    if (*((_BYTE *)v19 + 10))
    {
      v47 = *(unsigned int *)(a5 + 8);
      v48 = (unint64_t)(v47 << 40 >> 24) >> 16;
      v49 = ((_DWORD)v48 << 16) | (*(_QWORD *)a5 << 32);
      v50 = ((v48 + ((unint64_t)(int)v47 >> 24)) << 16) | *(_QWORD *)a5 & 0xFFFFFFFF00000000;
      v46 = (v45 & 0x40000000) == 0 && *(__int16 *)(a5 + 14) < 0;
      v51 = *(_QWORD *)(a5 + 16);
      v52 = v20 - 1;
      if ((_DWORD)v20 != 1)
      {
        do
        {
          v53 = *(unsigned int *)(v51 + 8);
          v54 = v53 << 40;
          v55 = v53 << 40 >> 40;
          v56 = v55 + ((uint64_t)(int)v53 >> 24);
          v57 = (uint64_t)(int)v49 >> 16;
          v58 = v54 << 8 >> 48;
          if (SHIDWORD(v49) >= (int)*(_QWORD *)v51)
            v59 = ((_DWORD)v55 << 16) | (*(_QWORD *)v51 << 32);
          else
            v59 = v49;
          if ((int)v57 <= (int)v58)
            v60 = v59;
          else
            v60 = ((_DWORD)v55 << 16) | (*(_QWORD *)v51 << 32);
          if ((int)v57 >= (__int16)v55)
            v49 = v60;
          v61 = (uint64_t)(int)v50 >> 16;
          if (SHIDWORD(v50) >= (int)HIDWORD(*(_QWORD *)v51))
            v62 = v50;
          else
            v62 = ((_DWORD)v56 << 16) | *(_QWORD *)v51 & 0xFFFFFFFF00000000;
          if ((int)v61 > (__int16)v56)
            v62 = v50;
          if ((int)v61 >= (__int16)v56)
            v50 = v62;
          else
            v50 = ((_DWORD)v56 << 16) | *(_QWORD *)v51 & 0xFFFFFFFF00000000;
          v46 = v46 && *(__int16 *)(v51 + 14) < 0;
          v51 = *(_QWORD *)(v51 + 16);
          --v52;
        }
        while (v52);
      }
    }
    else
    {
      v49 = a3 & 0xFFFFFFFFFFFF0000;
      v50 = a3 & 0xFFFFFFFFFFFF0000;
      v51 = a5;
    }
    if ((*(_BYTE *)(v17 + 12 * ((unsigned __int16)v15 >> 1) + 11) & 1) != 0)
    {
      v81 = (__int16 *)(v17 + 12 * ((unsigned __int16)v15 >> 1));
      v82 = v17;
      v83 = v23;
      v84 = a3;
      v85 = v12;
      v86 = a4;
      v87 = 0;
      if (!DDTokenCacheGetTokensAtPosition(*(_QWORD **)(a1 + 40), *(_QWORD **)(a1 + 56), v49, &v87))
        return 0;
      if (HIDWORD(*v87) != HIDWORD(v49))
        return 0;
      if ((int)*v87 >> 16 != (int)v49 >> 16)
        return 0;
      v75 = v87[1];
      if (HIDWORD(v75) != HIDWORD(v50) || (int)v75 >> 16 != (int)v50 >> 16)
        return 0;
      a4 = v86;
      v14 = a9;
      a3 = v84;
      v12 = v85;
      v17 = v82;
      v23 = v83;
      v19 = v81;
      v18 = (unsigned __int16)v15 >> 1;
      if (!v46)
        goto LABEL_57;
    }
    else if (!v46)
    {
      goto LABEL_57;
    }
    if (*v19 == -1 && *(__int16 *)(v17 + 12 * v18 + 2) == -1)
    {
      if (v9 >= 6001 && (_DWORD)v20)
      {
        if (v20 >= 2)
        {
          v77 = v20 - 1;
          do
          {
            a5 = *(_QWORD *)(a5 + 16);
            --v77;
          }
          while (v77);
        }
        if (a5)
        {
          v78 = *(unsigned int *)(a5 + 8) | ((unint64_t)*(unsigned __int8 *)(a5 + 12) << 32);
          *(_WORD *)(a5 + 14) = -1;
          *(_QWORD *)a5 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
          *(_DWORD *)(a5 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
          *(_WORD *)(a5 + 12) = ((v78 & 0xFFFFFFF1FFFFFFFFLL) >> 32);
          *(_QWORD *)(a5 + 16) = v51;
          if ((v78 & 0x100000000) != 0)
          {
            *(_DWORD *)(a5 + 24) = 0;
            *(_QWORD *)(a5 + 32) = 0;
            *(_QWORD *)(a5 + 40) = 0;
          }
        }
        v79 = a5 - *(_QWORD *)(a1 + 208);
        v80 = *(_QWORD *)(a1 + 176);
        if (v80 < 0 || v79 < v80)
          *(_QWORD *)(a1 + 176) = v79;
        if (!a5)
          return 0;
        v9 = v79 + 48;
        v63 = a5;
      }
      else
      {
        if ((unint64_t)(v9 + 24) > 0x1F40)
        {
          v63 = 0;
        }
        else
        {
          v63 = *(_QWORD *)(a1 + 208) + v9;
          v9 += 24;
        }
        v76 = *(_BYTE *)(v63 + 12);
        *(_WORD *)(v63 + 14) = -1;
        *(_QWORD *)v63 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
        *(_DWORD *)(v63 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
        *(_WORD *)(v63 + 12) = v76 & 0xF0;
        *(_QWORD *)(v63 + 16) = v51;
      }
      goto LABEL_65;
    }
LABEL_57:
    if (v9 + 8 * v20 + 24 > 0x1F40)
    {
      v63 = 0;
    }
    else
    {
      v63 = *(_QWORD *)(a1 + 208) + v9;
      v9 += 8 * v20 + 24;
    }
    v64 = *(_BYTE *)(v63 + 12);
    *(_WORD *)(v63 + 14) = (unsigned __int16)v15 >> 1;
    *(_QWORD *)v63 = v50 & 0xFFFFFFFF00000000 | HIDWORD(v49);
    *(_DWORD *)(v63 + 8) = ((int)v49 >> 16) & 0xFFFFFF | ((BYTE2(v50) - BYTE2(v49)) << 24);
    *(_WORD *)(v63 + 12) = v64 & 0xF0;
    *(_QWORD *)(v63 + 16) = v51;
    if (a5 && (_DWORD)v20)
    {
      v65 = 0;
      do
      {
        *(_QWORD *)(v63 + 8 * v65++ + 24) = a5;
        if (v20 < 2)
          break;
        a5 = *(_QWORD *)(a5 + 16);
        --v20;
      }
      while (a5);
      *(_BYTE *)(v63 + 13) = v65;
    }
LABEL_65:
    if ((v23 & 0x8000000000000000) != 0)
    {
      if ((a4 & 0x8000000000000000) == 0)
        DDInsertResultRec(a1, v63, v63, a4, 4294901760, 0xFFFF0000uLL);
    }
    else
    {
      v66 = *(_QWORD *)(a1 + 184);
      if (v66 <= 30000)
      {
        v67 = *(unsigned __int16 *)(v17 + 12 * v18 + 4);
        *(_QWORD *)(a1 + 184) = v66 + 1;
        if ((unint64_t)(v9 + 16) <= 0x1F40)
        {
          v68 = *(_QWORD *)(a1 + 208);
          if (v68)
          {
            v69 = v67 + a4;
            v70 = (_QWORD *)(v68 + v9);
            *v70 = v10;
            v70[1] = v12;
            v71 = *(_QWORD *)(a1 + 56);
            v72 = (uint64_t)(int)a3 >> 16;
            v73 = *(_QWORD *)(v71 + 16);
            if (*(_QWORD *)(v73 + 48 * (int)v72 + 24) + *(_QWORD *)(v73 + 48 * (int)v72 + 16) == a3 >> 32
              && (*(_BYTE *)(v73 + 48 * (int)v72 + 43) & 0x1C) == 0
              && v72 < *(_QWORD *)(v71 + 32) - 1)
            {
              a3 = (((_DWORD)v72 << 16) + 0x10000) & 0xFFFF0000 | (unint64_t)(unsigned __int16)a3 | (*(_QWORD *)(v73 + 48 * ((((_DWORD)v72 << 16) + 0x10000) >> 16) + 16) << 32);
            }
            *v14 = v63;
            v14[1] = (uint64_t)v70;
            v44 = ((unint64_t)(unsigned __int16)v23 << 32) | (v69 << 48) | (v9 + 16);
            v14[2] = a3;
LABEL_71:
            v14[3] = v44;
            return 1;
          }
        }
      }
    }
    return 0;
  }
  v25 = *(_QWORD *)(a8 + 16);
  v24 = *(_QWORD *)(a8 + 24);
  v26 = *(_QWORD *)a8;
  v27 = 24;
  if (v15 & 1 | (v25 != 0) | (v24 != 0))
    v27 = 48;
  v28 = v27 + a7;
  if ((unint64_t)(v27 + a7) > 0x1F40)
  {
    v29 = 0;
  }
  else
  {
    v29 = *(_QWORD *)(a1 + 208) + a7;
    v9 = v28;
  }
  v30 = 0x100000000;
  if (!(v15 & 1 | (v25 != 0) | (v24 != 0)))
    v30 = 0;
  v31 = v30 & 0xFFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(v29 + 12) >> 4 << 36);
  v32 = *(_QWORD *)a8 & 0xFFFFFFFF00000000 | HIDWORD(a3);
  *(_WORD *)(v29 + 14) = -(v15 >> 17);
  *(_QWORD *)v29 = v32;
  *(_BYTE *)(v29 + 12) = BYTE4(v31);
  v33 = v31 & 0xFFFFFFFFFF000000 | ((uint64_t)(int)a3 >> 16) & 0xFFFFFF | ((unint64_t)(BYTE2(v26) - BYTE2(a3)) << 24);
  *(_DWORD *)(v29 + 8) = v33;
  *(_BYTE *)(v29 + 13) = 0;
  *(_QWORD *)(v29 + 16) = a5;
  if (v15 & 1 | (v25 != 0) | (v24 != 0))
  {
    *(_DWORD *)(v29 + 24) = 0;
    *(_QWORD *)(v29 + 32) = 0;
    *(_QWORD *)(v29 + 40) = 0;
    if ((v15 & 1) != 0)
    {
      v34 = *(_DWORD *)(a8 + 8);
      *(_DWORD *)(v29 + 8) = v33;
      v33 |= 0x200000000uLL;
      *(_QWORD *)v29 = v32;
      *(_BYTE *)(v29 + 12) = BYTE4(v33);
      *(_DWORD *)(v29 + 24) = v34;
    }
    if (v25)
    {
      *(_DWORD *)(v29 + 8) = v33;
      v33 |= 0x800000000uLL;
      *(_QWORD *)v29 = v32;
      *(_BYTE *)(v29 + 12) = BYTE4(v33);
      *(_QWORD *)(v29 + 32) = v25;
    }
    if (v24)
    {
      *(_QWORD *)v29 = v32;
      *(_DWORD *)(v29 + 8) = v33;
      *(_BYTE *)(v29 + 12) = (v33 | 0x400000000) >> 32;
      *(_QWORD *)(v29 + 40) = v24;
    }
  }
  v35 = *(_QWORD *)(a1 + 184);
  if (v35 <= 30000)
  {
    v36 = *(_DWORD *)(a8 + 12);
    v37 = *(_QWORD *)a8;
    *(_QWORD *)(a1 + 184) = v35 + 1;
    if ((unint64_t)(v9 + 16) <= 0x1F40)
    {
      v38 = *(_QWORD *)(a1 + 208);
      if (v38)
      {
        v39 = (unsigned __int16)v36 >> 1;
        v40 = (_QWORD *)(v38 + v9);
        *v40 = a6;
        v40[1] = a2;
        v41 = *(_QWORD *)(a1 + 56);
        v42 = (uint64_t)(int)v37 >> 16;
        v43 = *(_QWORD *)(v41 + 16);
        if (*(_QWORD *)(v43 + 48 * (int)v42 + 24) + *(_QWORD *)(v43 + 48 * (int)v42 + 16) == v37 >> 32
          && (*(_BYTE *)(v43 + 48 * (int)v42 + 43) & 0x1C) == 0
          && v42 < *(_QWORD *)(v41 + 32) - 1)
        {
          v37 = (((_DWORD)v42 << 16) + 0x10000) & 0xFFFF0000 | (unint64_t)(unsigned __int16)v37 | (*(_QWORD *)(v43 + 48 * ((((_DWORD)v42 << 16) + 0x10000) >> 16) + 16) << 32);
        }
        *a9 = v29;
        a9[1] = (uint64_t)v40;
        v44 = (a4 << 48) | (v39 << 32) | (v9 + 16);
        a9[2] = v37;
        goto LABEL_71;
      }
    }
  }
  return 0;
}

uint64_t computeLexemsAtPosition()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t TokensAtPosition;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int16 *v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  int v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  BOOL v29;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned __int16 *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  int CharacterAtIndex;
  unsigned int v46;
  int v47;
  BOOL v48;
  uint64_t v50;
  unint64_t *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  _OWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  _OWORD *v73;
  int v74;
  float *v75;
  int v76;
  float *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  float v84;
  uint64_t v85;
  uint64_t *v86;
  CFTypeRef v87;
  unint64_t v88;
  uint64_t *v89;
  int64_t v90;
  uint64_t v91;
  _QWORD *v92;
  int64_t v93;
  _QWORD *v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  _OWORD *v99;
  char *v100;
  uint64_t v101;
  uint64_t Offset;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  BOOL v106;
  uint64_t v107;
  unint64_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  int v121;
  _QWORD *v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  BOOL v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  float v130;
  uint64_t v131;
  float v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t *v137;
  _QWORD *v138;
  float *v139;
  uint64_t v140;
  float v141;
  unsigned int v142;
  _BYTE *v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char v153;
  unsigned int v154;
  float v155;
  float v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  char *v183;
  uint64_t v184;
  char *v185;
  unint64_t v186;
  uint64_t v187;
  float v188;
  float v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  BOOL v195;
  uint64_t v196;
  _OWORD *v197;
  int *v198;
  float *v200;
  __int128 v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  __int128 *v206;
  __int128 v207;
  __int128 v208;
  _OWORD *v209;
  unint64_t v210;
  unint64_t v211;
  uint64_t v212;
  int *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  NSObject *v221;
  uint64_t v222;
  uint64_t v223;
  __int128 v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void **v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v242;
  unint64_t *v243;
  uint64_t v244;
  _QWORD *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t *v248;
  uint64_t v249;
  _QWORD *v250;
  unint64_t v251;
  char *v252;
  uint64_t *v253;
  uint64_t v254;
  _QWORD *v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  uint64_t v259;
  uint64_t v260;
  _QWORD *v261;
  uint64_t v262;
  unint64_t v263;
  uint64_t v264;
  uint64_t *v265;
  _QWORD v266[15];
  uint64_t v267;
  uint64_t *v268;
  uint64_t v269;
  uint64_t v270;
  _QWORD v271[4];
  _QWORD v272[4];
  _QWORD v273[4];
  _QWORD v274[4];
  uint64_t v275;
  uint64_t *v276;
  uint64_t v277;
  int v278;
  uint64_t v279;
  uint64_t *v280;
  uint64_t v281;
  int v282;
  uint64_t *v283;
  uint64_t v284;
  _QWORD v285[5];
  uint64_t v286;
  _OWORD v287[60];
  _QWORD v288[31];
  uint64_t v289;
  uint64_t v290;
  _OWORD v291[100];
  uint64_t v292;

  v0 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v292 = *MEMORY[0x1E0C80C00];
  v284 = 0;
  if (DDLexemCacheGetLexems(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 16), v3, v1, &v284))return v284;
  v6 = *(_QWORD **)(v5 + 56);
  v283 = 0;
  TokensAtPosition = (uint64_t)DDTokenCacheGetTokensAtPosition(*(_QWORD **)(v5 + 40), v6, v4, &v283);
  v8 = (uint64_t)(int)v4 >> 16;
  v9 = v4 >> 32;
  v10 = TokensAtPosition - 1;
  v250 = v2;
  if (TokensAtPosition < 1)
  {
    v12 = 4294901760;
    v259 = 4294901760;
  }
  else
  {
    v11 = v283;
    v12 = *v283;
    v13 = HIDWORD(*v283);
    v14 = (uint64_t)(int)*v283 >> 16;
    if ((_DWORD)v13 == HIDWORD(v4) && (_DWORD)v14 == (_DWORD)v8)
    {
      v15 = v283[1];
      v16 = v284;
      v259 = v15;
      v17 = 0;
      if (v284 <= 46)
      {
        v18 = **(unsigned __int16 ***)(v5 + 16);
        v19 = (unint64_t *)&v291[2 * v284];
        *v19 = v15 & 0xFFFFFFFFFFFF0000 | v18[20];
        v19[1] = 0;
        v19[2] = 0;
        v19[3] = 0;
        v19[4] = v12 & 0xFFFFFFFFFFFF0000 | v18[21];
        v19[5] = 0;
        v19[6] = 0;
        v19[7] = 0;
        v19[8] = v12 & 0xFFFFFFFFFFFF0000 | v18[23];
        v19[9] = 0;
        v19[10] = 0;
        v19[11] = 0;
        v284 = v16 + 3;
      }
    }
    else
    {
      v17 = 1;
      v259 = 4294901760;
      v12 = 4294901760;
    }
    if ((unint64_t)TokensAtPosition >= 2)
    {
      v22 = (_DWORD)v13 == HIDWORD(v4);
      v20 = v284;
      v21 = v4 & 0xFFFFFFFFFFFF0000;
      v22 = v22 && (_DWORD)v14 == (_DWORD)v8;
      v23 = !v22;
      v24 = v11 + 3;
      do
      {
        v25 = *(v24 - 1);
        v26 = *v24;
        if (HIDWORD(v25) == HIDWORD(v4) && (int)v25 >> 16 == (_DWORD)v8)
        {
          v32 = v259;
          if ((int)v12 >> 16 == 0xFFFFFFFFLL)
            v32 = *v24;
          v259 = v32;
          if ((int)v12 >> 16 == 0xFFFFFFFFLL)
            v12 = v25;
          if (v20 < 47)
            v33 = v23;
          else
            v33 = 0;
          if (v33 == 1)
          {
            v34 = **(unsigned __int16 ***)(v5 + 16);
            v35 = (unint64_t *)&v291[2 * v20];
            *v35 = v26 & 0xFFFFFFFFFFFF0000 | v34[20];
            v35[1] = 0;
            v35[2] = 0;
            v35[3] = 0;
            v36 = v25 & 0xFFFFFFFFFFFF0000;
            v35[4] = v36 | v34[21];
            v35[5] = 0;
            v35[6] = 0;
            v35[7] = 0;
            v20 += 3;
            v35[8] = v36 | v34[23];
            v35[9] = 0;
            v35[10] = 0;
            v35[11] = 0;
          }
        }
        v22 = HIDWORD(v26) == HIDWORD(v4);
        v28 = (uint64_t)(int)v26 >> 16;
        v29 = v22 && (_DWORD)v28 == (_DWORD)v8;
        if (v29 && v20 <= 47)
        {
          v30 = (unint64_t *)&v291[2 * v20];
          v31 = **(_QWORD **)(v5 + 16);
          *v30 = v21 | *(unsigned __int16 *)(v31 + 44);
          v30[1] = 0;
          v30[2] = 0;
          v30[3] = 0;
          v20 += 2;
          v30[4] = v21 | *(unsigned __int16 *)(v31 + 46);
          v30[5] = 0;
          v30[6] = 0;
          v30[7] = 0;
        }
        v24 += 2;
        --v10;
      }
      while (v10);
      v284 = v20;
    }
    if (v17)
    {
      v257 = v12;
      goto LABEL_47;
    }
  }
  v37 = *(_QWORD *)(v6[2] + 48 * (int)v8 + 16);
  v257 = v12;
  if (v9 > v37
    && (uint64_t)DDTokenCacheGetTokensAtPosition(*(_QWORD **)(v5 + 40), v6, (v4 & 0xFFFFFFFF00000000 | ((_DWORD)v8 << 16)) - 0x100000000, &v283) >= 1)
  {
    v38 = v283[1];
    v22 = HIDWORD(v38) == HIDWORD(v4);
    v39 = (uint64_t)(int)v38 >> 16;
    if (v22 && (_DWORD)v39 == (int)v4 >> 16)
    {
      v242 = v284;
      if (v284 <= 47)
      {
        v243 = (unint64_t *)&v291[2 * v284];
        v244 = **(_QWORD **)(v5 + 16);
        *v243 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v244 + 44);
        v243[1] = 0;
        v243[2] = 0;
        v243[3] = 0;
        v243[4] = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(v244 + 46);
        v243[5] = 0;
        v243[6] = 0;
        v243[7] = 0;
        v284 = v242 + 2;
      }
    }
  }
LABEL_47:
  v41 = v6[2];
  v42 = v41 + 48 * (int)v8;
  if (v9 < *(_QWORD *)(v42 + 24) + *(_QWORD *)(v42 + 16))
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)v42, v4 >> 32);
    if (CharacterAtIndex != 10 && CharacterAtIndex != 13 && CharacterAtIndex != 8232)
      goto LABEL_69;
LABEL_67:
    v50 = v284;
    if (v284 <= 49)
    {
      v51 = (unint64_t *)&v291[2 * v284];
      *v51 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(**(_QWORD **)(v5 + 16) + 50);
      v51[1] = 0;
      v51[2] = 0;
      v51[3] = 0;
      v284 = v50 + 1;
    }
    goto LABEL_69;
  }
  if (v8 == v6[4] - 1)
    goto LABEL_67;
  v46 = (*(_DWORD *)(v41 + 48 * (int)v8 + 40) >> 26) & 7;
  if (v46 > 2)
    goto LABEL_67;
  if (!v46)
  {
    v47 = CFStringGetCharacterAtIndex(*(CFStringRef *)(v41 + 48 * (int)v8 + 48), *(_QWORD *)(v41 + 48 * (int)v8 + 64));
    v48 = v47 == 10 || v47 == 8232;
    if (v48 || v47 == 13)
      goto LABEL_67;
  }
LABEL_69:
  if (v9 <= *(_QWORD *)(v42 + 16))
  {
    v54 = v257;
    v55 = v259;
    if ((int)v8 >= 1
      && (v56 = v6[2], v57 = v56 + 48 * (v8 - 1), v58 = (*(_DWORD *)(v57 + 40) >> 26) & 7, v58 <= 2))
    {
      if (v58)
      {
        v53 = 0;
        v52 = 0;
      }
      else
      {
        v52 = CFStringGetCharacterAtIndex(*(CFStringRef *)v57, *(_QWORD *)(v56 + 48 * (v8 - 1) + 16)+ *(_QWORD *)(v56 + 48 * (v8 - 1) + 24)- 1);
        v53 = 0;
      }
    }
    else
    {
      v52 = 0;
      v53 = 1;
    }
  }
  else
  {
    v52 = CFStringGetCharacterAtIndex(*(CFStringRef *)v42, (v4 - 0x100000000) >> 32);
    v53 = 0;
    v54 = v257;
    v55 = v259;
  }
  if (v52 == 10)
    v53 = 1;
  if (v52 == 13)
    v53 = 1;
  if (v52 == 8232)
    v53 = 1;
  v59 = v284;
  if (v53 == 1 && v284 <= 49)
  {
    v60 = (unint64_t *)&v291[2 * v284];
    v59 = v284 + 1;
    *v60 = v4 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)(**(_QWORD **)(v5 + 16) + 48);
    v60[1] = 0;
    v60[2] = 0;
    v60[3] = 0;
    v284 = v59;
  }
  if (v59 <= 49)
  {
    v59 += DDLexerDeterministicScan(*(_QWORD *)(v5 + 24), v4, (uint64_t)&v291[2 * v59], 50 - v59);
    v284 = v59;
  }
  v260 = v5;
  if ((int)v54 >> 16 == -1 || v59 >= 50)
    goto LABEL_317;
  v61 = 0;
  v248 = &v286;
  v265 = &v290;
  v255 = v6;
  v256 = v4;
  v249 = v4 >> 32;
  v254 = (uint64_t)(int)v4 >> 16;
  do
  {
    v62 = *(_QWORD *)(v5 + 8 * v61 + 72);
    if (!v62)
      goto LABEL_315;
    v263 = v61;
    v264 = v59;
    v63 = &v291[2 * v59];
    v262 = v62;
    v64 = DDLookupTableRefLookupCurrentWord(v5, v62, v54, v55, v4, (uint64_t)v63, 50 - v59, 0);
    if (v64 < 1)
    {
      v61 = v263;
      v65 = v264;
      goto LABEL_314;
    }
    v61 = v263;
    if ((v263 & 0x7FFFFFFE) != 2 && (v263 - 5) > 1)
    {
      v65 = v264;
      goto LABEL_314;
    }
    v66 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
    v68 = (char *)&v247 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x1E0C80A78](v66);
    v70 = (char *)&v247 - v69;
    v71 = 0;
    v72 = *(_QWORD *)(v5 + 192);
    v65 = v264;
    v73 = &v291[2 * v264];
    v76 = *((_DWORD *)v73 + 3);
    v75 = (float *)v73 + 3;
    v74 = v76;
    v77 = v75 - 1;
    v78 = v262;
    do
    {
      if ((v74 & 0x10000) == 0)
      {
        v85 = 0;
        v6 = v255;
        v4 = v256;
        LODWORD(v8) = v254;
        goto LABEL_313;
      }
      v79 = *(__int16 *)v63;
      v80 = *(_QWORD **)(v78 + 24);
      if (v80)
        v81 = (unint64_t)(v79 - 8) > 0x1F;
      else
        v81 = 1;
      if (v81)
        goto LABEL_109;
      v82 = v80[6];
      if (!v82 || (int)v80[12] < 1)
        goto LABEL_109;
      v83 = v80[12];
      while (!*(_BYTE *)(v82 + 6) || v79 != *(__int16 *)(v82 + 4))
      {
        v82 += 8;
        if (!--v83)
          goto LABEL_109;
      }
      if (*(_BYTE *)(v82 + 7))
        v84 = *(float *)v82;
      else
LABEL_109:
        v84 = 0.0;
      if (v64 == 1 && !v71 && (v72 & 0x2000000) == 0 && *v77 > v84)
      {
        *v77 = *v77 - v84;
        v85 = 1;
        v6 = v255;
        v4 = v256;
        LODWORD(v8) = v254;
LABEL_272:
        v210 = v85;
        do
        {
          v211 = v210 - 1;
          if (v80)
          {
            v212 = SLOWORD(v291[2 * v65 + 2 * v211]);
            if ((unint64_t)(v212 - 8) <= 0x1F)
            {
              v213 = (int *)v80[7];
              if (v213)
              {
                if ((int)v80[13] >= 1)
                {
                  v214 = v80[13];
                  while (!*((_BYTE *)v213 + 6) || v212 != *((__int16 *)v213 + 2))
                  {
                    v213 += 2;
                    if (!--v214)
                      goto LABEL_281;
                  }
                  v215 = *v213;
                  if ((_DWORD)v215 && *((_BYTE *)v213 + 7) && v80[14] > v215)
                    *(_QWORD *)&v291[2 * v65 + 1 + 2 * v211] = v80[8] + v215;
                }
              }
            }
          }
LABEL_281:
          v81 = v210-- > 1;
        }
        while (v81);
        v216 = *(uint64_t **)(v5 + 152);
        if (!v216)
        {
          v216 = (uint64_t *)malloc_type_calloc(1uLL, 0x3D0uLL, 0x10300403B58F53CuLL);
          if (v216)
          {
            *v216 = -1;
            v216[1] = -1;
          }
          *(_QWORD *)(v5 + 152) = v216;
          v61 = v263;
          v65 = v264;
        }
        v217 = v6[2] + 48 * (int)v8;
        v218 = *(_QWORD *)(v217 + 32) + v9 - *(_QWORD *)(v217 + 16);
        if (v218 < 0)
          goto LABEL_313;
        v220 = *v216;
        v219 = v216[1];
        if (*v216 < 0)
        {
          if (v220 != -1)
            goto LABEL_301;
          v223 = (uint64_t)(v216 + 2);
          *v216 = 0;
          v216[1] = 0;
        }
        else
        {
          if (v216[8 * v220 + 2] >= v218)
          {
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v221 = DDLogHandle_error_log_handle;
            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v285[0]) = 0;
              _os_log_error_impl(&dword_19BC07000, v221, OS_LOG_TYPE_ERROR, "DDSourceMatchCacheAddEntry location should be constant or monotonically increasing", (uint8_t *)v285, 2u);
            }
            v61 = v263;
            v65 = v264;
            goto LABEL_313;
          }
LABEL_301:
          v222 = (v220 + 1) % 15;
          if (v219 == v222)
            v219 = (v219 + 1) % 15;
          *v216 = v222;
          v216[1] = v219;
          v223 = (uint64_t)&v216[8 * v222 + 2];
        }
        *(_QWORD *)v223 = v218;
        if (v85 == 1)
        {
          v224 = v63[1];
          *(_OWORD *)(v223 + 32) = *v63;
          *(_OWORD *)(v223 + 48) = v224;
        }
        else
        {
          v225 = *(void **)(v223 + 24);
          if (*(_QWORD *)(v223 + 16) < v85)
          {
            if (v225)
              free(v225);
            v225 = malloc_type_malloc(32 * v85, 0xB6097451uLL);
            *(_QWORD *)(v223 + 16) = v85;
            *(_QWORD *)(v223 + 24) = v225;
          }
          memcpy(v225, v63, 32 * v85);
          v61 = v263;
          v65 = v264;
        }
        *(_QWORD *)(v223 + 8) = v85;
        v5 = v260;
        goto LABEL_313;
      }
      *(float *)&v70[4 * v71] = v84;
      *(_DWORD *)&v68[4 * v71++] = 0;
    }
    while (v71 != v64);
    v251 = v72;
    v252 = v70;
    v253 = &v247;
    v279 = 0;
    v280 = &v279;
    v281 = 0x2000000000;
    v282 = 0;
    v275 = 0;
    v276 = &v275;
    v277 = 0x2000000000;
    v278 = 0;
    v274[0] = 0;
    v274[1] = v274;
    v274[2] = 0x2000000000;
    v274[3] = &v289;
    v273[0] = 0;
    v273[1] = v273;
    v273[2] = 0x2000000000;
    v273[3] = v288;
    v272[0] = 0;
    v272[1] = v272;
    v272[2] = 0x2000000000;
    v272[3] = v287;
    v271[0] = 0;
    v271[1] = v271;
    v271[2] = 0x2000000000;
    v271[3] = v285;
    v267 = 0;
    v268 = &v267;
    v269 = 0x2000000000;
    v270 = 0;
    v86 = *(uint64_t **)(v5 + 40);
    v266[0] = MEMORY[0x1E0C809B0];
    v266[1] = 0x40000000;
    v266[2] = __computeLexemsAtPosition_block_invoke;
    v266[3] = &unk_1E3C94F10;
    v266[4] = &v275;
    v266[5] = v274;
    v266[6] = v273;
    v266[7] = &v279;
    v266[8] = &v267;
    v87 = v255;
    v266[12] = v255;
    v266[13] = v5;
    v266[14] = v78;
    v266[9] = v272;
    v266[10] = v271;
    v88 = v256;
    v266[11] = v256;
    DDCachingStringTokenizerEnumerateTokens(*v86, v255, 1, v256, (uint64_t)v266);
    DDCachingStringTokenizerEnumerateTokens(*v86, v87, 0, v88, (uint64_t)v266);
    v89 = v268;
    if (v268[3] < 1)
      goto LABEL_235;
    v90 = 0;
    v91 = 0;
    while (2)
    {
      v92 = &v285[5 * v90];
      if ((BYTE14(v287[2 * v92[3]]) & 1) != 0)
      {
        v261 = &v285[5 * v90];
        v97 = v261[1];
        if (SHIDWORD(v97) >= 1)
        {
          v98 = **(_QWORD **)(v260 + 40);
          v258 = (v97 & 0xFFFFFFFF00000000) - 0x100000000;
          v99 = v63;
          v100 = v68;
          v101 = v91;
          Offset = matchingTokenRealIndexForQueryOffset(v98, v258 & 0xFFFFFFFF00000000 | v97, 0);
          v103 = _tokenEntryAtRealIndex(v98, Offset);
          v91 = v101;
          v68 = v100;
          v63 = v99;
          if (v103)
          {
            v104 = (uint64_t)(int)v97 >> 16;
            if ((int)v104 >= *(int *)v103 >> 16)
            {
              v105 = *(_QWORD *)(v103 + 8);
              v106 = (_DWORD)v104 == *(int *)v103 >> 16 && SHIDWORD(v258) < (int)HIDWORD(*(_QWORD *)v103);
              v107 = (uint64_t)(int)v105 >> 16;
              if (!v106 && (int)v104 <= (int)v107)
              {
                if ((_DWORD)v104 != (_DWORD)v107
                  || ((v109 = HIDWORD(v105), SHIDWORD(v258) < (int)v109)
                    ? (v110 = (_DWORD)v109 == HIDWORD(v97))
                    : (v110 = 1),
                      !v110))
                {
                  v111 = *(unsigned __int8 *)(v103 + 24);
                  if (!*(_BYTE *)(v103 + 24))
                  {
LABEL_150:
                    v89 = v268;
                    v92 = v261;
                    goto LABEL_122;
                  }
                  v112 = (uint64_t *)(*(_QWORD *)(v103 + 16) + 8);
                  while (1)
                  {
                    v113 = *v112;
                    v112 += 4;
                    v114 = (uint64_t)(int)v113 >> 16;
                    if (HIDWORD(v113) == HIDWORD(v97) && (_DWORD)v114 == (_DWORD)v104)
                      break;
                    if (!--v111)
                      goto LABEL_150;
                  }
                }
              }
            }
          }
        }
        v91 = (v91 + 1);
        v89 = v268;
        v93 = v268[3];
      }
      else
      {
LABEL_122:
        v93 = v89[3] - 1;
        if (v93 > v90)
        {
          v94 = &v285[5 * v93];
          v95 = *(_OWORD *)v94;
          v96 = *((_OWORD *)v94 + 1);
          v92[4] = v94[4];
          *(_OWORD *)v92 = v95;
          *((_OWORD *)v92 + 1) = v96;
          v93 = v89[3] - 1;
        }
        v89[3] = v93;
      }
      v90 = (int)v91;
      if (v93 > (int)v91)
        continue;
      break;
    }
    if (v93 > 1)
    {
      qsort(v285, v93, 0x28uLL, (int (__cdecl *)(const void *, const void *))keywordSort);
      v116 = v268;
      v117 = v268[3];
      LODWORD(v118) = 0;
      if (v117 >= 2)
      {
        v119 = v248;
        v120 = 1;
        while (1)
        {
          v121 = v118;
          v122 = &v285[5 * (int)v118];
          if (v122[2] == v119[2])
            break;
          v118 = (int)v118 + 1;
          if (v120 != v121 + 1)
          {
            v122 = &v285[5 * v118];
LABEL_174:
            v133 = *(_OWORD *)v119;
            v134 = *((_OWORD *)v119 + 1);
            v122[4] = v119[4];
            *(_OWORD *)v122 = v133;
            *((_OWORD *)v122 + 1) = v134;
            v117 = v116[3];
          }
LABEL_175:
          ++v120;
          v119 += 5;
          if (v117 <= v120)
            goto LABEL_179;
        }
        v123 = v285[5 * (int)v118 + 1];
        v124 = (uint64_t)(int)v123 >> 16;
        if ((int)v124 < *(int *)v119 >> 16
          || ((v125 = HIDWORD(v123), (int)v124 <= *(int *)v119 >> 16)
            ? (v126 = (int)v125 < (int)HIDWORD(*v119))
            : (v126 = 0),
              v126))
        {
          v118 = (int)v118 + 1;
          if (v120 == v121 + 1)
            goto LABEL_175;
          v122 = &v285[5 * v118];
        }
        else
        {
          v127 = v119[1];
          v128 = (uint64_t)(int)v127 >> 16;
          if ((int)v124 >= (int)v128)
          {
            if ((int)v124 > (int)v128)
              goto LABEL_175;
            if ((int)v125 >= SHIDWORD(v127))
            {
              if ((int)v125 > SHIDWORD(v127))
                goto LABEL_175;
              v129 = v119[3];
              v130 = *((float *)&v287[2 * v129] + 2);
              v131 = v285[5 * (int)v118 + 3];
              v132 = *((float *)&v287[2 * v131] + 2);
              if (v130 > v132
                || v130 >= v132 && ((HIBYTE(v287[2 * v129]) & 0x10) != 0 || (HIBYTE(v287[2 * v131]) & 0x10) == 0))
              {
                goto LABEL_175;
              }
            }
          }
        }
        goto LABEL_174;
      }
LABEL_179:
      v93 = (int)v118 + 1;
      v116[3] = v93;
    }
    if (v93 >= 1)
    {
      v135 = 0;
      v136 = v276;
      v137 = v280;
      do
      {
        v138 = &v285[5 * v135];
        v139 = (float *)&v287[2 * v138[3]];
        v140 = *(_QWORD *)v139;
        v141 = v139[2];
        v142 = *((_DWORD *)v139 + 3);
        v145 = *v138;
        v144 = v138[1];
        v143 = v138 + 4;
        v146 = HIDWORD(v144);
        v147 = (uint64_t)(int)v144 >> 16;
        v148 = HIDWORD(v145);
        v149 = (uint64_t)(int)v145 >> 16;
        v150 = v64;
        do
        {
          v151 = v150--;
          v152 = *(_QWORD *)&v63[2 * v150];
          if ((unsigned __int16)v152 != (unsigned __int16)v140)
            continue;
          if (*v143)
            v153 = 24;
          else
            v153 = 26;
          v154 = v142 >> v153;
          v155 = 0.0;
          v156 = 0.0;
          if ((v154 & 2) == 0)
            goto LABEL_226;
          if (*v143)
          {
            v157 = *((int *)v137 + 6);
            if ((int)v157 >= 1)
            {
              v158 = 15 - v157;
              v159 = 14;
              while (1)
              {
                v160 = v288[v159];
                v161 = (uint64_t)(int)v160 >> 16;
                if ((int)v147 >= (int)v161)
                {
                  v162 = HIDWORD(v160);
                  if ((int)v147 > (int)v161 || (int)v146 > (int)v162)
                    break;
                }
                v81 = v159-- <= v158;
                if (v81)
                  goto LABEL_210;
              }
              v158 = v159 + 1;
LABEL_210:
              v169 = 15;
              goto LABEL_221;
            }
          }
          else
          {
            v164 = *((unsigned int *)v136 + 6);
            if ((int)v164 >= 1)
            {
              v165 = 0;
              v166 = HIDWORD(v152);
              v167 = (uint64_t)(int)v152 >> 16;
              v168 = v164 + 15;
              v169 = 15;
              while (1)
              {
                v170 = v265[v165];
                v171 = (uint64_t)(int)v170 >> 16;
                if ((int)v167 < (int)v171)
                  break;
                v172 = HIDWORD(v170);
                if ((int)v167 <= (int)v171 && (int)v166 <= (int)v172)
                {
                  v169 = v165 + 15;
                  break;
                }
                ++v165;
                ++v169;
                if (v164 == v165)
                {
                  v169 = v164 + 15;
                  break;
                }
              }
              v174 = 0;
              v158 = 15;
              while (1)
              {
                v175 = v265[v174];
                v176 = (uint64_t)(int)v175 >> 16;
                if ((int)v149 < (int)v176)
                  break;
                v177 = HIDWORD(v175);
                if ((int)v149 <= (int)v176 && (int)v148 < (int)v177)
                  goto LABEL_221;
                ++v174;
                ++v158;
                if (*((_DWORD *)v136 + 6) == v174)
                {
                  v158 = v168;
                  goto LABEL_221;
                }
              }
              v158 = v174 + 15;
              goto LABEL_221;
            }
          }
          v169 = 15;
          v158 = 15;
LABEL_221:
          v179 = v169 - v158;
          v180 = v158 - v169;
          if (*v143)
            v181 = v179;
          else
            v181 = v180;
          if ((unint64_t)(v181 - 1) > 9)
            continue;
          v156 = (float)v181;
LABEL_226:
          v182 = v154 & 3;
          if (v182 != 1)
          {
            if (v182 == 2)
            {
              v155 = (11.0 - v156) * v141 / 10.0;
            }
            else if (v182 == 3)
            {
              v155 = v141 / v156;
            }
            else
            {
              v155 = v141;
            }
          }
          *(float *)&v68[4 * v150] = v155 + *(float *)&v68[4 * v150];
        }
        while (v151 > 1);
        ++v135;
      }
      while (v135 != v93);
    }
LABEL_235:
    MEMORY[0x1E0C80A78](&v247);
    v183 = (char *)&v247 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
    v184 = 0;
    v186 = v251;
    v185 = v252;
    do
    {
      v187 = (v186 >> 25) & 1;
      v188 = *(v75 - 1);
      v189 = (float)(*(float *)&v68[4 * v184] + v188) - *(float *)&v185[4 * v184];
      v190 = llroundf(v188 * 100.0);
      v191 = v190 & ~(v190 >> 63);
      if (v191 >= 100)
        LODWORD(v191) = 100;
      *(_DWORD *)v75 = *(_DWORD *)v75 & 0xFF01FFFF | ((_DWORD)v191 << 17);
      *(v75 - 1) = v189;
      if (v189 >= 0.0)
        LOBYTE(v187) = 1;
      v183[v184++] = v187;
      v75 += 8;
    }
    while (v64 != v184);
    v85 = v64;
    v6 = v255;
    v4 = v256;
    v5 = v260;
    v9 = v249;
    LODWORD(v8) = v254;
    v192 = v264;
    do
    {
      v193 = v85;
      v194 = v64--;
      if (v183[v64])
        v195 = v194 < 2;
      else
        v195 = 1;
      if (v195)
        goto LABEL_253;
      v196 = 0;
      v197 = &v291[2 * v192 + 2 * v64];
      v198 = (int *)v63;
      while (1)
      {
        if (v183[v196])
        {
          if (HIDWORD(*(_QWORD *)v197) == HIDWORD(*(_QWORD *)v198) && *(int *)v197 >> 16 == *v198 >> 16)
            break;
        }
        ++v196;
        v198 += 8;
        if (v64 == v196)
          goto LABEL_253;
      }
      v200 = (float *)&v291[2 * v192 + 2 * v196];
      if (*((float *)&v291[2 * v192 + 2 * v64] + 2) > v200[2])
      {
        v201 = v197[1];
        *(_OWORD *)v200 = *v197;
        *((_OWORD *)v200 + 1) = v201;
      }
      v85 = v64;
      if (v194 != v193)
      {
        v183[v64] = 0;
LABEL_253:
        v85 = v193;
      }
    }
    while (v194 > 1);
    if (v85 >= 1)
    {
      v202 = 0;
      while (v183[v202])
      {
LABEL_267:
        if (++v202 >= v85)
          goto LABEL_270;
      }
      v203 = v85;
      while (1)
      {
        v204 = v203 - 1;
        if (v203 - 1 <= v202)
          break;
        if (v183[--v203])
        {
          v206 = &v291[2 * v192 + 2 * v204];
          v207 = *v206;
          v208 = v206[1];
          v209 = &v291[2 * v192 + 2 * v202];
          *v209 = v207;
          v209[1] = v208;
          --v85;
          goto LABEL_267;
        }
      }
      v85 = v202;
    }
LABEL_270:
    _Block_object_dispose(&v267, 8);
    _Block_object_dispose(v271, 8);
    _Block_object_dispose(v272, 8);
    _Block_object_dispose(v273, 8);
    _Block_object_dispose(v274, 8);
    _Block_object_dispose(&v275, 8);
    _Block_object_dispose(&v279, 8);
    if (v85 >= 1)
    {
      v61 = v263;
      v80 = *(_QWORD **)(v262 + 24);
      v65 = v264;
      goto LABEL_272;
    }
    v61 = v263;
    v65 = v264;
LABEL_313:
    v64 = v85;
    v54 = v257;
    v55 = v259;
LABEL_314:
    v59 = v65 + v64;
    v284 = v59;
LABEL_315:
    if (v61 > 5)
      break;
    ++v61;
  }
  while (v59 < 50);
LABEL_317:
  v226 = *(_QWORD *)(v5 + 48);
  v227 = v6[2] + 48 * (int)v8;
  v228 = *(_QWORD *)(v227 + 32) + v9 - (*(_QWORD *)(v227 + 16) + *(_QWORD *)v226);
  if (v228 >= 201)
  {
    v245 = *(_QWORD **)(v226 + 64);
    if (v245)
    {
      v246 = v59;
      DDLexemCacheItemResetForCapacity(v245, v59);
      DDLexemCacheItemSet(*(void ***)(v226 + 64), v246, v291);
    }
    else
    {
      *(_QWORD *)(v226 + 64) = DDLexemCacheItemCreate(v59, v291);
    }
    v240 = v260;
    *(_QWORD *)(v226 + 72) = v4;
  }
  else
  {
    v229 = *(_QWORD *)(v226 + 24);
    if (v229 <= v228)
    {
      v230 = v59;
      v229 = v228 + 8;
      if (*(_QWORD *)(v226 + 32))
      {
        v231 = (char *)malloc_type_malloc(8 * v229, 0x2004093837F09uLL);
        v232 = *(_QWORD *)(v226 + 32);
        v233 = *(_QWORD *)(v226 + 24) - v232;
        memcpy(v231, (const void *)(*(_QWORD *)(v226 + 8) + 8 * v232), 8 * v233);
        memcpy(&v231[8 * v233], *(const void **)(v226 + 8), 8 * *(_QWORD *)(v226 + 32));
        free(*(void **)(v226 + 8));
        *(_QWORD *)(v226 + 8) = v231;
        *(_QWORD *)(v226 + 32) = 0;
      }
      else
      {
        v231 = (char *)malloc_type_realloc(*(void **)(v226 + 8), 8 * v229, 0x2004093837F09uLL);
        *(_QWORD *)(v226 + 8) = v231;
      }
      bzero(&v231[8 * *(_QWORD *)(v226 + 24)], 8 * (v229 - *(_QWORD *)(v226 + 24)));
      *(_QWORD *)(v226 + 24) = v229;
      v59 = v230;
    }
    if (*(_QWORD *)(v226 + 16) <= v228)
      *(_QWORD *)(v226 + 16) = v228 + 1;
    v234 = *(_QWORD *)(v226 + 32);
    v235 = *(_QWORD *)(v226 + 48);
    if (v235 < 0)
    {
      v238 = v59;
      v237 = (void **)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
      DDLexemCacheItemReset((uint64_t)v237);
      v59 = v238;
    }
    else
    {
      v236 = *(_QWORD *)(v226 + 40);
      v237 = *(void ***)(v236 + 8 * v235);
      *(_QWORD *)(v236 + 8 * v235) = 0;
      *(_QWORD *)(v226 + 48) = v235 - 1;
    }
    if (v234 + v228 >= v229)
      v239 = v229;
    else
      v239 = 0;
    *(_QWORD *)(*(_QWORD *)(v226 + 8) + 8 * (v234 + v228 - v239)) = v237;
    DDLexemCacheItemSet(v237, v59, v291);
    v240 = v260;
  }
  DDLexemCacheGetLexems(*(_QWORD **)(v240 + 48), v6[2], v4, v250, &v284);
  return v284;
}

uint64_t DDLexemCacheGetLexems(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v5 = *(_QWORD *)(a2 + 48 * ((int)a3 >> 16) + 32)
     + (a3 >> 32)
     - (*(_QWORD *)(a2 + 48 * ((int)a3 >> 16) + 16)
      + *a1);
  if (v5 < 201
    || (v8 = (_QWORD *)a1[8]) == 0
    || ((v11 = a1[9], v13 = HIDWORD(v11) == HIDWORD(a3), v12 = (uint64_t)(int)v11 >> 16, v13)
      ? (v13 = (_DWORD)v12 == (int)a3 >> 16)
      : (v13 = 0),
        !v13))
  {
    if (v5 >= a1[2])
      return 0;
    v6 = a1[4] + v5;
    v7 = v6 >= a1[3] ? a1[3] : 0;
    v8 = *(_QWORD **)(a1[1] + 8 * (v6 - v7));
    if (!v8)
      return 0;
  }
  v9 = v8[1];
  if ((v9 & 0x80000000) != 0)
    return 0;
  *a5 = (int)v9;
  *a4 = *v8;
  return 1;
}

uint64_t *DDTokenCacheGetTokensAtPosition(_QWORD *a1, _QWORD *cf, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t TokenInCache;
  uint64_t *result;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v4 = cf[2] + 48 * ((int)a3 >> 16);
  v5 = *(_QWORD *)(v4 + 32) + (a3 >> 32) - *(_QWORD *)(v4 + 16);
  v6 = a1[2];
  v7 = v5 - v6;
  if (v5 - v6 > 199)
    return 0;
  v11 = a1[5];
  if (v11 <= v7)
    v12 = v11 - 1;
  else
    v12 = v5 - v6;
  if ((v12 & 0x8000000000000000) == 0)
  {
    v13 = a1[7];
    while (1)
    {
      v14 = v13 + v12 >= a1[6] ? a1[6] : 0;
      if ((*(_BYTE *)(*(_QWORD *)(a1[4] + 8 * v13 - 8 * v14 + 8 * v12) + 3) & 0x80) == 0)
        break;
      if (v12-- <= 0)
      {
        v12 = -1;
        break;
      }
    }
  }
  if (v12 < v7)
  {
    v16 = v12 + 1;
    do
    {
      TokenInCache = _FillNextTokenInCache(a1, cf, v16);
      if (TokenInCache >= 0)
        v16 = TokenInCache;
    }
    while ((TokenInCache & 0x8000000000000000) == 0 && v16 <= v7);
  }
  result = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v5 - v6);
  if (!result)
    return result;
  v19 = *result;
  if ((*result & 0x80000000) != 0)
    return 0;
  if ((int)v19 != v5)
  {
    result = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, ((int)v19 - v6) & ~(((int)v19 - v6) >> 63));
    if (!result)
      return result;
    v19 = *result;
  }
  v20 = v19 << 16 >> 48;
  v21 = result + 1;
  if ((int)v20 >= 2)
    v21 = (_QWORD *)*v21;
  *a4 = v21;
  return (uint64_t *)(*result << 16 >> 48);
}

uint64_t DDTokenCacheGetItemAtIndexCreateIfNeeded(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[16];

  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 > a2)
    goto LABEL_11;
  v6 = a2 + 10;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    if (v4 <= v7)
    {
      if ((DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_10 & 1) != 0)
        return 0;
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v20 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BC07000, v20, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTableSize > tokenCache->_tokenCacheTableStartOffset", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v21, 482, CFSTR("Start offset out of bounds"));
      result = 0;
      DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_10 = 1;
      return result;
    }
    v8 = (char *)malloc_type_malloc(8 * v6, 0x2004093837F09uLL);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 48) - v9;
    memcpy(v8, (const void *)(*(_QWORD *)(a1 + 32) + 8 * v9), 8 * v10);
    memcpy(&v8[8 * v10], *(const void **)(a1 + 32), 8 * *(_QWORD *)(a1 + 56));
    free(*(void **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 56) = 0;
  }
  else
  {
    v8 = (char *)malloc_type_realloc(*(void **)(a1 + 32), 8 * v6, 0x2004093837F09uLL);
    *(_QWORD *)(a1 + 32) = v8;
    if (!v8)
    {
      if ((DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged & 1) != 0)
        return 0;
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v22 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v26 = 0;
        _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v26, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTable != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v23, 480, CFSTR("Realloc failed"));
      result = 0;
      DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged = 1;
      return result;
    }
  }
  bzero(&v8[8 * *(_QWORD *)(a1 + 48)], 8 * (v6 - *(_QWORD *)(a1 + 48)));
  v11 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v11 + 8 * a2 + 72) && !*(_QWORD *)(v11 + 8 * *(_QWORD *)(a1 + 48)))
  {
    *(_QWORD *)(a1 + 48) = v6;
    v4 = a2 + 10;
LABEL_11:
    if (v5 <= a2)
    {
      do
      {
        v14 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 56);
        if (v5 + v13 < v14)
          v14 = 0;
        v15 = v5 + v13 - v14;
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v15))
        {
          v16 = malloc_type_calloc(1uLL, 0x18uLL, 0x10220403CBE8D38uLL);
          *v16 = 0x10000FFFFFFFFLL;
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v15) = v16;
        }
        ++*(_QWORD *)(a1 + 40);
        ++v5;
      }
      while (a2 + 1 != v5);
      v4 = *(_QWORD *)(a1 + 48);
    }
    v17 = *(_QWORD *)(a1 + 56) + a2;
    if (v17 < v4)
      v4 = 0;
    return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * (v17 - v4));
  }
  if ((DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_14 & 1) != 0)
    return 0;
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v18 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_error_impl(&dword_19BC07000, v18, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v24, 2u);
  }
  DDLogAssertionFailure((uint64_t)"tokenCache->_tokenCacheTable[newSize - 1] == NULL && tokenCache->_tokenCacheTable[tokenCache->_tokenCacheTableSize] == NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v19, 496, CFSTR("Wrong initialization"));
  result = 0;
  DDTokenCacheGetItemAtIndexCreateIfNeeded_alreadyLogged_14 = 1;
  return result;
}

void **DDLexemCacheItemSet(void **result, uint64_t a2, void *__src)
{
  void **v4;
  void *v6;
  uint64_t v7;

  v4 = result;
  if (a2 >= 1)
  {
    v6 = *result;
    if (a2 > (uint64_t)v4[1] >> 32)
    {
      v7 = 24;
      if (a2 > 24)
        v7 = a2;
      v4[1] = (void *)(v4[1] | ((unint64_t)v7 << 32));
      v6 = malloc_type_realloc(v6, 32 * v7, 0x1010040F32E1FD2uLL);
      *v4 = v6;
    }
    result = (void **)memcpy(v6, __src, 32 * a2);
  }
  *((_DWORD *)v4 + 2) = a2;
  return result;
}

uint64_t DDLookupTableRefLookupCurrentWord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _WORD *v13;
  UniChar *v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  CFIndex Length;
  UniChar *v29;
  _QWORD *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  int *v39;
  uint64_t v40;
  unsigned int *v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  UniChar *v45;
  int v46;
  int v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int *v60;
  uint64_t v61;
  int32_t v62;
  int v63;
  _BYTE *v64;
  int v65;
  int v66;
  unsigned int v67;
  UErrorCode v68;
  int32_t v70;
  UChar32 v71;
  UChar32 v72;
  unsigned int v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unsigned __int16 *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int *v84;
  unsigned __int16 *v85;
  int *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  CFIndex range;
  uint64_t v110;
  UCharIterator v111;
  UErrorCode pErrorCode;
  UCharIterator iter;
  int v114;
  UChar dest[24];
  _BYTE v116[48];
  uint64_t v117;
  CFRange v118;
  CFRange v119;

  v117 = *MEMORY[0x1E0C80C00];
  if (HIDWORD(a3) != HIDWORD(a5))
    return 0;
  v8 = a5;
  v9 = a3;
  if ((int)a3 >> 16 != (int)a5 >> 16)
    return 0;
  v10 = a2;
  v11 = 24;
  if (!a8)
    v11 = 16;
  v12 = *(_QWORD **)(a2 + v11);
  if (!v12)
    return 0;
  v13 = (_WORD *)v12[1];
  if (!v13 || (*v13 & 0x7FF) == 0)
    return 0;
  v108 = *(unsigned __int16 *)(*(_QWORD *)(a2 + 32) + 2);
  if (!*(_QWORD *)(a2 + 112))
  {
    v18 = (UniChar *)malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *(_QWORD *)(v10 + 120) = v18;
    *(_QWORD *)(v10 + 112) = CFStringCreateMutableWithExternalCharactersNoCopy(0, v18, 64, 64, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  }
  if (DDLookupTableRefLookupCurrentWord_sOnce != -1)
    dispatch_once(&DDLookupTableRefLookupCurrentWord_sOnce, &__block_literal_global_379);
  v110 = 0;
  if (a7 >= 1)
  {
    v19 = (_DWORD *)v12[1];
    if (v19)
    {
      v20 = a4 - (v9 & 0xFFFFFFFF00000000);
      if (v20 <= 0x31FFFFFFFFLL)
      {
        v104 = v12;
        v105 = v8;
        v101 = a6;
        if (v20 >= 0x100000000)
        {
          v21 = 0;
          v110 = 0;
          v22 = 4294901760;
          v100 = a7;
          v102 = a1;
          v103 = v10;
          while (1)
          {
            v107 = a4;
            v23 = HIDWORD(v20);
            v118.location = v9 >> 32;
            v24 = (uint64_t)(int)v9 >> 16;
            v106 = v9 >> 32;
            v118.length = HIDWORD(v20);
            CFStringGetCharacters(*(CFStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 16) + 48 * (int)v24), v118, *(UniChar **)(v10 + 120));
            CFStringSetExternalCharactersNoCopy(*(CFMutableStringRef *)(v10 + 112), *(UniChar **)(v10 + 120), v23, 64);
            CFStringFold(*(CFMutableStringRef *)(v10 + 112), 0x81uLL, 0);
            v114 = 0;
            range = v23;
            v25 = unorm2_quickCheck() == 1 && v114 < 1;
            if (!v25)
              CFStringNormalize(*(CFMutableStringRef *)(v10 + 112), kCFStringNormalizationFormKC);
            if ((int)v22 >> 16 == -1)
            {
LABEL_26:
              Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              v29 = *(UniChar **)(v10 + 120);
              v30 = v104;
              goto LABEL_52;
            }
            v26 = (uint64_t)(int)v22 >> 16;
            v27 = (uint64_t)(int)v9 >> 16;
            if ((int)v26 >= (int)v27)
            {
              if ((int)v26 > (int)v27)
                goto LABEL_26;
              Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              v29 = *(UniChar **)(v10 + 120);
              v25 = SHIDWORD(v22) < SHIDWORD(v9);
              a7 = v100;
              v30 = v104;
              if (!v25)
                goto LABEL_52;
            }
            else
            {
              Length = CFStringGetLength(*(CFStringRef *)(v10 + 112));
              v29 = *(UniChar **)(v10 + 120);
              v30 = v104;
            }
            if ((*v19 & 0x800) == 0)
              break;
            if (!*((_WORD *)v19 + v21 + 4))
            {
              v37 = 0;
              v39 = v19 + 1;
              goto LABEL_47;
            }
            if (*((_WORD *)v19 + v21 + 4) != 32)
              goto LABEL_42;
            if (!*((_WORD *)v19 + v21 + 5))
            {
              v39 = v19 + 1;
              goto LABEL_46;
            }
            v37 = 1;
            v38 = v19;
LABEL_48:
            v40 = v37 + v21;
            if (v38 == v19)
              v21 = v40;
            else
              v21 = 0;
            v19 = v38;
LABEL_52:
            v41 = 0;
            if (v19 && (int)Length >= 1)
            {
              v42 = 0;
              v43 = 0;
              v41 = 0;
              v44 = v19;
              while (1)
              {
                v45 = &v29[v42];
                if ((*v44 & 0x800) != 0)
                {
                  if ((int)Length - v42 >= 1)
                  {
                    v55 = 0;
                    v56 = (uint64_t)v44 + 2 * v21 + 8;
                    while (*(_WORD *)(v56 + 2 * v55))
                    {
                      v57 = v45[v55];
                      if (v57 == 45)
                        v58 = 32;
                      else
                        v58 = v45[v55];
                      if (v57 == 8217)
                        v59 = 39;
                      else
                        v59 = v58;
                      if (v59 != *(unsigned __int16 *)(v56 + 2 * v55))
                        goto LABEL_69;
                      if ((int)Length - v42 == ++v55)
                      {
                        v55 = (int)Length - v42;
                        goto LABEL_83;
                      }
                    }
LABEL_85:
                    v60 = v44 + 1;
LABEL_87:
                    v19 = (_DWORD *)(v30[2] + *v60);
                    goto LABEL_88;
                  }
                  v55 = 0;
LABEL_83:
                  if (!*((_WORD *)v44 + v55 + v21 + 4))
                    goto LABEL_85;
                  v19 = v44;
                }
                else
                {
                  v46 = *v45;
                  if (v46 == 45)
                    v47 = 32;
                  else
                    v47 = v46;
                  if (v46 == 8217)
                    v48 = 39;
                  else
                    v48 = v47;
                  v49 = *v44 & 0x7FF;
                  if (v49)
                  {
                    v50 = 0;
                    v51 = *v44 & 0x7FFLL;
                    while (1)
                    {
                      v52 = v50 + ((unint64_t)v51 >> 1);
                      v53 = *((unsigned __int16 *)v44 + v52 + 2);
                      if (v53 == v48)
                        break;
                      v54 = (unint64_t)v51 >> 1;
                      v51 += v50 + ~v52;
                      if (v53 < v48)
                        v50 = v52 + 1;
                      else
                        v51 = v54;
                      if (v51 <= 0)
                        goto LABEL_69;
                    }
                    v60 = &v44[v52 + 1 + ((v49 + 1) >> 1)];
                    v55 = 1;
                    goto LABEL_87;
                  }
LABEL_69:
                  v55 = 0;
                  v19 = 0;
                }
LABEL_88:
                v42 += v55;
                if (v19)
                {
                  v41 = v19;
                  v43 = v42;
                }
                v61 = v55 + v21;
                if (v19 == v44)
                  v21 = v61;
                else
                  v21 = 0;
                if (v19)
                {
                  v44 = v19;
                  if (v42 < (int)Length)
                    continue;
                }
                goto LABEL_97;
              }
            }
            v43 = 0;
LABEL_97:
            if (v43 == ((Length << 32) - 0x100000000) >> 32 && (v29[v43] & 0xFFFE) == 0x200E)
              v43 = (int)Length;
            if (!v41)
              return v110;
            if (v43 < 1)
              goto LABEL_132;
            if (v23 == (int)Length)
              goto LABEL_129;
            v119.location = v9 >> 32;
            v119.length = v23;
            CFStringGetCharacters(*(CFStringRef *)(*(_QWORD *)(*(_QWORD *)(v102 + 56) + 16) + 48 * (int)v24), v119, v29);
            CFStringSetExternalCharactersNoCopy(*(CFMutableStringRef *)(v103 + 112), *(UniChar **)(v103 + 120), v23, 64);
            memset(&iter, 0, sizeof(iter));
            uiter_setString(&iter, *(const UChar **)(v103 + 120), v23);
            v62 = 0;
            v63 = 0;
            pErrorCode = U_ZERO_ERROR;
            v64 = v116;
            v65 = 24;
            while (1)
            {
              v66 = unorm_next();
              if (v66 < 1)
                break;
              v67 = v66;
              v68 = pErrorCode;
              if (pErrorCode == U_BUFFER_OVERFLOW_ERROR && v66 > v65)
              {
                if (v116 != v64)
                  free(v64);
                v64 = malloc_type_malloc(2 * v67, 0x1000040BDFB0063uLL);
                v73 = v67;
                if (v64)
                {
                  iter.index = v62;
                  pErrorCode = U_ZERO_ERROR;
                  v73 = unorm_next();
                }
                v68 = pErrorCode;
                v65 = v67;
                v67 = v73;
              }
              if (v68 > U_ZERO_ERROR)
                break;
              v70 = u_strFoldCase(dest, 24, (const UChar *)v64, v67, 0, &pErrorCode);
              if (pErrorCode >= U_ILLEGAL_ARGUMENT_ERROR)
                break;
              v63 += v70;
              memset(&v111, 0, sizeof(v111));
              uiter_setString(&v111, dest, v70);
              while (1)
              {
                v71 = uiter_next32(&v111);
                if (v71 == -1)
                  break;
                v72 = v71;
                if (u_charType(v71) == 6)
                  v63 -= u_getIntPropertyValue(v72, UCHAR_DIACRITIC) != 0;
              }
              v62 = ((uint64_t (*)(UCharIterator *, uint64_t))iter.getIndex)(&iter, 1);
              if (v43 <= v63)
              {
                if (v43 >= v63)
                  v43 = v62;
                else
                  v43 = 0;
                break;
              }
            }
            a7 = v100;
            v30 = v104;
            if (v116 != v64 && v64)
              free(v64);
            if (v43 > range)
            {
              if (DDLookupTableRefLookupCurrentWord_sOnce_9 != -1)
                dispatch_once(&DDLookupTableRefLookupCurrentWord_sOnce_9, &__block_literal_global_11);
              return 0;
            }
            if (v43 >= 1)
            {
LABEL_129:
              v74 = v105 & 0xFFFF0000 | ((unint64_t)(v43 + v106) << 32);
              v75 = v101 + 32 * v110;
              v76 = a7 - v110;
              v77 = *v41;
              if ((v77 & 0x1000) != 0)
              {
                v80 = 0;
                if (v76 < 1)
                {
                  a1 = v102;
                  v10 = v103;
                }
                else
                {
                  a1 = v102;
                  v10 = v103;
                  if (v77 >= 0x2000)
                  {
                    *(_QWORD *)v75 = v74 | (unsigned __int16)(v77 >> 13);
                    *(_QWORD *)(v75 + 8) = 0;
                    *(_QWORD *)(v75 + 16) = 0;
                    *(_QWORD *)(v75 + 24) = 0;
                    v80 = 1;
                  }
                }
              }
              else
              {
                v78 = v77 >> 13;
                if (v30[9])
                  v79 = (unsigned __int16 *)(v30[3] + 2 * v78);
                else
                  v79 = 0;
                a1 = v102;
                v10 = v103;
                v81 = v30[10];
                if (v81)
                  v81 = v30[4] + 4 * v78;
                if (v30[11])
                  v82 = v30[5] + 4 * v78;
                else
                  v82 = 0;
                v80 = 0;
                if ((__int16)*v79 >= 1)
                {
                  v25 = v76 < 1;
                  v83 = v76 - 1;
                  if (!v25)
                  {
                    if (v83 >= (unint64_t)*v79 - 1)
                      v83 = *v79 - 1;
                    v84 = (int *)(v81 + 4);
                    v85 = v79 + 1;
                    v86 = (int *)(v82 + 4);
                    v87 = v83 + 1;
                    do
                    {
                      if (v82 && (v88 = *v86, (_DWORD)v88) && v30[14] > v88)
                        v89 = v30[8] + v88;
                      else
                        v89 = 0;
                      v90 = *v85;
                      if (v81 | v89)
                      {
                        v91 = *v84;
                        *(_DWORD *)(v75 + 8) = *v84;
                        *(_QWORD *)v75 = v74 | v90;
                        if (v108 >= 7)
                          v92 = (v91 << 22) & 0x3000000 | ((v91 & 3) << 26) | 0x10000;
                        else
                          v92 = 0x10000;
                        *(_DWORD *)(v75 + 12) = v92;
                        *(_QWORD *)(v75 + 16) = 0;
                        *(_QWORD *)(v75 + 24) = v89;
                      }
                      else
                      {
                        *(_QWORD *)v75 = v74 | v90;
                        *(_QWORD *)(v75 + 8) = 0;
                        *(_QWORD *)(v75 + 16) = 0;
                        *(_QWORD *)(v75 + 24) = 0;
                      }
                      ++v84;
                      ++v85;
                      ++v86;
                      v75 += 32;
                      --v87;
                    }
                    while (v87);
                    v80 = v83 + 1;
                  }
                }
              }
              v110 += v80;
            }
            else
            {
LABEL_132:
              a1 = v102;
              v10 = v103;
            }
            v22 = v107;
            if (!v19
              || (int)DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(a1 + 40), *(_QWORD **)(a1 + 56), v107) >> 16 == -1)
            {
              return v110;
            }
            a4 = v93;
            v94 = (uint64_t)(int)v107 >> 16;
            v95 = (uint64_t)(int)v93 >> 16;
            if ((_DWORD)v94 != (_DWORD)v95)
            {
              v96 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16);
              v97 = *(_QWORD *)(v96 + 48 * (int)v94 + 24);
              if (v97 == v107 >> 32)
              {
                v98 = v94 + 1;
                v9 = ((_DWORD)v98 << 16);
                if (v98 != v95)
                  a4 = v9 | (*(_QWORD *)(v96 + 48 * (int)v98 + 24) << 32);
                goto LABEL_170;
              }
              a4 = ((_DWORD)v94 << 16) | (unint64_t)(v97 << 32);
            }
            v9 = v107;
LABEL_170:
            if (v110 < a7)
            {
              v20 = a4 - (v9 & 0xFFFFFFFF00000000);
              if (v20 <= 0x31FFFFFFFFLL)
              {
                v105 = v9;
                if (v20 > 0xFFFFFFFFLL)
                  continue;
              }
            }
            return v110;
          }
          v31 = *v19 & 0x7FF;
          if (v31)
          {
            v32 = 0;
            v33 = *v19 & 0x7FFLL;
            while (1)
            {
              v34 = v32 + ((unint64_t)v33 >> 1);
              v35 = *((unsigned __int16 *)v19 + v34 + 2);
              if (v35 == 32)
                break;
              v36 = (unint64_t)v33 >> 1;
              v33 += v32 + ~v34;
              if (v35 < 0x20)
                v32 = v34 + 1;
              else
                v33 = v36;
              if (v33 <= 0)
                goto LABEL_42;
            }
            v39 = &v19[v34 + 1 + ((v31 + 1) >> 1)];
LABEL_46:
            v37 = 1;
LABEL_47:
            v38 = (_DWORD *)(v30[2] + *v39);
            goto LABEL_48;
          }
LABEL_42:
          v37 = 0;
          v38 = 0;
          goto LABEL_48;
        }
      }
    }
  }
  return v110;
}

uint64_t _fetchNextToken(uint64_t a1)
{
  uint64_t Token;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  CFIndex CurrentTokenRange;
  CFIndex v19;
  CFIndex v20;
  CFIndex v21;
  uint64_t v22;
  CFIndex v23;
  CFIndex v24;
  uint64_t CurrentSubTokens;
  size_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  CFStringRef *v30;
  CFIndex location;
  CFIndex v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _DWORD *v41;
  size_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFRange result;
  uint8_t buf[2];
  _QWORD v51[33];
  CFRange v52;
  CFRange v53;

  v51[31] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 120))
    return -1;
  do
  {
    Token = NLStringTokenizerAdvanceToNextToken();
    if (Token)
      break;
    v3 = *(_QWORD *)(a1 + 112) + 1;
    if (v3 >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      *(_BYTE *)(a1 + 120) = 1;
      return -1;
    }
    *(_QWORD *)(a1 + 112) = v3;
    NLStringTokenizerSetStringWithOptions();
    Token = NLStringTokenizerAdvanceToNextToken();
  }
  while (!Token);
  v4 = Token;
  if (*(_BYTE *)(a1 + 120))
    return -1;
  v5 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 64);
  if (v5 + 1 < v6)
    v7 = v5 + 1;
  else
    v7 = 0;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v8 + 32 * v7;
  if (*(_BYTE *)(v9 + 25))
  {
    v10 = *(void **)(v9 + 16);
    if (v10)
    {
      free(v10);
      v6 = *(_QWORD *)(a1 + 64);
    }
    *(_BYTE *)(v8 + 32 * v7 + 24) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    *(_QWORD *)(a1 + 96) = (v7 + 1) % v6;
    v11 = *(_QWORD *)(a1 + 80);
    v12 = v11 == 1;
    v13 = v11 < 1;
    v14 = v11 - 1;
    if (!v13)
    {
      *(_QWORD *)(a1 + 80) = v14;
      if (v12)
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v15 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, "We missed a token, because the cache was over used...", buf, 2u);
        }
      }
    }
  }
  else
  {
    ++*(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 96) = 0;
    *(_BYTE *)(v9 + 25) = 1;
  }
  v48 = v8;
  v17 = *(_QWORD *)(a1 + 112);
  ++*(_QWORD *)(a1 + 104);
  CurrentTokenRange = NLStringTokenizerGetCurrentTokenRange();
  v20 = v19;
  v21 = CurrentTokenRange + v19;
  v22 = ((_DWORD)v17 << 16);
  v23 = v22 | (CurrentTokenRange << 32);
  *(_QWORD *)v9 = v23;
  *(_QWORD *)(v9 + 8) = v22 | ((CurrentTokenRange + v19) << 32);
  v24 = v22 | ((CurrentTokenRange + v19) << 32);
  if ((v4 & 6) != 0 && (CurrentSubTokens = NLStringTokenizerGetCurrentSubTokens(), CurrentSubTokens >= 1))
  {
    v26 = CurrentSubTokens;
    if ((unint64_t)CurrentSubTokens > 0xF)
    {
      v29 = v48;
    }
    else
    {
      v27 = &buf[16 * CurrentSubTokens];
      v28 = *((_QWORD *)v27 - 2) + *((_QWORD *)v27 - 1);
      v29 = v48;
      if (v21 > v28)
      {
        *(_QWORD *)v27 = v28;
        *((_QWORD *)v27 + 1) = v21 - v28;
        v26 = CurrentSubTokens + 1;
      }
    }
    v37 = malloc_type_calloc(v26, 0x20uLL, 0x10200406A33E52CuLL);
    v38 = v29 + 32 * v7;
    *(_QWORD *)(v38 + 16) = v37;
    v39 = (_QWORD *)(v38 + 16);
    if (!v37)
      goto LABEL_46;
    v40 = 0;
    v41 = v51;
    v42 = v26;
    do
    {
      v43 = *((_QWORD *)v41 - 1);
      v44 = *v41;
      v41 += 4;
      v45 = *v39 + v40;
      *(_QWORD *)v45 = v22 | (v43 << 32);
      *(_QWORD *)(v45 + 8) = v22 | ((unint64_t)(v44 + v43) << 32);
      *(_QWORD *)(v45 + 16) = 0;
      *(_WORD *)(v45 + 24) = 256;
      *(_DWORD *)(v45 + 26) = 0;
      *(_WORD *)(v45 + 30) = 0;
      v40 += 32;
      --v42;
    }
    while (v42);
    v46 = v29 + 32 * v7;
  }
  else
  {
    v30 = (CFStringRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 48 * v17);
    result = (CFRange)xmmword_19BC3FC60;
    v52.location = CurrentTokenRange;
    v52.length = v20;
    if (!CFStringFindWithOptions(*v30, CFSTR("'"), v52, 0, &result))
    {
      v53.location = CurrentTokenRange;
      v53.length = v20;
      if (!CFStringFindWithOptions(*v30, CFSTR("’"), v53, 0, &result))
        goto LABEL_46;
    }
    location = result.location;
    v32 = result.length + result.location;
    v26 = result.location <= CurrentTokenRange
        ? v21 > result.length + result.location
        : (v21 > result.length + result.location) + 1;
    if (!v26)
      goto LABEL_46;
    v33 = (char *)malloc_type_calloc(v26, 0x20uLL, 0x10200406A33E52CuLL);
    v34 = v48 + 32 * v7;
    *(_QWORD *)(v34 + 16) = v33;
    v35 = (_QWORD *)(v34 + 16);
    if (!v33)
      goto LABEL_46;
    if (location <= CurrentTokenRange)
    {
      v36 = 0;
    }
    else
    {
      *(_QWORD *)v33 = v23;
      *((_QWORD *)v33 + 1) = v22 | (location << 32);
      *((_QWORD *)v33 + 2) = 0;
      *((_WORD *)v33 + 12) = 256;
      *(_DWORD *)(v33 + 26) = 0;
      *((_WORD *)v33 + 15) = 0;
      v36 = 1;
    }
    if (v21 > v32)
    {
      v47 = *v35 + 32 * v36;
      *(_QWORD *)v47 = v22 | (v32 << 32);
      *(_QWORD *)(v47 + 8) = v24;
      *(_QWORD *)(v47 + 16) = 0;
      *(_WORD *)(v47 + 24) = 256;
      *(_DWORD *)(v47 + 26) = 0;
      *(_WORD *)(v47 + 30) = 0;
    }
    v46 = v48 + 32 * v7;
  }
  *(_BYTE *)(v46 + 24) = v26;
LABEL_46:
  *(_QWORD *)(a1 + 88) = v7;
  return (v7 - *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 72)) % *(_QWORD *)(a1 + 72);
}

uint64_t _tokenEntryAtRealIndex(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (a2 < 0 || *(_QWORD *)(result + 72) <= a2)
    return 0;
  v2 = *(_QWORD *)(result + 48);
  if (!*(_BYTE *)(result + 121))
    return v2 + 32 * a2;
  v3 = v2 + 16 * a2;
  v4 = *(_QWORD *)v3 << 32;
  v5 = (unint64_t)(*(_DWORD *)(v3 + 8) + *(_QWORD *)v3) << 32;
  *(_QWORD *)result = v4;
  *(_QWORD *)(result + 8) = v5;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  return result;
}

BOOL DDScannerScanQuery(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL8 v5;
  _QWORD *v7;
  CFTypeRef v8;
  uint64_t v9;
  CFTypeRef v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double Current;
  const __CFString *v22;
  double v23;
  double v24;
  uint64_t TokenOrSubtokenAfterPosition;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  void **p_cache;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  const __CFArray *v58;
  CFIndex Count;
  CFIndex v60;
  CFIndex v61;
  BOOL v62;
  CFStringRef *ValueAtIndex;
  CFStringRef *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  CFIndex v68;
  uint64_t v69;
  const __CFArray *v70;
  double v71;
  int v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __CFString *CopyFullStringExcludingContext;
  __CFString *v78;
  const void *v79;
  const __CFArray *v80;
  CFIndex v81;
  CFIndex v82;
  CFIndex v83;
  CFStringRef *v84;
  uint64_t v85;
  uint64_t v86;
  CFStringRef *v87;
  CFStringRef *v88;
  uint64_t v89;
  const __CFBoolean *v91;
  const __CFBoolean *v92;
  CFTypeID v93;
  int Value;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int64_t v101;
  uint64_t v102;
  unsigned int v103;
  int v104;
  __int128 buf;
  unint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v4 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_19BC07000, v4, OS_LOG_TYPE_ERROR, "DDScannerScanQuery called with NULL scanner", (uint8_t *)&buf, 2u);
    }
    return 0;
  }
  v2 = a1;
  if (*(_BYTE *)(a1 + 233) != 1)
  {
    *(_BYTE *)(a1 + 233) = 1;
    DDScannerReset(a1);
    if (*(_QWORD *)(v2 + 40) || (v7 = DDTokenCacheCreate(0), *(_QWORD *)(v2 + 40) = v7, *(_BYTE *)(v2 + 236) = 0, v7))
    {
      if (a2 && a2[4])
      {
        kdebug_trace();
        v8 = CFRetain(a2);
        *(_QWORD *)(v2 + 56) = v8;
        v9 = *(_QWORD *)(v2 + 24);
        v10 = *(CFTypeRef *)(v9 + 24);
        if (v10 != v8)
        {
          if (v10)
            CFRelease(v10);
          *(_QWORD *)(v9 + 24) = v8;
          if (v8)
            CFRetain(v8);
        }
        *(_QWORD *)(v9 + 40) = -1;
        v11 = *(_QWORD **)(v2 + 56);
        v12 = v11[2];
        v13 = *(_DWORD *)(v12 + 40) << 6;
        v14 = (uint64_t)v13 >> 6;
        v97 = v13;
        if (v13 >= 1)
        {
          v15 = 0;
          while (1)
          {
            DDTokenCacheGetTokenOrSubtokenAtPosition(*(_QWORD **)(v2 + 40), v11, v15 << 32);
            if (v16 >> 32 <= v15)
              ++v15;
            else
              v15 = v16 >> 32;
            v17 = *(_QWORD **)(v2 + 40);
            v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 16);
            if (v15 >= v14)
              break;
            DDTokenCacheMoveStreamOffset(v17, v18, v15 << 32);
            v11 = *(_QWORD **)(v2 + 56);
          }
          DDTokenCacheMoveStreamOffset(v17, v18, v14 << 32);
        }
        v95 = (uint64_t)a2;
        v96 = v14;
        v19 = (*(_DWORD *)(v12 + 16) + v14);
        v20 = *(_QWORD *)(v2 + 200);
        if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 0 && !*(_QWORD *)(v2 + 128))
          goto LABEL_38;
        Current = CFAbsoluteTimeGetCurrent();
        if (*(double *)(v2 + 136) >= Current + -9.0)
          goto LABEL_38;
        *(double *)(v2 + 136) = Current;
        if ((v20 & 4) != 0)
        {
          v22 = *(const __CFString **)(v2 + 128);
          if (v22)
            DDLookupTableUpdateFromExternalFile(5, (unsigned __int16 **)(v2 + 104), v22);
        }
        if ((v20 & 1) != 0)
        {
          v74 = *(_QWORD *)(v2 + 80);
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 0x40000000;
          v106 = (unint64_t)__DDLookupTableUpdateFromExternalFile_block_invoke;
          v107 = &__block_descriptor_tmp_20;
          v108 = v2 + 80;
          v109 = v74;
          mmapSource(6, 0, (uint64_t)&buf);
          if ((v20 & 2) == 0)
          {
LABEL_35:
            if ((v20 & 8) == 0)
              goto LABEL_36;
            goto LABEL_136;
          }
        }
        else if ((v20 & 2) == 0)
        {
          goto LABEL_35;
        }
        if (!altPath)
        {
          v91 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("LookupSuggestionsDisabled"), CFSTR("com.apple.lookup.shared"));
          if (v91)
          {
            v92 = v91;
            v93 = CFGetTypeID(v91);
            if (v93 == CFBooleanGetTypeID())
            {
              Value = CFBooleanGetValue(v92);
              CFRelease(v92);
              if (Value)
              {
                _DDScannerDestroyOptionalLookupTable(v2, 2);
                _DDScannerDestroyOptionalLookupTable(v2, 3);
                if ((v20 & 8) != 0)
                {
LABEL_136:
                  v75 = *(_QWORD *)(v2 + 112);
                  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&buf + 1) = 0x40000000;
                  v106 = (unint64_t)__DDLookupTableUpdateFromExternalFile_block_invoke;
                  v107 = &__block_descriptor_tmp_20;
                  v108 = v2 + 112;
                  v109 = v75;
                  mmapSource(4, 0, (uint64_t)&buf);
                  if ((v20 & 0x80) != 0)
LABEL_37:
                    DDLookupTableUpdateFromExternalFile(1, (unsigned __int16 **)(v2 + 120), 0);
LABEL_38:
                  *(_BYTE *)(v2 + 232) &= ~2u;
                  *(_BYTE *)(v2 + 232) &= ~1u;
                  *(_QWORD *)(v2 + 176) = -1;
                  v23 = *(double *)(v2 + 224);
                  v24 = 0.0;
                  if (v23 > 0.0)
                    v24 = v23 + CFAbsoluteTimeGetCurrent();
                  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 168));
                  if (*(_QWORD *)(v2 + 192) >> 31)
                    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v2 + 160));
                  malloc_make_nonpurgeable(*(void **)(v2 + 208));
                  TokenOrSubtokenAfterPosition = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(_QWORD **)(v2 + 56), v19 << 32);
                  v100 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 32);
                  v101 = v26;
                  if (v100 >= 1)
                  {
                    v27 = TokenOrSubtokenAfterPosition;
                    v28 = 0;
                    v99 = (int)v19;
                    p_cache = DDMessageCache.cache;
                    while (1)
                    {
                      if ((*(_BYTE *)(v2 + 232) & 1) != 0)
                        goto LABEL_114;
                      v30 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 16) + 48 * v28;
                      v31 = *(_QWORD *)(v30 + 16);
                      v32 = *(_QWORD *)(v30 + 24);
                      if (v28)
                        v33 = v31;
                      else
                        v33 = v99;
                      v34 = v32 + v31;
                      if (v32 < 0 || v31 < 0 || v34 >= 2147483646)
                      {
                        if (DDLogHandle_onceToken != -1)
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                        v35 = p_cache[100];
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                        {
                          LOWORD(buf) = 0;
                          _os_log_error_impl(&dword_19BC07000, v35, OS_LOG_TYPE_ERROR, "Fragment is too long for DD, ignoring. Do you really need to analyze something this long?", (uint8_t *)&buf, 2u);
                        }
                        *(_BYTE *)(v2 + 232) |= 1u;
                      }
                      if (v33 <= v34)
                        break;
LABEL_57:
                      if (++v28 == v100)
                        goto LABEL_114;
                    }
                    v102 = v34;
                    v103 = (_DWORD)v28 << 16;
                    v104 = (__int16)v28;
                    while (1)
                    {
                      if ((*(_BYTE *)(v2 + 232) & 1) != 0)
                        goto LABEL_57;
                      v36 = v103 | ((unint64_t)v33 << 32);
                      v37 = *(_QWORD *)(v2 + 216);
                      if (v37
                        && !(*(unsigned int (**)(uint64_t, unint64_t))(v37 + 16))(v37, v103 | ((unint64_t)v33 << 32)))
                      {
                        goto LABEL_94;
                      }
                      if ((*(_BYTE *)(v2 + 192) & 1) != 0)
                      {
                        v58 = *(const __CFArray **)(v2 + 168);
                        Count = CFArrayGetCount(v58);
                        if (Count > 10)
                          goto LABEL_94;
                        v60 = Count;
                        if (Count >= 1)
                        {
                          v98 = v27;
                          v61 = 0;
                          v62 = 1;
                          do
                          {
                            ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v58, v61);
                            if (!ValueAtIndex)
                              break;
                            v64 = ValueAtIndex;
                            if (!_typesAreEqual(ValueAtIndex[8], CFSTR("Compatibility"))
                              && !_typesAreEqual(v64[8], CFSTR("Data"))
                              && !_typesAreEqual(v64[8], CFSTR("Tag"))
                              && !_typesAreEqual(v64[8], CFSTR("Generic")))
                            {
                              break;
                            }
                            v62 = ++v61 < v60;
                          }
                          while (v60 != v61);
                          v27 = v98;
                          v34 = v102;
                          if (v62)
                          {
LABEL_94:
                            *(_BYTE *)(v2 + 232) |= 1u;
                            goto LABEL_95;
                          }
                        }
                      }
                      *(_QWORD *)(v2 + 184) = 0;
                      DDTokenCacheMoveStreamOffset(*(_QWORD **)(v2 + 40), *(_QWORD *)(*(_QWORD *)(v2 + 56) + 16), v36);
                      v39 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 16);
                      v40 = *(_QWORD *)(v39 + 48 * v104 + 32) + (int)v33 - *(_QWORD *)(v39 + 48 * v104 + 16);
                      if (v104 > 0 || (int)v33 > *(_QWORD *)(v39 + 16))
                        --v40;
                      v41 = *(_QWORD *)(v2 + 48);
                      v42 = v40 - *(_QWORD *)v41;
                      if (v42 >= 1)
                      {
                        v43 = v28;
                        v44 = v27;
                        if (v42 >= *(_QWORD *)(v41 + 16))
                          v45 = *(_QWORD *)(v41 + 16);
                        else
                          v45 = v42;
                        if (v45 >= 1)
                        {
                          for (i = 0; i != v45; ++i)
                          {
                            v48 = *(_QWORD *)(v41 + 24);
                            v47 = *(_QWORD *)(v41 + 32);
                            if (i + v47 < v48)
                              v48 = 0;
                            v49 = i + v47 - v48;
                            v50 = *(_QWORD *)(v41 + 8);
                            v51 = *(_QWORD *)(v50 + 8 * v49);
                            if (v51)
                            {
                              DDLexemCacheItemReset(*(_QWORD *)(v50 + 8 * v49));
                              DDLexemCacheInsertItemInFreeArray((char *)v41, v51);
                              *(_QWORD *)(*(_QWORD *)(v41 + 8) + 8 * v49) = 0;
                            }
                          }
                        }
                        v52 = *(_QWORD *)(v41 + 24);
                        v53 = *(_QWORD *)(v41 + 32) + v45;
                        *(_QWORD *)(v41 + 32) = v53;
                        v54 = v53 < v52;
                        v55 = v53 - v52;
                        if (!v54)
                          *(_QWORD *)(v41 + 32) = v55;
                        *(_QWORD *)(v41 + 16) -= v45;
                        *(_QWORD *)v41 += v45;
                        v27 = v44;
                        v28 = v43;
                        p_cache = (void **)(DDMessageCache + 16);
                        v34 = v102;
                      }
                      buf = 0uLL;
                      v106 = v103 | ((unint64_t)v33 << 32);
                      v107 = 0;
                      _DDScannerHandleState(v2, (uint64_t *)&buf, 0, v38);
                      if ((int)v27 >> 16 == -1)
                      {
                        v56 = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(_QWORD **)(v2 + 56), v36);
                        v27 = v56;
                        if ((int)v56 >> 16 == -1)
                        {
                          v101 = v57;
LABEL_107:
                          ++v33;
                          goto LABEL_95;
                        }
                        v67 = (uint64_t)(int)v56 >> 16;
                        if (v104 >= (int)v67 && (v104 > (int)v67 || (int)v33 > SHIDWORD(v56)))
                        {
                          v101 = v103 | ((unint64_t)v33 << 32);
                          v27 = v101;
                          goto LABEL_95;
                        }
                      }
                      else
                      {
                        v66 = (uint64_t)(int)v27 >> 16;
                        if (v104 < (int)v66 || v104 <= (int)v66 && (int)v33 < SHIDWORD(v27))
                          goto LABEL_107;
                        v33 = v101 >> 32;
                        v27 = DDTokenCacheGetTokenOrSubtokenAfterPosition(*(uint64_t **)(v2 + 40), *(_QWORD **)(v2 + 56), v101);
                      }
                      v101 = v57;
LABEL_95:
                      if (v23 > 0.0 && (v33 & 0x7FF) == 0 && v24 < CFAbsoluteTimeGetCurrent())
                      {
                        *(_BYTE *)(v2 + 232) |= 1u;
                        if (DDLogHandle_onceToken != -1)
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                        v65 = p_cache[100];
                        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(buf) = 134217984;
                          *(_QWORD *)((char *)&buf + 4) = v2;
                          _os_log_impl(&dword_19BC07000, v65, OS_LOG_TYPE_DEFAULT, "DDScanner %p has timed out", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      if (v33 > v34)
                        goto LABEL_57;
                    }
                  }
LABEL_114:
                  malloc_make_purgeable(*(void **)(v2 + 208));
                  v68 = CFArrayGetCount(*(CFArrayRef *)(v2 + 168));
                  v69 = v68;
                  v5 = v68 > 0;
                  if (v97 >= 1 && v68 > 0)
                  {
                    v70 = *(const __CFArray **)(v2 + 168);
                    if (v70)
                      _offsetResultsInArray(v70, v96);
                  }
                  if (*(_BYTE *)(v2 + 236))
                  {
                    DDTokenCacheDestroy(*(_QWORD ***)(v2 + 40));
                    *(_QWORD *)(v2 + 40) = 0;
                    *(_BYTE *)(v2 + 236) = 0;
                  }
                  kdebug_trace();
                  LOBYTE(buf) = 0;
                  if ((*(_BYTE *)(v2 + 232) & 1) == 0)
                  {
                    v72 = *(_DWORD *)(v2 + 248);
                    if (v72)
                    {
                      if (!*(_QWORD *)(v2 + 264))
                      {
                        if (!*(_BYTE *)(v2 + 256))
                          goto LABEL_149;
                        if (DDMLEnhancementEnabled_onceToken != -1)
                          dispatch_once(&DDMLEnhancementEnabled_onceToken, &__block_literal_global_39);
                        if (!DDMLEnhancementEnabled__isDDMLEnabled)
                          goto LABEL_149;
                        gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(v71);
                        if (!**(_QWORD **)(v76 + 1448))
                          goto LABEL_149;
                        v72 = *(_DWORD *)(v2 + 248);
                      }
                      if (v72 == 2)
                      {
                        if (v69 < 1)
                        {
                          v5 = 0;
                          goto LABEL_149;
                        }
                      }
                      else if (v69 < 1 || v72 != 4)
                      {
                        goto LABEL_149;
                      }
                      CopyFullStringExcludingContext = (__CFString *)DDScanQueryCopyFullStringExcludingContext(v95);
                      if (CopyFullStringExcludingContext)
                      {
                        v78 = CopyFullStringExcludingContext;
                        v79 = DDMLScannerScanStringAroundResults(v2, CopyFullStringExcludingContext, *(void **)(v2 + 168), &buf);
                        CFRelease(v78);
                        if ((_BYTE)buf)
                        {
                          v5 = DDMLUpdateScannerResultsWithMLResults(v2, *(_QWORD *)(v2 + 56), (uint64_t)v79, *(_QWORD *)(v2 + 272));
LABEL_163:
                          if (!v5)
                            DDScannerReset(v2);
                          if (!*(_BYTE *)(v2 + 233))
                          {
                            DDScannerThreadDebug(v2, 0);
                            return v5;
                          }
                          goto LABEL_166;
                        }
                      }
                    }
                  }
LABEL_149:
                  if (*(_DWORD *)(v2 + 248))
                  {
                    if ((*(_BYTE *)(v2 + 195) & 0x20) == 0)
                    {
                      v80 = *(const __CFArray **)(v2 + 168);
                      if (v80)
                      {
                        v81 = CFArrayGetCount(v80);
                        if (v81 >= 1)
                        {
                          v82 = v81;
                          v83 = 0;
                          v84 = 0;
                          v85 = -1;
                          v86 = -1000000;
                          while (1)
                          {
                            v87 = (CFStringRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v2 + 168), v83);
                            v88 = v87;
                            v89 = (uint64_t)v87[6];
                            if ((uint64_t)v87[4] <= v85)
                            {
                              if (DDResultsCanShareRange(v84, v87))
                                goto LABEL_162;
                              if (v86 > v89)
                              {
                                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 168), v83);
                                --v82;
                                --v83;
                                goto LABEL_162;
                              }
                              if (v83 >= 1)
                              {
                                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v2 + 168), v83 - 1);
                                --v82;
                                v86 = v89;
                                v84 = v88;
                                --v83;
                                goto LABEL_162;
                              }
                            }
                            else
                            {
                              v85 = (uint64_t)v87[4];
                            }
                            v86 = v89;
                            v84 = v88;
LABEL_162:
                            if (++v83 >= v82)
                              goto LABEL_163;
                          }
                        }
                      }
                    }
                  }
                  goto LABEL_163;
                }
LABEL_36:
                if ((v20 & 0x80) == 0)
                  goto LABEL_38;
                goto LABEL_37;
              }
            }
            else
            {
              CFRelease(v92);
            }
          }
        }
        DDLookupTableUpdateFromExternalFile(2, (unsigned __int16 **)(v2 + 88), 0);
        DDLookupTableUpdateFromExternalFile(3, (unsigned __int16 **)(v2 + 96), 0);
        if ((v20 & 8) != 0)
          goto LABEL_136;
        goto LABEL_36;
      }
    }
    else
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v73 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_19BC07000, v73, OS_LOG_TYPE_ERROR, "DDScannerScanQuery called with NULL token cache", (uint8_t *)&buf, 2u);
      }
    }
    if (!*(_BYTE *)(v2 + 233))
    {
      a1 = v2;
      v3 = 0;
      goto LABEL_4;
    }
    v5 = 0;
LABEL_166:
    *(_BYTE *)(v2 + 233) = 0;
    return v5;
  }
  v3 = 1;
LABEL_4:
  DDScannerThreadDebug(a1, v3);
  return 0;
}

void DDLexemCacheItemReset(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v1 | 0xFFFFFFFFLL;
  if (SHIDWORD(v1) >= 25)
  {
    free(*(void **)a1);
    v3 = *(unsigned int *)(a1 + 8);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = v3;
  }
}

char *DDLexemCacheInsertItemInFreeArray(char *result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = result;
  v4 = *((_QWORD *)result + 7);
  v5 = *((_QWORD *)result + 6) + 1;
  if (v5 >= v4)
  {
    result = (char *)malloc_type_realloc(*((void **)result + 5), 8 * v4 + 64, 0x2004093837F09uLL);
    v3[5] = result;
    v6 = &result[8 * v3[7]];
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    v7 = v3[6];
    v3[7] += 8;
    v5 = v7 + 1;
  }
  v3[6] = v5;
  *(_QWORD *)(v3[5] + 8 * v5) = a2;
  return result;
}

void DDTokenCacheMoveStreamOffset(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  int v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint8_t buf[16];

  v3 = (uint64_t)(int)a3 >> 16;
  v4 = *(_QWORD *)(a2 + 48 * (int)v3 + 32) + (a3 >> 32) - *(_QWORD *)(a2 + 48 * (int)v3 + 16);
  if ((int)v3 > 0 || a3 >> 32 > *(_QWORD *)(a2 + 16))
    --v4;
  v5 = a1[2];
  v6 = v4 - v5;
  if (v4 - v5 < 0)
  {
    if ((DDTokenCacheMoveStreamOffset_alreadyLogged & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v33 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BC07000, v33, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"delta >= 0", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v34, 407, CFSTR("Bad shift in DDTokenCacheMoveStreamOffset, aborting"));
      DDTokenCacheMoveStreamOffset_alreadyLogged = 1;
    }
  }
  else
  {
    if (!v6)
      return;
    v7 = a1[5];
    if (v6 >= v7)
    {
      v20 = a1[5];
      if (v7 < 1)
      {
LABEL_29:
        v29 = a1[6];
        v30 = a1[7] + v6;
        a1[7] = v30;
        v31 = v30 < v29;
        v32 = v30 - v29;
        if (!v31)
          a1[7] = v32;
        a1[5] = v20 - v7;
        a1[2] += v6;
        return;
      }
    }
    else
    {
      v9 = a1[6];
      v8 = a1[7];
      if (v8 + v6 >= v9)
        v10 = a1[6];
      else
        v10 = 0;
      v11 = v8 + v6 - v10;
      v12 = a1[4];
      v13 = *(uint64_t **)(v12 + 8 * v11);
      v14 = *v13;
      if ((*v13 & 0x80000000) == 0 && (int)v14 < v4)
      {
        v15 = (int)v14 - v5;
        if ((int)v14 < v5)
          v15 = 0;
        v16 = v15 + v8;
        if (v16 >= v9)
          v17 = a1[6];
        else
          v17 = 0;
        v18 = *(_QWORD *)(v12 + 8 * (v16 - v17));
        if (*(_WORD *)(v18 + 6) == 1)
        {
          v19 = *(_OWORD *)(v13 + 1);
          *(_OWORD *)(v13 + 1) = *(_OWORD *)(v18 + 8);
          *(_OWORD *)(v18 + 8) = v19;
        }
        else
        {
          v21 = v13[1];
          v13[1] = *(_QWORD *)(v18 + 8);
          *(_QWORD *)(v18 + 8) = v21;
        }
        v22 = *((_WORD *)v13 + 3);
        *((_WORD *)v13 + 3) = *(_WORD *)(v18 + 6);
        v23 = *(_DWORD *)(v18 + 4);
        *(_WORD *)(v18 + 6) = v22;
        v24 = *((_DWORD *)v13 + 1);
        *((_WORD *)v13 + 2) = v23;
        *(_WORD *)(v18 + 4) = v24;
      }
      v7 = v6;
    }
    for (i = 0; i != v7; ++i)
    {
      v27 = a1[6];
      v26 = a1[7];
      if (i + v26 < v27)
        v27 = 0;
      v28 = *(_QWORD *)(a1[4] + 8 * (i + v26 - v27));
      *(_QWORD *)v28 = ((unint64_t)*(unsigned __int16 *)(v28 + 6) << 48) | 0xFFFFFFFF;
    }
    v20 = a1[5];
    if (v7 <= v20)
      goto LABEL_29;
    if ((DDTokenCacheMoveStreamOffset_alreadyLogged_3 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v35 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BC07000, v35, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
      }
      DDLogAssertionFailure((uint64_t)"maxIndexToClean <= tokenCache->_tokenCacheTableNumberOfItems", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/PushDown/DDTokenCache.c", v36, 451, CFSTR("Bad shift, delta too big"));
      DDTokenCacheMoveStreamOffset_alreadyLogged_3 = 1;
    }
  }
}

uint64_t DDTokenCacheGetTokenOrSubtokenAfterPosition(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Offset;
  uint64_t v9;
  uint64_t v10;
  uint64_t *TokensAtPosition;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t *IfNeeded;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v33;

  v5 = (uint64_t)(int)a3 >> 16;
  v6 = a2[2] + 48 * (int)v5;
  if (*(_QWORD *)(v6 + 32) + (a3 >> 32) - *(_QWORD *)(v6 + 16) < a1[2])
  {
    v7 = *a1;
    Offset = matchingTokenRealIndexForQueryOffset(*a1, a3, 1);
    v9 = _tokenEntryAtRealIndex(v7, Offset);
    if (v9)
      return *(_QWORD *)v9;
    return 4294901760;
  }
  v33 = 0;
  TokensAtPosition = DDTokenCacheGetTokensAtPosition(a1, a2, a3, &v33);
  if ((uint64_t)TokensAtPosition < 1)
  {
    v22 = a3 >> 32;
  }
  else
  {
    v13 = (uint64_t)(int)a3 >> 16;
    v14 = v33;
    v10 = *v33;
    if (HIDWORD(*v33) == HIDWORD(a3) && *(int *)v33 >> 16 == (_DWORD)v13)
    {
      if (TokensAtPosition != (uint64_t *)1)
        return v14[2];
      return v10;
    }
    if (TokensAtPosition != (uint64_t *)1)
    {
      v16 = v33 + 2;
      v17 = 1;
      do
      {
        v18 = *v16;
        v16 += 2;
        v10 = v18;
        v19 = (uint64_t)(int)v18 >> 16;
        if ((int)v19 >= (int)v13)
        {
          v20 = SHIDWORD(v10) < SHIDWORD(a3) && (int)v19 <= (int)v13;
          if (!v20)
            return v10;
        }
      }
      while (TokensAtPosition != (uint64_t *)++v17);
    }
    v21 = v33[1];
    v5 = (uint64_t)(int)v21 >> 16;
    v22 = v21 >> 32;
  }
  v23 = a1[2];
  v24 = a2[2];
  v25 = v22 + *(_QWORD *)(v24 + 48 * (int)v5 + 32) - (v23 + *(_QWORD *)(v24 + 48 * (int)v5 + 16));
  if (v25 > 199)
    return 4294901760;
  v26 = *(_QWORD *)(v24 + 48 * a2[4] - 16) - v23 + *(_QWORD *)(v24 + 48 * a2[4] - 24);
  v27 = v26 >= 200 ? 200 : v26;
  if (v25 > v27)
    return 4294901760;
  v28 = 0;
  v10 = 4294901760;
  do
  {
    IfNeeded = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v25);
    if (!IfNeeded)
      break;
    v30 = *IfNeeded;
    if ((*IfNeeded & 0x80000000) == 0)
      goto LABEL_45;
    if (v28)
      return v10;
    _FillNextTokenInCache(a1, a2, v25);
    IfNeeded = (uint64_t *)DDTokenCacheGetItemAtIndexCreateIfNeeded((uint64_t)a1, v25);
    if (!IfNeeded)
      return v10;
    v30 = *IfNeeded;
    v28 = 1;
    if ((*IfNeeded & 0x80000000) == 0)
    {
LABEL_45:
      v31 = v30 << 16 >> 48;
      if ((int)v31 >= 1)
      {
        if ((_DWORD)v31 != 1)
        {
          v14 = (uint64_t *)IfNeeded[1];
          return v14[2];
        }
        return IfNeeded[1];
      }
    }
    v20 = v25++ < v27;
  }
  while (v20);
  return v10;
}

uint64_t DDResultGetType(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

BOOL DDResultHasProperties(_BOOL8 result, uint64_t a2)
{
  if (result)
    return (a2 & ~*(_QWORD *)(result + 96)) == 0;
  return result;
}

void _DDResultCFFinalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  v2 = (const void *)a1[7];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[8];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[9];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[10];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[11];
  if (v6)
    CFRelease(v6);
}

BOOL DDResultHasType(uint64_t a1, const __CFString *a2)
{
  return a1 && a2 && _typesAreEqual(*(CFStringRef *)(a1 + 64), a2);
}

uint64_t DDDFACacheCreateFromFramework()
{
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  CFBundleRef v4;
  CFBundleRef v5;
  uint64_t v6;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.datadetectorscore"));
  if (!BundleWithIdentifier)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v8 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    v14 = 138412290;
    v15 = CFSTR("com.apple.datadetectorscore");
    v9 = "Could not locate the DDCore bundle %@, aborting. It's either not here or you ran out of file descriptors.";
    v10 = v8;
    v11 = 12;
LABEL_13:
    _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, v11);
    return 0;
  }
  v1 = CFBundleCopyBuiltInPlugInsURL(BundleWithIdentifier);
  if (!v1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v12 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(v14) = 0;
    v9 = "Could not locate the plugins in the DDCore bundle";
    v10 = v12;
    v11 = 2;
    goto LABEL_13;
  }
  v2 = v1;
  v3 = CFURLCreateCopyAppendingPathComponent(0, v1, CFSTR("PhoneNumbers.plugin"), 1u);
  CFRelease(v2);
  v4 = CFBundleCreate(0, v3);
  if (v4)
  {
    v5 = v4;
    CFRelease(v3);
    v6 = DDDFACacheCreateFromBundle(v5);
    CFRelease(v5);
    return v6;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v13 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = (const __CFString *)v3;
    _os_log_error_impl(&dword_19BC07000, v13, OS_LOG_TYPE_ERROR, "Could not load the plugin %@", (uint8_t *)&v14, 0xCu);
  }
  CFRelease(v3);
  return 0;
}

uint64_t DDDFACacheCreateFromBundle(void *a1)
{
  CFTypeID v2;
  uint64_t Instance;
  uint64_t (*FunctionPointerForName)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t (*v7)(void);
  uint64_t (*v8)(void);
  int v9;
  const __CFURL *v10;
  const __CFURL *v11;
  int v12;
  uint64_t v13;
  int *v14;
  char *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  const char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  unsigned __int16 *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  stat v38;
  UInt8 buffer[1024];
  uint8_t buf[4];
  _BYTE v41[10];
  char *v42;
  _BYTE v43[10];
  __int16 v44;
  uint64_t (*v45)(void);
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = DDTypeRegister(&DDDFACacheGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(0, v2, 0x50uLL);
  *(_QWORD *)(Instance + 88) = a1;
  CFRetain(a1);
  FunctionPointerForName = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, CFSTR("GetPrefixInitialState"));
  v5 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, CFSTR("GetSuffixInitialState"));
  v6 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, CFSTR("GetVersion"));
  v7 = (uint64_t (*)(void))CFBundleGetFunctionPointerForName((CFBundleRef)a1, CFSTR("GetResultPostprocessor"));
  v8 = v7;
  if (!FunctionPointerForName || !v5 || !v6 || !v7)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v41 = FunctionPointerForName;
    *(_WORD *)&v41[8] = 2048;
    v42 = (char *)v5;
    *(_WORD *)v43 = 2048;
    *(_QWORD *)&v43[2] = v6;
    v44 = 2048;
    v45 = v8;
    v16 = "Missing function when loading DFA cache (%p, %p, %p, %p)";
    v17 = v19;
    v18 = 42;
    goto LABEL_27;
  }
  v9 = v6();
  if (v9 != 7)
  {
    v20 = v9;
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = 7;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v20;
    v16 = "Could not load the DFA plugin. Version expected = %d, found = %d";
LABEL_21:
    v17 = v21;
    v18 = 14;
LABEL_27:
    _os_log_error_impl(&dword_19BC07000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_67;
  }
  *(_QWORD *)(Instance + 64) = FunctionPointerForName();
  *(_QWORD *)(Instance + 72) = v5();
  *(_QWORD *)(Instance + 80) = v8();
  v10 = CFBundleCopyResourceURL((CFBundleRef)a1, CFSTR("main"), CFSTR("cache"), 0);
  if (!v10)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v16 = "Could not find the cache in the DFA plugin";
LABEL_26:
    v17 = v22;
    v18 = 2;
    goto LABEL_27;
  }
  v11 = v10;
  v12 = CFURLGetFileSystemRepresentation(v10, 1u, buffer, 1024);
  CFRelease(v11);
  if (!v12)
  {
LABEL_67:
    CFRelease((CFTypeRef)Instance);
    return 0;
  }
  memset(&v38, 0, sizeof(v38));
  if (stat((const char *)buffer, &v38))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v13 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v14 = __error();
    v15 = strerror(*v14);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v41 = buffer;
    *(_WORD *)&v41[8] = 2080;
    v42 = v15;
    v16 = "Could not stat %s: %s, aborting";
    v17 = v13;
    v18 = 22;
    goto LABEL_27;
  }
  if (v38.st_size >= 0x1000000)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v16 = "Cache file too big";
    goto LABEL_26;
  }
  v23 = DDmmap((const char *)buffer, (void *)v38.st_size);
  if (!v23)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v16 = "DataDetectorsCore: mmapping the DFA cache failed";
    goto LABEL_26;
  }
  *(_QWORD *)(Instance + 16) = v23;
  *(_OWORD *)(Instance + 24) = *v23;
  if (*(unsigned __int16 *)(Instance + 24) != 48862)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v16 = "Could not load DFA cache. Wrong magic number.";
    goto LABEL_26;
  }
  if (*(_WORD *)(Instance + 26) != 7)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v34 = *(unsigned __int16 *)(Instance + 26);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = 7;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v34;
    v16 = "Could not load DFA cache. Version expected = %d, found = %d";
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(Instance + 38) >= *(unsigned __int16 *)(Instance + 32))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v21 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v35 = *(unsigned __int16 *)(Instance + 38);
    v36 = *(unsigned __int16 *)(Instance + 32);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = v35;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v36;
    v16 = "Simplified cache header sanity check failed (%d >= %d)";
    goto LABEL_21;
  }
  v24 = (const char *)(v23 + 1);
  *(_QWORD *)(Instance + 40) = malloc_type_malloc(8 * *(unsigned __int16 *)(Instance + 34), 0x6004044C4A2DFuLL);
  LODWORD(v25) = *(unsigned __int16 *)(Instance + 34);
  if (*(_WORD *)(Instance + 34))
  {
    v26 = 0;
    do
    {
      *(_QWORD *)(*(_QWORD *)(Instance + 40) + 8 * v26) = CFStringCreateWithCString(0, v24, 0x600u);
      v24 += 128;
      ++v26;
      v25 = *(unsigned __int16 *)(Instance + 34);
    }
    while (v26 < v25);
  }
  *(_QWORD *)(Instance + 48) = v24;
  if (*(unsigned __int16 *)v24 >= *(unsigned __int16 *)(Instance + 36)
    || *((unsigned __int16 *)v24 + 1) >= v25)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_WORD *)buf = 0;
    v16 = "DFA cache states sanity check failed";
    goto LABEL_26;
  }
  v27 = *(unsigned __int16 *)(Instance + 32);
  v28 = (unsigned __int16 *)&v24[8 * v27];
  *(_QWORD *)(Instance + 56) = v28;
  if (v28[1] <= *v28 || v28[3] >= v27)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v29 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v30 = *(unsigned __int16 **)(Instance + 56);
    v31 = v30[1];
    v32 = *v30;
    LODWORD(v30) = v30[3];
    v33 = *(unsigned __int16 *)(Instance + 32);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v41 = v31;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = (_DWORD)v30;
    HIWORD(v42) = 1024;
    *(_DWORD *)v43 = v33;
    v16 = "Simplified cache transitions sanity check failed (%d, %d, %d, %d)";
    v17 = v29;
    v18 = 26;
    goto LABEL_27;
  }
  return Instance;
}

void *DDmmap(const char *a1, void *a2)
{
  int v4;
  int v5;
  NSObject *v6;
  int *v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = open(a1, 0);
  if (v4 == -1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v6 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v8 = __error();
      v9 = strerror(*v8);
      v10 = 136315138;
      v11 = v9;
      _os_log_error_impl(&dword_19BC07000, v6, OS_LOG_TYPE_ERROR, "DDCache: could not open file descriptor to mmap cache file. Error %s", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  else
  {
    v5 = v4;
    if (a2)
      a2 = _DDmmap((uint64_t)a1, v4, (size_t)a2);
    close(v5);
  }
  return a2;
}

void *_DDmmap(uint64_t a1, int a2, size_t a3)
{
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v10;
  int *v11;
  char *v12;
  int *v13;
  char *v14;
  _QWORD block[5];
  uint8_t buf[4];
  char *v17;
  statfs v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(&v18, 0, 512);
  if (fstatfs(a2, &v18))
    return 0;
  if ((v18.f_flags & 0x1000) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___DDmmap_block_invoke;
    block[3] = &__block_descriptor_tmp_1787;
    block[4] = a1;
    if (_DDmmap_sOnce == -1)
      return 0;
    dispatch_once(&_DDmmap_sOnce, block);
    return 0;
  }
  v7 = mmap(0, a3, 1, 2, a2, 0);
  if (v7 == (void *)-1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 136315138;
      v17 = v12;
      _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "DDCache: mmap failed with error %s", buf, 0xCu);
    }
    return 0;
  }
  v6 = v7;
  if (madvise(v7, a3, 1))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v8 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 136315138;
      v17 = v14;
      _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "DDCache: madvise failed with error %s", buf, 0xCu);
    }
  }
  return v6;
}

uint64_t DDDFAScannerCreateFromCache(const void *a1)
{
  CFTypeID v2;
  uint64_t Instance;

  v2 = DDTypeRegister(&DDDFAScannerGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(0, v2, 0x20uLL);
  *(_QWORD *)(Instance + 24) = a1;
  CFRetain(a1);
  *(_QWORD *)(Instance + 32) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  return Instance;
}

uint64_t DDInsertResultRec(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  CFIndex Count;
  uint64_t v16;
  CFIndex v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *ValueAtIndex;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  BOOL v43;
  int v44;
  CFStringRef *ScannerResult;
  uint64_t v46;
  const __CFString *v47;
  _BOOL4 v48;
  const __CFString *v49;
  _BOOL4 v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  CFStringRef *v56;
  CFStringRef *v57;
  uint64_t v58;
  int v60;
  CFStringRef *cf;
  uint64_t v62;

  v10 = a1;
  if (*(__int16 *)(a3 + 14) < 0)
    goto LABEL_102;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a3 + 14) + 11) & 4) != 0)
  {
    v11 = *(unsigned int *)(a3 + 8);
    v12 = (unint64_t)(v11 << 40 >> 24) >> 16;
    a5 = ((_DWORD)v12 << 16) | (*(_QWORD *)a3 << 32);
    a6 = ((v12 + ((unint64_t)(int)v11 >> 24)) << 16) | *(_QWORD *)a3 & 0xFFFFFFFF00000000;
  }
  if (*(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a3 + 14)) == -1)
  {
LABEL_102:
    v51 = *(unsigned __int8 *)(a3 + 13);
    if (*(_BYTE *)(a3 + 13))
    {
      v52 = 0;
      if (((*(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int8 *)(a3 + 12) << 32)) & 0x100000000) != 0)
        v53 = a3 + 48;
      else
        v53 = a3 + 24;
      v54 = 1;
      do
      {
        if (DDInsertResultRec(v10, a2, *(_QWORD *)(v53 + 8 * v52), a4, a5, a6))
          break;
        v54 = ++v52 < v51;
      }
      while (v51 != v52);
    }
    else
    {
      return 0;
    }
    return v54;
  }
  if ((int)a5 >> 16 == -1)
  {
    v13 = *(unsigned int *)(a2 + 8);
    v14 = (unint64_t)(v13 << 40 >> 24) >> 16;
    a5 = ((_DWORD)v14 << 16) | (*(_QWORD *)a2 << 32);
    a6 = ((v14 + ((unint64_t)(int)v13 >> 24)) << 16) | *(_QWORD *)a2 & 0xFFFFFFFF00000000;
  }
  if ((*(_BYTE *)(a1 + 195) & 0x20) != 0 || (Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 168)), Count < 1))
  {
    v56 = 0;
    goto LABEL_114;
  }
  v58 = a4;
  cf = 0;
  v62 = v10;
  v16 = (uint64_t)(int)a5 >> 16;
  v17 = Count + 1;
  v18 = HIDWORD(a6);
  v60 = 1;
  v19 = (uint64_t)(int)a6 >> 16;
  while (1)
  {
    v20 = v19;
    v21 = v18;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v10 + 168), v17 - 2);
    v23 = *((_QWORD *)ValueAtIndex + 6);
    v25 = *((_QWORD *)ValueAtIndex + 14);
    v24 = *((_QWORD *)ValueAtIndex + 15);
    v26 = (uint64_t)(int)v24 >> 16;
    v27 = HIDWORD(v24);
    if ((int)v16 >= (int)v26 && ((int)v16 > (int)v26 || SHIDWORD(a5) >= SHIDWORD(v24)))
      break;
    v29 = HIDWORD(v25);
    v30 = (uint64_t)(int)v25 >> 16;
    v31 = HIDWORD(a5) == HIDWORD(v25) && (_DWORD)v16 == (_DWORD)v30;
    v18 = v21;
    v32 = v31 && (_DWORD)v21 == HIDWORD(v24);
    v19 = v20;
    if (!v32 || (_DWORD)v20 != (_DWORD)v26)
    {
      if (SHIDWORD(a5) >= SHIDWORD(v25))
        v34 = *((_QWORD *)ValueAtIndex + 14);
      else
        v34 = a5;
      if ((int)v30 < (int)v16)
        v34 = *((_QWORD *)ValueAtIndex + 14);
      if ((int)v30 <= (int)v16)
        v35 = v34;
      else
        v35 = a5;
      if ((int)v21 >= SHIDWORD(v24))
        v36 = a6;
      else
        v36 = *((_QWORD *)ValueAtIndex + 15);
      if ((int)v20 > (int)v26)
        v36 = a6;
      if ((int)v20 < (int)v26)
        v36 = *((_QWORD *)ValueAtIndex + 15);
      if (HIDWORD(a5) != HIDWORD(v35)
        || (_DWORD)v16 != (int)v35 >> 16
        || ((v31 = (_DWORD)v21 == HIDWORD(v36), v37 = (uint64_t)(int)v36 >> 16, v31)
          ? (v38 = (_DWORD)v20 == (_DWORD)v37)
          : (v38 = 0),
            !v38))
      {
        if (SHIDWORD(a5) >= SHIDWORD(v25))
          v39 = *((_QWORD *)ValueAtIndex + 14);
        else
          v39 = a5;
        if ((int)v30 >= (int)v16)
          v25 = v39;
        if ((int)v30 > (int)v16)
          v25 = a5;
        if ((int)v21 >= SHIDWORD(v24))
          v40 = a6;
        else
          v40 = *((_QWORD *)ValueAtIndex + 15);
        if ((int)v20 > (int)v26)
          v40 = a6;
        if ((int)v20 >= (int)v26)
          v24 = v40;
        v31 = (_DWORD)v29 == HIDWORD(v25);
        v41 = (uint64_t)(int)v25 >> 16;
        v43 = v31 && (_DWORD)v30 == (_DWORD)v41 && (_DWORD)v27 == HIDWORD(v24);
        v10 = v62;
        if (v43)
        {
          v31 = (_DWORD)v26 != (int)v24 >> 16;
          v44 = v60;
          if (!v31)
            v44 = 0;
          v60 = v44;
        }
        goto LABEL_94;
      }
LABEL_89:
      v10 = v62;
LABEL_90:
      if (*(_QWORD *)(v10 + 192) >> 31)
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v10 + 160), v17 - 2);
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v10 + 168), v17 - 2);
      goto LABEL_93;
    }
    ScannerResult = cf;
    if (!cf)
    {
      if (_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), CFSTR("Compatibility"))
        && (*(__int16 *)(a3 + 14) & 0x80000000) == 0
        && (v46 = *(_QWORD *)(v62 + 16),
            *(unsigned __int16 *)(*(_QWORD *)(v46 + 16) + 12 * *(unsigned __int16 *)(a3 + 14)) == *(unsigned __int16 *)(v62 + 234)))
      {
        ScannerResult = (CFStringRef *)DDLRResultCreateScannerResult(a3, v46, 0);
      }
      else
      {
        ScannerResult = 0;
      }
    }
    cf = ScannerResult;
    if (DDResultsCanShareRange(ScannerResult, (CFStringRef *)ValueAtIndex) || (*(_BYTE *)(v62 + 195) & 8) != 0)
      goto LABEL_80;
    if (v23 > v58 || v23 == v58 && !_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), CFSTR("Location")))
    {
      if (*(_DWORD *)(v62 + 248))
      {
        v49 = (const __CFString *)DDTypeForLRResult(*(_WORD *)(a3 + 14), *(_QWORD *)(v62 + 16));
        v50 = 0;
        if (ValueAtIndex && v49)
          v50 = _typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), v49);
        v60 = !v50;
      }
      else
      {
        v60 = 0;
      }
LABEL_80:
      v10 = v62;
      goto LABEL_93;
    }
    if (!*(_DWORD *)(v62 + 248))
      goto LABEL_89;
    v47 = (const __CFString *)DDTypeForLRResult(*(_WORD *)(a3 + 14), *(_QWORD *)(v62 + 16));
    if (!ValueAtIndex || !v47)
      goto LABEL_80;
    v48 = _typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), v47);
    v10 = v62;
    if (v48)
      goto LABEL_90;
LABEL_93:
    v18 = v21;
    v19 = v20;
LABEL_94:
    if ((unint64_t)--v17 <= 1)
      goto LABEL_113;
  }
  v10 = v62;
LABEL_113:
  a4 = v58;
  v56 = cf;
  if ((_BYTE)v60)
  {
LABEL_114:
    v57 = v56;
    DDInsertResultsFromTopLevelRec(v10, a2, a4, a5, a6, (uint64_t)v56);
    v56 = v57;
  }
  if (v56)
    CFRelease(v56);
  return 1;
}

void DDInsertResultsFromTopLevelRec(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;

  if (a6 && _typesAreEqual(*(CFStringRef *)(a6 + 64), CFSTR("Compatibility")))
  {
    v12 = a1;
    v13 = a2;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = (uint64_t *)a6;
LABEL_7:
    DDInsertResultsFromTopLevel(v12, v13, v14, v15, v16, v17);
    return;
  }
  if ((*(__int16 *)(a2 + 14) & 0x80000000) == 0
    && *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a2 + 14)) != -1)
  {
    v12 = a1;
    v13 = a2;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = 0;
    goto LABEL_7;
  }
  v18 = *(unsigned __int8 *)(a2 + 13);
  if (*(_BYTE *)(a2 + 13))
  {
    if (((*(unsigned int *)(a2 + 8) | ((unint64_t)*(unsigned __int8 *)(a2 + 12) << 32)) & 0x100000000) != 0)
      v19 = (uint64_t *)(a2 + 48);
    else
      v19 = (uint64_t *)(a2 + 24);
    do
    {
      v20 = *v19++;
      DDInsertResultsFromTopLevelRec(a1, v20, a3, a4, a5, 0);
      --v18;
    }
    while (v18);
  }
}

void DDInsertResultsFromTopLevel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t *a6)
{
  uint64_t *v12;
  void *ScannerResult;
  CFIndex Count;
  CFIndex v15;
  uint64_t v16;
  unint64_t v17;
  CFIndex v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v23;

  v12 = a6;
  if (!a6)
  {
    ScannerResult = (void *)DDLRResultCreateScannerResult(a2, *(_QWORD *)(a1 + 16), 0);
    v12 = (uint64_t *)ScannerResult;
    if (*(__int16 *)(a1 + 234) == -1
      && ScannerResult
      && _typesAreEqual(*((CFStringRef *)ScannerResult + 8), CFSTR("Compatibility"))
      && (*(__int16 *)(a2 + 14) & 0x80000000) == 0)
    {
      *(_WORD *)(a1 + 234) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 12 * *(unsigned __int16 *)(a2 + 14));
    }
  }
  v12[14] = a4;
  v12[15] = a5;
  DDResultSetContent(v12, *(void **)(a1 + 56));
  if (a3 >= 1)
    v12[6] = a3;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 168));
  if (Count < 1)
  {
LABEL_13:
    v15 = 0;
  }
  else
  {
    v15 = Count;
    v16 = (uint64_t)(int)a5 >> 16;
    v17 = HIDWORD(a5);
    while (1)
    {
      v18 = v15 - 1;
      v19 = *((_QWORD *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 168), v15 - 1) + 3);
      v20 = (uint64_t)(int)v19 >> 16;
      if ((int)v20 < (int)v16)
        break;
      v21 = HIDWORD(v19);
      if ((int)v20 <= (int)v16 && (int)v21 < (int)v17)
        break;
      --v15;
      if ((unint64_t)(v18 + 1) <= 1)
        goto LABEL_13;
    }
  }
  if (*(_QWORD *)(a1 + 192) >> 31)
  {
    v23 = (uint64_t *)DDLRResultCreateScannerResult(a2, *(_QWORD *)(a1 + 16), 1);
    DDResultSetContent(v23, *(void **)(a1 + 56));
    if (a3 >= 1)
      v23[6] = a3;
    CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 160), v15, v23);
    CFRelease(v23);
  }
  CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 168), v15, v12);
  if (!a6)
  {
    if (v12)
      CFRelease(v12);
  }
}

void DDResultSetContent(uint64_t *a1, void *a2)
{
  uint64_t v4;
  const __CFArray *v5;
  CFRange v6;

  a1[9] = (uint64_t)DDScanQueryCopyRange((uint64_t)a2, a1[2], a1[3]);
  a1[4] = DDScanQueryComputeCFRangeForQueryRange((uint64_t)a2, a1[2]);
  a1[5] = v4;
  v5 = (const __CFArray *)a1[7];
  if (v5)
  {
    v6.length = CFArrayGetCount(v5);
    v6.location = 0;
    CFArrayApplyFunction(v5, v6, (CFArrayApplierFunction)DDResultSetContent, a2);
  }
}

CFStringRef DDScanQueryCopyRange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFCharacterSet *Predefined;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  uint64_t v17;
  const __CFString *v18;
  CFIndex Length;
  CFIndex v20;
  NSObject *v21;
  const __CFString *v22;
  CFIndex v23;
  unsigned int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFMutableStringRef theString;
  _BYTE result[22];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  CFIndex v36;
  uint64_t v37;
  CFRange v38;
  CFRange v39;
  CFRange v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;

  v5 = a1;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t)(int)a2 >> 16;
  v7 = (uint64_t)(int)a3 >> 16;
  v30 = v7;
  if ((_DWORD)v6 == (_DWORD)v7)
  {
    v8 = *(_QWORD *)(a1 + 16) + 48 * (int)v6;
    *(_QWORD *)result = 0;
    *(_QWORD *)&result[8] = 0;
    if ((*(_BYTE *)(v8 + 43) & 0x60) == 0
      || (v9 = *(const __CFString **)v8,
          Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline),
          v38.location = a2 >> 32,
          v38.length = (uint64_t)(a3 - (a2 & 0xFFFFFFFF00000000)) >> 32,
          !CFStringFindCharacterFromSet(v9, Predefined, v38, 0, (CFRange *)result)))
    {
      v40.location = a2 >> 32;
      v40.length = (uint64_t)(a3 - (a2 & 0xFFFFFFFF00000000)) >> 32;
      return CFStringCreateWithSubstring(0, *(CFStringRef *)v8, v40);
    }
    v7 = v30;
  }
  theString = CFStringCreateMutable(0, 0);
  if (v6 <= v7)
  {
    v11 = 0;
    v28 = a3 >> 32;
    v29 = a2 >> 32;
    v12 = 48 * (int)v6 + 40;
    v27 = v7 + 1;
    v26 = v5;
    v13 = v7;
    do
    {
      v14 = *(_QWORD *)(v5 + 16);
      v15 = v14 + v12;
      v16 = v29;
      if (v11)
        v16 = *(_QWORD *)(v15 - 24);
      v17 = v28;
      if (v13 != v6)
        v17 = *(_QWORD *)(v14 + v12 - 16) + *(_QWORD *)(v14 + v12 - 24);
      v18 = *(const __CFString **)(v15 - 40);
      if (v18)
        Length = CFStringGetLength(v18);
      else
        Length = 0;
      v20 = v17 - v16;
      if (v17 <= Length)
        goto LABEL_32;
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v21 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)result = 134218752;
        *(_QWORD *)&result[4] = v16;
        *(_WORD *)&result[12] = 2048;
        *(_QWORD *)&result[14] = v17 - v16;
        v33 = 2048;
        v34 = v17;
        v35 = 2048;
        v36 = Length;
        _os_log_impl(&dword_19BC07000, v21, OS_LOG_TYPE_DEFAULT, "Inconsistent range {%ld, %ld} (i.e. max=%ld) for string of length %ld, trying to recover by truncating the string.", result, 0x2Au);
      }
      v20 = Length - v16;
      v5 = v26;
      if (Length >= v16)
      {
LABEL_32:
        if (v20 >= 1)
        {
          v39.location = v16;
          v39.length = v20;
          v22 = CFStringCreateWithSubstring(0, *(CFStringRef *)(v15 - 40), v39);
          v23 = CFStringGetLength(theString);
          CFStringAppend(theString, v22);
          CFRelease(v22);
          if ((*(_BYTE *)(v14 + v12 + 3) & 0x40) != 0)
          {
            v41.length = CFStringGetLength(theString) - v23;
            v41.location = v23;
            CFStringFindAndReplace(theString, CFSTR("\r\n"), CFSTR(" "), v41, 0);
            v42.length = CFStringGetLength(theString) - v23;
            v42.location = v23;
            CFStringFindAndReplace(theString, CFSTR("\n\r"), CFSTR(" "), v42, 0);
            v43.length = CFStringGetLength(theString) - v23;
            v43.location = v23;
            CFStringFindAndReplace(theString, CFSTR("\n"), CFSTR(" "), v43, 0);
          }
        }
      }
      v13 = v30;
      if (v6 < v30)
      {
        v24 = ((*(_DWORD *)(v14 + v12) >> 26) & 7) - 1;
        if (v24 <= 3)
          CFStringAppend(theString, off_1E3C952F8[v24]);
      }
      ++v6;
      v12 += 48;
      --v11;
    }
    while (v27 != v6);
  }
  return theString;
}

uint64_t DDScanQueryComputeCFRangeForQueryRange(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == 1)
    return a2 >> 32;
  else
    return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 48 * ((int)a2 >> 16) + 32)
         + (a2 >> 32)
         - *(_QWORD *)(*(_QWORD *)(a1 + 16) + 48 * ((int)a2 >> 16) + 16);
}

CFTypeRef DDLRResultCreateScannerResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6;
  CFArrayRef *Instance;
  const void *ValueAtIndex;
  CFTypeRef v9;

  v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  Instance = (CFArrayRef *)DDTypeCreateInstance_(0, v6, 0x60uLL);
  collectSubResultsInResult(a1, (uint64_t)Instance, a2, 1, a3);
  ValueAtIndex = CFArrayGetValueAtIndex(Instance[7], 0);
  v9 = CFRetain(ValueAtIndex);
  CFRelease(Instance);
  return v9;
}

void collectSubResultsInResult(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  const __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  const void *UniqueSymbolStringAtOffset;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  const void *v26;
  const void *v27;
  unint64_t v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  if (*(__int16 *)(a1 + 14) < 0)
  {
    if (!(_DWORD)a5)
    {
      v19 = a2;
      goto LABEL_22;
    }
LABEL_7:
    v11 = 0;
    v13 = CFSTR("terminal");
LABEL_8:
    v14 = *(unsigned int *)(a1 + 8);
    v15 = (unint64_t)(v14 << 40 >> 24) >> 16;
    v16 = ((_DWORD)v15 << 16) | (*(_QWORD *)a1 << 32);
    v17 = ((v15 + ((unint64_t)(int)v14 >> 24)) << 16) | *(_QWORD *)a1 & 0xFFFFFFFF00000000;
    if (a4)
      v18 = DDRootResultCreate(v13, v16, v17);
    else
      v18 = DDResultCreate(v13, v16, v17);
    v19 = (uint64_t)v18;
    DDResultAddSubresult(a2, v18);
    CFRelease((CFTypeRef)v19);
    if (!v11)
      goto LABEL_22;
LABEL_14:
    v12 = *v11;
    if (v12 == 0xFFFF)
      goto LABEL_19;
    goto LABEL_15;
  }
  v10 = *(_QWORD *)(a3 + 16);
  v11 = (unsigned __int16 *)(v10 + 12 * *(unsigned __int16 *)(a1 + 14));
  if (!(_DWORD)a5)
  {
    v19 = a2;
    if (!v11)
      goto LABEL_22;
    goto LABEL_14;
  }
  if (!v10)
    goto LABEL_7;
  v12 = *v11;
  if (v12 == 0xFFFF)
  {
    v13 = CFSTR("internal");
    goto LABEL_8;
  }
LABEL_15:
  UniqueSymbolStringAtOffset = DDLRTableGetUniqueSymbolStringAtOffset(a3, (const void *)v12);
  v21 = *(unsigned int *)(a1 + 8);
  v22 = (unint64_t)(v21 << 40 >> 24) >> 16;
  v23 = ((_DWORD)v22 << 16) | (*(_QWORD *)a1 << 32);
  v24 = ((v22 + ((unint64_t)(int)v21 >> 24)) << 16) | *(_QWORD *)a1 & 0xFFFFFFFF00000000;
  if (a4)
    v25 = DDRootResultCreate(UniqueSymbolStringAtOffset, v23, v24);
  else
    v25 = DDResultCreate(UniqueSymbolStringAtOffset, v23, v24);
  v19 = (uint64_t)v25;
  DDResultAddSubresult(a2, v25);
  CFRelease((CFTypeRef)v19);
LABEL_19:
  v26 = (const void *)v11[1];
  if (v26 != (const void *)0xFFFF)
  {
    v27 = DDLRTableGetUniqueSymbolStringAtOffset(a3, v26);
    DDResultSetValue(v19, v27);
  }
LABEL_22:
  v28 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32);
  if ((v28 & 0x200000000) != 0 && v19)
  {
    *(_DWORD *)(v19 + 108) = *(_DWORD *)(a1 + 24);
    *(_BYTE *)(v19 + 104) = 1;
    v28 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32);
  }
  if ((v28 & 0x800000000) != 0)
  {
    v29 = (__CFString *)CFStringCreateWithCString(0, *(const char **)(a1 + 32), 0x8000100u);
    if (v29)
    {
      v30 = v29;
      DDResultAppendContextualData(v19, v29, CFSTR("D"));
      CFRelease(v30);
    }
  }
  if (((*(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32)) & 0x400000000) != 0)
  {
    v31 = (__CFString *)CFStringCreateWithCString(0, *(const char **)(a1 + 40), 0x8000100u);
    if (v31)
    {
      v32 = v31;
      DDResultAppendContextualData(v19, v31, CFSTR("U"));
      CFRelease(v32);
    }
  }
  if (((*(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int8 *)(a1 + 12) << 32)) & 0x100000000) != 0)
    v33 = a1 + 48;
  else
    v33 = a1 + 24;
  v34 = *(unsigned __int8 *)(a1 + 13);
  if (v34)
  {
    v35 = v33 - 8;
    do
      collectSubResultsInResult(*(_QWORD *)(v35 + 8 * v34), v19, a3, 0, a5);
    while (v34-- > 1);
  }
}

const void *DDLRTableGetUniqueSymbolStringAtOffset(uint64_t a1, const void *a2)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (!Value)
  {
    Value = CFStringCreateWithPascalString(0, (ConstStr255Param)a2 + *(_QWORD *)(a1 + 40), 0x8000100u);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), a2, Value);
    CFRelease(Value);
  }
  return Value;
}

void DDResultAddSubresult(uint64_t a1, void *value)
{
  __CFArray *Mutable;

  Mutable = *(__CFArray **)(a1 + 56);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    *(_QWORD *)(a1 + 56) = Mutable;
  }
  CFArrayAppendValue(Mutable, value);
}

_QWORD *DDResultCreate(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6;
  _QWORD *Instance;

  v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  Instance = (_QWORD *)DDTypeCreateInstance_(0, v6, 0x60uLL);
  Instance[2] = a2;
  Instance[3] = a3;
  if (a1)
    Instance[8] = CFRetain(a1);
  Instance[12] = 1;
  return Instance;
}

uint64_t DDTypeRegister(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    pthread_mutex_lock(&DDTypeRegister_lock);
    if (!*a1)
      *a1 = _CFRuntimeRegisterClass();
    pthread_mutex_unlock(&DDTypeRegister_lock);
    return *a1;
  }
  return result;
}

uint64_t DDTypeCreateInstance_(uint64_t a1, CFTypeID a2, size_t a3)
{
  uint64_t Instance;
  uint64_t v6;
  CFStringRef v7;
  NSObject *v8;
  int v10;
  CFStringRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v6 = Instance;
    bzero((void *)(Instance + 16), a3);
  }
  else
  {
    v7 = CFCopyTypeIDDescription(a2);
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v8 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "Failed to create instance of type %@", (uint8_t *)&v10, 0xCu);
    }
    CFRelease(v7);
    return 0;
  }
  return v6;
}

_QWORD *DDRootResultCreate(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID v6;
  _QWORD *Instance;

  v6 = DDTypeRegister(&DDResultGetTypeID_typeID);
  Instance = (_QWORD *)DDTypeCreateInstance_(0, v6, 0x70uLL);
  Instance[2] = a2;
  Instance[3] = a3;
  if (a1)
    Instance[8] = CFRetain(a1);
  Instance[12] = 262145;
  return Instance;
}

void DDResultSetValue(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 80);
  if (v3 != cf)
  {
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 80) = 0;
    }
    if (cf)
      *(_QWORD *)(a1 + 80) = CFRetain(cf);
  }
}

uint64_t _DDDFAScannerCFInit(uint64_t result)
{
  *(_BYTE *)(result + 16) = 0;
  return result;
}

void DDResultDisableURLSchemeChecking()
{
  if ((_schemeCheckingDisabled & 1) == 0)
    _schemeCheckingDisabled = 1;
}

void DDGlobalFilterBlocks_block_invoke_14(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v4;
  uint64_t i;
  CFStringRef *ValueAtIndex;
  const void *v7;
  const void *v8;

  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i < v4; ++i)
    {
      ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(theArray, i);
      if (_typesAreEqual(ValueAtIndex[8], CFSTR("FullAddress"))
        && !DDResultGetSubresultWithType((uint64_t)ValueAtIndex, CFSTR("Street")))
      {
        if (i < 1
          || (v7 = CFArrayGetValueAtIndex(theArray, i - 1),
              !DDAddressResultCanBeMergedWith((uint64_t)ValueAtIndex, (uint64_t)v7)))
        {
          if (i >= v4 - 1
            || (v8 = CFArrayGetValueAtIndex(theArray, i + 1),
                !DDAddressResultCanBeMergedWith((uint64_t)ValueAtIndex, (uint64_t)v8)))
          {
            CFArrayRemoveValueAtIndex(theArray, i--);
            --v4;
          }
        }
      }
    }
  }
}

void DDGlobalFilterBlocks_block_invoke_16(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  unint64_t v4;
  const void *ValueAtIndex;
  const __CFArray *v6;
  CFIndex v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  CFIndex v13;
  _OWORD v14[5];
  uint64_t v15;
  CFRange v16;
  CFRange v17;

  v15 = *MEMORY[0x1E0C80C00];
  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v4 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v4 - 2);
      if (_typesAreEqual(CFSTR("BoxedResults"), *((const __CFString **)ValueAtIndex + 8)))
      {
        v6 = (const __CFArray *)*((_QWORD *)ValueAtIndex + 7);
        v7 = CFArrayGetCount(v6);
        if (v6)
          v12 = v7 < 1;
        else
          v12 = 1;
        if (v12)
        {
          CFArrayRemoveValueAtIndex(theArray, v4 - 2);
        }
        else
        {
          v13 = v7;
          if ((unint64_t)v7 >= 0xB)
          {
            DDLogErrD(v7, v8, v9, v10, v11, CFSTR("More than 10 boxed results. Ignoring aditional results..."));
            v13 = 10;
          }
          memset(v14, 0, sizeof(v14));
          v16.location = 0;
          v16.length = v13;
          CFArrayGetValues(v6, v16, (const void **)v14);
          CFRetain(ValueAtIndex);
          v17.location = v4 - 2;
          v17.length = 1;
          CFArrayReplaceValues(theArray, v17, (const void **)v14, v13);
          CFRelease(ValueAtIndex);
        }
      }
      --v4;
    }
    while (v4 > 1);
  }
}

void DDUnwrapCompatibility(const __CFArray *a1, int a2)
{
  CFIndex Count;
  uint64_t v5;
  CFIndex v6;
  CFStringRef *ValueAtIndex;
  CFStringRef *v8;
  const __CFArray *v9;
  CFIndex v10;
  uint64_t v11;
  const void *v12;
  CFIndex i;
  const void *v14;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    do
    {
      ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(a1, v6);
      if (ValueAtIndex)
      {
        v8 = ValueAtIndex;
        if (_typesAreEqual(ValueAtIndex[8], CFSTR("Compatibility")))
        {
          v9 = (const __CFArray *)v8[7];
          v10 = CFArrayGetCount(v9);
          v11 = v10;
          if (a2 || v10 != 1)
          {
            CFArrayRemoveValueAtIndex(a1, v6);
            if (v11 < 1)
            {
              --v5;
            }
            else
            {
              for (i = 0; i != v11; ++i)
              {
                v14 = CFArrayGetValueAtIndex(v9, i);
                CFArrayInsertValueAtIndex(a1, v6 + i, v14);
              }
              v6 += i;
              v5 = v11 + v5 - 1;
            }
            continue;
          }
          v12 = CFArrayGetValueAtIndex(v9, 0);
          CFArraySetValueAtIndex(a1, v6, v12);
        }
      }
      ++v6;
    }
    while (v6 < v5);
  }
}

uint64_t _DDResultValueUnitExtraction(uint64_t result, double *a2, unint64_t a3, CFTypeRef *a4)
{
  uint64_t v7;
  _BOOL4 v8;
  const __CFString **SubresultWithType;
  const __CFString *v10;
  const __CFString **v11;
  const __CFString *v12;
  const __CFString **v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  char v18;
  uint64_t v19;
  double v20;
  double v21;
  const __CFString **v22;
  const __CFString *v23;
  CFIndex Length;
  const __CFString **v25;
  const __CFString *v26;
  double v27;
  const __CFString **v28;
  double v29;
  const __CFArray *v30;
  uint64_t v31;
  const __CFString *Value;
  CFTypeRef v33;
  CFIndex Count;
  const void *ValueAtIndex;
  CFTypeRef v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFRange v41;

  if (!result)
    return result;
  v7 = result;
  v8 = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("Money"));
  if (!v8)
  {
    result = _typesAreEqual(*(CFStringRef *)(v7 + 64), CFSTR("PhysicalAmount"));
    if (!(_DWORD)result)
      return result;
  }
  SubresultWithType = DDResultGetSubresultWithType(v7, CFSTR("IntegralValue"));
  if (SubresultWithType)
  {
    v10 = SubresultWithType[10];
    if (!v10)
      v10 = SubresultWithType[9];
  }
  else
  {
    v10 = 0;
  }
  v11 = DDResultGetSubresultWithType(v7, CFSTR("Denominator"));
  if (!v11)
  {
    v15 = 0;
    v12 = 0;
LABEL_15:
    v14 = 0;
    goto LABEL_18;
  }
  v12 = v11[10];
  if (!v12)
  {
    v12 = v11[9];
    if (!v12)
    {
      v15 = 0;
      goto LABEL_15;
    }
  }
  v13 = DDResultGetSubresultWithType(v7, CFSTR("Numerator"));
  if (v13)
  {
    v14 = v13[10];
    if (!v14)
      v14 = v13[9];
  }
  else
  {
    v14 = 0;
  }
  v15 = 1;
LABEL_18:
  if (v8)
    v16 = CFSTR("Currency");
  else
    v16 = CFSTR("Unit");
  result = (uint64_t)DDResultGetSubresultWithType(v7, v16);
  if (result)
  {
    v17 = *(const __CFString **)(result + 80);
    if (!v17)
    {
      v17 = *(const __CFString **)(result + 72);
      if (!v17)
        return 0;
    }
    v18 = v15 ^ 1;
    if (v10)
      v18 = 0;
    if ((v18 & 1) != 0)
      return 0;
    if (!a2)
      goto LABEL_55;
    v39 = 0;
    v40 = 0;
    v38 = 1;
    if (v15)
    {
      v37 = 1;
      if ((DDExtractSimpleInteger(v12, &v37) & 1) != 0 || DDExtractKanjiNumber(v12, &v37))
      {
        v19 = v37;
        if (((DDExtractSimpleInteger(v14, &v39) & 1) != 0 || DDExtractKanjiNumber(v14, &v39))
          && (!v10 || (DDExtractSimpleInteger(v10, &v40) & 1) != 0 || DDExtractKanjiNumber(v10, &v40)))
        {
          v20 = (double)v19;
          v21 = 1.0;
LABEL_52:
          v27 = (double)v39 / v20 + (double)v40;
          v28 = DDResultGetSubresultWithType(v7, CFSTR("Negative"));
          v29 = -(v27 * v21);
          if (!v28)
            v29 = v27 * v21;
          *a2 = v29;
LABEL_55:
          if (!(a3 | (unint64_t)a4))
            return 1;
          if (!v8 || CFStringFind(v17, CFSTR("-"), 0).location == -1)
          {
            if (a4)
            {
              result = (uint64_t)CFStringCreateArrayBySeparatingStrings(0, v17, CFSTR("-"));
              if (!result)
                return result;
              *a4 = CFAutorelease((CFTypeRef)result);
            }
            if (a3)
            {
              v33 = CFRetain(v17);
              *(_QWORD *)a3 = CFAutorelease(v33);
            }
            return 1;
          }
          result = (uint64_t)CFStringCreateArrayBySeparatingStrings(0, v17, CFSTR("-"));
          if (!result)
            return result;
          v30 = (const __CFArray *)result;
          v31 = *(_QWORD *)(v7 + 96);
          if ((v31 & 0x20000) != 0)
          {
            Value = CFSTR("JPY");
          }
          else if ((v31 & 0x10000) != 0)
          {
            Value = CFSTR("CNY");
          }
          else
          {
            if (getLocaleForExtraction_sOnce != -1)
              dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
            if (!_sLocaleForExtraction)
            {
              if (!a3)
                goto LABEL_81;
              CFArrayGetCount(v30);
LABEL_79:
              ValueAtIndex = CFArrayGetValueAtIndex(v30, 0);
              v36 = CFRetain(ValueAtIndex);
              Value = (const __CFString *)CFAutorelease(v36);
LABEL_80:
              *(_QWORD *)a3 = Value;
LABEL_81:
              if (a4)
                *a4 = CFAutorelease(v30);
              else
                CFRelease(v30);
              return 1;
            }
            Value = (const __CFString *)CFLocaleGetValue((CFLocaleRef)_sLocaleForExtraction, (CFLocaleKey)*MEMORY[0x1E0C9B068]);
          }
          if (!a3)
            goto LABEL_81;
          Count = CFArrayGetCount(v30);
          if (Value)
          {
            v41.length = Count;
            v41.location = 0;
            if (CFArrayContainsValue(v30, v41, Value))
              goto LABEL_80;
          }
          goto LABEL_79;
        }
      }
    }
    else
    {
      if ((DDExtractSimpleInteger(v10, &v40) & 1) == 0 && !DDExtractKanjiNumber(v10, &v40))
        return 0;
      v22 = DDResultGetSubresultWithType(v7, CFSTR("FractionalValue"));
      v21 = 1.0;
      v20 = 1.0;
      if (v22)
      {
        v23 = v22[10];
        if (v23 || (v23 = v22[9]) != 0)
        {
          if ((DDExtractSimpleInteger(v23, &v39) & 1) == 0 && !DDExtractKanjiNumber(v23, &v39))
            return 0;
          Length = CFStringGetLength(v23);
          v20 = __exp10((double)Length);
        }
      }
      v25 = DDResultGetSubresultWithType(v7, CFSTR("Multiplier"));
      if (!v25)
        goto LABEL_52;
      v26 = v25[10];
      if (!v26)
      {
        v26 = v25[9];
        if (!v26)
          goto LABEL_52;
      }
      if ((DDExtractSimpleInteger(v26, &v38) & 1) != 0 || DDExtractKanjiNumber(v26, &v38))
      {
        v21 = (double)v38;
        goto LABEL_52;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DDResultGetCategory(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  if (!a1)
    return 0;
  if (DDResultGetCategory_sOnce != -1)
    dispatch_once(&DDResultGetCategory_sOnce, &__block_literal_global_293);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v2 = *(const __CFString **)(a1 + 64);
  if (DDResultGetCategory_sOnce_46 != -1)
    dispatch_once(&DDResultGetCategory_sOnce_46, &__block_literal_global_48);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __DDResultGetCategory_block_invoke_3;
  block[3] = &unk_1E3C95060;
  block[4] = &v8;
  block[5] = v2;
  dispatch_sync((dispatch_queue_t)DDResultGetCategory_sQueue, block);
  v4 = *((unsigned int *)v9 + 6);
  if (!(_DWORD)v4)
  {
    if (_DDResultTypeIsAnyPhoneKind(v2))
    {
      v4 = 2;
    }
    else if (CFEqual(v2, CFSTR("FullAddress")))
    {
      v4 = 3;
    }
    else
    {
      if (DDResultGetCategory_sOnce_51 != -1)
        dispatch_once(&DDResultGetCategory_sOnce_51, &__block_literal_global_54);
      v6[0] = v3;
      v6[1] = 0x40000000;
      v6[2] = __DDResultGetCategory_block_invoke_5;
      v6[3] = &unk_1E3C950C8;
      v6[4] = &v8;
      v6[5] = v2;
      dispatch_sync((dispatch_queue_t)DDResultGetCategory_sQueue_52, v6);
      v4 = *((unsigned int *)v9 + 6);
      if (!(_DWORD)v4)
      {
        if (CFEqual(v2, CFSTR("TrackingNumber"))
          || CFEqual(v2, CFSTR("ItemNumber"))
          || CFEqual(v2, CFSTR("FlightInformation"))
          || CFEqual(v2, CFSTR("Parsec"))
          || CFEqual(v2, CFSTR("AuthCode"))
          || CFEqual(v2, CFSTR("PhysicalAmount"))
          || CFEqual(v2, CFSTR("GameCenter"))
          || CFEqual(v2, CFSTR("DomesticIdentifier"))
          || CFEqual(v2, CFSTR("UPIIdentifier")))
        {
          v4 = 5;
        }
        else if (CFEqual(v2, CFSTR("Money")))
        {
          v4 = 6;
        }
        else if (CFEqual(v2, CFSTR("Contact")))
        {
          v4 = 7;
        }
        else
        {
          v4 = 0;
        }
      }
    }
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

BOOL _DDResultTypeIsAnyPhoneKind(const __CFString *a1)
{
  return _typesAreEqual(a1, CFSTR("PhoneNumber"))
      || _typesAreEqual(a1, CFSTR("QuotedShortPhoneNumber"))
      || _typesAreEqual(a1, CFSTR("UnquotedShortPhoneNumber"));
}

void DDApplyOptions(const __CFArray *a1, _QWORD *a2, unsigned int a3)
{
  _QWORD *v3;
  const __CFArray *v4;
  unsigned int v5;
  uint64_t v6;
  CFIndex Count;
  CFIndex v8;
  _BOOL4 v9;
  CFIndex v10;
  const void *ValueAtIndex;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  _BOOL4 v15;
  CFComparisonResult v16;
  const __CFString *UnwrappedResultOfType;
  const __CFString *TagTypeForDataType;
  const __CFString **SubresultWithType;
  void *v20;
  CFIndex v21;
  CFIndex v22;
  CFIndex v23;
  const void *v24;
  const void *v25;
  uint64_t VirtualDistance;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  _BOOL4 v32;
  uint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  _BOOL4 v41;
  int v42;
  char v43;
  char v44;
  CFIndex v45;
  _BOOL4 v46;
  const __CFString *v49;
  char *v50;
  uint64_t v51;
  __CFArray *v52;
  char v53;
  CFIndex v54;
  CFIndex v55;
  CFIndex v56;
  CFStringRef *v57;
  CFIndex v58;
  CFIndex v59;
  CFIndex v60;
  CFStringRef *v61;
  uint64_t v62;
  const __CFString **v63;
  const __CFString **v64;
  const __CFString *v65;
  __int16 v66;
  const __CFAllocator *v67;
  __CFArray *Mutable;
  __CFArray *v69;
  unsigned int v70;
  CFIndex v71;
  CFIndex v72;
  CFIndex i;
  void (**v74)(const void *, const __CFArray *, _QWORD *);
  CFIndex v75;
  __CFArray *v76;
  __CFArray *v77;
  CFIndex v78;
  CFIndex v79;
  const void *v80;
  const __CFArray *v81;
  uint64_t v82;
  char v83;
  CFIndex v84;
  uint64_t v85;
  _QWORD *v86;
  CFIndex v87;
  uint64_t v88;
  const void *v89;
  CFIndex v90;
  CFIndex v91;
  __CFArray *v92;
  __CFArray *v93;
  CFIndex v94;
  CFIndex v95;
  CFIndex j;
  void (**v97)(const void *, const __CFArray *, _QWORD *);
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  char v101;
  CFIndex v102;
  _QWORD *v103;
  CFIndex v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  CFIndex idx;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BOOL4 v115;
  const __CFArray *v116;
  _BOOL4 v117;
  char v118;
  uint64_t v119;
  const void *v120;
  CFIndex v121;
  const __CFAllocator *v122;
  uint64_t v123;
  char v124;
  const __CFString *v125;
  __CFArray *v126;
  uint64_t v127;
  uint64_t v128;
  _WORD v129[5];
  CFRange v130;

  if (!a1)
    return;
  v3 = a2;
  v4 = a1;
  if ((a2[24] & 1) != 0)
    v5 = a3 & 0xFFFFFFFD;
  else
    v5 = a3;
  v99 = v5;
  DDUnwrapCompatibility(a1, 0);
  v6 = v3[24];
  Count = CFArrayGetCount(v4);
  if (Count >= 1)
  {
    v8 = Count;
    v9 = 0;
    v101 = 0;
    v108 = 0;
    v10 = 0;
    v106 = v6 & 0x28000000;
    v100 = -1;
    v107 = -1;
    v112 = -1;
    v113 = -1;
    v103 = v3;
    v116 = v4;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, v10);
      v12 = (uint64_t)ValueAtIndex;
      v114 = *((_QWORD *)ValueAtIndex + 6);
      v110 = *((_QWORD *)ValueAtIndex + 4);
      v111 = *((_QWORD *)ValueAtIndex + 5);
      v13 = v10 > 0 && v113 == *((_QWORD *)ValueAtIndex + 4);
      v14 = v13 && v112 == *((_QWORD *)ValueAtIndex + 5);
      v15 = v14;
      v16 = CFStringCompare(*((CFStringRef *)ValueAtIndex + 8), CFSTR("Tag"), 0);
      v115 = v16 != kCFCompareEqualTo;
      if (_typesAreEqual(*(CFStringRef *)(v12 + 64), CFSTR("Data")))
        break;
      if (v106)
        v46 = 0;
      else
        v46 = v15;
      if (v46 && v16 == kCFCompareEqualTo && !v9)
      {
        if (v108 || v107 >= v114)
        {
          CFArrayRemoveValueAtIndex(v4, v10);
          goto LABEL_113;
        }
        CFArrayRemoveValueAtIndex(v4, v10 - 1);
        v8 = CFArrayGetCount(v4);
        v108 = 0;
        v112 = v111;
        v113 = v110;
        v107 = v114;
      }
      else
      {
        v108 = 0;
        v101 = 0;
        ++v10;
        v100 = -1;
        v112 = v111;
        v113 = v110;
        v107 = v114;
      }
LABEL_114:
      v9 = v115;
      if (v10 >= v8)
        goto LABEL_129;
    }
    UnwrappedResultOfType = (const __CFString *)DDResultGetUnwrappedResultOfType(v12, CFSTR("Data"));
    TagTypeForDataType = DDResultGetTagTypeForDataType(UnwrappedResultOfType);
    SubresultWithType = DDResultGetSubresultWithType((uint64_t)UnwrappedResultOfType, TagTypeForDataType);
    v117 = SubresultWithType == 0;
    v125 = UnwrappedResultOfType;
    if (SubresultWithType)
      v20 = SubresultWithType;
    else
      v20 = (void *)UnwrappedResultOfType;
    v119 = (uint64_t)v20;
    v21 = CFArrayGetCount(v4);
    v22 = v10 - 1;
    idx = v10;
    v23 = v10 + 1;
    v104 = v10 + 1;
    v102 = v10 - 1;
    v105 = v15;
    v121 = v21;
    v123 = v12;
    while (1)
    {
      if (v22 < 0)
        v24 = 0;
      else
        v24 = CFArrayGetValueAtIndex(v4, v22);
      if (v23 < v21)
        v25 = CFArrayGetValueAtIndex(v4, v23);
      else
        v25 = 0;
      VirtualDistance = DDResultGetVirtualDistance(v12, (uint64_t)v24);
      v27 = DDResultGetVirtualDistance(v12, (uint64_t)v25);
      v28 = v27;
      v127 = VirtualDistance;
      v29 = v22 >= 0 && VirtualDistance <= 1000;
      v30 = !v29;
      v32 = v23 >= v21 || v27 > 1000;
      if (v30)
        v33 = 0;
      else
        v33 = (uint64_t)v24;
      if (v32)
        v25 = 0;
      v34 = DDShouldPauseSearchForTag(v30, (uint64_t)v125, v33);
      v35 = DDShouldPauseSearchForTag(v32, (uint64_t)v125, (uint64_t)v25);
      if (!v34 || !v35)
      {
        v22 += (char)(v34 - 1);
        if (!v35)
          ++v23;
        goto LABEL_74;
      }
      v129[0] = 0;
      v37 = DDGetDataValueForMatchingTagToData(v33, (const __CFString **)v119, v117, (_BYTE *)v129 + 1);
      v38 = DDGetDataValueForMatchingTagToData((uint64_t)v25, (const __CFString **)v119, v117, v129);
      if (v37 && v38)
      {
        if (v127 <= v28)
          v49 = v37;
        else
          v49 = v38;
        if (v127 <= v28)
          v50 = (char *)v129 + 1;
        else
          v50 = (char *)v129;
        if (v127 >= v28)
          v51 = v28;
        else
          v51 = v127;
        v52 = v4;
LABEL_102:
        DDUpdateDataWithMatchedTag(v52, idx, v125, v119, v49);
        v53 = !v105;
        if (v106)
          v53 = 1;
        if ((v53 & 1) == 0)
        {
          if (!*v50 && v101)
            goto LABEL_75;
          if (*v50 == v101)
          {
            if (v51 <= v100 && (v51 != v100 || v107 < v114))
            {
              v108 = 1;
              goto LABEL_128;
            }
LABEL_75:
            v10 = idx;
            v45 = idx;
          }
          else
          {
            v108 = 1;
            v101 = *v50;
LABEL_128:
            v107 = v114;
            v100 = v51;
            v10 = idx;
            v45 = v102;
          }
          CFArrayRemoveValueAtIndex(v4, v45);
          goto LABEL_77;
        }
        v108 = 1;
        v10 = v104;
        v112 = v111;
        v113 = v110;
        v101 = *v50;
        v107 = v114;
        v100 = v51;
LABEL_77:
        v3 = v103;
LABEL_113:
        v8 = CFArrayGetCount(v4);
        goto LABEL_114;
      }
      if (!((unint64_t)v37 | (unint64_t)v38))
        break;
      if (v119)
      {
        v39 = v38;
        v40 = *(const __CFString **)(v119 + 80);
        if (!v40)
          v40 = *(const __CFString **)(v119 + 72);
      }
      else
      {
        v39 = v38;
        v40 = 0;
      }
      v41 = CFStringFind(v40, CFSTR("-"), 0).location == -1 && CFStringFind(v40, CFSTR("Generic"), 0).location == -1;
      v4 = v116;
      v42 = !v41;
      if (!v33 || !v42 || !v39 || v127 >= v28)
      {
        v43 = v42 ^ 1;
        if (!v37)
          v43 = 1;
        if ((v43 & 1) != 0 || !v25 || v28 >= v127)
        {
          if (v37)
            v49 = v37;
          else
            v49 = v39;
          if (v37)
            v50 = (char *)v129 + 1;
          else
            v50 = (char *)v129;
          if (v37)
            v51 = v127;
          else
            v51 = v28;
          v52 = v116;
          goto LABEL_102;
        }
        goto LABEL_73;
      }
      v22 -= v30 ^ 1u;
LABEL_74:
      v44 = v30 & v32;
      v21 = v121;
      v12 = v123;
      if ((v44 & 1) != 0)
        goto LABEL_75;
    }
    v22 -= v30 ^ 1u;
LABEL_73:
    v23 += !v32;
    goto LABEL_74;
  }
LABEL_129:
  DDUnwrapCompatibility(v4, 1);
  v54 = CFArrayGetCount(v4);
  if (v54 >= 1)
  {
    v55 = v54;
    v56 = 0;
    do
    {
      v57 = (CFStringRef *)CFArrayGetValueAtIndex(v4, v56);
      if (v57 && _typesAreEqual(v57[8], CFSTR("Tag")))
      {
        CFArrayRemoveValueAtIndex(v4, v56);
        v55 = CFArrayGetCount(v4);
      }
      else
      {
        ++v56;
      }
    }
    while (v56 < v55);
  }
  v58 = CFArrayGetCount(v4);
  if (v58 >= 1)
  {
    v59 = v58;
    v60 = 0;
    do
    {
      v61 = (CFStringRef *)CFArrayGetValueAtIndex(v4, v60);
      if (v61 && (v62 = (uint64_t)v61, _typesAreEqual(v61[8], CFSTR("TrackingInformation"))))
      {
        v63 = DDResultGetSubresultWithType(v62, CFSTR("Carrier"));
        v64 = DDResultGetSubresultWithType(v62, CFSTR("TrackingNumber"));
        if (v63 && v64)
        {
          v65 = v63[10];
          if (!v65)
            v65 = v63[9];
          DDResultSetType((uint64_t)v64, v65);
          DDResultRemoveSubresultWithType(v62, CFSTR("Carrier"));
          DDResultSetType(v62, CFSTR("TrackingNumber"));
        }
      }
      else
      {
        ++v60;
      }
    }
    while (v60 < v59);
  }
  v128 = CFArrayGetCount(v4);
  v66 = v99;
  if (v128 < 1)
    return;
  v67 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 7, 0);
  v69 = Mutable;
  if ((v99 & 0x20000) != 0)
  {
    v70 = v99 & 0xFFFDFFFF;
  }
  else
  {
    CFArrayAppendValue(Mutable, &__block_literal_global_140);
    v70 = v99;
  }
  if ((*(_QWORD *)&v70 & 0x10005) != 0)
    CFArrayAppendValue(v69, &__block_literal_global_134);
  if ((v70 & 0x10000) == 0)
  {
    if ((v70 & 1) == 0)
      goto LABEL_155;
LABEL_158:
    CFArrayAppendValue(v69, &__block_literal_global_128);
    v70 &= ~1u;
    if (!v69)
      goto LABEL_163;
    goto LABEL_159;
  }
  CFArrayAppendValue(v69, &__block_literal_global_132);
  v70 &= ~0x10000u;
  if ((v70 & 1) != 0)
    goto LABEL_158;
LABEL_155:
  if (!v69)
    goto LABEL_163;
LABEL_159:
  v71 = CFArrayGetCount(v69);
  if (v71 >= 1)
  {
    v72 = v71;
    for (i = 0; i != v72; ++i)
    {
      v74 = (void (**)(const void *, const __CFArray *, _QWORD *))CFArrayGetValueAtIndex(v69, i);
      v74[2](v74, v4, v3);
    }
  }
  v75 = CFArrayGetCount(v4);
  CFRelease(v69);
  v128 = v75;
  v29 = v75 < 1;
  v66 = v99;
  if (!v29)
  {
LABEL_163:
    v76 = CFArrayCreateMutable(v67, 9, 0);
    v77 = v76;
    if ((v70 & 0x400) != 0)
    {
      CFArrayAppendValue(v76, &__block_literal_global_121);
      v70 &= ~0x400u;
      if ((v70 & 0x800) == 0)
      {
LABEL_165:
        if ((v70 & 0x40) == 0)
          goto LABEL_166;
        goto LABEL_191;
      }
    }
    else if ((v70 & 0x800) == 0)
    {
      goto LABEL_165;
    }
    CFArrayAppendValue(v77, &__block_literal_global_123);
    v70 &= ~0x800u;
    if ((v70 & 0x40) == 0)
    {
LABEL_166:
      if ((v70 & 0x1000) == 0)
        goto LABEL_167;
      goto LABEL_192;
    }
LABEL_191:
    CFArrayAppendValue(v77, &__block_literal_global_41_1985);
    v70 &= ~0x40u;
    if ((v70 & 0x1000) == 0)
    {
LABEL_167:
      if ((v70 & 0x10) == 0)
        goto LABEL_168;
      goto LABEL_193;
    }
LABEL_192:
    CFArrayAppendValue(v77, &__block_literal_global_125_1986);
    v70 &= ~0x1000u;
    if ((v70 & 0x10) == 0)
    {
LABEL_168:
      if ((v70 & 8) == 0)
        goto LABEL_169;
      goto LABEL_194;
    }
LABEL_193:
    CFArrayAppendValue(v77, &__block_literal_global_45_1987);
    v70 &= ~0x10u;
    if ((v70 & 8) == 0)
    {
LABEL_169:
      if ((v70 & 0x80) == 0)
        goto LABEL_170;
      goto LABEL_195;
    }
LABEL_194:
    CFArrayAppendValue(v77, &__block_literal_global_47);
    v70 &= ~8u;
    if ((v70 & 0x80) == 0)
    {
LABEL_170:
      if ((v70 & 0x200) == 0)
        goto LABEL_172;
      goto LABEL_171;
    }
LABEL_195:
    CFArrayAppendValue(v77, &__block_literal_global_43);
    v70 &= ~0x80u;
    if ((v70 & 0x200) == 0)
    {
LABEL_172:
      CFArrayAppendValue(v77, &__block_literal_global_1988);
      if (!v77)
        goto LABEL_198;
      v78 = CFArrayGetCount(v77);
      if (v78 <= 0)
      {
        CFRelease(v77);
        goto LABEL_198;
      }
      v79 = v78;
      v80 = (const void *)v3[30];
      if (!v80)
      {
        v98 = v3[5];
        if (!v98 || (v80 = *(const void **)(v98 + 8)) == 0)
        {
          if ((v66 & 0x200) == 0)
          {
            v81 = v4;
            v80 = 0;
LABEL_220:
            v82 = 0;
            v83 = 1;
LABEL_176:
            v126 = CFArrayCreateMutable(v67, v128, MEMORY[0x1E0C9B378]);
            if (v126)
            {
              v118 = v83;
              v120 = v80;
              v122 = v67;
              v84 = 0;
              v124 = v70;
              v85 = (v70 >> 8) & 1;
              do
              {
                v86 = CFArrayGetValueAtIndex(v81, v84);
                v87 = 0;
                v88 = v86[8];
                while (1)
                {
                  v89 = CFArrayGetValueAtIndex(v77, v87);
                  if (((*((uint64_t (**)(const void *, _QWORD *, uint64_t, _QWORD *, uint64_t, uint64_t))v89 + 2))(v89, v86, v88, v3, v82, v85) & 1) == 0)break;
                  if (v79 == ++v87)
                  {
                    CFArrayAppendValue(v126, v86);
                    break;
                  }
                }
                ++v84;
              }
              while (v84 != v128);
              v90 = CFArrayGetCount(v126);
              v4 = v81;
              if (v90 != v128)
              {
                v91 = v90;
                CFArrayRemoveAllValues(v81);
                v130.location = 0;
                v130.length = v91;
                CFArrayAppendArray(v81, v126, v130);
              }
              CFRelease(v126);
              v128 = CFArrayGetCount(v81);
              v67 = v122;
              LOBYTE(v70) = v124;
              v80 = v120;
              if ((v118 & 1) == 0)
                goto LABEL_186;
            }
            else
            {
              v4 = v81;
              if ((v83 & 1) == 0)
LABEL_186:
                CFRelease(v80);
            }
            CFRelease(v77);
            if (v128 < 1)
              return;
LABEL_198:
            v92 = CFArrayCreateMutable(v67, 7, 0);
            v93 = v92;
            if ((v70 & 2) != 0)
            {
              CFArrayAppendValue(v92, &__block_literal_global_130);
              LOBYTE(v70) = v70 & 0xFD;
              if ((v70 & 4) == 0)
              {
LABEL_200:
                if ((v70 & 0x20) == 0)
                  goto LABEL_201;
                goto LABEL_208;
              }
            }
            else if ((v70 & 4) == 0)
            {
              goto LABEL_200;
            }
            CFArrayAppendValue(v93, &__block_literal_global_136);
            if ((v70 & 0x20) == 0)
            {
LABEL_201:
              if (!v93)
                return;
LABEL_202:
              v94 = CFArrayGetCount(v93);
              if (v94 >= 1)
              {
                v95 = v94;
                for (j = 0; j != v95; ++j)
                {
                  v97 = (void (**)(const void *, const __CFArray *, _QWORD *))CFArrayGetValueAtIndex(v93, j);
                  v97[2](v97, v4, v3);
                }
              }
              CFRelease(v93);
              return;
            }
LABEL_208:
            CFArrayAppendValue(v93, &__block_literal_global_138);
            if (!v93)
              return;
            goto LABEL_202;
          }
          if (getLocaleForExtraction_sOnce != -1)
            dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
          v80 = (const void *)_sLocaleForExtraction;
          if (!_sLocaleForExtraction)
          {
            v81 = v4;
            goto LABEL_220;
          }
        }
      }
      v81 = v4;
      CFRetain(v80);
      v82 = MEMORY[0x1A1ACA418](v80);
      v83 = 0;
      goto LABEL_176;
    }
LABEL_171:
    CFArrayAppendValue(v77, &__block_literal_global_49);
    v70 &= ~0x200u;
    goto LABEL_172;
  }
}

BOOL DDDeletionFilterBlocks_block_invoke_7(int a1, int a2, CFStringRef theString)
{
  return !_typesAreEqual(theString, CFSTR("NoResult"));
}

uint64_t DDDeletionFilterBlocks_block_invoke_6(int a1, const __CFString *a2, const __CFString *a3, int a4, CFStringRef theString)
{
  const __CFString *info;
  uint64_t result;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;

  if (!theString)
    return 1;
  if (CFStringHasPrefix(theString, CFSTR("de"))
    || CFStringHasPrefix(theString, CFSTR("nl"))
    || CFStringHasPrefix(theString, CFSTR("is")))
  {
    if (_typesAreEqual(a3, CFSTR("Time")))
    {
      if (a2)
        info = (const __CFString *)a2[2].info;
      else
        info = 0;
      v11 = CFStringGetLength(info) & 0xFFFFFFFFFFFFFFFELL;
      if (v11 == 6)
      {
        if (CFStringHasPrefix(info, CFSTR("Alle ")) || CFStringHasPrefix(info, CFSTR("alle ")))
          return 0;
      }
      else if (v11 == 4 && CFStringHasSuffix(info, CFSTR(" am")))
      {
        return 0;
      }
LABEL_23:
      if (CFStringHasPrefix(theString, CFSTR("pl")) || !_typesAreEqual(a3, CFSTR("WebURL")))
        return 1;
      if (a2)
        a2 = (const __CFString *)a2[2].info;
      return CFStringHasPrefix(a2, CFSTR("www"))
          || CFStringHasPrefix(a2, CFSTR("WWW"))
          || CFStringHasPrefix(a2, CFSTR("Www"))
          || !CFStringHasSuffix(a2, CFSTR(".pl"));
    }
    if (!_typesAreEqual(a3, CFSTR("Date")))
      goto LABEL_23;
    v10 = a2 ? (const __CFString *)a2[2].info : 0;
    if (CFStringGetLength(v10) != 4)
      goto LABEL_23;
    result = CFStringCompare(v10, CFSTR("Hier"), 1uLL);
    if (result)
      goto LABEL_23;
    return result;
  }
  if (CFStringHasPrefix(theString, CFSTR("fr")))
  {
    if (!_typesAreEqual(a3, CFSTR("WebURL")))
      goto LABEL_23;
    v12 = a2 ? (const __CFString *)a2[2].info : 0;
    if (CFStringHasPrefix(v12, CFSTR("www"))
      || CFStringHasPrefix(v12, CFSTR("WWW"))
      || CFStringHasPrefix(v12, CFSTR("Www")))
    {
      goto LABEL_23;
    }
    if (CFStringHasSuffix(v12, CFSTR(".la")))
    {
      result = CFStringHasSuffix(theString, CFSTR("LA"));
      if (!(_DWORD)result)
        return result;
    }
    if (CFStringHasSuffix(v12, CFSTR(".il")))
    {
      result = CFStringHasSuffix(theString, CFSTR("IL"));
      if (!(_DWORD)result)
        return result;
    }
    if (CFStringHasSuffix(v12, CFSTR(".sa")))
    {
      result = CFStringHasSuffix(theString, CFSTR("SA"));
      if (!(_DWORD)result)
        return result;
    }
    if (!CFStringHasSuffix(v12, CFSTR(".va")))
      goto LABEL_23;
    v15 = CFSTR("VA");
    goto LABEL_72;
  }
  if (!CFStringHasPrefix(theString, CFSTR("en")))
  {
    if (CFStringHasPrefix(theString, CFSTR("zh")) || CFStringHasPrefix(theString, CFSTR("yue")))
    {
      v14 = 0x10000;
    }
    else
    {
      if (!CFStringHasPrefix(theString, CFSTR("ja")))
        goto LABEL_23;
      v14 = 0x20000;
    }
    a2[3].isa = (void *)((uint64_t)a2[3].isa | v14);
    goto LABEL_23;
  }
  if (!_typesAreEqual(a3, CFSTR("WebURL")))
    goto LABEL_23;
  v13 = a2 ? (const __CFString *)a2[2].info : 0;
  if (CFStringHasPrefix(v13, CFSTR("www"))
    || CFStringHasPrefix(v13, CFSTR("WWW"))
    || CFStringHasPrefix(v13, CFSTR("Www")))
  {
    goto LABEL_23;
  }
  if (!CFStringHasSuffix(v13, CFSTR(".in")) || (result = CFStringHasSuffix(theString, CFSTR("IN")), (_DWORD)result))
  {
    if (!CFStringHasSuffix(v13, CFSTR(".be")) || (result = CFStringHasSuffix(theString, CFSTR("BE")), (_DWORD)result))
    {
      if (!CFStringHasSuffix(v13, CFSTR(".it")) || (result = CFStringHasSuffix(theString, CFSTR("IT")), (_DWORD)result))
      {
        if (!CFStringHasSuffix(v13, CFSTR(".to"))
          || (result = CFStringHasSuffix(theString, CFSTR("TO")), (_DWORD)result))
        {
          if (!CFStringHasSuffix(v13, CFSTR(".my")))
            goto LABEL_23;
          v15 = CFSTR("MY");
LABEL_72:
          result = CFStringHasSuffix(theString, v15);
          if ((_DWORD)result)
            goto LABEL_23;
        }
      }
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke_3()
{
  return 1;
}

uint64_t DDDeletionFilterBlocks_block_invoke_2(int a1, uint64_t a2, CFStringRef theString, uint64_t a4, uint64_t a5, int a6)
{
  const __CFArray *v9;
  CFStringRef *ValueAtIndex;
  const __CFString **SubresultWithType;
  CFStringRef *v12;
  uint64_t result;
  CFStringRef *v14;
  const __CFArray *v15;
  CFStringRef *v16;
  const __CFString *v17;
  unsigned int v18;
  const __CFString **v19;
  const __CFString **v20;
  const __CFString **v21;
  const __CFString **v22;
  int v23;

  if (_typesAreEqual(theString, CFSTR("DateTime")))
  {
    v9 = *(const __CFArray **)(a2 + 56);
    if (CFArrayGetCount(v9) != 1
      || (ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v9, 0)) == 0
      || !_typesAreEqual(ValueAtIndex[8], CFSTR("SpecialDateTime")))
    {
      SubresultWithType = DDResultGetSubresultWithType(a2, CFSTR("Time"));
      if (!SubresultWithType || !timeIsTimeStamp((uint64_t)SubresultWithType))
        return 1;
    }
LABEL_12:
    if (!a6)
      return 0;
    *(_QWORD *)(a2 + 96) &= ~1uLL;
    return 1;
  }
  if (_typesAreEqual(theString, CFSTR("Time")))
  {
    if (timeIsTimeStamp(a2))
      goto LABEL_12;
    v12 = *(CFStringRef **)(a2 + 56);
LABEL_11:
    if (timeIsApprox(v12))
      goto LABEL_12;
    return 1;
  }
  if (_typesAreEqual(theString, CFSTR("Date")))
  {
    v14 = (CFStringRef *)a2;
    while (1)
    {
      v15 = (const __CFArray *)v14[7];
      if (!v15 || CFArrayGetCount(v15) != 1)
        return 1;
      v16 = (CFStringRef *)CFArrayGetValueAtIndex(v15, 0);
      v14 = v16;
      if (v16)
      {
        if (_typesAreEqual(v16[8], CFSTR("DayOfWeek")))
          goto LABEL_12;
        if (_typesAreEqual(v14[8], CFSTR("RelativeDay")))
        {
          v23 = 0;
          v17 = v14[10];
          if (!v17)
            v17 = v14[9];
          if (!DDFastIntegerExtraction(v17, &v23))
            goto LABEL_12;
          v18 = v23;
          if (v23 < 0)
            v18 = -v23;
          if (v18 <= 1)
            goto LABEL_12;
          return 1;
        }
      }
    }
  }
  if (!_typesAreEqual(theString, CFSTR("TimeDuration")) || CFArrayGetCount(*(CFArrayRef *)(a2 + 56)) != 2)
    return 1;
  v19 = DDResultGetSubresultWithType(a2, CFSTR("BeginTime"));
  v20 = DDResultGetSubresultWithType(a2, CFSTR("EndTime"));
  result = 1;
  if (v19)
  {
    if (v20)
    {
      v21 = DDResultGetSubresultWithType((uint64_t)v19, CFSTR("Time"));
      v22 = DDResultGetSubresultWithType((uint64_t)v20, CFSTR("Time"));
      result = 1;
      if (v21)
      {
        if (v22)
        {
          if (!timeIsApprox((CFStringRef *)v21[7]))
            return 1;
          v12 = (CFStringRef *)v22[7];
          goto LABEL_11;
        }
      }
    }
  }
  return result;
}

const __CFString **DDResultGetSubresultWithType(uint64_t a1, const __CFString *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFString **ValueAtIndex;

  if (!a1)
    return 0;
  v3 = *(const __CFArray **)(a1 + 56);
  if (!v3)
    return 0;
  Count = CFArrayGetCount(v3);
  if (Count < 1)
    return 0;
  v6 = Count;
  v7 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString **)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v7);
    if (_typesAreEqual(a2, ValueAtIndex[8]))
      break;
    if (v6 == ++v7)
      return 0;
  }
  return ValueAtIndex;
}

BOOL _typesAreEqual(CFStringRef theString, const __CFString *a2)
{
  _BOOL8 result;
  CFIndex Length;
  CFRange v6;

  result = 0;
  if (theString && a2)
  {
    if (theString == a2)
    {
      return 1;
    }
    else
    {
      Length = CFStringGetLength(theString);
      if (Length == CFStringGetLength(a2))
      {
        v6.location = 0;
        v6.length = Length;
        return CFStringCompareWithOptionsAndLocale(theString, a2, v6, 0, 0) == kCFCompareEqualTo;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke(int a1, const __CFString *info, CFStringRef theString1, uint64_t a4, const __CFString *a5)
{
  const __CFString **SubresultWithType;
  const __CFString *v9;
  const __CFArray *length;
  CFStringRef *ValueAtIndex;
  const __CFString **v13;
  const __CFString *v14;
  const __CFString *v15;
  CFIndex v16;
  uint64_t v17;
  char *v18;
  _BOOL4 v19;
  _QWORD v20[2];
  CFRange v21;

  v20[1] = *MEMORY[0x1E0C80C00];
  if (CFStringCompare(theString1, CFSTR("PhoneNumber"), 0))
  {
    if (CFStringCompare(theString1, CFSTR("FlightInformation"), 0) == kCFCompareEqualTo)
    {
      SubresultWithType = DDResultGetSubresultWithType((uint64_t)info, CFSTR("AirlineCode"));
      if (SubresultWithType)
      {
        v9 = SubresultWithType[10];
        if (!v9)
          v9 = SubresultWithType[9];
      }
      else
      {
        v9 = 0;
      }
      v13 = DDResultGetSubresultWithType((uint64_t)info, CFSTR("FlightNumber"));
      if (!v13)
        return 0;
      v14 = v13[10];
      if (!v14)
        v14 = v13[9];
      if (!v9
        || !v14
        || CFStringCompare(v9, CFSTR("MH"), 0) == kCFCompareEqualTo
        && (CFStringCompare(v14, CFSTR("17"), 0) == kCFCompareEqualTo
         || CFStringCompare(v14, CFSTR("370"), 0) == kCFCompareEqualTo
         || CFStringCompare(v14, CFSTR("371"), 0) == kCFCompareEqualTo)
        || CFStringCompare(v9, CFSTR("BA"), 0) == kCFCompareEqualTo
        && CFStringCompare(v14, CFSTR("1"), 0) == kCFCompareEqualTo
        || CFStringCompare(v9, CFSTR("AA"), 0) == kCFCompareEqualTo
        && CFStringCompare(v14, CFSTR("77"), 0) == kCFCompareEqualTo)
      {
        return 0;
      }
      if (info)
        info = (const __CFString *)info[2].info;
      if (CFStringCompare(info, CFSTR("A300"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A318"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A319"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A320"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A321"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A330"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A340"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A350"), 0) == kCFCompareEqualTo
        || CFStringCompare(info, CFSTR("A380"), 0) == kCFCompareEqualTo)
      {
        return 0;
      }
    }
    return 1;
  }
  length = (const __CFArray *)info[1].length;
  if (!length)
    return 1;
  if (CFArrayGetCount(length) != 1)
    return 1;
  ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(length, 0);
  if (CFStringCompare(ValueAtIndex[8], CFSTR("Value"), 0))
    return 1;
  v15 = ValueAtIndex[9];
  v16 = CFStringGetLength(v15);
  CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
  MEMORY[0x1E0C80A78]();
  v18 = (char *)v20 - v17;
  v21.location = 0;
  v21.length = v16;
  CFStringGetCharacters(v15, v21, (UniChar *)((char *)v20 - v17));
  if (a5)
    v19 = CFStringHasSuffix(a5, CFSTR("BR")) != 0;
  else
    v19 = 0;
  return DDResultBufferIsValidForPhoneNumber((uint64_t)v18, 0, v16, 0, v19);
}

uint64_t _DDDFACacheCFInit(uint64_t result)
{
  *(_DWORD *)(result + 28) = 0;
  *(_QWORD *)(result + 88) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t extractInteger(const __CFString *a1, _DWORD *a2)
{
  _BOOL8 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[7];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  if (a1)
  {
    v17 = 0;
    if (DDExtractSimpleInteger(a1, &v17) || DDExtractKanjiNumber(a1, &v17))
    {
      *a2 = v17;
      return 1;
    }
    else
    {
      if (extractInteger_sOnce != -1)
        dispatch_once(&extractInteger_sOnce, &__block_literal_global_235);
      *(_QWORD *)buf = 0;
      v14 = buf;
      v15 = 0x2000000000;
      v16 = 0;
      if (extractInteger_sOnce_236 != -1)
        dispatch_once(&extractInteger_sOnce_236, &__block_literal_global_239);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __extractInteger_block_invoke_2;
      block[3] = &unk_1E3C959C8;
      block[4] = buf;
      block[5] = a1;
      block[6] = a2;
      dispatch_sync((dispatch_queue_t)extractInteger_sQueue, block);
      if (v14[24])
      {
        v4 = 1;
      }
      else
      {
        DDLogErrD(v6, v7, v8, v9, v10, CFSTR("Extraction failed for \"%@\""), a1);
        v4 = v14[24] != 0;
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BC07000, v5, OS_LOG_TYPE_ERROR, "null value in DataDetectorsCore:extractInteger", buf, 2u);
    }
    return 0;
  }
  return v4;
}

uint64_t extractGregorianYear(uint64_t a1)
{
  const __CFString **SubresultWithType;
  const __CFString **v3;
  const __CFString *v4;
  unsigned int v5;
  const __CFString **v7;
  uint64_t v8;
  const __CFString *data;
  const __CFString *v10;
  const __CFString **v11;
  const __CFString *v12;
  int CharacterAtIndex;
  const __CFString **v14;
  const __CFString **v15;
  const __CFString *v16;
  int v17;
  unsigned int v18;
  const __CFString **v19;
  const __CFString **v20;
  const __CFString *v21;
  unsigned int v22;
  int v23;
  int v24;
  NSObject *v25;
  unsigned int v26;
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("YearNumber"));
  if (SubresultWithType)
  {
    v3 = SubresultWithType;
    *(_DWORD *)buf = 0;
    v4 = SubresultWithType[10];
    if (!v4)
      v4 = v3[9];
    if (extractInteger(v4, buf))
    {
      v5 = *(_DWORD *)buf + 1900;
      if (*(_DWORD *)buf >= 0x64u)
        v5 = *(_DWORD *)buf;
      if (*(_DWORD *)buf <= 0x31u)
        v5 = *(_DWORD *)buf + 2000;
      if (*(int *)buf >= 0)
        return v5;
      else
        return 0xFFFFFFFFLL;
    }
    return 0xFFFFFFFFLL;
  }
  v7 = DDResultGetSubresultWithType(a1, CFSTR("JapaneseYear"));
  if (v7)
  {
    v8 = (uint64_t)v7;
    v26 = 0;
    data = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v7, CFSTR("JapaneseYearNumber"));
    if (data)
    {
      v10 = data;
      data = (const __CFString *)data[2].data;
      if (!data)
        data = (const __CFString *)v10[2].info;
    }
    if (!extractInteger(data, &v26))
      return 0xFFFFFFFFLL;
    v11 = DDResultGetSubresultWithType(v8, CFSTR("JapaneseEra"));
    if (!v11)
      return v26;
    v12 = v11[10];
    if (!v12)
    {
      v12 = v11[9];
      if (!v12)
        return v26;
    }
    if (CFStringGetLength(v12) <= 0)
      goto LABEL_70;
    CharacterAtIndex = CFStringGetCharacterAtIndex(v12, 0);
    if (CharacterAtIndex > 13178)
    {
      if (CharacterAtIndex <= 22822)
      {
        switch(CharacterAtIndex)
        {
          case 13179:
            goto LABEL_57;
          case 13180:
            goto LABEL_60;
          case 13181:
            goto LABEL_61;
          case 13182:
            goto LABEL_62;
          default:
            v23 = 20196;
            goto LABEL_66;
        }
      }
      if (CharacterAtIndex <= 26125)
      {
        if (CharacterAtIndex != 22823)
        {
          if (CharacterAtIndex != 24179)
            goto LABEL_70;
          goto LABEL_57;
        }
LABEL_61:
        v24 = v26 + 1912;
LABEL_68:
        v26 = v24 - 1;
        if (v24 <= 0)
          goto LABEL_71;
        return v26;
      }
      if (CharacterAtIndex == 26126)
      {
LABEL_62:
        v24 = v26 + 1868;
        goto LABEL_68;
      }
      if (CharacterAtIndex == 26157)
      {
LABEL_60:
        v24 = v26 + 1926;
        goto LABEL_68;
      }
LABEL_70:
      v26 = -1;
LABEL_71:
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v25 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_error_impl(&dword_19BC07000, v25, OS_LOG_TYPE_ERROR, "Unknown era: %@", buf, 0xCu);
      }
      return v26;
    }
    if (CharacterAtIndex <= 103)
    {
      if (CharacterAtIndex != 72)
      {
        if (CharacterAtIndex != 82)
          goto LABEL_70;
        goto LABEL_67;
      }
    }
    else if (CharacterAtIndex != 104)
    {
      if (CharacterAtIndex != 114)
      {
        v23 = 13055;
LABEL_66:
        if (CharacterAtIndex != v23)
          goto LABEL_70;
      }
LABEL_67:
      v24 = v26 + 2019;
      goto LABEL_68;
    }
LABEL_57:
    v24 = v26 + 1989;
    goto LABEL_68;
  }
  v14 = DDResultGetSubresultWithType(a1, CFSTR("MinguoYear"));
  if (!v14)
  {
    v19 = DDResultGetSubresultWithType(a1, CFSTR("ThaiYear"));
    if (v19)
    {
      v20 = v19;
      *(_DWORD *)buf = 0;
      v21 = v19[10];
      if (!v21)
        v21 = v20[9];
      if (extractInteger(v21, buf))
      {
        if (*(int *)buf < 100)
        {
          if (*(int *)buf >= 43)
          {
            if ((*(_DWORD *)buf - 43) > 0x31)
              return (*(_DWORD *)buf + 1857);
            else
              return (*(_DWORD *)buf + 1957);
          }
        }
        else
        {
          v22 = *(_DWORD *)buf - 543;
          if (*(_DWORD *)buf >= 0x21Fu)
          {
            if (v22 <= 0x31)
              return (*(_DWORD *)buf + 1457);
            if (v22 >= 0x64)
              return v22;
            return (*(_DWORD *)buf + 1357);
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  v15 = v14;
  *(_DWORD *)buf = 0;
  v16 = v14[10];
  if (!v16)
    v16 = v15[9];
  if (!extractInteger(v16, buf))
    return 0xFFFFFFFFLL;
  v17 = *(_DWORD *)buf + 3811;
  if ((*(_DWORD *)buf + 1911) >= 0x64)
    v17 = *(_DWORD *)buf + 1911;
  if ((*(_DWORD *)buf + 1911) <= 0x31)
    v18 = *(_DWORD *)buf + 3911;
  else
    v18 = v17;
  if (*(int *)buf >= -1911)
    return v18;
  else
    return 0xFFFFFFFFLL;
}

BOOL dateIsPast(uint64_t a1, uint64_t a2, int a3, const __CFLocale *a4, const __CFTimeZone *a5)
{
  double v9;
  double Current;
  CFAbsoluteTime v11;
  double v12;
  __CFCalendar *v13;
  __CFCalendar *v14;
  _BOOL8 result;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1A1ACA358]();
  if (a2)
    MEMORY[0x1A1ACA358](a2);
  else
    Current = CFAbsoluteTimeGetCurrent();
  v11 = Current;
  v12 = Current - v9;
  if (!a3)
    return v12 >= 60.0;
  if (v12 <= -90000.0)
    return 0;
  if (v12 >= 90000.0)
    return 1;
  v13 = _copyDefaultCalendar();
  if (v13)
  {
    v14 = v13;
    CFCalendarSetLocale(v13, a4);
    CFCalendarSetTimeZone(v14, a5);
    *(_DWORD *)buf = 0;
    v18 = 0;
    v19 = 0;
    v17 = 0;
    CFCalendarDecomposeAbsoluteTime(v14, v9, "yMd", buf, (char *)&v19 + 4, &v19);
    CFCalendarDecomposeAbsoluteTime(v14, v11, "yMd", (char *)&v18 + 4, &v18, &v17);
    if (*(int *)buf <= SHIDWORD(v18)
      && (*(_DWORD *)buf != HIDWORD(v18) || SHIDWORD(v19) <= (int)v18
                                         && (HIDWORD(v19) != (_DWORD)v18 || (int)v19 <= v17)))
    {
      CFRelease(v14);
      return 1;
    }
    CFRelease(v14);
    return 0;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v16 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315138;
    v21 = "dateIsPast";
    _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    return 0;
  }
  return result;
}

CFDateRef copyBestDateForDate(const void *a1)
{
  const __CFAllocator *v2;
  CFAbsoluteTime Current;

  if (a1)
    return (CFDateRef)CFRetain(a1);
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  return CFDateCreate(v2, Current);
}

int **assignFromHeaderV5(int **result, int *a2)
{
  int *v2;
  uint64_t v3;
  unint64_t v4;
  int *v5;
  unint64_t v6;
  int *v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  int *v11;
  unint64_t v12;
  int *v13;
  int *v14;
  int *v15;

  v2 = a2 + 15;
  v3 = (uint64_t)a2 + a2[1] + 60;
  *result = a2;
  result[1] = (int *)v3;
  result[2] = (int *)v3;
  v4 = a2[4];
  result[9] = (int *)(v4 >> 1);
  if (v4 >= 2)
    v5 = (int *)((char *)v2 + a2[3]);
  else
    v5 = 0;
  result[3] = v5;
  v6 = a2[6];
  result[10] = (int *)(v6 >> 2);
  if (v6 >= 4)
    v7 = (int *)((char *)v2 + a2[5]);
  else
    v7 = 0;
  result[4] = v7;
  v8 = a2[8];
  result[12] = (int *)(v8 >> 3);
  if (v8 >= 8)
    v9 = (int *)((char *)v2 + a2[7]);
  else
    v9 = 0;
  result[6] = v9;
  v10 = a2[12];
  result[11] = (int *)(v10 >> 2);
  if (v10 >= 4)
    v11 = (int *)((char *)v2 + a2[11]);
  else
    v11 = 0;
  result[5] = v11;
  v12 = a2[10];
  result[13] = (int *)(v12 >> 3);
  if (v12 >= 8)
    v13 = (int *)((char *)v2 + a2[9]);
  else
    v13 = 0;
  result[7] = v13;
  v14 = (int *)a2[14];
  result[14] = v14;
  if ((int)v14 < 1)
    v15 = 0;
  else
    v15 = (int *)((char *)v2 + a2[13]);
  result[8] = v15;
  return result;
}

BOOL _shouldPunyCodeHost(const __CFString *a1)
{
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex v11;
  UniChar v12;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  CFIndex v17;
  _OWORD v19[8];
  CFStringRef theString;
  const UniChar *v21;
  const char *v22;
  uint64_t v23;
  CFIndex v24;
  int64_t v25;
  int64_t v26;
  CFRange v27;

  Length = CFStringGetLength(a1);
  theString = a1;
  v23 = 0;
  v24 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v21 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v25 = 0;
  v26 = 0;
  v22 = CStringPtr;
  if (Length < 1)
  {
    return 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 1;
    v9 = 64;
    memset(v19, 0, sizeof(v19));
    do
    {
      if ((unint64_t)v7 >= 4)
        v10 = 4;
      else
        v10 = v7;
      v11 = v24;
      if (v24 <= v7)
      {
        v12 = 0;
      }
      else if (v21)
      {
        v12 = v21[v7 + v23];
      }
      else if (v22)
      {
        v12 = v22[v23 + v7];
      }
      else
      {
        if (v26 <= v7 || v6 > v7)
        {
          v14 = v10 + v5;
          v15 = v9 - v10;
          v16 = v7 - v10;
          v17 = v16 + 64;
          if (v16 + 64 >= v24)
            v17 = v24;
          v25 = v16;
          v26 = v17;
          if (v24 >= v15)
            v11 = v15;
          v27.length = v11 + v14;
          v27.location = v16 + v23;
          CFStringGetCharacters(theString, v27, (UniChar *)v19);
          v6 = v25;
        }
        v12 = *((_WORD *)v19 + v7 - v6);
      }
      if ((unsigned __int16)(v12 - 58) <= 0xFFF5u
        && (unsigned __int16)(v12 - 123) <= 0xFFE5u
        && (unsigned __int16)(v12 - 91) <= 0xFFE5u
        && (unsigned __int16)(v12 - 47) < 0xFFFEu)
      {
        break;
      }
      v8 = ++v7 < Length;
      --v5;
      ++v9;
    }
    while (Length != v7);
  }
  return v8;
}

id _getSharedDispatcher()
{
  if (_getSharedDispatcher_once != -1)
    dispatch_once(&_getSharedDispatcher_once, &__block_literal_global_506);
  return (id)_getSharedDispatcher__scannerDispatcher;
}

CFTypeRef _createLanguageCodeFromCountryCode(CFStringRef theString)
{
  const __CFAllocator *v1;
  __CFString *MutableCopy;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const void *Value;
  CFTypeRef v6;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, theString);
  CFStringUppercase(MutableCopy, 0);
  if (!MutableCopy)
    return 0;
  v3 = CFDictionaryCreate(v1, (const void **)&_createLanguageCodeFromCountryCode_rawCC, (const void **)&_createLanguageCodeFromCountryCode_rawLC, 223, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v3)
  {
    v4 = v3;
    Value = CFDictionaryGetValue(v3, MutableCopy);
    if (Value)
      v6 = CFRetain(Value);
    else
      v6 = 0;
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(MutableCopy);
  return v6;
}

CFCalendarRef _copyDefaultCalendar()
{
  CFCalendarRef result;

  if (pthread_main_np() != 1)
    return CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  if (_copyDefaultCalendar_onceToken != -1)
    dispatch_once(&_copyDefaultCalendar_onceToken, &__block_literal_global_45);
  if (!_copyDefaultCalendar__calendar)
    return CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  CFRetain((CFTypeRef)_copyDefaultCalendar__calendar);
  result = (CFCalendarRef)_copyDefaultCalendar__calendar;
  if (!_copyDefaultCalendar__calendar)
    return CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  return result;
}

const void *_copyCacheFileBaseName(int a1, const __CFLocale *a2)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  const __CFString *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v9;
  const __CFString *LanguageCodeFromCountryCode;
  const __CFString *v11;
  _BOOL4 appended;
  const __CFString *v13;
  BOOL v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _BOOL4 v19;
  const __CFLocale *v20;
  const __CFLocale *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _BOOL4 v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  CFStringRef v32;
  const __CFString *v33;
  uint64_t v34;
  __CFString **v35;
  uint64_t v36;
  char *v37;
  const __CFString *v38;
  CFIndex Length;
  uint64_t v40;
  CFStringRef v41;
  int v42;
  const char *v43;
  int v44;
  int v45;
  char *v46;
  int v47;
  unint64_t v48;
  BOOL v49;
  char *v50;
  int v51;
  uint64_t v52;
  int v53;
  BOOL v54;
  unint64_t v55;
  BOOL v56;
  char *v57;
  uint64_t v58;
  int v59;
  BOOL v60;
  int v61;
  const void *v62;
  const void **v63;
  __CFString *v64;
  int v65;
  int *v66;
  uint64_t v67;
  int v68;
  int v69;
  char v71[8];
  const __CFString *v72;
  CFStringRef v73[2];
  CFRange v74;
  CFRange v75;

  v73[1] = *(CFStringRef *)MEMORY[0x1E0C80C00];
  v72 = 0;
  v73[0] = 0;
  v4 = CFLocaleCopyPreferredLanguages();
  v5 = v4;
  if (v4)
  {
    Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      LODWORD(v4) = 0;
      if (!a2)
        goto LABEL_17;
    }
    else
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, 0);
      LODWORD(v4) = _appendLocale(v73, (CFTypeRef *)&v72, ValueAtIndex);
      if (!a2)
        goto LABEL_17;
    }
  }
  else
  {
    Count = 0;
    if (!a2)
      goto LABEL_17;
  }
  if (!(_DWORD)v4)
  {
    Value = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
    v9 = Value;
    if (Value)
    {
      LanguageCodeFromCountryCode = (const __CFString *)_createLanguageCodeFromCountryCode(Value);
      if (LanguageCodeFromCountryCode)
      {
        v11 = LanguageCodeFromCountryCode;
        appended = _appendLocale(v73, (CFTypeRef *)&v72, LanguageCodeFromCountryCode);
        CFRelease(v11);
        if (appended)
          goto LABEL_39;
      }
    }
    v13 = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
    if (v9)
      v14 = v13 == 0;
    else
      v14 = 1;
    if (!v14)
      _appendLocale(v73, (CFTypeRef *)&v72, v13);
    goto LABEL_18;
  }
LABEL_17:
  if ((_DWORD)v4)
    goto LABEL_39;
LABEL_18:
  v15 = (const __CFString *)CPPhoneNumberCopyHomeCountryCode();
  if (!v15)
  {
LABEL_23:
    v20 = CFLocaleCopyCurrent();
    if (!v20)
      goto LABEL_32;
    v21 = v20;
    v22 = (const __CFString *)CFLocaleGetValue(v20, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
    v23 = v22;
    if (v22
      && (v24 = (const __CFString *)_createLanguageCodeFromCountryCode(v22)) != 0
      && (v25 = v24, v26 = _appendLocale(v73, (CFTypeRef *)&v72, v24), CFRelease(v25), v26))
    {
      v27 = 1;
    }
    else
    {
      v28 = (const __CFString *)CFLocaleGetValue(v21, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
      v27 = 0;
      if (v23 && v28)
      {
        _appendLocale(v73, (CFTypeRef *)&v72, v28);
        v27 = 0;
      }
    }
    CFRelease(v21);
    if (!v27)
    {
LABEL_32:
      if (Count >= 2)
      {
        v29 = 2;
        do
          v30 = (const __CFString *)CFArrayGetValueAtIndex(v5, v29 - 1);
        while (!_appendLocale(v73, (CFTypeRef *)&v72, v30) && Count > v29++);
      }
    }
    goto LABEL_39;
  }
  v16 = v15;
  v17 = (const __CFString *)_createLanguageCodeFromCountryCode(v15);
  if (!v17)
  {
    CFRelease(v16);
    goto LABEL_23;
  }
  v18 = v17;
  v19 = _appendLocale(v73, (CFTypeRef *)&v72, v17);
  CFRelease(v18);
  CFRelease(v16);
  if (!v19)
    goto LABEL_23;
LABEL_39:
  if (v5)
    CFRelease(v5);
  if (v73[0] && CFStringGetLength(v73[0]) >= 3)
  {
    v32 = v73[0];
    v74.location = 0;
    v74.length = 2;
    v73[0] = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v73[0], v74);
    CFRelease(v32);
  }
  if (v72 && CFStringGetLength(v72) >= 3)
  {
    v33 = v72;
    v75.location = 0;
    v75.length = 2;
    v72 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v72, v75);
    CFRelease(v33);
  }
  if (a1 == 2)
    v34 = 2;
  else
    v34 = 6;
  if (a1 == 2)
    v35 = calendarBasenames;
  else
    v35 = fullBasenames;
  MEMORY[0x1E0C80A78]();
  v37 = &v71[-v36];
  strcpy(&v71[4], "xx");
  strcpy(v71, "xx");
  if (v73[0] && CFStringGetLength(v73[0]) == 2)
    CFStringGetCString(v73[0], &v71[4], 3, 0x8000100u);
  v38 = v72;
  if (v72)
  {
    Length = CFStringGetLength(v72);
    v38 = v72;
    if (Length == 2)
    {
      CFStringGetCString(v72, v71, 3, 0x8000100u);
      v38 = v72;
    }
  }
  v40 = 0;
  v41 = v73[0];
  v42 = v71[4];
  v43 = "esptenfrca                    svpldanlnonbnnfiesptitdeenfr  rupldeenukhuhrsrslroskcskkbgltenhi                  "
        "        msthkojazhenidvihi            hetrarelitdeesenfr            ";
  v44 = v71[5];
  v45 = v71[0];
  v46 = &byte_19BC3F9A1;
  v47 = v71[1];
  do
  {
    if (a1 == 2)
    {
      if (!v41)
      {
        v51 = 0;
        if (!v38)
          goto LABEL_100;
LABEL_83:
        v55 = 0;
        v56 = 1;
        v57 = v46;
        do
        {
          if (*(v57 - 1) == v45 && *v57 == v47)
            break;
          v56 = v55 < 0x20;
          v57 += 2;
          ++v55;
        }
        while (v55 != 33);
        v51 |= v56;
        goto LABEL_100;
      }
      v48 = 0;
      v49 = 1;
      v50 = v46;
      do
      {
        if (*(v50 - 1) == v42 && *v50 == v44)
          break;
        v49 = v48 < 0x20;
        v50 += 2;
        ++v48;
      }
      while (v48 != 33);
      if (v49)
        v51 = 2;
      else
        v51 = 0;
      if (v38)
        goto LABEL_83;
    }
    else
    {
      if (!v41)
      {
LABEL_80:
        v51 = 0;
        if (!v38)
          goto LABEL_100;
LABEL_89:
        v58 = 0;
        while (1)
        {
          v59 = v43[v58];
          if (v59 == v45 && v43[v58 + 1] == v47)
            break;
          v60 = v59 == 32 || v58 == 28;
          v58 += 2;
          if (v60)
          {
            v61 = 0;
            goto LABEL_99;
          }
        }
        v61 = 1;
LABEL_99:
        v51 |= v61;
        goto LABEL_100;
      }
      v52 = 0;
      while (1)
      {
        v53 = v43[v52];
        if (v53 == v42 && v43[v52 + 1] == v44)
          break;
        v54 = v53 == 32 || v52 == 28;
        v52 += 2;
        if (v54)
          goto LABEL_80;
      }
      v51 = 2;
      if (v38)
        goto LABEL_89;
    }
LABEL_100:
    *(_DWORD *)&v37[4 * v40++] = v51;
    v43 += 30;
    v46 += 66;
  }
  while (v40 != v34);
  if (v41)
  {
    CFRelease(v41);
    v38 = v72;
  }
  if (v38)
    CFRelease(v38);
  v64 = *v35;
  v63 = (const void **)(v35 + 1);
  v62 = v64;
  LODWORD(v64) = *(_DWORD *)v37;
  v66 = (int *)(v37 + 4);
  v65 = (int)v64;
  v67 = v34 - 1;
  do
  {
    v69 = *v66++;
    v68 = v69;
    if (v69 > v65)
    {
      v62 = *v63;
      v65 = v68;
    }
    ++v63;
    --v67;
  }
  while (v67);
  if (v62)
    CFRetain(v62);
  return v62;
}

BOOL _appendLocale(CFStringRef *a1, CFTypeRef *a2, CFStringRef theString)
{
  _BOOL8 result;
  const __CFString *v6;
  _BOOL4 v7;
  uint64_t location;
  CFStringRef v9;
  const __CFString *v10;
  int CharacterAtIndex;
  int v12;
  CFRange v13;

  result = 0;
  if (a1 && a2)
  {
    v6 = theString;
    if (theString && !CFStringHasPrefix(theString, CFSTR("en")))
    {
      if (CFStringHasPrefix(v6, CFSTR("yue")))
      {
        v7 = 0;
        v6 = CFSTR("zh");
      }
      else
      {
        location = CFStringFind(v6, CFSTR("-"), 0).location;
        if (location < 2)
        {
          v7 = 0;
        }
        else
        {
          v13.length = location;
          v13.location = 0;
          v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v13);
          v7 = v9 != 0;
          if (v9)
            v6 = v9;
        }
      }
      v10 = *a1;
      if (*a1)
      {
        if (CFStringGetLength(*a1) >= 2
          && CFStringGetLength(v6) >= 2
          && (CharacterAtIndex = CFStringGetCharacterAtIndex(v10, 0),
              CharacterAtIndex == CFStringGetCharacterAtIndex(v6, 0))
          && (v12 = CFStringGetCharacterAtIndex(v10, 1), v12 == CFStringGetCharacterAtIndex(v6, 1)))
        {
          if (v7)
            CFRelease(v6);
          return 0;
        }
        else
        {
          if (*a2)
            CFRelease(*a2);
          if (!v7)
            CFRetain(v6);
          *a2 = v6;
          return 1;
        }
      }
      else
      {
        if (!v7)
          CFRetain(v6);
        result = 0;
        *a1 = v6;
      }
    }
    else
    {
      return *a2 != 0;
    }
  }
  return result;
}

void __getLocaleForExtraction_block_invoke()
{
  if (!_sLocaleForExtraction)
  {
    _sLocaleForExtraction = (uint64_t)CFLocaleCopyCurrent();
    if (!_sLocaleForExtraction)
    {
      _sLocaleForExtraction = (uint64_t)CFLocaleGetSystem();
      CFRetain((CFTypeRef)_sLocaleForExtraction);
    }
  }
}

void ___getSharedDispatcher_block_invoke()
{
  DDScanServerDispatcher *v0;
  void *v1;

  v0 = objc_alloc_init(DDScanServerDispatcher);
  v1 = (void *)_getSharedDispatcher__scannerDispatcher;
  _getSharedDispatcher__scannerDispatcher = (uint64_t)v0;

}

CFCalendarRef ___copyDefaultCalendar_block_invoke()
{
  CFCalendarRef result;

  result = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  _copyDefaultCalendar__calendar = (uint64_t)result;
  return result;
}

BOOL _DDTriePathForSource(int a1, const char *a2, int a3, int a4, int a5)
{
  int v6;
  const char *v11;
  char *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  _BOOL8 result;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  int *v27;
  char *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a1 - 1;
  if ((a1 - 1) > 5 || ((0x2Fu >> v6) & 1) == 0)
    goto LABEL_34;
  v11 = off_1E3C951E8[v6];
  v12 = (char *)__stpcpy_chk();
  if ((a1 & 0xFFFFFFFD) == 4)
    snprintf(v12, 0xEuLL, "/%d/", a5);
  else
    strcpy(v12, "/sys/");
  v13 = strlen(a2);
  if (v13 < 1)
    goto LABEL_34;
  if (a4)
  {
    v14 = ".lexicon";
    v15 = ".ddsource";
    goto LABEL_16;
  }
  *__error() = 0;
  if (!mkdir(a2, 0x1C1u))
  {
LABEL_15:
    v14 = ".lexicon.XXXXX";
    v15 = ".ddsource.XXXXX";
LABEL_16:
    if (a3)
      v17 = v14;
    else
      v17 = v15;
    v18 = strlen(v11);
    v19 = strlen(v17);
    v20 = v18 + v13 + v19;
    if (v20 <= 254)
    {
      if (v18 >= 1)
        memcpy((void *)&a2[v13], v11, v18);
      if (v19 >= 1)
        memcpy((void *)&a2[v18 + v13], v17, v19);
      a2 += v20;
      result = 1;
    }
    else
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v21 = DDLogHandle_error_log_handle;
      result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v23 = "basePath is too long";
        v24 = v21;
        v25 = 2;
LABEL_33:
        _os_log_error_impl(&dword_19BC07000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
LABEL_34:
        result = 0;
        goto LABEL_35;
      }
    }
    goto LABEL_35;
  }
  if (*__error() == 17)
  {
    chmod(a2, 0x1C1u);
    if (altPath)
      v16 = (const char *)altPath;
    else
      v16 = "/var/db/datadetectors";
    chmod(v16, 0x1C1u);
    goto LABEL_15;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v26 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v27 = __error();
    v28 = strerror(*v27);
    *(_DWORD *)buf = 136315394;
    v30 = a2;
    v31 = 2080;
    v32 = v28;
    v23 = "DD Failed creating folder %s (error: %s)";
    v24 = v26;
    v25 = 22;
    goto LABEL_33;
  }
LABEL_35:
  *a2 = 0;
  return result;
}

void _DDScanQueryCFFinalize(_QWORD *a1)
{
  void *v2;

  DDScanQueryReset(a1);
  v2 = (void *)a1[2];
  if (v2)
  {
    free(v2);
    a1[2] = 0;
  }
}

const __CFString **_DDGetRelevantResultsForUrlificationRange(uint64_t a1, const __CFString ***a2)
{
  const __CFString *v4;
  __CFString **v5;
  const __CFString *v6;

  v4 = *(const __CFString **)(a1 + 64);
  if (_DDResultTypeIsAnyPhoneKind(v4))
  {
    v5 = &DDBinderExtensionKey;
    v6 = CFSTR("Value");
LABEL_5:
    *a2 = DDResultGetSubresultWithType(a1, *v5);
    return DDResultGetSubresultWithType(a1, v6);
  }
  if (_typesAreEqual(v4, CFSTR("FlightInformation")))
  {
    v5 = DDBinderFlightNumberKey;
    v6 = CFSTR("AirlineCode");
    goto LABEL_5;
  }
  if (_typesAreEqual(v4, CFSTR("Email")))
  {
    v6 = CFSTR("Value");
    return DDResultGetSubresultWithType(a1, v6);
  }
  return (const __CFString **)a1;
}

uint64_t DDautommap(const char *a1, _QWORD *a2, off_t *a3, int8x16_t *a4)
{
  NSObject *v8;
  int *v9;
  char *v10;
  uint64_t result;
  off_t st_size;
  int v13;
  int v14;
  void *v15;
  stat v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(&v16, 0, sizeof(v16));
  if (stat(a1, &v16))
  {
    if (*__error() != 2)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v8 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 136315394;
        v18 = a1;
        v19 = 2080;
        v20 = v10;
        _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "Could not stat %s: %s, aborting", buf, 0x16u);
      }
    }
LABEL_13:
    result = 1;
    goto LABEL_14;
  }
  if (*(_OWORD *)&v16.st_mtimespec != *a4)
  {
    st_size = v16.st_size;
    if (v16.st_size)
    {
      v13 = open(a1, 0);
      if (v13 != -1)
      {
        v14 = v13;
        v15 = _DDmmap((uint64_t)a1, v13, st_size);
        close(v14);
        if (v15)
        {
          *a2 = v15;
          *a4 = vextq_s8((int8x16_t)v16.st_mtimespec, (int8x16_t)v16.st_mtimespec, 8uLL);
          *a3 = st_size;
          return 1;
        }
      }
    }
    goto LABEL_13;
  }
  result = 0;
LABEL_14:
  *a2 = 0;
  a4->i64[0] = 0;
  a4->i64[1] = 0;
  *a3 = 0;
  return result;
}

uint64_t DDURLStringForResult(uint64_t a1, uint64_t a2, char a3, const void *a4, const __CFTimeZone *a5)
{
  int Category;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  Category = DDResultGetCategory(a1);
  if ((Category - 3) >= 2)
  {
    v11 = Category;
    v12 = *(const __CFString **)(a1 + 64);
    if (!_typesAreEqual(CFSTR("TrackingNumber"), v12)
      && !_typesAreEqual(CFSTR("FlightInformation"), v12)
      && !_typesAreEqual(CFSTR("Parsec"), v12)
      && !_typesAreEqual(CFSTR("GameCenter"), v12)
      && !_typesAreEqual(CFSTR("Money"), v12)
      && !_typesAreEqual(CFSTR("AuthCode"), v12)
      && !_typesAreEqual(CFSTR("PhysicalAmount"), v12)
      && !_typesAreEqual(CFSTR("DomesticIdentifier"), v12)
      && !_typesAreEqual(CFSTR("UPIIdentifier"), v12))
    {
      v15 = (id)DDResultCopyExtractedURLWithOptions(a1, 1);
      v13 = v15;
      if (v11 != 2)
        return (uint64_t)v13;
      if (v15)
        goto LABEL_20;
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v16 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "Result %@ returned NULL URL", buf, 0xCu);
        if ((a3 & 2) != 0)
        {
LABEL_21:
          if (_typesAreEqual(v12, CFSTR("PhoneNumber")))
            return (uint64_t)v13;
        }
      }
      else
      {
LABEL_20:
        if ((a3 & 2) != 0)
          goto LABEL_21;
      }
      if ((a3 & 4) != 0 && _typesAreEqual(v12, CFSTR("QuotedShortPhoneNumber"))
        || (a3 & 8) != 0 && _typesAreEqual(v12, CFSTR("UnquotedShortPhoneNumber")))
      {
        return (uint64_t)v13;
      }
      return 0;
    }
  }
  if (DDResultIsPastDate(a1, a4, a5))
    return 0;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-apple-data-detectors"), a2);
}

_QWORD *DDTokenCacheCreate(const void *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  CFTypeRef v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  const void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = malloc_type_calloc(1uLL, 0x80uLL, 0x1020040DB4D2780uLL);
  if (v2)
  {
    v3 = v2;
    DDCachingStringTokenizerResetStringWithOptions((uint64_t)v2, 64, 0);
    v4 = NLStringTokenizerCreate();
    v3[5] = v4;
    if (!a1 || v4)
    {
      v7 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
      if (!a1)
      {
        v8 = 0;
        goto LABEL_13;
      }
LABEL_11:
      v8 = CFRetain(a1);
LABEL_13:
      *v7 = v3;
      v7[1] = v8;
      v7[4] = malloc_type_calloc(0x5AuLL, 8uLL, 0x2004093837F09uLL);
      v7[6] = 90;
      DDTokenCacheClear((uint64_t)v7);
      return v7;
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = a1;
      _os_log_error_impl(&dword_19BC07000, v5, OS_LOG_TYPE_ERROR, "Tokenizer creation failed with locale %@, trying to fallback to default", (uint8_t *)&v12, 0xCu);
    }
    v6 = NLStringTokenizerCreate();
    v3[5] = v6;
    if (v6)
    {
      v7 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
      goto LABEL_11;
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v9 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_19BC07000, v9, OS_LOG_TYPE_ERROR, "Tokenizer creation failed again, giving up", (uint8_t *)&v12, 2u);
    }
    DDCachingStringTokenizerDestroy(v3);
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v10 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12) = 0;
    _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "DD tokenizer creation failed", (uint8_t *)&v12, 2u);
  }
  return 0;
}

void DDTokenCacheClear(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 40);
    if (v1 >= 1)
    {
      for (i = 0; i < v1; ++i)
      {
        v4 = *(_QWORD *)(a1 + 48);
        v3 = *(_QWORD *)(a1 + 56);
        if (i + v3 < v4)
          v4 = 0;
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * (i + v3 - v4));
        if (v5)
        {
          *(_QWORD *)v5 = ((unint64_t)*(unsigned __int16 *)(v5 + 6) << 48) | 0xFFFFFFFF;
          v1 = *(_QWORD *)(a1 + 40);
        }
      }
    }
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_OWORD *)(a1 + 16) = xmmword_19BC3FC50;
    *(_QWORD *)(a1 + 384) = 0;
    if (*(_QWORD *)a1)
      DDCachingStringTokenizerResetStringWithOptions(*(_QWORD *)a1, *(_QWORD *)(a1 + 392), 1);
  }
}

int **DDStaticLookupCreateWithCache(_DWORD *a1, unint64_t a2, int a3)
{
  int v3;
  int v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v11;
  int v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int **v21;
  int **v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int **v27;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a2 < 60)
  {
    if ((uint64_t)a2 < 1)
      return 0;
    goto LABEL_15;
  }
  if (*a1 != a2)
  {
LABEL_15:
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v9 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v8 = "Incorrect source file size";
    goto LABEL_35;
  }
  v3 = a1[1];
  if (v3 < 0 || ((v4 = a1[2], v5 = (v4 + v3), v4 >= 4) ? (v6 = v5 > a2) : (v6 = 1), v6))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "Cells";
    v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  v11 = a1[3];
  if (v11 < 0 || (v12 = a1[4], v12 < 0) || (v12 + v11) > a2)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "ExtraData";
    v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v12 & 1) != 0 || (v11 & 1) != 0 && v12)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "ExtraData";
    v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  v15 = a1[5];
  if (v15 < 0 || (v16 = a1[6], v16 < 0) || (v16 + v15) > a2)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "MetaData";
    v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v16 & 3) != 0 || (v15 & 3) != 0 && v16)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "MetaData";
    v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  v17 = a1[7];
  if (v17 < 0 || (v18 = a1[8], v18 < 0) || (v18 + v17) > a2)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "ThresholdData";
    v8 = "Inconsistency in source section %s";
    goto LABEL_33;
  }
  if ((v18 & 7) != 0 || (v17 & 3) != 0 && v18)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v30 = "ThresholdData";
    v8 = "Inconsistency in source section array %s";
    goto LABEL_33;
  }
  if (a3 >= 5)
  {
    v19 = a1[11];
    if (v19 < 0 || (v20 = a1[12], v20 < 0) || (v20 + v19) > a2)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v7 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136315138;
      v30 = "StringIdxData";
      v8 = "Inconsistency in source section %s";
    }
    else
    {
      if ((v20 & 3) != 0 || (v19 & 3) != 0 && v20)
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136315138;
        v30 = "StringIdxData";
        v8 = "Inconsistency in source section array %s";
        goto LABEL_33;
      }
      v23 = a1[9];
      if (v23 < 0 || (v24 = a1[10], v24 < 0) || (v24 + v23) > a2)
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136315138;
        v30 = "ContextStringIdxData";
        v8 = "Inconsistency in source section %s";
      }
      else
      {
        if ((v24 & 7) != 0 || (v23 & 3) != 0 && v24)
        {
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v7 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            return 0;
          *(_DWORD *)buf = 136315138;
          v30 = "ContextStringIdxData";
          v8 = "Inconsistency in source section array %s";
          goto LABEL_33;
        }
        v25 = a1[13];
        if ((v25 & 0x80000000) == 0)
        {
          v26 = a1[14];
          if ((v26 & 0x80000000) == 0 && (v26 + v25) <= a2)
          {
            if ((_DWORD)v26 && *((_BYTE *)a1 + v25 + v26 + 59))
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v9 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                return 0;
              *(_WORD *)buf = 0;
              v8 = "Invalid string section in source";
              goto LABEL_35;
            }
            v27 = (int **)malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
            if (v27)
            {
              v22 = v27;
              assignFromHeaderV5(v27, a1);
              return v22;
            }
LABEL_112:
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v9 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              return 0;
            *(_WORD *)buf = 0;
            v8 = "Failed to allocate the static table";
LABEL_35:
            v13 = v9;
            v14 = 2;
            goto LABEL_36;
          }
        }
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v7 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136315138;
        v30 = "StringData";
        v8 = "Inconsistency in source section %s";
      }
    }
LABEL_33:
    v13 = v7;
    v14 = 12;
LABEL_36:
    _os_log_error_impl(&dword_19BC07000, v13, OS_LOG_TYPE_ERROR, v8, buf, v14);
    return 0;
  }
  v21 = (int **)malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
  if (!v21)
    goto LABEL_112;
  v22 = v21;
  assignFromHeaderV4(v21, a1);
  return v22;
}

void DDSourceMatchCacheFree(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  void **v4;

  if (a1)
  {
    if ((uint64_t)a1[1] <= 0)
    {
      v2 = (uint64_t)*a1;
      if (((unint64_t)*a1 & 0x8000000000000000) != 0)
      {
LABEL_10:
        free(a1);
        return;
      }
    }
    else
    {
      v2 = 14;
    }
    v3 = v2 + 1;
    v4 = a1 + 5;
    do
    {
      if (*v4)
        free(*v4);
      v4 += 8;
      --v3;
    }
    while (v3);
    goto LABEL_10;
  }
}

uint64_t DDShouldUseLightLinksForResult(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (DDResultGetCategory(result) - 3 < 0xFFFFFFFE)
      return 1;
    else
      return a2;
  }
  return result;
}

void DDScannerSetOptions(uint64_t a1, unint64_t a2)
{
  __CFArray *v3;

  *(_QWORD *)(a1 + 192) = a2;
  v3 = *(__CFArray **)(a1 + 160);
  if (a2 >> 31)
  {
    if (v3)
      CFArrayRemoveAllValues(v3);
    else
      *(_QWORD *)(a1 + 160) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  }
  else if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 160) = 0;
  }
}

id DDScannerServiceScanQuerySyncWithOptions(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int64_t *a6)
{
  return DDScannerServiceScanQuerySyncWithOptionsAndQOS(a1, a2, a3, a4, a5, a6, 0);
}

void DDScannerReset(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  __CFArray *v5;

  if (a1)
  {
    DDTokenCacheClear(*(_QWORD *)(a1 + 40));
    DDLexemCacheClear(*(_QWORD *)(a1 + 48));
    DDSourceMatchCacheFree(*(void ***)(a1 + 152));
    *(_QWORD *)(a1 + 152) = 0;
    v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 56) = 0;
    }
    v3 = *(_QWORD *)(a1 + 24);
    if (v3)
    {
      v4 = *(const void **)(v3 + 24);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(v3 + 24) = 0;
      }
      *(_QWORD *)(v3 + 40) = -1;
    }
    v5 = *(__CFArray **)(a1 + 168);
    if (v5)
      CFArrayRemoveAllValues(v5);
  }
}

uint64_t DDScannerCreateWithTypeAndLocale(int a1, const __CFLocale *a2, CFErrorRef *a3)
{
  __CFBundle *BundleWithIdentifier;
  __CFBundle *v7;
  const __CFString *v8;
  const __CFString *v9;
  CFURLRef v10;
  uint64_t v11;
  const char *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  stat v23;
  uint8_t buf[4];
  UInt8 *v25;
  UInt8 buffer[1025];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  memset(&v23, 0, sizeof(v23));
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.datadetectorscore"));
  if (BundleWithIdentifier)
  {
    v7 = BundleWithIdentifier;
    switch(a1)
    {
      case 0:
      case 2:
        v8 = (const __CFString *)_copyCacheFileBaseName(a1, a2);
        if (!v8)
          goto LABEL_5;
        v9 = v8;
        v10 = CFBundleCopyResourceURLForLocalization(v7, v8, CFSTR("system"), 0, 0);
        CFAutorelease(v9);
        if (!v10)
          goto LABEL_5;
        goto LABEL_16;
      case 1:
        v13 = CFSTR("com.apple.datadetectorscore.cache.urlifier");
        goto LABEL_15;
      case 3:
        v13 = CFSTR("com.apple.datadetectorscore.cache.test");
LABEL_15:
        v10 = CFBundleCopyResourceURLForLocalization(BundleWithIdentifier, v13, CFSTR("system"), 0, 0);
        v9 = 0;
        if (v10)
        {
LABEL_16:
          if (CFURLGetFileSystemRepresentation(v10, 1u, buffer, 1025))
          {
            CFRelease(v10);
            if (stat((const char *)buffer, &v23)
              || (v20 = DDCacheCreateFromFileAtPathWithExtraChecks((const char *)buffer, v9, (void *)v23.st_size, 0)) == 0)
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v14 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v25 = buffer;
                v12 = "Could not load system cache %s";
                v15 = v14;
                v16 = 12;
                goto LABEL_27;
              }
            }
            else
            {
              v21 = v20;
              if (a1)
                v22 = 0;
              else
                v22 = CFStringCompare((CFStringRef)v20[10], CFSTR("com.apple.datadetectorscore.cache.full.india"), 0) == kCFCompareEqualTo;
              v18 = DDScannerCreateFromCacheSupportingMLScan(v21, v22);
              CFRelease(v21);
              if (v18)
              {
                *(_QWORD *)(v18 + 224) = 0;
                goto LABEL_37;
              }
            }
          }
          else
          {
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v17 = DDLogHandle_error_log_handle;
            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19BC07000, v17, OS_LOG_TYPE_ERROR, "CFURLGetFileSystemRepresentation failed", buf, 2u);
            }
            CFRelease(v10);
          }
        }
        else
        {
LABEL_5:
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v11 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v12 = "CFBundleCopyResourceURL failed";
            goto LABEL_26;
          }
        }
        break;
      default:
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v11 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          break;
        *(_WORD *)buf = 0;
        v12 = "Unknown cache type in _pathToSystemCacheFile";
        goto LABEL_26;
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v11 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Couldn't find bundle with identifier com.apple.datadetectorscore. It's either not here or you ran out of file descriptors.";
LABEL_26:
      v15 = v11;
      v16 = 2;
LABEL_27:
      _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, v12, buf, v16);
    }
  }
  if (a3 && !*a3)
  {
    v18 = 0;
    *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFD0], 22, 0);
  }
  else
  {
    v18 = 0;
  }
LABEL_37:
  kdebug_trace();
  return v18;
}

uint64_t DDScannerCreateWithLocale(int a1, unint64_t a2, const __CFLocale *a3, CFErrorRef *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = DDScannerCreateWithTypeAndLocale(a1, a3, a4);
  v7 = v6;
  if (v6)
  {
    DDScannerSetOptions(v6, a2);
    if (a3)
      DDScannerSetLocale(v7, a3);
  }
  return v7;
}

uint64_t DDScannerCreateFromCache(_QWORD *a1)
{
  return DDScannerCreateFromCacheSupportingMLScan(a1, 0);
}

uint64_t DDScannerCreate(int a1, unint64_t a2, CFErrorRef *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = DDScannerCreateWithTypeAndLocale(a1, 0, a3);
  v5 = v4;
  if (v4)
    DDScannerSetOptions(v4, a2);
  return v5;
}

CFArrayRef DDScannerCopyResultsWithOptions(uint64_t a1, unsigned int a2)
{
  CFArrayRef Copy;
  const __CFArray *v5;
  uint64_t Count;
  const __CFAllocator *v7;
  const __CFArray *MutableCopy;
  const __CFArray *v9;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 233) == 1)
  {
    DDScannerThreadDebug(a1, 1);
    return 0;
  }
  *(_BYTE *)(a1 + 233) = 1;
  kdebug_trace();
  v5 = *(const __CFArray **)(a1 + 168);
  if (v5)
  {
    Count = CFArrayGetCount(v5);
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (Count < 1
      || (MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, *(CFArrayRef *)(a1 + 168))) == 0
      || (v9 = MutableCopy,
          DDApplyOptions(MutableCopy, (_QWORD *)a1, a2),
          Copy = CFArrayCreateCopy(0, v9),
          CFRelease(v9),
          !Copy))
    {
      Copy = CFArrayCreate(v7, 0, 0, MEMORY[0x1E0C9B378]);
    }
  }
  else
  {
    Copy = 0;
  }
  kdebug_trace();
  DDScannerReset(a1);
  if (*(_BYTE *)(a1 + 233))
    *(_BYTE *)(a1 + 233) = 0;
  else
    DDScannerThreadDebug(a1, 0);
  return Copy;
}

void DDScanQueryReset(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  void (*v5)(_QWORD, _QWORD);

  if ((uint64_t)a1[4] >= 1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(const void **)(a1[2] + v2);
      if (v4)
        CFRelease(v4);
      v5 = (void (*)(_QWORD, _QWORD))a1[5];
      if (v5)
        v5(a1[6], *(_QWORD *)(a1[2] + v2 + 8));
      ++v3;
      v2 += 48;
    }
    while (v3 < a1[4]);
  }
  a1[4] = 0;
}

uint64_t DDScanQueryCreateFromString(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  CFTypeID v8;
  uint64_t Instance;

  v8 = DDTypeRegister(&DDScanQueryGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(a1, v8, 0x28uLL);
  DDScanQueryAddTextFragment(Instance, a2, a3, a4, 0, 0, 0);
  return Instance;
}

uint64_t DDScanQueryAddTextFragment(uint64_t result, CFStringRef theString, uint64_t a3, uint64_t a4, uint64_t a5, char a6, unsigned int a7)
{
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unsigned int *v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;

  if (!theString)
    return result;
  v13 = result;
  result = CFStringGetLength(theString);
  if (!result || *(uint64_t *)(v13 + 32) > 29999)
    return result;
  DDScanQueryAddSeparator(v13, a7);
  v14 = *(char **)(v13 + 16);
  if (!v14)
  {
    *(_OWORD *)(v13 + 24) = xmmword_19BC3FC70;
    v19 = (char *)malloc_type_malloc(0xC0uLL, 0x10E004000188D12uLL);
LABEL_13:
    v14 = v19;
    *(_QWORD *)(v13 + 16) = v19;
    v16 = *(_QWORD *)(v13 + 32);
    goto LABEL_14;
  }
  v15 = *(_QWORD *)(v13 + 24);
  v16 = *(_QWORD *)(v13 + 32);
  if (v15 == v16)
  {
    v17 = 2 * v15;
    if (v15 < 2)
      v17 = 4;
    if (v15 >= 1024)
      v18 = v15 + 1024;
    else
      v18 = v17;
    *(_QWORD *)(v13 + 24) = v18;
    v19 = (char *)malloc_type_realloc(v14, 48 * v18, 0x10E004000188D12uLL);
    goto LABEL_13;
  }
LABEL_14:
  v20 = &v14[48 * v16];
  result = (uint64_t)CFRetain(theString);
  v21 = (unsigned int *)(v20 + 40);
  v22 = *((_DWORD *)v20 + 10) & 0x3FFFFFF;
  *((_QWORD *)v20 + 2) = a3;
  *((_QWORD *)v20 + 3) = a4;
  *(_QWORD *)v20 = result;
  *((_QWORD *)v20 + 1) = a5;
  v23 = v22 & 0x83FFFFFF | ((a6 & 3) << 29) | ((a7 & 7) << 26);
  *((_DWORD *)v20 + 10) = v23;
  if (v16 < 1)
  {
    *(_QWORD *)&v14[48 * v16 + 32] = 0;
  }
  else
  {
    v24 = *(_QWORD *)(v13 + 16) + 48 * v16;
    *(_QWORD *)&v14[48 * v16 + 32] = *(_QWORD *)(v24 - 16) + *(_QWORD *)(v24 - 24) + 1;
    v25 = *(_DWORD *)(v24 - 8);
    v26 = (v25 >> 26) & 7;
    if (v26 <= a7)
      LOBYTE(v26) = a7;
    *(_DWORD *)(v24 - 8) = v25 & 0xE3FFFFFF | ((v26 & 7) << 26);
    v23 = *v21;
  }
  *v21 = v23 & 0xFC000000;
  ++*(_QWORD *)(v13 + 32);
  return result;
}

uint64_t DDScanQueryAddSeparator(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(result + 16) + 48 * v2;
    v6 = *(_DWORD *)(v3 - 8);
    v4 = (unsigned int *)(v3 - 8);
    v5 = v6;
    v7 = (v6 & 0x1C000000) == 0xC000000 && a2 >= 3;
    if (v7 && (v5 & 0x80000000) != 0)
    {
      v5 = v5 & 0xE3FFFFFF | 0x10000000;
      *v4 = v5;
    }
    if (((v5 >> 26) & 7) < a2)
      *v4 = v5 & 0xE3FFFFFF | ((a2 & 7) << 26);
  }
  return result;
}

uint64_t DDResultPhysicalUnitsExtraction(uint64_t result, double *a2, CFTypeRef *a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    result = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("PhysicalAmount"));
    if ((_DWORD)result)
      return _DDResultValueUnitExtraction(v5, a2, 0, a3) != 0;
  }
  return result;
}

uint64_t DDResultIsPastDateWithLocale(uint64_t a1, const void *a2, const __CFLocale *a3, const __CFTimeZone *a4)
{
  const __CFString *v8;
  uint64_t v9;
  _BOOL8 IsPast;
  __CFCalendar *v11;
  __CFCalendar *v12;
  NSObject *v13;
  NSObject *v14;
  CFTypeRef v15;
  BOOL v17;
  CFTypeRef cf;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = *(const __CFString **)(a1 + 64);
  v9 = _sDateForExtraction;
  if (_typesAreEqual(v8, CFSTR("Timestamp")))
    return 1;
  if (_typesAreEqual(v8, CFSTR("DateTime"))
    || _typesAreEqual(v8, CFSTR("Date"))
    || _typesAreEqual(v8, CFSTR("TimeOffset"))
    || _typesAreEqual(v8, CFSTR("BeginDate"))
    || _typesAreEqual(v8, CFSTR("EndDate")))
  {
    cf = 0;
    v17 = 0;
    v11 = _copyDefaultCalendar();
    if (v11)
    {
      v12 = v11;
      if (DDResultCopyExtractedDateFromReferenceDateRec(a1, a3, v11, a2, a4, &v17, (CFDateRef *)&cf, 0, 0))
      {
        if (cf)
        {
          IsPast = dateIsPast((uint64_t)cf, v9, v17, a3, a4);
          CFRelease(cf);
LABEL_25:
          v15 = v12;
LABEL_26:
          CFRelease(v15);
          return IsPast;
        }
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v14 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          IsPast = 0;
          goto LABEL_25;
        }
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
      }
      else
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v14 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
      }
      _os_log_error_impl(&dword_19BC07000, v14, OS_LOG_TYPE_ERROR, "Could not extract date from %@", buf, 0xCu);
      goto LABEL_24;
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v13 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "DDResultIsPastDateWithLocale";
      _os_log_error_impl(&dword_19BC07000, v13, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    }
    return 0;
  }
  if (!_typesAreEqual(v8, CFSTR("DateDuration")) && !_typesAreEqual(v8, CFSTR("DayInterval")))
    return 0;
  cf = 0;
  *(_QWORD *)buf = 0;
  v17 = 0;
  if (DDResultCopyExtractedStartDateEndDateWithLocale(a1, a3, 0, 0, (CFTypeRef *)buf, &cf, &v17, a2, a4))IsPast = dateIsPast(*(uint64_t *)buf, v9, v17, a3, (const __CFTimeZone *)cf);
  else
    IsPast = 0;
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  v15 = cf;
  if (cf)
    goto LABEL_26;
  return IsPast;
}

uint64_t DDResultIsPastDate(uint64_t a1, const void *a2, const __CFTimeZone *a3)
{
  if (getLocaleForExtraction_sOnce != -1)
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
  return DDResultIsPastDateWithLocale(a1, a2, (const __CFLocale *)_sLocaleForExtraction, a3);
}

uint64_t DDResultGetRangeForURLification(uint64_t a1)
{
  const __CFString **v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString **v7;

  if (!a1)
    return -1;
  v7 = 0;
  v2 = _DDGetRelevantResultsForUrlificationRange(a1, &v7);
  if (!v2)
    return -1;
  v3 = v2[4];
  if (DDResultGetCategory(a1) == 4)
  {
    v4 = *(const __CFString **)(a1 + 64);
    if (v4
      && (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Date"))
       || _typesAreEqual(v4, CFSTR("Time"))
       || _typesAreEqual(v4, CFSTR("DateTime"))))
    {
      v5 = _DDGetRelevantSubResultRangeForResult(a1);
    }
    else
    {
      v5 = -1;
    }
    if (v5 != -1)
      return v5;
  }
  return (uint64_t)v3;
}

uint64_t DDResultExtractDayMonthYear(uint64_t a1, const __CFLocale *a2, __CFCalendar *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, uint64_t a7, CFTypeRef cf)
{
  const __CFTimeZone *v16;
  const __CFTimeZone *v17;
  double Current;
  CFAbsoluteTime v19;
  uint64_t SubresultWithType;
  uint64_t v21;
  uint64_t v22;
  const __CFString **v23;
  CFGregorianDate GregorianDate;
  _DWORD *v25;
  int v26;
  int v27;
  const __CFString *data;
  const __CFString *v29;
  const __CFString **v30;
  uint64_t v31;
  int GregorianYear;
  SInt32 year;
  const __CFString **v34;
  __CFString *v35;
  const __CFString **v36;
  const __CFString **v37;
  const __CFString *v38;
  int v39;
  char v40;
  int v41;
  char v42;
  uint64_t v43;
  uint64_t info;
  const __CFString **v45;
  const __CFString **v46;
  const __CFString *v47;
  int v48;
  uint64_t v49;
  const __CFString **v50;
  uint64_t v51;
  const __CFString **v52;
  int v53;
  SInt32 DayOfWeek;
  SInt32 v55;
  unsigned int v56;
  const char *v57;
  const __CFString **v58;
  const __CFString *v59;
  int v60;
  signed int v61;
  BOOL v62;
  int v63;
  int v64;
  int v65;
  char v66;
  int v67;
  int v68;
  uint64_t v69;
  const __CFString **v70;
  const __CFString **v71;
  int v72;
  const __CFString **v73;
  const __CFString *v74;
  unsigned int v75;
  int v76;
  int v77;
  uint64_t v78;
  NSObject *v79;
  uint32_t v80;
  unsigned int v81;
  NSObject *v82;
  int v83;
  _DWORD *v84;
  const __CFString **v85;
  const __CFString **v86;
  const __CFString **v87;
  const __CFString **v88;
  const __CFString *v89;
  double AbsoluteTime;
  CFAbsoluteTime v91;
  uint64_t v92;
  unint64_t v93;
  SInt32 v94;
  int v95;
  int v96;
  int v97;
  const __CFString **v99;
  const __CFString **v100;
  const __CFString **v101;
  const __CFString *v102;
  const __CFString **v103;
  const __CFString **v104;
  char v105;
  int v106;
  _DWORD *v107;
  SInt8 month;
  char v109;
  _DWORD *v110;
  _QWORD block[6];
  SInt32 v112;
  int v113;
  CFAbsoluteTime v114;
  uint64_t v115;
  uint64_t v116;
  CFAbsoluteTime at[2];
  uint64_t v118;
  int v119;
  uint64_t v120;
  CFGregorianDate v121;

  v120 = *MEMORY[0x1E0C80C00];
  if (cf)
    v16 = (const __CFTimeZone *)CFRetain(cf);
  else
    v16 = CFTimeZoneCopyDefault();
  v17 = v16;
  CFCalendarSetLocale(a3, a2);
  CFCalendarSetTimeZone(a3, v17);
  if (a7)
    MEMORY[0x1A1ACA358](a7);
  else
    Current = CFAbsoluteTimeGetCurrent();
  v19 = Current;
  v115 = 0;
  v116 = 0;
  SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, CFSTR("AbsoluteDate"));
  v21 = (uint64_t)DDResultGetSubresultWithType(a1, CFSTR("PartialDate"));
  v110 = a5;
  if (!(SubresultWithType | v21))
  {
    if (DDResultGetSubresultWithType(a1, CFSTR("RelativeDay")))
    {
      data = (const __CFString *)DDResultGetSubresultWithType(a1, CFSTR("RelativeDay"));
      v29 = data;
      LODWORD(v114) = -1;
      if (data)
      {
        v25 = a6;
        data = (const __CFString *)data[2].data;
        if (!data)
          data = (const __CFString *)v29[2].info;
      }
      else
      {
        v25 = a6;
      }
      if ((extractInteger(data, &v114) & 1) != 0)
      {
        at[0] = v19;
        CFCalendarAddComponents(a3, at, 0, "d", LODWORD(v114));
        CFCalendarDecomposeAbsoluteTime(a3, at[0], "yMd", (char *)&v115 + 4, &v116, (char *)&v116 + 4);
        goto LABEL_114;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v43 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        if (v29)
        {
          info = (uint64_t)v29[2].data;
          if (!info)
            info = v29[2].info;
        }
        else
        {
          info = 0;
        }
        LODWORD(at[0]) = 138412290;
        *(_QWORD *)((char *)at + 4) = info;
        v57 = "Could not extract the value of the RelativeDay binder: %@";
LABEL_167:
        v79 = v43;
        v80 = 12;
        goto LABEL_168;
      }
LABEL_191:
      v49 = 0;
      goto LABEL_192;
    }
    if (!DDResultGetSubresultWithType(a1, CFSTR("RelativeDayOfWeek")))
      goto LABEL_191;
    v36 = DDResultGetSubresultWithType(a1, CFSTR("RelativeDayOfWeek"));
    v37 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayOfWeek"));
    if (v37)
    {
      v38 = v37[10];
      if (v38 || (v38 = v37[9]) != 0)
      {
        v39 = 0;
        v106 = 0;
        v40 = 0;
        v41 = 1;
        v42 = 1;
LABEL_59:
        v109 = 1;
        goto LABEL_60;
      }
    }
    v52 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayToCome"));
    if (v52)
    {
      v38 = v52[10];
      if (v38 || (v38 = v52[9]) != 0)
      {
        v41 = 0;
        v42 = 0;
        v39 = 0;
        v106 = 0;
        v40 = 0;
        goto LABEL_59;
      }
    }
    v70 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("AmbiguousNextDay"));
    if (v70)
    {
      v38 = v70[10];
      if (v38 || (v38 = v70[9]) != 0)
      {
        v41 = 0;
        v42 = 0;
        v39 = 0;
        v109 = 1;
        v106 = 1;
        v40 = 1;
        goto LABEL_60;
      }
    }
    v71 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayToComeWeekAfter"));
    if (v71)
    {
      v38 = v71[10];
      if (v38 || (v38 = v71[9]) != 0)
      {
        v41 = 0;
        v42 = 0;
        v40 = 0;
        v109 = 1;
        v39 = 1;
LABEL_126:
        v106 = 1;
        goto LABEL_60;
      }
    }
    v85 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayToCome2WeeksAfter"));
    if (v85)
    {
      v38 = v85[10];
      if (v38 || (v38 = v85[9]) != 0)
      {
        v41 = 0;
        v42 = 0;
        v106 = 0;
        v40 = 0;
        v39 = 2;
        goto LABEL_59;
      }
    }
    v99 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("PreviousDay"));
    if (v99)
    {
      v38 = v99[10];
      if (v38 || (v38 = v99[9]) != 0)
      {
        v41 = 0;
        v42 = 0;
        v40 = 0;
        v39 = -1;
        v109 = 1;
        goto LABEL_126;
      }
    }
    v100 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayOfPreviousWeek"));
    if (v100 && ((v38 = v100[10]) != 0 || (v38 = v100[9]) != 0))
    {
      v41 = 0;
      v109 = 0;
      v106 = 0;
      v40 = 0;
      v39 = -1;
    }
    else
    {
      v101 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayOfThisWeek"));
      if (v101 && ((v38 = v101[10]) != 0 || (v38 = v101[9]) != 0))
      {
        v41 = 0;
        v109 = 0;
        v39 = 0;
        v106 = 0;
        v40 = 0;
      }
      else
      {
        v103 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayOfNextWeek"));
        if (v103)
        {
          v38 = v103[10];
          if (v38 || (v38 = v103[9]) != 0)
          {
            v41 = 0;
            v109 = 0;
            v106 = 0;
            v40 = 0;
            v42 = 1;
            v39 = 1;
LABEL_60:
            v113 = 0;
            if ((extractInteger(v38, &v113) & 1) == 0)
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v43 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                goto LABEL_191;
              LODWORD(at[0]) = 138412290;
              *(_QWORD *)((char *)at + 4) = v38;
              v57 = "Could not extract the value of the Day : %@";
              goto LABEL_167;
            }
            v105 = v40;
            v53 = v113;
            DayOfWeek = CFAbsoluteTimeGetDayOfWeek(v19, v17);
            if (DayOfWeek == 7)
              v55 = 0;
            else
              v55 = DayOfWeek;
            at[0] = 0.0;
            *(_QWORD *)&at[1] = at;
            v118 = 0x2000000000;
            v119 = DDResultExtractDayMonthYear_actualFirstWeekDay;
            if (DDResultExtractDayMonthYear_sOnce != -1)
              dispatch_once(&DDResultExtractDayMonthYear_sOnce, &__block_literal_global_125);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 0x40000000;
            block[2] = __DDResultExtractDayMonthYear_block_invoke_2;
            block[3] = &unk_1E3C958B8;
            block[4] = at;
            block[5] = a2;
            v112 = v55;
            dispatch_sync((dispatch_queue_t)DDResultExtractDayMonthYear_sQueue, block);
            v56 = *(_DWORD *)(*(_QWORD *)&at[1] + 24);
            if (v56 - 8 > 0xFFFFFFF8)
            {
              if (v56 >= 2)
              {
                v61 = v56 - 1;
                if (v53 >= v61)
                  v53 -= v61;
                else
                  v53 = v53 - v61 + 7;
                v62 = __OFSUB__(v55, v61);
                v63 = v55 - v61;
                if (v63 < 0 != v62)
                  v55 = v63 + 7;
                else
                  v55 = v63;
              }
            }
            else
            {
              *(_DWORD *)(*(_QWORD *)&at[1] + 24) = 1;
            }
            v64 = v41;
            v65 = v53 - v55;
            v25 = a6;
            if ((v42 & 1) != 0)
            {
              v66 = v109;
              if (v65 >= 0)
                v66 = 0;
            }
            else
            {
              if (v53 == v55)
                v67 = v106;
              else
                v67 = 1;
              v66 = v109;
              if (v65 >= 0)
                v66 = 0;
              if (v65 < 0 || !v67)
              {
LABEL_104:
                ++v39;
LABEL_105:
                LODWORD(v69) = v65 - v39 + 8 * v39;
                if ((v105 & ((int)v69 < 4)) != 0)
                  v69 = (v69 + 7);
                else
                  v69 = v69;
                v114 = v19;
                CFCalendarAddComponents(a3, &v114, 0, "d", v69);
                CFCalendarDecomposeAbsoluteTime(a3, v114, "yMd", (char *)&v115 + 4, &v116, (char *)&v116 + 4);
                _Block_object_dispose(at, 8);
                goto LABEL_114;
              }
            }
            if ((v66 & 1) == 0)
            {
              v68 = v53 == v55 ? v64 : 0;
              if (v68 != 1)
                goto LABEL_105;
            }
            goto LABEL_104;
          }
        }
        v104 = DDResultGetSubresultWithType((uint64_t)v36, CFSTR("DayOfNextNextWeek"));
        if (!v104 || (v38 = v104[10]) == 0 && (v38 = v104[9]) == 0)
        {
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v78 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            goto LABEL_191;
          LOWORD(at[0]) = 0;
          v57 = "there should be a weekday";
          goto LABEL_143;
        }
        v41 = 0;
        v109 = 0;
        v106 = 0;
        v40 = 0;
        v39 = 2;
      }
    }
    v42 = 1;
    goto LABEL_60;
  }
  if (SubresultWithType)
    v22 = SubresultWithType;
  else
    v22 = v21;
  v23 = DDResultGetSubresultWithType(v22, CFSTR("AmbiguousDate"));
  GregorianDate = CFAbsoluteTimeGetGregorianDate(v19, (CFTimeZoneRef)cf);
  if (v23)
  {
    if (extractDMYFromAmbiguousForm((CFIndex)v23, a2, (_DWORD *)&v116 + 1, (int *)&v116, (int *)&v115 + 1))
    {
      v25 = a6;
      if (v115 < 0)
      {
        v26 = v116 - GregorianDate.month;
        if (v26 > -3)
        {
          if (v26 < 11)
          {
            HIDWORD(v115) = GregorianDate.year;
            goto LABEL_114;
          }
          v27 = GregorianDate.year - 1;
        }
        else
        {
          v27 = GregorianDate.year + 1;
        }
        HIDWORD(v115) = v27;
      }
LABEL_114:
      if (a4)
        *a4 = HIDWORD(v116);
      if (v110)
        *v110 = v116;
      if (v25)
        *v25 = HIDWORD(v115);
      v49 = 1;
      goto LABEL_192;
    }
  }
  else
  {
    v23 = (const __CFString **)v22;
  }
  v30 = DDResultGetSubresultWithType((uint64_t)v23, CFSTR("SpecialDay"));
  if (!v30)
  {
    v45 = DDResultGetSubresultWithType((uint64_t)v23, CFSTR("MonthNumber"));
    if (v45)
    {
      v46 = v45;
      month = GregorianDate.month;
      v25 = a6;
      v47 = v45[10];
      if (!v47)
        v47 = v46[9];
      v48 = 0;
      v49 = 0;
      if ((extractInteger(v47, &v116) & 1) == 0)
        goto LABEL_192;
LABEL_129:
      HIDWORD(v115) = extractGregorianYear((uint64_t)v23);
      if (v115 < 0)
      {
        HIDWORD(v115) = GregorianDate.year;
        if (v48)
        {
          v72 = v48 + GregorianDate.year;
        }
        else
        {
          if (!v46)
            goto LABEL_133;
          v83 = v116 - month;
          if (v83 > -3)
          {
            if (v83 < 11)
              goto LABEL_133;
            v72 = GregorianDate.year - 1;
          }
          else
          {
            v72 = GregorianDate.year + 1;
          }
        }
        HIDWORD(v115) = v72;
      }
LABEL_133:
      v73 = DDResultGetSubresultWithType((uint64_t)v23, CFSTR("DayNumber"));
      if (v73)
      {
        v107 = a4;
        v74 = v73[10];
        if (!v74)
          v74 = v73[9];
        v76 = HIDWORD(v115);
        v75 = v116;
        if (CFStringCompare(v74, CFSTR("LastDayOfMonth"), 0))
        {
          LODWORD(at[0]) = -1;
          if ((extractInteger(v74, at) & 1) != 0)
          {
            v77 = LODWORD(at[0]);
            goto LABEL_158;
          }
        }
        else
        {
          v81 = v75;
          if (v75 < 0xD)
          {
            if (!v75)
            {
              HIDWORD(v116) = 31;
              a4 = v107;
LABEL_172:
              v86 = DDResultGetSubresultWithType((uint64_t)v23, CFSTR("RelativeDayOfWeek"));
              v87 = DDResultGetSubresultWithType((uint64_t)v86, CFSTR("DayOfWeek"));
              if (!v87)
              {
                if (v46)
                  goto LABEL_114;
LABEL_184:
                if ((_DWORD)v116)
                  goto LABEL_114;
LABEL_185:
                v95 = HIDWORD(v116) - ((int)(*(_QWORD *)&GregorianDate.year >> 16) >> 24);
                if (v95 > -7)
                {
                  v96 = month;
                  if (v95 < 25)
                  {
LABEL_217:
                    LODWORD(v116) = v96;
                    goto LABEL_114;
                  }
                  if ((int)(*(_QWORD *)&GregorianDate.year >> 8) >> 24 > 1)
                  {
                    v96 = month - 1;
                    goto LABEL_217;
                  }
                  v96 = month + 11;
                  v97 = HIDWORD(v115) - 1;
                }
                else
                {
                  if ((int)(*(_QWORD *)&GregorianDate.year >> 8) >> 24 < 12)
                  {
                    v96 = month + 1;
                    goto LABEL_217;
                  }
                  v96 = month - 11;
                  v97 = HIDWORD(v115) + 1;
                }
                HIDWORD(v115) = v97;
                goto LABEL_217;
              }
              v88 = v87;
              v89 = v87[10];
              if (!v89)
                v89 = v88[9];
              if ((extractInteger(v89, &v115) & 1) != 0)
              {
                if (v46)
                  goto LABEL_114;
                *(_QWORD *)&v121.year = *(_QWORD *)&GregorianDate.year & 0xFFFF00FF00000000 | ((unint64_t)BYTE4(v116) << 40) | HIDWORD(v115);
                v121.second = GregorianDate.second;
                AbsoluteTime = CFGregorianDateGetAbsoluteTime(v121, v17);
                *(_OWORD *)at = *(_OWORD *)"";
                LODWORD(v118) = -2;
                v114 = AbsoluteTime;
                CFCalendarAddComponents(a3, &v114, 0, "M", 1);
                v91 = CFGregorianDateGetAbsoluteTime(GregorianDate, v17);
                if (v114 - v91 < v91 - AbsoluteTime)
                  *(_QWORD *)&at[0] = 1;
                v92 = 0;
                while (1)
                {
                  v114 = AbsoluteTime;
                  CFCalendarAddComponents(a3, &v114, 0, "M", *(unsigned int *)((char *)at + v92));
                  v93 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v114, v17);
                  v94 = CFAbsoluteTimeGetDayOfWeek(v114, v17);
                  if (v94 % 7 == (_DWORD)v115)
                    break;
                  v92 += 4;
                  if (v92 == 20)
                    goto LABEL_184;
                }
                HIDWORD(v115) = v93;
                LODWORD(v116) = (int)(v93 >> 8) >> 24;
                if ((_DWORD)v116)
                  goto LABEL_114;
                goto LABEL_185;
              }
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v43 = DDLogHandle_error_log_handle;
              if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                goto LABEL_191;
              v102 = v88[10];
              if (!v102)
                v102 = v88[9];
              LODWORD(at[0]) = 138412290;
              *(_QWORD *)((char *)at + 4) = v102;
              v57 = "Could not extract the day of week from the value %@";
              goto LABEL_167;
            }
            if ((v76 + 3) >= 7)
              v84 = &lastDayOfMonth;
            else
              v84 = lastDayOfMonthLeapYear;
            v77 = v84[v75 - 1];
LABEL_158:
            HIDWORD(v116) = v77;
            a4 = v107;
            if (v77 < 0)
              goto LABEL_191;
            goto LABEL_172;
          }
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v82 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            LODWORD(at[0]) = 67109120;
            HIDWORD(at[0]) = v81;
            _os_log_error_impl(&dword_19BC07000, v82, OS_LOG_TYPE_ERROR, "DDExtractDayNumberForMonthAndYear called with bad monthNumber %d", (uint8_t *)at, 8u);
          }
        }
        v49 = 0;
        HIDWORD(v116) = -1;
        goto LABEL_192;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v78 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        goto LABEL_191;
      LOWORD(at[0]) = 0;
      v57 = "Missing day in date result";
LABEL_143:
      v79 = v78;
      v80 = 2;
LABEL_168:
      _os_log_error_impl(&dword_19BC07000, v79, OS_LOG_TYPE_ERROR, v57, (uint8_t *)at, v80);
      goto LABEL_191;
    }
    v58 = DDResultGetSubresultWithType((uint64_t)v23, CFSTR("RelativeMonthNumber"));
    v46 = v58;
    if (v58)
    {
      LODWORD(at[0]) = 0;
      v59 = v58[10];
      if (!v59)
        v59 = v46[9];
      if (!extractInteger(v59, at))
        goto LABEL_191;
      month = GregorianDate.month;
      v60 = LODWORD(at[0]) + GregorianDate.month;
      LODWORD(v116) = v60;
      v25 = a6;
      if (v60 >= 13)
      {
        LODWORD(v116) = v60 - 12;
        v48 = 1;
        goto LABEL_129;
      }
      if (v60 <= 0)
      {
        LODWORD(v116) = v60 + 12;
        v48 = -1;
        goto LABEL_129;
      }
    }
    else
    {
      month = GregorianDate.month;
      v25 = a6;
    }
    v48 = 0;
    goto LABEL_129;
  }
  v31 = (uint64_t)v30;
  GregorianYear = extractGregorianYear((uint64_t)v23);
  if (GregorianYear >= 0)
    year = GregorianYear;
  else
    year = GregorianDate.year;
  HIDWORD(v115) = year;
  LOBYTE(v114) = 0;
  LODWORD(at[0]) = 0;
  v34 = DDResultGetSubresultWithType(v31, CFSTR("Identifier"));
  if (v34)
  {
    v35 = (__CFString *)v34[10];
    if (!v35)
      v35 = (__CFString *)v34[9];
  }
  else
  {
    v35 = 0;
  }
  v50 = DDResultGetSubresultWithType(v31, CFSTR("CalendarSystem"));
  if (v50)
  {
    v51 = (uint64_t)v50[10];
    if (!v51)
      v51 = (uint64_t)v50[9];
  }
  else
  {
    v51 = 0;
  }
  v49 = 0;
  if (DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear(v35, v51, a2, (Boolean *)&v114, (int *)at, (int *)&v116 + 1, &v116, year))
  {
    if ((v116 & 0x8000000000000000) == 0)
    {
      v25 = a6;
      if ((v116 & 0x80000000) == 0)
        goto LABEL_114;
    }
  }
LABEL_192:
  if (v17)
    CFRelease(v17);
  return v49;
}

uint64_t DDResultCurrencyExtraction(uint64_t result, double *a2, unint64_t a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    result = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("Money"));
    if ((_DWORD)result)
      return _DDResultValueUnitExtraction(v5, a2, a3, 0) != 0;
  }
  return result;
}

CFStringRef DDResultCopyExtractedURLWithOptions(uint64_t a1, char a2)
{
  const __CFString *v4;
  const __CFString **SubresultWithType;
  __CFString *v6;
  CFIndex v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  double v11;
  double Helper_x8__OBJC_CLASS___GEOMapURLBuilder;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  const __CFString *v16;
  CFIndex v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v21;
  NSObject *v22;
  const char *v23;
  uint8_t *v24;
  const __CFString *v25;
  const __CFAllocator *v26;
  CFIndex Length;
  __CFString *MutableCopy;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  __int16 v32;
  uint8_t buf[2];
  __int16 v34;
  __int16 v35;
  __int16 v36;

  v4 = *(const __CFString **)(a1 + 64);
  if (!_typesAreEqual(v4, CFSTR("Email")))
  {
    if (_typesAreEqual(v4, CFSTR("FullAddress")))
    {
      if ((a2 & 2) == 0)
        return 0;
      if (*(_QWORD *)(a1 + 72))
      {
        Helper_x8__OBJC_CLASS___GEOMapURLBuilder = gotLoadHelper_x8__OBJC_CLASS___GEOMapURLBuilder(v11);
        v14 = (void *)objc_msgSend(*(id *)(v13 + 552), "URLForAddress:", Helper_x8__OBJC_CLASS___GEOMapURLBuilder);
        if (v14)
          v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "URLOverrideForURL:", v14);
        v15 = (__CFString *)objc_msgSend(v14, "absoluteString");
        v6 = v15;
        if (v15)
          CFRetain(v15);
        return v6;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v22 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        return 0;
      v36 = 0;
      v23 = "can't have a result of type address without a string";
      v24 = (uint8_t *)&v36;
      goto LABEL_48;
    }
    if (_typesAreEqual(v4, CFSTR("WebURL")))
    {
      v16 = *(const __CFString **)(a1 + 72);
      if (v16)
      {
        v17 = DDCreatePunycodedString(v16, 0, 1, 0);
        v8 = (const __CFString *)v17;
        if (v17)
          v9 = (const __CFString *)v17;
        else
          v9 = v16;
        v10 = CFSTR("http://");
        goto LABEL_21;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v22 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        v35 = 0;
        v23 = "can't have a result of type web without a string";
        v24 = (uint8_t *)&v35;
LABEL_48:
        _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, v23, v24, 2u);
      }
    }
    else
    {
      if (_typesAreEqual(v4, CFSTR("HttpURL")))
      {
        v19 = *(const __CFString **)(a1 + 72);
        if (v19)
        {
          v6 = (__CFString *)DDCreatePunycodedString(*(const __CFString **)(a1 + 72), 1, 1, 0);
          if (!v6)
            return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v19);
          return v6;
        }
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v22 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          return 0;
        v34 = 0;
        v23 = "can't have a result of type http without a string";
        v24 = (uint8_t *)&v34;
        goto LABEL_48;
      }
      if (_typesAreEqual(v4, CFSTR("MapsURL")) || _typesAreEqual(v4, CFSTR("MailURL")))
      {
        v21 = *(const __CFString **)(a1 + 72);
        if (v21)
          return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v21);
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v22 = DDLogHandle_error_log_handle;
        if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          return 0;
        *(_WORD *)buf = 0;
        v23 = "can't have a result of type maps/mail without a string";
        v24 = buf;
        goto LABEL_48;
      }
      if (_typesAreEqual(v4, CFSTR("PhoneNumber"))
        || _typesAreEqual(v4, CFSTR("QuotedShortPhoneNumber"))
        || _typesAreEqual(v4, CFSTR("UnquotedShortPhoneNumber")))
      {
        v25 = DDResultCopyCleanPhoneNumber(a1);
        v6 = (__CFString *)v25;
        if (!v25)
          return v6;
        v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        Length = CFStringGetLength(v25);
        MutableCopy = CFStringCreateMutableCopy(v26, Length, v6);
        v29 = DDResultCopyStrippedPhoneNumber(MutableCopy);
        if (MutableCopy)
          CFRelease(MutableCopy);
        if (v29)
          CFRelease(v6);
        else
          v29 = v6;
        v30 = CFURLCreateStringByAddingPercentEscapes(0, v29, 0, 0, 0x8000100u);
        CFRelease(v29);
        if (v30)
        {
          v6 = CFStringCreateMutableCopy(0, 0, CFSTR("tel:"));
          CFStringAppend(v6, v30);
          v18 = v30;
          goto LABEL_23;
        }
      }
      else if (_typesAreEqual(v4, CFSTR("GenericURL")))
      {
        v31 = *(const __CFString **)(a1 + 72);
        if (v31)
        {
          if ((a2 & 1) == 0 || DDURLSchemeIsKnown((uint64_t)v31))
            return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v31);
          return 0;
        }
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v22 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          v32 = 0;
          v23 = "can't have a result of type generic without a string";
          v24 = (uint8_t *)&v32;
          goto LABEL_48;
        }
      }
    }
    return 0;
  }
  SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("Value"));
  if (!SubresultWithType)
    return 0;
  v6 = (__CFString *)SubresultWithType[9];
  if (!v6)
    return v6;
  v7 = DDCreatePunycodedString(SubresultWithType[9], 0, 0, 1);
  v8 = (const __CFString *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = v6;
  v10 = CFSTR("mailto:");
LABEL_21:
  v6 = CFStringCreateMutableCopy(0, 0, v10);
  CFStringAppend(v6, v9);
  if (v8)
  {
    v18 = v8;
LABEL_23:
    CFRelease(v18);
  }
  return v6;
}

uint64_t DDResultCopyExtractedDateFromReferenceDateRec(uint64_t a1, const __CFLocale *a2, __CFCalendar *a3, const void *a4, const void *a5, BOOL *a6, CFDateRef *a7, CFTypeRef *a8, int a9)
{
  uint64_t v15;
  const __CFString *v16;
  const __CFString **SubresultWithType;
  NSObject *v18;
  uint64_t v19;
  const __CFString **v20;
  const __CFTimeZone *v21;
  const __CFTimeZone *v22;
  CFDateRef v23;
  const __CFArray *v24;
  const void *ValueAtIndex;
  const __CFTimeZone *v26;
  CFDateRef v27;
  const __CFString **v28;
  const __CFString *v29;
  const __CFString **v30;
  const __CFString **v31;
  int v32;
  NSObject *v33;
  int v34;
  _BOOL4 v35;
  const __CFTimeZone *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString **v40;
  const __CFString **v41;
  const __CFLocale *v42;
  const __CFString **v43;
  int v44;
  int HourFromApproxTimeValue;
  int v46;
  NSObject *v47;
  uint64_t v48;
  int v49;
  const void *v50;
  const __CFTimeZone *v51;
  const __CFString **v52;
  const __CFString **v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString **v56;
  const __CFString **v57;
  const __CFTimeZone *v58;
  __CFString *DetailedDescription;
  NSObject *v60;
  const __CFLocale *locale;
  unsigned int v64;
  CFAbsoluteTime at;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE buf[24];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = a1;
    v16 = *(const __CFString **)(a1 + 64);
    if (_typesAreEqual(v16, CFSTR("BeginDate")) || _typesAreEqual(v16, CFSTR("EndDate")))
    {
      v16 = CFSTR("Date");
      SubresultWithType = DDResultGetSubresultWithType(v15, CFSTR("Date"));
      if (SubresultWithType)
      {
        v15 = (uint64_t)SubresultWithType;
      }
      else
      {
        v16 = CFSTR("DateTime");
        v20 = DDResultGetSubresultWithType(v15, CFSTR("DateTime"));
        if (v20)
          v15 = (uint64_t)v20;
      }
    }
    locale = a2;
    if (a5)
      v21 = (const __CFTimeZone *)CFRetain(a5);
    else
      v21 = CFTimeZoneCopyDefault();
    v22 = v21;
    v23 = copyBestDateForDate(a4);
    if (_typesAreEqual(v16, CFSTR("Timestamp")))
    {
      v24 = *(const __CFArray **)(v15 + 56);
      if (!v24 || CFArrayGetCount(*(CFArrayRef *)(v15 + 56)) != 1)
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v26 = v22;
        v27 = v23;
        v33 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BC07000, v33, OS_LOG_TYPE_ERROR, "Wrong number of results", buf, 2u);
        }
        goto LABEL_126;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v24, 0);
      v19 = DDResultCopyExtractedDateFromReferenceDateRec(ValueAtIndex, a2, a3, a4, a5, a6, a7, a8, a9 + 1);
      v26 = v22;
LABEL_20:
      v27 = v23;
      if (!(_DWORD)v19)
        goto LABEL_126;
LABEL_131:
      CFRelease(v26);
      CFRelease(v27);
      return v19;
    }
    if (_typesAreEqual(v16, CFSTR("DateTime")))
    {
      v28 = DDResultGetSubresultWithType(v15, CFSTR("SpecialDateTime"));
      v27 = v23;
      if (v28)
      {
        v29 = v28[10];
        if (!v29)
          v29 = v28[9];
        v26 = v22;
        if (a6)
          *a6 = 0;
        v69 = 0;
        *(_QWORD *)buf = 0;
        HIDWORD(v68) = 0;
        v30 = DDResultGetSubresultWithType(v15, CFSTR("Time"));
        v31 = DDResultGetSubresultWithType(v15, CFSTR("ApproxTime"));
        if (v30)
        {
          if (!v31)
            v31 = DDResultGetSubresultWithType(v15, CFSTR("SpecialDateTime"));
          v32 = extractHourMinuteSecondWithRefCopyTimeZone((uint64_t)v30, 0, locale, (int *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, (uint64_t)v31);
        }
        else
        {
          if (!v31)
          {
            LODWORD(v68) = -1;
            HourFromApproxTimeValue = extractHourFromApproxTimeValue(v29, (int *)&v68, locale);
            goto LABEL_86;
          }
          v43 = DDResultGetSubresultWithType(v15, CFSTR("ApproxTime"));
          v32 = extractHourMinuteSecondWithRefCopyTimeZone((uint64_t)v43, 0, locale, (int *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, 0);
        }
        v44 = v32;
        LODWORD(v68) = -1;
        HourFromApproxTimeValue = extractHourFromApproxTimeValue(v29, (int *)&v68, locale);
        if (v44)
        {
          if (HourFromApproxTimeValue)
          {
            if ((int)v68 > 11)
            {
              if ((_DWORD)v68 == 12 || SHIDWORD(v69) >= 12 && ((_DWORD)v68 == 15 || HIDWORD(v69) != 12))
                goto LABEL_90;
              v46 = HIDWORD(v69) + 12;
            }
            else
            {
              v46 = HIDWORD(v69) - 12;
              if (SHIDWORD(v69) <= 12 && (HIDWORD(v69) != 12 || (int)v69 < 1))
                goto LABEL_90;
            }
            HIDWORD(v69) = v46;
          }
LABEL_90:
          v50 = *(const void **)buf;
          if (!a7)
          {
            v19 = 1;
LABEL_106:
            if (a8 && v50)
              *a8 = CFRetain(v50);
            goto LABEL_131;
          }
          v67 = 0;
          if (*(_QWORD *)buf)
            v51 = *(const __CFTimeZone **)buf;
          else
            v51 = v22;
          v66 = 0;
          at = MEMORY[0x1A1ACA358](v23);
          CFCalendarSetTimeZone(a3, v51);
          CFCalendarDecomposeAbsoluteTime(a3, at, "yMd", (char *)&v67 + 4, &v67, &v66);
          v52 = DDResultGetSubresultWithType(v15, CFSTR("RelativeDay"));
          if (v52)
          {
            v53 = v52;
            v64 = -1;
            v54 = v52[10];
            if (!v54)
              v54 = v53[9];
            if (!extractInteger(v54, &v64)
              || !CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", HIDWORD(v67), v67, v66, HIDWORD(v69), v69, HIDWORD(v68)))
            {
              goto LABEL_126;
            }
            v55 = CFCalendarAddComponents(a3, &at, 0, "d", v64);
          }
          else
          {
            v56 = DDResultGetSubresultWithType(v15, CFSTR("Date"));
            if (v56
              && !DDResultExtractDayMonthYear((uint64_t)v56, locale, a3, &v66, &v67, (_DWORD *)&v67 + 1, (uint64_t)v23, v51))
            {
              goto LABEL_126;
            }
            v55 = CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", HIDWORD(v67), v67, v66, HIDWORD(v69), v69, HIDWORD(v68));
          }
          v19 = v55;
          if ((_DWORD)v55)
          {
            *a7 = CFDateCreate(0, at);
            v50 = *(const void **)buf;
            goto LABEL_106;
          }
LABEL_126:
          DetailedDescription = createDetailedDescription((_QWORD *)v15);
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v60 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = DetailedDescription;
            _os_log_error_impl(&dword_19BC07000, v60, OS_LOG_TYPE_ERROR, "Date extraction failed: could not parse %@", buf, 0xCu);
          }
          CFRelease(DetailedDescription);
          v19 = 0;
          goto LABEL_131;
        }
LABEL_86:
        if (HourFromApproxTimeValue)
          v49 = v68;
        else
          v49 = 12;
        LODWORD(v69) = 0;
        HIDWORD(v69) = v49;
        HIDWORD(v68) = 0;
        *(_QWORD *)buf = 0;
        goto LABEL_90;
      }
      v40 = DDResultGetSubresultWithType(v15, CFSTR("Date"));
      if (!v40)
      {
        v26 = v22;
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v47 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19BC07000, v47, OS_LOG_TYPE_ERROR, "should have a date in a DateTime", buf, 2u);
        }
        v19 = 1;
        goto LABEL_131;
      }
      v69 = 0;
      HIDWORD(v68) = 0;
      if (DDResultExtractDayMonthYear((uint64_t)v40, locale, a3, (_DWORD *)&v69 + 1, &v69, (_DWORD *)&v68 + 1, (uint64_t)a4, a5))
      {
        v41 = DDResultGetSubresultWithType(v15, CFSTR("Time"));
        v26 = v22;
        if (v41)
        {
          v19 = (uint64_t)v41;
          LODWORD(v68) = 0;
          v67 = 0;
          *(_QWORD *)buf = 0;
          v42 = locale;
        }
        else
        {
          v19 = (uint64_t)DDResultGetSubresultWithType(v15, CFSTR("ApproxTime"));
          LODWORD(v68) = 0;
          v67 = 0;
          *(_QWORD *)buf = 0;
          v42 = locale;
          if (!v19)
            goto LABEL_125;
        }
        v57 = DDResultGetSubresultWithType(v15, CFSTR("ApproxTime"));
        if (!extractHourMinuteSecondWithRefCopyTimeZone(v19, 0, v42, (int *)&v68, (_DWORD *)&v67 + 1, &v67, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, -1, (uint64_t)v57))goto LABEL_126;
        if (a6)
          *a6 = 0;
        if (!a7)
          goto LABEL_120;
        if (*(_QWORD *)buf)
          v58 = *(const __CFTimeZone **)buf;
        else
          v58 = v22;
        CFCalendarSetTimeZone(a3, v58);
        at = 0.0;
        v37 = HIDWORD(v68);
        v38 = v69;
        v39 = HIDWORD(v69);
        goto LABEL_119;
      }
    }
    else
    {
      if (!_typesAreEqual(v16, CFSTR("Date")))
      {
        if (!_typesAreEqual(v16, CFSTR("Time")) && !_typesAreEqual(v16, CFSTR("ApproxTime")))
        {
          v26 = v22;
          if (!_typesAreEqual(v16, CFSTR("TimeOffset")))
          {
            v19 = 0;
            v27 = v23;
            goto LABEL_131;
          }
          v27 = v23;
          *(_QWORD *)buf = MEMORY[0x1A1ACA358](v23);
          v48 = DDApplyTimeOffset(v15, a3, (CFAbsoluteTime *)buf, a6);
          v19 = v48;
          if (a7 && (_DWORD)v48)
          {
            *a7 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
            goto LABEL_131;
          }
          goto LABEL_125;
        }
        *(_QWORD *)buf = 0;
        at = MEMORY[0x1A1ACA358](v23);
        v26 = v22;
        CFCalendarSetTimeZone(a3, v22);
        v68 = 0;
        v69 = 0;
        v67 = 0;
        CFCalendarDecomposeAbsoluteTime(a3, at, "yMdH", (char *)&v69 + 4, &v69, (char *)&v68 + 4, &v68);
        v34 = -1;
        if (!a9)
        {
          v35 = _typesAreEqual(v16, CFSTR("Time"));
          v34 = v68;
          if (!v35)
            v34 = -1;
        }
        if (!extractHourMinuteSecondWithRefCopyTimeZone(v15, 0, a2, (int *)&v68, (_DWORD *)&v67 + 1, &v67, (CFTimeZoneRef *)buf, 0xFFFFFFFF, -1, v34, 0))
        {
          v19 = 0;
          goto LABEL_20;
        }
        v27 = v23;
        if (a6)
          *a6 = 0;
        if (!a7)
          goto LABEL_120;
        if (*(_QWORD *)buf)
          v36 = *(const __CFTimeZone **)buf;
        else
          v36 = v22;
        CFCalendarSetTimeZone(a3, v36);
        v38 = v69;
        v37 = HIDWORD(v69);
        v39 = HIDWORD(v68);
LABEL_119:
        CFCalendarComposeAbsoluteTime(a3, &at, "yMdHms", v37, v38, v39, v68, HIDWORD(v67), v67);
        *a7 = CFDateCreate(0, at);
LABEL_120:
        if (*(_QWORD *)buf)
        {
          if (a8)
            *a8 = *(CFTypeRef *)buf;
          else
            CFRelease(*(CFTypeRef *)buf);
        }
LABEL_124:
        v19 = 1;
LABEL_125:
        if ((_DWORD)v19)
          goto LABEL_131;
        goto LABEL_126;
      }
      if (a6)
        *a6 = 1;
      LODWORD(at) = 0;
      v69 = 0;
      v27 = v23;
      if (DDResultExtractDayMonthYear(v15, locale, a3, &at, (_DWORD *)&v69 + 1, &v69, (uint64_t)a4, a5))
      {
        v26 = v22;
        if (a7)
        {
          CFCalendarSetTimeZone(a3, v22);
          *(_QWORD *)buf = 0;
          CFCalendarComposeAbsoluteTime(a3, (CFAbsoluteTime *)buf, "yMdHms", v69, HIDWORD(v69), LODWORD(at), 12, 0, 0);
          *a7 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
        }
        goto LABEL_124;
      }
    }
    v26 = v22;
    goto LABEL_126;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v18 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BC07000, v18, OS_LOG_TYPE_ERROR, "result should not be NULL", buf, 2u);
  }
  return 0;
}

uint64_t DDResultBufferIsValidForPhoneNumber(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t result;
  uint64_t v8;
  int v9;
  BOOL v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  int v24;
  unsigned int v25;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  _BYTE v45[13];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  result = 1;
  if (!a1 || a3 < 1)
    return result;
  v8 = a2;
  if (!a4 && (unint64_t)a3 <= 8)
  {
    v9 = *(unsigned __int16 *)(a1 + 2 * a2);
    v10 = v9 == 48 && a3 == 3;
    v11 = v10;
    if (v10 || v9 != 48)
    {
      if (a2 < 4)
        v11 = 1;
      if ((v11 & 1) == 0)
        goto LABEL_82;
      return result;
    }
    if ((unint64_t)a3 >= 2)
    {
      v12 = a2 + 1;
      while (1)
      {
        v13 = *(unsigned __int16 *)(a1 + 2 * v12);
        if ((v13 - 58) <= 0xFFFFFFF5 && v13 != 42 && v13 != 35)
          break;
        if (++v12 >= a2 + a3)
          return 0;
      }
      return 1;
    }
    return 0;
  }
  if ((unint64_t)(a3 - 10) > 0xE)
    goto LABEL_81;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = a2 + a3;
  v23 = 1;
  do
  {
    v24 = *(unsigned __int16 *)(a1 + 2 * a2 + 2 * v14);
    if (v21 >= 14 && a2 + v14 == v21 && v18 <= 1)
    {
      result = 0;
      if ((unint64_t)(a2 + v14) > 0x10 || v18 != 1)
        return result;
      if (*(_WORD *)(a1 + 2) != 49 || *(_WORD *)(a1 + 4) != 49)
        return 0;
    }
    if (v24 == 45)
    {
      v19 |= v17;
      if (v19)
        return 1;
      v17 = 0;
      v23 = 0;
      ++v20;
      v25 = 10;
      v16 = v21;
    }
    else
    {
      if ((v24 - 48) <= 9)
      {
        v25 = v24 - 48;
        if (v21 <= 12)
          v45[v21] = v25;
        ++v21;
        if (v14 == v18 && v24 == 48)
          ++v18;
        goto LABEL_52;
      }
      if (v24 == 32)
      {
        v23 = 0;
        v15 |= (unint64_t)(v21 - 1) < 4;
LABEL_49:
        v25 = 10;
        goto LABEL_52;
      }
      if (v24 != 47)
      {
        if (v24 != 46)
          return 1;
        result = 1;
        if (v20 || v17 || v21 != 10)
          return result;
        v20 = 0;
        v17 = 0;
        ++v19;
        goto LABEL_49;
      }
      if (v17 > 0)
        return 0;
      v25 = 10;
      v17 = 1;
    }
LABEL_52:
    ++v14;
  }
  while (a2 + v14 < v22);
  if (v19 == 1)
  {
    if ((v23 & 1) == 0)
      goto LABEL_80;
    return 0;
  }
  if (!v19 && (v21 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v27 = v21 == 12 && v18 == 1;
    v28 = v27;
    if (v25 <= 9 && !v28)
    {
      v29 = v20 == 1 && v21 == 13;
      v30 = v29;
      if ((*(_WORD *)(a1 + 2 * v22 - 4) == 45 || v21 == a3 || v30) && DDIsValidEAN13OrUPCA((uint64_t)v45, v21))
        return 0;
    }
  }
LABEL_80:
  if (!a5 && v22 <= 12 && ((v15 ^ 1) & 1) != 0 && v20 == 1 && v21 == 9 && v16 == 5)
    return 0;
LABEL_81:
  if (v8 >= 4)
  {
LABEL_82:
    if ((unint64_t)v8 >= 0xA)
      v31 = v8 - 10;
    else
      v31 = 0;
    if (v8 > (unint64_t)v31)
    {
      do
      {
        v32 = v8 - 1;
        v33 = *(unsigned __int16 *)(a1 - 2 + 2 * v8);
        v34 = v33 > 0x3A;
        v35 = (1 << v33) & 0x400000100000200;
        if (v34 || v35 == 0)
        {
          v37 = 0;
          while (1)
          {
            v38 = strlen(DDResultBufferIsValidForPhoneNumber_labelsSuffixes[v37]);
            if (v32 - v31 >= v38)
            {
              v39 = v38;
              result = 0;
              if (v8 <= v31 || v39 < 2)
                return result;
              v40 = v8 - 1;
              while (1)
              {
                v41 = *(unsigned __int16 *)(a1 + 2 * v40);
                v42 = (unsigned __int16)DDResultBufferIsValidForPhoneNumber_labelsSuffixes[v37][v39 - 1];
                if (v42 != v41 && v42 + 32 != v41)
                  break;
                result = 0;
                if (v40 > v31)
                {
                  --v40;
                  if ((unint64_t)v39-- >= 3)
                    continue;
                }
                return result;
              }
            }
            ++v37;
            result = 1;
            if (v37 == 14)
              return result;
          }
        }
        --v8;
      }
      while (v32 > v31);
    }
  }
  return 1;
}

void DDLookupTableUpdateFromExternalFile(uint64_t a1, unsigned __int16 **a2, CFStringRef string)
{
  unsigned __int16 *v4;
  int8x16_t v6;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v8;
  CFIndex v9;
  int v10;
  int *v11;
  unsigned __int16 *v12;
  int8x16_t v13;
  unsigned __int16 *v14;
  off_t v15;
  _QWORD v16[6];
  char v17[256];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  if ((a1 & 0xFFFFFFFD) == 4)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __DDLookupTableUpdateFromExternalFile_block_invoke;
    v16[3] = &__block_descriptor_tmp_20;
    v16[4] = a2;
    v16[5] = v4;
    mmapSource(a1, 0, (uint64_t)v16);
    return;
  }
  v14 = 0;
  v15 = 0;
  if (v4)
    v6 = *(int8x16_t *)(v4 + 20);
  else
    v6 = 0uLL;
  v13 = v6;
  if (!string)
  {
    v10 = 1;
    if (_DDTriePathForSource(a1, v17, 0, 1, 0))
      v10 = DDautommap(v17, &v14, &v15, &v13);
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(string);
  if (MaximumSizeOfFileSystemRepresentation >= 1)
  {
    v8 = &v13.i8[-((MEMORY[0x1E0C80A78](MaximumSizeOfFileSystemRepresentation) + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (CFStringGetFileSystemRepresentation(string, v8, v9))
      v10 = DDautommap(v8, &v14, &v15, &v13);
    else
      v10 = 1;
    goto LABEL_13;
  }
LABEL_14:
  if (v4)
  {
    v11 = (int *)*((_QWORD *)v4 + 4);
    if (v11)
    {
      munmap(v11, v11[1]);
      *((_QWORD *)v4 + 5) = 0;
      *((_QWORD *)v4 + 6) = 0;
      *((_QWORD *)v4 + 4) = 0;
    }
    CFRelease(v4);
  }
  v12 = v14;
  if (v14)
    v12 = (unsigned __int16 *)DDLookupTableCreateFromCacheData(v14, v15, v13.i64[0], v13.i64[1]);
  *a2 = v12;
}

void DDLookupTablePrepareToScan(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFData *v4;
  const __CFData *v5;
  const void *v6;

  if (!a1[2])
  {
    v2 = a1[7];
    a1[2] = DDStaticLookupCreateWithDynamicTrie(v2, 0, 0, 0);
    DDLookupTrieDestroy(v2);
    a1[7] = 0;
    v3 = a1[8];
    if (v3)
    {
      v5 = (const __CFData *)a1[9];
      v4 = (const __CFData *)a1[10];
      v6 = (const void *)a1[11];
      a1[3] = DDStaticLookupCreateWithDynamicTrie(a1[8], v5, v4, v6);
      if (v5)
      {
        CFRelease(v5);
        a1[9] = 0;
      }
      if (v4)
      {
        CFRelease(v4);
        a1[10] = 0;
      }
      if (v6)
      {
        CFRelease(v6);
        a1[11] = 0;
      }
      DDLookupTrieDestroy(v3);
      a1[8] = 0;
    }
  }
}

_QWORD *DDLookupTableCreateFromCacheData(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  _QWORD *v13;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  uint64_t v23;
  int **v24;
  int **v25;
  CFTypeID v26;
  _QWORD *Instance;
  unint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int **v32;
  NSObject *v33;
  int v34;
  int v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)a1 + 1) != a2)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v12 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    v30 = *((_DWORD *)a1 + 1);
    v35 = 67109376;
    LODWORD(v36) = v30;
    WORD2(v36) = 2048;
    *(_QWORD *)((char *)&v36 + 6) = a2;
    v9 = "length mismatch on LookupTable Cache (%d, %ld)";
    v10 = v12;
    v11 = 18;
    goto LABEL_43;
  }
  v6 = a1[1];
  if (v6 - 8 <= 0xFFFFFFFA)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v7 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    v8 = a1[1];
    v35 = 67109632;
    LODWORD(v36) = v8;
    WORD2(v36) = 1024;
    *(_DWORD *)((char *)&v36 + 6) = 3;
    WORD5(v36) = 1024;
    HIDWORD(v36) = 7;
    v9 = "version mismatch on LookupTable Cache (%d, min supported %d, max supported %d)";
    v10 = v7;
    v11 = 20;
LABEL_43:
    _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v35, v11);
    return 0;
  }
  if (*a1 != 57054)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(v35) = 0;
    v9 = "magic mismatch on LookupTable Cache";
LABEL_24:
    v10 = v20;
    v11 = 2;
    goto LABEL_43;
  }
  v17 = *((_DWORD *)a1 + 4);
  if (v17 >= 1)
  {
    v18 = *((_DWORD *)a1 + 5);
    if (v18 < 0 || v17 + v18 + 24 > (int)a2)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v19 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        return 0;
      v35 = 136315138;
      *(_QWORD *)&v36 = "ContextStaticTrie";
      v9 = "corruption of %s";
      goto LABEL_37;
    }
  }
  if (v6 <= 5)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v21 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v34 = a1[1];
      v35 = 67109120;
      LODWORD(v36) = v34;
      _os_log_error_impl(&dword_19BC07000, v21, OS_LOG_TYPE_ERROR, "Lookup tables before version 6 (loading:%d) have issues. Might fail when loading context or threshold data. This support is only temporary, please update your files to v6 NOW (DDCore-492.0)", (uint8_t *)&v35, 8u);
    }
  }
  v22 = *((int *)a1 + 2);
  v23 = *((int *)a1 + 3);
  if ((int)v22 >= 1 && ((v23 & 0x80000000) != 0 || (int)v22 + (int)v23 + 24 > (int)a2))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    v35 = 136315138;
    *(_QWORD *)&v36 = "StaticTrie";
    v9 = "corruption of %s";
LABEL_37:
    v10 = v19;
    v11 = 12;
    goto LABEL_43;
  }
  v24 = DDStaticLookupCreateWithCache((unsigned __int16 *)((char *)a1 + v23 + 24), v22, a1[1]);
  if (!v24)
  {
    v31 = *((unsigned int *)a1 + 2);
    if ((int)v31 < 1 || (uint64_t)a1 + v31 + *((int *)a1 + 3) + 24 > a2)
      return 0;
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(v35) = 0;
    v9 = "Static lookup creation failed";
    goto LABEL_24;
  }
  v25 = v24;
  v26 = DDTypeRegister(&DDLookupTableGetTypeID_typeID);
  Instance = (_QWORD *)DDTypeCreateInstance_(0, v26, 0x88uLL);
  v13 = Instance;
  Instance[4] = a1;
  Instance[5] = a3;
  Instance[6] = a4;
  Instance[2] = v25;
  v28 = *((unsigned int *)a1 + 4);
  if ((int)v28 >= 1 && (v29 = *((int *)a1 + 5), (uint64_t)(v28 + v29 + 24) <= a2))
  {
    v32 = DDStaticLookupCreateWithCache((unsigned __int16 *)((char *)a1 + v29 + 24), v28, a1[1]);
    v13[3] = v32;
    if (!v32)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v33 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v35) = 0;
        _os_log_error_impl(&dword_19BC07000, v33, OS_LOG_TYPE_ERROR, "Failed to load context tables. Results will be less accurate (you'll miss some)", (uint8_t *)&v35, 2u);
      }
    }
  }
  else
  {
    Instance[3] = 0;
  }
  return v13;
}

_QWORD *DDLexemCacheCreate()
{
  _QWORD *v0;

  v0 = malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040B8F6FDBAuLL);
  v0[1] = malloc_type_calloc(0x90uLL, 8uLL, 0x2004093837F09uLL);
  v0[3] = 144;
  v0[5] = malloc_type_calloc(0x60uLL, 8uLL, 0x2004093837F09uLL);
  *((_OWORD *)v0 + 3) = xmmword_19BC3FC80;
  DDLexemCacheClear((uint64_t)v0);
  return v0;
}

void DDLexemCacheClear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 1)
  {
    for (i = 0; i < v2; ++i)
    {
      v5 = *(_QWORD *)(a1 + 24);
      v4 = *(_QWORD *)(a1 + 32);
      if (i + v4 < v5)
        v5 = 0;
      v6 = i + v4 - v5;
      v7 = *(_QWORD *)(a1 + 8);
      v8 = *(_QWORD *)(v7 + 8 * v6);
      if (v8)
      {
        DDLexemCacheItemReset(*(_QWORD *)(v7 + 8 * v6));
        DDLexemCacheInsertItemInFreeArray((char *)a1, v8);
        v2 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v6) = 0;
      }
    }
  }
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9)
    DDLexemCacheItemReset(v9);
}

void DDGlobalFilterBlocks_block_invoke_13(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  CFIndex v11;
  CFIndex v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;

  Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    v4 = Count;
    v5 = 1;
    v6 = 2;
    do
    {
      v7 = *((_QWORD *)CFArrayGetValueAtIndex(theArray, v5) + 2);
      v8 = (uint64_t)(int)v7 >> 16;
      v9 = HIDWORD(v7);
      v10 = v6;
      do
      {
        v11 = v10 - 1;
        v12 = v10 - 2;
        v13 = *((_QWORD *)CFArrayGetValueAtIndex(theArray, v10 - 2) + 2);
        v14 = (uint64_t)(int)v13 >> 16;
        if ((int)v14 < (int)v8)
          break;
        v15 = HIDWORD(v13);
        if ((int)v14 <= (int)v8 && (int)v15 <= (int)v9)
          break;
        CFArrayExchangeValuesAtIndices(theArray, v12, v11);
        v10 = v11;
      }
      while (v11 > 1);
      ++v5;
      ++v6;
    }
    while (v5 != v4);
  }
}

void DDGlobalFilterBlocks_block_invoke_10(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v4;
  const void *ValueAtIndex;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _QWORD *v9;
  CFIndex v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  const __CFString *v19;
  CFIndex v20;
  int v21;
  const __CFString *v22;
  CFComparisonResult v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  const __CFString *v28;
  const __CFString *v29;
  CFIndex v30;
  CFIndex Length;

  Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    v4 = Count;
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
    v6 = *((_QWORD *)ValueAtIndex + 2);
    v7 = *((_QWORD *)ValueAtIndex + 3);
    v8 = !HIDWORD(v6)
      && !((int)v6 >> 16)
      && CFStringCompare(*((CFStringRef *)ValueAtIndex + 8), CFSTR("AuthCode"), 0) == kCFCompareEqualTo;
    v9 = CFArrayGetValueAtIndex(theArray, 0);
    v10 = 1;
    while (1)
    {
      v11 = CFArrayGetValueAtIndex(theArray, v10);
      v12 = v11;
      v13 = v11[2];
      v14 = v11[3];
      v15 = (uint64_t)(int)v7 >> 16;
      v16 = (uint64_t)(int)v13 >> 16;
      if ((int)v15 < (int)v16 || ((int)v15 <= (int)v16 ? (v17 = SHIDWORD(v7) <= SHIDWORD(v13)) : (v17 = 0), v17))
      {
        if ((_DWORD)v15 != (_DWORD)v16)
          goto LABEL_19;
        v18 = HIDWORD(v13) - HIDWORD(v7) < 50 || v8;
        if (v18 != 1)
          goto LABEL_19;
        v19 = (const __CFString *)v11[8];
        if (v19 != (const __CFString *)v9[8] || CFStringCompare(v19, CFSTR("AuthCode"), 0))
          goto LABEL_19;
        v29 = (const __CFString *)v9[9];
        Length = CFStringGetLength(v29);
        v28 = (const __CFString *)v12[9];
        v20 = CFStringGetLength(v28);
        v21 = Length == v20 && !v8;
        if (v21 == 1)
        {
          v22 = v29;
          v30 = v20;
          v23 = CFStringCompare(v22, v28, 0);
          v20 = v30;
          if (v23 == kCFCompareEqualTo)
            goto LABEL_19;
        }
        v24 = v9[6];
        v25 = v12[6];
        if (v8)
          break;
        v26 = Length == v20;
        if (v24 <= v25)
          v26 = 0;
        if (Length <= v20 && !v26)
          break;
      }
      CFArrayRemoveValueAtIndex(theArray, v10);
      --v4;
      v14 = v7;
      v12 = v9;
LABEL_20:
      v9 = v12;
      v7 = v14;
      if (v10 >= v4)
        return;
    }
    v27 = v24 < v25 && Length == v20;
    if (Length < v20 || v27)
    {
      CFArrayRemoveValueAtIndex(theArray, v10 - 1);
      --v4;
      goto LABEL_20;
    }
LABEL_19:
    ++v10;
    goto LABEL_20;
  }
}

uint64_t DDFastIntegerExtraction(const __CFString *a1, _DWORD *a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;

  v6 = 0;
  if (DDExtractSimpleInteger(a1, &v6))
  {
    v4 = v6;
    if (v6 == (int)v6)
      goto LABEL_5;
  }
  result = DDExtractKanjiNumber(a1, &v6);
  if (!(_DWORD)result)
    return result;
  v4 = v6;
  if (v6 != (int)v6)
    return 0;
LABEL_5:
  if (a2)
    *a2 = v4;
  return 1;
}

uint64_t DDExtractSimpleInteger(const __CFString *a1, uint64_t *a2)
{
  CFIndex Length;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int CharacterAtIndex;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned __int16 v13;

  Length = CFStringGetLength(a1);
  if (Length < 1)
  {
    v7 = 0;
LABEL_25:
    if (!a2)
      return 1;
    goto LABEL_26;
  }
  v5 = Length;
  v6 = 0;
  v7 = 0;
  v8 = 1;
  while (1)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v5 + v6 - 1);
    if ((CharacterAtIndex - 2406) >= 0xA)
      v10 = CharacterAtIndex;
    else
      v10 = CharacterAtIndex - 2358;
    if ((CharacterAtIndex - 3664) <= 9)
      v11 = CharacterAtIndex - 3616;
    else
      v11 = v10;
    if ((CharacterAtIndex - 1776) <= 9)
      v12 = CharacterAtIndex - 1728;
    else
      v12 = v11;
    if ((CharacterAtIndex - 1632) <= 9)
      v13 = CharacterAtIndex - 1584;
    else
      v13 = v12;
    if ((unsigned __int16)(CharacterAtIndex + 240) <= 9u)
      v13 = CharacterAtIndex + 288;
    if ((unsigned __int16)(v13 - 48) <= 9u)
    {
      if (v8 > 0xCCCCCCCCCCCCCCBLL)
        return 0;
      v7 += (v13 - 48) * v8;
      v8 *= 10;
      goto LABEL_22;
    }
    if (v13 != 46)
      break;
    if (v6)
      return 0;
LABEL_22:
    --v6;
    if (v5 + v6 <= 0)
      goto LABEL_25;
  }
  if (v13 != 45 || v5 + v6 != 1)
    return 0;
  v7 = -v7;
  if (a2)
LABEL_26:
    *a2 = v7;
  return 1;
}

CFIndex DDCreatePunycodedString(const __CFString *a1, int a2, int a3, int a4)
{
  const __CFString *v7;
  uint64_t Length;
  CFIndex v9;
  CFIndex v10;
  CFIndex v11;
  int v12;
  CFAllocatorRef *v13;
  CFIndex v14;
  const __CFAllocator *v15;
  const __CFString *v16;
  const __CFString *v17;
  CFIndex v18;
  const __CFString *v19;
  __CFString *MutableCopy;
  CFIndex v21;
  const __CFAllocator *v22;
  const __CFString *v23;
  const __CFString *v24;
  CFStringRef v25;
  CFIndex v26;
  __CFString *v27;
  const UIDNA *v28;
  UIDNA *v29;
  int32_t v30;
  const __CFString *v31;
  __CFString *v32;
  const __CFString *v33;
  UIDNAInfo pInfo;
  UErrorCode pErrorCode;
  CFIndex usedBufLen;
  CFRange v37;
  char dest[512];
  CFRange result;
  uint64_t v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;
  CFRange v45;
  CFRange v46;
  CFRange v47;
  CFRange v48;
  CFRange v49;

  v7 = a1;
  v40 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  if (a2)
  {
    result.length = 0;
    result.location = 0;
    v44.location = 0;
    v44.length = Length;
    if (CFStringFindWithOptions(v7, CFSTR("://"), v44, 0, &result))
      v9 = result.length + result.location;
    else
      v9 = 0;
    Length -= v9;
    if (!a3)
      goto LABEL_13;
  }
  else
  {
    v9 = 0;
    if (!a3)
      goto LABEL_13;
  }
  if (DDCreatePunycodedString_sOnce != -1)
    dispatch_once(&DDCreatePunycodedString_sOnce, &__block_literal_global_191);
  result.length = 0;
  result.location = 0;
  if (DDCreatePunycodedString_componentSeparatorSet)
  {
    v45.location = v9;
    v45.length = Length;
    if (CFStringFindCharacterFromSet(v7, (CFCharacterSetRef)DDCreatePunycodedString_componentSeparatorSet, v45, 0, &result))
    {
      Length = result.location - v9;
    }
  }
LABEL_13:
  v10 = CFStringGetLength(v7);
  if (v10)
  {
    v11 = v10;
    v10 = 0;
    if ((v9 & 0x8000000000000000) == 0 && Length + v9 <= v11 && Length <= 512)
    {
      v37.location = 0;
      v37.length = 0;
      v46.location = v9;
      v46.length = Length;
      v12 = CFStringFindWithOptions(v7, CFSTR("@"), v46, 0, &v37);
      v13 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
      if (!v12)
        goto LABEL_28;
      v14 = v37.location - v9 + v37.length;
      if (a4 && v14 >= 2)
      {
        v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v47.location = v9;
        v47.length = v14 - 1;
        v16 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, v47);
        if (_shouldPunyCodeHost(v16))
        {
          v17 = CFURLCreateStringByReplacingPercentEscapes(v15, v16, &stru_1E3C973D8);
          v18 = CFStringGetLength(v16);
          CFRelease(v16);
          if (!v17)
            return 0;
          v19 = CFURLCreateStringByAddingPercentEscapes(v15, v17, &stru_1E3C973D8, &stru_1E3C973D8, 0x8000100u);
          CFRelease(v17);
          if (!v19)
            return 0;
          MutableCopy = CFStringCreateMutableCopy(v15, 0, v7);
          v7 = MutableCopy;
          if (!MutableCopy)
          {
            v33 = v19;
            goto LABEL_43;
          }
          v41.location = v9;
          v41.length = v14 - 1;
          CFStringReplace(MutableCopy, v41, v19);
          CFAutorelease(v7);
          v21 = v14 - v18 + CFStringGetLength(v19);
          CFRelease(v19);
          goto LABEL_27;
        }
        CFRelease(v16);
      }
      v21 = v14;
LABEL_27:
      Length -= v14;
      v9 += v21;
LABEL_28:
      v22 = *v13;
      v48.location = v9;
      v48.length = Length;
      v23 = CFStringCreateWithSubstring(*v13, v7, v48);
      if (v23)
      {
        v24 = v23;
        if (_shouldPunyCodeHost(v23))
        {
          v49.location = v9;
          v49.length = Length;
          if (!CFStringFindWithOptions(v7, CFSTR("%"), v49, 0, 0)
            || (v25 = CFURLCreateStringByReplacingPercentEscapes(v22, v24, &stru_1E3C973D8),
                CFRelease(v24),
                (v24 = v25) != 0))
          {
            usedBufLen = 0;
            v26 = CFStringGetLength(v24);
            v42.location = 0;
            v42.length = v26;
            v27 = 0;
            if (CFStringGetBytes(v24, v42, 0x8000100u, 0, 0, (UInt8 *)&result, 512, &usedBufLen) == v26)
            {
              pErrorCode = U_ZERO_ERROR;
              v28 = (const UIDNA *)MEMORY[0x1A1ACAF70](0, &pErrorCode);
              if (v28 && pErrorCode == U_ZERO_ERROR)
              {
                v29 = v28;
                pInfo = (UIDNAInfo)xmmword_19BC3FCA0;
                v30 = uidna_nameToASCII_UTF8(v28, (const char *)&result, usedBufLen, dest, 512, &pInfo, &pErrorCode);
                if (v30 < 1 || pErrorCode)
                {
                  uidna_close(v29);
                }
                else
                {
                  v31 = CFStringCreateWithBytes(v22, (const UInt8 *)dest, v30, 0x8000100u, 0);
                  uidna_close(v29);
                  if (v31)
                  {
                    if (CFStringCompare(v24, v31, 0))
                    {
                      v32 = CFStringCreateMutableCopy(v22, 0, v7);
                      v27 = v32;
                      if (v32)
                      {
                        v43.location = v9;
                        v43.length = Length;
                        CFStringReplace(v32, v43, v31);
                      }
                    }
                    else
                    {
                      v27 = 0;
                    }
                    CFRelease(v31);
                    goto LABEL_46;
                  }
                }
              }
              v27 = 0;
            }
LABEL_46:
            CFRelease(v24);
            return (CFIndex)v27;
          }
          return 0;
        }
        CFRetain(v7);
        v33 = v24;
LABEL_43:
        CFRelease(v33);
        return (CFIndex)v7;
      }
      return 0;
    }
  }
  return v10;
}

void DDCachingStringTokenizerResetStringWithOptions(uint64_t a1, uint64_t a2, int a3)
{
  const void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = *(const void **)(a1 + 32);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 32) = 0;
  }
  if (*(_BYTE *)(a1 + 121))
  {
    *(_QWORD *)(a1 + 80) = -1;
    *(_QWORD *)(a1 + 112) = -1;
    v7 = *(const void **)(a1 + 40);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(a1 + 40) = 0;
    }
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 72);
      if (v9 >= 1)
      {
        v10 = 16;
        v11 = *(_QWORD *)(a1 + 72);
        do
        {
          v12 = *(void **)(*(_QWORD *)(a1 + 48) + v10);
          if (v12)
            free(v12);
          v10 += 32;
          --v11;
        }
        while (v11);
        bzero(v8, 32 * v9);
      }
    }
    else
    {
      *(_QWORD *)(a1 + 64) = 64;
      *(_QWORD *)(a1 + 48) = malloc_type_calloc(0x40uLL, 0x20uLL, 0x10200406A33E52CuLL);
    }
    *(_OWORD *)(a1 + 104) = xmmword_19BC3FC50;
    *(_QWORD *)(a1 + 72) = 0;
    *(_QWORD *)(a1 + 80) = -1;
    *(_QWORD *)(a1 + 88) = -1;
    *(_QWORD *)(a1 + 96) = -1;
    *(_BYTE *)(a1 + 120) = 0;
    *(_QWORD *)(a1 + 56) = a2;
    if (a3 && *(_QWORD *)(a1 + 40))
      NLStringTokenizerSetStringWithOptions();
  }
}

_QWORD *DDCacheCreateFromFileAtPathWithExtraChecks(const char *a1, const __CFString *a2, void *a3, int a4)
{
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  CFTypeID v24;
  _QWORD *Instance;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v31;
  int v32;
  __int16 v33;
  _WORD v34[11];

  *(_QWORD *)&v34[7] = *MEMORY[0x1E0C80C00];
  v7 = DDmmap(a1, a3);
  if (!v7)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v13 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_error_impl(&dword_19BC07000, v13, OS_LOG_TYPE_ERROR, "DataDetectorsCore: mmapping the cache file failed", (uint8_t *)&v31, 2u);
    }
    return 0;
  }
  v8 = v7;
  if ((unint64_t)a3 < 0x34)
  {
LABEL_47:
    munmap(v8, (size_t)a3);
    return 0;
  }
  if (a4 && *v7 != 43962)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v9 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    LOWORD(v31) = 0;
    v10 = "DDCache creation: bad magic cookie";
    v11 = v9;
    v12 = 2;
    goto LABEL_46;
  }
  if (a4)
  {
    if (v7[1] == 56)
    {
      if (v7[2] == (_DWORD)a3)
      {
        v14 = v7[11];
        if (v14 < 0)
          goto LABEL_47;
        v15 = v7[12];
        if (v15 < 0)
          goto LABEL_47;
        if ((v14 & 3) != 0)
          goto LABEL_47;
        if ((unint64_t)(v15 + v14) + 52 > (unint64_t)a3)
          goto LABEL_47;
        v16 = v7[3];
        if (v16 < 0)
          goto LABEL_47;
        v17 = v7[4];
        if (v17 < 0)
          goto LABEL_47;
        if ((v16 & 3) != 0)
          goto LABEL_47;
        if ((unint64_t)(v17 + v16) + 52 > (unint64_t)a3)
          goto LABEL_47;
        v18 = v7[5];
        if (v18 < 0)
          goto LABEL_47;
        v19 = v7[6];
        if (v19 < 0)
          goto LABEL_47;
        if ((v18 & 3) != 0)
          goto LABEL_47;
        if ((unint64_t)(v19 + v18) + 52 > (unint64_t)a3)
          goto LABEL_47;
        v20 = v7[7];
        if (v20 < 0)
          goto LABEL_47;
        v21 = v7[8];
        if (v21 < 0)
          goto LABEL_47;
        if ((v20 & 3) != 0)
          goto LABEL_47;
        if ((unint64_t)(v21 + v20) + 52 > (unint64_t)a3)
          goto LABEL_47;
        v22 = v7[9];
        if (v22 < 0)
          goto LABEL_47;
        v23 = v7[10];
        if (v23 < 0 || (v22 & 3) != 0 || (unint64_t)(v23 + v22) + 52 > (unint64_t)a3)
          goto LABEL_47;
        goto LABEL_36;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v28 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      v29 = v8[2];
      v31 = 67109376;
      v32 = v29;
      v33 = 2048;
      *(_QWORD *)v34 = a3;
      v10 = "DDCache creation: bad size : %d != %ld";
      v11 = v28;
      v12 = 18;
    }
    else
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v26 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      v27 = v8[1];
      v31 = 67109632;
      v32 = v27;
      v33 = 1024;
      *(_DWORD *)v34 = 56;
      v34[2] = 1024;
      *(_DWORD *)&v34[3] = 56;
      v10 = "DDCache creation: bad version (file: %d, min supported: %d, max supported: %d)";
      v11 = v26;
      v12 = 20;
    }
LABEL_46:
    _os_log_error_impl(&dword_19BC07000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v31, v12);
    goto LABEL_47;
  }
LABEL_36:
  v24 = DDTypeRegister(&DDCacheGetTypeID_typeID);
  Instance = (_QWORD *)DDTypeCreateInstance_(0, v24, 0x48uLL);
  Instance[2] = (char *)v8 + v8[3] + 52;
  Instance[3] = (int)v8[4];
  Instance[4] = (char *)v8 + v8[5] + 52;
  Instance[5] = (int)v8[6];
  Instance[6] = (char *)v8 + v8[7] + 52;
  Instance[7] = (int)v8[8];
  Instance[8] = v8;
  if (a2)
    Instance[10] = CFStringCreateCopy(0, a2);
  return Instance;
}

BOOL DDAddressResultCanBeMergedWith(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    result = _typesAreEqual(*(CFStringRef *)(a2 + 64), CFSTR("FullAddress"));
    if (!result)
      return result;
    v5 = 0;
    v7[0] = CFSTR("Street");
    v7[1] = CFSTR("StreetNumber");
    v7[2] = CFSTR("StreetName");
    v7[3] = CFSTR("POBox");
    v7[4] = CFSTR("ZipCode");
    v7[5] = CFSTR("City");
    v7[6] = CFSTR("State");
    v7[7] = CFSTR("Country");
    while (1)
    {
      v6 = (const __CFString *)v7[v5];
      if (DDResultGetSubresultWithType(a1, v6))
      {
        if (DDResultGetSubresultWithType(a2, v6))
          break;
      }
      if (++v5 == 8)
        return 1;
    }
  }
  return 0;
}

void sub_19BC1AD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_19BC1B2D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19BC1B4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_19BC1B760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getFoldingOffset(int a1)
{
  return a1 & ((__int16)a1 >> 15) & 0x7FFF;
}

void dd_icu_3_6__5_0_2::RuleBasedClassifier::~RuleBasedClassifier(dd_icu_3_6__5_0_2::RuleBasedClassifier *this)
{
  dd_icu_3_6__5_0_2::RuleBasedClassifier::~RuleBasedClassifier(this);
  JUMPOUT(0x1A1ACA898);
}

{
  UText *v2;
  uint64_t v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3C946C8;
  v2 = (UText *)*((_QWORD *)this + 4);
  if (v2)
    utext_close(v2);
  v3 = *((_QWORD *)this + 7);
  if (v3)
    MEMORY[0x1A1ACA898](v3, 0x10F0C40ABC2424ELL);
  v4 = (const void *)*((_QWORD *)this + 3);
  if (v4)
    CFRelease(v4);
}

uint64_t DDComputeDominantScriptOrLanguage(const __CFString *a1)
{
  CFIndex Length;
  uint64_t v3;
  int v4;
  char v5;
  char v6;
  char v7;
  int v8;
  CFIndex v9;
  unsigned int CharacterAtIndex;
  int v11;
  int v12;
  unsigned int v13;
  int16x4_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t result;
  uint64_t i;
  unsigned int v25;
  CFIndex v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 12;
  Length = CFStringGetLength(a1);
  if (Length >= 150)
    v3 = 150;
  else
    v3 = Length;
  v41 = 0u;
  v42 = 0u;
  if (Length <= 0)
    goto LABEL_107;
  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  v32 = 0;
  v33 = 0;
  v30 = 0;
  v31 = 0;
  v4 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  while (2)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v9);
    if ((unsigned __int16)((CharacterAtIndex & 0xFFDF) - 65) <= 0x19u)
    {
LABEL_8:
      ++v4;
      goto LABEL_13;
    }
    if (CharacterAtIndex <= 0x2E && ((1 << CharacterAtIndex) & 0x708000000000) != 0
      || CharacterAtIndex == 173
      || CharacterAtIndex - 48 < 0xA
      || (unsigned __int16)(CharacterAtIndex - 188) <= 2u
      || CharacterAtIndex < 0x20
      || (unsigned __int16)(CharacterAtIndex - 127) <= 0x20u
      || CharacterAtIndex < 0xC0
      || (CharacterAtIndex & 0xFFDF) == 0xD7)
    {
      goto LABEL_12;
    }
    if (CharacterAtIndex <= 0x2AF)
      goto LABEL_8;
    if (CharacterAtIndex <= 0x36F)
    {
LABEL_12:
      ++v8;
      goto LABEL_13;
    }
    if (CharacterAtIndex <= 0x3FF)
    {
      ++HIDWORD(v40);
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x530 || CharacterAtIndex == 7467)
    {
      LOBYTE(v40) = v40 + 1;
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x590 || (unsigned __int16)(CharacterAtIndex + 1261) <= 4u)
    {
      ++BYTE4(v39);
      goto LABEL_13;
    }
    if (CharacterAtIndex < 0x600 || (unsigned __int16)(CharacterAtIndex + 1251) <= 0x32u)
    {
      LOBYTE(v39) = v39 + 1;
      goto LABEL_13;
    }
    if ((unsigned __int16)(CharacterAtIndex + 400) < 0x8Fu
      || CharacterAtIndex < 0x700
      || (unsigned __int16)(CharacterAtIndex + 1200) <= 0x2AFu)
    {
      ++v38;
      goto LABEL_13;
    }
    v11 = CharacterAtIndex & 0xFF80;
    switch((unsigned __int16)((CharacterAtIndex & 0xFF80) - 2304) >> 7)
    {
      case 0:
        if ((CharacterAtIndex & 0xFFFE) == 0x964)
          goto LABEL_12;
        ++BYTE4(v31);
        goto LABEL_13;
      case 1:
        ++BYTE4(v33);
        goto LABEL_13;
      case 2:
        LOBYTE(v34) = v34 + 1;
        goto LABEL_13;
      case 3:
        ++BYTE4(v34);
        goto LABEL_13;
      case 4:
        LOBYTE(v35) = v35 + 1;
        goto LABEL_13;
      case 5:
        ++BYTE4(v35);
        goto LABEL_13;
      case 6:
        LOBYTE(v36) = v36 + 1;
        goto LABEL_13;
      case 7:
        ++BYTE4(v36);
        goto LABEL_13;
      case 8:
        ++v37;
        goto LABEL_13;
      case 9:
        ++v5;
        goto LABEL_13;
      case 10:
        ++v6;
        goto LABEL_13;
      case 11:
        ++v7;
        goto LABEL_13;
      default:
        v26 = v3;
        if ((unsigned __int16)((unsigned __int16)(CharacterAtIndex + 21504) >> 10) < 0xBu
          || (v12 = CharacterAtIndex & 0xFF00, v12 == 4352))
        {
          LOBYTE(v33) = v33 + 1;
          goto LABEL_61;
        }
        v13 = CharacterAtIndex;
        if (CharacterAtIndex - 12352 <= 0xBF)
        {
          LOBYTE(v31) = v31 + 1;
          goto LABEL_61;
        }
        v14 = vdup_n_s16(CharacterAtIndex);
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0xFC006071800200, (uint16x4_t)vadd_s16(v14, (int16x4_t)0x10001F0D1800700))) & 1) != 0)
        {
          HIDWORD(v30) = v27 + 1;
          LODWORD(v27) = v27 + 1;
          goto LABEL_61;
        }
        if (CharacterAtIndex - 8204 < 6
          || CharacterAtIndex == 8217
          || CharacterAtIndex - 8234 < 5
          || (CharacterAtIndex & 0xFFF0) == 0x2060
          || CharacterAtIndex == 65279
          || (CharacterAtIndex & 0xFFF0) == 0xFE00)
        {
          goto LABEL_60;
        }
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x700E000260030, (uint16x4_t)vadd_s16(v14, (int16x4_t)0x50058E0E300E295))) & 1) != 0|| v12 == 7680|| (CharacterAtIndex & 0xFFE0) == 0x2C60)
        {
          ++v4;
        }
        else if (CharacterAtIndex - 7462 < 5 || v12 == 7936)
        {
          ++HIDWORD(v40);
        }
        else if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x300030003F0065, (uint16x4_t)vadd_s16(v14, (int16x4_t)0xDF30DF90E2D4E265))) & 1) != 0|| (CharacterAtIndex & 0xFFE0) == 0xA700|| CharacterAtIndex - 0x2000 < 0xC00|| CharacterAtIndex > 0xFFFB|| v11 == 11776)
        {
LABEL_60:
          ++v8;
        }
        else if (v12 == 3840)
        {
          ++BYTE4(v32);
        }
        else if (CharacterAtIndex - 4096 > 0x9F)
        {
          if (CharacterAtIndex - 4256 > 0x5F)
          {
            if (CharacterAtIndex - 4608 > 0x19F)
            {
              if (CharacterAtIndex - 5024 > 0x5F)
              {
                if (CharacterAtIndex - 5120 > 0x27F)
                {
                  if (v11 == 6016)
                  {
                    LOBYTE(v30) = v30 + 1;
                  }
                  else if (CharacterAtIndex - 6144 > 0xAF)
                  {
                    if (CharacterAtIndex >> 10 == 54
                      && v9 + 1 < v26
                      && CFStringGetCharacterAtIndex(a1, v9 + 1) >> 10 >= 0x37u
                      && CFStringGetCharacterAtIndex(a1, v9 + 1) >> 13 <= 6u)
                    {
                      v15 = CFStringGetCharacterAtIndex(a1, v9);
                      if (((v15 + (v13 << 10) - 56613888) & 0xFFFF0000) == 0x10000)
                      {
                        ++v8;
                      }
                      else
                      {
                        v16 = v27;
                        v17 = HIDWORD(v30);
                        if (v15 + (v13 << 10) - 56744960 < 0x10000)
                          v17 = v27 + 1;
                        HIDWORD(v30) = v17;
                        if (v15 + (v13 << 10) - 56744960 < 0x10000)
                          v16 = v27 + 1;
                        LODWORD(v27) = v16;
                      }
                      ++v9;
                    }
                  }
                  else
                  {
                    ++BYTE4(v29);
                  }
                }
                else
                {
                  LOBYTE(v29) = v29 + 1;
                }
              }
              else
              {
                ++BYTE4(v27);
              }
            }
            else
            {
              ++BYTE4(v28);
            }
          }
          else
          {
            LOBYTE(v32) = v32 + 1;
          }
        }
        else
        {
          LOBYTE(v28) = v28 + 1;
        }
LABEL_61:
        v3 = v26;
LABEL_13:
        if (++v9 < v3)
          continue;
        HIBYTE(v42) = v8;
        BYTE9(v42) = v7;
        BYTE4(v41) = v6;
        BYTE8(v42) = v5;
        BYTE7(v42) = v37;
        BYTE6(v42) = BYTE4(v36);
        BYTE5(v42) = v36;
        BYTE4(v42) = BYTE4(v35);
        BYTE3(v42) = v35;
        BYTE2(v42) = BYTE4(v34);
        BYTE1(v42) = v34;
        LOBYTE(v42) = BYTE4(v33);
        HIBYTE(v41) = BYTE4(v31);
        BYTE13(v41) = BYTE4(v30);
        BYTE11(v41) = BYTE4(v29);
        BYTE10(v42) = v30;
        BYTE10(v41) = v29;
        BYTE9(v41) = BYTE4(v27);
        BYTE11(v42) = BYTE4(v28);
        BYTE8(v41) = v32;
        BYTE12(v42) = v28;
        BYTE13(v42) = BYTE4(v32);
        BYTE3(v41) = BYTE4(v40);
        BYTE14(v42) = v4;
        BYTE6(v41) = v31;
        BYTE5(v41) = v33;
        BYTE1(v41) = v38;
        BYTE2(v41) = v39;
        BYTE7(v41) = BYTE4(v39);
        BYTE14(v41) = v40;
LABEL_107:
        v18 = 0;
        LOBYTE(v19) = 0;
        LODWORD(v20) = 12;
        do
        {
          v21 = *((unsigned __int8 *)&v41 + v18);
          if (v21 <= v19)
            v20 = v20;
          else
            v20 = v18;
          if (v21 <= v19)
            v19 = v19;
          else
            v19 = *((unsigned __int8 *)&v41 + v18);
          ++v18;
        }
        while (v18 != 12);
        LOBYTE(v22) = 0;
        LODWORD(result) = 31;
        for (i = 13; i != 31; ++i)
        {
          v25 = *((unsigned __int8 *)&v41 + i);
          if (v25 <= v22)
            result = result;
          else
            result = i;
          if (v25 <= v22)
            v22 = v22;
          else
            v22 = *((unsigned __int8 *)&v41 + i);
        }
        if (v19 >= 2 * v22)
          return v20;
        return result;
    }
  }
}

void sub_19BC1C838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

NSUInteger validateRangeOfString(NSUInteger a1, NSRange range)
{
  NSUInteger location;
  void *v4;
  uint64_t v5;
  void *v6;

  if (range.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  location = range.location;
  if (range.location + range.length > a1)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99858];
    NSStringFromRange(range);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("Range for detection %@ is out of bounds (0,%lu)"), v6, a1);

  }
  return location;
}

void sub_19BC1D860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DDScannerServiceScanStringSync(uint64_t a1)
{
  DDScannerServiceConfiguration *v2;
  id v3;

  v2 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", 0, 0);
  -[DDScannerServiceConfiguration setNoObjC:](v2, "setNoObjC:", 1);
  v3 = +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", a1, 0x7FFFFFFFFFFFFFFFLL, 0, v2);

  return v3;
}

id DDScannerServiceScanStringSyncWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  DDScannerServiceConfiguration *v10;
  DDScannerServiceConfiguration *v11;
  id v12;

  v10 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", a4, a5 != 0);
  v11 = v10;
  if (a6)
    -[DDScannerServiceConfiguration setSpotlightSuggestionsEnabled:](v10, "setSpotlightSuggestionsEnabled:", 1);
  -[DDScannerServiceConfiguration setNoObjC:](v11, "setNoObjC:", 1);
  v12 = +[DDScannerService scanString:range:configuration:](DDScannerService, "scanString:range:configuration:", a1, a2, a3, v11);

  return v12;
}

id DDScannerServiceScanQuerySyncWithOptionsAndQOS(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int64_t *a6, uint64_t a7)
{
  DDScannerServiceConfiguration *v12;
  DDScannerServiceConfiguration *v13;
  id v14;

  v12 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", a2, a3 == 1);
  v13 = v12;
  if (a4 == 1)
    -[DDScannerServiceConfiguration setSpotlightSuggestionsEnabled:](v12, "setSpotlightSuggestionsEnabled:", 1);
  -[DDScannerServiceConfiguration setNoObjC:](v13, "setNoObjC:", 1);
  -[DDScannerServiceConfiguration setQos:](v13, "setQos:", a7);
  v13->_jobIdentifierPtr = a6;
  if (a5 == 1)
    -[DDScannerServiceConfiguration setResultsOptions:](v13, "setResultsOptions:", -[DDScannerServiceConfiguration resultsOptions](v13, "resultsOptions") | 2);
  v14 = +[DDScannerService scanQuery:configuration:](DDScannerService, "scanQuery:configuration:", a1, v13);

  return v14;
}

int64_t DDScannerServiceScanStringAsync(uint64_t a1, void *a2)
{
  id v3;
  DDScannerServiceConfiguration *v4;
  id v5;
  int64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", 0, 1);
  -[DDScannerServiceConfiguration setNoObjC:](v4, "setNoObjC:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __DDScannerServiceScanStringAsync_block_invoke;
  v8[3] = &unk_1E3C94D10;
  v9 = v3;
  v5 = v3;
  v6 = +[DDScannerService scanString:range:configuration:completionBlock:](DDScannerService, "scanString:range:configuration:completionBlock:", a1, 0x7FFFFFFFFFFFFFFFLL, 0, v4, v8);

  return v6;
}

int64_t DDScannerServiceScanStringAsyncWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, void *a7)
{
  id v13;
  DDScannerServiceConfiguration *v14;
  DDScannerServiceConfiguration *v15;
  id v16;
  int64_t v17;
  _QWORD v19[4];
  id v20;

  v13 = a7;
  v14 = -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:]([DDScannerServiceConfiguration alloc], "initWithScannerType:passiveIntent:", a4, a5 != 0);
  v15 = v14;
  if (a6)
    -[DDScannerServiceConfiguration setSpotlightSuggestionsEnabled:](v14, "setSpotlightSuggestionsEnabled:", 1);
  -[DDScannerServiceConfiguration setNoObjC:](v15, "setNoObjC:", 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __DDScannerServiceScanStringAsyncWithOptions_block_invoke;
  v19[3] = &unk_1E3C94D10;
  v20 = v13;
  v16 = v13;
  v17 = +[DDScannerService scanString:range:configuration:completionBlock:](DDScannerService, "scanString:range:configuration:completionBlock:", a1, a2, a3, v15, v19);

  return v17;
}

uint64_t DDScannerServiceCancelJob(uint64_t a1)
{
  return +[DDScannerService cancelJob:](DDScannerService, "cancelJob:", a1);
}

void DDCrash(CFStringRef format, ...)
{
  CFStringRef v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  CFStringRef v8;
  uint64_t v9;
  va_list va;

  va_start(va, format);
  v9 = *MEMORY[0x1E0C80C00];
  if (format)
  {
    v1 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
    DDLogErrD((uint64_t)v1, v2, v3, v4, v5, CFSTR("%@"), v1);
  }
  else
  {
    v1 = 0;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v6 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v1;
    _os_log_error_impl(&dword_19BC07000, v6, OS_LOG_TYPE_ERROR, "EXCEPTION: %@", buf, 0xCu);
    if (!v1)
      return;
  }
  else if (!v1)
  {
    return;
  }
  CFRelease(v1);
}

BOOL _get_BOOL_entitlement(const __CFString *a1, int a2)
{
  __SecTask *v3;
  __SecTask *v4;
  __SecTask *v5;
  __SecTask *v6;
  CFTypeID TypeID;
  _BOOL8 v8;

  if (!a2 && !_xpc_runtime_is_app_sandboxed())
    return 0;
  v3 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (__SecTask *)SecTaskCopyValueForEntitlement(v3, a1, 0);
  if (v5)
  {
    v6 = v5;
    TypeID = CFBooleanGetTypeID();
    v8 = TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    CFRelease(v4);
  }
  else
  {
    v8 = 0;
    v6 = v4;
  }
  CFRelease(v6);
  return v8;
}

CFDataRef DDCreateDataFromFileAtUrl(const __CFURL *a1)
{
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFString *v3;
  CFDataRef v4;

  if (!a1)
    return 0;
  v1 = CFURLCopyAbsoluteURL(a1);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  CFRelease(v2);
  if (!v3)
    return 0;
  v4 = DDCreateDataFromFileAtPath(v3);
  CFRelease(v3);
  return v4;
}

CFDataRef DDCreateDataFromFileAtPath(const __CFString *a1)
{
  size_t MaximumSizeOfFileSystemRepresentation;
  CFIndex v3;
  char *v4;
  char *v5;
  FILE *v6;
  int v7;
  off_t st_size;
  UInt8 *v9;
  UInt8 *v10;
  FILE *v12;
  const char *v13;
  size_t v14;
  stat v15;

  if (!a1)
  {
    v12 = (FILE *)*MEMORY[0x1E0C80C10];
    v13 = "Error : Invalid file path !\n";
LABEL_12:
    v14 = 28;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0;
  }
  MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
  if (!MaximumSizeOfFileSystemRepresentation)
  {
    v12 = (FILE *)*MEMORY[0x1E0C80C10];
    v13 = "Error : Invalid file size !\n";
    goto LABEL_12;
  }
  v3 = MaximumSizeOfFileSystemRepresentation;
  v4 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xFAFEC22EuLL);
  if (!v4)
  {
    v12 = (FILE *)*MEMORY[0x1E0C80C10];
    v13 = "Error : Invalid file path malloc !\n";
    v14 = 35;
    goto LABEL_13;
  }
  v5 = v4;
  if (!CFStringGetFileSystemRepresentation(a1, v4, v3))
  {
    free(v5);
    v12 = (FILE *)*MEMORY[0x1E0C80C10];
    v13 = "Error : Invalid file path system rep !\n";
    v14 = 39;
    goto LABEL_13;
  }
  v6 = fopen(v5, "r");
  free(v5);
  if (v6)
  {
    v7 = fileno(v6);
    memset(&v15, 0, sizeof(v15));
    fstat(v7, &v15);
    st_size = v15.st_size;
    if (v15.st_size)
    {
      v9 = (UInt8 *)malloc_type_malloc(v15.st_size, 0x4C6203A4uLL);
      if (v9)
      {
        v10 = v9;
        if (fread(v9, st_size, 1uLL, v6))
        {
          fclose(v6);
          return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, st_size, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
        }
        free(v10);
      }
    }
    fclose(v6);
  }
  return 0;
}

uint64_t DDScannerShouldKeepParsecScoresBelowThreshold()
{
  return 0;
}

void DDScannerPurgeCaches(uint64_t a1, const void *a2)
{
  DDTokenCacheDestroy(*(_QWORD ***)(a1 + 40));
  *(_QWORD *)(a1 + 40) = DDTokenCacheCreate(a2);
  DDLexemCacheDestroy(*(_QWORD *)(a1 + 48));
  *(_QWORD *)(a1 + 48) = DDLexemCacheCreate();
  DDSourceMatchCacheFree(*(void ***)(a1 + 152));
  *(_QWORD *)(a1 + 152) = 0;
}

void DDScannerSetLocale(uint64_t a1, CFTypeRef cf)
{
  uint64_t v4;
  CFTypeRef v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4)
    {
      *(_QWORD *)(a1 + 40) = DDTokenCacheCreate(cf);
      *(_BYTE *)(a1 + 236) = 0;
      return;
    }
    v5 = *(CFTypeRef *)(v4 + 8);
    if (cf)
    {
      if (v5)
      {
        if (v5 == cf || CFEqual(cf, v5))
          return;
        v6 = *(const void **)(v4 + 8);
        if (v6)
          CFRelease(v6);
      }
      *(_QWORD *)(v4 + 8) = cf;
      CFRetain(cf);
      v7 = *(_QWORD *)(v4 + 8);
    }
    else
    {
      if (!v5)
        return;
      CFRelease(*(CFTypeRef *)(v4 + 8));
      v7 = 0;
      *(_QWORD *)(v4 + 8) = 0;
    }
    v8 = *(_QWORD *)v4;
    if (*(_QWORD *)v4 && !*(_BYTE *)(v8 + 121))
    {
      v9 = NLStringTokenizerCreate();
      v10 = v9;
      if (!v7 || v9)
      {
        if (!v9)
        {
LABEL_30:
          v14 = 1;
LABEL_31:
          DDCachingStringTokenizerResetStringWithOptions(v8, 64, v14);
          return;
        }
      }
      else
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v11 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          v15 = 138412290;
          v16 = v7;
          _os_log_error_impl(&dword_19BC07000, v11, OS_LOG_TYPE_ERROR, "Tokenizer update failed with locale %@, trying to fallback to default", (uint8_t *)&v15, 0xCu);
        }
        v10 = NLStringTokenizerCreate();
        if (!v10)
        {
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v12 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v15) = 0;
            _os_log_error_impl(&dword_19BC07000, v12, OS_LOG_TYPE_ERROR, "Tokenizer creation failed again with the default one, giving up and reusing the original one", (uint8_t *)&v15, 2u);
          }
          goto LABEL_30;
        }
      }
      v13 = *(const void **)(v8 + 40);
      if (v13)
        CFRelease(v13);
      v14 = 0;
      *(_QWORD *)(v8 + 40) = v10;
      goto LABEL_31;
    }
  }
}

uint64_t DDScannerGetLocale(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 40);
    if (v1)
      return *(_QWORD *)(v1 + 8);
    else
      return 0;
  }
  return result;
}

uint64_t DDScannerGetMemoryUsed(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 48);
    if (v2 < 1)
    {
      v7 = 8680;
    }
    else
    {
      v3 = *(uint64_t **)(v1 + 32);
      v4 = 400;
      do
      {
        v5 = *v3;
        if (*v3)
        {
          v6 = *(__int16 *)(v5 + 6);
          if ((_DWORD)v6 == 1)
            v5 = 24;
          else
            v5 = 16 * v6 + 24;
        }
        v4 += v5;
        ++v3;
        --v2;
      }
      while (v2);
      v7 = v4 + 8280;
    }
  }
  else
  {
    v7 = 8280;
  }
  v8 = *(_QWORD **)(a1 + 48);
  v9 = v8[3];
  if (v9 < 1)
  {
    v11 = 80;
  }
  else
  {
    v10 = (unint64_t *)v8[1];
    v11 = 80;
    do
    {
      v12 = *v10;
      if (*v10)
        v12 = (*(uint64_t *)(v12 + 8) >> 27) & 0xFFFFFFFFFFFFFFE0 | 0x10;
      v11 += v12;
      ++v10;
      --v9;
    }
    while (v9);
  }
  v13 = v8[8];
  if (v13)
    v11 += 32 * (*(uint64_t *)(v13 + 8) >> 32) + 16;
  v14 = v8[7];
  if (v14 >= 1)
  {
    v15 = (unint64_t *)v8[5];
    do
    {
      v16 = *v15;
      if (*v15)
        v16 = (*(uint64_t *)(v16 + 8) >> 27) & 0xFFFFFFFFFFFFFFE0 | 0x10;
      v11 += v16;
      ++v15;
      --v14;
    }
    while (v14);
  }
  return v7 + v11;
}

CFMutableArrayRef DDScannerSetMockMLResults(uint64_t a1, CFArrayRef theArray)
{
  CFMutableArrayRef result;

  result = *(CFMutableArrayRef *)(a1 + 264);
  if (result != theArray)
  {
    if (result)
      CFRelease(result);
    result = 0;
    if (theArray)
      result = CFArrayCreateMutableCopy(0, 0, theArray);
    *(_QWORD *)(a1 + 264) = result;
  }
  return result;
}

_QWORD *DDScannerSetMLSupportedTypes(_QWORD *result, _QWORD *cf)
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[34];
    if (result != cf)
    {
      if (result)
        CFRelease(result);
      if (cf)
        result = CFRetain(cf);
      else
        result = 0;
      v3[34] = result;
    }
  }
  return result;
}

void DDScannerThreadDebug(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v4 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v5 = "in use";
    v6 = 134218498;
    v7 = a1;
    v8 = 2080;
    if (!a2)
      v5 = "unused";
    v9 = v5;
    v10 = 2080;
    v11 = v5;
    _os_log_error_impl(&dword_19BC07000, v4, OS_LOG_TYPE_ERROR, "Scanner %p was declared %s while already %s, this is likely a Data Detectors scanner being used in an unsafe manner (this object is NOT thread safe, a crash is likely to happen). Break on DDScannerThreadDebug() to debug.", (uint8_t *)&v6, 0x20u);
  }
}

BOOL DDScannerScanStringWithRange(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  return DDScannerScanStringWithRangeAndContextOffset(a1, a2, a3, a4, 0);
}

BOOL DDScannerScanStringWithRangeAndContextOffset(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  _BOOL8 v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v10 = os_signpost_id_generate((os_log_t)DDLogHandle_error_log_handle);
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = DDLogHandle_error_log_handle;
    if (os_signpost_enabled((os_log_t)DDLogHandle_error_log_handle))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19BC07000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v10, "datadetectors.scanString", (const char *)&unk_19BC4332F, buf, 2u);
    }
  }
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v14 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19BC07000, v14, OS_LOG_TYPE_ERROR, "DDScannerScanStringWithRange called with NULL scanner", v23, 2u);
    }
    return 0;
  }
  if (*(_BYTE *)(a1 + 233) == 1)
  {
    v12 = a1;
    v13 = 1;
LABEL_23:
    DDScannerThreadDebug(v12, v13);
    return 0;
  }
  *(_BYTE *)(a1 + 233) = 1;
  if (a2 && a4 != a5)
  {
    v16 = *(_QWORD **)(a1 + 64);
    if (v16)
    {
      DDScanQueryReset(v16);
      DDScanQueryAddTextFragment(*(_QWORD *)(a1 + 64), a2, a3, a4, 0, 0, 0);
      if (!a5)
        goto LABEL_30;
    }
    else
    {
      *(_QWORD *)(a1 + 64) = DDScanQueryCreateFromString(0, a2, a3, a4);
      if (!a5)
      {
LABEL_30:
        v20 = *(_QWORD *)(a1 + 40);
        if (v20)
          *(_QWORD *)(v20 + 392) = 0;
        if (*(_BYTE *)(a1 + 233))
          *(_BYTE *)(a1 + 233) = 0;
        else
          DDScannerThreadDebug(a1, 0);
        v15 = DDScannerScanQuery(a1, *(_QWORD **)(a1 + 64));
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v21 = DDLogHandle_error_log_handle;
          if (os_signpost_enabled((os_log_t)DDLogHandle_error_log_handle))
          {
            *(_WORD *)v22 = 0;
            _os_signpost_emit_with_name_impl(&dword_19BC07000, v21, OS_SIGNPOST_INTERVAL_END, v10, "datadetectors.scanString", (const char *)&unk_19BC4332F, v22, 2u);
          }
        }
        return v15;
      }
    }
    v18 = *(_QWORD *)(a1 + 64);
    if (*(_QWORD *)(v18 + 32) == 1)
    {
      v19 = *(_QWORD *)(v18 + 16);
      if (v19)
        *(_DWORD *)(v19 + 40) = *(_DWORD *)(v19 + 40) & 0xFC000000 | a5 & 0x3FFFFFF;
    }
    goto LABEL_30;
  }
  DDScannerReset(a1);
  if (!*(_BYTE *)(a1 + 233))
  {
    v12 = a1;
    v13 = 0;
    goto LABEL_23;
  }
  v15 = 0;
  *(_BYTE *)(a1 + 233) = 0;
  return v15;
}

void _DDScannerDestroyOptionalLookupTable(uint64_t a1, int a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  int *v7;
  const void *v8;

  v2 = a1 + 8 * a2;
  v5 = *(_QWORD **)(v2 + 72);
  v4 = (_QWORD *)(v2 + 72);
  v3 = v5;
  if (v5)
  {
    if (a2 == 4)
    {
      if (!*(_QWORD *)(a1 + 128))
      {
        CFRelease(v3);
        v8 = *(const void **)(a1 + 144);
        if (v8)
        {
          CFRelease(v8);
          *(_QWORD *)(a1 + 144) = 0;
        }
        goto LABEL_9;
      }
    }
    else if (!a2)
    {
LABEL_8:
      CFRelease(v3);
LABEL_9:
      *v4 = 0;
      return;
    }
    v7 = (int *)v3[4];
    if (v7)
    {
      munmap(v7, v7[1]);
      v3[5] = 0;
      v3[6] = 0;
      v3[4] = 0;
    }
    goto LABEL_8;
  }
}

CFIndex _offsetResultsInArray(const __CFArray *a1, uint64_t a2)
{
  CFIndex result;
  CFIndex v5;
  CFIndex i;
  _QWORD *ValueAtIndex;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    v5 = result;
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      v8 = ValueAtIndex;
      v9 = ValueAtIndex[4];
      if (v9 >= a2)
      {
        ValueAtIndex[4] = v9 - a2;
      }
      else
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v10 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v12 = a2;
          v13 = 2048;
          v14 = v9;
          _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "incorrect context offset %ld for range location %ld", buf, 0x16u);
        }
      }
      result = v8[7];
      if (result)
        result = _offsetResultsInArray(result, a2);
    }
  }
  return result;
}

BOOL DDResultsCanShareRange(CFStringRef *a1, CFStringRef *a2)
{
  _BOOL8 v2;
  const __CFString *v5;
  const __CFString *v6;
  const __CFArray *ArrayBySeparatingStrings;
  CFArrayRef v8;
  const __CFArray *v9;
  const __CFString *ValueAtIndex;
  const __CFString *v11;
  _BOOL8 v12;
  const __CFString *v14;
  const __CFString *v15;

  v2 = 0;
  if (!a1 || !a2)
    return v2;
  if (!_typesAreEqual(a1[8], CFSTR("Compatibility")) || !_typesAreEqual(a2[8], CFSTR("Compatibility")))
    return 0;
  v5 = a1[10];
  if (!v5)
    v5 = a1[9];
  v6 = a2[10];
  if (!v6)
    v6 = a2[9];
  v2 = 0;
  if (v5 && v6)
  {
    if (CFStringFind(v5, CFSTR("-"), 0).location != -1 && CFStringFind(v6, CFSTR("-"), 0).location != -1)
    {
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v5, CFSTR("-"));
      v8 = CFStringCreateArrayBySeparatingStrings(0, v6, CFSTR("-"));
      v9 = v8;
      if (ArrayBySeparatingStrings && v8)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
        v11 = (const __CFString *)CFArrayGetValueAtIndex(v9, 0);
        if (CFStringCompare(ValueAtIndex, CFSTR("1"), 0) && CFStringCompare(v11, CFSTR("1"), 0))
        {
          v12 = 0;
        }
        else
        {
          v14 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
          v15 = (const __CFString *)CFArrayGetValueAtIndex(v9, 1);
          v12 = CFStringCompare(v14, v15, 0) == kCFCompareEqualTo;
        }
      }
      else
      {
        v12 = 0;
        v2 = 0;
        if (!ArrayBySeparatingStrings)
        {
LABEL_24:
          if (v9)
            CFRelease(v9);
          return v2;
        }
      }
      CFRelease(ArrayBySeparatingStrings);
      v2 = v12;
      goto LABEL_24;
    }
    return 0;
  }
  return v2;
}

uint64_t __computeLexemsAtPosition_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, _BYTE *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  unsigned int v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v8 = (_QWORD *)result;
  v36[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)
              + 8 * (15 - (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24)
              + 8 * (15 - *(int *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))) = a3;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24)
              + 8 * (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24)
              + 120) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24)
              + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24)
              + 120) = a3;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24);
  if (v9 > 29)
  {
LABEL_33:
    *a5 = 1;
    *(_QWORD *)(*(_QWORD *)(v8[8] + 8) + 24) = 30;
    return result;
  }
  v10 = 30 - v9;
  MEMORY[0x1E0C80A78]();
  v11 = &v36[-4 * v10];
  result = DDLookupTableRefLookupCurrentWord(v8[13], v8[14], a2, v12, a2, (uint64_t)v11, v10, 1);
  if (a4)
  {
    v13 = *(uint64_t **)(v8[13] + 152);
    if (v13)
    {
      if (result < v10 && (*v13 & 0x8000000000000000) == 0)
      {
        v14 = *(_QWORD *)(v8[12] + 16) + 48 * ((int)a2 >> 16);
        v15 = *(_QWORD *)(v14 + 32) + (a2 >> 32) - *(_QWORD *)(v14 + 16);
        v16 = *v13;
        while (1)
        {
          v17 = &v13[8 * v16];
          v18 = v17[2];
          if (v18 == v15)
            break;
          if (v18 >= v15 && v16 != v13[1])
          {
            if (v16-- < 1)
              v16 = 14;
            if (v16 != *v13)
              continue;
          }
          goto LABEL_27;
        }
        v21 = v17[3];
        if (v21 <= 1)
        {
          if (v21 < 1)
            goto LABEL_27;
          v22 = &v13[8 * v16 + 6];
        }
        else
        {
          v22 = (uint64_t *)v13[8 * v16 + 5];
        }
        v23 = (uint64_t)&v11[2 * result] + 12;
        v24 = 1;
        do
        {
          v25 = *((_OWORD *)v22 + 1);
          *(_OWORD *)(v23 - 12) = *(_OWORD *)v22;
          *(_OWORD *)(v23 + 4) = v25;
          v26 = (*(_DWORD *)v23 >> 17) & 0x7F;
          *(_DWORD *)v23 = *(_DWORD *)v23 & 0xE0FFFFFF | 0x17000000;
          v27 = (double)v26 / 100.0;
          *(float *)(v23 - 4) = v27;
          v28 = v24 + 1;
          if (v24 >= v21)
            break;
          v29 = result + v24;
          v22 += 4;
          v23 += 32;
          ++v24;
        }
        while (v29 < v10);
        result = result + v28 - 1;
      }
    }
  }
LABEL_27:
  if (result >= v10)
    v30 = v10;
  else
    v30 = result;
  if (v30 >= 1)
  {
    do
    {
      v31 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(v8[9] + 8) + 24) + 32
                                                                    * *(_QWORD *)(*(_QWORD *)(v8[8] + 8) + 24));
      v32 = v11[1];
      *v31 = *v11;
      v31[1] = v32;
      v33 = *(_QWORD *)v11;
      v11 += 2;
      v34 = *(_QWORD *)(*(_QWORD *)(v8[8] + 8) + 24);
      v35 = *(_QWORD *)(*(_QWORD *)(v8[10] + 8) + 24) + 40 * v34;
      *(_QWORD *)v35 = a2;
      *(_QWORD *)(v35 + 8) = v33;
      *(_QWORD *)(v35 + 16) = (__int16)v33;
      *(_QWORD *)(v35 + 24) = v34;
      *(_BYTE *)(v35 + 32) = a4;
      *(_DWORD *)(v35 + 36) = 0;
      *(_DWORD *)(v35 + 33) = 0;
      ++*(_QWORD *)(*(_QWORD *)(v8[8] + 8) + 24);
      --v30;
    }
    while (v30);
  }
  if (*(uint64_t *)(*(_QWORD *)(v8[8] + 8) + 24) >= 30)
    goto LABEL_33;
  return result;
}

uint64_t keywordSort(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  unsigned int v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a2 + 16);
  if (v2 < v3)
    return 0xFFFFFFFFLL;
  if (v2 > v3)
    return 1;
  if (*(int *)a1 >> 16 < *(int *)a2 >> 16)
    return 0xFFFFFFFFLL;
  v5 = HIDWORD(*(_QWORD *)a1);
  v6 = HIDWORD(*(_QWORD *)a2);
  v7 = (int)v5 < (int)v6;
  v8 = (int)v5 > (int)v6;
  if (v7)
    v8 = -1;
  if (*(int *)a1 >> 16 <= *(int *)a2 >> 16)
    return v8;
  else
    return 1;
}

BOOL DDScannerScanStringWithContextOffset(uint64_t a1, CFStringRef theString, uint64_t a3)
{
  CFIndex Length;

  if (!theString)
    return DDScannerScanString(a1, 0);
  Length = CFStringGetLength(theString);
  return DDScannerScanStringWithRangeAndContextOffset(a1, theString, 0, Length, a3);
}

BOOL DDScannerScanString(uint64_t a1, CFStringRef theString)
{
  uint64_t v2;
  CFIndex Length;
  int v6;

  v2 = a1;
  if (theString)
  {
    Length = CFStringGetLength(theString);
    return DDScannerScanStringWithRangeAndContextOffset(v2, theString, 0, Length, 0);
  }
  if (a1)
  {
    if (*(_BYTE *)(a1 + 233) == 1)
    {
      v6 = 1;
LABEL_9:
      DDScannerThreadDebug(a1, v6);
      return 0;
    }
    *(_BYTE *)(a1 + 233) = 1;
    DDScannerReset(a1);
    if (!*(_BYTE *)(v2 + 233))
    {
      a1 = v2;
      v6 = 0;
      goto LABEL_9;
    }
    *(_BYTE *)(v2 + 233) = 0;
  }
  return 0;
}

BOOL DDScannerOverrideTokensForNextScan(uint64_t a1, const void *a2, const void *a3, uint64_t a4)
{
  _QWORD **v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  CFTypeRef v14;
  NSObject *v15;
  _BOOL8 result;
  uint8_t v17[16];

  v8 = *(_QWORD ***)(a1 + 40);
  if (v8)
    DDTokenCacheDestroy(v8);
  v9 = malloc_type_calloc(1uLL, 0x80uLL, 0x1020040DB4D2780uLL);
  if (v9)
  {
    v10 = v9;
    v9[8] = a4;
    v11 = malloc_type_malloc(16 * a4, 0x1000040451B5BE8uLL);
    v10[6] = v11;
    memcpy(v11, a3, 16 * a4);
    v10[9] = a4;
    v10[10] = -1;
    if (a4)
      v12 = 0;
    else
      v12 = -1;
    v10[11] = a4 - 1;
    v10[12] = v12;
    v10[13] = a4;
    v10[14] = -1;
    *((_WORD *)v10 + 60) = 257;
    v13 = malloc_type_calloc(1uLL, 0x190uLL, 0x10E00409D72FF36uLL);
    if (a2)
      v14 = CFRetain(a2);
    else
      v14 = 0;
    *v13 = v10;
    v13[1] = v14;
    v13[4] = malloc_type_calloc(0x5AuLL, 8uLL, 0x2004093837F09uLL);
    v13[6] = 90;
    DDTokenCacheClear((uint64_t)v13);
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v15 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, "DD custom tokenizer creation failed", v17, 2u);
    }
    v13 = 0;
  }
  *(_QWORD *)(a1 + 40) = v13;
  result = v13 != 0;
  *(_BYTE *)(a1 + 236) = result;
  return result;
}

CFArrayRef DDScannerCopyResultsCheckOverlap(uint64_t a1, int a2)
{
  unsigned int v2;

  if (a2)
    v2 = 1989;
  else
    v2 = 0;
  return DDScannerCopyResultsWithOptions(a1, v2);
}

CFArrayRef DDScannerCopyResults(uint64_t a1)
{
  return DDScannerCopyResultsWithOptions(a1, 0x7C5u);
}

uint64_t DDScannerCancelScanning(uint64_t result)
{
  *(_BYTE *)(result + 232) |= 1u;
  return result;
}

uint64_t DDScannerIsCancelled(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 232) & 1;
  return result;
}

uint64_t DDScannerEnableDPReporting()
{
  return 0;
}

uint64_t DDScannerCreateFromCacheSupportingMLScan(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  _DWORD *v11;
  int v12;
  int v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  int v18;
  _QWORD *v19;
  unsigned __int16 *v20;
  _QWORD *v21;
  CFTypeID v22;
  uint64_t Instance;
  malloc_zone_t *v24;
  void *v25;
  CFTypeRef v26;
  _QWORD *v27;
  int v29;
  int v30;
  _QWORD *v31;
  _DWORD *v32;
  uint64_t v33;
  unsigned __int16 *v34;
  _BYTE *v35;
  uint64_t v36;
  int v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  _DWORD *v41;
  unsigned __int16 *v42;
  int v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unsigned __int16 *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  unint64_t v54;
  int v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  int v62;
  char *v63;

  if (!a1)
    return 0;
  v4 = a1[2];
  if (!v4)
    goto LABEL_18;
  v5 = operator new();
  *(_QWORD *)v5 = &off_1E3C946C8;
  *(_QWORD *)(v5 + 8) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = -1;
  *(_BYTE *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  v6 = operator new();
  *(_QWORD *)v6 = v4;
  if (*(_DWORD *)v4 == 45472 && *(_BYTE *)(v4 + 4) == 3)
  {
    *(_QWORD *)(v6 + 24) = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 32) = 0;
    *(_QWORD *)(v6 + 40) = 0;
    if (*(_DWORD *)(v4 + 20))
    {
      v7 = v4 + *(unsigned int *)(v4 + 64);
      *(_QWORD *)(v6 + 8) = v4 + *(unsigned int *)(v4 + 16);
      *(_QWORD *)(v6 + 16) = v7;
    }
    if (*(_DWORD *)(v4 + 28))
      *(_QWORD *)(v6 + 24) = v4 + *(unsigned int *)(v4 + 24);
    if (*(_DWORD *)(v4 + 36))
      *(_QWORD *)(v6 + 32) = v4 + *(unsigned int *)(v4 + 32);
    if (*(_DWORD *)(v4 + 44))
      *(_QWORD *)(v6 + 40) = v4 + *(unsigned int *)(v4 + 40);
    v8 = *(_DWORD *)(v4 + 52);
    v9 = __OFSUB__(v8, 16);
    v10 = v8 - 16;
    if (v10 < 0 == v9)
    {
      v11 = (_DWORD *)(v4 + *(unsigned int *)(v4 + 48));
      if (*v11 == 1416784229)
      {
        v12 = v11[1];
        if (v12 == 37)
        {
          *(_BYTE *)(v6 + 108) = (v12 & 0x200) != 0;
          v13 = v11[3];
          v14 = (int)v11[2];
          *(_DWORD *)(v6 + 96) = v14;
          *(_DWORD *)(v6 + 100) = v13;
          if (v10 >= 2 * (int)v14)
          {
            v41 = v11 + 4;
            *(_QWORD *)(v6 + 72) = v41;
            v42 = (unsigned __int16 *)v41 + v14;
            v43 = v10 - 2 * v14;
            if ((v12 & 0x100) != 0)
            {
              if (v43 < 4 * v13)
                goto LABEL_17;
              *(_QWORD *)(v6 + 80) = v42;
              v44 = *(_DWORD *)v42;
            }
            else
            {
              if (v43 < 2 * v13)
                goto LABEL_17;
              *(_QWORD *)(v6 + 80) = 0;
              v44 = *v42;
            }
            *(_DWORD *)(v6 + 104) = v44;
            *(_QWORD *)(v6 + 88) = getFoldingOffset;
            v45 = *(_DWORD *)(v4 + 76);
            v46 = v4 + *(unsigned int *)(v4 + 72);
            *(_QWORD *)(v6 + 48) = v4 + *(unsigned int *)(v4 + 56);
            *(_QWORD *)(v6 + 56) = v46;
            *(_DWORD *)(v6 + 64) = v45 >> 2;
            *(_QWORD *)(v5 + 56) = v6;
            goto LABEL_19;
          }
        }
      }
    }
  }
LABEL_17:
  *(_QWORD *)(v5 + 56) = v6;
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
LABEL_18:
  v5 = 0;
LABEL_19:
  v15 = (_DWORD *)a1[4];
  if (!v15)
    goto LABEL_23;
  v16 = a1[5];
  if (v16 != *v15)
    goto LABEL_23;
  v17 = v15[2];
  if (v17 < 0)
    goto LABEL_23;
  v18 = v16 - 52;
  if (v17 > (int)v16 - 52)
    goto LABEL_23;
  v19 = 0;
  v29 = v15[4];
  if ((v29 & 0x80000000) == 0 && v29 <= v18)
  {
    v19 = 0;
    v30 = v15[6];
    if ((v30 & 0x80000000) == 0 && v30 <= v18)
    {
      v19 = 0;
      if (*(int *)(a1[8] + 4) >= 56 && v15[3] + v17 == v29)
      {
        if (v29 + 12 * v15[5] != v30)
        {
LABEL_23:
          v19 = 0;
          goto LABEL_24;
        }
        v31 = malloc_type_calloc(1uLL, 0x58uLL, 0x10F004081EB040EuLL);
        v19 = v31;
        if (v31)
        {
          *v31 = v15;
          v32 = v15 + 13;
          v33 = (int)v15[3];
          v34 = (unsigned __int16 *)((char *)v15 + v15[2] + 52);
          v35 = malloc_type_malloc(0x60uLL, 0x1070040511C5677uLL);
          v36 = *v34;
          *(_WORD *)v35 = v36;
          v37 = *((unsigned __int8 *)v34 + 2);
          v35[2] = v37;
          v38 = *((unsigned __int8 *)v34 + 3);
          v35[3] = v38;
          v39 = *((int *)v34 + 2);
          *((_DWORD *)v35 + 1) = *((_DWORD *)v34 + 1);
          if (v37)
          {
            if (v37 == 2)
              v40 = v39 / 5;
            else
              v40 = 0;
          }
          else
          {
            v40 = v39 >> 2;
          }
          *((_QWORD *)v35 + 4) = v40;
          v47 = *((int *)v34 + 3);
          v48 = *((int *)v34 + 4);
          *((_QWORD *)v35 + 6) = v47 >> 1;
          if (v38)
          {
            if (v38 == 2)
              v49 = v48 / 5;
            else
              v49 = 0;
          }
          else
          {
            v49 = v48 >> 2;
          }
          v50 = v34 + 10;
          v51 = 4 * v36;
          v52 = v37 == 2;
          v53 = (uint64_t)&v34[2 * v36 + 12];
          v54 = v53 + 4 * v40;
          if (v52)
          {
            v51 = 4 * v36 + 4;
          }
          else
          {
            v53 = (uint64_t)&v34[2 * v36 + 10];
            v54 = 0;
          }
          *((_QWORD *)v35 + 1) = v50;
          *((_QWORD *)v35 + 2) = v53;
          *((_QWORD *)v35 + 3) = v54;
          if ((int)v39 <= 0)
            v55 = -(-(int)v39 & 3);
          else
            v55 = v39 & 3;
          if (v55 > 0)
            v39 += -v55 + 4;
          v56 = (char *)v50 + v51 + v39;
          *((_QWORD *)v35 + 5) = v56;
          if ((int)v47 <= 0)
            v57 = -(-(int)v47 & 3);
          else
            v57 = v47 & 3;
          if (v57 <= 0)
            v58 = v47;
          else
            v58 = v47 + -v57 + 4;
          v59 = &v56[v58];
          *((_QWORD *)v35 + 7) = v59;
          *((_QWORD *)v35 + 8) = &v59[4 * v36];
          *((_QWORD *)v35 + 9) = v49;
          *((_QWORD *)v35 + 10) = v34;
          *((_QWORD *)v35 + 11) = v33;
          v60 = (int)v15[5];
          v61 = (char *)v32 + (int)v15[4];
          v19[1] = v35;
          v19[2] = v61;
          v19[3] = (int)v15[1];
          v19[4] = v60;
          LODWORD(v60) = v15[7];
          v19[5] = (char *)v32 + (int)v15[6];
          *((_DWORD *)v19 + 12) = v60;
          v62 = v15[9];
          if (v62 < 1)
            v63 = 0;
          else
            v63 = (char *)v32 + (int)v15[8];
          v19[7] = v63;
          *((_DWORD *)v19 + 16) = v62;
          v19[9] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
        }
      }
    }
  }
LABEL_24:
  v20 = (unsigned __int16 *)a1[6];
  if (!v20)
  {
    v21 = 0;
LABEL_32:
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    if (v19)
      DDLRTableDestroy(v19);
    if (v21)
      CFRelease(v21);
    return 0;
  }
  v21 = DDLookupTableCreateFromCacheData(v20, a1[7], 0, 0);
  if (!v21 || !v19 || !v5)
    goto LABEL_32;
  v22 = DDTypeRegister(&DDScannerGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(0, v22, 0x108uLL);
  *(_QWORD *)(Instance + 168) = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v24 = malloc_default_purgeable_zone();
  v25 = malloc_type_zone_malloc(v24, 0x1F40uLL, 0xE221A2C3uLL);
  *(_QWORD *)(Instance + 208) = v25;
  malloc_make_purgeable(v25);
  *(_QWORD *)(Instance + 16) = v19;
  *(_QWORD *)(Instance + 24) = v5;
  v26 = CFRetain(a1);
  *(_QWORD *)(Instance + 72) = v21;
  *(_QWORD *)(Instance + 152) = 0;
  *(_BYTE *)(Instance + 232) &= ~2u;
  *(_QWORD *)(Instance + 32) = v26;
  *(_QWORD *)(Instance + 40) = 0;
  *(_QWORD *)(Instance + 48) = DDLexemCacheCreate();
  *(_QWORD *)(v5 + 8) = nextToken;
  *(_QWORD *)(v5 + 16) = Instance;
  v27 = *(_QWORD **)(Instance + 72);
  if (v27)
    DDLookupTablePrepareToScan(v27);
  *(_WORD *)(Instance + 234) = -1;
  *(_BYTE *)(Instance + 256) = a2;
  return Instance;
}

void _DDScannerCFFinalize(uint64_t a1)
{
  uint64_t v2;
  malloc_zone_t *v3;
  const void *v4;
  const void *v5;
  int i;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;

  DDTokenCacheDestroy(*(_QWORD ***)(a1 + 40));
  DDLexemCacheDestroy(*(_QWORD *)(a1 + 48));
  DDLRTableDestroy(*(_QWORD **)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*(_QWORD *)(a1 + 208))
  {
    v3 = malloc_default_purgeable_zone();
    malloc_zone_free(v3, *(void **)(a1 + 208));
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 64);
  if (v5)
    CFRelease(v5);
  for (i = 0; i != 7; ++i)
    _DDScannerDestroyOptionalLookupTable(a1, i);
  DDSourceMatchCacheFree(*(void ***)(a1 + 152));
  v7 = *(const void **)(a1 + 32);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 168);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 160);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 216);
  if (v10)
    _Block_release(v10);
  v11 = *(const void **)(a1 + 240);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 264);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 272);
  if (v13)
    CFRelease(v13);
}

BOOL _DDScannerCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _DDScannerCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDScanner:%p rows: %d reductions: %ld>"), a1, *(unsigned int *)(**(_QWORD **)(a1 + 16) + 4), *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32));
}

CFStringRef _DDScannerCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDScanner:%p rows: %d reductions: %ld>"), a1, *(unsigned int *)(**(_QWORD **)(a1 + 16) + 4), *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32));
}

uint64_t DDScannerGetOptions(uint64_t a1)
{
  return *(_QWORD *)(a1 + 192);
}

void DDScannerSetProgressReportingBlock(uint64_t a1, void *aBlock)
{
  const void *v4;

  v4 = *(const void **)(a1 + 216);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(a1 + 216) = 0;
  }
  if (aBlock)
    *(_QWORD *)(a1 + 216) = _Block_copy(aBlock);
}

uint64_t DDScannerSetScannerTimeout(uint64_t result, double a2)
{
  *(double *)(result + 224) = a2;
  return result;
}

void DDScannerSetQOS(uint64_t a1, int a2)
{
  if (DDScannerSetQOS_onceToken != -1)
    dispatch_once(&DDScannerSetQOS_onceToken, &__block_literal_global_196);
  if (!DDScannerSetQOS_inWebProcess)
    *(_DWORD *)(a1 + 248) = a2;
}

BOOL DDScannerHasCapabilities(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v4;
  uint64_t v5;
  const __CFString *ValueAtIndex;
  NSObject *v7;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!theArray)
    return 1;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v4);
      if (CFStringCompare(ValueAtIndex, CFSTR("dynamicLookup"), 0))
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v7 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v10 = ValueAtIndex;
          _os_log_error_impl(&dword_19BC07000, v7, OS_LOG_TYPE_ERROR, "Capability not known: %@", buf, 0xCu);
        }
      }
      else
      {
        ++v5;
      }
      ++v4;
    }
    while (Count != v4);
  }
  return Count == v5;
}

void DDScannerEnableOptionalSource(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 && a2 != 8)
  {
    v4 = *(_QWORD *)(a1 + 200);
    v5 = a3 ? v4 | a2 : v4 & ~a2;
    if (v5 != v4)
    {
      if (!a3)
      {
        if (a2 > 3)
        {
          if (a2 == 4)
            goto LABEL_15;
          if (a2 == 128)
          {
            LODWORD(a2) = 6;
            goto LABEL_15;
          }
        }
        else
        {
          if (a2 == 1)
          {
LABEL_15:
            _DDScannerDestroyOptionalLookupTable(a1, a2);
            goto LABEL_16;
          }
          if (a2 == 2)
          {
            _DDScannerDestroyOptionalLookupTable(a1, 2);
            LODWORD(a2) = 3;
            goto LABEL_15;
          }
        }
      }
LABEL_16:
      *(_QWORD *)(a1 + 200) = v5;
      *(_QWORD *)(a1 + 136) = 0;
    }
  }
}

void DDScannerSetClientTables(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const UInt8 *FinalizedSourceContent;
  unsigned __int16 *BytePtr;
  CFIndex Length;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;

  v16 = a5;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 128))
      DDScannerSetPrebuiltClientTable((const __CFString *)a1, 0);
    else
      _DDScannerDestroyOptionalLookupTable(a1, 4);
    DDValidateOptionalSourceTableCount(5, &v16);
    if (a2)
    {
      if (v16)
      {
        if ((*(_BYTE *)(a1 + 200) & 4) != 0)
        {
          v17 = v16;
          DDValidateOptionalSourceTableCount(5, (unint64_t *)&v17);
          v9 = v17;
          if (v17)
          {
            v10 = DDLookupTableCreate();
            if (v10)
            {
              v11 = (const void *)v10;
              _DDSourceUpdateSourceWithContent(v10, a2, a3, a4, v9);
              FinalizedSourceContent = DDSourceCreateFinalizedSourceContent((uint64_t)v11);
              CFRelease(v11);
              if (FinalizedSourceContent)
              {
                BytePtr = (unsigned __int16 *)CFDataGetBytePtr((CFDataRef)FinalizedSourceContent);
                Length = CFDataGetLength((CFDataRef)FinalizedSourceContent);
                v15 = DDLookupTableCreateFromCacheData(BytePtr, Length, 0, 0);
                *(_QWORD *)(a1 + 144) = FinalizedSourceContent;
                *(_QWORD *)(a1 + 104) = v15;
              }
            }
          }
        }
      }
    }
  }
}

const __CFString *DDScannerSetPrebuiltClientTable(const __CFString *result, CFStringRef theString2)
{
  uint64_t v3;
  const void *v4;

  if (result)
  {
    v3 = (uint64_t)result;
    result = (const __CFString *)result[4].isa;
    if (theString2)
    {
      if (result)
      {
        result = (const __CFString *)CFStringCompare(result, theString2, 0);
        if (!result)
        {
LABEL_13:
          *(_QWORD *)(v3 + 136) = 0;
          return result;
        }
      }
    }
    else if (!result)
    {
      return result;
    }
    _DDScannerDestroyOptionalLookupTable(v3, 4);
    v4 = *(const void **)(v3 + 128);
    if (v4)
      CFRelease(v4);
    if (theString2)
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString2);
    else
      result = 0;
    *(_QWORD *)(v3 + 128) = result;
    goto LABEL_13;
  }
  return result;
}

const void *DDTypeForLRResult(unsigned __int16 a1, uint64_t a2)
{
  uint64_t v2;
  const void *v3;

  if ((a1 & 0x8000) != 0)
    return 0;
  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = (const void *)*(unsigned __int16 *)(v2 + 12 * a1);
  if (v3 == (const void *)0xFFFF)
    return 0;
  else
    return DDLRTableGetUniqueSymbolStringAtOffset(a2, v3);
}

uint64_t DDResultGetCFTypeID()
{
  return DDTypeRegister(&DDResultGetTypeID_typeID);
}

uint64_t _DDResultCFEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const void *v10;
  uint64_t result;
  NSObject *v12;
  const void *v13;
  const void *v14;
  const __CFArray *v15;
  CFIndex Count;
  const __CFArray *v17;
  BOOL v18;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = DDTypeRegister(&DDResultGetTypeID_typeID);
  if (CFGetTypeID((CFTypeRef)a1) == v4 && CFGetTypeID((CFTypeRef)a2) == v4)
  {
    v5 = *(_QWORD *)(a1 + 16);
    v6 = *(_QWORD *)(a2 + 16);
    if (HIDWORD(v5) != HIDWORD(v6))
      return 0;
    if ((int)v5 >> 16 != (int)v6 >> 16)
      return 0;
    v7 = *(_QWORD *)(a1 + 24);
    v8 = *(_QWORD *)(a2 + 24);
    if (HIDWORD(v7) != HIDWORD(v8) || (int)v7 >> 16 != (int)v8 >> 16)
      return 0;
    v9 = *(const void **)(a1 + 64);
    v10 = *(const void **)(a2 + 64);
    if (v9)
    {
      if (!v10)
        return 0;
      result = CFEqual(v9, v10);
    }
    else
    {
      result = v10 == 0;
    }
    if (!(_DWORD)result)
      return result;
    v13 = *(const void **)(a1 + 80);
    v14 = *(const void **)(a2 + 80);
    if (v13)
    {
      if (!v14)
        return 0;
      result = CFEqual(v13, v14);
    }
    else
    {
      result = v14 == 0;
    }
    if (!(_DWORD)result)
      return result;
    v15 = *(const __CFArray **)(a1 + 56);
    if (v15)
      Count = CFArrayGetCount(v15);
    else
      Count = 0;
    v17 = *(const __CFArray **)(a2 + 56);
    if (v17)
      v17 = (const __CFArray *)CFArrayGetCount(v17);
    if (v17 == (const __CFArray *)Count)
    {
      if (Count < 1)
      {
        return 1;
      }
      else
      {
        v18 = 0;
        for (i = 0; i != Count; v18 = i >= Count)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
          v21 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 56), i);
          if (!CFEqual(ValueAtIndex, v21))
            break;
          ++i;
        }
      }
      return v18;
    }
    return 0;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v12 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    v22 = 138412546;
    v23 = a1;
    v24 = 2112;
    v25 = a2;
    _os_log_error_impl(&dword_19BC07000, v12, OS_LOG_TYPE_ERROR, "type mismatch when calling _DDResultCFEqual on %@ and %@", (uint8_t *)&v22, 0x16u);
    return 0;
  }
  return result;
}

CFHashCode _DDResultCFHash(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 64);
  if (v1)
    return CFHash(v1);
  else
    return 1;
}

CFStringRef _DDResultCFCopyFormatDescription(_QWORD *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDResult:%p %@ [%ld:%ld, %ld:%ld]>"), a1, a1[8], (uint64_t)(int)a1[2] >> 16, (uint64_t)a1[2] >> 32, (uint64_t)(int)a1[3] >> 16, (uint64_t)a1[3] >> 32);
}

uint64_t DDResultCreateEmpty()
{
  CFTypeID v0;

  v0 = DDTypeRegister(&DDResultGetTypeID_typeID);
  return DDTypeCreateInstance_(0, v0, 0x60uLL);
}

void DDResultSetType(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 64);
  if (v3 != cf)
  {
    if (v3)
      CFRelease(v3);
    *(_QWORD *)(a1 + 64) = cf;
    if (cf)
      CFRetain(cf);
  }
}

CFMutableArrayRef DDResultSetSubResults(uint64_t a1, CFArrayRef theArray)
{
  CFMutableArrayRef result;

  result = *(CFMutableArrayRef *)(a1 + 56);
  if (result != theArray)
  {
    if (result)
      CFRelease(result);
    result = 0;
    if (theArray)
      result = CFArrayCreateMutableCopy(0, 0, theArray);
    *(_QWORD *)(a1 + 56) = result;
  }
  return result;
}

void DDResultRemoveSubresultWithType(uint64_t a1, const __CFString *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  CFStringRef *ValueAtIndex;

  v3 = *(const __CFArray **)(a1 + 56);
  Count = CFArrayGetCount(v3);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    while (1)
    {
      ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v3, v6);
      if (a2)
      {
        if (ValueAtIndex && _typesAreEqual(ValueAtIndex[8], a2))
          break;
      }
      if (v5 == ++v6)
        return;
    }
    CFArrayRemoveValueAtIndex(v3, v6);
  }
}

void DDResultAddSubresultSorted(uint64_t a1, _QWORD *a2)
{
  const __CFArray *Mutable;
  uint64_t v5;
  CFIndex Count;
  CFIndex v7;

  Mutable = *(const __CFArray **)(a1 + 56);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x1E0C9B378]);
    *(_QWORD *)(a1 + 56) = Mutable;
  }
  v5 = a2[4];
  Count = CFArrayGetCount(Mutable);
  if (Count < 1)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    while (*((_QWORD *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v7) + 4) <= v5)
    {
      if (Count == ++v7)
        goto LABEL_10;
    }
  }
  if (v7 == Count)
LABEL_10:
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 56), a2);
  else
    CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), v7, a2);
}

uint64_t DDResultGetRange(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t DDResultGetSubResults(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t DDResultGetValue(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 80);
    if (!result)
      return *(_QWORD *)(v1 + 72);
  }
  return result;
}

uint64_t DDResultGetMatchedString(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

void DDResultSetContextualData(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4;
  CFTypeID v5;

  if (a1)
  {
    v4 = *(CFTypeRef *)(a1 + 88);
    if (v4 != cf)
    {
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a1 + 88) = 0;
      }
      if (cf)
      {
        v5 = CFGetTypeID(cf);
        if (v5 == CFDictionaryGetTypeID())
          *(_QWORD *)(a1 + 88) = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)cf);
      }
    }
  }
}

void DDResultSetTestUrlificationRange(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  const __CFAllocator *v6;
  CFNumberRef v7;
  CFNumberRef v8;
  int v9;
  int valuePtr;

  if (a1)
  {
    v3 = a2;
    if (a2 != -1)
    {
      if (!*(_QWORD *)(a1 + 88))
        *(_QWORD *)(a1 + 88) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v9 = a3;
      valuePtr = v3;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
      v8 = CFNumberCreate(v6, kCFNumberIntType, &v9);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), CFSTR("urlificationBegin"), v7);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), CFSTR("urlificationLength"), v8);
      CFRelease(v7);
      CFRelease(v8);
    }
  }
}

uint64_t DDResultGetTestUrlificationRange(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  BOOL v5;
  const __CFNumber *v6;
  uint64_t valuePtr;

  if (!a1)
    return -1;
  v2 = *(const __CFDictionary **)(a1 + 88);
  if (v2
    && ((Value = (const __CFNumber *)CFDictionaryGetValue(v2, CFSTR("urlificationBegin")),
         v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 88), CFSTR("urlificationLength")),
         Value)
      ? (v5 = v4 == 0)
      : (v5 = 1),
        !v5
     && (v6 = v4, valuePtr = 0, CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4))
     && CFNumberGetValue(v6, kCFNumberIntType, &valuePtr)))
  {
    return SHIDWORD(valuePtr);
  }
  else
  {
    return -1;
  }
}

void DDResultAppendContextualData(uint64_t a1, void *value, void *key)
{
  __CFDictionary *Mutable;

  if (a1 && key)
  {
    Mutable = *(__CFDictionary **)(a1 + 88);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      *(_QWORD *)(a1 + 88) = Mutable;
    }
    CFDictionarySetValue(Mutable, key, value);
  }
}

const void *DDResultGetContextualDataForKey(uint64_t a1, const void *a2)
{
  const __CFDictionary *v2;

  if (a1 && a2 && (v2 = *(const __CFDictionary **)(a1 + 88)) != 0)
    return CFDictionaryGetValue(v2, a2);
  else
    return 0;
}

uint64_t DDResultGetContextualData(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

float DDResultGetContextualFloat(uint64_t a1)
{
  const void *ValueAtIndex;
  const __CFArray *v3;

  ValueAtIndex = (const void *)a1;
  if (*(_BYTE *)(a1 + 104))
    return *((float *)ValueAtIndex + 27);
  v3 = *(const __CFArray **)(a1 + 56);
  if (v3
    && CFArrayGetCount(v3) == 1
    && (ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)ValueAtIndex + 7), 0), *((_BYTE *)ValueAtIndex + 104)))
  {
    return *((float *)ValueAtIndex + 27);
  }
  else
  {
    return NAN;
  }
}

uint64_t DDResultHasContextualFloat(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 104))
    {
      return 1;
    }
    else
    {
      result = *(_QWORD *)(result + 56);
      if (result)
      {
        if (CFArrayGetCount((CFArrayRef)result) == 1)
        {
          result = (uint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 56), 0);
          if (result)
            return *(_BYTE *)(result + 104) != 0;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DDResultGetQueryRange(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

const __CFString **DDResultGetCountryCode(const __CFString **result)
{
  uint64_t v1;

  if (result)
  {
    v1 = (uint64_t)result;
    if (_typesAreEqual(result[8], CFSTR("FullAddress")))
    {
      result = _DDResultGetCountryCodeForSubresult(v1, CFSTR("Country"));
      if (!result)
      {
        result = _DDResultGetCountryCodeForSubresult(v1, CFSTR("State"));
        if (!result)
        {
          result = _DDResultGetCountryCodeForSubresult(v1, CFSTR("ZipCode"));
          if (!result)
            return _DDResultGetCountryCodeForSubresult(v1, CFSTR("City"));
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFString **_DDResultGetCountryCodeForSubresult(uint64_t a1, const __CFString *a2)
{
  const __CFString **result;
  const __CFString **v3;

  result = DDResultGetSubresultWithType(a1, a2);
  if (result)
  {
    result = DDResultGetSubresultWithType((uint64_t)result, CFSTR("CountryCode"));
    if (result)
    {
      v3 = result;
      result = (const __CFString **)result[10];
      if (!result)
        return (const __CFString **)v3[9];
    }
  }
  return result;
}

uint64_t _DDGetRelevantSubResultRangeForResult(uint64_t a1)
{
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  uint64_t v5;
  const void *ValueAtIndex;
  const __CFString *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(const __CFArray **)(a1 + 56);
  if (!v1)
    return -1;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count < 1)
    return -1;
  v3 = Count;
  v4 = 0;
  v5 = -1;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    v7 = (const __CFString *)*((_QWORD *)ValueAtIndex + 8);
    if (v7)
    {
      v8 = ValueAtIndex;
      if (_typesAreEqual(*((CFStringRef *)ValueAtIndex + 8), CFSTR("RelativeDay")))
        return -1;
      v9 = v8[4];
      if (_typesAreEqual(v7, CFSTR("Date"))
        || _typesAreEqual(v7, CFSTR("AbsoluteDate"))
        || _typesAreEqual(v7, CFSTR("RelativeDayOfWeek")))
      {
        v10 = _DDGetRelevantSubResultRangeForResult(v8);
        if (v10 == -1)
          return -1;
        v9 = v10;
      }
      if (v5 == -1)
        v5 = v9;
    }
    ++v4;
  }
  while (v3 != v4);
  return v5;
}

const __CFString *DDResultGetQueryRangeForURLification(uint64_t a1)
{
  const __CFString **v2;

  v2 = 0;
  return _DDGetRelevantResultsForUrlificationRange(a1, &v2)[2];
}

uint64_t DDResultSetAbsoluteRange(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 32) = a2;
  *(_QWORD *)(result + 40) = a3;
  return result;
}

CFIndex DDResultOffsetAbsoluteRange(CFIndex result, uint64_t a2)
{
  uint64_t v2;

  if (result && a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2 + a2 < 0 != __OFADD__(v2, a2))
      a2 = -v2;
    *(_QWORD *)(result + 32) = a2 + v2;
    return DDResultOffsetAbsoluteRangesNoCheck(*(_QWORD *)(result + 56), a2);
  }
  return result;
}

CFIndex DDResultOffsetAbsoluteRangesNoCheck(CFIndex result, uint64_t a2)
{
  const __CFArray *v3;
  CFIndex v4;
  CFIndex i;
  _QWORD *ValueAtIndex;

  if (result)
  {
    v3 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      v4 = result;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        ValueAtIndex[4] += a2;
        result = DDResultOffsetAbsoluteRangesNoCheck(ValueAtIndex[7], a2);
      }
    }
  }
  return result;
}

void DDResultSetMatchedString(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 72);
  if (v3 != cf)
  {
    if (v3)
      CFRelease(v3);
    *(_QWORD *)(a1 + 72) = cf;
    if (cf)
      CFRetain(cf);
  }
}

const __CFArray *DDResultGetSubresultWithTypePath(uint64_t a1, const __CFString *a2)
{
  const __CFArray *result;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  uint64_t v7;
  const __CFString *ValueAtIndex;
  const __CFString **SubresultWithType;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, CFSTR("."));
      if (result)
      {
        v4 = result;
        Count = CFArrayGetCount(result);
        if (Count >= 1)
        {
          v6 = Count;
          v7 = 1;
          do
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, v7 - 1);
            SubresultWithType = DDResultGetSubresultWithType(a1, ValueAtIndex);
            a1 = (uint64_t)SubresultWithType;
            if (v7 >= v6)
              break;
            ++v7;
          }
          while (SubresultWithType);
        }
        CFRelease(v4);
        return (const __CFArray *)a1;
      }
    }
  }
  return result;
}

const void *DDResultGetUnwrappedResultOfType(uint64_t a1, const __CFString *a2)
{
  if (a1 && a2 && _typesAreEqual(*(CFStringRef *)(a1 + 64), a2))
    return CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), 0);
  else
    return (const void *)a1;
}

CFArrayRef DDResultValueContains(CFArrayRef result, const __CFString *a2)
{
  const __CFString *v3;
  const void *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __CFString *ValueAtIndex;

  if (!result)
    return result;
  v3 = (const __CFString *)*((_QWORD *)result + 10);
  if (!v3)
  {
    v3 = (const __CFString *)*((_QWORD *)result + 9);
    if (!v3)
      return 0;
  }
  if (CFStringFind(v3, CFSTR("-"), 0).location == -1)
    return (CFArrayRef)(CFStringCompare(v3, a2, 0) == kCFCompareEqualTo);
  result = CFStringCreateArrayBySeparatingStrings(0, v3, CFSTR("-"));
  if (!result)
    return result;
  v4 = result;
  Count = CFArrayGetCount(result);
  if (Count < 1)
  {
LABEL_10:
    CFRelease(v4);
    return 0;
  }
  v6 = Count;
  v7 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v4, v7);
    if (CFStringCompare(ValueAtIndex, a2, 0) == kCFCompareEqualTo)
      break;
    if (v6 == ++v7)
      goto LABEL_10;
  }
  CFRelease(v4);
  return (CFArrayRef)1;
}

uint64_t DDResultGetVirtualDistance(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = -1;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a2 + 32);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v5 + *(_QWORD *)(a1 + 40);
    v7 = v4 + *(_QWORD *)(a2 + 40);
    if (v6 >= v7)
      v8 = v4 + *(_QWORD *)(a2 + 40);
    else
      v8 = v6;
    v9 = 20;
    if (v4 < v5)
      v9 = 0;
    v10 = v4 <= v5 && v5 < v7;
    v11 = v5;
    if (v10 || v5 <= v4 && (v11 = *(_QWORD *)(a2 + 32), v4 < v6))
    {
      if (v8 != v11)
        return 0;
    }
    v12 = v5 - v7;
    v13 = v4 - v6;
    if (v4 < v5)
      v13 = v12;
    if (v13)
      return v13 + v9;
    else
      return 0;
  }
  return result;
}

const __CFString *DDResultGetTagTypeForDataType(const __CFString *result)
{
  const __CFString *v1;

  if (result)
  {
    v1 = result;
    if (_typesAreEqual((CFStringRef)result[2].isa, CFSTR("TrackingInformation")))
    {
      return CFSTR("Carrier");
    }
    else if (_typesAreEqual((CFStringRef)v1[2].isa, CFSTR("FlightInformation")))
    {
      return CFSTR("AirlineCode");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL DDResultMatchesMLClassification(uint64_t a1, int a2)
{
  return a2 != 10 && DDMLClassificationForType(a1) == a2;
}

uint64_t DDMLClassificationForType(uint64_t a1)
{
  if (CFStringHasPrefix(*(CFStringRef *)(a1 + 64), CFSTR("FullAddress")))
    return 0;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("FlightInformation")))
    return 3;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Money")))
    return 4;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("PhysicalAmount")))
    return 6;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Email")))
    return 9;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("PhoneNumber")))
    return 8;
  if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Location")))
    return 1;
  if (DDResultGetCategory(a1) == 4)
    return 5;
  return 10;
}

uint64_t DDResultTypeIsMLSupported(uint64_t a1, const __CFArray *a2)
{
  uint64_t v2;
  CFNumberRef v4;
  CFNumberRef v5;
  int valuePtr;
  CFRange v8;

  v2 = 0;
  if (a1 && a2)
  {
    valuePtr = DDMLClassificationForType(a1);
    if (valuePtr == 10)
      return 0;
    v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (!v4)
    {
      return 0;
    }
    else
    {
      v5 = v4;
      v8.length = CFArrayGetCount(a2);
      v8.location = 0;
      v2 = CFArrayContainsValue(a2, v8, v5);
      CFRelease(v5);
    }
  }
  return v2;
}

uint64_t DDResultGetOptionalSourceTableIndex(uint64_t a1)
{
  const void *v2;
  const __CFArray *v4;
  const void *ValueAtIndex;
  const __CFString *v6;
  CFIndex Length;
  int CharacterAtIndex;

  if (!a1)
    return -1;
  v2 = *(const void **)(a1 + 64);
  if (CFEqual(v2, CFSTR("GameCenter")))
    return 0;
  if (CFEqual(v2, CFSTR("Parsec")) || CFEqual(v2, CFSTR("Client")))
  {
    v4 = *(const __CFArray **)(a1 + 56);
    if (v4)
    {
      if (CFArrayGetCount(v4) == 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
        if (ValueAtIndex)
        {
          v6 = (const __CFString *)*((_QWORD *)ValueAtIndex + 8);
          Length = CFStringGetLength(v6);
          if (Length >= 1)
          {
            CharacterAtIndex = CFStringGetCharacterAtIndex(v6, Length - 1);
            if ((CharacterAtIndex - 58) > 0xFFFFFFF5)
              return (CharacterAtIndex - 48);
          }
        }
      }
    }
  }
  return -1;
}

uint64_t DDResultSetProperties(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  if (a3)
    v3 = *(_QWORD *)(result + 96) | a2;
  else
    v3 = *(_QWORD *)(result + 96) & ~a2;
  *(_QWORD *)(result + 96) = v3;
  return result;
}

uint64_t DDResultProximitySort(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a3 + 32);
  v6 = v5;
  v7 = v5 + *(_QWORD *)(a3 + 40);
  v8 = v3 + *(_QWORD *)(a1 + 40);
  if (v7 >= v8)
    v9 = v3 + *(_QWORD *)(a1 + 40);
  else
    v9 = v5 + *(_QWORD *)(a3 + 40);
  v10 = v3 <= v5 && v5 < v8;
  v11 = *(_QWORD *)(a3 + 32);
  if ((v10 || (v5 <= v3 ? (v12 = v3 < v7) : (v12 = 0), v11 = *(_QWORD *)(a1 + 32), v12)) && v9 != v11)
  {
    v14 = 0;
  }
  else
  {
    v13 = v5 - v8;
    if (v5 > v3)
      v14 = v13;
    else
      v14 = v3 - v7;
  }
  v15 = v4 + *(_QWORD *)(a2 + 40);
  if (v7 >= v15)
    v16 = v4 + *(_QWORD *)(a2 + 40);
  else
    v16 = v5 + *(_QWORD *)(a3 + 40);
  v17 = v4 <= v5 && v5 < v15;
  if ((v17 || v5 <= v4 && (v6 = *(_QWORD *)(a2 + 32), v4 < v7)) && v16 != v6)
  {
    v19 = 0;
  }
  else
  {
    v18 = v4 - v7;
    if (v5 > v4)
      v19 = v5 - v15;
    else
      v19 = v18;
  }
  v20 = v14 <= v19;
  v21 = v14 < v19 || a1 == a3;
  v22 = !v20 || a2 == a3;
  v23 = v21 << 63 >> 63;
  if (v22)
    return 1;
  else
    return v23;
}

uint64_t DDResultRangeCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = v3 == v5;
  if (v3 < v5)
    v7 = -1;
  else
    v7 = 1;
  if (v6)
    v7 = 0;
  v8 = v2 < v4;
  if (v2 == v4)
    v9 = v7;
  else
    v9 = 1;
  if (v8)
    return -1;
  else
    return v9;
}

_QWORD *DDResultCreateFromXMLNode(const xmlNode *a1)
{
  xmlAttrPtr v2;
  void (**v3)(xmlChar *);
  xmlChar *Prop;
  xmlChar *v5;
  uint64_t v6;
  xmlChar *v7;
  xmlChar *v8;
  uint64_t v9;
  CFStringRef v10;
  _QWORD *v11;
  xmlChar *v12;
  uint64_t v13;
  xmlChar *v14;
  xmlChar *v15;
  unsigned int v16;
  xmlChar *v17;
  xmlChar *v18;
  uint64_t v19;
  xmlChar *v20;
  CFStringRef v21;
  xmlChar *v22;
  __CFString *v23;
  _xmlNode *i;
  void *v25;
  const void *v26;
  unsigned int v28;

  if (!xmlHasProp(a1, (const xmlChar *)"begin") || !xmlHasProp(a1, (const xmlChar *)"end"))
    return 0;
  v2 = xmlHasProp(a1, (const xmlChar *)"begin");
  v3 = (void (**)(xmlChar *))MEMORY[0x1E0DE8D30];
  if (v2 && (Prop = xmlGetProp(a1, (const xmlChar *)"begin")) != 0)
  {
    v5 = Prop;
    v28 = 0;
    sscanf((const char *)Prop, "%d", &v28);
    (*v3)(v5);
    v6 = v28;
  }
  else
  {
    v6 = 0;
  }
  if (xmlHasProp(a1, (const xmlChar *)"end") && (v7 = xmlGetProp(a1, (const xmlChar *)"end")) != 0)
  {
    v8 = v7;
    v28 = 0;
    sscanf((const char *)v7, "%d", &v28);
    (*v3)(v8);
    v9 = v28;
  }
  else
  {
    v9 = 0;
  }
  v10 = CFStringCreateWithCString(0, (const char *)a1->name, 0x8000100u);
  v11 = DDResultCreate(v10, v6 << 32, v9 << 32);
  CFRelease(v10);
  v11[4] = (int)v6;
  v11[5] = (int)v9 - (int)v6;
  if (xmlHasProp(a1, (const xmlChar *)"urlificationBegin") && xmlHasProp(a1, (const xmlChar *)"urlificationEnd"))
  {
    if (xmlHasProp(a1, (const xmlChar *)"urlificationBegin"))
    {
      v12 = xmlGetProp(a1, (const xmlChar *)"urlificationBegin");
      v13 = (uint64_t)v12;
      if (v12)
      {
        v28 = 0;
        sscanf((const char *)v12, "%d", &v28);
        (*v3)((xmlChar *)v13);
        v13 = (int)v28;
      }
    }
    else
    {
      v13 = 0;
    }
    if (xmlHasProp(a1, (const xmlChar *)"urlificationEnd")
      && (v14 = xmlGetProp(a1, (const xmlChar *)"urlificationEnd")) != 0)
    {
      v15 = v14;
      v28 = 0;
      sscanf((const char *)v14, "%d", &v28);
      (*v3)(v15);
      v16 = v28;
    }
    else
    {
      v16 = 0;
    }
    DDResultSetTestUrlificationRange((uint64_t)v11, v13, v16 - v13);
  }
  if (xmlHasProp(a1, (const xmlChar *)"score"))
  {
    if (xmlHasProp(a1, (const xmlChar *)"score") && (v17 = xmlGetProp(a1, (const xmlChar *)"score")) != 0)
    {
      v18 = v17;
      v28 = 0;
      sscanf((const char *)v17, "%d", &v28);
      (*v3)(v18);
      v19 = (int)v28;
    }
    else
    {
      v19 = 0;
    }
    v11[6] = v19;
  }
  if (xmlHasProp(a1, (const xmlChar *)"value"))
  {
    v20 = xmlGetProp(a1, (const xmlChar *)"value");
    v21 = CFStringCreateWithCString(0, (const char *)v20, 0x8000100u);
    (*v3)(v20);
    if (v21)
    {
      DDResultSetValue((uint64_t)v11, v21);
      CFRelease(v21);
    }
  }
  if (xmlHasProp(a1, (const xmlChar *)"id"))
  {
    v22 = xmlGetProp(a1, (const xmlChar *)"id");
    v23 = (__CFString *)CFStringCreateWithCString(0, (const char *)v22, 0x8000100u);
    (*v3)(v22);
    if (v23)
    {
      DDResultAppendContextualData((uint64_t)v11, v23, CFSTR("C"));
      CFRelease(v23);
    }
  }
  for (i = a1->children; i; i = i->next)
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      v25 = (void *)DDResultCreateFromXMLNode(i);
      if (!v25)
      {
        CFRelease(v11);
        return 0;
      }
      v26 = v25;
      DDResultAddSubresult((uint64_t)v11, v25);
      CFRelease(v26);
    }
  }
  return v11;
}

xmlNode *DDResultCreateVerboseXMLRepresentation(uint64_t a1, const __CFString *a2, int a3)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  const __CFString *v8;
  CFIndex v9;
  CFIndex v10;
  const __CFDictionary *v11;
  const __CFString *Value;
  const __CFString *v13;
  CFIndex v14;
  CFIndex v15;
  char v16;
  CFIndex v17;
  const __CFString *v18;
  const __CFString *v19;
  CFIndex v20;
  CFIndex v21;
  uint64_t v22;
  size_t v23;
  void *v24;
  xmlNode *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t RangeForURLification;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  const __CFAllocator *v33;
  const __CFString *v34;
  const __CFAllocator *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  CFIndex v40;
  CFIndex v41;
  const __CFArray *v42;
  CFIndex v43;
  CFIndex v44;
  _QWORD *ValueAtIndex;
  uint64_t v46;
  xmlNode *VerboseXMLRepresentation;
  xmlNode *v48;
  const __CFString *v49;
  CFIndex v50;
  const __CFString *v52;
  const __CFString *theString;
  char v54;
  const __CFString *v55;
  char v56;
  char v57;
  CFIndex v58;
  CFIndex usedBufLen;
  CFRange v60;
  CFRange v61;

  Length = CFStringGetLength(*(CFStringRef *)(a1 + 64));
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v8 = *(const __CFString **)(a1 + 80);
  if (v8)
  {
    v9 = CFStringGetLength(v8);
    v10 = CFStringGetMaximumSizeForEncoding(v9, 0x8000100u);
  }
  else
  {
    v10 = 0;
  }
  v11 = *(const __CFDictionary **)(a1 + 88);
  if (v11)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v11, CFSTR("C"));
    v13 = Value;
    if (Value)
    {
      v14 = CFStringGetLength(Value);
      v15 = CFStringGetMaximumSizeForEncoding(v14, 0x8000100u);
      v16 = 0;
    }
    else
    {
      v15 = 0;
      v16 = 1;
    }
    v11 = *(const __CFDictionary **)(a1 + 88);
    if (v11)
    {
      v19 = (const __CFString *)CFDictionaryGetValue(v11, CFSTR("U"));
      v18 = v19;
      if (v19)
      {
        v20 = CFStringGetLength(v19);
        v17 = CFStringGetMaximumSizeForEncoding(v20, 0x8000100u);
        v57 = 0;
      }
      else
      {
        v17 = 0;
        v57 = 1;
      }
      v11 = *(const __CFDictionary **)(a1 + 88);
      if (v11 && (v11 = (const __CFDictionary *)CFDictionaryGetValue(v11, CFSTR("D"))) != 0)
      {
        v55 = (const __CFString *)v11;
        v21 = CFStringGetLength((CFStringRef)v11);
        v11 = (const __CFDictionary *)CFStringGetMaximumSizeForEncoding(v21, 0x8000100u);
        v56 = 0;
      }
      else
      {
        v55 = 0;
        v56 = 1;
      }
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v55 = 0;
      v56 = 1;
      v57 = 1;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v13 = 0;
    v15 = 0;
    v55 = 0;
    v56 = 1;
    v57 = 1;
    v16 = 1;
  }
  v22 = 128;
  if (MaximumSizeForEncoding >= 128)
    v22 = MaximumSizeForEncoding + 1;
  if (v22 <= v10 + 1)
    v22 = v10 + 1;
  if (v22 <= v15 + 1)
    v22 = v15 + 1;
  if (v22 <= v17 + 1)
    v22 = v17 + 1;
  if (v22 <= (uint64_t)v11 + 1)
    v23 = (size_t)v11 + 1;
  else
    v23 = v22;
  v24 = malloc_type_malloc(v23, 0x100004077774924uLL);
  if (!CFStringGetCString(*(CFStringRef *)(a1 + 64), (char *)v24, v23, 0x8000100u))
  {
    free(v24);
    return 0;
  }
  v54 = v16;
  theString = v13;
  v25 = xmlNewNode(0, (const xmlChar *)v24);
  snprintf((char *)v24, v23, "%d", *(_DWORD *)(a1 + 20));
  xmlNewProp(v25, (const xmlChar *)"begin", (const xmlChar *)v24);
  snprintf((char *)v24, v23, "%d", *(_DWORD *)(a1 + 28));
  xmlNewProp(v25, (const xmlChar *)"end", (const xmlChar *)v24);
  if (a3)
  {
    v52 = v18;
    v27 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    RangeForURLification = DDResultGetRangeForURLification(a1);
    v30 = RangeForURLification;
    v31 = v29;
    v32 = v27 == RangeForURLification;
    v18 = v52;
    if (!v32 || v26 != v29)
    {
      usedBufLen = 0;
      v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v34 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%ld"), RangeForURLification);
      v60.length = CFStringGetLength(v34);
      v60.location = 0;
      CFStringGetBytes(v34, v60, 0x8000100u, 0x2Du, 0, (UInt8 *)v24, v23, &usedBufLen);
      *((_BYTE *)v24 + usedBufLen) = 0;
      CFRelease(v34);
      xmlNewProp(v25, (const xmlChar *)"urlificationBegin", (const xmlChar *)v24);
      v35 = v33;
      v18 = v52;
      v36 = CFStringCreateWithFormat(v35, 0, CFSTR("%ld"), v30 + v31);
      v61.length = CFStringGetLength(v36);
      v61.location = 0;
      CFStringGetBytes(v36, v61, 0x8000100u, 0x2Du, 0, (UInt8 *)v24, v23, &usedBufLen);
      *((_BYTE *)v24 + usedBufLen) = 0;
      CFRelease(v36);
      xmlNewProp(v25, (const xmlChar *)"urlificationEnd", (const xmlChar *)v24);
    }
  }
  if (*(_QWORD *)(a1 + 48))
  {
    snprintf((char *)v24, v23, "%ld", *(_QWORD *)(a1 + 48));
    xmlNewProp(v25, (const xmlChar *)"score", (const xmlChar *)v24);
  }
  v37 = *(const __CFString **)(a1 + 80);
  if (v37)
  {
    if (!CFStringGetCString(v37, (char *)v24, v23, 0x8000100u))
      goto LABEL_68;
    xmlNewProp(v25, (const xmlChar *)"value", (const xmlChar *)v24);
  }
  if (*(_BYTE *)(a1 + 104))
  {
    v38 = CFStringCreateWithFormat(0, 0, CFSTR("%f"), *(float *)(a1 + 108));
    if (v38)
    {
      v39 = v38;
      if (!CFStringGetCString(v38, (char *)v24, v23, 0x8000100u))
      {
        CFRelease(v39);
        goto LABEL_68;
      }
      xmlNewProp(v25, (const xmlChar *)"floatMeta", (const xmlChar *)v24);
      CFRelease(v39);
    }
  }
  if ((v54 & 1) == 0)
  {
    if (!CFStringGetCString(theString, (char *)v24, v23, 0x8000100u))
      goto LABEL_68;
    xmlNewProp(v25, (const xmlChar *)"ABUID", (const xmlChar *)v24);
  }
  if ((v57 & 1) != 0)
    goto LABEL_50;
  if (!CFStringGetCString(v18, (char *)v24, v23, 0x8000100u))
  {
LABEL_68:
    free(v24);
    xmlFreeNode(v25);
    return 0;
  }
  xmlNewProp(v25, (const xmlChar *)"UUID", (const xmlChar *)v24);
LABEL_50:
  if ((v56 & 1) != 0)
    goto LABEL_53;
  if (!CFStringGetCString(v55, (char *)v24, v23, 0x8000100u))
    goto LABEL_68;
  xmlNewProp(v25, (const xmlChar *)"Domain", (const xmlChar *)v24);
LABEL_53:
  free(v24);
  v41 = *(_QWORD *)(a1 + 32);
  v40 = *(_QWORD *)(a1 + 40);
  v42 = *(const __CFArray **)(a1 + 56);
  if (v42)
  {
    v58 = v40;
    v43 = 0;
    v44 = v41;
    while (v43 < CFArrayGetCount(v42))
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v42, v43);
      v46 = ValueAtIndex[4];
      VerboseXMLRepresentation = (xmlNode *)DDResultCreateVerboseXMLRepresentation();
      if (a2)
      {
        if (v46 > v44)
          _DDResultAppendXMLTextNode(v25, a2, v44, v46 - v44);
      }
      xmlAddChild(v25, VerboseXMLRepresentation);
      v44 = ValueAtIndex[5] + ValueAtIndex[4];
      ++v43;
    }
    if (a2)
    {
      v40 = v58 + v41 - v44;
      if (v58 + v41 > v44)
      {
        v48 = v25;
        v49 = a2;
        v50 = v44;
LABEL_66:
        _DDResultAppendXMLTextNode(v48, v49, v50, v40);
      }
    }
  }
  else if (a2)
  {
    v48 = v25;
    v49 = a2;
    v50 = v41;
    goto LABEL_66;
  }
  return v25;
}

void _DDResultAppendXMLTextNode(xmlNode *a1, CFStringRef theString, CFIndex a3, CFIndex a4)
{
  const __CFString *v8;
  CFMutableStringRef MutableCopy;
  CFIndex v10;
  char *v11;
  xmlNode *v12;
  CFRange v13;

  if (CFStringGetLength(theString) >= a3 + a4)
  {
    v13.location = a3;
    v13.length = a4;
    v8 = CFStringCreateWithSubstring(0, theString, v13);
    MutableCopy = CFStringCreateMutableCopy(0, 0, v8);
    CFRelease(v8);
    CFStringTrimWhitespace(MutableCopy);
    if (CFStringGetLength(MutableCopy))
    {
      v10 = CFStringGetMaximumSizeForEncoding(a4, 0x8000100u) + 1;
      v11 = (char *)malloc_type_malloc(v10, 0x100004077774924uLL);
      CFStringGetCString(MutableCopy, v11, v10, 0x8000100u);
      v12 = xmlNewText((const xmlChar *)v11);
      xmlAddChild(a1, v12);
      free(v11);
    }
    CFRelease(MutableCopy);
  }
}

xmlNode *DDResultCreateXMLRepresentation(uint64_t a1, int a2)
{
  return DDResultCreateVerboseXMLRepresentation(a1, 0, a2);
}

CFStringRef DDResultCreateVerboseXMLDescription(uint64_t a1, const __CFString *a2, int a3)
{
  xmlNode *VerboseXMLRepresentation;
  CFStringRef DescriptionOfXMLNode;

  VerboseXMLRepresentation = DDResultCreateVerboseXMLRepresentation(a1, a2, a3);
  DescriptionOfXMLNode = _DDResultCreateDescriptionOfXMLNode(VerboseXMLRepresentation);
  xmlFreeNode(VerboseXMLRepresentation);
  return DescriptionOfXMLNode;
}

CFStringRef _DDResultCreateDescriptionOfXMLNode(xmlNode *a1)
{
  xmlBufferPtr v2;
  const char *v3;
  CFStringRef v4;

  v2 = xmlBufferCreate();
  xmlNodeDump(v2, a1->doc, a1, 0, 1);
  v3 = (const char *)xmlBufferContent(v2);
  v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  xmlBufferFree(v2);
  return v4;
}

CFStringRef DDResultCreateVerboseXMLDescriptionFromResults(const __CFArray *a1, const __CFString *a2, int a3)
{
  xmlNode *v6;
  CFIndex i;
  const void *ValueAtIndex;
  xmlNode *VerboseXMLRepresentation;
  CFStringRef DescriptionOfXMLNode;

  v6 = xmlNewNode(0, (const xmlChar *)"results");
  for (i = 0; i < CFArrayGetCount(a1); ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
    VerboseXMLRepresentation = DDResultCreateVerboseXMLRepresentation((uint64_t)ValueAtIndex, a2, a3);
    xmlAddChild(v6, VerboseXMLRepresentation);
  }
  DescriptionOfXMLNode = _DDResultCreateDescriptionOfXMLNode(v6);
  xmlFreeNode(v6);
  return DescriptionOfXMLNode;
}

BOOL DDResultIsEqualToUnitTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  const void *v10;
  const void *v11;
  int v12;
  const void *v13;
  const void *v14;
  const __CFArray *v15;
  CFIndex Count;
  const __CFArray *v17;
  uint64_t TestUrlificationRange;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v27;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 16);
  if (HIDWORD(v3) != HIDWORD(v4))
    return 0;
  if ((int)v3 >> 16 != (int)v4 >> 16)
    return 0;
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a2 + 24);
  if (HIDWORD(v7) != HIDWORD(v8) || (int)v7 >> 16 != (int)v8 >> 16)
    return 0;
  v10 = *(const void **)(a1 + 64);
  v11 = *(const void **)(a2 + 64);
  if (v10)
  {
    if (v11)
    {
      v12 = CFEqual(v10, v11);
      goto LABEL_9;
    }
    return 0;
  }
  v12 = v11 == 0;
LABEL_9:
  if (!v12)
    return 0;
  v13 = *(const void **)(a1 + 80);
  if (v13)
  {
    v14 = *(const void **)(a2 + 80);
    if (!v14)
    {
      v14 = *(const void **)(a2 + 72);
      if (!v14)
        return 0;
    }
    if (!CFEqual(v13, v14))
      return 0;
  }
  v15 = *(const __CFArray **)(a1 + 56);
  if (v15)
    Count = CFArrayGetCount(v15);
  else
    Count = 0;
  v17 = *(const __CFArray **)(a2 + 56);
  if (v17)
    v17 = (const __CFArray *)CFArrayGetCount(v17);
  if (v17 != (const __CFArray *)Count)
    return 0;
  if (!(_DWORD)a3
    || ((TestUrlificationRange = DDResultGetTestUrlificationRange(a1), TestUrlificationRange == -1)
      ? (v20 = *(_QWORD *)(a1 + 32), v21 = *(_QWORD *)(a1 + 40))
      : (v20 = TestUrlificationRange, v21 = v19),
        (v22 = 0, v20 == DDResultGetRangeForURLification(a2)) && v21 == v24))
  {
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      v22 = 0;
      for (i = 0; i != Count; v22 = i >= Count)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
        v27 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 56), i);
        if ((DDResultIsEqualToUnitTestResult(ValueAtIndex, v27, a3) & 1) == 0)
          break;
        ++i;
      }
    }
  }
  return v22;
}

CFStringRef *DDResultGetSignatureContainingResult(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFStringRef *result;
  CFStringRef *v11;

  Count = CFArrayGetCount(a1);
  if (Count == 1)
  {
    v5 = 0;
  }
  else
  {
    v6 = Count;
    v5 = 0;
    do
    {
      v7 = *(_QWORD *)(a2 + 32);
      if (v6 >= 0)
        v8 = v6;
      else
        v8 = v6 + 1;
      v9 = *((_QWORD *)CFArrayGetValueAtIndex(a1, v5 + (v8 >> 1)) + 4);
      if (v9 <= v7)
        v6 -= v8 >> 1;
      else
        v6 = v8 >> 1;
      if (v9 <= v7)
        v5 += v8 >> 1;
    }
    while (v6 != 1);
  }
  result = (CFStringRef *)CFArrayGetValueAtIndex(a1, v5);
  if (result)
  {
    v11 = result;
    if (_typesAreEqual(result[8], CFSTR("SignatureBlock")))
      return v11;
    else
      return 0;
  }
  return result;
}

uint64_t DDResultCreateCopy(uint64_t a1)
{
  CFTypeID v2;
  uint64_t Instance;
  uint64_t v4;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  const void *Copy;
  const void *v9;

  v2 = DDTypeRegister(&DDResultGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(0, v2, 0x60uLL);
  *(_QWORD *)(Instance + 96) = *(_QWORD *)(a1 + 96);
  *(_OWORD *)(Instance + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(Instance + 32) = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(Instance + 48) = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    for (i = 0; i < CFArrayGetCount(*(CFArrayRef *)(a1 + 56)); ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
      Copy = (const void *)DDResultCreateCopy(ValueAtIndex);
      CFArrayAppendValue(Mutable, Copy);
      CFRelease(Copy);
    }
    *(_QWORD *)(Instance + 56) = Mutable;
  }
  v9 = *(const void **)(a1 + 72);
  if (v9)
    *(_QWORD *)(Instance + 72) = CFRetain(v9);
  *(_QWORD *)(Instance + 64) = CFRetain(*(CFTypeRef *)(a1 + 64));
  DDResultSetValue(Instance, *(CFTypeRef *)(a1 + 80));
  DDResultSetContextualData(Instance, *(CFTypeRef *)(a1 + 88));
  return Instance;
}

_QWORD *DDResultGetParsecUUID(uint64_t a1)
{
  _QWORD *v1;
  CFTypeID v2;
  _QWORD *Value;
  CFTypeID v4;

  v1 = (_QWORD *)a1;
  if (a1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Parsec")))
      return 0;
    v1 = (_QWORD *)v1[11];
    if (v1)
    {
      v2 = CFGetTypeID(v1);
      if (v2 != CFDictionaryGetTypeID())
        return 0;
      Value = CFDictionaryGetValue((CFDictionaryRef)v1, CFSTR("U"));
      if (!Value)
        return 0;
      v1 = Value;
      v4 = CFGetTypeID(Value);
      if (v4 != CFStringGetTypeID())
        return 0;
    }
  }
  return v1;
}

_QWORD *DDResultGetParsecRawDomain(uint64_t a1)
{
  _QWORD *v1;
  CFTypeID v2;
  _QWORD *Value;
  CFTypeID v4;

  v1 = (_QWORD *)a1;
  if (a1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Parsec")))
      return 0;
    v1 = (_QWORD *)v1[11];
    if (v1)
    {
      v2 = CFGetTypeID(v1);
      if (v2 != CFDictionaryGetTypeID())
        return 0;
      Value = CFDictionaryGetValue((CFDictionaryRef)v1, CFSTR("D"));
      if (!Value)
        return 0;
      v1 = Value;
      v4 = CFGetTypeID(Value);
      if (v4 != CFStringGetTypeID())
        return 0;
    }
  }
  return v1;
}

uint64_t DDResultGetParsecDomain(uint64_t a1)
{
  _QWORD *ParsecRawDomain;
  const void *v3;

  if (!a1)
    return 4294967294;
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Parsec")))
    return 4294967294;
  ParsecRawDomain = DDResultGetParsecRawDomain(a1);
  if (!ParsecRawDomain)
    return 0xFFFFFFFFLL;
  v3 = ParsecRawDomain;
  if (CFEqual(ParsecRawDomain, CFSTR("ondemandmovies")))
    return 0;
  if (CFEqual(v3, CFSTR("tv")))
    return 9;
  if (CFEqual(v3, CFSTR("food")))
    return 8;
  if (CFEqual(v3, CFSTR("activities")))
    return 7;
  if (CFEqual(v3, CFSTR("apps")))
    return 2;
  if (CFEqual(v3, CFSTR("artists")))
    return 3;
  if (CFEqual(v3, CFSTR("sports")))
    return 4;
  if (CFEqual(v3, CFSTR("stocks")))
    return 5;
  if (CFEqual(v3, CFSTR("wiki")))
    return 6;
  if (CFEqual(v3, CFSTR("maps")))
    return 1;
  else
    return 0xFFFFFFFFLL;
}

uint64_t DDLookupTableCreate()
{
  CFTypeID v0;
  uint64_t Instance;
  __CFData *Mutable;
  _QWORD *v3;

  v0 = DDTypeRegister(&DDLookupTableGetTypeID_typeID);
  Instance = DDTypeCreateInstance_(0, v0, 0x88uLL);
  Mutable = CFDataCreateMutable(0, 0);
  *(_QWORD *)(Instance + 96) = Mutable;
  CFDataIncreaseLength(Mutable, 24);
  v3 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
  *(_DWORD *)v3 |= 0x1000u;
  v3[2] = 0;
  v3[4] = 0;
  *(_QWORD *)(Instance + 56) = v3;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  return Instance;
}

void _DDLookupTableCFFinalize(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;

  v2 = a1[7];
  if (v2)
    DDLookupTrieDestroy(v2);
  v3 = a1[8];
  if (v3)
    DDLookupTrieDestroy(v3);
  v4 = (const void *)a1[9];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[10];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[11];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[12];
  if (v7)
    CFRelease(v7);
  v8 = (const void *)a1[14];
  if (v8)
  {
    CFRelease(v8);
    a1[14] = 0;
  }
  v9 = (void *)a1[15];
  if (v9)
  {
    free(v9);
    a1[15] = 0;
  }
  v10 = (_QWORD *)a1[2];
  if (v10)
    DDStaticLookupDestroy(v10);
  v11 = (_QWORD *)a1[3];
  if (v11)
    DDStaticLookupDestroy(v11);
}

BOOL _DDLookupTableCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _DDLookupTableCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(0, a2, CFSTR("<DDLookupTable:%p>"), a1);
}

CFStringRef _DDLookupTableCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDLookupTable:%p>"), a1);
}

void DDLookupTableSetContextThresholds(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  const void *v8;
  __CFData *Mutable;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  UInt8 bytes[8];

  v8 = *(const void **)(a1 + 72);
  if (v8)
    CFRelease(v8);
  if (a3 && a4 >= 1)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 8 * a4);
    v10 = 0;
    do
    {
      v11 = DDDynamicSourceTokenID(a2, v10);
      if (v11 != 1)
      {
        v12 = *(_DWORD *)(a3 + 4 * v10) & 0xFFFFFFF0;
        *(_WORD *)&bytes[6] = 257;
        *(_DWORD *)bytes = v12;
        *(_WORD *)&bytes[4] = v11;
        CFDataAppendBytes(Mutable, bytes, 8);
      }
      ++v10;
    }
    while (a4 != v10);
    *(_QWORD *)(a1 + 72) = Mutable;
    if (!*(_QWORD *)(a1 + 64))
    {
      v13 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
      *(_DWORD *)v13 |= 0x1000u;
      v13[2] = 0;
      v13[4] = 0;
      *(_QWORD *)(a1 + 64) = v13;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 72) = 0;
  }
}

const __CFString *DDStaticLookupTableAppendString(const __CFData **a1, CFStringRef theString, int a3)
{
  const __CFString *Length;
  const __CFData *v4;
  __CFData *Mutable;
  int64_t v8;
  int64_t v9;
  UInt8 bytes[128];
  uint64_t v12;

  Length = theString;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (*a1)
  {
    if (!theString)
      return Length;
    goto LABEL_7;
  }
  Mutable = CFDataCreateMutable(0, 0);
  v4 = Mutable;
  *a1 = Mutable;
  if (Length && a3 || (bytes[0] = 0, CFDataAppendBytes(Mutable, bytes, 1), Length))
  {
LABEL_7:
    if (CFStringGetCString(Length, (char *)bytes, 128, 0x8000100u) && (v8 = strlen((const char *)bytes), v8 >= 1))
    {
      v9 = v8;
      Length = (const __CFString *)CFDataGetLength(v4);
      CFDataAppendBytes(v4, bytes, v9 + 1);
    }
    else
    {
      return 0;
    }
  }
  return Length;
}

void DDValidateOptionalSourceTableCount(int a1, unint64_t *a2)
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  int v8;
  int v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*a2 & 0x8000000000000000) != 0)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v5 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v8 = 67109120;
      v9 = a1;
      _os_log_error_impl(&dword_19BC07000, v5, OS_LOG_TYPE_ERROR, "DDCore: Bogus table count for source %d", (uint8_t *)&v8, 8u);
    }
    v4 = 0;
    goto LABEL_15;
  }
  if ((a1 - 1) > 5)
    v4 = 0;
  else
    v4 = qword_19BC3F970[a1 - 1];
  if (*a2 > v4)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v6 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v7 = *a2;
      v8 = 67109632;
      v9 = a1;
      v10 = 2048;
      v11 = v7;
      v12 = 2048;
      v13 = v4;
      _os_log_error_impl(&dword_19BC07000, v6, OS_LOG_TYPE_ERROR, "DDCore: Too many tables for source %d, will truncate %ld to %ld tables", (uint8_t *)&v8, 0x1Cu);
    }
LABEL_15:
    *a2 = v4;
  }
}

uint64_t DDDynamicSourceTokenID(int a1, unint64_t a2)
{
  int v2;
  uint64_t result;
  uint64_t v4;

  v2 = a1 - 1;
  result = 28;
  switch(v2)
  {
    case 0:
      v4 = a2 + 38;
      goto LABEL_7;
    case 1:
    case 2:
      v4 = a2 + 10;
      goto LABEL_7;
    case 3:
      return result;
    case 4:
      v4 = a2 + 30;
      goto LABEL_7;
    case 5:
      v4 = a2 + 20;
LABEL_7:
      if (a2 >= 0xA)
        result = 1;
      else
        result = v4;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

void DDSourceSetStoragePath(char *__s)
{
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (altPath)
  {
    free((void *)altPath);
    altPath = 0;
  }
  if (__s && strlen(__s) <= 0xE0)
  {
    altPath = (uint64_t)strndup(__s, 0xE1uLL);
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v2 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315138;
      v5 = (const char *)altPath;
      v3 = "Setting new source base path: %s";
LABEL_14:
      _os_log_debug_impl(&dword_19BC07000, v2, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v2 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEBUG))
    {
      v4 = 136315138;
      v5 = "/var/db/datadetectors";
      v3 = "Using default source base path: %s";
      goto LABEL_14;
    }
  }
}

const UInt8 *DDSourceCreateFinalizedSourceContent(uint64_t a1)
{
  uint64_t v2;
  CFIndex Length;
  const UInt8 *BytePtr;
  int v5;
  int v6;
  int v7;
  CFIndex v8;
  uint64_t v9;
  const UInt8 *v10;
  int v11;
  const UInt8 *result;
  CFRange v13;

  DDLookupTablePrepareToScan((_QWORD *)a1);
  if (!*(_BYTE *)(a1 + 104))
  {
    v2 = *(_QWORD *)(a1 + 16);
    Length = CFDataGetLength(*(CFDataRef *)(v2 + 120));
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(v2 + 120));
    *(_QWORD *)(a1 + 136) = Length;
    CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 96), BytePtr, Length);
    v5 = *(_DWORD *)(a1 + 136) + *(_DWORD *)(a1 + 140);
    if (*(_QWORD *)(a1 + 24))
    {
      v6 = CFDataGetLength(*(CFDataRef *)(a1 + 96)) & 3;
      if (v6)
      {
        v7 = 4 - v6;
        CFDataIncreaseLength(*(CFMutableDataRef *)(a1 + 96), (4 - v6));
      }
      else
      {
        v7 = 0;
      }
      v9 = *(_QWORD *)(a1 + 24);
      v8 = CFDataGetLength(*(CFDataRef *)(v9 + 120));
      v10 = CFDataGetBytePtr(*(CFDataRef *)(v9 + 120));
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 96), v10, v8);
    }
    else
    {
      LODWORD(v8) = 0;
      v7 = 0;
    }
    *(_DWORD *)(a1 + 144) = v8;
    *(_DWORD *)(a1 + 148) = v5 + v7;
    v11 = CFDataGetLength(*(CFDataRef *)(a1 + 96));
    *(_DWORD *)(a1 + 128) = 515806;
    *(_DWORD *)(a1 + 132) = v11;
    v13.location = 0;
    v13.length = 24;
    CFDataReplaceBytes(*(CFMutableDataRef *)(a1 + 96), v13, (const UInt8 *)(a1 + 128), 24);
    *(_BYTE *)(a1 + 104) = 1;
  }
  result = CFDataGetBytePtr(*(CFDataRef *)(a1 + 96));
  if (result)
    return (const UInt8 *)CFDataCreate(0, result, *((int *)result + 1));
  return result;
}

void _DDSourceUpdateSourceWithContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v13 = a5;
  if (a1 && a2)
  {
    DDValidateOptionalSourceTableCount(5, (unint64_t *)&v13);
    v9 = v13;
    if (v13 >= 1)
    {
      v10 = 0;
      do
      {
        if (a3)
          v11 = *(void **)(a3 + 8 * v10);
        else
          v11 = 0;
        v12 = *(void **)(a2 + 8 * v10);
        if (v12)
          DDSourceAddDomainContent(a1, 5, v10, v12, v11);
        ++v10;
      }
      while (v9 != v10);
    }
    DDLookupTableSetContextThresholds(a1, 5, a4, v9);
  }
}

void DDSourceAddDomainContent(uint64_t a1, int a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v12 = a3;
  if ((a2 - 1) <= 5)
  {
    DDValidateOptionalSourceTableCount(a2, &v12);
    v9 = DDDynamicSourceTokenID(a2, v12);
    if (v9 != 1)
    {
      v10 = v9;
      v11 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 0x40000000;
      v14[2] = ___DDSourceAppendSourceContent_block_invoke;
      v14[3] = &unk_1E3C951A8;
      v14[5] = a1;
      v14[6] = v9;
      v14[4] = 0;
      _DDSourceApplyBlockOnEntryList(a4, v14);
      v13[0] = v11;
      v13[1] = 0x40000000;
      v13[2] = ___DDSourceAppendSourceContent_block_invoke_2;
      v13[3] = &__block_descriptor_tmp_20_424;
      v13[4] = a1;
      v13[5] = v10;
      _DDSourceApplyBlockOnEntryList(a5, v13);
    }
  }
}

void _DDSourceApplyBlockOnEntryList(void *cf, _QWORD *a2)
{
  CFTypeID v4;
  CFIndex Count;
  CFIndex v6;
  void *ValueAtIndex;
  CFTypeID v8;
  const void *v9;
  unint64_t v10;
  const void *v11;
  const void *v12;
  unint64_t v13;
  _QWORD *v14;
  CFTypeID v15;
  BOOL v16;
  CFTypeID v17;
  void (*v18)(_QWORD *, const void *, const void *, _QWORD);
  _QWORD *v19;
  const void *v20;
  const void *v21;
  NSObject *v22;
  CFTypeID v23;
  NSObject *v24;
  CFTypeID v25;
  void *value;
  uint8_t buf[4];
  CFTypeID v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (cf)
  {
    value = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] != cf)
    {
      v4 = CFGetTypeID(cf);
      if (v4 == CFArrayGetTypeID())
      {
        v25 = v4;
        Count = CFArrayGetCount((CFArrayRef)cf);
        if (Count >= 1)
        {
          v6 = Count + 1;
          while (1)
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)cf, v6 - 2);
            v8 = CFGetTypeID(ValueAtIndex);
            if (v8 != CFDictionaryGetTypeID())
              break;
            v9 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("t"));
            if (!v9)
              v9 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("title"));
            v10 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("u"));
            if (!v10)
              v10 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("uuid"));
            v11 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("s"));
            if (!v11)
              v11 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("score"));
            v12 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("f"));
            if (!v9)
              goto LABEL_29;
            v13 = (unint64_t)v12;
            v14 = a2;
            v15 = CFGetTypeID(v9);
            v16 = v15 == CFStringGetTypeID();
            a2 = v14;
            if (!v16)
              goto LABEL_29;
            if (!v11)
            {
              if (v10)
                ((void (*)(_QWORD *, const void *, unint64_t, _QWORD))v14[2])(v14, v9, v10, 0);
              goto LABEL_29;
            }
            v17 = CFGetTypeID(v11);
            v16 = v17 == CFNumberGetTypeID();
            a2 = v14;
            if (v16)
            {
              v18 = (void (*)(_QWORD *, const void *, const void *, _QWORD))v14[2];
              v19 = v14;
              v20 = v9;
              if (v10 | v13)
                v21 = ValueAtIndex;
              else
                v21 = v11;
LABEL_23:
              v18(v19, v20, v21, 0);
            }
LABEL_29:
            CFArraySetValueAtIndex((CFMutableArrayRef)cf, v6 - 2, value);
            if ((unint64_t)--v6 <= 1)
              return;
          }
          if (v8 != CFStringGetTypeID())
          {
            if (ValueAtIndex != value)
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v22 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v28 = v25;
                _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, "Unexpected table entry list type %ld (should be either strings or dictionaries)", buf, 0xCu);
              }
            }
            goto LABEL_29;
          }
          v18 = (void (*)(_QWORD *, const void *, const void *, _QWORD))a2[2];
          v19 = a2;
          v20 = ValueAtIndex;
          v21 = 0;
          goto LABEL_23;
        }
      }
      else if (v4 == CFDictionaryGetTypeID())
      {
        CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)_dictEntryApplier, a2);
      }
      else
      {
        v23 = v4;
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v24 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v28 = v23;
          _os_log_error_impl(&dword_19BC07000, v24, OS_LOG_TYPE_ERROR, "Unexpected table entry list type %ld (should be either dictionaries{string:number(float)} or arrays[string])", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t _dictEntryApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void DDSourceAddDomainsNames(uint64_t a1, int a2, CFArrayRef theArray, const __CFString *a4)
{
  CFIndex Count;
  CFIndex v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  CFIndex v13;
  const void *v14;
  char v15;
  const void *ValueAtIndex;
  const void *v17;
  CFTypeID v18;
  uint64_t v19;
  const void *v20;
  const void *v21;
  const __CFString *v22;
  __CFData *Mutable;
  unint64_t i;
  unsigned int appended;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t *v31;
  UInt8 bytes[8];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v9 = Count;
      v29 = a4;
      v30 = a1;
      v31 = &v28;
      v10 = 8 * Count;
      MEMORY[0x1E0C80A78](Count);
      v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v10 >= 0x200)
        v12 = 512;
      else
        v12 = v10;
      bzero((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      v13 = 0;
      v14 = (const void *)*MEMORY[0x1E0C9B0D0];
      v15 = 1;
      do
      {
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v13);
          if (ValueAtIndex == v14)
            break;
          v17 = ValueAtIndex;
          v18 = CFGetTypeID(ValueAtIndex);
          if (v18 != CFStringGetTypeID())
            break;
          v15 = 0;
          *(_QWORD *)&v11[8 * v13++] = v17;
          if (v13 == v9)
            goto LABEL_14;
        }
        *(_QWORD *)&v11[8 * v13++] = 0;
      }
      while (v9 != v13);
      if ((v15 & 1) != 0)
        return;
LABEL_14:
      v19 = v30;
      v20 = *(const void **)(v30 + 80);
      if (v20)
      {
        CFRelease(v20);
        *(_QWORD *)(v19 + 80) = 0;
      }
      v21 = *(const void **)(v19 + 88);
      v22 = v29;
      if (v21)
      {
        CFRelease(v21);
        *(_QWORD *)(v19 + 88) = 0;
      }
      if (v22)
        DDStaticLookupTableAppendString((const __CFData **)(v19 + 88), v22, 1);
      Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10);
      for (i = 0; i != v9; ++i)
      {
        appended = DDStaticLookupTableAppendString((const __CFData **)(v19 + 88), *(CFStringRef *)&v11[8 * i], 0);
        v26 = DDDynamicSourceTokenID(a2, i);
        if (v26 != 1)
        {
          *(_WORD *)&bytes[6] = 257;
          *(_DWORD *)bytes = appended;
          *(_WORD *)&bytes[4] = v26;
          CFDataAppendBytes(Mutable, bytes, 8);
        }
      }
      *(_QWORD *)(v19 + 80) = Mutable;
      if (!*(_QWORD *)(v19 + 64))
      {
        v27 = malloc_type_calloc(1uLL, 0x38uLL, 0x1022040E9E2EC27uLL);
        *(_DWORD *)v27 |= 0x1000u;
        v27[2] = 0;
        v27[4] = 0;
        *(_QWORD *)(v30 + 64) = v27;
      }
    }
  }
}

BOOL DDSourceRemoveFile(int a1, int a2, int a3)
{
  _BOOL8 result;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  int *v9;
  char *v10;
  int v11;
  char *v12;
  __int16 v13;
  char *v14;
  char v15[256];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!_DDTriePathForSource(a1, v15, a3, 1, a2))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v4 = DDLogHandle_error_log_handle;
    result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    v11 = 136315138;
    v12 = v15;
    v5 = "DDCore: Could not remove file %s";
    v6 = v4;
    v7 = 12;
LABEL_14:
    _os_log_error_impl(&dword_19BC07000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v11, v7);
    return 0;
  }
  if (!unlink(v15) || *__error() == 2)
    return 1;
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v8 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v9 = __error();
    v10 = strerror(*v9);
    v11 = 136315394;
    v12 = v10;
    v13 = 2080;
    v14 = v15;
    v5 = "DDCore: Could not remove file (%s) %s";
    v6 = v8;
    v7 = 22;
    goto LABEL_14;
  }
  return result;
}

void *DDStaticLookupCreateWithDynamicTrie(uint64_t a1, const __CFData *a2, const __CFData *a3, const void *a4)
{
  void *v8;
  uint64_t v9;
  int v10;
  int *v11;
  int v12;
  uint64_t v13;
  CFIndex v14;
  CFTypeRef v15;
  __CFData *Mutable;
  const __CFData *v17;
  const __CFData *v18;
  const void *v19;
  UInt8 *MutableBytePtr;
  __int128 v21;
  UInt8 *v22;
  uint64_t v23;
  unint64_t v24;
  UInt8 *v25;
  unint64_t v26;
  UInt8 *v27;
  unint64_t v28;
  UInt8 *v29;
  unint64_t v30;
  UInt8 *v31;
  unint64_t v32;
  UInt8 *v33;
  uint64_t v34;
  UInt8 *v35;
  _BYTE v37[60];
  __int16 v38;

  v8 = malloc_type_calloc(1uLL, 0xA0uLL, 0x10B004003C429ACuLL);
  v9 = *(unsigned int *)(a1 + 24);
  if ((int)v9 < 1)
  {
    v13 = 0;
  }
  else
  {
    v10 = 0;
    v11 = *(int **)(a1 + 16);
    do
    {
      v12 = *v11;
      v11 += 4;
      v10 += v12 + 1;
      --v9;
    }
    while (v9);
    v13 = v10;
  }
  *((_QWORD *)v8 + 16) = CFDataCreateMutable(0, 2 * v13);
  v14 = 4 * v13;
  *((_QWORD *)v8 + 17) = CFDataCreateMutable(0, v14);
  *((_QWORD *)v8 + 18) = CFDataCreateMutable(0, v14);
  if (a4)
    v15 = CFRetain(a4);
  else
    v15 = 0;
  *((_QWORD *)v8 + 19) = v15;
  Mutable = CFDataCreateMutable(0, 0);
  CFDataIncreaseLength(Mutable, 60);
  *((_QWORD *)v8 + 15) = Mutable;
  v38 = 0;
  visitDynTrie((CFMutableDataRef *)v8, a1, (_DWORD *)a1, (_BYTE *)&v38 + 1, &v38);
  memset(&v37[4], 0, 56);
  *(_DWORD *)&v37[8] = CFDataGetLength(Mutable) - 60;
  appendArraySectionInData(Mutable, a2, 4, &v37[28], (int *)&v37[32]);
  appendArraySectionInData(Mutable, a3, 4, &v37[36], (int *)&v37[40]);
  if (HIBYTE(v38))
    v17 = (const __CFData *)*((_QWORD *)v8 + 17);
  else
    v17 = 0;
  appendArraySectionInData(Mutable, v17, 4, &v37[20], (int *)&v37[24]);
  CFRelease(*((CFTypeRef *)v8 + 17));
  *((_QWORD *)v8 + 17) = 0;
  appendArraySectionInData(Mutable, *((const __CFData **)v8 + 16), 2, &v37[12], (int *)&v37[16]);
  CFRelease(*((CFTypeRef *)v8 + 16));
  *((_QWORD *)v8 + 16) = 0;
  if ((_BYTE)v38)
    v18 = (const __CFData *)*((_QWORD *)v8 + 18);
  else
    v18 = 0;
  appendArraySectionInData(Mutable, v18, 4, &v37[44], (int *)&v37[48]);
  CFRelease(*((CFTypeRef *)v8 + 18));
  *((_QWORD *)v8 + 18) = 0;
  appendArraySectionInData(Mutable, *((const __CFData **)v8 + 19), 1, &v37[52], (int *)&v37[56]);
  v19 = (const void *)*((_QWORD *)v8 + 19);
  if (v19)
  {
    CFRelease(v19);
    *((_QWORD *)v8 + 19) = 0;
  }
  *(_DWORD *)v37 = CFDataGetLength(Mutable);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_OWORD *)MutableBytePtr + 2) = *(_OWORD *)&v37[32];
  *(_OWORD *)(MutableBytePtr + 44) = *(_OWORD *)&v37[44];
  v21 = *(_OWORD *)&v37[16];
  *(_OWORD *)MutableBytePtr = *(_OWORD *)v37;
  *((_OWORD *)MutableBytePtr + 1) = v21;
  *(_QWORD *)v8 = MutableBytePtr;
  v22 = MutableBytePtr + 60;
  v23 = (uint64_t)&MutableBytePtr[*((int *)MutableBytePtr + 1) + 60];
  *((_QWORD *)v8 + 1) = v23;
  *((_QWORD *)v8 + 2) = v23;
  v24 = *((int *)MutableBytePtr + 4);
  *((_QWORD *)v8 + 9) = v24 >> 1;
  if (v24 >= 2)
    v25 = &v22[*((int *)MutableBytePtr + 3)];
  else
    v25 = 0;
  *((_QWORD *)v8 + 3) = v25;
  v26 = *((int *)MutableBytePtr + 6);
  *((_QWORD *)v8 + 10) = v26 >> 2;
  if (v26 >= 4)
    v27 = &v22[*((int *)MutableBytePtr + 5)];
  else
    v27 = 0;
  *((_QWORD *)v8 + 4) = v27;
  v28 = *((int *)MutableBytePtr + 8);
  *((_QWORD *)v8 + 12) = v28 >> 3;
  if (v28 >= 8)
    v29 = &v22[*((int *)MutableBytePtr + 7)];
  else
    v29 = 0;
  *((_QWORD *)v8 + 6) = v29;
  v30 = *((int *)MutableBytePtr + 12);
  *((_QWORD *)v8 + 11) = v30 >> 2;
  if (v30 >= 4)
    v31 = &v22[*((int *)MutableBytePtr + 11)];
  else
    v31 = 0;
  *((_QWORD *)v8 + 5) = v31;
  v32 = *((int *)MutableBytePtr + 10);
  *((_QWORD *)v8 + 13) = v32 >> 3;
  if (v32 >= 8)
    v33 = &v22[*((int *)MutableBytePtr + 9)];
  else
    v33 = 0;
  *((_QWORD *)v8 + 7) = v33;
  v34 = *((int *)MutableBytePtr + 14);
  *((_QWORD *)v8 + 14) = v34;
  if ((int)v34 < 1)
    v35 = 0;
  else
    v35 = &v22[*((int *)MutableBytePtr + 13)];
  *((_QWORD *)v8 + 8) = v35;
  return v8;
}

CFIndex visitDynTrie(CFMutableDataRef *a1, uint64_t a2, _DWORD *a3, _BYTE *a4, _BYTE *a5)
{
  _DWORD *v7;
  CFMutableDataRef *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  CFTypeID v15;
  unint64_t v16;
  CFIndex Length;
  CFIndex v18;
  uint64_t v19;
  uint64_t v20;
  const void **v21;
  UInt8 *v22;
  int v23;
  float *v24;
  UInt8 *v25;
  const void **v26;
  const __CFString *v27;
  CFTypeID v28;
  const void *Value;
  const __CFString *v30;
  const __CFString *v31;
  CFTypeID v32;
  CFIndex v33;
  CFIndex v34;
  int v35;
  const __CFString *v36;
  unsigned int v37;
  BOOL v38;
  int v39;
  CFTypeID v40;
  const __CFNumber *v41;
  unsigned int *v42;
  int v43;
  int v44;
  int v45;
  const void **v46;
  CFIndex CellWithNumberOfSons;
  UInt8 *v48;
  uint64_t v49;
  UInt8 *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  CFIndex v55;
  uint64_t v56;
  int v57;
  __int16 v58;
  UInt8 *v59;
  UInt8 *v60;
  UInt8 *MutableBytePtr;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int16 *v65;
  __int16 v66;
  NSObject *v67;
  uint64_t v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  __int16 *v73;
  __int16 v74;
  UInt8 *v75;
  int v76;
  CFMutableDataRef *v78;
  CFMutableDataRef *v79;
  int v80;
  int v81;
  int v82;
  int v83;
  UInt8 *v84;
  const __CFData **v85;
  _BYTE *v86;
  _BYTE *v87;
  int CharacterAtIndex;
  _DWORD *v89;
  const void **v90;
  float *v91;
  uint64_t v92;
  UInt8 *v93;
  UInt8 *v94;
  float *v95;
  _DWORD valuePtr[2];
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  int v101;
  uint64_t v102;

  v7 = a3;
  v8 = a1;
  v102 = *MEMORY[0x1E0C80C00];
  v9 = *a3;
  v82 = *a3;
  if (*a3 == 4098)
  {
    v10 = 0;
    v11 = a3;
    do
    {
      v12 = v11;
      v11 = (unsigned int *)*((_QWORD *)v11 + 1);
      ++v10;
    }
    while (*v11 == 4098);
    v13 = *v12;
  }
  else
  {
    if ((v9 & 1) != 0)
      v10 = (int)(((v9 >> 1) & 0x7FF) - 1);
    else
      v10 = 1;
    v13 = *a3;
    v12 = a3;
  }
  v14 = v13 >> 13;
  if ((v13 & 0x1000) != 0)
    goto LABEL_71;
  v92 = *(_QWORD *)(a2 + 16);
  v15 = *(int *)(v92 + 16 * (v13 >> 13));
  v16 = (unint64_t)CFDataGetLength(a1[16]) >> 1;
  CFDataIncreaseLength(v8[16], 2 * v15 + 2);
  v80 = v16;
  v84 = &CFDataGetMutableBytePtr(v8[16])[2 * v16];
  *(_WORD *)v84 = v15;
  Length = CFDataGetLength(v8[17]);
  CFDataIncreaseLength(v8[17], 4 * v15 + 4);
  v95 = (float *)&CFDataGetMutableBytePtr(v8[17])[Length & 0xFFFFFFFFFFFFFFFCLL];
  *v95 = (float)(int)v15;
  v18 = CFDataGetLength(v8[18]);
  CFDataIncreaseLength(v8[18], 4 * v15 + 4);
  v94 = &CFDataGetMutableBytePtr(v8[18])[v18 & 0xFFFFFFFFFFFFFFFCLL];
  *(_DWORD *)v94 = v15;
  v83 = v15;
  if ((int)v15 < 1)
    goto LABEL_70;
  v86 = a4;
  v87 = a5;
  v19 = 0;
  v20 = v92 + 16 * v14;
  v21 = (const void **)(v20 + 8);
  v89 = (_DWORD *)(v20 + 4);
  v90 = (const void **)(v20 + 8);
  v78 = v8;
  v85 = v8 + 19;
  v22 = v84;
  do
  {
    v23 = v19 + 1;
    if ((_DWORD)v15 == 1)
    {
      *(_WORD *)&v22[2 * v19 + 2] = *v89;
      v24 = &v95[v19 + 1];
      *v24 = 0.0;
      v25 = &v94[4 * v19 + 4];
      *(_DWORD *)v25 = 0;
      v26 = v21;
    }
    else
    {
      *(_WORD *)&v22[2 * v19 + 2] = *((_WORD *)*v21 + 8 * v19 + 4);
      v24 = &v95[v19 + 1];
      *v24 = 0.0;
      v25 = &v94[4 * v19 + 4];
      *(_DWORD *)v25 = 0;
      v26 = (const void **)((char *)*v21 + 16 * v19);
    }
    v27 = (const __CFString *)*v26;
    if (!*v26)
      goto LABEL_68;
    v91 = v24;
    v28 = CFGetTypeID(v27);
    v93 = v25;
    if (v28 != CFDictionaryGetTypeID())
    {
      if (v28 == CFNumberGetTypeID())
      {
        valuePtr[0] = 0;
        CFNumberGetValue((CFNumberRef)v27, kCFNumberFloat32Type, valuePtr);
        v36 = 0;
        v37 = valuePtr[0] & 0xFFFFFFF0;
        goto LABEL_51;
      }
      v36 = v27;
      v38 = v28 == CFStringGetTypeID();
      v21 = v90;
      if (!v38)
        goto LABEL_65;
LABEL_64:
      *(_DWORD *)v93 = DDStaticLookupTableAppendString(v85, v36, 0);
      *v87 = 1;
      goto LABEL_65;
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("s"));
    if (!Value)
      Value = CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("score"));
    v30 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("f"));
    if (v30)
    {
      v31 = v30;
      v32 = CFGetTypeID(v30);
      if (v32 == CFStringGetTypeID() && (v33 = CFStringGetLength(v31), (unint64_t)(v33 - 1) <= 1))
      {
        v34 = v33;
        LODWORD(v30) = CFStringGetCharacterAtIndex(v31, 0);
        if (v34 == 2)
        {
          v35 = (int)v30;
          CharacterAtIndex = CFStringGetCharacterAtIndex(v31, 1);
          LODWORD(v30) = v35;
          goto LABEL_30;
        }
      }
      else
      {
        LODWORD(v30) = 0;
      }
    }
    CharacterAtIndex = 0;
LABEL_30:
    v39 = (int)v30;
    if (Value)
    {
      v40 = CFGetTypeID(Value);
      if (v40 == CFNumberGetTypeID())
        v41 = (const __CFNumber *)Value;
      else
        v41 = 0;
    }
    else
    {
      v41 = 0;
    }
    v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("u"));
    if (v36 || (v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("uuid"))) != 0)
    {
      v15 = CFGetTypeID(v36);
      v38 = v15 == CFStringGetTypeID();
      LODWORD(v15) = v83;
      if (!v38)
        v36 = 0;
    }
    if (!v41)
    {
      v22 = v84;
      v21 = v90;
      if (!v36)
        goto LABEL_65;
      goto LABEL_64;
    }
    valuePtr[0] = 0;
    CFNumberGetValue(v41, kCFNumberFloat32Type, valuePtr);
    v37 = valuePtr[0] & 0xFFFFFFF0;
    if (v39 <= 79)
    {
      if (v39)
      {
        v21 = v90;
        v42 = (unsigned int *)v91;
        if (v39 != 76)
          goto LABEL_49;
        v43 = 8;
        goto LABEL_53;
      }
      v22 = v84;
LABEL_51:
      v21 = v90;
      v42 = (unsigned int *)v91;
      goto LABEL_63;
    }
    if (v39 == 90)
    {
      v43 = 4;
      v21 = v90;
      v42 = (unsigned int *)v91;
      goto LABEL_53;
    }
    v21 = v90;
    v42 = (unsigned int *)v91;
    if (v39 != 80)
    {
LABEL_49:
      v43 = 0;
      goto LABEL_53;
    }
    v43 = 12;
LABEL_53:
    v44 = CharacterAtIndex;
    if (!CharacterAtIndex)
      v44 = v39;
    if (v44 == 76)
    {
      v45 = 2;
      v22 = v84;
    }
    else
    {
      v22 = v84;
      if (v44 == 90)
      {
        v45 = 1;
      }
      else if (v44 == 80)
      {
        v45 = 3;
      }
      else
      {
        v45 = 0;
      }
    }
    v37 |= v43 | v45;
LABEL_63:
    *v42 = v37;
    *v86 = 1;
    if (v36)
      goto LABEL_64;
LABEL_65:
    CFRelease(v27);
    v46 = v21;
    if ((_DWORD)v15 != 1)
      v46 = (const void **)((char *)*v21 + 16 * v19);
    *v46 = 0;
LABEL_68:
    ++v19;
  }
  while (v23 < (int)v15);
  v8 = v78;
  a4 = v86;
  a5 = v87;
LABEL_70:
  LODWORD(v14) = v80;
LABEL_71:
  if ((v82 & 1) != 0)
  {
    CellWithNumberOfSons = allocateCellWithNumberOfSons((uint64_t)v8, 1, v10, 1, 0);
    if (v10 >= 2)
    {
      v79 = v8;
      v81 = v14;
      MutableBytePtr = CFDataGetMutableBytePtr(v8[15]);
      v62 = 0;
      v14 = (uint64_t)&MutableBytePtr[CellWithNumberOfSons + 60];
      v63 = 0x100000000;
      do
      {
        v64 = v62;
        v65 = (__int16 *)(v7 + 1);
        if ((*v7 & 1) != 0)
        {
          if ((int)v64 < 1 || (*v7 & 0xFFEu) <= 0xD)
            v65 = (__int16 *)((char *)v7 + (v63 >> 31) + 4);
          else
            v65 = (__int16 *)(*((_QWORD *)v7 + 1) + 2 * (v64 - 1));
        }
        v66 = *v65;
        if (!*v65)
        {
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v67 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            v69 = *v7 & 1;
            v70 = (*v7 >> 1) & 0x7FF;
            valuePtr[0] = 67109632;
            valuePtr[1] = v69;
            v98 = 2048;
            v99 = v64 + 1;
            v100 = 1024;
            v101 = v70;
            _os_log_error_impl(&dword_19BC07000, v67, OS_LOG_TYPE_ERROR, "trying to insert NULL in a substring leaf (%d) i+1=%ld, count=%d", (uint8_t *)valuePtr, 0x18u);
          }
        }
        if ((*(_DWORD *)v14 & 0x800) != 0)
          v68 = v64 + 2;
        else
          v68 = v64;
        *(_WORD *)(v14 + 2 * v68 + 4) = v66;
        v62 = v64 + 1;
        v63 += 0x100000000;
      }
      while (v10 != v64 + 1);
      if ((*(_DWORD *)v14 & 0x800) != 0)
        v71 = v64 + 3;
      else
        v71 = v10;
      *(_WORD *)(v14 + 2 * v71 + 4) = 0;
      v8 = v79;
      LODWORD(v14) = v81;
    }
    v72 = allocateCellWithNumberOfSons((uint64_t)v8, 0, 1, (*v7 >> 12) & 1, v14);
    if ((*v7 & 1) != 0)
    {
      if ((int)v10 < 2 || (*v7 & 0xFFEu) <= 0xD)
        v73 = (__int16 *)v7 + (int)v10 + 2;
      else
        v73 = (__int16 *)(*((_QWORD *)v7 + 1) + 2 * (v10 - 2));
    }
    else
    {
      v73 = (__int16 *)(v7 + 1);
    }
    v74 = *v73;
    v75 = CFDataGetMutableBytePtr(v8[15]);
    v76 = *(_DWORD *)&v75[CellWithNumberOfSons + 60];
    if ((v76 & 0x800) != 0)
    {
      *(_DWORD *)&v75[CellWithNumberOfSons + 64] = v72;
    }
    else
    {
      *(_WORD *)&v75[CellWithNumberOfSons + 64] = v74;
      *(_DWORD *)&v75[CellWithNumberOfSons + 64 + ((2 * (v76 & 0x7FF) + 2) & 0x1FFC)] = v72;
    }
  }
  else
  {
    CellWithNumberOfSons = allocateCellWithNumberOfSons((uint64_t)v8, ((unint64_t)*v12 >> 1) & 0x7FF, v10, (*v12 >> 12) & 1, v14);
    if (v10 >= 2)
    {
      v48 = CFDataGetMutableBytePtr(v8[15]);
      v49 = 0;
      v50 = &v48[CellWithNumberOfSons + 60];
      do
      {
        v51 = v49;
        v7 = (_DWORD *)*((_QWORD *)v7 + 1);
        if ((*(_DWORD *)v50 & 0x800) != 0)
          v52 = v49 + 2;
        else
          v52 = v49;
        *(_WORD *)&v50[2 * v52 + 4] = *((_WORD *)v7 + 2);
        ++v49;
      }
      while (v10 != v51 + 1);
      v53 = v51 + 3;
      if ((*(_DWORD *)v50 & 0x800) == 0)
        v53 = v10;
      *(_WORD *)&v50[2 * v53 + 4] = 0;
    }
    if ((*(_WORD *)v12 & 0xFFE) != 0)
    {
      v54 = 0;
      v55 = CellWithNumberOfSons + 64;
      v56 = 4;
      do
      {
        v57 = visitDynTrie(v8, a2, *((_QWORD *)v12 + 1) + v56 - 4, a4, a5);
        v58 = *(_WORD *)(*((_QWORD *)v12 + 1) + v56);
        v59 = CFDataGetMutableBytePtr(v8[15]);
        v60 = &v59[CellWithNumberOfSons + 60];
        if ((*(_DWORD *)v60 & 0x800) != 0)
        {
          *(_DWORD *)&v59[4 * v54 + v55] = v57;
        }
        else
        {
          *(_DWORD *)&v60[4 * v54 + 4 + 4 * (((*(_DWORD *)v60 & 0x7FFuLL) + 1) >> 1)] = v57;
          if ((*(_DWORD *)v60 & 0x800) == 0)
            *(_WORD *)&v59[2 * v54 + v55] = v58;
        }
        ++v54;
        v56 += 16;
      }
      while (v54 < (((unint64_t)*v12 >> 1) & 0x7FF));
    }
  }
  return CellWithNumberOfSons;
}

void appendArraySectionInData(const __CFData *a1, const __CFData *a2, int a3, _DWORD *a4, int *a5)
{
  int v10;
  int Length;
  int v12;
  const UInt8 *BytePtr;

  v10 = CFDataGetLength(a1) - 60;
  if (a2 && (Length = CFDataGetLength(a2), Length >= 1))
  {
    if (v10 % a3 >= 1)
    {
      v12 = a3 - v10 % a3;
      CFDataIncreaseLength(a1, v12);
      v10 += v12;
    }
    BytePtr = CFDataGetBytePtr(a2);
    CFDataAppendBytes(a1, BytePtr, Length);
  }
  else
  {
    Length = 0;
  }
  *a4 = v10;
  *a5 = Length;
}

CFIndex allocateCellWithNumberOfSons(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  CFIndex Length;
  uint64_t v9;
  CFIndex v10;
  UInt8 bytes[4];

  *(_DWORD *)bytes = a2 & 0x7FF | ((a3 > 1) << 11) | ((a4 != 0) << 12) | (a5 << 13);
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 120));
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 120), bytes, 4);
  v9 = (a3 + 1) & 1;
  if (a3 < -1)
    v9 = -v9;
  if ((bytes[1] & 8) != 0)
    v10 = 2 * (v9 + a3 + 1) + 4;
  else
    v10 = 2 * ((a2 & 1) + a2) + 4 * a2;
  if (v10)
    CFDataIncreaseLength(*(CFMutableDataRef *)(a1 + 120), v10);
  return Length - 60;
}

int **assignFromHeaderV4(int **result, int *a2)
{
  int *v2;
  uint64_t v3;
  unint64_t v4;
  int *v5;
  unint64_t v6;
  int *v7;
  unint64_t v8;
  int *v9;

  v2 = a2 + 9;
  v3 = (uint64_t)a2 + a2[1] + 36;
  *result = a2;
  result[1] = (int *)v3;
  result[2] = (int *)v3;
  v4 = a2[4];
  result[9] = (int *)(v4 >> 1);
  if (v4 >= 2)
    v5 = (int *)((char *)v2 + a2[3]);
  else
    v5 = 0;
  result[3] = v5;
  v6 = a2[6];
  result[10] = (int *)(v6 >> 2);
  if (v6 >= 4)
    v7 = (int *)((char *)v2 + a2[5]);
  else
    v7 = 0;
  result[4] = v7;
  v8 = a2[8];
  result[12] = (int *)(v8 >> 3);
  if (v8 >= 8)
    v9 = (int *)((char *)v2 + a2[7]);
  else
    v9 = 0;
  result[11] = 0;
  result[5] = 0;
  result[6] = v9;
  result[7] = 0;
  result[8] = 0;
  result[13] = 0;
  result[14] = 0;
  return result;
}

void DDStaticLookupDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  v2 = (const void *)a1[15];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[16];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[17];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[18];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[19];
  if (v6)
    CFRelease(v6);
  free(a1);
}

uint64_t DDScannerCreateWithType(int a1, uint64_t a2, CFErrorRef *a3)
{
  return DDScannerCreateWithTypeAndLocale(a1, 0, a3);
}

uint64_t DDScannerCreateWithCacheFile(const __CFURL *a1, CFErrorRef *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const void *v9;
  uint64_t v10;
  stat v12;
  UInt8 buffer[1024];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    if (a2)
    {
      v10 = 0;
      *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFD0], 2, 0);
      return v10;
    }
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  v3 = stat((const char *)buffer, &v12);
  if ((v3 & 0x80000000) != 0)
  {
    DDLogErrD(v3, v4, v5, v6, v7, CFSTR("could not stat file: %s"), buffer);
    return 0;
  }
  v8 = DDCacheCreateFromFileAtPathWithExtraChecks((const char *)buffer, 0, (void *)v12.st_size, 1);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = DDScannerCreateFromCacheSupportingMLScan(v8, 0);
  CFRelease(v9);
  return v10;
}

uint64_t DDScannerCreateWithLocaleHint(int a1, unint64_t a2, const __CFLocale *a3, CFErrorRef *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = DDScannerCreateWithTypeAndLocale(a1, a3, a4);
  v7 = v6;
  if (v6)
  {
    DDScannerSetOptions(v6, a2);
    if (a3)
      *(_QWORD *)(v7 + 240) = CFRetain(a3);
  }
  return v7;
}

uint64_t DDScannerLoaderGetIdentifierStringForScannerType(int a1)
{
  if (__DDScannerLoaderInitScannerIdentifierMappings_sOnce != -1)
    dispatch_once(&__DDScannerLoaderInitScannerIdentifierMappings_sOnce, &__block_literal_global_488);
  return *(_QWORD *)(scannerTypesToScannerIdentifiers + 8 * a1);
}

uint64_t DDScannerLoaderScannerGetTypeWithIdentifierString(void *key)
{
  void *value;

  if (__DDScannerLoaderInitScannerIdentifierMappings_sOnce != -1)
    dispatch_once(&__DDScannerLoaderInitScannerIdentifierMappings_sOnce, &__block_literal_global_488);
  value = (void *)-1;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)scannerIdentifiersToScannerTypes, key, (const void **)&value))
    return (uint64_t)value;
  else
    return -1;
}

void _DDCacheCFFinalize(uint64_t a1)
{
  const void *v2;
  int *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  v2 = *(const void **)(a1 + 72);
  if (v2)
  {
    CFRelease(v2);
  }
  else if (munmap(*(void **)(a1 + 64), *(int *)(*(_QWORD *)(a1 + 64) + 8)) < 0)
  {
    v3 = __error();
    v4 = strerror(*v3);
    DDLogErrD((uint64_t)v4, v5, v6, v7, v8, CFSTR("could not munmap file: %s"), v4);
  }
  v9 = *(const void **)(a1 + 80);
  if (v9)
    CFRelease(v9);
}

BOOL _DDCacheCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _DDCacheCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(0, a2, CFSTR("<DDCache:%p>"), a1);
}

CFStringRef _DDCacheCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDCache:%p>"), a1);
}

void DDCachingStringTokenizerDestroy(_QWORD *a1)
{
  const void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;

  v2 = (const void *)a1[4];
  if (v2)
    CFRelease(v2);
  v3 = (void *)a1[6];
  if (!*((_BYTE *)a1 + 121))
  {
    if (!v3)
      goto LABEL_14;
    v4 = a1[9];
    if (v4 >= 1)
    {
      v5 = 0;
      v6 = 16;
      do
      {
        v7 = *(void **)(a1[6] + v6);
        if (v7)
        {
          free(v7);
          v4 = a1[9];
        }
        ++v5;
        v6 += 32;
      }
      while (v4 > v5);
      v3 = (void *)a1[6];
    }
    goto LABEL_13;
  }
  if (v3)
LABEL_13:
    free(v3);
LABEL_14:
  v8 = (const void *)a1[5];
  if (v8)
    CFRelease(v8);
  free(a1);
}

uint64_t matchingTokenRealIndexForQueryOffset(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v35;

  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    v6 = *(_QWORD *)(a1 + 96);
    v7 = (*(_QWORD *)(a1 + 88) + v3 - v6) % v3;
    if (v7)
    {
      if (v7 <= 32)
        v9 = (unint64_t)v7 >> (v7 >= 0);
      else
        v9 = v7 - 16;
      if ((v7 & 0x8000000000000000) == 0)
      {
        v10 = 0;
        v11 = (uint64_t)(int)a2 >> 16;
        v12 = HIDWORD(a2);
        while (1)
        {
          v13 = v9 < 0 ? -1 : (*(_QWORD *)(a1 + 96) + v9) % *(_QWORD *)(a1 + 72);
          v14 = (int *)_tokenEntryAtRealIndex(a1, v13);
          if ((int)v11 >= *v14 >> 16)
          {
            v15 = *((_QWORD *)v14 + 1);
            v16 = HIDWORD(*(_QWORD *)v14);
            v17 = (_DWORD)v11 == *v14 >> 16 && (int)v12 < (int)v16;
            v18 = (uint64_t)(int)v15 >> 16;
            if (!v17 && (int)v11 <= (int)v18)
            {
              v20 = HIDWORD(v15);
              if ((_DWORD)v11 != (_DWORD)v18 || (int)v12 < (int)v20)
                goto LABEL_53;
            }
            if ((int)v11 > *v14 >> 16)
              goto LABEL_28;
            if ((int)v12 >= (int)v16)
              break;
          }
          v7 = v9 - 1;
LABEL_29:
          v22 = v7 - v10;
          if (v7 < v10)
            ++v22;
          v9 = v10 + (v22 >> 1);
          if (v7 < v10)
            goto LABEL_32;
        }
        if ((int)v12 <= (int)v16)
          goto LABEL_53;
LABEL_28:
        v10 = v9 + 1;
        goto LABEL_29;
      }
LABEL_32:
      if (a3)
      {
        v23 = *(_QWORD *)(a1 + 72);
        v24 = v23 ? (*(_QWORD *)(a1 + 88) + v23 - *(_QWORD *)(a1 + 96)) % v23 : -1;
        if (v9 < v24)
        {
          v31 = v9 < 0 ? -1 : (*(_QWORD *)(a1 + 96) + v9) % v23;
          v32 = (int *)_tokenEntryAtRealIndex(a1, v31);
          if (v32)
          {
            v33 = (uint64_t)(int)a2 >> 16;
            if ((int)v33 < *v32 >> 16 || (int)v33 <= *v32 >> 16 && SHIDWORD(a2) < (int)HIDWORD(*(_QWORD *)v32))
            {
LABEL_53:
              if ((v9 & 0x8000000000000000) == 0)
              {
                v6 = *(_QWORD *)(a1 + 96);
                v3 = *(_QWORD *)(a1 + 72);
                return (v6 + v9) % v3;
              }
            }
          }
        }
      }
    }
    else
    {
      v25 = *(uint64_t **)(a1 + 48);
      v26 = *v25;
      if (*(_BYTE *)(a1 + 121))
      {
        v35 = (*((_DWORD *)v25 + 2) + v26);
        v26 <<= 32;
        v27 = v35 << 32;
      }
      else
      {
        v27 = v25[1];
      }
      v28 = (uint64_t)(int)a2 >> 16;
      v29 = (uint64_t)(int)v26 >> 16;
      if ((int)v28 >= (int)v29 && ((_DWORD)v28 != (_DWORD)v29 || SHIDWORD(a2) >= SHIDWORD(v26)))
      {
        v30 = (uint64_t)(int)v27 >> 16;
        if ((int)v28 <= (int)v30 && ((_DWORD)v28 != (_DWORD)v30 || SHIDWORD(a2) < SHIDWORD(v27)))
        {
          v9 = 0;
          return (v6 + v9) % v3;
        }
      }
    }
  }
  return -1;
}

uint64_t DDCachingStringTokenizerEnumerateTokens(uint64_t result, CFTypeRef cf, uint64_t a3, unint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t Offset;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;

  if (result)
  {
    v8 = (_QWORD *)result;
    if (!*(_QWORD *)(result + 32))
      *(_QWORD *)(result + 32) = CFRetain(cf);
    Offset = matchingTokenRealIndexForQueryOffset((uint64_t)v8, a4, 0);
    result = _realToAbsoluteIndex(v8, Offset);
    if ((result & 0x8000000000000000) == 0)
    {
      v10 = result;
      v46 = 0;
      if ((_DWORD)a3
        && (v8[13] <= result || (v11 = v8[9]) == 0 ? (v12 = -1) : (v12 = result % v11),
            (result = _tokenEntryAtRealIndex((uint64_t)v8, v12)) != 0
         && (v13 = result, v14 = *(unsigned __int8 *)(result + 24), *(_BYTE *)(result + 24))))
      {
        v15 = 0;
        v16 = (uint64_t)(int)a4 >> 16;
        v17 = HIDWORD(a4);
        v18 = 32 * v14;
        do
        {
          v19 = *(_QWORD *)(v13 + 16) + v18;
          v20 = *(_QWORD *)(v19 - 32);
          v21 = *(_QWORD *)(v19 - 24);
          v22 = (uint64_t)(int)v21 >> 16;
          if ((int)v22 >= (int)v16 && ((int)v22 > (int)v16 || SHIDWORD(v21) > (int)v17))
            goto LABEL_20;
          ++v15;
          result = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 16))(a5, v20);
LABEL_20:
          if (v14 < 2)
            break;
          v18 -= 32;
          --v14;
        }
        while (v15 < 15);
      }
      else
      {
        v15 = 0;
      }
      if (v15 <= 14)
      {
        do
        {
          if ((_DWORD)a3)
          {
            v24 = v10 - 1;
            if (v10 >= 1 && v8[13] >= v10 && (v25 = v8[9]) != 0)
              v26 = v24 % v25;
            else
              v26 = -1;
            result = _tokenEntryAtRealIndex((uint64_t)v8, v26);
            v27 = result;
            if (!result)
              return result;
          }
          else
          {
            v24 = v10 + 1;
            if (v10 >= -1 && v8[13] > v24 && (v34 = v8[9]) != 0)
              v35 = v24 % v34;
            else
              v35 = -1;
            v36 = _tokenEntryAtRealIndex((uint64_t)v8, v35);
            if (v36)
            {
              v27 = v36;
              v28 = (unsigned __int8 *)(v36 + 24);
              if (*(_BYTE *)(v36 + 24))
                goto LABEL_51;
              goto LABEL_49;
            }
            result = _fetchNextToken((uint64_t)v8);
            if (result < 0)
              return result;
            v43 = v8[12] + result;
            v44 = v8[9];
            v45 = v43 % v44;
            if (v43 % v44 < 0)
              return result;
            v27 = _tokenEntryAtRealIndex((uint64_t)v8, v43 % v44);
            result = _realToAbsoluteIndex(v8, v45);
            v24 = result;
            if (!v27)
              return result;
          }
          v28 = (unsigned __int8 *)(v27 + 24);
          v29 = *(unsigned __int8 *)(v27 + 24);
          if (*(_BYTE *)(v27 + 24))
          {
            if ((_DWORD)a3)
            {
              if (v46)
                return result;
              v30 = 32 * v29;
              do
              {
                v31 = v15 + 1;
                result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, unsigned __int8 *))(a5 + 16))(a5, *(_QWORD *)(*(_QWORD *)(v27 + 16) + v30 - 32), *(_QWORD *)(*(_QWORD *)(v27 + 16) + v30 - 24), 1, &v46);
                v32 = v46;
                if (v29 < 2)
                  break;
                --v29;
                v30 -= 32;
              }
              while (!v46 && v15++ < 14);
              goto LABEL_60;
            }
            if (v46)
              return result;
LABEL_51:
            v37 = 0;
            v38 = 1;
            do
            {
              result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, unsigned __int8 *))(a5 + 16))(a5, *(_QWORD *)(*(_QWORD *)(v27 + 16) + v37), *(_QWORD *)(*(_QWORD *)(v27 + 16) + v37 + 8), 0, &v46);
              v32 = v46;
              v39 = v38 + 1;
              v37 += 32;
              v41 = v38 < *v28 && v46 == 0 && (uint64_t)(v15 + v38 - 1) < 14;
              ++v38;
            }
            while (v41);
            v31 = v15 + v39 - 1;
            goto LABEL_60;
          }
LABEL_49:
          v31 = v15 + 1;
          result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, unsigned __int8 *))(a5 + 16))(a5, *(_QWORD *)v27, *(_QWORD *)(v27 + 8), a3, &v46);
          v32 = v46;
LABEL_60:
          if (v32)
            v42 = 0;
          else
            v42 = v31 < 15;
          v10 = v24;
          v15 = v31;
        }
        while (v42);
      }
    }
  }
  return result;
}

uint64_t _realToAbsoluteIndex(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 < 0 || a1[9] <= a2)
    return -1;
  v2 = a1[13];
  v3 = a1[8];
  if (v2 > v3)
  {
    v4 = a1[11];
    v5 = v2 + a2;
    v6 = v5 + ~v3 - v4;
    v7 = v5 + ~v4;
    if (v4 >= a2)
      return v7;
    else
      return v6;
  }
  return a2;
}

uint64_t DDLogHandle()
{
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  return DDLogHandle_error_log_handle;
}

void DDError(CFStringRef format, ...)
{
  CFStringRef v1;
  NSObject *v2;
  uint8_t buf[4];
  CFStringRef v4;
  uint64_t v5;
  va_list va;

  va_start(va, format);
  v5 = *MEMORY[0x1E0C80C00];
  v1 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v4 = v1;
    _os_log_error_impl(&dword_19BC07000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  CFRelease(v1);
}

void DDLogErrD(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, CFStringRef format, ...)
{
  CFStringRef v6;
  NSObject *v7;
  uint8_t buf[4];
  CFStringRef v9;
  uint64_t v10;
  va_list va;

  va_start(va, format);
  v10 = *MEMORY[0x1E0C80C00];
  v6 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v7 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_19BC07000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  CFRelease(v6);
}

void DDLogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, int a4, CFStringRef format, ...)
{
  CFStringRef v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  CFStringRef v17;
  uint64_t v18;
  va_list va;

  va_start(va, format);
  v18 = *MEMORY[0x1E0C80C00];
  v8 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v9 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v11 = a2;
    v12 = 1024;
    v13 = a4;
    v14 = 2080;
    v15 = a1;
    v16 = 2112;
    v17 = v8;
    _os_log_error_impl(&dword_19BC07000, v9, OS_LOG_TYPE_ERROR, "assertion on %s:%d \"%s\" failed :%@", buf, 0x26u);
  }
  CFRelease(v8);
}

void DDTokenCacheDestroy(_QWORD **a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _QWORD *v5;

  if (a1)
  {
    v2 = (uint64_t)a1[6];
    if (v2 >= 1)
    {
      for (i = 0; i < v2; ++i)
      {
        v4 = a1[4][i];
        if (v4)
        {
          if (*(_WORD *)(v4 + 6) != 1)
            free(*(void **)(v4 + 8));
          free((void *)v4);
          v2 = (uint64_t)a1[6];
        }
      }
    }
    free(a1[4]);
    a1[4] = 0;
    if (*a1)
      DDCachingStringTokenizerDestroy(*a1);
    v5 = a1[1];
    if (v5)
      CFRelease(v5);
    free(a1);
  }
}

uint64_t DDScanQueryCreate(uint64_t a1)
{
  CFTypeID v2;

  v2 = DDTypeRegister(&DDScanQueryGetTypeID_typeID);
  return DDTypeCreateInstance_(a1, v2, 0x28uLL);
}

BOOL _DDScanQueryCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

__CFString *_DDScanQueryCFCopyFormatDescription(uint64_t a1, const __CFDictionary *a2)
{
  __CFString *Mutable;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  const __CFString *CopyRange;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, a2, CFSTR("<DDScanQuery:%p\n"), a1);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v5 < 1;
  v7 = v5 - 1;
  if (!v6)
  {
    CopyRange = DDScanQueryCopyRange(a1, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) << 32, ((_DWORD)v7 << 16) | ((unint64_t)(*(_DWORD *)(*(_QWORD *)(a1 + 16)+ 48 * v7+ 24)+ *(_DWORD *)(*(_QWORD *)(a1 + 16)+ 48 * v7+ 16)) << 32));
    CFStringAppend(Mutable, CopyRange);
    CFRelease(CopyRange);
  }
  CFStringAppendFormat(Mutable, a2, CFSTR("\n>"));
  return Mutable;
}

__CFString *_DDScanQueryCFCopyDebugDescription(uint64_t a1)
{
  return _DDScanQueryCFCopyFormatDescription(a1, 0);
}

uint64_t DDScanQuerySetMetadataReleaseCallback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t DDScanQueryAddLineBreak(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(result + 16) + 48 * v1;
    v3 = *(_DWORD *)(v2 - 8);
    v4 = v3 & 0xE3FFFFFF;
    if (((v3 >> 26) & 7) >= 3)
      v5 = 0x10000000;
    else
      v5 = 201326592;
    *(_DWORD *)(v2 - 8) = v4 | v5 | 0x80000000;
  }
  return result;
}

unint64_t DDScanQueryGetOffsetOfAbsolutePosition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  if (a2 < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v4 = (uint64_t *)(a1 + 32);
    while (1)
    {
      v5 = *v4;
      v4 += 6;
      if (v5 > a3)
        break;
      if (a2 == ++v3)
      {
        v3 = a2;
        return (((_DWORD)v3 - 1) << 16) | ((unint64_t)(a3
                                                                                        - *(_DWORD *)(a1 + 48 * (v3 - 1) + 32)
                                                                                        + *(_DWORD *)(a1 + 48 * (v3 - 1) + 16)) << 32);
      }
    }
  }
  return (((_DWORD)v3 - 1) << 16) | ((unint64_t)(a3
                                                                                  - *(_DWORD *)(a1 + 48 * (v3 - 1) + 32)
                                                                                  + *(_DWORD *)(a1 + 48 * (v3 - 1) + 16)) << 32);
}

CFStringRef DDScanQueryCopyFullStringExcludingContext(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  BOOL v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = __OFSUB__(v1, 1);
  v2 = v1 - 1 < 0;
  v4 = v1 - 1;
  if (v2 != v3)
    return &stru_1E3C973D8;
  else
    return DDScanQueryCopyRange(a1, (unint64_t)((int)(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 40) << 6) >> 6) << 32, ((_DWORD)v4 << 16) | (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 48 * v4 + 24) << 32));
}

uint64_t DDScanQueryGetNumberOfFragments(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

CFStringRef DDScanQueryCopySubStringFromPos(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t OffsetOfAbsolutePosition;

  v4 = (uint64_t)(int)a2 >> 16;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 + 48 * (int)v4 + 32) + (a2 >> 32) - *(_QWORD *)(v5 + 48 * (int)v4 + 16) + 20;
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 >= *(_QWORD *)(v5 + 48 * v7 - 24) + *(_QWORD *)(v5 + 48 * v7 - 16))
    v8 = *(_QWORD *)(v5 + 48 * v7 - 24) + *(_QWORD *)(v5 + 48 * v7 - 16);
  else
    v8 = v6;
  OffsetOfAbsolutePosition = DDScanQueryGetOffsetOfAbsolutePosition(v5, v7, v8);
  return DDScanQueryCopyRange(a1, ((_DWORD)v4 << 16) | a2 & 0xFFFFFFFF00000000, OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000);
}

uint64_t DDScanQueryGetFragmentMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  if (a1 && (a2 & 0x8000000000000000) == 0)
  {
    if (*(_QWORD *)(a1 + 32) > a2 && (v4 = *(_QWORD *)(a1 + 16)) != 0)
      return *(_QWORD *)(v4 + 48 * a2 + 8);
    else
      return 0;
  }
  return result;
}

uint64_t DDScanQueryGetFragmentRange(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = -1;
  if (a1 && (a2 & 0x8000000000000000) == 0 && *(_QWORD *)(a1 + 32) > a2)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4)
      return *(_QWORD *)(v4 + 48 * a2 + 16);
  }
  return result;
}

uint64_t _DDScanQueryCountNewlinesInFragment(uint64_t a1, CFIndex a2, CFIndex a3, uint64_t a4)
{
  const __CFCharacterSet *Predefined;
  CFIndex Length;
  uint64_t v10;
  CFIndex v11;
  CFIndex v12;
  BOOL v13;
  CFRange v16;
  CFRange v17;

  if (!a1 || !*(_QWORD *)a1 || (*(_BYTE *)(a1 + 43) & 0x40) != 0)
    return 0;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  Length = CFStringGetLength(*(CFStringRef *)a1);
  v10 = 0;
  if (a4 >= 1 && a3 >= 1 && a2 >= 1)
  {
    v11 = Length;
    if (a3 + a2 <= Length)
    {
      v10 = 0;
      do
      {
        v16.location = 0;
        v16.length = 0;
        v17.location = a2;
        v17.length = a3;
        if (!CFStringFindCharacterFromSet(*(CFStringRef *)a1, Predefined, v17, 0, &v16))
          break;
        if (++v10 >= a4)
          break;
        v12 = a3 + a2;
        a2 = v16.length + v16.location;
        a3 = v12 - (v16.length + v16.location);
        v13 = a3 < 1 || a2 < 1;
      }
      while (!v13 && v12 <= v11);
    }
  }
  return v10;
}

void DDLexemCacheDestroy(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void **v4;
  uint64_t v5;
  uint64_t j;
  void **v7;
  void **v8;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 24);
    if (v2 >= 1)
    {
      for (i = 0; i < v2; ++i)
      {
        v4 = *(void ***)(*(_QWORD *)(a1 + 8) + 8 * i);
        if (v4)
        {
          DDLexemCacheItemDestroy(v4);
          v2 = *(_QWORD *)(a1 + 24);
        }
      }
    }
    free(*(void **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    v5 = *(_QWORD *)(a1 + 56);
    if (v5 >= 1)
    {
      for (j = 0; j < v5; ++j)
      {
        v7 = *(void ***)(*(_QWORD *)(a1 + 40) + 8 * j);
        if (v7)
        {
          DDLexemCacheItemDestroy(v7);
          v5 = *(_QWORD *)(a1 + 56);
        }
      }
    }
    free(*(void **)(a1 + 40));
    *(_QWORD *)(a1 + 40) = 0;
    v8 = *(void ***)(a1 + 64);
    if (v8)
      DDLexemCacheItemDestroy(v8);
    free((void *)a1);
  }
}

void DDLexemCacheItemDestroy(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    free(v2);
  free(a1);
}

void **DDLexemCacheItemCreate(uint64_t a1, void *a2)
{
  void **v4;

  v4 = (void **)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  DDLexemCacheItemReset((uint64_t)v4);
  DDLexemCacheItemSet(v4, a1, a2);
  return v4;
}

_QWORD *DDLexemCacheItemResetForCapacity(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = result[1];
  result[1] = v2 | 0xFFFFFFFFLL;
  if (v2 >= 0x100000000)
  {
    v4 = result;
    v5 = v2 >> 32;
    if (v5 < a2)
    {
      result = malloc_type_realloc((void *)*result, 32 * a2, 0x1010040F32E1FD2uLL);
      *v4 = result;
      v6 = a2 << 32;
LABEL_7:
      v4[1] = *((unsigned int *)v4 + 2) | (unint64_t)v6;
      return result;
    }
    if (a2 <= 23 && v5 > a2)
    {
      result = malloc_type_realloc((void *)*result, 0x300uLL, 0x1010040F32E1FD2uLL);
      *v4 = result;
      v6 = 0x1800000000;
      goto LABEL_7;
    }
  }
  return result;
}

void DDDataDetectorSetUsesDebugSource(int a1)
{
  uint64_t v2;
  char *v3;

  if (_workDir_sOnce != -1)
    dispatch_once(&_workDir_sOnce, &__block_literal_global_1135);
  v2 = _workDir_dir_name;
  if (a1)
    v3 = (char *)_workDir_dir_name;
  else
    v3 = 0;
  DDSourceSetStoragePath(v3);
  if (v2)
  {
    DDSourcePushSharedDataOrFile(1, 0, 0, 1, 0);
    DDSourcePushSharedDataOrFile(2, 0, 0, 1, 0);
    DDSourcePushSharedDataOrFile(3, 0, 0, 1, 0);
  }
}

void ___workDir_block_invoke()
{
  const char *v0;
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = -[NSString cStringUsingEncoding:](NSTemporaryDirectory(), "cStringUsingEncoding:", 4);
  _workDir_dir_name = (uint64_t)strdup(v0);
  if (_workDir_dir_name)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v1 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_DEFAULT))
    {
      v2 = 136315138;
      v3 = _workDir_dir_name;
      _os_log_impl(&dword_19BC07000, v1, OS_LOG_TYPE_DEFAULT, "Using temp work directory %s", (uint8_t *)&v2, 0xCu);
    }
  }
}

BOOL DDIsValidEAN13OrUPCA(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((unint64_t)(a2 - 14) < 0xFFFFFFFFFFFFFFFELL)
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = a2 - 1;
  do
  {
    v6 = *(char *)(a1 + v4);
    if (((v4 ^ a2) & 1) == 0)
      v6 *= 3;
    v3 += v6;
    ++v4;
  }
  while (v5 != v4);
  return 10 * ((v3 + 9) / 10) - v3 == *(char *)(a1 + v5);
}

void DDResultExpandRange(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFArray *v12;
  CFIndex Count;
  uint64_t v14;
  CFIndex v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *ValueAtIndex;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  CFIndex v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;

  if (a4 | a3)
  {
    v4 = a4;
    v5 = a3;
    do
    {
      v9 = a1[4];
      v8 = a1[5];
      v10 = v9 - v5;
      v11 = v4 + v5 + v8;
      _setResultRangesAndMatchedString(a1, a2, v9 - v5, v11);
      v12 = (const __CFArray *)a1[7];
      if (!v12)
        return;
      v33 = v8;
      Count = CFArrayGetCount(v12);
      v14 = Count;
      if (v5 < 1)
      {
        if ((v5 & 0x8000000000000000) == 0)
        {
          v5 = 0;
LABEL_25:
          a1 = 0;
          goto LABEL_26;
        }
        if (Count < 1)
          goto LABEL_25;
        a1 = 0;
        v18 = Count + 1;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v12, v18 - 2);
          v20 = ValueAtIndex[4];
          if (v20 < v10)
          {
            if (a1 || v10 >= v20 + ValueAtIndex[5])
            {
              CFArrayRemoveValueAtIndex(v12, v18 - 2);
              --v14;
            }
            else
            {
              v5 = v20 - v10;
              a1 = ValueAtIndex;
            }
          }
          --v18;
        }
        while (v18 > 1);
      }
      else
      {
        if (Count < 1)
          goto LABEL_25;
        v15 = 0;
        while (1)
        {
          v16 = CFArrayGetValueAtIndex(v12, v15);
          v17 = v16[4];
          if (v16[5])
            break;
          _setResultRangesAndMatchedString(v16, a2, v17 - v5, 0);
          if (v14 == ++v15)
            goto LABEL_25;
        }
        if (v17 != v9)
          goto LABEL_25;
        if (v16[10])
          a1 = 0;
        else
          a1 = v16;
      }
LABEL_26:
      if (v4 < 1)
      {
        if ((v4 & 0x8000000000000000) == 0)
        {
          v4 = 0;
LABEL_48:
          v25 = 0;
          goto LABEL_49;
        }
        if (v14 < 1)
          goto LABEL_48;
        v26 = 0;
        v25 = 0;
        v27 = v10 + v11;
        do
        {
          v28 = CFArrayGetValueAtIndex(v12, v26);
          v29 = v28[4];
          v30 = v29 + v28[5];
          v31 = __OFSUB__(v27, v30);
          v32 = v27 - v30;
          if (v32 < 0 != v31)
          {
            if (v25 || v27 <= v29)
            {
              CFArrayRemoveValueAtIndex(v12, v26--);
              --v14;
            }
            else
            {
              v4 = v32;
              v25 = v28;
            }
          }
          ++v26;
        }
        while (v26 < v14);
      }
      else
      {
        if (v14 < 1)
          goto LABEL_48;
        v21 = v14 + 1;
        while (1)
        {
          v22 = CFArrayGetValueAtIndex(v12, v21 - 2);
          v23 = v22[4];
          v24 = v22[5];
          if (v24)
            break;
          _setResultRangesAndMatchedString(v22, a2, v23 + v4, 0);
          if ((unint64_t)--v21 <= 1)
            goto LABEL_48;
        }
        if (v23 + v24 != v9 + v33)
          goto LABEL_48;
        if (v22[10])
          v25 = 0;
        else
          v25 = v22;
      }
LABEL_49:
      if (a1 == v25)
      {
        if (!a1)
          return;
      }
      else
      {
        if (a1)
          DDResultExpandRange(a1, a2, v5, 0);
        if (!v25)
          return;
        v5 = 0;
        a1 = v25;
      }
    }
    while (v4 | v5);
  }
}

void _setResultRangesAndMatchedString(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t OffsetOfAbsolutePosition;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v14;
  CFStringRef CopyRange;

  a1[4] = a3;
  a1[5] = a4;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 32);
  OffsetOfAbsolutePosition = DDScanQueryGetOffsetOfAbsolutePosition(v8, v9, a3);
  v11 = DDScanQueryGetOffsetOfAbsolutePosition(v8, v9, a3 + a4);
  a1[2] = OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000;
  a1[3] = v11 & 0xFFFFFFFFFFFF0000;
  if (*(uint64_t *)(a2 + 32) < 1)
  {
    CopyRange = &stru_1E3C973D8;
LABEL_7:
    DDResultSetMatchedString((uint64_t)a1, CopyRange);
    CFRelease(CopyRange);
    return;
  }
  v12 = *(_DWORD *)(*(_QWORD *)(a2 + 16) + 40);
  v13 = v12 << 6;
  v14 = (unint64_t)(v12 & 0x3FFFFFF) << 32;
  if (v13 <= 0)
    v14 = 0;
  CopyRange = DDScanQueryCopyRange(a2, v14 + (OffsetOfAbsolutePosition & 0xFFFFFFFFFFFF0000), v14 + (v11 & 0xFFFFFFFFFFFF0000));
  if (CopyRange)
    goto LABEL_7;
}

const void *DDMLScannerScanStringAroundResults(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  const __CFArray *v6;
  id v7;
  Class *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  void *v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  void *v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t j;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSUInteger v47;
  NSUInteger v48;
  NSUInteger v49;
  uint64_t v50;
  void *v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  void *v55;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  NSRange v59;
  uint64_t location;
  NSUInteger length;
  BOOL v62;
  void *v63;
  NSUInteger v64;
  NSUInteger v65;
  NSUInteger v66;
  char v67;
  NSRange v68;
  void *v69;
  NSUInteger v70;
  NSUInteger v71;
  NSUInteger v72;
  NSRange v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  NSUInteger v82;
  NSUInteger v83;
  NSUInteger v84;
  NSUInteger v85;
  NSUInteger v86;
  BOOL v87;
  NSRange v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSUInteger v97;
  NSUInteger v98;
  NSUInteger v99;
  void *v100;
  NSUInteger v101;
  NSUInteger v102;
  NSUInteger v103;
  NSRange v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  NSUInteger v108;
  NSUInteger v109;
  uint64_t m;
  NSUInteger v111;
  NSUInteger v112;
  NSRange v113;
  BOOL v114;
  NSRange v115;
  void *v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  int v124;
  const __CFArray *v125;
  int v126;
  NSObject *v127;
  void *v128;
  id v129;
  NSObject *v130;
  id v131;
  const void *v132;
  id v133;
  NSObject *v134;
  NSObject *v135;
  os_signpost_id_t v136;
  NSObject *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  __int128 *v147;
  void *v148;
  id v149;
  void *v150;
  uint64_t v151;
  NSObject *v152;
  os_signpost_id_t v153;
  NSObject *v154;
  NSObject *v155;
  unint64_t v156;
  NSObject *v157;
  NSObject *v158;
  void *v159;
  double v160;
  double Helper_x8__NLNaturalLanguageErrorDomain;
  uint64_t v162;
  id v163;
  _BOOL4 v164;
  NSObject *v165;
  dispatch_time_t v166;
  NSObject *v167;
  void *v168;
  NSObject *v169;
  NSObject *v170;
  NSObject *v171;
  void *v172;
  double v173;
  uint64_t v174;
  id v175;
  double v176;
  double Helper_x8__NLTagSchemeTokenType;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  id v182;
  id v183;
  NSObject *v184;
  os_signpost_id_t v185;
  NSObject *v186;
  NSObject *v187;
  double v188;
  double v189;
  NSObject *v190;
  double v191;
  NSObject *v192;
  uint64_t Output_delayInitStub;
  NSObject *v194;
  NSObject *v195;
  void *v196;
  uint64_t v197;
  unint64_t ii;
  uint64_t v199;
  uint64_t v200;
  float v201;
  void *v202;
  void *v203;
  void *v204;
  double v205;
  NSObject *v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t jj;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  __CFString *v214;
  id v215;
  void *v216;
  void (*v217)(uint64_t);
  id v218;
  void (**v219)(_QWORD);
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t kk;
  void *v224;
  void *v225;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  float v230;
  double v231;
  int v232;
  uint64_t v233;
  uint64_t v234;
  double v235;
  float v236;
  id v237;
  void *v238;
  NSObject *v239;
  NSObject *v240;
  uint64_t v241;
  const __CFArray *v242;
  void *v243;
  const void *v244;
  __int128 v246;
  _QWORD *v247;
  id v248;
  id v249;
  id v250;
  uint64_t v251;
  uint64_t v253;
  void *v254;
  id v255;
  void *v256;
  id v257;
  void *v258;
  id v259;
  __CFString *v260;
  __int128 *v261;
  id v262;
  id v263;
  uint64_t v264;
  void *v265;
  id spid;
  void *spida;
  os_signpost_id_t spidb;
  void *v269;
  void *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  void *v275;
  uint64_t n;
  char *v277;
  id v278;
  id v279;
  __CFString *v280;
  int v281[2];
  id v282;
  id v283;
  id v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  id v291;
  id v292;
  NSObject *v293;
  id v294;
  id v295;
  id obj;
  id obja;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  _BYTE v318[128];
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  uint64_t aBlock;
  uint64_t p_aBlock;
  uint64_t v333;
  uint64_t (*v334)(uint64_t, uint64_t);
  void (*v335)(uint64_t);
  id v336;
  uint8_t *v337;
  __int128 *v338;
  __int128 *v339;
  uint8_t v340[16];
  __int128 v341;
  __int128 v342;
  __int128 v343;
  _QWORD v344[4];
  id v345;
  uint64_t block;
  uint64_t v347;
  void *v348;
  void *v349;
  __int128 *p_buf;
  __int128 *v351;
  void *v352;
  __int128 buf;
  uint64_t v354;
  uint64_t (*v355)(uint64_t, uint64_t);
  void (*v356)(uint64_t);
  id v357;
  id v358;
  id v359;
  uint64_t v360;
  uint64_t v361;
  NSRange v362;
  NSRange v363;
  NSRange v364;
  NSRange v365;
  NSRange v366;
  NSRange v367;
  NSRange v368;
  NSRange v369;
  NSRange v370;
  NSRange v371;
  NSRange v372;
  NSRange v373;
  NSRange v374;
  NSRange v375;
  NSRange v376;
  NSRange v377;
  NSRange v378;
  NSRange v379;
  NSRange v380;
  NSRange v381;

  v361 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 264))
    v6 = *(const __CFArray **)(a1 + 272);
  else
    v6 = (const __CFArray *)&unk_1E3C9FDC0;
  v280 = a2;
  v7 = a3;
  *(_QWORD *)v281 = a1;
  if (-[__CFArray count](v6, "count") && objc_msgSend(v7, "count"))
  {
    v269 = (void *)objc_opt_new();
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    v255 = v7;
    v8 = (Class *)v7;
    v9 = -[Class countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v302, &v319, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v303;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v303 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * i);
          if (_ddResultTypeHasMLEquivalent(v12, v6))
          {
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(_QWORD *)(v12 + 32), *(_QWORD *)(v12 + 40));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v269, "addObject:", v13);

          }
        }
        v9 = -[Class countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v302, &v319, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v269, "count"))
    {
      v260 = v280;
      spid = v269;
      gotLoadHelper_x20__OBJC_CLASS___NLTokenizer(v14);
      v258 = (void *)objc_msgSend(objc_alloc(v8[47]), "initWithUnit:", 1);
      objc_msgSend(v258, "setString:", v260);
      objc_msgSend(v258, "tokensForRange:", 0, -[__CFString length](v260, "length"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v256 = (void *)objc_msgSend(objc_alloc(v8[47]), "initWithUnit:", 0);
      objc_msgSend(v256, "setString:", v260);
      objc_msgSend(v256, "tokensForRange:", 0, -[__CFString length](v260, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v294 = (id)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v292 = (id)objc_claimAutoreleasedReturnValue();
      v343 = 0u;
      v342 = 0u;
      v341 = 0u;
      *(_OWORD *)v340 = 0u;
      obj = v15;
      v274 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v340, &block, 16);
      if (v274)
      {
        LODWORD(v282) = 0;
        LODWORD(v17) = 0;
        v271 = *(_QWORD *)v341;
        do
        {
          v18 = 0;
          v282 = (id)(int)v282;
          do
          {
            if (*(_QWORD *)v341 != v271)
            {
              v19 = v18;
              objc_enumerationMutation(obj);
              v18 = v19;
            }
            v277 = v18;
            v20 = objc_msgSend(*(id *)(*(_QWORD *)&v340[8] + 8 * (_QWORD)v18), "rangeValue");
            v22 = v21;
            if ((int)v17 < (int)objc_msgSend(v294, "count"))
            {
              v288 = 0;
              v17 = (int)v17;
              v23 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                objc_msgSend(v294, "objectAtIndexedSubscript:", v17);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "rangeValue");
                v27 = v26;

                v362.location = v20;
                v362.length = v22;
                v373.location = v25;
                v373.length = v27;
                if (NSIntersectionRange(v362, v373).length)
                {
                  if (v23 == 0x7FFFFFFFFFFFFFFFLL)
                    v23 = v17;
                  ++v288;
                  if ((uint64_t)(v20 + v22 - (v27 + v25)) <= 3)
                  {
                    if (objc_msgSend(v294, "count") <= v17 + 1)
                      goto LABEL_29;
                    objc_msgSend(v294, "objectAtIndexedSubscript:");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "rangeValue");
                    v31 = v30;

                    v363.location = v29;
                    v363.length = v31;
                    v374.location = v20;
                    v374.length = v22;
                    if (!NSIntersectionRange(v363, v374).length)
                    {
LABEL_29:
                      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v25, v20 + v22 - v25);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v294, "setObject:atIndexedSubscript:", v32, v17);

                    }
                  }
                }
                else if (v23 != 0x7FFFFFFFFFFFFFFFLL || (v23 = 0x7FFFFFFFFFFFFFFFLL, v25 + v27 >= v20))
                {
LABEL_33:
                  v33 = v288;
                  goto LABEL_35;
                }
                if (++v17 >= (int)objc_msgSend(v294, "count"))
                  goto LABEL_33;
              }
            }
            v33 = 0;
            v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_35:
            if ((int)v17 <= 1)
              v34 = 1;
            else
              v34 = v17;
            v35 = (v34 - 1);
            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              v36 = 0;
            else
              v36 = v33;
            if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              v37 = v35;
            else
              v37 = v23;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v37, v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v292, "setObject:atIndexedSubscript:", v38, v282);

            v282 = (char *)v282 + 1;
            v18 = v277 + 1;
          }
          while (v277 + 1 != (char *)v274);
          v274 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v340, &block, 16);
        }
        while (v274);
      }

      v275 = (void *)objc_opt_new();
      v312 = 0u;
      v313 = 0u;
      v310 = 0u;
      v311 = 0u;
      v283 = spid;
      v289 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v310, v344, 16);
      if (v289)
      {
        v285 = *(_QWORD *)v311;
        do
        {
          for (j = 0; j != v289; ++j)
          {
            if (*(_QWORD *)v311 != v285)
              objc_enumerationMutation(v283);
            v40 = objc_msgSend(*(id *)(*((_QWORD *)&v310 + 1) + 8 * j), "rangeValue");
            v42 = v41;
            if (objc_msgSend(obj, "count") >= 1)
            {
              v43 = 0;
              v44 = 0x7FFFFFFFFFFFFFFFLL;
              v45 = 0x7FFFFFFFFFFFFFFFLL;
              do
              {
                objc_msgSend(obj, "objectAtIndexedSubscript:", v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "rangeValue");
                v49 = v48;

                v364.location = v40;
                v364.length = v42;
                v375.location = v47;
                v375.length = v49;
                if (NSIntersectionRange(v364, v375).length)
                {
                  if (v45 == 0x7FFFFFFFFFFFFFFFLL)
                    v50 = v43;
                  else
                    v50 = v45;
                  v44 = v43;
                }
                else
                {
                  v50 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_61;
                }
                ++v43;
                v45 = v50;
              }
              while (v43 < objc_msgSend(obj, "count"));
              v45 = v50;
              if (v50 == 0x7FFFFFFFFFFFFFFFLL)
                continue;
LABEL_61:
              objc_msgSend(v292, "objectAtIndexedSubscript:", v45);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "rangeValue");
              v54 = v53;

              objc_msgSend(v292, "objectAtIndexedSubscript:", v44);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v55, "rangeValue");
              v58 = v57;

              v365.location = v52;
              v365.length = v54;
              v376.location = v56;
              v376.length = v58;
              v59 = NSUnionRange(v365, v376);
              location = v59.location;
              length = v59.length;
LABEL_62:
              ++v44;
              while (length <= 0x27)
              {
                v62 = v45-- < 1;
                if (v62
                  || (objc_msgSend(v292, "objectAtIndexedSubscript:", v45),
                      v63 = (void *)objc_claimAutoreleasedReturnValue(),
                      v64 = objc_msgSend(v63, "rangeValue"),
                      v66 = v65,
                      v63,
                      v64 == 0x7FFFFFFFFFFFFFFFLL))
                {
                  v67 = 0;
                }
                else
                {
                  v366.location = v64;
                  v366.length = v66;
                  v377.location = location;
                  v377.length = length;
                  v68 = NSUnionRange(v366, v377);
                  if (v68.length <= 0x96)
                    location = v68.location;
                  else
                    location = location + length - 150;
                  if (v68.length >= 0x96)
                    length = 150;
                  else
                    length = v68.length;
                  v67 = 1;
                }
                if (v44 < objc_msgSend(v292, "count"))
                {
                  objc_msgSend(v292, "objectAtIndexedSubscript:", v44);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v70 = objc_msgSend(v69, "rangeValue");
                  v72 = v71;

                  if (v70 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v367.location = v70;
                    v367.length = v72;
                    v378.location = location;
                    v378.length = length;
                    v73 = NSUnionRange(v367, v378);
                    location = v73.location;
                    if (v73.length >= 0x96)
                      length = 150;
                    else
                      length = v73.length;
                    goto LABEL_62;
                  }
                }
                ++v44;
                if ((v67 & 1) == 0)
                  break;
              }
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v275, "addObject:", v74);

            }
          }
          v289 = objc_msgSend(v283, "countByEnumeratingWithState:objects:count:", &v310, v344, 16);
        }
        while (v289);
      }

      v254 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 1, &__block_literal_global_1243);
      v352 = v254;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v352, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "sortedArrayUsingDescriptors:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (void *)objc_opt_new();
      v308 = 0u;
      v309 = 0u;
      v306 = 0u;
      v307 = 0u;
      v278 = v76;
      v78 = objc_msgSend(v278, "countByEnumeratingWithState:objects:count:", &v306, &aBlock, 16);
      if (v78)
      {
        v290 = 0;
        v79 = *(_QWORD *)v307;
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (*(_QWORD *)v307 != v79)
              objc_enumerationMutation(v278);
            v81 = *(void **)(*((_QWORD *)&v306 + 1) + 8 * k);
            if (!v290)
              goto LABEL_97;
            v82 = objc_msgSend(*(id *)(*((_QWORD *)&v306 + 1) + 8 * k), "rangeValue");
            v84 = v83;
            v368.location = objc_msgSend(v290, "rangeValue");
            v85 = v368.location;
            v86 = v368.length;
            v379.location = v82;
            v379.length = v84;
            v87 = NSIntersectionRange(v368, v379).length || v85 + v86 == v82;
            if (v87
              && (v369.location = v82,
                  v369.length = v84,
                  v380.location = v85,
                  v380.length = v86,
                  v88 = NSUnionRange(v369, v380),
                  v88.length <= 0x96))
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v88.location, v88.length);
              v89 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v77, "replaceObjectAtIndex:withObject:", objc_msgSend(v77, "count") - 1, v89);
            }
            else
            {
LABEL_97:
              v89 = v81;

              objc_msgSend(v77, "addObject:", v89);
            }
            v290 = v89;
          }
          v78 = objc_msgSend(v278, "countByEnumeratingWithState:objects:count:", &v306, &aBlock, 16);
        }
        while (v78);
      }
      else
      {
        v290 = 0;
      }

      spida = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v77, "count"));
      v329 = 0u;
      v330 = 0u;
      v327 = 0u;
      v328 = 0u;
      v262 = v77;
      v272 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v327, &v323, 16);
      if (v272)
      {
        v264 = *(_QWORD *)v328;
        do
        {
          v91 = 0;
          do
          {
            if (*(_QWORD *)v328 != v264)
            {
              v92 = v91;
              objc_enumerationMutation(v262);
              v91 = v92;
            }
            v286 = v91;
            v93 = objc_msgSend(*(id *)(*((_QWORD *)&v327 + 1) + 8 * v91), "rangeValue");
            v95 = v94;
            objc_msgSend(v294, "objectAtIndexedSubscript:", v93);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "rangeValue");
            v99 = v98;

            objc_msgSend(v294, "objectAtIndexedSubscript:", v95 + v93 - 1);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "rangeValue");
            v103 = v102;

            v370.location = v97;
            v370.length = v99;
            v381.location = v101;
            v381.length = v103;
            v104 = NSUnionRange(v370, v381);
            v105 = v283;
            v314 = 0u;
            v315 = 0u;
            v316 = 0u;
            v317 = 0u;
            v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v314, &buf, 16);
            if (v106)
            {
              v107 = *(_QWORD *)v315;
              v108 = v104.length;
              v109 = v104.location;
              do
              {
                for (m = 0; m != v106; ++m)
                {
                  if (*(_QWORD *)v315 != v107)
                    objc_enumerationMutation(v105);
                  v371.location = objc_msgSend(*(id *)(*((_QWORD *)&v314 + 1) + 8 * m), "rangeValue");
                  v111 = v371.location;
                  v112 = v371.length;
                  v113 = NSIntersectionRange(v371, v104);
                  if (v113.length)
                    v114 = v113.length >= v112;
                  else
                    v114 = 1;
                  if (!v114)
                  {
                    v372.location = v111;
                    v372.length = v112;
                    v115 = NSUnionRange(v372, v104);
                    v109 = v115.location;
                    v108 = v115.length;
                  }
                }
                v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v314, &buf, 16);
              }
              while (v106);
            }
            else
            {
              v108 = v104.length;
              v109 = v104.location;
            }

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v109, v108);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(spida, "addObject:", v116);

            v91 = v286 + 1;
          }
          while (v286 + 1 != v272);
          v272 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v327, &v323, 16);
        }
        while (v272);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", spida);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v90 = 0;
    }

    v7 = v255;
  }
  else
  {
    v90 = 0;
  }

  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v249 = v90;
  v253 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v298, v318, 16);
  if (v253)
  {
    v270 = 0;
    v251 = *(_QWORD *)v299;
    *(_QWORD *)&v117 = 138412290;
    v246 = v117;
    while (1)
    {
      for (n = 0; n != v253; ++n)
      {
        if (*(_QWORD *)v299 != v251)
          objc_enumerationMutation(v249);
        v118 = objc_msgSend(*(id *)(*((_QWORD *)&v298 + 1) + 8 * n), "rangeValue", v246);
        v120 = v119;
        os_unfair_lock_lock((os_unfair_lock_t)&__DDMLCooldownLock);
        os_unfair_lock_unlock((os_unfair_lock_t)&__DDMLCooldownLock);
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v121 = (id)DDLogHandle_error_log_handle;
        spidb = os_signpost_id_generate(v121);

        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v122 = (id)DDLogHandle_error_log_handle;
        v123 = v122;
        if (spidb - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19BC07000, v123, OS_SIGNPOST_INTERVAL_BEGIN, spidb, "datadetectors.scanString.mlScan", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
        }

        if (*(_QWORD *)(*(_QWORD *)v281 + 264))
        {
          v124 = 1;
          *a4 = 1;
          v125 = *(const __CFArray **)(*(_QWORD *)v281 + 264);
          goto LABEL_291;
        }
        v126 = *(_DWORD *)(*(_QWORD *)v281 + 252);
        if (!v126)
          v126 = DDComputeDominantScriptOrLanguage(v280);
        v259 = 0;
        if (v126 == 30)
        {
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v354 = 0x3032000000;
          v355 = __Block_byref_object_copy__1249;
          v356 = __Block_byref_object_dispose__1250;
          v357 = 0;
          _ddmlModelQueue();
          v127 = objc_claimAutoreleasedReturnValue();
          block = MEMORY[0x1E0C809B0];
          v347 = 3221225472;
          v348 = __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke;
          v349 = &unk_1E3C95418;
          p_buf = &buf;
          dispatch_sync(v127, &block);

          if ((objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "hasAvailableAssets") & 1) == 0)
          {
            v128 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            v344[0] = MEMORY[0x1E0C809B0];
            v344[1] = 3221225472;
            v344[2] = __DDMLScannerGetEmbeddingAndAssetsForScriptWithCompletionHandler_block_invoke_2;
            v344[3] = &unk_1E3C95440;
            v345 = 0;
            objc_msgSend(v128, "requestEmbeddingAssetsWithCompletionHandler:", v344);

          }
          v259 = *(id *)(*((_QWORD *)&buf + 1) + 40);
          _Block_object_dispose(&buf, 8);

        }
        if (!objc_msgSend(v259, "hasAvailableAssets"))
        {
          v132 = *(const void **)(*(_QWORD *)v281 + 272);
          if (v132)
          {
            CFRelease(v132);
            v279 = 0;
            *(_QWORD *)(*(_QWORD *)v281 + 272) = 0;
          }
          else
          {
            v279 = 0;
          }
          goto LABEL_285;
        }
        v129 = v259;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v354 = 0x3032000000;
        v355 = __Block_byref_object_copy__1249;
        v356 = __Block_byref_object_dispose__1250;
        v357 = 0;
        _ddmlModelQueue();
        v130 = objc_claimAutoreleasedReturnValue();
        block = MEMORY[0x1E0C809B0];
        v347 = 3221225472;
        v348 = __DDMLGetTaggerModel_block_invoke;
        v349 = &unk_1E3C95578;
        v261 = (__int128 *)v129;
        p_buf = v261;
        v351 = &buf;
        dispatch_sync(v130, &block);

        if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "taggerModel"))
        {
          v131 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "error");
          v131 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());

        }
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "supportedTypes");
        v133 = (id)objc_claimAutoreleasedReturnValue();
        v263 = (id)objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "taggerModel");

        _Block_object_dispose(&buf, 8);
        v248 = v131;
        v247 = v133;
        DDScannerSetMLSupportedTypes(*(_QWORD **)v281, v247);
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v134 = (id)DDLogHandle_error_log_handle;
        v135 = v134;
        if (!v263)
        {
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v246;
            *(_QWORD *)((char *)&buf + 4) = v248;
            _os_log_error_impl(&dword_19BC07000, v135, OS_LOG_TYPE_ERROR, "Failed to acquire DDML model with error %@", (uint8_t *)&buf, 0xCu);
          }
          v279 = 0;
          goto LABEL_284;
        }
        v136 = os_signpost_id_generate(v134);

        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v137 = (id)DDLogHandle_error_log_handle;
        v138 = v137;
        if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19BC07000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v136, "datadetectors.scanString.sentenceTokenization", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v118, v120);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v352 = v139;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v352, 1);
        v140 = (void *)objc_claimAutoreleasedReturnValue();

        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v141 = (id)DDLogHandle_error_log_handle;
        v142 = v141;
        if (v136 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19BC07000, v142, OS_SIGNPOST_INTERVAL_END, v136, "datadetectors.scanString.sentenceTokenization", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
        }

        v321 = 0u;
        v322 = 0u;
        v319 = 0u;
        v320 = 0u;
        v293 = v140;
        v287 = -[NSObject countByEnumeratingWithState:objects:count:](v293, "countByEnumeratingWithState:objects:count:", &v319, &block, 16);
        if (v287)
        {
          v279 = 0;
          v284 = *(id *)v320;
          v143 = v293;
          do
          {
            for (obja = 0; obja != (id)v287; obja = (char *)obja + 1)
            {
              if (*(id *)v320 != v284)
              {
                objc_enumerationMutation(v143);
                v143 = v293;
              }
              if (*(_QWORD *)v281 && (*(_BYTE *)(*(_QWORD *)v281 + 232) & 1) != 0)
                goto LABEL_280;
              v144 = objc_msgSend(*(id *)(*((_QWORD *)&v319 + 1) + 8 * (_QWORD)obja), "rangeValue");
              -[__CFString substringWithRange:](v280, "substringWithRange:", v144, v145);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v295 = v146;
              if (v146)
              {
                if (objc_msgSend(v146, "length"))
                {
                  v147 = v261;
                  v148 = (void *)MEMORY[0x1E0C99DE8];
                  v149 = v295;
                  objc_msgSend(v148, "array");
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v149, "lowercaseString");
                  v150 = (void *)objc_claimAutoreleasedReturnValue();

                  v151 = objc_msgSend(v147, "dimension");
                  if (DDLogHandle_onceToken != -1)
                    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                  v152 = (id)DDLogHandle_error_log_handle;
                  v153 = os_signpost_id_generate(v152);

                  if (DDLogHandle_onceToken != -1)
                    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                  v154 = (id)DDLogHandle_error_log_handle;
                  v155 = v154;
                  v156 = v153 - 1;
                  if (v153 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v154))
                  {
                    LOWORD(buf) = 0;
                    _os_signpost_emit_with_name_impl(&dword_19BC07000, v155, OS_SIGNPOST_INTERVAL_BEGIN, v153, "datadetectors.scanString.embedding", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
                  }

                  *(_QWORD *)&v310 = 0;
                  objc_msgSend(v147, "requestBackgroundModelLoadingWithTimeout:error:", &v310, 1.0);
                  v291 = (id)v310;
                  if (v291)
                  {
                    if (DDLogHandle_onceToken != -1)
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                    v157 = (id)DDLogHandle_error_log_handle;
                    v158 = v157;
                    if (v156 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
                    {
                      LOWORD(buf) = 0;
                      _os_signpost_emit_with_name_impl(&dword_19BC07000, v158, OS_SIGNPOST_INTERVAL_END, v153, "datadetectors.scanString.embedding", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
                    }

                    objc_msgSend(v291, "domain");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    Helper_x8__NLNaturalLanguageErrorDomain = gotLoadHelper_x8__NLNaturalLanguageErrorDomain(v160);
                    if (objc_msgSend(v163, "isEqualToString:", **(_QWORD **)(v162 + 4040), Helper_x8__NLNaturalLanguageErrorDomain))
                    {
                      v164 = objc_msgSend(v291, "code") == 12;

                      if (v164)
                      {
                        if (DDLogHandle_onceToken != -1)
                          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                        v165 = (id)DDLogHandle_error_log_handle;
                        if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(buf) = v246;
                          *(_QWORD *)((char *)&buf + 4) = v291;
                          _os_log_error_impl(&dword_19BC07000, v165, OS_LOG_TYPE_ERROR, "Loading embedding model timed out: %@", (uint8_t *)&buf, 0xCu);
                        }

                        os_unfair_lock_lock((os_unfair_lock_t)&__DDMLCooldownLock);
                        v166 = dispatch_time(0, 15000000000);
                        _ddmlModelQueue();
                        v167 = objc_claimAutoreleasedReturnValue();
                        dispatch_after(v166, v167, &__block_literal_global_197);

                        os_unfair_lock_unlock((os_unfair_lock_t)&__DDMLCooldownLock);
                      }
                    }
                    else
                    {

                    }
                  }
                  else
                  {
                    *(_QWORD *)&v306 = 0;
                    objc_msgSend(v147, "requestBackgroundEmbeddingResultForString:language:error:", v150, 0, &v306);
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    v291 = (id)v306;
                    if (DDLogHandle_onceToken != -1)
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                    v169 = (id)DDLogHandle_error_log_handle;
                    v170 = v169;
                    if (v156 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v169))
                    {
                      LOWORD(buf) = 0;
                      _os_signpost_emit_with_name_impl(&dword_19BC07000, v170, OS_SIGNPOST_INTERVAL_END, v153, "datadetectors.scanString.embedding", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
                    }

                    aBlock = 0;
                    p_aBlock = (uint64_t)&aBlock;
                    v333 = 0x3032000000;
                    v334 = __Block_byref_object_copy__1249;
                    v335 = __Block_byref_object_dispose__1250;
                    v336 = 0;
                    _ddmlModelQueue();
                    v171 = objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&v323 = MEMORY[0x1E0C809B0];
                    *((_QWORD *)&v323 + 1) = 3221225472;
                    *(_QWORD *)&v324 = ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke;
                    *((_QWORD *)&v324 + 1) = &unk_1E3C95418;
                    *(_QWORD *)&v325 = &aBlock;
                    dispatch_sync(v171, &v323);

                    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
                    v172 = (void *)objc_claimAutoreleasedReturnValue();
                    gotLoadHelper_x8__OBJC_CLASS___NLTagger(v173);
                    v175 = objc_alloc(*(Class *)(v174 + 368));
                    Helper_x8__NLTagSchemeTokenType = gotLoadHelper_x8__NLTagSchemeTokenType(v176);
                    *(_QWORD *)&v327 = **(_QWORD **)(v178 + 224);
                    v179 = v327;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v327, 1, Helper_x8__NLTagSchemeTokenType);
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    v265 = (void *)objc_msgSend(v175, "initWithTagSchemes:", v180);

                    objc_msgSend(v265, "setString:", v150);
                    v181 = objc_msgSend(v150, "length");
                    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                    *((_QWORD *)&buf + 1) = 3221225472;
                    v354 = (uint64_t)___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_2;
                    v355 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E3C95500;
                    v356 = v150;
                    v182 = v273;
                    v357 = v182;
                    v250 = v168;
                    v358 = v250;
                    v360 = v151;
                    v183 = v172;
                    v359 = v183;
                    objc_msgSend(v265, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v181, 0, v179, 36, &buf);
                    if (DDLogHandle_onceToken != -1)
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                    v184 = (id)DDLogHandle_error_log_handle;
                    v185 = os_signpost_id_generate(v184);

                    if (DDLogHandle_onceToken != -1)
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                    v186 = (id)DDLogHandle_error_log_handle;
                    v187 = v186;
                    if (v185 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v186))
                    {
                      *(_WORD *)v340 = 0;
                      _os_signpost_emit_with_name_impl(&dword_19BC07000, v187, OS_SIGNPOST_INTERVAL_BEGIN, v185, "datadetectors.scanString.runHeadModel", (const char *)&unk_19BC4332F, v340, 2u);
                    }

                    *(_QWORD *)&v302 = 0;
                    objc_msgSend(v182, "count");
                    v257 = objc_retainAutorelease(v183);
                    objc_msgSend(v257, "bytes");
                    MRLNeuralNetworkSetInput_delayInitStub(v188);
                    if ((_QWORD)v302)
                    {
                      if (DDLogHandle_onceToken != -1)
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                      v190 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v246;
                        *(_QWORD *)&v340[4] = v302;
                        _os_log_error_impl(&dword_19BC07000, v190, OS_LOG_TYPE_ERROR, "failed to set input to tagger model %@", v340, 0xCu);
                      }

                    }
                    MRLNeuralNetworkPredict_delayInitStub(v189);
                    if ((_QWORD)v302)
                    {
                      if (DDLogHandle_onceToken != -1)
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                      v192 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v246;
                        *(_QWORD *)&v340[4] = v302;
                        _os_log_error_impl(&dword_19BC07000, v192, OS_LOG_TYPE_ERROR, "failed to get prediction from tagger model %@", v340, 0xCu);
                      }

                    }
                    Output_delayInitStub = MRLNeuralNetworkGetOutput_delayInitStub(v191);
                    if (DDLogHandle_onceToken != -1)
                      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                    v194 = (id)DDLogHandle_error_log_handle;
                    v195 = v194;
                    if (v185 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v194))
                    {
                      *(_WORD *)v340 = 0;
                      _os_signpost_emit_with_name_impl(&dword_19BC07000, v195, OS_SIGNPOST_INTERVAL_END, v185, "datadetectors.scanString.runHeadModel", (const char *)&unk_19BC4332F, v340, 2u);
                    }

                    if (Output_delayInitStub)
                    {
                      objc_msgSend(*(id *)(p_aBlock + 40), "tokenLabelMap");
                      v196 = (void *)objc_claimAutoreleasedReturnValue();
                      v197 = objc_msgSend(v196, "count");

                      for (ii = 0; ii < objc_msgSend(v182, "count"); ++ii)
                      {
                        if (v197)
                        {
                          v199 = 0;
                          v200 = 0;
                          v201 = 0.0;
                          do
                          {
                            if (*(float *)(Output_delayInitStub + 4 * v199) > v201)
                            {
                              v201 = *(float *)(Output_delayInitStub + 4 * v199);
                              v200 = v199;
                            }
                            ++v199;
                          }
                          while (v197 != v199);
                        }
                        else
                        {
                          v200 = 0;
                          v201 = 0.0;
                        }
                        objc_msgSend(*(id *)(p_aBlock + 40), "tokenTypeForValue:", v200);
                        v202 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v182, "objectAtIndexedSubscript:", ii);
                        v203 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v203, "setTokenType:", v202);

                        objc_msgSend(v182, "objectAtIndexedSubscript:", ii);
                        v204 = (void *)objc_claimAutoreleasedReturnValue();
                        *(float *)&v205 = v201;
                        objc_msgSend(v204, "setConfidence:", v205);

                        Output_delayInitStub += 4 * v197;
                      }
                    }
                    else
                    {
                      if (DDLogHandle_onceToken != -1)
                        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                      v206 = (id)DDLogHandle_error_log_handle;
                      if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v340 = v246;
                        *(_QWORD *)&v340[4] = v302;
                        _os_log_error_impl(&dword_19BC07000, v206, OS_LOG_TYPE_ERROR, "failed to get output from tagger model %@", v340, 0xCu);
                      }

                      objc_msgSend(v182, "removeAllObjects");
                    }

                    _Block_object_dispose(&aBlock, 8);
                  }

                  v314 = 0u;
                  v315 = 0u;
                  v316 = 0u;
                  v317 = 0u;
                  v207 = v273;
                  v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v314, v344, 16);
                  if (v208)
                  {
                    v209 = *(_QWORD *)v315;
                    do
                    {
                      for (jj = 0; jj != v208; ++jj)
                      {
                        if (*(_QWORD *)v315 != v209)
                          objc_enumerationMutation(v207);
                        v211 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * jj);
                        v212 = objc_msgSend(v211, "range");
                        objc_msgSend(v211, "setRange:", v212 + v144, v213);
                      }
                      v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v314, v344, 16);
                    }
                    while (v208);
                  }

                  v214 = v280;
                  v215 = v207;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v216 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)&v310 = 0;
                  *((_QWORD *)&v310 + 1) = &v310;
                  *(_QWORD *)&v311 = 0x2020000000;
                  DWORD2(v311) = 10;
                  *(_QWORD *)v340 = 0;
                  *(_QWORD *)&v340[8] = v340;
                  *(_QWORD *)&v341 = 0x3010000000;
                  *((_QWORD *)&v341 + 1) = &unk_19BC45A1A;
                  v342 = 0uLL;
                  *(_QWORD *)&v306 = 0;
                  *((_QWORD *)&v306 + 1) = &v306;
                  v307 = 0x2020000000uLL;
                  aBlock = MEMORY[0x1E0C809B0];
                  p_aBlock = 3221225472;
                  v333 = (uint64_t)__DDMLScannerBuildResultsFromTokens_block_invoke;
                  v334 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E3C95528;
                  v337 = v340;
                  v217 = v214;
                  v335 = v217;
                  v338 = &v306;
                  v339 = &v310;
                  v218 = v216;
                  v336 = v218;
                  v219 = (void (**)(_QWORD))_Block_copy(&aBlock);
                  v325 = 0u;
                  v326 = 0u;
                  v323 = 0u;
                  v324 = 0u;
                  v220 = v215;
                  v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v323, &buf, 16);
                  if (v221)
                  {
                    v222 = *(_QWORD *)v324;
                    do
                    {
                      for (kk = 0; kk != v221; ++kk)
                      {
                        if (*(_QWORD *)v324 != v222)
                          objc_enumerationMutation(v220);
                        v224 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * kk);
                        objc_msgSend(v224, "tokenType");
                        v225 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v225, "classification") != 10)
                        {
                          if (objc_msgSend(v225, "beginning"))
                          {
                            v219[2](v219);
                            v226 = objc_msgSend(v225, "classification");
                            *(_DWORD *)(*((_QWORD *)&v310 + 1) + 24) = v226;
                            v227 = objc_msgSend(v224, "range");
                            objc_msgSend(v224, "range");
                            v228 = *(_QWORD *)&v340[8];
                            *(_QWORD *)(*(_QWORD *)&v340[8] + 32) = v227;
                            *(_QWORD *)(v228 + 40) = v229;
                            objc_msgSend(v224, "confidence");
                            v231 = v230;
LABEL_263:
                            *(double *)(*((_QWORD *)&v306 + 1) + 24) = v231;
                            goto LABEL_265;
                          }
                          v232 = *(_DWORD *)(*((_QWORD *)&v310 + 1) + 24);
                          if (v232 == objc_msgSend(v225, "classification"))
                          {
                            v233 = objc_msgSend(v224, "range");
                            objc_msgSend(v224, "range");
                            *(_QWORD *)(*(_QWORD *)&v340[8] + 40) = v234
                                                                    + v233
                                                                    - *(_QWORD *)(*(_QWORD *)&v340[8] + 32);
                            v235 = *(double *)(*((_QWORD *)&v306 + 1) + 24);
                            objc_msgSend(v224, "confidence");
                            v231 = v236;
                            if (v235 < v231)
                              v231 = v235;
                            goto LABEL_263;
                          }
LABEL_264:
                          v219[2](v219);
                          goto LABEL_265;
                        }
                        if (*(_DWORD *)(*((_QWORD *)&v310 + 1) + 24) != 10)
                          goto LABEL_264;
LABEL_265:

                      }
                      v221 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v323, &buf, 16);
                    }
                    while (v221);
                  }

                  v219[2](v219);
                  v237 = v218;

                  _Block_object_dispose(&v306, 8);
                  _Block_object_dispose(v340, 8);
                  _Block_object_dispose(&v310, 8);

                  v238 = v279;
                  if (!v279)
                  {
                    v238 = (void *)objc_msgSend(v237, "count");
                    if (v238)
                      v238 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  }
                  v279 = v238;
                  objc_msgSend(v238, "addObjectsFromArray:", v237);

                }
                v146 = v295;
              }

              v143 = v293;
            }
            v287 = -[NSObject countByEnumeratingWithState:objects:count:](v293, "countByEnumeratingWithState:objects:count:", &v319, &block, 16);
            v143 = v293;
          }
          while (v287);

          if (!*(_QWORD *)v281)
          {
LABEL_282:
            *a4 = 1;
            goto LABEL_283;
          }
        }
        else
        {
          v279 = 0;
          v143 = v293;
LABEL_280:

        }
        if ((*(_BYTE *)(*(_QWORD *)v281 + 232) & 1) == 0)
          goto LABEL_282;
LABEL_283:
        v135 = v293;
LABEL_284:

LABEL_285:
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v239 = (id)DDLogHandle_error_log_handle;
        v240 = v239;
        if (spidb - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v239))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_19BC07000, v240, OS_SIGNPOST_INTERVAL_END, spidb, "datadetectors.scanString.mlScan", (const char *)&unk_19BC4332F, (uint8_t *)&buf, 2u);
        }

        v124 = *a4;
        v125 = (const __CFArray *)v279;
LABEL_291:
        v241 = (uint64_t)v270;
        if (v124 && v125)
        {
          v242 = v125;
          if (CFArrayGetCount(v125) < 1)
            goto LABEL_296;
          if (v270)
          {
            objc_msgSend(v270, "addObjectsFromArray:", v242);
LABEL_296:
            v241 = (uint64_t)v270;
            goto LABEL_298;
          }
          v241 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v242);
        }
LABEL_298:
        v270 = (void *)v241;
      }
      v253 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v298, v318, 16);
      if (!v253)
        goto LABEL_302;
    }
  }
  v270 = 0;
LABEL_302:

  objc_msgSend(v270, "array");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = (const void *)objc_msgSend(v243, "mutableCopy");

  if (v244)
    CFAutorelease(v244);

  return v244;
}

void sub_19BC29968(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x5C0], 8);
  _Unwind_Resume(a1);
}

BOOL _ddResultTypeHasMLEquivalent(uint64_t a1, const __CFArray *a2)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a1 + 64);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Data")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Tag")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Compatibility")))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = *(id *)(a1 + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if ((_ddResultTypeHasMLEquivalent(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), a2) & 1) != 0)
          {

            v10 = 1;
            goto LABEL_14;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v10 = 0;
  }
  else
  {
    v10 = DDResultTypeIsMLSupported(a1, a2) != 0;
  }
LABEL_14:

  return v10;
}

uint64_t __Block_byref_object_copy__1249(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1250(uint64_t a1)
{

}

id _ddmlModelQueue()
{
  if (_ddmlModelQueue_onceToken != -1)
    dispatch_once(&_ddmlModelQueue_onceToken, &__block_literal_global_175);
  return (id)_ddmlModelsQueue;
}

void sub_19BC29DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ddmlModelQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.datadetectors.ddmlscanner.models", v2);
  v1 = (void *)_ddmlModelsQueue;
  _ddmlModelsQueue = (uint64_t)v0;

}

void ___startEmbeddingCleanupTimeout_block_invoke()
{
  void *v0;

  objc_msgSend((id)_currentEmbedding, "requestModelUnloading");
  v0 = (void *)_currentEmbedding;
  _currentEmbedding = 0;

}

BOOL DDMLUpdateScannerResultsWithMLResults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFArray *Mutable;
  uint64_t v11;
  const CFArrayCallBacks *v12;
  uint64_t i;
  uint64_t v14;
  const void *v15;
  const void *v16;
  _BOOL8 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[DDResultCluster clustersWithDDResults:mlResults:](DDResultCluster, "clustersWithDDResults:mlResults:", *(_QWORD *)(a1 + 168), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
    goto LABEL_16;
  v9 = v8;
  Mutable = 0;
  v11 = *(_QWORD *)v20;
  v12 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v7);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "resolvedDDResultFromOriginalQuery:mlSupportedTypes:", a2, a4);
      if (v14)
      {
        v15 = (const void *)v14;
        if (!Mutable)
          Mutable = CFArrayCreateMutable(0, 0, v12);
        CFArrayAppendValue(Mutable, v15);
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v9);
  if (Mutable)
  {
    v16 = *(const void **)(a1 + 168);
    if (v16)
      CFRelease(v16);
    *(_QWORD *)(a1 + 168) = Mutable;
    v17 = CFArrayGetCount(Mutable) > 0;
  }
  else
  {
LABEL_16:
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 168));
    v17 = 0;
  }

  return v17;
}

void sub_19BC2AA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL shouldURLifyNode(void *a1)
{
  if (shouldURLifyNode_sOnce != -1)
    dispatch_once(&shouldURLifyNode_sOnce, &__block_literal_global_94);
  return objc_msgSend(a1, "nodeType") != 1
      || objc_msgSend((id)shouldURLifyNode_doNotVisit, "member:", objc_msgSend(a1, "nodeName")) == 0;
}

uint64_t __shouldURLifyNode_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("A"), CFSTR("a"), CFSTR("STYLE"), CFSTR("style"), CFSTR("IMG"), CFSTR("img"), CFSTR("META"), CFSTR("meta"), CFSTR("SCRIPT"), CFSTR("script"), CFSTR("TITLE"), CFSTR("title"), CFSTR("OBJECT"), CFSTR("object"), 0);
  shouldURLifyNode_doNotVisit = result;
  return result;
}

uint64_t DDURLWithPotentiallyInvalidURLString(uint64_t result)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", result);
    if (!result)
    {
      v2 = objc_msgSend(v1, "rangeOfString:", CFSTR(":"));
      if (v2 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v3 = (void *)MEMORY[0x1E0C99E98];
        v4 = objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet"));
      }
      else
      {
        v5 = v2;
        v6 = objc_msgSend(v1, "substringToIndex:", v2);
        v7 = v5 + 1;
        if (v7 < objc_msgSend(v1, "length"))
        {
          v8 = (void *)objc_msgSend(v1, "substringFromIndex:", v7);
          v9 = objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet"));
          v10 = (void *)MEMORY[0x1E0C99E98];
          v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v9);
          v12 = v10;
          return objc_msgSend(v12, "URLWithString:", v11);
        }
        v3 = (void *)MEMORY[0x1E0C99E98];
        v4 = objc_msgSend(v1, "substringFromIndex:", v7);
      }
      v11 = v4;
      v12 = v3;
      return objc_msgSend(v12, "URLWithString:", v11);
    }
  }
  return result;
}

uint64_t DDShouldUseDebugHighlightForResult(uint64_t a1)
{
  if (a1 && _typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("Parsec")))
    DDResultHasContextualFloat(a1);
  return 0;
}

uint64_t DDURLTapAndHoldSchemes()
{
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("tel"), CFSTR("mailto"), CFSTR("x-apple-data-detectors"), 0);
}

uint64_t DDShouldImmediatelyShowActionSheetForResult(uint64_t result)
{
  uint64_t v1;
  int Category;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    Category = DDResultGetCategory(result);
    if ((Category - 4) >= 3)
    {
      if (Category == 2)
      {
        v3 = 0;
        objc_msgSend(+[DDScannerResult resultFromCoreResult:](DDScannerResult, "resultFromCoreResult:", v1), "getPhoneValue:label:", &v3, 0);
        if (MGGetBoolAnswer())
        {
          if (DDTelephonyWillPrompt_sOnce != -1)
            dispatch_once(&DDTelephonyWillPrompt_sOnce, &__block_literal_global_12);
          return DDTelephonyWillPrompt_sandbox_result == 0;
        }
        else
        {
          return 1;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return !_typesAreEqual(*(CFStringRef *)(v1 + 64), CFSTR("Parsec"));
    }
  }
  return result;
}

uint64_t DDShouldImmediatelyShowActionSheetForURL(uint64_t result)
{
  void *v1;
  void *v2;
  int v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = (void *)result;
  result = objc_msgSend(&unk_1E3C9FDD8, "containsObject:", objc_msgSend((id)objc_msgSend((id)result, "scheme"), "lowercaseString"));
  if (!(_DWORD)result)
    return result;
  v2 = (void *)objc_msgSend(v1, "resourceSpecifier");
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("//")))
  {
    if ((unint64_t)objc_msgSend(v2, "length") < 3)
      goto LABEL_32;
    v2 = (void *)objc_msgSend(v2, "substringFromIndex:", 2);
  }
  if (!objc_msgSend(v2, "length"))
    goto LABEL_32;
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("sms"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("?"));
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "firstObject"), "componentsSeparatedByString:", CFSTR("&"));
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
      goto LABEL_12;
    v7 = objc_msgSend(v6, "arrayByAddingObjectsFromArray:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", CFSTR("&")));
  }
  else
  {
    v7 = objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(";"));
  }
  v6 = (void *)v7;
LABEL_12:
  if (objc_msgSend((id)objc_msgSend(v6, "firstObject"), "length"))
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "stringByRemovingPercentEncoding");
    v9 = v8;
    if ((v4 & 1) == 0)
      v9 = (void *)objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR(";"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v9;
      v12 = 0;
      v13 = 1;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          v16 = v12;
          v12 = v13;
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v6);
          if ((v12 & 1) == 0)
          {
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v18 = (void *)objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("="));
            v19 = v18;
            if ((v16 & 1) != 0 && objc_msgSend(v18, "count") == 1)
            {
              if (objc_msgSend(v17, "length")
                && objc_msgSend(v17, "rangeOfCharacterFromSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("1234567890#*")), "invertedSet")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"), v21, v17);
LABEL_41:
                v9 = (void *)v20;
                goto LABEL_33;
              }
            }
            else if (objc_msgSend(v19, "count") == 2
                   && objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 0), "isEqualToString:", CFSTR("ext"))&& objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "length"))
            {
              v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@;%@"),
                      v21,
                      objc_msgSend((id)objc_msgSend(v19, "objectAtIndexedSubscript:", 1), "stringByRemovingPercentEncoding"));
              goto LABEL_41;
            }
          }
          v13 = 0;
        }
        v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v13 = 0;
        if (v11)
          continue;
        break;
      }
      v9 = v21;
    }
    goto LABEL_33;
  }
LABEL_32:
  v9 = 0;
LABEL_33:
  result = objc_msgSend(v9, "length");
  if (result)
  {
    if (MGGetBoolAnswer())
    {
      if (DDTelephonyWillPrompt_sOnce != -1)
        dispatch_once(&DDTelephonyWillPrompt_sOnce, &__block_literal_global_12);
      return DDTelephonyWillPrompt_sandbox_result == 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t DDInternalURLStringForResultIdentifier(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-apple-data-detectors"), a1);
}

uint64_t DDSourcePushFile(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  NSObject *v8;
  uint8_t v9[16];
  uint64_t v10;
  uint64_t v11;

  if (a3 == 1)
  {
    a2 = 0;
    v6 = 1;
    return DDSourcePushSharedDataOrFile(a1, 0, a2, v6, 0);
  }
  if (!a3)
  {
    v6 = 0;
    return DDSourcePushSharedDataOrFile(a1, 0, a2, v6, 0);
  }
  v10 = v3;
  v11 = v4;
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v8 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "Can only compile JSON files", v9, 2u);
  }
  return 0;
}

uint64_t DDSourcePushSharedDataOrFile(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  void *v10;
  DataDetectorsSourceAccess *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[6];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  char v21;

  if (!altPath)
  {
    if ((a1 & 0xFFFFFFFD) == 4)
    {
      if (DDUserSourcesWriteAllowed_sOnce != -1)
        dispatch_once(&DDUserSourcesWriteAllowed_sOnce, &__block_literal_global_20);
      v13 = &DDUserSourcesWriteAllowed_sandbox_result;
    }
    else
    {
      if (DDSystemSourcesWriteAllowed_sOnce != -1)
        dispatch_once(&DDSystemSourcesWriteAllowed_sOnce, &__block_literal_global_24);
      v13 = &DDSystemSourcesWriteAllowed_sandbox_result;
    }
    if (*v13)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DataDetectorsSourceAccess"), 4096);
      if (v10)
        goto LABEL_3;
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v15 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, "Failed to connect to DataDetectorsSourceAccess (writing)", buf, 2u);
      }
    }
    return 0;
  }
  v10 = 0;
LABEL_3:
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = sourceAccessCreateAndEnterGroup(v10, (uint64_t)&__block_literal_global_41);
  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __DDSourcePushSharedDataOrFile_block_invoke_42;
    v17[3] = &unk_1E3C956D8;
    v17[4] = v10;
    v17[5] = buf;
    if (a4 == 1)
      -[DataDetectorsSourceAccess writeSourceFromRawData:source:signature:withReply:](v11, "writeSourceFromRawData:source:signature:withReply:", a2, v12, a5, v17);
    else
      -[DataDetectorsSourceAccess writeSourceFromJSONFile:source:withReply:](v11, "writeSourceFromJSONFile:source:withReply:", a3, v12, v17);

  }
  v14 = v19[24];
  _Block_object_dispose(buf, 8);
  return v14;
}

void sub_19BC2BBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

DataDetectorsSourceAccess *sourceAccessCreateAndEnterGroup(void *a1, uint64_t a2)
{
  DataDetectorsSourceAccess *v4;
  DataDetectorsSourceAccess *v5;
  DataDetectorsSourceAccess *v6;
  DataDetectorsSourceAccess *v7;
  uid_t v8;
  passwd *v9;
  uint64_t pw_uid;
  _QWORD v12[6];

  if (a1)
  {
    objc_msgSend(a1, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40F478));
    objc_msgSend(a1, "resume");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __sourceAccessCreateAndEnterGroup_block_invoke;
    v12[3] = &unk_1E3C95700;
    v12[4] = a1;
    v12[5] = a2;
    v4 = (DataDetectorsSourceAccess *)objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    if (v4)
    {
      v5 = v4;
      v6 = v4;
      return v5;
    }
LABEL_7:
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    return 0;
  }
  v7 = objc_alloc_init(DataDetectorsSourceAccess);
  if (!v7)
    goto LABEL_7;
  v5 = v7;
  v8 = getuid();
  v9 = getpwuid(v8);
  if (v9)
    pw_uid = v9->pw_uid;
  else
    pw_uid = 0;
  -[DataDetectorsSourceAccess setUserIdentifier:](v5, "setUserIdentifier:", pw_uid);
  return v5;
}

uint64_t __sourceAccessCreateAndEnterGroup_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v4 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = a2;
    _os_log_error_impl(&dword_19BC07000, v4, OS_LOG_TYPE_ERROR, "Connection to DataDetectorsSourceAccess failed (%@)", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t DDSourcePushSharedData(uint64_t a1, uint64_t a2)
{
  return DDSourcePushSharedDataOrFile(a1, a2, 0, 1, 0);
}

uint64_t DDSourcePushSharedDataWithSignature(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DDSourcePushSharedDataOrFile(a1, a2, 0, 1, a3);
}

uint64_t DDSourceClear(uint64_t a1)
{
  return DDSourcePushSharedDataOrFile(a1, 0, 0, 1, 0);
}

uint64_t DDPushUserDebugData()
{
  void *v0;
  uint64_t i;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
  for (i = 0; i != 6; ++i)
    objc_msgSend(v0, "addObject:", objc_msgSend((id)qword_1E3C95720[i], "mutableCopy"));
  return DDSourcePushSharedDataOrFile(6, (uint64_t)v0, 0, 1, 0);
}

id DDSourceGetLexiconData(uint64_t a1)
{
  uint64_t v1;
  id v2;
  int8x16_t v4;
  void *v5;
  off_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  char v14[256];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__1460;
  v12 = __Block_byref_object_dispose__1461;
  v13 = 0;
  if ((a1 & 0xFFFFFFFD) == 4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __DDSourceGetLexiconData_block_invoke;
    v7[3] = &unk_1E3C95620;
    v7[4] = &v8;
    mmapSource(a1, 1, (uint64_t)v7);
  }
  else if (_DDTriePathForSource(a1, v14, 1, 1, 0))
  {
    v5 = 0;
    v6 = 0;
    v4 = 0uLL;
    if (DDautommap(v14, &v5, &v6, &v4))
    {
      if (v5)
      {
        if (v6)
        {
          v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v5, v6, &__block_literal_global_31_1464);
          v9[5] = v1;
        }
        else
        {
          munmap(v5, 0);
        }
      }
    }
  }
  v2 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_19BC2C144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1460(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1461(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void mmapSource(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  DataDetectorsSourceAccess *v8;
  DataDetectorsSourceAccess *v9;
  NSObject *v10;
  _QWORD v11[8];
  _QWORD v12[4];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  if (altPath)
  {
    v6 = 0;
    goto LABEL_8;
  }
  if ((a1 & 0xFFFFFFFD) != 4)
    goto LABEL_7;
  if (DDUserSourcesReadAllowed_sOnce != -1)
    dispatch_once(&DDUserSourcesReadAllowed_sOnce, &__block_literal_global_16);
  if (DDUserSourcesReadAllowed_sandbox_result)
  {
LABEL_7:
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DataDetectorsSourceAccess"), 4096);
    if (v6)
    {
LABEL_8:
      v7 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __mmapSource_block_invoke;
      v17[3] = &unk_1E3C95668;
      v17[4] = a3;
      v8 = sourceAccessCreateAndEnterGroup(v6, (uint64_t)v17);
      if (v8)
      {
        v9 = v8;
        *(_QWORD *)buf = 0;
        v14 = buf;
        v15 = 0x2020000000;
        v16 = 0;
        v12[0] = 0;
        v12[1] = v12;
        v12[2] = 0x2020000000;
        v12[3] = 0;
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __mmapSource_block_invoke_37;
        v11[3] = &unk_1E3C95690;
        v11[6] = v12;
        v11[7] = buf;
        v11[4] = v6;
        v11[5] = a3;
        -[DataDetectorsSourceAccess fileForSourceRead:resourceType:withReply:](v8, "fileForSourceRead:resourceType:withReply:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1), a2 != 0, v11);

        _Block_object_dispose(v12, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
      }
      return;
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "Failed to connect to DataDetectorsSourceAccess (reading)", buf, 2u);
    }
  }
}

void sub_19BC2C41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __mmapSource_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19BC07000, v2, OS_LOG_TYPE_ERROR, "Failed to use DataDetectorsSourceAccess (reading)", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __mmapSource_block_invoke_37(uint64_t a1, void *a2)
{
  int v4;
  size_t v5;
  void *v6;

  if (a2)
  {
    v4 = objc_msgSend(a2, "fileDescriptor");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(a2, "seekToEndOfFile");
    if (v4 >= 3)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v5)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = _DDmmap((uint64_t)"<Service accessed>", v4, v5);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "invalidate");

  }
}

_BYTE *DDSourceGetClientSignature(uint64_t a1)
{
  void **v1;
  uint64_t v2;
  _BYTE *v3;
  int *v4;
  _QWORD *v5;
  CFTypeRef cf;

  cf = 0;
  DDLookupTableUpdateFromExternalFile(a1, (unsigned __int16 **)&cf, 0);
  v1 = (void **)cf;
  if (!cf)
  {
    v3 = 0;
    return v3;
  }
  v2 = *((_QWORD *)cf + 3);
  if (!v2 || *(uint64_t *)(v2 + 112) < 1)
    goto LABEL_8;
  v3 = *(_BYTE **)(v2 + 64);
  if (!v3)
    goto LABEL_9;
  if (!*v3)
  {
LABEL_8:
    v3 = 0;
LABEL_9:
    v5 = v1 + 4;
    v4 = (int *)v1[4];
    if (v4)
    {
      munmap(v1[4], v4[1]);
      v5[1] = 0;
      v5[2] = 0;
      *v5 = 0;
      v1 = (void **)cf;
    }
    goto LABEL_11;
  }
  v3 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v3);
  v1 = (void **)cf;
  if (cf)
    goto LABEL_9;
LABEL_11:
  CFRelease(v1);
  return v3;
}

void DDExternalTableAppendEntries(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (a2 <= 7)
  {
    memset(v3, 0, sizeof(v3));
    *((_QWORD *)v3 + a2) = a3;
    _DDSourceUpdateSourceWithContent(a1, (uint64_t)v3, 0, 0, 8);
  }
}

uint64_t DDExternalTableWriteAtPath(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  UInt8 *FinalizedSourceContent;
  UInt8 *v4;
  void *v5;
  uint64_t v7;

  v2 = a2;
  if (a2)
  {
    if (a1)
    {
      FinalizedSourceContent = (UInt8 *)DDSourceCreateFinalizedSourceContent(a1);
      if (FinalizedSourceContent)
      {
        v4 = FinalizedSourceContent;
        v2 = -[UInt8 writeToFile:atomically:](FinalizedSourceContent, "writeToFile:atomically:", v2, 1);
        CFRelease(v4);
        return v2;
      }
    }
    else
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      if (!objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v2, 0))
        return 1;
      v7 = 0;
      objc_msgSend(v5, "removeItemAtPath:error:", v2, &v7);
    }
    return 0;
  }
  return v2;
}

void DDLRTableDestroy(_QWORD *a1)
{
  const void *v2;
  void *v3;
  const void *v4;

  if (a1)
  {
    v2 = (const void *)a1[10];
    if (v2)
      CFRelease(v2);
    v3 = (void *)a1[1];
    if (v3)
      free(v3);
    v4 = (const void *)a1[9];
    if (v4)
      CFRelease(v4);
    free(a1);
  }
}

uint64_t DDForce24HrsFormatProcessWideForExtraction(uint64_t result)
{
  sForce24HrsFormat = result;
  return result;
}

void *DDCreateTimeZoneValuesFromResultValue(CFStringRef theString)
{
  const __CFAllocator *v2;
  CFArrayRef ArrayBySeparatingStrings;
  const __CFDictionary *v4;
  const void *ValueAtIndex;
  const __CFArray *Value;
  void *Copy;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  CFStringRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (theString)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, CFSTR("|"));
    if (CFArrayGetCount(ArrayBySeparatingStrings) <= 1)
    {
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
      {
        Copy = (void *)CFRetain(ArrayBySeparatingStrings);
LABEL_9:
        v8 = Copy;
        CFRelease(ArrayBySeparatingStrings);
        if (v8)
          return v8;
        goto LABEL_16;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v9 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_19BC07000, v9, OS_LOG_TYPE_ERROR, "We've shouldn't have 0 items for a time zone value", (uint8_t *)&v12, 2u);
      }
    }
    else
    {
      if (DDCreateTimeZoneValuesFromResultValue_sOnce != -1)
        dispatch_once(&DDCreateTimeZoneValuesFromResultValue_sOnce, &__block_literal_global_1488);
      v4 = (const __CFDictionary *)DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist;
      if (DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 1);
        Value = (const __CFArray *)CFDictionaryGetValue(v4, ValueAtIndex);
        Copy = CFArrayCreateCopy(v2, Value);
        goto LABEL_9;
      }
    }
    CFRelease(ArrayBySeparatingStrings);
  }
LABEL_16:
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v10 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = theString;
    _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "Couldn't extract time zone values for %@", (uint8_t *)&v12, 0xCu);
  }
  return 0;
}

const __CFString *createPropertyListForResource(const __CFString *a1)
{
  const __CFString *v1;
  CFStringRef v2;
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v4;
  __CFBundle *MainBundle;
  const __CFData *v6;
  const __CFData *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  CFStringRef v15;
  uint64_t v16;

  v1 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@.%@"), a1, CFSTR("plist"));
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.datadetectorscore.tests"));
    if ((BundleWithIdentifier
       || (BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.datadetectorscore"))) != 0)
      && (v4 = CFBundleCopyResourceURL(BundleWithIdentifier, v1, CFSTR("plist"), 0)) != 0
      || (MainBundle = CFBundleGetMainBundle(),
          (v4 = CFBundleCopyResourceURL(MainBundle, v1, CFSTR("plist"), 0)) != 0))
    {
      v6 = DDCreateDataFromFileAtUrl(v4);
      if (v6)
      {
        v7 = v6;
        v1 = (const __CFString *)CFPropertyListCreateWithData(0, v6, 0, 0, 0);
        CFRelease(v7);
        CFRelease(v4);
        if (v1)
        {
LABEL_22:
          CFRelease(v2);
          return v1;
        }
      }
      else
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v8 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v13 = v4;
          v14 = 2112;
          v15 = v2;
          _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "DDCreateDataFromFileAtUrl failed on %@, could not find %@", buf, 0x16u);
        }
        CFRelease(v4);
      }
    }
    else
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v9 = DDLogHandle_error_log_handle;
      if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_DWORD *)buf = 138412290;
      v13 = (void *)v2;
      _os_log_error_impl(&dword_19BC07000, v9, OS_LOG_TYPE_ERROR, "Could not find %@", buf, 0xCu);
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
LABEL_19:
    v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = (void *)v2;
      _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "Could not load %@", buf, 0xCu);
    }
    v1 = 0;
    goto LABEL_22;
  }
  return v1;
}

uint64_t extractHourMinuteSecondWithRefCopyTimeZone(uint64_t result, uint64_t a2, const __CFLocale *a3, int *a4, _DWORD *a5, _DWORD *a6, CFTimeZoneRef *a7, unsigned int a8, signed int a9, int a10, uint64_t a11)
{
  uint64_t v16;
  const __CFArray *v18;
  NSObject *v19;
  const __CFString **v20;
  const __CFString **v21;
  const __CFString **v22;
  const __CFString *v23;
  int v24;
  __CFString *DetailedDescription;
  NSObject *v26;
  const char *v27;
  const __CFString *SubresultWithType;
  const __CFString *v29;
  int v30;
  const __CFString **v31;
  const __CFString **v32;
  const __CFString *v33;
  const __CFString **v34;
  const __CFString **v35;
  const __CFString *v36;
  const __CFString **v37;
  CFTimeZoneRef v38;
  const __CFString **v39;
  uint64_t v42;
  uint8_t buf[4];
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v16 = result;
  while (1)
  {
    if (!_typesAreEqual(*(CFStringRef *)(v16 + 64), CFSTR("Timestamp")))
    {
      if (DDResultGetSubresultWithType(v16, CFSTR("ApproxTime")) && !DDResultGetSubresultWithType(v16, CFSTR("Hours")))
      {
        *(_DWORD *)buf = 0;
        SubresultWithType = (const __CFString *)DDResultGetSubresultWithType(v16, CFSTR("ApproxTime"));
        if (SubresultWithType)
        {
          v29 = SubresultWithType;
          SubresultWithType = (const __CFString *)SubresultWithType[2].data;
          if (!SubresultWithType)
            SubresultWithType = (const __CFString *)v29[2].info;
        }
        result = extractHourFromApproxTimeValue(SubresultWithType, (int *)buf, a3);
        if (!(_DWORD)result)
          return result;
        if (a4)
          *a4 = *(_DWORD *)buf;
        if (a5)
          *a5 = 0;
        if (a6)
          *a6 = 0;
      }
      else
      {
        if (!_typesAreEqual(*(CFStringRef *)(v16 + 64), CFSTR("Time")))
        {
          DetailedDescription = createDetailedDescription((_QWORD *)v16);
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v26 = DDLogHandle_error_log_handle;
          if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
            goto LABEL_65;
          *(_DWORD *)buf = 138412290;
          v44 = DetailedDescription;
          v27 = "Could not parse %@";
          goto LABEL_64;
        }
        v39 = DDResultGetSubresultWithType(v16, CFSTR("Meridian"));
        v20 = DDResultGetSubresultWithType(v16, CFSTR("Hours"));
        v42 = 0;
        v21 = DDResultGetSubresultWithType(v16, CFSTR("Minutes"));
        if (v21)
        {
          v22 = v21;
          v23 = v21[10];
          if (!v23)
            v23 = v22[9];
          if ((extractInteger(v23, (_DWORD *)&v42 + 1) & 1) == 0)
            return 0;
          v24 = hourValueForHourAndMeridianResult((uint64_t)v20, a2, a3, (uint64_t)v39, a8, a9, a10, a11, HIDWORD(v42) == 0);
          if (v24 < 0)
            goto LABEL_60;
        }
        else
        {
          v30 = hourValueForHourAndMeridianResult((uint64_t)v20, a2, a3, (uint64_t)v39, a8, a9, a10, a11, 1);
          if (v30 < 0)
          {
LABEL_60:
            DetailedDescription = createDetailedDescription((_QWORD *)v16);
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v26 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              goto LABEL_65;
            *(_DWORD *)buf = 138412290;
            v44 = DetailedDescription;
            v27 = "Time with no hour: %@";
LABEL_64:
            _os_log_error_impl(&dword_19BC07000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
LABEL_65:
            CFRelease(DetailedDescription);
            return 0;
          }
          v24 = v30;
          v31 = DDResultGetSubresultWithType(v16, CFSTR("MinutesBefore"));
          if (v31)
          {
            v32 = v31;
            v33 = v31[10];
            if (!v33)
              v33 = v32[9];
            result = extractInteger(v33, (_DWORD *)&v42 + 1);
            if (!(_DWORD)result)
              return result;
            if (HIDWORD(v42) > 0x3B)
              return 0;
            if (HIDWORD(v42))
            {
              HIDWORD(v42) = 60 - HIDWORD(v42);
              if (v24)
                --v24;
              else
                v24 = 23;
            }
          }
        }
        v34 = DDResultGetSubresultWithType(v16, CFSTR("Seconds"));
        if (v34)
        {
          v35 = v34;
          v36 = v34[10];
          if (!v36)
            v36 = v35[9];
          result = extractInteger(v36, &v42);
          if (!(_DWORD)result)
            return result;
        }
        if (a4)
          *a4 = v24;
        if (a5)
          *a5 = HIDWORD(v42);
        if (a6)
          *a6 = v42;
        if (a7)
        {
          v37 = DDResultGetSubresultWithType(v16, CFSTR("TimeZone"));
          if (v37)
          {
            v38 = DDCreateTimeZoneWithResult((uint64_t)v37);
            if (v38)
              *a7 = v38;
          }
        }
      }
      return 1;
    }
    v18 = *(const __CFArray **)(v16 + 56);
    if (!v18 || CFArrayGetCount(*(CFArrayRef *)(v16 + 56)) != 1)
      break;
    result = (uint64_t)CFArrayGetValueAtIndex(v18, 0);
    v16 = result;
    a10 = -1;
    if (!result)
      return result;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v19 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BC07000, v19, OS_LOG_TYPE_ERROR, "Wrong number of results", buf, 2u);
    return 0;
  }
  return result;
}

uint64_t extractHourFromApproxTimeValue(CFStringRef theString1, int *a2, CFLocaleRef locale)
{
  const __CFString *Value;
  const __CFString *v6;
  int v7;
  int v8;

  if (!locale)
    goto LABEL_28;
  Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  if (!Value)
    goto LABEL_28;
  v6 = Value;
  if (CFStringCompare(CFSTR("MX"), Value, 0)
    && CFStringCompare(CFSTR("ES"), v6, 0)
    && CFStringCompare(CFSTR("PT"), v6, 0)
    && CFStringCompare(CFSTR("IT"), v6, 0)
    && CFStringCompare(CFSTR("GR"), v6, 0)
    && CFStringCompare(CFSTR("TR"), v6, 0)
    && CFStringCompare(CFSTR("LB"), v6, 0)
    && CFStringCompare(CFSTR("IL"), v6, 0)
    && CFStringCompare(CFSTR("EG"), v6, 0)
    && CFStringCompare(CFSTR("DZ"), v6, 0)
    && CFStringCompare(CFSTR("TN"), v6, 0)
    && CFStringCompare(CFSTR("MA"), v6, 0))
  {
    if (CFStringCompare(CFSTR("CA"), v6, 0)
      && CFStringCompare(CFSTR("RU"), v6, 0)
      && CFStringCompare(CFSTR("UA"), v6, 0)
      && CFStringCompare(CFSTR("BY"), v6, 0)
      && CFStringCompare(CFSTR("SE"), v6, 0)
      && CFStringCompare(CFSTR("NO"), v6, 0)
      && CFStringCompare(CFSTR("FI"), v6, 0)
      && CFStringCompare(CFSTR("DE"), v6, 0)
      && CFStringCompare(CFSTR("PL"), v6, 0)
      && CFStringCompare(CFSTR("IE"), v6, 0)
      && CFStringCompare(CFSTR("GB"), v6, 0))
    {
      if (CFStringCompare(CFSTR("FR"), v6, 0) && CFStringCompare(CFSTR("KR"), v6, 0))
      {
LABEL_28:
        v7 = 19;
        v8 = 18;
        goto LABEL_30;
      }
      v8 = 19;
      v7 = 19;
    }
    else
    {
      v7 = 18;
      v8 = 17;
    }
  }
  else
  {
    v7 = 20;
    v8 = 19;
  }
LABEL_30:
  if (CFStringCompare(theString1, CFSTR("morning"), 0))
  {
    if (CFStringCompare(theString1, CFSTR("brunch"), 0))
    {
      if (CFStringCompare(theString1, CFSTR("noon"), 0))
      {
        if (CFStringCompare(theString1, CFSTR("afternoon"), 0))
        {
          if (CFStringCompare(theString1, CFSTR("evening"), 0))
          {
            if (CFStringCompare(theString1, CFSTR("dinner"), 0) && CFStringCompare(theString1, CFSTR("night"), 0))
            {
              v8 = v7;
              if (CFStringCompare(theString1, CFSTR("tonight"), 0))
                return 0;
            }
            else
            {
              v8 = v7;
            }
          }
        }
        else
        {
          v8 = 15;
        }
      }
      else
      {
        v8 = 12;
      }
    }
    else
    {
      v8 = 11;
    }
  }
  else
  {
    v8 = 9;
  }
  *a2 = v8;
  return 1;
}

uint64_t hourValueForHourAndMeridianResult(uint64_t a1, uint64_t a2, const __CFLocale *a3, uint64_t a4, unsigned int a5, signed int a6, int a7, uint64_t a8, char a9)
{
  uint64_t result;
  const __CFString *v18;
  BOOL v19;
  int v20;
  int v21;
  int v22;
  unsigned int v24;
  unsigned int v25;
  __int16 v26;
  __int16 v27;
  unsigned int v28;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v28 = -1;
    v18 = *(const __CFString **)(a1 + 80);
    if (!v18)
      v18 = *(const __CFString **)(a1 + 72);
    if (!extractInteger(v18, &v28))
      return 0xFFFFFFFFLL;
    if (!a4)
    {
      if (a8)
      {
        v19 = __OFSUB__(v28, 12);
        if ((int)v28 <= 12)
        {
          if ((a5 & 0x80000000) != 0
            && (v19 = __OFSUB__(a6, 12), a6 <= 0xC)
            && (v19 = __OFSUB__(v28, a6), (int)v28 >= a6)
            || (a5 & 0x80000000) == 0 && a6 < 0 && (v19 = __OFSUB__(v28, a5 % 0xC), (int)v28 < (int)(a5 % 0xC)))
          {
            a4 = a8;
          }
          else if (((a6 & a5 & 0x80000000) != 0) != v19)
          {
            a4 = a8;
          }
          else
          {
            a4 = 0;
          }
        }
      }
    }
    v27 = 0;
    v26 = 0;
    v20 = extractMeridianValue(a4, &v27, (_BYTE *)&v27 + 1, &v26, (_BYTE *)&v26 + 1);
    if (v20)
      goto LABEL_20;
    if (sForce24HrsFormat
      || localeHasStrict24Hrs((uint64_t)a3)
      || hourResultIsObvious24Hrs(a2))
    {
      return v28;
    }
    if (v18 && v28 && CFStringGetLength(v18) >= 1 && CFStringGetCharacterAtIndex(v18, 0) == 48)
    {
      v20 = 1;
      v22 = v28;
      v21 = 1;
    }
    else
    {
LABEL_20:
      v21 = v27;
      v22 = v28;
      if (v28 - 12 >= 0xFFFFFFF5 && !(_BYTE)v27)
      {
        if (HIBYTE(v27) || v28 <= 6 && (_BYTE)v26 || v28 >= 6 && HIBYTE(v26))
        {
          v22 = v28 + 12;
LABEL_47:
          v28 = v22;
        }
LABEL_48:
        if (v20 || !a6 || v22 < 1)
          return v28;
        if (a7 == -1 && v22 <= 7)
        {
          return (v22 + 12);
        }
        else
        {
          v24 = v22 + 12;
          if (v22 >= a7 || v22 > 0xB || (int)v24 < a7)
          {
            if ((int)a5 < 12)
            {
              if (v22 >= a6)
                return v28;
            }
            else if (v22 >= a6 && v24 > a5)
            {
              return v28;
            }
          }
        }
        return v24;
      }
    }
    if (v22 == 12 && v20 && !(_BYTE)v26)
    {
      if (HIBYTE(v26))
      {
        if (a9)
          return 24;
        else
          return 0;
      }
      else
      {
        if (v21)
        {
          if (!locale12PMIsMidnight(a3))
            return 0;
          if (a9)
            return v28;
        }
        else
        {
          if (!HIBYTE(v27))
            return v28;
          v25 = locale12PMIsMidnight(a3);
          if (!a9 || !v25)
            return v28;
        }
        return 24;
      }
    }
    if (!v22 && HIBYTE(v27))
    {
      v22 = 12;
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  return result;
}

__CFString *createDetailedDescription(_QWORD *a1)
{
  __CFString *Mutable;
  uint64_t v3;
  const __CFArray *v4;
  CFIndex i;
  _QWORD *ValueAtIndex;
  uint64_t v7;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("type = %@, range = %ld/%ld, matched string = \"%@\""), a1[8], a1[4], a1[5], a1[9]);
  if (a1[6])
    CFStringAppendFormat(Mutable, 0, CFSTR(", score = %ld"), a1[6]);
  v3 = a1[10];
  if (v3 || (v3 = a1[9]) != 0)
    CFStringAppendFormat(Mutable, 0, CFSTR(", value = %@"), v3);
  v4 = (const __CFArray *)a1[7];
  if (v4 && CFArrayGetCount(v4))
  {
    CFStringAppend(Mutable, CFSTR("\nSubresults = {\n"));
    for (i = 0; i < CFArrayGetCount(v4); ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
      v7 = ValueAtIndex[10];
      if (!v7)
        v7 = ValueAtIndex[9];
      CFStringAppendFormat(Mutable, 0, CFSTR("(%@:%@)\n"), ValueAtIndex[8], v7);
    }
    CFStringAppend(Mutable, CFSTR("}"));
  }
  return Mutable;
}

CFTimeZoneRef DDCreateTimeZoneWithResult(uint64_t a1)
{
  const __CFString **SubresultWithType;
  const __CFString *v3;
  const __CFAllocator *v4;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v6;
  const __CFString *v7;
  CFTimeZoneRef v8;
  const __CFString *ValueAtIndex;
  const __CFString **v10;
  const __CFString *v11;
  int v12;
  const __CFString **v13;
  const __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString **v20;
  const __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  const __CFString *v25;
  int v26;
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("OlsonTimeZone"));
  if (!SubresultWithType || (v3 = SubresultWithType[10]) == 0 && (v3 = SubresultWithType[9]) == 0)
  {
    v10 = DDResultGetSubresultWithType(a1, CFSTR("Hours"));
    if (v10)
    {
      v11 = v10[10];
      if (v11 || (v11 = v10[9]) != 0)
      {
        v26 = 0;
        if ((extractInteger(v11, &v26) & 1) == 0)
        {
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
          v18 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v11;
            _os_log_error_impl(&dword_19BC07000, v18, OS_LOG_TYPE_ERROR, "Could not extract hour offset for time zone (%@)", buf, 0xCu);
          }
          goto LABEL_57;
        }
        v12 = 3600 * v26;
        v13 = DDResultGetSubresultWithType(a1, CFSTR("Minutes"));
        if (v13)
        {
          v14 = v13[10];
          if (v14 || (v14 = v13[9]) != 0)
          {
            if ((extractInteger(v14, &v26) & 1) != 0)
            {
              v12 += 60 * v26;
            }
            else
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v19 = DDLogHandle_error_log_handle;
              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v14;
                _os_log_error_impl(&dword_19BC07000, v19, OS_LOG_TYPE_ERROR, "Could not extract minute offset for time zone (%@), ignoring", buf, 0xCu);
              }
            }
          }
        }
        if (v12 > 64800)
          return 0;
        v20 = DDResultGetSubresultWithType(a1, CFSTR("Sign"));
        if (v20)
        {
          v21 = v20[10];
          if (v21 || (v21 = v20[9]) != 0)
          {
            if (CFStringCompare(v21, CFSTR("-"), 0))
            {
              if (CFStringCompare(v21, CFSTR("+"), 0))
              {
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v22 = DDLogHandle_error_log_handle;
                if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v28 = v21;
                  _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, "Could not extract sign for time zone offset (%@), considering a positive offset", buf, 0xCu);
                }
              }
            }
            else
            {
              v12 = -v12;
            }
          }
        }
        v8 = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (double)v12);
        if (!v8)
          goto LABEL_57;
        return v8;
      }
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v16 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_59;
    if (a1)
    {
      v17 = *(const __CFString **)(a1 + 80);
      if (!v17)
        v17 = *(const __CFString **)(a1 + 72);
    }
    else
    {
      v17 = 0;
    }
    *(_DWORD *)buf = 138412290;
    v28 = v17;
    _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "Relative time zone without value (%@)", buf, 0xCu);
    goto LABEL_57;
  }
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, CFSTR("|"));
  v6 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v15 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      if (!v6)
        goto LABEL_57;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v28 = v3;
    _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, "Unexpected error while extracting time zone (%@)", buf, 0xCu);
    if (v6)
LABEL_24:
      CFRelease(v6);
LABEL_57:
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
LABEL_59:
    v23 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      if (a1)
      {
        v25 = *(const __CFString **)(a1 + 80);
        if (!v25)
          v25 = *(const __CFString **)(a1 + 72);
      }
      else
      {
        v25 = 0;
      }
      *(_DWORD *)buf = 138412290;
      v28 = v25;
      _os_log_error_impl(&dword_19BC07000, v23, OS_LOG_TYPE_ERROR, "CFTimeZoneCreateWithName failed for %@", buf, 0xCu);
    }
    return 0;
  }
  if (CFArrayGetCount(v6) != 2
    || (v7 = (const __CFString *)CFArrayGetValueAtIndex(v6, 1), (v8 = CFTimeZoneCreateWithName(v4, v7, 1u)) == 0))
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
    v8 = CFTimeZoneCreateWithName(v4, ValueAtIndex, 1u);
  }
  CFRelease(v6);
  if (!v8)
    goto LABEL_57;
  return v8;
}

uint64_t extractMeridianValue(uint64_t result, _BYTE *a2, _BYTE *a3, _BYTE *a4, _BYTE *a5)
{
  CFStringRef *v9;
  const __CFString *v10;

  if (result)
  {
    v9 = (CFStringRef *)result;
    if (_typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("Meridian"))
      || _typesAreEqual(v9[8], CFSTR("ApproxTime"))
      || (result = _typesAreEqual(v9[8], CFSTR("SpecialDateTime")), (_DWORD)result))
    {
      v10 = v9[10];
      if (!v10)
      {
        v10 = v9[9];
        if (!v10)
          return 0;
      }
      if (CFStringGetLength(v10) < 2)
        return 0;
      if (CFStringCompare(v10, CFSTR("am"), 0) && CFStringCompare(v10, CFSTR("morning"), 0))
      {
        if (CFStringCompare(v10, CFSTR("pm"), 0)
          && CFStringCompare(v10, CFSTR("afternoon"), 0)
          && CFStringCompare(v10, CFSTR("evening"), 0))
        {
          a2 = a3;
          if (CFStringCompare(v10, CFSTR("dinner"), 0))
          {
            a2 = a5;
            if (CFStringCompare(v10, CFSTR("night"), 0))
            {
              if (CFStringCompare(v10, CFSTR("day"), 0) && CFStringCompare(v10, CFSTR("brunch"), 0))
              {
                a2 = a4;
                if (CFStringCompare(v10, CFSTR("noon"), 0))
                  return 0;
              }
              else
              {
                a2 = a4;
              }
            }
          }
        }
        else
        {
          a2 = a3;
        }
      }
      result = 1;
      *a2 = 1;
    }
  }
  return result;
}

uint64_t localeHasStrict24Hrs(uint64_t result)
{
  const __CFString *v1;
  BOOL v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;
  UniChar buffer;
  __int16 v9;
  CFRange v10;

  if (result)
  {
    result = (uint64_t)CFLocaleGetValue((CFLocaleRef)result, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
    if (result)
    {
      v1 = (const __CFString *)result;
      if (CFStringGetLength((CFStringRef)result) < 2)
      {
        return 0;
      }
      else
      {
        v10.location = 0;
        v10.length = 2;
        CFStringGetCharacters(v1, v10, &buffer);
        if (buffer == 65 && v9 == 88)
          return 1;
        if (buffer == 66 && v9 == 81)
          return 1;
        v2 = v9 == 80 || v9 == 90;
        v3 = v2;
        if (buffer == 67 && v3)
          return 1;
        if (buffer == 68 && v9 == 75)
          return 1;
        if (buffer == 70 && v9 == 73)
          return 1;
        v4 = v9 == 68 || v9 == 83;
        v5 = v4;
        return buffer == 73 && v5
            || buffer == 77 && v9 == 76
            || buffer == 78 && v9 == 69
            || buffer == 82 && v9 == 85
            || (v9 == 69 || (v9 & 0xFFFE) == 74) && buffer == 83;
      }
    }
  }
  return result;
}

uint64_t hourResultIsObvious24Hrs(uint64_t result)
{
  uint64_t v1;
  const __CFString *v2;
  int v3;

  v3 = -1;
  if (result)
  {
    v1 = result;
    v2 = *(const __CFString **)(result + 80);
    if (!v2)
      v2 = *(const __CFString **)(v1 + 72);
    result = extractInteger(v2, &v3);
    if ((_DWORD)result)
      return v3 > 12;
  }
  return result;
}

const __CFLocale *locale12PMIsMidnight(const __CFLocale *result)
{
  const __CFLocale *v1;
  const __CFString *Value;

  if (result)
  {
    v1 = result;
    Value = (const __CFString *)CFLocaleGetValue(result, (CFLocaleKey)*MEMORY[0x1E0C9B088]);
    if (!Value || (result = (const __CFLocale *)CFStringHasPrefix(Value, CFSTR("ja")), !(_DWORD)result))
    {
      result = (const __CFLocale *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
      if (result)
        return (const __CFLocale *)(CFStringCompare(CFSTR("JP"), (CFStringRef)result, 0) == kCFCompareEqualTo);
    }
  }
  return result;
}

uint64_t __extractInteger_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = extractInteger_numberParser;
  if (extractInteger_numberParser)
  {
    result = CFNumberFormatterGetValueFromString((CFNumberFormatterRef)extractInteger_numberParser, *(CFStringRef *)(a1 + 40), 0, kCFNumberIntType, *(void **)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 0;
  }
  return result;
}

dispatch_queue_t __extractInteger_block_invoke_237()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.datadetectors.extraction.uint", 0);
  extractInteger_sQueue = (uint64_t)result;
  return result;
}

void __extractInteger_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (!extractInteger_numberParser)
  {
    if (getLocaleForExtraction_sOnce != -1)
      dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
    extractInteger_numberParser = (uint64_t)CFNumberFormatterCreate(0, (CFLocaleRef)_sLocaleForExtraction, kCFNumberFormatterDecimalStyle);
    if (!extractInteger_numberParser)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v0 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v1 = 0;
        _os_log_error_impl(&dword_19BC07000, v0, OS_LOG_TYPE_ERROR, "Number parser initialization failed", v1, 2u);
      }
    }
  }
}

uint64_t DDResultCopyExtractedDateFromReferenceDateWithLocale(uint64_t a1, const __CFLocale *a2, const void *a3, const void *a4, BOOL *a5, CFDateRef *a6, CFTypeRef *a7)
{
  __CFCalendar *v14;
  __CFCalendar *v15;
  uint64_t v16;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = _copyDefaultCalendar();
  if (v14)
  {
    v15 = v14;
    v16 = DDResultCopyExtractedDateFromReferenceDateRec(a1, a2, v14, a3, a4, a5, a6, a7, 0);
    CFRelease(v15);
    return v16;
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v18 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "DDResultCopyExtractedDateFromReferenceDateWithLocale";
      _os_log_error_impl(&dword_19BC07000, v18, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", buf, 0xCu);
    }
    return 0;
  }
}

uint64_t DDApplyTimeOffset(uint64_t a1, __CFCalendar *a2, CFAbsoluteTime *a3, BOOL *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t result;

  v8 = DDGetUnitValueFromSubBinder(a1, CFSTR("Months"));
  v9 = DDGetUnitValueFromSubBinder(a1, CFSTR("Days"));
  v10 = DDGetUnitValueFromSubBinder(a1, CFSTR("Hours"));
  v11 = DDGetUnitValueFromSubBinder(a1, CFSTR("Minutes"));
  v12 = v11;
  result = CFCalendarAddComponents(a2, a3, 0, "MdHm", v8, v9, v10, v11);
  if (a4)
  {
    if ((_DWORD)result)
      *a4 = (v12 | v10) == 0;
  }
  return result;
}

uint64_t DDGetUnitValueFromSubBinder(uint64_t a1, const __CFString *a2)
{
  const __CFString **SubresultWithType;
  const __CFString **v3;
  const __CFString *v4;
  unsigned int v6;

  SubresultWithType = DDResultGetSubresultWithType(a1, a2);
  if (!SubresultWithType)
    return 0;
  v3 = SubresultWithType;
  v6 = 0;
  v4 = SubresultWithType[10];
  if (!v4)
    v4 = v3[9];
  if ((extractInteger(v4, &v6) & 1) != 0)
    return v6;
  else
    return 0;
}

uint64_t extractDMYFromAmbiguousForm(CFIndex Count, const __CFLocale *a2, _DWORD *a3, int *a4, int *a5)
{
  CFIndex v5;
  const __CFArray *v6;
  uint64_t v12;
  CFIndex v13;
  unsigned int *v14;
  const __CFString *ValueAtIndex;
  const __CFString *v16;
  uint64_t Integer;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  uint64_t *v24;
  const __CFString *DateFormatFromTemplate;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  CFIndex Length;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFIndex v37;
  size_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  unsigned int v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  int v65;
  BOOL v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  CFIndex v73;
  _QWORD block[5];
  unsigned int v75[3];
  uint64_t v76;
  CFRange v77;

  v5 = Count;
  v76 = *MEMORY[0x1E0C80C00];
  v6 = *(const __CFArray **)(Count + 56);
  if (!v6
    || (Count = CFArrayGetCount(*(CFArrayRef *)(Count + 56)), (unint64_t)(Count - 4) <= 0xFFFFFFFFFFFFFFFDLL))
  {
    DDLogErrD(Count, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, CFSTR("bad subresult %@"), v5);
    return 0;
  }
  v12 = Count;
  v13 = 0;
  v14 = v75;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v13);
    if (ValueAtIndex)
    {
      v16 = ValueAtIndex;
      ValueAtIndex = (const __CFString *)ValueAtIndex[2].data;
      if (!ValueAtIndex)
        ValueAtIndex = (const __CFString *)v16[2].info;
    }
    Integer = extractInteger(ValueAtIndex, v14);
    if ((Integer & 1) == 0)
    {
      DDLogErrD(Integer, v18, v19, v20, v21, CFSTR("could not extract integer at %ld from %@"), v13, v5);
      return 0;
    }
    ++v13;
    ++v14;
  }
  while (v12 != v13);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __extractDMYFromAmbiguousForm_block_invoke;
  block[3] = &__block_descriptor_tmp_149;
  block[4] = a2;
  if (extractDMYFromAmbiguousForm_sOnce != -1)
    dispatch_once(&extractDMYFromAmbiguousForm_sOnce, block);
  v22 = (const void *)extractDMYFromAmbiguousForm_sFormatLocale;
  if (extractDMYFromAmbiguousForm_sFormatLocale && (v23 = (const void *)MEMORY[0x1A1ACA418](a2), CFEqual(v22, v23)))
  {
    v24 = &extractDMYFromAmbiguousForm_sFormat2;
    if (v12 != 2)
      v24 = &extractDMYFromAmbiguousForm_sFormat3;
    DateFormatFromTemplate = (const __CFString *)CFRetain((CFTypeRef)*v24);
  }
  else
  {
    if (v12 == 3)
      v30 = CFSTR("yMd");
    else
      v30 = CFSTR("Md");
    DateFormatFromTemplate = CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v30, 0, a2);
  }
  v31 = DateFormatFromTemplate;
  if (!DateFormatFromTemplate)
  {
    DDLogErrD(0, v26, v27, v28, v29, CFSTR("could not get the date format string from the current locale"));
    return 0;
  }
  Length = CFStringGetLength(DateFormatFromTemplate);
  v73 = Length;
  if (Length >= 100)
  {
    DDLogErrD(Length, v33, v34, v35, v36, CFSTR("format length too long"));
    CFRelease(v31);
    return 0;
  }
  v37 = Length;
  v38 = Length + 1;
  v39 = (char *)&v72 - ((MEMORY[0x1E0C80A78](Length) + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v39, v38);
  v77.location = 0;
  v77.length = v37;
  CFStringGetBytes(v31, v77, 0x600u, 0x3Fu, 0, (UInt8 *)v39, v38, &v73);
  v39[v73] = 0;
  CFRelease(v31);
  v45 = 0;
  v46 = 0xFFFFFFFFLL;
  do
  {
    v47 = v75[v45];
    if (!v47 || v47 >= 32)
    {
      if ((_DWORD)v46 != -1)
      {
        DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, CFSTR("Aborting, impossible date pattern, too many years in %@"), v5);
        return 0;
      }
      v46 = v45;
    }
    ++v45;
  }
  while (v12 != v45);
  if ((_DWORD)v46 == -1)
  {
    v49 = 0xFFFFFFFFLL;
  }
  else
  {
    v48 = 0;
    v49 = 0xFFFFFFFFLL;
    do
    {
      if ((int)v75[v48] >= 13 && v46 != v48)
      {
        if ((_DWORD)v49 != -1)
        {
          DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, CFSTR("Aborting, impossible date pattern, too many month in %@"), v5);
          return 0;
        }
        v49 = v48;
      }
      ++v48;
    }
    while (v12 != v48);
  }
  v51 = *v39;
  if (!*v39)
  {
    v53 = 0xFFFFFFFFLL;
    goto LABEL_90;
  }
  v52 = 0;
  v53 = 0xFFFFFFFFLL;
  while (v52 != (_DWORD)v46 && v52 != (_DWORD)v53 && v52 != (_DWORD)v49)
  {
LABEL_72:
    if (v51 > 99)
    {
      if (v51 == 100)
      {
        if ((_DWORD)v49 == -1)
          v49 = v52;
        else
          v49 = v49;
        goto LABEL_87;
      }
      if (v51 == 121)
      {
LABEL_81:
        if ((_DWORD)v46 == -1)
          v46 = v52;
        else
          v46 = v46;
      }
    }
    else if ((v51 - 76) >= 2)
    {
      if (v51 == 89)
        goto LABEL_81;
    }
    else if ((_DWORD)v53 == -1)
    {
      v53 = v52;
    }
    else
    {
      v53 = v53;
    }
LABEL_87:
    v61 = *++v39;
    v51 = v61;
    if (!v61)
      goto LABEL_90;
  }
  v54 = 0;
  if ((int)v52 <= 2)
    v55 = 2;
  else
    v55 = v52;
  v40 = v55 - (int)v52;
  v41 = (int)v52;
  v42 = &v75[v52 + 1];
  v43 = v52;
  v44 = (1 - v53) + (unint64_t)v52;
  while (v40 != v54)
  {
    v56 = v52 + v54 + 1;
    v57 = v44 + v54;
    v58 = 1 - v46 + v52 + v54;
    if (v12 > (int)v52 + v54 + 1 && v58 && v57 && v56 != (_DWORD)v49)
    {
      if ((_DWORD)v49 != -1 || (_DWORD)v46 == -1)
        v60 = v49;
      else
        v60 = v52 + v54 + 1;
      if ((int)v42[v54] >= 13)
        v49 = v60;
      else
        v49 = v49;
    }
    ++v54;
    if (v58 && v57 && v56 != (_DWORD)v49)
    {
      v52 += v54;
      goto LABEL_72;
    }
  }
LABEL_90:
  if (v12 != 2)
  {
    if (v49 <= 2
      && ((v53 | v46) & 0x80000000) == 0
      && (int)v53 <= 2
      && (int)v46 < 3)
    {
      v62 = v75[v46];
      goto LABEL_100;
    }
    goto LABEL_116;
  }
  if (v49 > 1 || (v53 & 0x80000000) != 0 || (int)v53 >= 2)
  {
LABEL_116:
    DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, CFSTR("Aborting, one of the position is incorrect (%d, %d, %d)"), v49, v53, v46);
    return 0;
  }
  v62 = -1;
LABEL_100:
  v63 = v75[v53];
  v64 = v75[v49];
  if (v63 >= 13 && (int)v64 >= 1 && (int)v64 <= 12)
  {
    v65 = lastDayOfMonthLeapYear[(v64 - 1)];
    v66 = v63 <= v65;
    if (v63 <= v65)
      v67 = v63;
    else
      v67 = v64;
    if (v66)
      v63 = v64;
    v64 = v67;
  }
  if ((v63 - 13) < 0xFFFFFFF4)
    return 0;
  if ((int)v64 < 1)
    goto LABEL_114;
  v68 = lastDayOfMonthLeapYear[v63 - 1];
  if ((int)v64 <= v68)
  {
    if ((int)v12 >= 3)
    {
      v69 = 0;
      while ((int)v75[v69] <= v68)
      {
        if (++v69 == 3)
          goto LABEL_124;
      }
      if ((_DWORD)v46 != (_DWORD)v69)
      {
        DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, CFSTR("Locale information is useless (year)"));
        return 0;
      }
    }
LABEL_124:
    *a3 = v64;
    *a4 = v63;
    v70 = v62 + 1900;
    if (v62 >= 0x64)
      v70 = v62;
    if (v62 <= 0x31)
      v70 = v62 + 2000;
    if (v62 >= 0)
      v71 = v70;
    else
      v71 = -1;
    *a5 = v71;
    return 1;
  }
  else
  {
    if ((v64 - 32) <= 0xFFFFFFE0)
LABEL_114:
      DDLogErrD(v40, v41, (uint64_t)v42, v43, v44, CFSTR("Day (%d) is out of bounds"), v64);
    return 0;
  }
}

uint64_t DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear(void *key, uint64_t a2, const __CFLocale *a3, Boolean *a4, int *a5, int *a6, _DWORD *a7, unsigned int a8)
{
  const __CFDictionary *Value;
  const __CFDictionary *v17;
  const __CFString *v18;
  const __CFString *v20;
  CFStringRef v21;
  const __CFDictionary *v22;
  CFStringRef v23;
  const __CFString *v24;
  __CFString *v25;
  CFStringRef v26;
  CFStringRef v27;
  const __CFString *v28;
  const __CFString *v29;
  CFStringRef v30;
  unsigned int v31;
  const __CFAllocator *alloc;

  *a6 = 1;
  *a7 = 1;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear_sOnce != -1)
    dispatch_once(&DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear_sOnce, &__block_literal_global_21);
  if (!DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear__sVacationsInfoPlist)
    return 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)DDResultExtractDayAndMonthWithSpecialDayIdentifierInYear__sVacationsInfoPlist, key);
  if (!Value)
    return 0;
  v17 = Value;
  v31 = a8;
  if (a3)
    v18 = (const __CFString *)CFLocaleGetValue(a3, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  else
    v18 = 0;
  if (v18)
    v20 = v18;
  else
    v20 = CFSTR("default");
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!a2
    || (v21 = CFStringCreateWithFormat(alloc, 0, CFSTR("%@.%@"), v20, a2),
        v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v21),
        CFRelease(v21),
        !v22)
    && (v23 = CFStringCreateWithFormat(alloc, 0, CFSTR("default.%@"), a2),
        v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v23),
        CFRelease(v23),
        !v22))
  {
    v24 = (const __CFString *)CFDictionaryGetValue(v17, v20);
    v25 = v24 ? (__CFString *)v24 : CFSTR("GREGORIAN");
    v26 = CFStringCreateWithFormat(alloc, 0, CFSTR("%@.%@"), v20, v25);
    v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v26);
    CFRelease(v26);
    if (!v22)
    {
      v27 = CFStringCreateWithFormat(alloc, 0, CFSTR("default.%@"), v25);
      v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v27);
      CFRelease(v27);
      if (!v22)
      {
        v28 = (const __CFString *)CFDictionaryGetValue(v17, CFSTR("default"));
        v29 = CFSTR("GREGORIAN");
        if (v28)
          v29 = v28;
        v30 = CFStringCreateWithFormat(alloc, 0, CFSTR("default.%@"), v29);
        v22 = (const __CFDictionary *)CFDictionaryGetValue(v17, v30);
        CFRelease(v30);
      }
    }
  }
  return DDExtractDayAndMonthFromSpecialDayInYearRec(a6, a7, v31, a4, a5, (uint64_t)key, v22, 0);
}

uint64_t DDExtractDayAndMonthFromSpecialDayInYearRec(int *a1, _DWORD *a2, uint64_t a3, Boolean *a4, int *a5, uint64_t a6, const __CFDictionary *a7, int a8)
{
  uint64_t v10;
  uint64_t result;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  const __CFString *Value;
  CFStringRef v22;
  const __CFArray *v23;
  const __CFArray *ValueAtIndex;
  CFTypeID v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  const __CFNumber *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;
  int v37;
  int v38;
  int v39;
  char v40;
  int v41;
  __int16 v42;
  __int16 v43;
  unsigned int v44;
  const __CFBoolean *v45;
  const __CFNumber *v46;
  const __CFNumber *v47;
  const __CFNumber *v48;
  SInt32 v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  uint64_t v53;
  const __CFTimeZone *v54;
  uint64_t v55;
  CFAbsoluteTime AbsoluteTime;
  CFAbsoluteTime v57;
  unint64_t v58;
  const __CFBoolean *v59;
  const __CFString *v60;
  const __CFString *v61;
  int v62;
  unsigned int v63;
  const __CFString *cf;
  Boolean *cfa;
  int valuePtr;
  CFGregorianUnits buf;
  uint64_t v68;
  CFGregorianDate v69;

  v68 = *MEMORY[0x1E0C80C00];
  if (a8 >= 2)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v10 = DDLogHandle_error_log_handle;
    result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      buf.years = 138412546;
      *(_QWORD *)&buf.months = a6;
      LOWORD(buf.hours) = 1024;
      *(SInt32 *)((char *)&buf.hours + 2) = a3;
      v12 = "Recursive parsing of a special date failed for %@ for year %d";
      v13 = v10;
      v14 = 18;
LABEL_6:
      _os_log_error_impl(&dword_19BC07000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&buf, v14);
      return 0;
    }
    return result;
  }
  Value = (const __CFString *)CFDictionaryGetValue(a7, CFSTR("Type"));
  if (CFStringCompare(Value, CFSTR("AbsoluteDate"), 0) == kCFCompareEqualTo)
  {
    v26 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("Month"));
    CFNumberGetValue(v26, kCFNumberIntType, a2);
    v27 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("Day"));
    CFNumberGetValue(v27, kCFNumberIntType, a1);
    goto LABEL_36;
  }
  if (CFStringCompare(Value, CFSTR("MonthRelativeWeekDay"), 0) == kCFCompareEqualTo)
  {
    v28 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("Month"));
    CFNumberGetValue(v28, kCFNumberIntType, a2);
    v29 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("WeekDay"));
    buf.years = 1;
    CFNumberGetValue(v29, kCFNumberIntType, &buf);
    v30 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("WeekDayNumberInMonth"));
    valuePtr = 1;
    CFNumberGetValue(v30, kCFNumberIntType, &valuePtr);
    if ((int)extractDayFromWeekDayRelativeToMonth(a3, *a2, buf.years, valuePtr) < 1)
      return 0;
    *a1 = extractDayFromWeekDayRelativeToMonth(a3, *a2, buf.years, valuePtr);
    goto LABEL_36;
  }
  if (CFStringCompare(Value, CFSTR("SpecialDateRelativeDate"), 0))
  {
    if (CFStringCompare(Value, CFSTR("DateList"), 0) == kCFCompareEqualTo)
    {
      v22 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%d"), a3);
      v23 = (const __CFArray *)CFDictionaryGetValue(a7, v22);
      if (!v23)
        goto LABEL_32;
      ValueAtIndex = v23;
      cf = v22;
      v25 = CFGetTypeID(v23);
      if (v25 == CFArrayGetTypeID())
      {
        v22 = cf;
        if (CFArrayGetCount(ValueAtIndex) < 1)
          goto LABEL_32;
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        if (!ValueAtIndex)
          goto LABEL_32;
      }
      else
      {
        v22 = cf;
      }
      v45 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, CFSTR("NoDefinition"));
      if (v45)
      {
        if (CFBooleanGetValue(v45) == 1)
        {
LABEL_32:
          CFRelease(v22);
          return 0;
        }
      }
      v46 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Month"));
      v47 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Day"));
      CFNumberGetValue(v46, kCFNumberIntType, a2);
      CFNumberGetValue(v47, kCFNumberIntType, a1);
      CFRelease(cf);
    }
LABEL_36:
    v48 = (const __CFNumber *)CFDictionaryGetValue(a7, CFSTR("RelativeDays"));
    if (v48)
    {
      valuePtr = 0;
      CFNumberGetValue(v48, kCFNumberIntType, &valuePtr);
      v49 = valuePtr;
      if (valuePtr)
      {
        memset(&buf.hours, 0, 20);
        v63 = a3;
        cfa = a4;
        v50 = a6;
        v51 = *(unsigned __int8 *)a1;
        v52 = a5;
        v53 = *(unsigned __int8 *)a2;
        v54 = CFTimeZoneCopyDefault();
        v55 = (v51 << 40) | (v53 << 32);
        a5 = v52;
        a4 = cfa;
        *(_QWORD *)&v69.year = v55 | v63;
        v69.second = 0.0;
        AbsoluteTime = CFGregorianDateGetAbsoluteTime(v69, v54);
        *(_QWORD *)&buf.years = 0;
        buf.days = v49;
        v57 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v54, &buf);
        v58 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(v57, v54);
        CFRelease(v54);
        *a1 = (int)(v58 >> 16) >> 24;
        *a2 = (int)(v58 >> 8) >> 24;
        if ((_DWORD)v58 != v63)
          return DDExtractDayAndMonthFromSpecialDayInYearRec(a1, a2, 2 * v63 - v58, cfa, a5, v50, a7, (a8 + 1));
      }
    }
    if (a4)
    {
      v59 = (const __CFBoolean *)CFDictionaryGetValue(a7, CFSTR("ActualMayVary"));
      if (v59)
        *a4 = CFBooleanGetValue(v59);
    }
    if (!a5)
      return 1;
    v60 = (const __CFString *)CFDictionaryGetValue(a7, CFSTR("Observed"));
    if (!v60)
      return 1;
    v61 = v60;
    if (CFStringCompare(v60, CFSTR("closestBusinessDay"), 0) == kCFCompareEqualTo)
    {
      result = 1;
      *a5 = 1;
      return result;
    }
    if (CFStringCompare(v61, CFSTR("nextBusinessDay"), 0))
    {
      if (CFStringCompare(v61, CFSTR("previousBusinessDay"), 0))
      {
        if (CFStringCompare(v61, CFSTR("sameDay"), 0) == kCFCompareEqualTo)
          *a5 = 0;
        return 1;
      }
      v62 = 2;
    }
    else
    {
      v62 = 3;
    }
    *a5 = v62;
    return 1;
  }
  v31 = (const __CFString *)CFDictionaryGetValue(a7, CFSTR("SpecialDate"));
  v32 = (const __CFString *)CFDictionaryGetValue(a7, CFSTR("CalendarType"));
  if (CFStringCompare(v31, CFSTR("easter"), 0) == kCFCompareEqualTo)
  {
    if (v32 && CFStringCompare(v32, CFSTR("JULIAN"), 0) == kCFCompareEqualTo)
    {
      extractJulianEasterInYear(a1, a2, a3);
    }
    else
    {
      v34 = (int)a3 % 19;
      v35 = (int)a3 / 100;
      v36 = (int)a3 % 100;
      v37 = ((int)a3 / 100) & 3;
      if ((int)a3 / -100 >= 0)
        v37 = -(((int)a3 / -100) & 3);
      v38 = ((unint64_t)(1431655765 * (v35 + (v35 + 8) / -25 + 1)) >> 32) - (v35 + (v35 + 8) / -25 + 1);
      v39 = (int)(v35 + (int)a3 / -400 + 19 * v34 + (v38 >> 1) + (v38 >> 31) + 15) % 30;
      v40 = v36 + ((v36 >> 13) & 3);
      v41 = 2 * (v37 + (v40 >> 2)) + ((v40 & 0xFC) - v36 + 32);
      v42 = (37201 * (__int16)(v34 + 11 * v39 + 22 * ((v41 - v39) % 7))) >> 16;
      v43 = v41
          - 7 * ((v41 - v39) / 7)
          + 249 * ((v42 >> 8) + ((unsigned __int16)(v42 & 0x8000) >> 15))
          + 114;
      v44 = (((v43 - ((unsigned __int16)(9 * v43) >> 8)) >> 1)
           + ((9 * v43) >> 8)) >> 4;
      *a1 = (-31 * v44 + v43 + 1);
      *a2 = v44;
    }
    goto LABEL_36;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v33 = DDLogHandle_error_log_handle;
  result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    buf.years = 138412546;
    *(_QWORD *)&buf.months = a6;
    LOWORD(buf.hours) = 2112;
    *(_QWORD *)((char *)&buf.hours + 2) = v31;
    v12 = "Malformed Vacations.plist for %@ (SpecialDate %@ is unknown)";
    v13 = v33;
    v14 = 22;
    goto LABEL_6;
  }
  return result;
}

uint64_t extractDayFromWeekDayRelativeToMonth(unsigned int a1, unsigned __int8 a2, int a3, int a4)
{
  const __CFTimeZone *v8;
  CFAbsoluteTime AbsoluteTime;
  __CFCalendar *v10;
  __CFCalendar *v11;
  CFIndex length;
  int v13;
  NSObject *v14;
  CFAbsoluteTime v16;
  SInt32 DayOfWeek;
  CFGregorianUnits v19;
  uint64_t v20;
  CFGregorianDate v21;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = CFTimeZoneCopyDefault();
  *(_QWORD *)&v21.year = a1 | ((unint64_t)a2 << 32) | 0x10000000000;
  v21.second = 0.0;
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(v21, v8);
  v10 = _copyDefaultCalendar();
  if (!v10)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v14 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      v19.years = 136315138;
      *(_QWORD *)&v19.months = "extractDayFromWeekDayRelativeToMonth";
      _os_log_error_impl(&dword_19BC07000, v14, OS_LOG_TYPE_ERROR, "Couldn't fetch the gregorian calendar in %s...", (uint8_t *)&v19, 0xCu);
      if (!v8)
        return 0xFFFFFFFFLL;
    }
    else if (!v8)
    {
      return 0xFFFFFFFFLL;
    }
    CFRelease(v8);
    return 0xFFFFFFFFLL;
  }
  v11 = v10;
  length = CFCalendarGetRangeOfUnit(v10, 0x10uLL, 8uLL, AbsoluteTime).length;
  CFRelease(v11);
  if (a4 < 0)
  {
    memset(&v19.days, 0, 24);
    *(_QWORD *)&v19.years = 0x100000000;
    v16 = CFAbsoluteTimeAddGregorianUnits(AbsoluteTime, v8, &v19);
    DayOfWeek = CFAbsoluteTimeGetDayOfWeek(v16, v8);
    v13 = length - a4 + 8 * a4 + a3 - DayOfWeek + 7 - 7 * ((a3 - DayOfWeek + 7) / 7) + 1;
  }
  else
  {
    v13 = (a3 - CFAbsoluteTimeGetDayOfWeek(AbsoluteTime, v8) + 7) % 7 - a4 + 8 * a4 - 6;
  }
  CFRelease(v8);
  if (length < v13 || v13 < 1)
    return 0xFFFFFFFFLL;
  else
    return v13;
}

_DWORD *extractJulianEasterInYear(_DWORD *result, _DWORD *a2, int a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;

  if (a3 <= 0)
    v3 = -(-a3 & 3);
  else
    v3 = a3 & 3;
  v4 = 4 * (a3 % 7) + 2 * v3 + 34;
  v5 = v4
     - 7
     * ((v4
       - (__int16)(19 * (a3 % 19)
                 + 15
                 - 30
                 * (((__int16)((34953 * (__int16)(19 * (a3 % 19) + 15)) >> 16) >> 4)
                  + ((unsigned __int16)(((34953 * (__int16)(19 * (a3 % 19) + 15)) >> 16) & 0x8000) >> 15))))
      / 7)
     + 114;
  v6 = ((v5 - ((unsigned __int16)(9 * v5) >> 8)) >> 1)
     + ((9 * v5) >> 8);
  v7 = (-31 * (v6 >> 4) + v5 + 13);
  v8 = lastDayOfMonthLeapYear[(v6 >> 4) - 1];
  *result = v7 % v8 + 1;
  *a2 = v7 / v8 + (v6 >> 4);
  return result;
}

void *__extractDMYFromAmbiguousForm_block_invoke(void *result)
{
  const __CFLocale *v1;
  CFLocaleRef *v2;
  const __CFAllocator *v3;
  const void *v4;

  v1 = (const __CFLocale *)*((_QWORD *)result + 4);
  if (v1)
  {
    v2 = (CFLocaleRef *)result;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    extractDMYFromAmbiguousForm_sFormat3 = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("yMd"), 0, v1);
    extractDMYFromAmbiguousForm_sFormat2 = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate(v3, CFSTR("Md"), 0, v2[4]);
    v4 = (const void *)MEMORY[0x1A1ACA418](v2[4]);
    result = (void *)CFRetain(v4);
    extractDMYFromAmbiguousForm_sFormatLocale = (uint64_t)result;
  }
  return result;
}

uint64_t DDResultCopyExtractedDateFromReferenceDate(uint64_t a1, const void *a2, const void *a3, BOOL *a4, CFDateRef *a5, CFTypeRef *a6)
{
  if (getLocaleForExtraction_sOnce != -1)
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
  return DDResultCopyExtractedDateFromReferenceDateWithLocale(a1, (const __CFLocale *)_sLocaleForExtraction, a2, a3, a4, a5, a6);
}

uint64_t DDResultCopyExtractedStartDateEndDate(uint64_t a1, CFDateRef *a2, CFTypeRef *a3, CFTypeRef *a4, CFTypeRef *a5, BOOL *a6, const void *a7, CFTypeRef cf)
{
  if (getLocaleForExtraction_sOnce != -1)
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
  return DDResultCopyExtractedStartDateEndDateWithLocale(a1, (const __CFLocale *)_sLocaleForExtraction, a2, a3, a4, a5, a6, a7, cf);
}

uint64_t DDResultCopyExtractedStartDateEndDateWithLocale(uint64_t a1, const __CFLocale *a2, CFDateRef *a3, CFTypeRef *a4, CFTypeRef *a5, CFTypeRef *a6, BOOL *a7, const void *a8, CFTypeRef cf)
{
  CFCalendarRef v17;
  __CFCalendar *v18;
  const __CFTimeZone *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFTimeZone *v26;
  const __CFString **SubresultWithType;
  uint64_t v28;
  const __CFLocale *v29;
  const __CFString **v30;
  _QWORD *v31;
  const __CFString **v32;
  uint64_t v33;
  const __CFTimeZone *v34;
  const __CFArray *v35;
  const __CFArray *v36;
  const __CFString **v37;
  __CFCalendar *v38;
  const __CFDate *v39;
  uint64_t v40;
  CFAbsoluteTime v41;
  const __CFString **v42;
  const __CFString **v43;
  const __CFString **v44;
  uint64_t v45;
  const __CFString **v46;
  uint64_t v47;
  uint64_t v48;
  const __CFLocale *v49;
  const __CFString **v50;
  _QWORD *v51;
  CFTimeZoneRef v52;
  const __CFString **v53;
  const __CFString **v54;
  const __CFString **v55;
  const __CFString **v56;
  uint64_t GregorianYear;
  uint64_t v58;
  const __CFString *v59;
  CFDateRef *v60;
  int Integer;
  const __CFString *data;
  const __CFString *v63;
  __CFCalendar *v64;
  CFDateRef v65;
  const __CFString **v66;
  const __CFString **v67;
  uint64_t v68;
  const __CFString **v69;
  int v70;
  int v71;
  CFDateRef *v72;
  int v73;
  NSObject *v74;
  const __CFLocale *v75;
  const __CFString **v76;
  const __CFString **v77;
  CFAbsoluteTime v78;
  const __CFString **v79;
  const __CFString **v80;
  const __CFString **v81;
  const __CFString **v82;
  const __CFString **v83;
  signed int v84;
  const __CFLocale *v85;
  const __CFString **v86;
  const __CFString **v87;
  const __CFString *v88;
  const __CFString **v89;
  int v90;
  _BOOL4 IsPartial;
  _BOOL4 v92;
  CFDateRef v93;
  CFDateRef v94;
  BOOL v95;
  int v96;
  const __CFString **v97;
  unsigned int v98;
  int v99;
  const __CFLocale *v100;
  CFTypeRef *v101;
  _BYTE *v102;
  const __CFString **v103;
  int v104;
  const __CFString *info;
  const __CFString *v106;
  _QWORD *v107;
  CFAbsoluteTime v108;
  uint64_t v109;
  int v110;
  int v111;
  CFAbsoluteTime v112;
  NSObject *v113;
  CFAbsoluteTime v114;
  CFTimeZoneRef v115;
  BOOL v116;
  uint64_t v117;
  uint64_t v118;
  CFAbsoluteTime v119;
  CFAbsoluteTime v120;
  CFDateRef v121;
  const void *v122;
  const __CFString *v123;
  const __CFString *v124;
  void *v125;
  BOOL v126;
  char v127;
  __CFString *DetailedDescription;
  NSObject *v129;
  const __CFString *v131;
  uint64_t v132;
  const __CFString **v133;
  uint64_t v134;
  const __CFString **ValueAtIndex;
  CFTypeRef *v136;
  BOOL *v137;
  CFTypeRef *v138;
  CFTypeRef *v139;
  CFDateRef *v140;
  __CFCalendar *calendar;
  CFDateRef v142;
  CFAbsoluteTime at;
  unsigned int v144;
  uint64_t v145;
  uint64_t v146;
  int v147[3];
  __int128 v148;
  __int16 v149;
  CFTypeRef v150;
  CFDateRef v151;
  _BYTE buf[12];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v20 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v21 = "result should not be NULL";
    v22 = v20;
    v23 = 2;
LABEL_81:
    _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    return 0;
  }
  v17 = _copyDefaultCalendar();
  if (!v17)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v24 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "DDResultCopyExtractedStartDateEndDateWithLocale";
    v21 = "Couldn't fetch the gregorian calendar in %s...";
    v22 = v24;
    v23 = 12;
    goto LABEL_81;
  }
  v18 = v17;
  v140 = a3;
  v139 = a5;
  v137 = a7;
  if (cf)
    v19 = (const __CFTimeZone *)CFRetain(cf);
  else
    v19 = CFTimeZoneCopyDefault();
  v26 = v19;
  v138 = a6;
  v142 = copyBestDateForDate(a8);
  SubresultWithType = (const __CFString **)a1;
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("TimeDuration")))
    SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("TimeDuration"));
  v28 = a1;
  v29 = a2;
  CFCalendarSetLocale(v18, a2);
  calendar = v18;
  CFCalendarSetTimeZone(v18, v26);
  v30 = DDResultGetSubresultWithType(v28, CFSTR("BeginDate"));
  v31 = (_QWORD *)v28;
  v32 = DDResultGetSubresultWithType(v28, CFSTR("EndDate"));
  if (!v32)
  {
    v34 = v26;
    if (!v30)
      goto LABEL_26;
    v38 = calendar;
    v39 = v142;
    v40 = _DDResultCopyImplicitDateFromReferenceDateWithLocale((uint64_t)v30, 1, v29, calendar, a8, cf, v142, v26, v137, v139, v138, v140, a4);
LABEL_33:
    v25 = v40;
    goto LABEL_248;
  }
  v33 = (uint64_t)v32;
  if (!v30)
  {
    v38 = v18;
    v39 = v142;
    v40 = _DDResultCopyImplicitDateFromReferenceDateWithLocale((uint64_t)v32, 0, v29, v18, a8, cf, v142, v26, v137, (CFTypeRef *)v140, a4, (CFDateRef *)v139, v138);
    goto LABEL_33;
  }
  v34 = v26;
  v35 = (const __CFArray *)v32[7];
  if (v35)
  {
    v36 = (const __CFArray *)v30[7];
    if (CFArrayGetCount((CFArrayRef)v32[7]) >= 1 && (!v36 || CFArrayGetCount(v36) >= 1))
    {
      v151 = 0;
      *(_QWORD *)buf = 0;
      v150 = 0;
      v149 = 0;
      if (CFArrayGetCount(v35) == 1)
      {
        ValueAtIndex = (const __CFString **)CFArrayGetValueAtIndex(v35, 0);
        v37 = 0;
      }
      else
      {
        ValueAtIndex = DDResultGetSubresultWithType(v33, CFSTR("Date"));
        v37 = DDResultGetSubresultWithType(v33, CFSTR("ApproxTime"));
      }
      v133 = v37;
      v26 = v34;
      v38 = calendar;
      if (v36)
      {
        v75 = v29;
        if (CFArrayGetCount(v36) == 1)
        {
          v76 = (const __CFString **)CFArrayGetValueAtIndex(v36, 0);
          v77 = 0;
        }
        else
        {
          v76 = DDResultGetSubresultWithType((uint64_t)v30, CFSTR("Date"));
          v77 = DDResultGetSubresultWithType((uint64_t)v30, CFSTR("ApproxTime"));
        }
        v39 = v142;
        v90 = DDResultCopyExtractedDateFromReferenceDateRec((uint64_t)v76, v75, calendar, v142, v26, (BOOL *)&v149 + 1, &v151, &v150, 1);
        if (a4 && v150)
          *a4 = CFRetain(v150);
        IsPartial = resultIsPartial(v76);
        if (!v90)
        {
          v93 = v142;
          v79 = v77;
          v80 = ValueAtIndex;
          goto LABEL_83;
        }
        v79 = v77;
        v80 = ValueAtIndex;
        if (IsPartial)
          goto LABEL_79;
      }
      else
      {
        HIBYTE(v149) = 0;
        v78 = MEMORY[0x1A1ACA358](a8);
        v79 = 0;
        v76 = 0;
        v151 = CFDateCreate(0, v78);
        v39 = v142;
        v75 = v29;
        v80 = ValueAtIndex;
      }
      v92 = resultIsPartial(v80);
      v93 = v39;
      if (!v92)
      {
LABEL_83:
        DDResultCopyExtractedDateFromReferenceDateRec((uint64_t)v80, v75, calendar, v93, v26, (BOOL *)&v149, (CFDateRef *)buf, v138, 1);
        v25 = 0;
        v94 = v151;
        if (v151 && *(_QWORD *)buf)
        {
          if (v140)
          {
            if (CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
            {
              if (DDResultGetSubresultWithType((uint64_t)v76, CFSTR("YearNumber")))
                v95 = 1;
              else
                v95 = DDResultGetSubresultWithType((uint64_t)v76, CFSTR("JapaneseYearNumber")) != 0;
              if (v80)
              {
                if (DDResultGetSubresultWithType((uint64_t)v80, CFSTR("YearNumber")))
                  v116 = 1;
                else
                  v116 = DDResultGetSubresultWithType((uint64_t)v80, CFSTR("JapaneseYearNumber")) != 0;
              }
              else
              {
                v116 = 0;
              }
              v148 = 0uLL;
              v146 = 0;
              memset(v147, 0, sizeof(v147));
              v145 = 0;
              v144 = 0;
              MEMORY[0x1A1ACA358](v151);
              CFCalendarDecomposeAbsoluteTime(calendar, v119, "yMdHms", (char *)&v148 + 12, (char *)&v148 + 8, (char *)&v148 + 4, &v148, &v147[2], &v147[1]);
              MEMORY[0x1A1ACA358](*(_QWORD *)buf);
              CFCalendarDecomposeAbsoluteTime(calendar, v120, "yMdHms", v147, (char *)&v146 + 4, &v146, (char *)&v145 + 4, &v145, &v144);
              if (!v95 && SHIDWORD(v148) > v147[0])
              {
                HIDWORD(v148) = v147[0];
                CFRelease(v151);
                at = 0.0;
                CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", HIDWORD(v148), DWORD2(v148), DWORD1(v148), v148, v147[2], v147[1]);
                v151 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], at);
              }
              if (v116)
              {
                v100 = v75;
                v25 = 1;
                v39 = v142;
              }
              else
              {
                if (SHIDWORD(v148) <= v147[0])
                {
                  v25 = 1;
                }
                else
                {
                  v147[0] = HIDWORD(v148);
                  CFRelease(*(CFTypeRef *)buf);
                  at = 0.0;
                  v25 = CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", v147[0], HIDWORD(v146), v146, HIDWORD(v145), v145, v144);
                  *(_QWORD *)buf = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], at);
                }
                v39 = v142;
                v100 = v75;
                if (!v95 && CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
                {
                  ++v147[0];
                  CFRelease(*(CFTypeRef *)buf);
                  at = 0.0;
                  v25 = CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", v147[0], HIDWORD(v146), v146, HIDWORD(v145), v145, v144);
                  *(_QWORD *)buf = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], at);
                }
              }
            }
            else
            {
              v100 = v75;
              v25 = 1;
            }
            v101 = v139;
            v102 = v137;
            if (CFDateCompare(v151, *(CFDateRef *)buf, 0) == kCFCompareGreaterThan)
            {
              if (CFDateCompare((CFDateRef)a8, *(CFDateRef *)buf, 0) == kCFCompareLessThan)
                v121 = (CFDateRef)a8;
              else
                v121 = *(CFDateRef *)buf;
            }
            else
            {
              v121 = v151;
            }
            v122 = CFRetain(v121);
            if (v79)
            {
              HIDWORD(v148) = 0;
              v123 = v79[10];
              if (!v123)
                v123 = v79[9];
              if (extractHourFromApproxTimeValue(v123, (int *)&v148 + 3, v100))
              {
                *(_QWORD *)((char *)&v148 + 4) = 0;
                LODWORD(v148) = 0;
                at = MEMORY[0x1A1ACA358](v122);
                CFCalendarDecomposeAbsoluteTime(calendar, at, "yMd", (char *)&v148 + 8, (char *)&v148 + 4, &v148);
                CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", DWORD2(v148), DWORD1(v148), v148, HIDWORD(v148), 0, 0);
                CFRelease(v122);
                v122 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], at);
                HIBYTE(v149) = 0;
              }
            }
            v103 = v133;
            *v140 = (CFDateRef)v122;
          }
          else
          {
            v100 = v75;
            v25 = 1;
            v101 = v139;
            v102 = v137;
            v103 = v133;
          }
          if (v101)
          {
            if (!v103)
              goto LABEL_231;
            HIDWORD(v148) = 0;
            v124 = v103[10];
            if (!v124)
              v124 = v103[9];
            if (!extractHourFromApproxTimeValue(v124, (int *)&v148 + 3, v100)
              || (*(_QWORD *)((char *)&v148 + 4) = 0,
                  LODWORD(v148) = 0,
                  at = MEMORY[0x1A1ACA358](*(_QWORD *)buf),
                  CFCalendarDecomposeAbsoluteTime(calendar, at, "yMd", (char *)&v148 + 8, (char *)&v148 + 4, &v148),
                  CFCalendarComposeAbsoluteTime(calendar, &at, "yMdHms", DWORD2(v148), DWORD1(v148), v148, HIDWORD(v148), 0, 0), v125 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], at), LOBYTE(v149) = 0, !v125))
            {
LABEL_231:
              v125 = (void *)CFRetain(*(CFTypeRef *)buf);
            }
            *v101 = v125;
          }
          if (v102)
          {
            if (HIBYTE(v149))
              v126 = v149 == 0;
            else
              v126 = 1;
            v127 = !v126;
            *v102 = v127;
          }
          v94 = v151;
        }
        if (v94)
          CFRelease(v94);
        if (v150)
          CFRelease(v150);
        v115 = *(CFTimeZoneRef *)buf;
        if (*(_QWORD *)buf)
LABEL_247:
          CFRelease(v115);
LABEL_248:
        if ((_DWORD)v25)
        {
LABEL_254:
          CFRelease(v26);
          CFRelease(v39);
          CFRelease(v38);
          return v25;
        }
LABEL_249:
        DetailedDescription = createDetailedDescription(v31);
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v129 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = DetailedDescription;
          _os_log_error_impl(&dword_19BC07000, v129, OS_LOG_TYPE_ERROR, "Unknown result type, could not extract duration: %@", buf, 0xCu);
        }
        CFRelease(DetailedDescription);
        v25 = 0;
        goto LABEL_254;
      }
LABEL_79:
      v93 = v151;
      goto LABEL_83;
    }
  }
LABEL_26:
  if (!SubresultWithType)
  {
    v26 = v34;
    v38 = calendar;
    v39 = v142;
    if (!DDResultGetSubresultWithType((uint64_t)v31, CFSTR("DayInterval")))
      goto LABEL_249;
    v53 = DDResultGetSubresultWithType((uint64_t)v31, CFSTR("DayInterval"));
    v54 = DDResultGetSubresultWithType((uint64_t)v53, CFSTR("MonthNumber"));
    v55 = DDResultGetSubresultWithType((uint64_t)v53, CFSTR("BeginDay"));
    v56 = DDResultGetSubresultWithType((uint64_t)v53, CFSTR("EndDay"));
    GregorianYear = extractGregorianYear((uint64_t)v53);
    v25 = 0;
    LODWORD(v151) = -1;
    LODWORD(v150) = -1;
    LODWORD(at) = -1;
    HIDWORD(v148) = -1;
    if (!v54 || !v55 || !v56)
      goto LABEL_201;
    v58 = GregorianYear;
    v59 = v54[10];
    if (!v59)
      v59 = v54[9];
    if ((uint64_t)v54[4] <= (uint64_t)v56[4])
      v60 = &v151;
    else
      v60 = (CFDateRef *)&v150;
    Integer = extractInteger(v59, v60);
    data = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v55, CFSTR("DayNumber"));
    if (data)
    {
      v63 = data;
      data = (const __CFString *)data[2].data;
      v64 = calendar;
      v65 = v142;
      if (!data)
        data = (const __CFString *)v63[2].info;
    }
    else
    {
      v64 = calendar;
      v65 = v142;
    }
    v104 = Integer & extractInteger(data, &at);
    info = (const __CFString *)DDResultGetSubresultWithType((uint64_t)v56, CFSTR("DayNumber"));
    if (info)
    {
      v106 = info;
      info = (const __CFString *)info[2].data;
      v107 = v139;
      if (!info)
        info = (const __CFString *)v106[2].info;
    }
    else
    {
      v107 = v139;
    }
    if ((v104 & extractInteger(info, (_DWORD *)&v148 + 3)) != 1)
    {
      v25 = 0;
      goto LABEL_201;
    }
    *(_DWORD *)buf = 0;
    DWORD2(v148) = 0;
    MEMORY[0x1A1ACA358](v65);
    CFCalendarDecomposeAbsoluteTime(v64, v108, "yM", buf, (char *)&v148 + 8);
    v109 = v150;
    if ((_DWORD)v58 == -1)
    {
      v110 = (int)v151;
      if ((_DWORD)v150 != -1)
        v110 = (int)v150;
      v111 = v110 - DWORD2(v148);
      if (v111 > -3)
        v58 = *(_DWORD *)buf - (v111 > 10);
      else
        v58 = (*(_DWORD *)buf + 1);
    }
    v117 = LODWORD(at);
    if (SLODWORD(at) <= SHIDWORD(v148))
    {
      if ((_DWORD)v150 == -1)
      {
        v109 = v151;
        LODWORD(v150) = (_DWORD)v151;
      }
      else
      {
        LODWORD(v151) = (_DWORD)v150;
      }
    }
    else if ((_DWORD)v150 == -1)
    {
      v109 = v151;
      LODWORD(v150) = (_DWORD)v151 + 1;
      if ((_DWORD)v151 == 12)
      {
        LODWORD(v150) = 1;
        v118 = v58;
        v109 = 12;
        v58 = (v58 + 1);
        goto LABEL_192;
      }
    }
    else
    {
      v109 = ((_DWORD)v150 - 1);
      LODWORD(v151) = (_DWORD)v150 - 1;
      if ((_DWORD)v150 == 1)
      {
        v109 = 12;
        LODWORD(v151) = 12;
        v118 = (v58 - 1);
LABEL_192:
        if (v137)
          *v137 = 1;
        *(_QWORD *)buf = 0;
        if (!v140)
        {
          v25 = 1;
          goto LABEL_198;
        }
        v25 = CFCalendarComposeAbsoluteTime(v64, (CFAbsoluteTime *)buf, "yMdHms", v118, v109, v117, 12, 0, 0);
        if ((_DWORD)v25)
        {
          *v140 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
LABEL_198:
          if (v107)
          {
            v25 = CFCalendarComposeAbsoluteTime(v64, (CFAbsoluteTime *)buf, "yMdHms", v58, v150, HIDWORD(v148), 12, 0, 0);
            if ((_DWORD)v25)
              *v107 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
          }
        }
LABEL_201:
        v38 = calendar;
        v39 = v142;
        goto LABEL_248;
      }
    }
    v118 = v58;
    goto LABEL_192;
  }
  *((_QWORD *)&v148 + 1) = 0;
  DWORD1(v148) = 0;
  v39 = v142;
  MEMORY[0x1A1ACA358](v142);
  v38 = calendar;
  CFCalendarDecomposeAbsoluteTime(calendar, v41, "yMd", (char *)&v148 + 4, (char *)&v148 + 8, (char *)&v148 + 12);
  v42 = DDResultGetSubresultWithType((uint64_t)v31, CFSTR("Date"));
  v26 = v34;
  if (!v42
    || (v43 = v42,
        DDResultExtractDayMonthYear((uint64_t)v42, v29, calendar, (_DWORD *)&v148 + 3, (_DWORD *)&v148 + 2, (_DWORD *)&v148 + 1, (uint64_t)v142, v34)))
  {
    LODWORD(v148) = 0;
    v146 = 0;
    memset(v147, 0, sizeof(v147));
    v150 = 0;
    v151 = 0;
    v44 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("BeginTime"));
    v45 = (uint64_t)DDResultGetSubresultWithType((uint64_t)v44, CFSTR("Time"));
    v46 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("EndTime"));
    v47 = (uint64_t)DDResultGetSubresultWithType((uint64_t)v46, CFSTR("Time"));
    if (v47 | v45)
    {
      v48 = v47;
      v49 = v29;
      v50 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("TimeZone"));
      v136 = a4;
      v51 = v31;
      if (v50)
        v52 = DDCreateTimeZoneWithResult((uint64_t)v50);
      else
        v52 = 0;
      v81 = DDResultGetSubresultWithType(v48, CFSTR("Meridian"));
      v82 = DDResultGetSubresultWithType(v45, CFSTR("Meridian"));
      v83 = DDResultGetSubresultWithType(v45, CFSTR("Hours"));
      v84 = -1;
      v134 = (uint64_t)v81;
      if (v81 || !v45)
      {
        v31 = v51;
        v85 = v49;
        v38 = calendar;
      }
      else
      {
        v31 = v51;
        v85 = v49;
        v38 = calendar;
        if (v83)
        {
          v86 = DDResultGetSubresultWithType((uint64_t)v31, CFSTR("Minutes"));
          *(_DWORD *)buf = 0;
          if (v86)
          {
            v87 = v86;
            v88 = v86[10];
            if (!v88)
              v88 = v87[9];
            if ((extractInteger(v88, buf) & 1) == 0)
            {
              if (v52)
                CFRelease(v52);
              v25 = 0;
              goto LABEL_248;
            }
          }
          v89 = DDResultGetSubresultWithType(v48, CFSTR("Hours"));
          v84 = hourValueForHourAndMeridianResult((uint64_t)v83, (uint64_t)v89, v85, (uint64_t)v82, 0xFFFFFFFF, -1, -1, 0, *(_DWORD *)buf == 0);
        }
      }
      if (v48)
      {
        v96 = extractHourMinuteSecondWithRefCopyTimeZone(v48, (uint64_t)v83, v85, v147, (_DWORD *)&v146 + 1, &v146, (CFTimeZoneRef *)&v150, 0xFFFFFFFF, v84, -1, (uint64_t)v82);
        if (v45)
        {
          v97 = DDResultGetSubresultWithType(v48, CFSTR("Hours"));
          if (v96)
          {
            if (((int)v146 + HIDWORD(v146) < 0) ^ __OFADD__((_DWORD)v146, HIDWORD(v146)) | ((_DWORD)v146
                                                                                           + HIDWORD(v146) == 0))
              v98 = v147[0];
            else
              v98 = v147[0] + 1;
            v99 = extractHourMinuteSecondWithRefCopyTimeZone(v45, (uint64_t)v97, v85, (int *)&v148, &v147[2], &v147[1], &v151, v98, -1, -1, v134);
            v96 = 1;
            goto LABEL_125;
          }
LABEL_102:
          v72 = v140;
          v99 = extractHourMinuteSecondWithRefCopyTimeZone(v45, (uint64_t)v97, v85, (int *)&v148, &v147[2], &v147[1], &v151, 0xFFFFFFFF, -1, -1, (uint64_t)v82);
          v96 = 0;
          goto LABEL_126;
        }
      }
      else
      {
        if (v45)
        {
          v97 = 0;
          goto LABEL_102;
        }
        v96 = 0;
      }
      MEMORY[0x1A1ACA358](v142);
      CFCalendarDecomposeAbsoluteTime(v38, v112, "Hm", &v148, &v147[2]);
      v99 = 0;
      v147[1] = 0;
LABEL_125:
      v72 = v140;
LABEL_126:
      if (v52)
      {
        if (v151)
          CFRelease(v151);
        if (v150)
          CFRelease(v150);
        CFRetain(v52);
        v150 = v52;
        v151 = v52;
      }
      else
      {
        if (v151 || !v150)
        {
          a4 = v136;
          if (v151 && !v150)
            v150 = CFRetain(v151);
          goto LABEL_136;
        }
        v151 = (CFDateRef)CFRetain(v150);
      }
      a4 = v136;
LABEL_136:
      if (v96 | v99)
      {
        if (v99)
        {
          if (!v96)
          {
            v147[0] = ((int)v148 + 1) % 24;
            v146 = *(_QWORD *)&v147[1];
          }
        }
        else
        {
          LODWORD(v148) = (v147[0] - 1) % 24;
          *(_QWORD *)&v147[1] = v146;
        }
LABEL_152:
        if (v151)
          CFCalendarSetTimeZone(v38, v151);
        *(_QWORD *)buf = 0;
        v25 = CFCalendarComposeAbsoluteTime(v38, (CFAbsoluteTime *)buf, "yMdHms", DWORD1(v148), DWORD2(v148), HIDWORD(v148), v148, v147[2], v147[1]);
        if ((_DWORD)v25)
        {
          if (v72)
            *v72 = CFDateCreate(0, *(CFAbsoluteTime *)buf);
          if (a4 && v151)
            *a4 = CFRetain(v151);
          if (!v139)
            goto LABEL_167;
          if (v150)
            CFCalendarSetTimeZone(v38, (CFTimeZoneRef)v150);
          at = 0.0;
          v25 = CFCalendarComposeAbsoluteTime(v38, &at, "yMdHms", DWORD1(v148), DWORD2(v148), HIDWORD(v148), v147[0], HIDWORD(v146), v146);
          if ((_DWORD)v25)
          {
            v114 = at;
            if (*(double *)buf > at)
            {
              CFCalendarAddComponents(v38, &at, 0, "d", at, *(double *)buf, 1);
              v114 = at;
            }
            *v139 = CFDateCreate(0, v114);
LABEL_167:
            if (v138 && v150)
              *v138 = CFRetain(v150);
            if (v137)
              *v137 = 0;
          }
        }
LABEL_172:
        if (v151)
          CFRelease(v151);
        v115 = (CFTimeZoneRef)v150;
        v39 = v142;
        if (v150)
          goto LABEL_247;
        goto LABEL_248;
      }
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v113 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        if (v48)
          v132 = *(_QWORD *)(v48 + 72);
        else
          v132 = 0;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v132;
        _os_log_error_impl(&dword_19BC07000, v113, OS_LOG_TYPE_ERROR, "Could not extract end time from %@", buf, 0xCu);
      }
      if (v151)
      {
        CFRelease(v151);
        v151 = 0;
      }
      if (v150)
      {
        CFRelease(v150);
        v25 = 0;
        v150 = 0;
        goto LABEL_172;
      }
LABEL_147:
      v25 = 0;
      goto LABEL_172;
    }
    v66 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("BeginHour"));
    v67 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("EndHour"));
    v25 = 0;
    if (!v66)
      goto LABEL_172;
    v68 = (uint64_t)v67;
    if (!v67)
      goto LABEL_172;
    v69 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("Meridian"));
    if (!v69)
      v69 = DDResultGetSubresultWithType((uint64_t)v31, CFSTR("ApproxTime"));
    LODWORD(v148) = hourValueForHourAndMeridianResult((uint64_t)v66, v68, v29, 0, 0xFFFFFFFF, -1, -1, 0, 1);
    v70 = hourValueForHourAndMeridianResult(v68, (uint64_t)v66, v29, (uint64_t)v69, 0xFFFFFFFF, v148, -1, 0, 1);
    v147[0] = v70;
    v71 = v148 | v70;
    if (v70 >= (int)v148)
    {
      v72 = v140;
      if (v70 - (int)v148 < 13)
        goto LABEL_121;
      v73 = v148 + 12;
    }
    else
    {
      v72 = v140;
      if ((int)v148 < 13)
      {
        v147[0] = v70 + 12;
LABEL_121:
        if ((v71 & 0x80000000) == 0)
          goto LABEL_152;
        goto LABEL_147;
      }
      v73 = v148 - 12;
    }
    LODWORD(v148) = v73;
    goto LABEL_121;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v74 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    v131 = v43[9];
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v131;
    _os_log_error_impl(&dword_19BC07000, v74, OS_LOG_TYPE_ERROR, "Could not extract date from %@", buf, 0xCu);
  }
  CFRelease(v142);
  CFRelease(v34);
  CFRelease(calendar);
  return 0;
}

uint64_t _DDResultCopyImplicitDateFromReferenceDateWithLocale(uint64_t a1, int a2, const __CFLocale *a3, __CFCalendar *a4, const void *a5, const void *a6, const void *a7, const __CFTimeZone *a8, BOOL *a9, CFTypeRef *a10, _QWORD *a11, CFDateRef *a12, CFTypeRef *a13)
{
  BOOL *v17;
  CFDateRef *v18;
  CFTypeRef *v19;
  uint64_t v20;
  const __CFTimeZone *v21;
  const __CFAllocator *v22;
  CFAbsoluteTime v23;
  const __CFDate *v24;
  CFComparisonResult v25;
  uint64_t v26;
  BOOL v27;
  const __CFTimeZone *v29;
  CFAbsoluteTime v30;
  unsigned int v31;
  uint64_t v32;
  CFAbsoluteTime at;
  uint64_t v34;
  uint64_t v35;
  char v36;

  if (a11)
    *a11 = 0;
  v36 = 0;
  if (a9)
    v17 = a9;
  else
    v17 = (BOOL *)&v36;
  v34 = 0;
  v35 = 0;
  if (a12)
    v18 = a12;
  else
    v18 = (CFDateRef *)&v35;
  if (a13)
    v19 = a13;
  else
    v19 = (CFTypeRef *)&v34;
  v20 = DDResultCopyExtractedDateFromReferenceDateWithLocale(a1, a3, a5, a6, v17, v18, a13);
  if ((_DWORD)v20)
  {
    if (!a10 || !*v18)
      goto LABEL_26;
    *a10 = 0;
    if (a2)
    {
      if (*v19)
        v21 = (const __CFTimeZone *)*v19;
      else
        v21 = a8;
      CFCalendarSetTimeZone(a4, v21);
      at = MEMORY[0x1A1ACA358](*v18);
      CFCalendarAddComponents(a4, &at, 0, "H", 1);
      v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v23 = at;
    }
    else
    {
      if (!*v17)
      {
        v24 = (const __CFDate *)CFRetain(a7);
LABEL_21:
        *a10 = v24;
        if (!v24)
          goto LABEL_26;
LABEL_22:
        v25 = CFDateCompare(v24, *v18, 0);
        v26 = 1;
        if (a2)
          v26 = -1;
        if (v25 == v26)
        {
          CFRelease(*a10);
          *a10 = 0;
        }
LABEL_26:
        if (v19 == a13)
          goto LABEL_29;
        goto LABEL_27;
      }
      v32 = 0;
      v31 = 0;
      if (*v19)
        v29 = (const __CFTimeZone *)*v19;
      else
        v29 = a8;
      CFCalendarSetTimeZone(a4, v29);
      MEMORY[0x1A1ACA358](a7);
      if (!CFCalendarDecomposeAbsoluteTime(a4, v30, "yMd", &v31, &v32, (char *)&v32 + 4))
      {
        v24 = (const __CFDate *)*a10;
        if (!*a10)
          goto LABEL_26;
        goto LABEL_22;
      }
      at = 0.0;
      CFCalendarComposeAbsoluteTime(a4, &at, "yMdHms", v31, v32, HIDWORD(v32), 12, 0, 0);
      v23 = at;
      v22 = 0;
    }
    v24 = CFDateCreate(v22, v23);
    goto LABEL_21;
  }
LABEL_27:
  if (*v19)
  {
    CFRelease(*v19);
    *v19 = 0;
  }
LABEL_29:
  v27 = v18 != a12 || (_DWORD)v20 == 0;
  if (v27 && *v18)
  {
    CFRelease(*v18);
    *v18 = 0;
  }
  return v20;
}

BOOL resultIsPartial(const __CFString **a1)
{
  const __CFString **SubresultWithType;
  const __CFString **v3;

  SubresultWithType = a1;
  if (a1 && _typesAreEqual(a1[8], CFSTR("DateTime")))
    SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("Date"));
  if (DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("PartialDate"))
    || DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("RelativeDayOfWeek")))
  {
    return 1;
  }
  v3 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("Date"));
  return DDResultGetSubresultWithType((uint64_t)v3, CFSTR("RelativeDayOfWeek")) != 0;
}

CFStringRef DDResultCopyExtractedURL(uint64_t a1)
{
  return DDResultCopyExtractedURLWithOptions(a1, 1);
}

const __CFString *DDResultCopyCleanPhoneNumber(uint64_t a1)
{
  const __CFString **SubresultWithType;
  const __CFString *v3;
  const __CFAllocator *v4;
  CFIndex Length;
  __CFString *MutableCopy;
  const __CFString *v7;
  CFMutableStringRef v8;
  const __CFString **v10;
  const __CFString **v11;
  const __CFString *v12;
  CFIndex v13;
  int CharacterAtIndex;
  CFStringRef v16;
  CFRange v17;

  SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("Value"));
  if (!SubresultWithType)
    return 0;
  v3 = SubresultWithType[9];
  if (v3)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Length = CFStringGetLength(SubresultWithType[9]);
    MutableCopy = CFStringCreateMutableCopy(v4, Length, v3);
    v3 = DDResultCopyStrippedPhoneNumber(MutableCopy);
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (CFStringGetLength(v3) >= 4 && (CFStringHasPrefix(v3, CFSTR("112")) || CFStringHasPrefix(v3, CFSTR("911"))))
    {
      v7 = 0;
      v8 = (CFMutableStringRef)v3;
LABEL_9:
      CFRelease(v8);
      return v7;
    }
    v10 = DDResultGetSubresultWithType(a1, CFSTR("Extension"));
    v11 = DDResultGetSubresultWithType((uint64_t)v10, CFSTR("Value"));
    if (v11)
    {
      v12 = v11[9];
      if (v12)
      {
        v13 = CFStringGetLength(v11[9]);
        v8 = CFStringCreateMutableCopy(v4, v13, v12);
        CFStringTrimWhitespace(v8);
        v17.length = CFStringGetLength(v8);
        v17.location = 0;
        CFStringFindAndReplace(v8, CFSTR("p"), CFSTR(","), v17, 0x100uLL);
        if (CFStringGetLength(v8) < 1)
        {
          v7 = v3;
          goto LABEL_9;
        }
        CharacterAtIndex = CFStringGetCharacterAtIndex(v8, 0);
        if (CharacterAtIndex == 44 || CharacterAtIndex == 59)
          v16 = CFStringCreateWithFormat(v4, 0, CFSTR("%@%@"), v3, v8);
        else
          v16 = CFStringCreateWithFormat(v4, 0, CFSTR("%@;%@"), v3, v8);
        v7 = v16;
        CFRelease(v8);
        v8 = (CFMutableStringRef)v3;
        if (v7)
          goto LABEL_9;
      }
    }
  }
  return v3;
}

CFStringRef DDResultCopyStrippedPhoneNumber(__CFString *a1)
{
  uint64_t Length;
  CFIndex v3;
  UniChar *v4;
  uint64_t v5;
  int v6;
  CFIndex v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  CFStringRef v11;
  UniChar v13[20];
  uint64_t v14;
  CFRange v15;
  CFRange v16;
  CFRange v17;

  v14 = *MEMORY[0x1E0C80C00];
  if (!CFStringHasPrefix(a1, CFSTR("(0)")))
  {
    v17.length = CFStringGetLength(a1);
    v17.location = 0;
    CFStringFindAndReplace(a1, CFSTR("(0)"), &stru_1E3C973D8, v17, 0);
  }
  Length = CFStringGetLength(a1);
  v3 = Length;
  if (Length < 21)
  {
    v4 = v13;
    v16.location = 0;
    v16.length = Length;
    CFStringGetCharacters(a1, v16, v13);
    if (v3 <= 0)
      return CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, 0);
  }
  else
  {
    v4 = (UniChar *)malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
    v15.location = 0;
    v15.length = v3;
    CFStringGetCharacters(a1, v15, v4);
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v4[v5];
    if (v6)
    {
      v6 = 1;
      v10 = v8;
LABEL_32:
      v4[v7++] = v9;
      goto LABEL_33;
    }
    v10 = 0;
    if (v4[v5] > 0xFF07u)
    {
      v6 = 0;
      switch(v4[v5])
      {
        case 0xFF08u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 40;
          goto LABEL_31;
        case 0xFF09u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 41;
          goto LABEL_31;
        case 0xFF0Au:
        case 0xFF0Cu:
        case 0xFF0Du:
        case 0xFF0Eu:
        case 0xFF0Fu:
          goto LABEL_32;
        case 0xFF0Bu:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 43;
          goto LABEL_31;
        case 0xFF10u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 48;
          goto LABEL_31;
        case 0xFF11u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 49;
          goto LABEL_31;
        case 0xFF12u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 50;
          goto LABEL_31;
        case 0xFF13u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 51;
          goto LABEL_31;
        case 0xFF14u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 52;
          goto LABEL_31;
        case 0xFF15u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 53;
          goto LABEL_31;
        case 0xFF16u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 54;
          goto LABEL_31;
        case 0xFF17u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 55;
          goto LABEL_31;
        case 0xFF18u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 56;
          goto LABEL_31;
        case 0xFF19u:
          v10 = 0;
          v6 = 0;
          LOWORD(v9) = 57;
          goto LABEL_31;
        default:
          goto LABEL_37;
      }
      goto LABEL_32;
    }
    if (v4[v5] > 0x2011u)
    {
      v6 = 0;
      if ((v9 - 8210) < 3)
      {
        v10 = 0;
        v6 = 0;
        LOWORD(v9) = 45;
LABEL_31:
        v4[v5] = v9;
      }
      goto LABEL_32;
    }
    if (v9 != 32)
    {
      if (v9 == 38 || v9 == 63)
      {
        v10 = 0;
        v6 = 1;
      }
      else
      {
LABEL_37:
        v6 = 0;
      }
      goto LABEL_32;
    }
    v6 = 0;
    v10 = 1;
    if (!(_DWORD)v8)
    {
      LOWORD(v9) = 32;
      goto LABEL_32;
    }
LABEL_33:
    ++v5;
    v8 = v10;
  }
  while (v3 != v5);
  v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, v7);
  if (v4 != v13)
    free(v4);
  return v11;
}

const __CFString *DDCopyPunycodedWebURLString(const __CFString *result)
{
  const __CFString *v1;

  if (result)
  {
    v1 = result;
    result = (const __CFString *)DDCreatePunycodedString(result, 1, 1, 0);
    if (!result)
      return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1);
  }
  return result;
}

uint64_t DDResultCopyPhoneValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 0);
}

uint64_t DDResultCopyValueLabelValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3, int a4)
{
  uint64_t result;
  const void *v9;
  const __CFString **SubresultWithType;
  const __CFString *v11;

  if (a2)
  {
    result = (uint64_t)DDResultCopyCleanPhoneNumber(a1);
    if (!result)
      return result;
    v9 = (const void *)result;
    if (!CFStringGetLength((CFStringRef)result))
    {
      CFRelease(v9);
      return 0;
    }
    *a2 = v9;
  }
  if (a3)
  {
    SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("Label"));
    if (SubresultWithType)
    {
      v11 = SubresultWithType[10];
      if (v11 || (v11 = SubresultWithType[9]) != 0)
      {
        if (CFStringGetLength(v11))
        {
          *a3 = CFStringCreateCopy(0, v11);
          return 1;
        }
      }
    }
    if (!a4)
    {
      *a3 = 0;
      return 1;
    }
    if (a2)
    {
      CFRelease(*a2);
      result = 0;
      *a2 = 0;
      return result;
    }
    return 0;
  }
  return 1;
}

uint64_t DDResultCopyMailValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 0);
}

uint64_t DDResultCopyIMScreenNameValue(uint64_t a1, CFTypeRef *a2, CFStringRef *a3)
{
  return DDResultCopyValueLabelValue(a1, a2, a3, 1);
}

BOOL DDResultIsValidPhoneNumberString(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  const __CFString *v3;
  const __CFString *v4;
  _BOOL8 v5;

  if (!a1)
    return 0;
  if (DDResultIsValidPhoneNumberString_onceToken != -1)
    dispatch_once(&DDResultIsValidPhoneNumberString_onceToken, &__block_literal_global_16_1670);
  if (!DDResultIsValidPhoneNumberString_frameworkAvailable)
    return 0;
  if (getLocaleForExtraction_sOnce != -1)
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
  if (_sLocaleForExtraction)
    CFLocaleGetValue((CFLocaleRef)_sLocaleForExtraction, (CFLocaleKey)*MEMORY[0x1E0C9B060]);
  v1 = CFPhoneNumberCreate();
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  v3 = (const __CFString *)CFPhoneNumberCopyNumberForInternationalAssist();
  if (v3)
  {
    v4 = v3;
    v5 = CFStringGetLength(v3) < 6 || PNIsValidPhoneNumberForCountry();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL DDResultIsValidPhoneNumber(uint64_t a1)
{
  _BOOL8 IsValidPhoneNumberString;
  CFTypeRef cf;

  if (!a1)
    return 0;
  cf = 0;
  DDResultCopyValueLabelValue(a1, &cf, 0, 0);
  if (!cf)
    return 0;
  IsValidPhoneNumberString = DDResultIsValidPhoneNumberString((uint64_t)cf);
  CFRelease(cf);
  return IsValidPhoneNumberString;
}

uint64_t DDResultCopyFullAddressComponents(uint64_t a1, const __CFString **a2, const __CFString **a3, const __CFString **a4, const __CFString **a5, const __CFString **a6)
{
  const __CFString **SubresultWithType;
  const __CFString **v13;
  const __CFString *v14;
  const __CFString **v15;
  const __CFString **v16;
  const __CFString *v17;
  const __CFString **v18;
  const __CFString **v19;
  const __CFString *v20;
  const __CFString **v21;
  const __CFString **v22;
  const __CFString *v23;
  const __CFString **v24;
  const __CFString **v25;
  const __CFString *v26;

  if (a2)
  {
    SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("Street"));
    if (!SubresultWithType)
    {
      *a2 = 0;
      goto LABEL_8;
    }
    v13 = SubresultWithType;
    v14 = SubresultWithType[10];
    if (v14)
    {
      *a2 = v14;
    }
    else
    {
      v14 = v13[9];
      *a2 = v14;
      if (!v14)
        goto LABEL_8;
    }
    CFRetain(v14);
  }
LABEL_8:
  if (!a3)
    goto LABEL_15;
  v15 = DDResultGetSubresultWithType(a1, CFSTR("City"));
  if (!v15)
  {
    *a3 = 0;
    goto LABEL_15;
  }
  v16 = v15;
  v17 = v15[10];
  if (v17)
  {
    *a3 = v17;
  }
  else
  {
    v17 = v16[9];
    *a3 = v17;
    if (!v17)
      goto LABEL_15;
  }
  CFRetain(v17);
LABEL_15:
  if (!a5)
    goto LABEL_22;
  v18 = DDResultGetSubresultWithType(a1, CFSTR("ZipCode"));
  if (!v18)
  {
    *a5 = 0;
    goto LABEL_22;
  }
  v19 = v18;
  v20 = v18[10];
  if (v20)
  {
    *a5 = v20;
  }
  else
  {
    v20 = v19[9];
    *a5 = v20;
    if (!v20)
      goto LABEL_22;
  }
  CFRetain(v20);
LABEL_22:
  if (!a4)
    goto LABEL_29;
  v21 = DDResultGetSubresultWithType(a1, CFSTR("State"));
  if (!v21)
  {
    *a4 = 0;
    goto LABEL_29;
  }
  v22 = v21;
  v23 = v21[10];
  if (v23)
  {
    *a4 = v23;
  }
  else
  {
    v23 = v22[9];
    *a4 = v23;
    if (!v23)
      goto LABEL_29;
  }
  CFRetain(v23);
LABEL_29:
  if (a6)
  {
    v24 = DDResultGetSubresultWithType(a1, CFSTR("Country"));
    if (v24)
    {
      v25 = v24;
      v26 = v24[10];
      if (v26)
      {
        *a6 = v26;
LABEL_35:
        CFRetain(v26);
        return 1;
      }
      v26 = v25[9];
      *a6 = v26;
      if (v26)
        goto LABEL_35;
    }
    else
    {
      *a6 = 0;
    }
  }
  return 1;
}

BOOL DDResultIsPartialDateRangeOrTimeRange(uint64_t a1, _BYTE *a2, const __CFString ***a3, const __CFString ***a4, const void *a5, const __CFTimeZone *a6)
{
  const __CFString *v12;
  uint64_t SubresultWithType;
  const __CFString **v14;
  const __CFString **v15;
  const __CFString **v16;
  const __CFString **v17;
  const __CFString **v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int v34;
  char IsPastDate;
  char v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString **v51;
  const __CFString **v52;
  BOOL v54;
  _QWORD *v55;
  _QWORD *v56;

  v12 = *(const __CFString **)(a1 + 64);
  if (!_typesAreEqual(v12, CFSTR("DateDuration")))
  {
    if (!_typesAreEqual(v12, CFSTR("TimeDuration")))
    {
      v33 = 0;
      v34 = 1;
      if (!a2)
      {
        v36 = 1;
        SubresultWithType = 0;
        goto LABEL_66;
      }
      IsPastDate = 0;
      SubresultWithType = 0;
      v36 = 1;
LABEL_38:
      *a2 = IsPastDate;
      goto LABEL_66;
    }
    SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, CFSTR("BeginTime"));
    v14 = DDResultGetSubresultWithType(a1, CFSTR("EndTime"));
    goto LABEL_27;
  }
  SubresultWithType = (uint64_t)DDResultGetSubresultWithType(a1, CFSTR("BeginDate"));
  v14 = DDResultGetSubresultWithType(a1, CFSTR("EndDate"));
  if (SubresultWithType | (unint64_t)v14)
  {
LABEL_27:
    v33 = v14;
    goto LABEL_28;
  }
  v15 = DDResultGetSubresultWithType(a1, CFSTR("Date"));
  if (v15)
  {
    v16 = v15;
    v17 = DDResultGetSubresultWithType(a1, CFSTR("TimeDuration"));
    v55 = 0;
    v56 = 0;
    v18 = DDResultGetSubresultWithType(a1, CFSTR("ApproxTime"));
    DDResultIsPartialDateRangeOrTimeRange(v17, 0, &v56, &v55, 0, 0);
    if (v56)
    {
      v19 = v16[2];
      v20 = v16[3];
      v22 = v56[2];
      v21 = v56[3];
      v23 = (uint64_t)(int)v19 >> 16;
      v24 = (uint64_t)(int)v22 >> 16;
      if (SHIDWORD(v19) >= SHIDWORD(v22))
        v25 = (const __CFString *)v56[2];
      else
        v25 = v16[2];
      if ((int)v23 <= (int)v24)
        v22 = (uint64_t)v25;
      if ((int)v23 >= (int)v24)
        v26 = v22;
      else
        v26 = (uint64_t)v16[2];
      v27 = (uint64_t)(int)v20 >> 16;
      v28 = (uint64_t)(int)v21 >> 16;
      if (SHIDWORD(v20) >= SHIDWORD(v21))
        v29 = v16[3];
      else
        v29 = (const __CFString *)v56[3];
      v30 = (int)v27 < (int)v28;
      if ((int)v27 <= (int)v28)
        v31 = (uint64_t)v29;
      else
        v31 = (uint64_t)v16[3];
      if (v30)
        v32 = v56[3];
      else
        v32 = v31;
      SubresultWithType = (uint64_t)DDResultCreate(CFSTR("DateTime"), v26, v32);
      DDResultAddSubresult(SubresultWithType, v16);
      DDResultAddSubresultSorted(SubresultWithType, v56);
      if (v18)
        DDResultAddSubresultSorted(SubresultWithType, v18);
      CFAutorelease((CFTypeRef)SubresultWithType);
    }
    else
    {
      SubresultWithType = 0;
    }
    if (v55)
    {
      v37 = v16[2];
      v38 = v16[3];
      v40 = v55[2];
      v39 = v55[3];
      v41 = (uint64_t)(int)v37 >> 16;
      v42 = (uint64_t)(int)v40 >> 16;
      if (SHIDWORD(v37) >= SHIDWORD(v40))
        v43 = (const __CFString *)v55[2];
      else
        v43 = v16[2];
      if ((int)v41 <= (int)v42)
        v40 = (uint64_t)v43;
      if ((int)v41 >= (int)v42)
        v44 = v40;
      else
        v44 = (uint64_t)v16[2];
      v45 = (uint64_t)(int)v38 >> 16;
      v46 = (uint64_t)(int)v39 >> 16;
      if (SHIDWORD(v38) >= SHIDWORD(v39))
        v47 = v16[3];
      else
        v47 = (const __CFString *)v55[3];
      v48 = (int)v45 < (int)v46;
      if ((int)v45 <= (int)v46)
        v49 = (uint64_t)v47;
      else
        v49 = (uint64_t)v16[3];
      if (v48)
        v50 = v55[3];
      else
        v50 = v49;
      v33 = DDResultCreate(CFSTR("DateTime"), v44, v50);
      DDResultAddSubresult((uint64_t)v33, v16);
      DDResultAddSubresultSorted((uint64_t)v33, v55);
      if (v18)
        DDResultAddSubresultSorted((uint64_t)v33, v18);
      CFAutorelease(v33);
    }
    else
    {
      v33 = 0;
    }
    v34 = 0;
    if (!a2)
      goto LABEL_65;
    goto LABEL_29;
  }
  v33 = 0;
  SubresultWithType = 0;
LABEL_28:
  v34 = 1;
  if (a2)
  {
LABEL_29:
    if (!SubresultWithType || v33)
    {
      v36 = 0;
      if (SubresultWithType || !v33)
      {
        IsPastDate = 0;
      }
      else
      {
        SubresultWithType = 0;
        v36 = 0;
        IsPastDate = DDResultIsPastDate((uint64_t)v33, a5, a6) ^ 1;
      }
    }
    else
    {
      IsPastDate = DDResultIsPastDate(SubresultWithType, a5, a6);
      v36 = 0;
    }
    goto LABEL_38;
  }
LABEL_65:
  v36 = 0;
LABEL_66:
  if (a3)
  {
    v51 = (const __CFString **)SubresultWithType;
    if (SubresultWithType)
    {
      v51 = (const __CFString **)SubresultWithType;
      if (v34)
      {
        v51 = DDResultGetSubresultWithType(SubresultWithType, CFSTR("DateTime"));
        if (!v51)
        {
          v51 = DDResultGetSubresultWithType(SubresultWithType, CFSTR("Date"));
          if (!v51)
            v51 = DDResultGetSubresultWithType(SubresultWithType, CFSTR("Time"));
        }
      }
    }
    *a3 = v51;
  }
  if (a4)
  {
    v52 = (const __CFString **)v33;
    if (v33)
    {
      v52 = (const __CFString **)v33;
      if (v34)
      {
        v52 = DDResultGetSubresultWithType((uint64_t)v33, CFSTR("DateTime"));
        if (!v52)
        {
          v52 = DDResultGetSubresultWithType((uint64_t)v33, CFSTR("Date"));
          if (!v52)
            v52 = DDResultGetSubresultWithType((uint64_t)v33, CFSTR("Time"));
        }
      }
    }
    *a4 = v52;
  }
  if ((v36 & 1) != 0)
    return 0;
  if (SubresultWithType && !v33)
    return 1;
  if (SubresultWithType)
    v54 = 1;
  else
    v54 = v33 == 0;
  return !v54;
}

BOOL DDResultIsDateRangeOrTimeRange(uint64_t a1, _BYTE *a2)
{
  return DDResultIsPartialDateRangeOrTimeRange(a1, a2, 0, 0, 0, 0);
}

uint64_t DDResultTimeIsApprox(const __CFString **a1)
{
  const __CFString **SubresultWithType;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString **v5;
  const __CFString **v6;
  BOOL v7;
  uint64_t result;

  while (1)
  {
    while (1)
    {
      SubresultWithType = a1;
      v2 = a1[8];
      if (_typesAreEqual(v2, CFSTR("DateTime")))
      {
        SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("Time"));
        if (SubresultWithType)
          goto LABEL_18;
        return 1;
      }
      if (_typesAreEqual(v2, CFSTR("Time")))
        goto LABEL_18;
      if (!_typesAreEqual(v2, CFSTR("DateDuration")))
        break;
      v3 = CFSTR("BeginDate");
      v4 = CFSTR("EndDate");
LABEL_7:
      v5 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, v3);
      v6 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, v4);
      if (v5)
      {
        a1 = v5;
        if (!v6)
          continue;
      }
      if (!v5)
      {
        a1 = v6;
        if (v6)
          continue;
      }
      result = 0;
      if (v5)
      {
        if (v6)
        {
          result = DDResultTimeIsApprox(v5);
          if ((_DWORD)result)
          {
            v7 = DDResultTimeIsApprox(v6) == 0;
            return !v7;
          }
        }
      }
      return result;
    }
    if (_typesAreEqual(v2, CFSTR("TimeDuration")))
    {
      v3 = CFSTR("BeginTime");
      v4 = CFSTR("EndTime");
      goto LABEL_7;
    }
    if (!_typesAreEqual(v2, CFSTR("BeginDate")) && !_typesAreEqual(v2, CFSTR("EndDate")))
      break;
    a1 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("DateTime"));
    if (!a1)
      return DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("ApproxTime")) != 0;
  }
  if (!_typesAreEqual(v2, CFSTR("BeginTime")) && !_typesAreEqual(v2, CFSTR("EndTime")))
    return 0;
  SubresultWithType = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("Time"));
  if (!SubresultWithType)
    return 0;
LABEL_18:
  v7 = DDResultGetSubresultWithType((uint64_t)SubresultWithType, CFSTR("ApproxTime")) == 0;
  return !v7;
}

void DDResultSetCurrentDateForExtraction(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __DDResultSetCurrentDateForExtraction_block_invoke;
  block[3] = &__block_descriptor_tmp_19_1677;
  block[4] = a1;
  if (DDResultSetCurrentDateForExtraction_sOnce != -1)
    dispatch_once(&DDResultSetCurrentDateForExtraction_sOnce, block);
}

CFLocaleRef DDResultSetLocaleForExtraction(const __CFLocale *cf)
{
  CFLocaleRef result;
  CFLocaleRef System;

  result = (CFLocaleRef)_sLocaleForExtraction;
  if ((const __CFLocale *)_sLocaleForExtraction != cf)
  {
    if (_sLocaleForExtraction)
      CFRelease((CFTypeRef)_sLocaleForExtraction);
    _sLocaleForExtraction = (uint64_t)cf;
    if (cf)
    {
      System = cf;
      return (CFLocaleRef)CFRetain(System);
    }
    result = CFLocaleCopyCurrent();
    _sLocaleForExtraction = (uint64_t)result;
    if (!result)
    {
      System = CFLocaleGetSystem();
      _sLocaleForExtraction = (uint64_t)System;
      return (CFLocaleRef)CFRetain(System);
    }
  }
  return result;
}

uint64_t DDResultPhysicalUnitExtraction(uint64_t result, double *a2, unint64_t a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    result = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("PhysicalAmount"));
    if ((_DWORD)result)
      return _DDResultValueUnitExtraction(v5, a2, a3, 0) != 0;
  }
  return result;
}

CFStringRef DDResultCopyAuthCode(CFStringRef result)
{
  CFStringRef v1;
  const __CFString *info;
  CFIndex Length;
  CFIndex v4;
  BOOL v5;
  CFIndex v6;
  CFIndex v7;
  int CharacterAtIndex;
  UniChar chars[10];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (_typesAreEqual((CFStringRef)result[2].isa, CFSTR("AuthCode")))
    {
      info = (const __CFString *)v1[2].info;
      Length = CFStringGetLength(info);
      v4 = Length;
      if (Length >= 3)
      {
        v5 = 1;
        if (CFStringGetCharacterAtIndex(info, 1) != 45)
          v5 = CFStringGetCharacterAtIndex(info, 2) == 45;
        goto LABEL_8;
      }
      if (Length >= 1)
      {
        v5 = 1;
LABEL_8:
        v6 = 0;
        v7 = 0;
        do
        {
          CharacterAtIndex = CFStringGetCharacterAtIndex(info, v6);
          if ((CharacterAtIndex - 48) < 0xA || !v5 && (CharacterAtIndex & 0xFFFFFFDF) - 65 <= 0x19)
          {
            if (v7 > 9)
              return 0;
            chars[v7++] = CharacterAtIndex;
          }
          ++v6;
        }
        while (v4 != v6);
        if (v7 >= 1)
          return CFStringCreateWithCharacters(0, chars, v7);
      }
    }
    return 0;
  }
  return result;
}

uint64_t DDResultSelectBest(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v5;

  if (a1)
    v2 = a1;
  else
    v2 = a2;
  if (!a1)
    return v2;
  v3 = a2;
  if (!a2)
    return v2;
  v5 = *(const __CFString **)(a2 + 64);
  if (!_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("DateTime"))
    || !_typesAreEqual(v5, CFSTR("DateTime"))
    || DDResultGetSubresultWithTypePath(a1, CFSTR("Date.AbsoluteDate.DayNumber"))
    || DDResultGetSubresultWithTypePath(a1, CFSTR("Date.AbsoluteDate.AmbiguousDate.DayNumber"))
    || !DDResultGetSubresultWithTypePath(v3, CFSTR("Date.AbsoluteDate.DayNumber"))
    && !DDResultGetSubresultWithTypePath(v3, CFSTR("Date.AbsoluteDate.AmbiguousDate.DayNumber")))
  {
    return v2;
  }
  return v3;
}

BOOL DDResultDateExtractionDependsOnContextTense(const __CFString **SubresultWithType)
{
  uint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  const __CFString *v4;

  while (1)
  {
    v1 = (uint64_t)SubresultWithType;
    v2 = SubresultWithType[8];
    if (_typesAreEqual(v2, CFSTR("RelativeDayOfWeek")))
      break;
    if (_typesAreEqual(v2, CFSTR("Date")))
    {
      v3 = v1;
      v4 = CFSTR("RelativeDayOfWeek");
      goto LABEL_9;
    }
    if (_typesAreEqual(v2, CFSTR("DateTime")))
      goto LABEL_8;
    if (_typesAreEqual(v2, CFSTR("BeginDate")) || _typesAreEqual(v2, CFSTR("EndDate")))
    {
      SubresultWithType = DDResultGetSubresultWithType(v1, CFSTR("DateTime"));
      if (!SubresultWithType)
      {
LABEL_8:
        v3 = v1;
        v4 = CFSTR("Date");
        goto LABEL_9;
      }
    }
    else
    {
      if (!_typesAreEqual(v2, CFSTR("DateDuration")))
        return 0;
      SubresultWithType = DDResultGetSubresultWithType(v1, CFSTR("Date"));
      if (!SubresultWithType)
      {
        if (DDResultGetSubresultWithType(v1, CFSTR("BeginDate"))
          && DDResultDateExtractionDependsOnContextTense())
        {
          return 1;
        }
        v3 = v1;
        v4 = CFSTR("EndDate");
LABEL_9:
        SubresultWithType = DDResultGetSubresultWithType(v3, v4);
        if (!SubresultWithType)
          return 0;
      }
    }
  }
  return DDResultGetSubresultWithType(v1, CFSTR("DayOfWeek")) != 0;
}

BOOL DDResultNeedsMeridianGuess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  BOOL v6;
  __int16 v7;

  if (DDResultGetCategory(a1) != 4)
    return 0;
  if (a2)
  {
    v4 = a2;
  }
  else
  {
    if (getLocaleForExtraction_sOnce != -1)
      dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
    v4 = _sLocaleForExtraction;
  }
  if (localeHasStrict24Hrs(v4))
    return 0;
  v7 = 0;
  _DDResultNeedsMeridianGuess(a1, &v7, (_BYTE *)&v7 + 1);
  if (HIBYTE(v7))
    v6 = 1;
  else
    v6 = v7 == 0;
  return !v6;
}

BOOL _DDResultNeedsMeridianGuess(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  CFStringRef *ValueAtIndex;
  uint64_t v10;
  BOOL v11;
  const __CFString *v12;
  const __CFString *v13;
  char v15;
  int v16;

  v5 = *(const __CFArray **)(a1 + 56);
  if (!v5)
    return *a3 && *a2 != 0;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (Count < 1)
    return *a3 && *a2 != 0;
  v7 = Count;
  v8 = 0;
  while (1)
  {
    ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v5, v8);
    v10 = (uint64_t)ValueAtIndex;
    if (*a2)
      v11 = 1;
    else
      v11 = ValueAtIndex == 0;
    if (v11 || !_typesAreEqual(ValueAtIndex[8], CFSTR("Hours")))
    {
      if (!*a3)
      {
        if (extractMeridianValue(v10, &v15, &v15, &v15, &v15))
        {
          *a3 = 1;
          if (*a2)
            return 1;
        }
      }
      goto LABEL_22;
    }
    v12 = *(const __CFString **)(v10 + 80);
    if (v12)
    {
      v16 = 0;
      v13 = v12;
    }
    else
    {
      v12 = *(const __CFString **)(v10 + 72);
      if (!v12)
        goto LABEL_22;
      v16 = 0;
      v13 = *(const __CFString **)(v10 + 72);
    }
    if (DDFastIntegerExtraction(v13, &v16) && v16 <= 11)
    {
      *a2 = 1;
      if (*a3)
        return 1;
      if (CFStringGetLength(v12) >= 1 && CFStringGetCharacterAtIndex(v12, 0) == 48)
        break;
    }
LABEL_22:
    if (_DDResultNeedsMeridianGuess(v10, a2, a3))
      return 1;
    if (v7 == ++v8)
      return *a3 && *a2 != 0;
  }
  *a3 = 1;
  return 1;
}

uint64_t DDResultCopyDomesticIdentifierValue(uint64_t result, CFMutableStringRef *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  uint64_t v7;
  const __CFArray *v8;
  uint64_t v9;
  CFTypeRef *ValueAtIndex;
  CFTypeRef *v11;
  const __CFString *v12;
  CFMutableStringRef MutableCopy;
  CFRange v14;
  CFRange v15;

  if (result)
  {
    v7 = result;
    result = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("DomesticIdentifier"));
    if ((_DWORD)result)
    {
      v8 = *(const __CFArray **)(v7 + 56);
      if (v8 && CFArrayGetCount(v8) == 2)
      {
        result = (uint64_t)CFArrayGetValueAtIndex(v8, 1);
        if (result)
        {
          v9 = result;
          result = _typesAreEqual(*(CFStringRef *)(result + 64), CFSTR("CountryCode"));
          if ((_DWORD)result)
          {
            if (a4)
              *a4 = CFRetain(*(CFTypeRef *)(v9 + 80));
            ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(v8, 0);
            v11 = ValueAtIndex;
            if (a3)
              *a3 = CFRetain(ValueAtIndex[8]);
            if (a2)
            {
              if (v11)
                v12 = (const __CFString *)v11[9];
              else
                v12 = 0;
              MutableCopy = CFStringCreateMutableCopy(0, 30, v12);
              v14.length = CFStringGetLength(MutableCopy);
              v14.location = 0;
              CFStringFindAndReplace(MutableCopy, CFSTR(" "), &stru_1E3C973D8, v14, 0);
              v15.length = CFStringGetLength(MutableCopy);
              v15.location = 0;
              CFStringFindAndReplace(MutableCopy, CFSTR("-"), &stru_1E3C973D8, v15, 0);
              *a2 = MutableCopy;
            }
            return 1;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

CFTypeRef DDResultCopyUPIIdentifierValue(uint64_t a1)
{
  if (a1 && _typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("UPIIdentifier")))
    return CFRetain(*(CFTypeRef *)(a1 + 72));
  else
    return 0;
}

id DDResultGetShipmentTrackingUrlWithCarrier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (DDResultGetShipmentTrackingUrlWithCarrier_onceToken != -1)
    dispatch_once(&DDResultGetShipmentTrackingUrlWithCarrier_onceToken, &__block_literal_global_1691);
  v5 = 0;
  if (v3 && v4)
  {
    v6 = (void *)DDResultGetShipmentTrackingUrlWithCarrier_carrierLookupTable;
    objc_msgSend(v3, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invertedSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", &stru_1E3C973D8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      getShipmentTrackingUrlString(v12, v8);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }
      v4 = v12;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v8 = v3;
  }

  return v5;
}

id getShipmentTrackingUrlString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  char v11;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "length") && objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lowercaseString");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v9
        || !objc_msgSend(v5, "isEqualToString:", CFSTR("ebay"))
        || (objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("au"), CFSTR("at"), CFSTR("ca"), CFSTR("fr"), CFSTR("de"), CFSTR("hk"), CFSTR("in"), CFSTR("ie"), CFSTR("it"), CFSTR("my"), CFSTR("nl"), CFSTR("ph"), CFSTR("pl"), CFSTR("sg"), CFSTR("es"), CFSTR("ch"), CFSTR("gb"),
              0),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "containsObject:", v9),
            v10,
            (v11 & 1) == 0))
      {

        v9 = &stru_1E3C973D8;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://trackingshipment.apple.com/?Company=%@&Locale=%@&TrackingNumber=%@"), v5, v9, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

CFTypeRef DDResultGetShipmentTrackingUrlString(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  CFTypeRef v23;

  if (a1)
  {
    if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("TrackingNumber")))
    {
      v2 = *(id *)(a1 + 56);
      if (objc_msgSend(v2, "count") == 1)
      {
        v3 = objc_msgSend(v2, "objectAtIndex:", 0);
        v4 = *(id *)(v3 + 64);
        v5 = *(void **)(v3 + 72);
        objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "invertedSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsJoinedByString:", &stru_1E3C973D8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
        getShipmentTrackingUrlString(v9, v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v21;
          v23 = CFAutorelease(v22);
        }
        else
        {
          v22 = 0;
          v23 = 0;
        }

        goto LABEL_23;
      }
LABEL_20:
      v23 = 0;
LABEL_23:

      return v23;
    }
    if (_typesAreEqual(*(CFStringRef *)(a1 + 64), CFSTR("TrackingInformation")))
    {
      v2 = *(id *)(a1 + 56);
      if (objc_msgSend(v2, "count") != 2)
        goto LABEL_20;
      v10 = 0;
      v9 = 0;
      v4 = 0;
      v11 = 1;
      while (1)
      {
        v12 = v11;
        v13 = objc_msgSend(v2, "objectAtIndex:", v10);
        if (v13)
        {
          v14 = v13;
          if (_typesAreEqual(*(CFStringRef *)(v13 + 64), CFSTR("Carrier")))
          {
            v15 = *(void **)(v14 + 80);
            if (!v15)
              v15 = *(void **)(v14 + 72);
            v16 = v4;
            v4 = v15;
            goto LABEL_15;
          }
          if (_typesAreEqual(*(CFStringRef *)(v14 + 64), CFSTR("TrackingNumber")))
          {
            v17 = *(void **)(v14 + 72);
            objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "invertedSet");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "componentsSeparatedByCharactersInSet:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "componentsJoinedByString:", &stru_1E3C973D8);
            v20 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v20;
LABEL_15:

          }
        }
        v11 = 0;
        v10 = 1;
        if ((v12 & 1) == 0)
          goto LABEL_17;
      }
    }
  }
  return 0;
}

void ___dd_dispatch_get_queue_for_read_entitlements_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("dd_source_read_entitlements", 0);
  v1 = (void *)_dd_dispatch_get_queue_for_read_entitlements_sQueue;
  _dd_dispatch_get_queue_for_read_entitlements_sQueue = (uint64_t)v0;

}

id _dd_dispatch_get_queue_for_writing()
{
  if (_dd_dispatch_get_queue_for_writing_onceToken != -1)
    dispatch_once(&_dd_dispatch_get_queue_for_writing_onceToken, &__block_literal_global_1871);
  return (id)_dd_dispatch_get_queue_for_writing_sQueue;
}

void sub_19BC34C64(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void ___dd_dispatch_get_queue_for_writing_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("dd_source_write", 0);
  v1 = (void *)_dd_dispatch_get_queue_for_writing_sQueue;
  _dd_dispatch_get_queue_for_writing_sQueue = (uint64_t)v0;

}

void sub_19BC35410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1904(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1905(uint64_t a1)
{

}

BOOL DDScannerScanStringFromConversation(_BOOL8 result, __CFString *theString, void *a3)
{
  uint64_t v4;
  void *v6;
  __CFString *v7;
  id v8;
  id v9;
  DDMessageCacheElement *v10;
  __CFString *v11;
  CFIndex Length;
  const __CFString *v13;
  uint64_t v14;
  CFIndex v15;

  if (result)
  {
    v4 = result;
    if (!theString)
    {
      DDScannerReset(result);
      return 0;
    }
    if (!a3)
    {
      Length = CFStringGetLength(theString);
      return DDScannerScanStringWithRangeAndContextOffset(v4, theString, 0, Length, 0);
    }
    v14 = 0;
    v15 = CFStringGetLength(theString);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = theString;
    v8 = v6;
    v9 = a3;
    if (v8)
    {
      if (_DDMessageCacheStringForMessage__onceToken != -1)
        dispatch_once(&_DDMessageCacheStringForMessage__onceToken, &__block_literal_global_1919);
      if ((unint64_t)-[__CFString length](v7, "length") <= 0x9C3)
      {
        v10 = objc_alloc_init(DDMessageCacheElement);
        -[DDMessageCacheElement setDate:](v10, "setDate:", v8);
        -[DDMessageCacheElement setText:](v10, "setText:", v7);
        objc_msgSend((id)_DDMessageCacheStringForMessage__cache, "stringWithElement:conversationID:range:", v10, v9, &v14);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v13 = v11;

        return DDScannerScanStringWithContextOffset(v4, v13, v14);
      }
      objc_msgSend((id)_DDMessageCacheStringForMessage__cache, "removeConversation:", v9);
    }
    v14 = 0;
    v15 = -[__CFString length](v7, "length");
    v11 = v7;
    goto LABEL_13;
  }
  return result;
}

void sub_19BC359E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1933(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1934(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t DDDFAScannerGetCFTypeID()
{
  return DDTypeRegister(&DDDFAScannerGetTypeID_typeID);
}

void _DDDFAScannerCFFinalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[4];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[5];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[3];
  if (v4)
    CFRelease(v4);
}

BOOL _DDDFAScannerCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _DDDFAScannerCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDDFAScanner:%p>"), a1);
}

CFStringRef _DDDFAScannerCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDDFAScanner:%p>"), a1);
}

void DDDFAScannerEmitResult(const __CFArray *a1, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v4;
  unint64_t v5;
  CFIndex Count;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *ValueAtIndex;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v17;
  uint64_t v18;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v29;
  uint64_t v30;

  v2 = a2;
  v4 = a2[2];
  v5 = a2[3];
  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
LABEL_68:
    CFArrayAppendValue(a1, v2);
    return;
  }
  v7 = (uint64_t)(int)v4 >> 16;
  v29 = v2;
  v30 = v2[6];
  v8 = Count + 1;
  v9 = 1;
  v10 = (uint64_t)(int)v5 >> 16;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v8 - 2);
    v13 = ValueAtIndex[2];
    v12 = ValueAtIndex[3];
    v14 = (uint64_t)(int)v12 >> 16;
    v15 = HIDWORD(v12);
    if ((int)v7 >= (int)v14 && ((int)v7 > (int)v14 || SHIDWORD(v4) >= SHIDWORD(v12)))
      break;
    v17 = HIDWORD(v13);
    v18 = (uint64_t)(int)v13 >> 16;
    if (HIDWORD(v4) == HIDWORD(v13)
      && (_DWORD)v7 == (_DWORD)v18
      && HIDWORD(v5) == HIDWORD(v12)
      && (_DWORD)v10 == (_DWORD)v14)
    {
      if (ValueAtIndex[6] >= v30)
      {
        v9 = 0;
        goto LABEL_66;
      }
    }
    else
    {
      if (SHIDWORD(v4) >= SHIDWORD(v13))
        v22 = ValueAtIndex[2];
      else
        v22 = v4;
      if ((int)v18 < (int)v7)
        v22 = ValueAtIndex[2];
      if ((int)v18 <= (int)v7)
        v23 = v22;
      else
        v23 = v4;
      if (SHIDWORD(v5) >= SHIDWORD(v12))
        v24 = v5;
      else
        v24 = ValueAtIndex[3];
      if ((int)v10 > (int)v14)
        v24 = v5;
      if ((int)v10 < (int)v14)
        v24 = ValueAtIndex[3];
      if (HIDWORD(v4) != HIDWORD(v23)
        || (_DWORD)v7 != (int)v23 >> 16
        || HIDWORD(v5) != HIDWORD(v24)
        || (_DWORD)v10 != (int)v24 >> 16)
      {
        if (SHIDWORD(v4) >= SHIDWORD(v13))
          v25 = ValueAtIndex[2];
        else
          v25 = v4;
        if ((int)v18 >= (int)v7)
          v13 = v25;
        if ((int)v18 > (int)v7)
          v13 = v4;
        if (SHIDWORD(v5) >= SHIDWORD(v12))
          v26 = v5;
        else
          v26 = ValueAtIndex[3];
        if ((int)v10 > (int)v14)
          v26 = v5;
        if ((int)v10 >= (int)v14)
          v12 = v26;
        if ((_DWORD)v17 == HIDWORD(v13)
          && (_DWORD)v18 == (int)v13 >> 16
          && (_DWORD)v15 == HIDWORD(v12)
          && (_DWORD)v14 == (int)v12 >> 16)
        {
          v9 = 0;
        }
        goto LABEL_66;
      }
    }
    CFArrayRemoveValueAtIndex(a1, v8 - 2);
LABEL_66:
    --v8;
  }
  while (v8 > 1);
  v2 = v29;
  if (v9)
    goto LABEL_68;
}

uint64_t DDDFAScannerSimulateState(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  BOOL v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD *);
  BOOL v16;
  uint64_t v17;
  CFComparisonResult v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned __int16 *i;
  uint64_t v31;
  _QWORD v33[8];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 16);
LABEL_2:
  if (v2 >= v3 - 5 && *(_BYTE *)(a1 + 120))
  {
    *(_QWORD *)(a1 + 112) = DDDFAScannerSimulateState;
    return 1;
  }
  v4 = *(_QWORD *)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(v5 + 56);
  v7 = (unsigned __int16 *)(*(_QWORD *)(v5 + 48) + 8 * v4);
  v8 = *v7;
  v9 = v4 < *(unsigned __int16 *)(v5 + 32) - 1;
  v10 = (unsigned __int16 *)(v5 + 36);
  if (v9)
    v10 = v7 + 4;
  v11 = *v10;
  if (!v7[1])
  {
    v21 = v2;
    goto LABEL_31;
  }
  v12 = *((int *)v7 + 1);
  v13 = *(const __CFString **)(*(_QWORD *)(v5 + 40) + 8 * (v7[1] - 1));
  v14 = *(_QWORD *)(a1 + 40) + v12;
  *(_QWORD *)(a1 + 32) = v13;
  *(_QWORD *)(a1 + 40) = v14;
  if (v14 >= 0)
  {
    v15 = *(unsigned int (**)(_QWORD *))(v5 + 72);
    if (v15)
      v16 = v2 == v3;
    else
      v16 = 1;
    if (v16)
    {
LABEL_15:
      if (v13)
      {
        v18 = CFStringCompare(v13, CFSTR("PhoneNumber"), 0);
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        if (v18 == kCFCompareEqualTo
          && !DDResultBufferIsValidForPhoneNumber(*(_QWORD *)a1, *(_QWORD *)(a1 + 48), v20 - v19, 1, *(unsigned __int8 *)(a1 + 73)))
        {
          goto LABEL_30;
        }
      }
      else
      {
        v19 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
      }
      v22 = *(_QWORD *)(a1 + 8) + v20;
      if (*(_BYTE *)(a1 + 72))
      {
        v23 = *(_QWORD *)(a1 + 40);
        if (*(_QWORD *)(a1 + 32))
          v24 = *(const __CFString **)(a1 + 32);
        else
          v24 = &stru_1E3C973D8;
        v25 = DDRootResultCreate(v24, (*(_DWORD *)(a1 + 64) << 16) | (unint64_t)(v19 << 32), (*(_DWORD *)(a1 + 64) << 16) | (unint64_t)(v22 << 32));
        v25[6] = v23;
        DDDFAScannerEmitResult(*(const __CFArray **)(a1 + 96), v25);
        CFRelease(v25);
      }
      else
      {
        v26 = v22 - v19;
        if (v22 - v19 > *(_QWORD *)(a1 + 88))
        {
          if (CFStringCompare(*(CFStringRef *)(a1 + 32), CFSTR("NoResult"), 0))
          {
            *(_QWORD *)(a1 + 80) = v19;
            *(_QWORD *)(a1 + 88) = v26;
          }
          else
          {
            *(_OWORD *)(a1 + 80) = xmmword_19BC3FC60;
          }
        }
      }
      goto LABEL_30;
    }
    v17 = *(_QWORD *)(a1 + 8);
    v33[0] = *(_QWORD *)a1;
    v33[1] = v17;
    memset(&v33[3], 0, 24);
    v33[2] = v3;
    v33[6] = v2;
    v33[7] = v2;
    v34 = xmmword_19BC3FC60;
    BYTE9(v34) = 0;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    if (v15(v33))
    {
      v13 = *(const __CFString **)(a1 + 32);
      goto LABEL_15;
    }
  }
LABEL_30:
  *(_QWORD *)(a1 + 40) -= v12;
  v21 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 16);
LABEL_31:
  if (v21 != v3)
  {
    v27 = *(_QWORD *)a1;
    v2 = v21 + 1;
    *(_QWORD *)(a1 + 56) = v21 + 1;
    if (v11 - v8 >= 1)
    {
      v28 = 0;
      v29 = *(unsigned __int16 *)(v27 + 2 * v21);
      for (i = (unsigned __int16 *)(v6 + 8 * v8 + 2); *(i - 1) <= v29; i += 4)
      {
        if (*i > v29)
        {
          v31 = v6 + 8 * v8 + 8 * v28;
          *(_QWORD *)(a1 + 40) += *(__int16 *)(v31 + 4);
          *(_QWORD *)(a1 + 104) = *(unsigned __int16 *)(v31 + 6);
          goto LABEL_2;
        }
        if (v11 - v8 == ++v28)
          return 0;
      }
    }
  }
  return 0;
}

uint64_t DDDFAScannerScanQuery(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  CFStringRef *v8;
  uint64_t *v9;
  const UniChar *CharactersPtr;
  _QWORD *v11;
  uint64_t v12;
  uint64_t i;
  _QWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  UniChar buffer[1024];
  uint64_t v25;

  v2 = a2;
  v25 = *MEMORY[0x1E0C80C00];
  v4 = a2[4];
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 32));
  if (v4 < 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = v2[2];
      v8 = (CFStringRef *)(v7 + 48 * v5);
      v9 = (uint64_t *)(v8 + 2);
      CharactersPtr = CFStringGetCharactersPtr(*v8);
      if (CharactersPtr)
      {
        v6 |= DDDFAScannerScanUnicharArrayFragment(a1, (uint64_t)&CharactersPtr[*v9], *(_QWORD *)(v7 + 48 * v5 + 24), v5);
      }
      else
      {
        v11 = v2;
        v12 = *(_QWORD *)(v7 + 48 * v5 + 24);
        v23 = 1;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v16[0] = buffer;
        v16[1] = 0;
        v16[2] = 0;
        DDDFAScannerFillInitialContext(a1, v5, *v9, *(_QWORD *)(a1 + 32), 1, 1, (uint64_t)v16);
        DDDFAScannerComputeResultsForContextWithRebuffering((uint64_t)v8, (uint64_t)v16, buffer);
        if (v12 >= 1)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_BYTE *)(a1 + 16))
              break;
            DDDFAScannerFillInitialContext(a1, v5, i + *v9, *(_QWORD *)(a1 + 32), 0, 1, (uint64_t)v16);
            DDDFAScannerComputeResultsForContextWithRebuffering((uint64_t)v8, (uint64_t)v16, buffer);
          }
        }
        v2 = v11;
      }
      ++v5;
    }
    while (v5 != v4);
  }
  DDDFAScannerPostprocessResults(a1, v2);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 32)) > 0)
    return 1;
  else
    return v6;
}

CFIndex DDDFAScannerPostprocessResults(uint64_t a1, void *a2)
{
  CFIndex i;
  CFIndex result;
  uint64_t *ValueAtIndex;
  uint64_t *v7;
  void (*v8)(uint64_t *);

  for (i = 0; ; ++i)
  {
    result = CFArrayGetCount(*(CFArrayRef *)(a1 + 32));
    if (i >= result)
      break;
    ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), i);
    v7 = ValueAtIndex;
    v8 = *(void (**)(uint64_t *))(*(_QWORD *)(a1 + 24) + 80);
    if (v8)
      v8(ValueAtIndex);
    if (a2)
      DDResultSetContent(v7, a2);
  }
  return result;
}

BOOL DDDFAScannerScanUnicharArrayFragment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9[0] = a2;
  v9[1] = 0;
  v9[2] = a3;
  DDDFAScannerFillInitialContext(a1, a4, 0, *(_QWORD *)(a1 + 32), 1, 1, (uint64_t)v9);
  (*((void (**)(_QWORD *))&v15 + 1))(v9);
  if (a3 >= 1)
  {
    v7 = 0;
    do
    {
      if (*(_BYTE *)(a1 + 16))
        break;
      DDDFAScannerFillInitialContext(a1, a4, v7, *(_QWORD *)(a1 + 32), 0, 1, (uint64_t)v9);
      (*((void (**)(_QWORD *))&v15 + 1))(v9);
      ++v7;
    }
    while (a3 != v7);
  }
  return CFArrayGetCount(*(CFArrayRef *)(a1 + 32)) > 0;
}

uint64_t DDDFAScannerFillInitialContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;

  v10 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a7 + 80) = xmmword_19BC3FC60;
  *(_BYTE *)(a7 + 72) = a6;
  if (a6)
    v11 = a4;
  else
    v11 = 0;
  *(_QWORD *)(a7 + 96) = v11;
  *(_QWORD *)(a7 + 24) = v10;
  *(_QWORD *)(a7 + 32) = 0;
  *(_QWORD *)(a7 + 40) = 0;
  *(_QWORD *)(a7 + 48) = a3;
  *(_QWORD *)(a7 + 56) = a3 - *(_QWORD *)(a7 + 8);
  *(_QWORD *)(a7 + 64) = a2;
  *(_BYTE *)(a7 + 73) = 0;
  if (getLocaleForExtraction_sOnce != -1)
    dispatch_once(&getLocaleForExtraction_sOnce, &__block_literal_global_213);
  result = _sLocaleForExtraction;
  if (_sLocaleForExtraction)
  {
    result = MEMORY[0x1A1ACA418]();
    if (result)
    {
      result = CFStringHasSuffix((CFStringRef)result, CFSTR("BR"));
      if ((_DWORD)result)
        *(_BYTE *)(a7 + 73) = 1;
    }
  }
  v13 = *(_QWORD *)(a1 + 24);
  if (a5 || (v14 = *(uint64_t (**)(uint64_t))(v13 + 64)) == 0)
  {
    v15 = *(unsigned __int16 *)(v13 + 38);
    v14 = DDDFAScannerSimulateState;
  }
  else
  {
    v15 = -1;
  }
  *(_QWORD *)(a7 + 104) = v15;
  *(_QWORD *)(a7 + 112) = v14;
  return result;
}

uint64_t DDDFAScannerComputeResultsForContextWithRebuffering(uint64_t a1, uint64_t a2, UniChar *buffer)
{
  uint64_t v6;
  CFRange v7;
  CFIndex v8;
  char v9;
  uint64_t result;

  do
  {
    v6 = *(_QWORD *)(a2 + 56);
    if (v6 < 0 || v6 >= *(_QWORD *)(a2 + 16) - 5 && *(_BYTE *)(a2 + 120))
    {
      v7.location = *(_QWORD *)(a2 + 8) + v6;
      *(_QWORD *)(a2 + 56) = 0;
      *(_QWORD *)(a2 + 8) = v7.location;
      *(_QWORD *)(a2 + 16) = 1024;
      v8 = *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 16);
      if (v7.location + 1024 >= v8)
      {
        v9 = 0;
        v7.length = v8 - v7.location;
        *(_QWORD *)(a2 + 16) = v8 - v7.location;
      }
      else
      {
        v9 = 1;
        v7.length = 1024;
      }
      *(_BYTE *)(a2 + 120) = v9;
      CFStringGetCharacters(*(CFStringRef *)a1, v7, buffer);
    }
    result = (*(uint64_t (**)(uint64_t))(a2 + 112))(a2);
  }
  while ((_DWORD)result && *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 8) < *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 16));
  return result;
}

BOOL DDDFAScannerScanUnicharArray(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BOOL8 v6;

  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 32));
  v6 = DDDFAScannerScanUnicharArrayFragment(a1, a2, a3, 0);
  DDDFAScannerPostprocessResults(a1, 0);
  return v6;
}

uint64_t DDDFAScannerFirstResultInUnicharArray(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17[0] = a2;
  v17[1] = 0;
  v9 = a3;
  v17[2] = a3;
  DDDFAScannerFillInitialContext(a1, 0, 0, *(_QWORD *)(a1 + 32), 1, 0, (uint64_t)v17);
  (*((void (**)(_QWORD *))&v23 + 1))(v17);
  if (*((_QWORD *)&v21 + 1) == -1)
  {
    v12 = *(_QWORD *)(a1 + 24);
    v13 = *(uint64_t (**)(uint64_t))(v12 + 64);
    if (v13)
    {
      v14 = -1;
    }
    else
    {
      v14 = *(unsigned __int16 *)(v12 + 38);
      v13 = DDDFAScannerSimulateState;
    }
    *(_QWORD *)&v23 = v14;
    *((_QWORD *)&v23 + 1) = v13;
    if (a3)
    {
      v15 = 0;
      while (!*(_BYTE *)(a1 + 16))
      {
        *(_QWORD *)&v19 = 0;
        *((_QWORD *)&v19 + 1) = v15;
        *(_QWORD *)&v20 = v15;
        (*((void (**)(_QWORD *))&v23 + 1))(v17);
        v16 = DWORD2(v21);
        if (*((_QWORD *)&v21 + 1) != -1)
        {
          *a4 = DWORD2(v21);
          v10 = v22 + v16;
          goto LABEL_3;
        }
        if (v9 == ++v15)
          return 0;
      }
    }
    return 0;
  }
  else
  {
    *a4 = 0;
    v10 = v22;
LABEL_3:
    *a5 = v10;
    return 1;
  }
}

void DDDFAScannerReset(uint64_t a1)
{
  const __CFArray *v1;
  CFRange v2;

  v1 = *(const __CFArray **)(a1 + 32);
  v2.length = CFArrayGetCount(v1);
  v2.location = 0;
  CFArrayReplaceValues(v1, v2, 0, 0);
}

CFArrayRef DDDFAScannerCopyResults(uint64_t a1)
{
  return CFArrayCreateCopy(0, *(CFArrayRef *)(a1 + 32));
}

uint64_t DDDFAScannerScanStringWithRange(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  NSObject *v10;
  uint8_t v12[16];

  if (!a2)
    return 0;
  if (!a1)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v10 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_19BC07000, v10, OS_LOG_TYPE_ERROR, "DDDFAScannerScanStringWithRange called with NULL scanner", v12, 2u);
    }
    return 0;
  }
  if (!a4)
    return 0;
  v8 = *(_QWORD **)(a1 + 40);
  if (v8)
  {
    DDScanQueryReset(v8);
    DDScanQueryAddTextFragment(*(_QWORD *)(a1 + 40), a2, a3, a4, 0, 0, 0);
    v9 = *(_QWORD **)(a1 + 40);
  }
  else
  {
    v9 = (_QWORD *)DDScanQueryCreateFromString(0, a2, a3, a4);
    *(_QWORD *)(a1 + 40) = v9;
  }
  return DDDFAScannerScanQuery(a1, v9);
}

uint64_t DDDFAScannerScanString(uint64_t a1, CFStringRef theString)
{
  CFIndex Length;
  const __CFArray *v6;
  CFRange v7;

  if (theString)
  {
    Length = CFStringGetLength(theString);
    return DDDFAScannerScanStringWithRange(a1, theString, 0, Length);
  }
  else
  {
    v6 = *(const __CFArray **)(a1 + 32);
    v7.length = CFArrayGetCount(v6);
    v7.location = 0;
    CFArrayReplaceValues(v6, v7, 0, 0);
    return 0;
  }
}

void _DDDFACacheCFFinalize(uint64_t a1)
{
  const void *v2;
  void *v3;
  unint64_t v4;
  unsigned int v5;
  CFStringRef v6;
  float v7;
  int *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(const void **)(a1 + 88);
  if (v2)
    CFRelease(v2);
  if (*(_DWORD *)(a1 + 28))
  {
    v3 = *(void **)(a1 + 40);
    if (v3 && *(_WORD *)(a1 + 34))
    {
      v4 = 0;
      do
        CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 8 * v4++));
      while (v4 < *(unsigned __int16 *)(a1 + 34));
      v3 = *(void **)(a1 + 40);
    }
    free(v3);
    v5 = *(_DWORD *)(a1 + 28);
    if (v5 > 0x3FF)
    {
      v7 = (float)v5;
      if (v5 >> 20)
        v6 = CFStringCreateWithFormat(0, 0, CFSTR("%.2f MB"), (float)(v7 * 0.00000095367));
      else
        v6 = CFStringCreateWithFormat(0, 0, CFSTR("%.2f KB"), (float)(v7 * 0.00097656));
    }
    else
    {
      v6 = CFStringCreateWithFormat(0, 0, CFSTR("%ld B"), *(unsigned int *)(a1 + 28));
    }
    CFRelease(v6);
    if (munmap(*(void **)(a1 + 16), *(unsigned int *)(a1 + 28)) < 0)
    {
      v8 = __error();
      v9 = strerror(*v8);
      DDLogErrD((uint64_t)v9, v10, v11, v12, v13, CFSTR("could not munmap file: %s"), v9);
    }
  }
}

BOOL _DDDFACacheCFEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _DDDFACacheCFCopyFormatDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDDFACache:%p states:%d transitions:%d>"), a1, *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 36));
}

CFStringRef _DDDFACacheCFCopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<DDDFACache:%p states:%d transitions:%d>"), a1, *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 36));
}

uint64_t DDExtractKanjiNumber(const __CFString *a1, _QWORD *a2)
{
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  int CharacterAtIndex;
  uint64_t result;
  BOOL v15;
  CFIndex v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;

  Length = CFStringGetLength(a1);
  if (Length >= 1)
  {
    v5 = Length;
    v44 = a2;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 1;
    while (1)
    {
      if ((v10 & 1) == 0)
      {
        if (v8 > 0xCCCCCCCCCCCCCCBLL)
          return 0;
        v8 *= 10;
      }
      CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      result = 0;
      v15 = CharacterAtIndex == 12583 || (CharacterAtIndex - 13312) >> 4 < 0x6BF;
      if (CharacterAtIndex > 20844)
      {
        if (CharacterAtIndex <= 47563)
        {
          if (CharacterAtIndex <= 38645)
          {
            if (CharacterAtIndex > 22234)
            {
              if (CharacterAtIndex > 24335)
              {
                if (CharacterAtIndex != 24336)
                {
                  if (CharacterAtIndex == 30334)
                    goto LABEL_152;
                  if (CharacterAtIndex != 33836)
                    return result;
LABEL_124:
                  v27 = v8 / 10;
                  if ((v10 & 1) != 0)
                    v27 = v8;
                  if (v27 <= 1)
                    v27 = 1;
                  v28 = 10000 * v27;
                  if (v7 >= (v28 ^ 0x7FFFFFFFFFFFFFFFLL))
                    return 0;
                  v8 = 0;
                  v7 += v28;
                  v10 = 1;
                  v11 = 1000;
                  goto LABEL_212;
                }
LABEL_190:
                v8 += 2;
                goto LABEL_212;
              }
              if (CharacterAtIndex != 22235)
              {
                if (CharacterAtIndex != 22769)
                {
                  if (CharacterAtIndex != 24319)
                    return result;
LABEL_204:
                  v40 = v8 / 10;
                  if ((v10 & 1) != 0)
                    v40 = v8;
                  if (v40 <= 1)
                    v40 = 1;
                  v26 = 20 * v40;
                  goto LABEL_163;
                }
                goto LABEL_211;
              }
LABEL_111:
              v8 += 4;
              goto LABEL_212;
            }
            if (CharacterAtIndex <= 21316)
            {
              if (CharacterAtIndex != 20845)
              {
                if (CharacterAtIndex != 21313)
                {
                  v18 = 21315;
                  goto LABEL_80;
                }
LABEL_147:
                v31 = v8 / 10;
                if ((v10 & 1) != 0)
                  v31 = v8;
                if (v31 <= 1)
                  v31 = 1;
                v32 = 5 * v31;
                goto LABEL_162;
              }
              goto LABEL_181;
            }
            if (CharacterAtIndex == 21317)
              goto LABEL_99;
            if (CharacterAtIndex == 21324)
              goto LABEL_142;
            if (CharacterAtIndex != 21442)
              return result;
            goto LABEL_104;
          }
          if (CharacterAtIndex <= 46159)
          {
            if (CharacterAtIndex > 45347)
            {
              if (CharacterAtIndex != 45348 && CharacterAtIndex != 45367)
              {
                if (CharacterAtIndex != 45796)
                  return result;
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 49455)
                  return 0;
LABEL_120:
                v8 += 5;
                goto LABEL_212;
              }
              goto LABEL_111;
            }
            if (CharacterAtIndex != 38646 && CharacterAtIndex != 44277)
            {
              if (CharacterAtIndex != 44396)
                return result;
LABEL_136:
              v8 += 9;
              goto LABEL_212;
            }
            goto LABEL_160;
          }
          if (CharacterAtIndex > 47448)
          {
            if (CharacterAtIndex != 47449)
            {
              if (CharacterAtIndex != 47480)
              {
                if (CharacterAtIndex != 47560)
                  return result;
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 55124)
                  return 0;
LABEL_142:
                v30 = v8 / 10;
                if ((v10 & 1) != 0)
                  v30 = v8;
                if (v30 <= 1)
                  v30 = 1;
                v26 = 40 * v30;
                goto LABEL_163;
              }
              goto LABEL_147;
            }
            goto LABEL_181;
          }
          if (CharacterAtIndex == 46160 || CharacterAtIndex == 46168)
            goto LABEL_190;
          v20 = 47161;
        }
        else
        {
          if (CharacterAtIndex <= 50667)
          {
            if (CharacterAtIndex > 49463)
            {
              if (CharacterAtIndex > 49827)
              {
                if (CharacterAtIndex == 49828)
                {
                  if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 47932)
                    return 0;
                  goto LABEL_204;
                }
                if (CharacterAtIndex == 49901)
                  goto LABEL_147;
                if (CharacterAtIndex != 50500)
                  return result;
                if (++v6 >= v5)
                  return 0;
                v29 = CFStringGetCharacterAtIndex(a1, v6);
                if (v29 == 55124)
                {
                  v21 = v8 / 10;
                  if ((v10 & 1) != 0)
                    v21 = v8;
                  if (v21 <= 1)
                    v21 = 1;
                  v22 = 90;
                  goto LABEL_219;
                }
                if (v29 != 54857)
                  return 0;
                goto LABEL_136;
              }
              if (CharacterAtIndex != 49464 && CharacterAtIndex != 49483)
              {
                if (CharacterAtIndex != 49776)
                  return result;
                v21 = v8 / 10;
                if ((v10 & 1) != 0)
                  v21 = v8;
                if (v21 <= 1)
                  v21 = 1;
                v22 = 50;
LABEL_219:
                v26 = v21 * v22;
LABEL_163:
                if (v7 >= (v26 ^ 0x7FFFFFFFFFFFFFFFLL))
                  return 0;
                v8 = 0;
                v7 += v26;
                v11 = 1;
                v10 = 1;
                goto LABEL_212;
              }
            }
            else
            {
              if (CharacterAtIndex <= 49323)
              {
                if (CharacterAtIndex == 47564)
                  goto LABEL_124;
                if (CharacterAtIndex != 47924)
                {
                  v19 = 48177;
LABEL_51:
                  if (CharacterAtIndex != v19)
                    return result;
LABEL_152:
                  v33 = v8 / 10;
                  if ((v10 & 1) != 0)
                    v33 = v8;
                  if (v33 <= 1)
                    v33 = 1;
                  v34 = 100 * v33;
                  if (v7 >= (v34 ^ 0x7FFFFFFFFFFFFFFFLL))
                    return 0;
                  v8 = 0;
                  v7 += v34;
                  v10 = 1;
                  v11 = 10;
                  goto LABEL_212;
                }
                goto LABEL_147;
              }
              if (CharacterAtIndex == 49324)
                goto LABEL_111;
              if (CharacterAtIndex != 49340)
              {
                if (CharacterAtIndex != 49436)
                  return result;
                if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 47480)
                  return 0;
LABEL_99:
                v25 = v8 / 10;
                if ((v10 & 1) != 0)
                  v25 = v8;
                if (v25 <= 1)
                  v25 = 1;
                v26 = 30 * v25;
                goto LABEL_163;
              }
            }
LABEL_104:
            v8 += 3;
            goto LABEL_212;
          }
          if (CharacterAtIndex > 51059)
          {
            if (CharacterAtIndex <= 52831)
            {
              if (CharacterAtIndex != 51060)
              {
                if (CharacterAtIndex != 51068)
                {
                  v18 = 52380;
LABEL_80:
                  if (CharacterAtIndex != v18)
                    return result;
LABEL_81:
                  v23 = v8 / 10;
                  if ((v10 & 1) != 0)
                    v23 = v8;
                  if (v23 <= 1)
                    v23 = 1;
                  v24 = 1000 * v23;
                  if (v7 >= (v24 ^ 0x7FFFFFFFFFFFFFFFLL))
                    return 0;
                  v8 = 0;
                  v7 += v24;
                  v10 = 1;
                  v11 = 100;
                  goto LABEL_212;
                }
                v16 = v6 + 1;
                if (v6 + 1 >= v5 || CFStringGetCharacterAtIndex(a1, v6 + 1) != 44273)
                  goto LABEL_211;
LABEL_193:
                v8 += 7;
LABEL_194:
                v6 = v16;
                goto LABEL_212;
              }
              v16 = v6 + 1;
              if (v6 + 1 < v5 && CFStringGetCharacterAtIndex(a1, v6 + 1) == 47480)
              {
                v37 = v8 / 10;
                if ((v10 & 1) != 0)
                  v37 = v8;
                if (v37 <= 1)
                  v37 = 1;
                v38 = 70 * v37;
                if (v7 >= (v38 ^ 0x7FFFFFFFFFFFFFFFLL))
                  return 0;
                v8 = 0;
                v7 += v38;
                v10 = 1;
                v11 = 1;
                goto LABEL_194;
              }
              goto LABEL_190;
            }
            if (CharacterAtIndex > 54615)
            {
              if (CharacterAtIndex != 54616)
              {
                v35 = 54620;
                goto LABEL_168;
              }
              if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 45208)
                return 0;
LABEL_211:
              ++v8;
              goto LABEL_212;
            }
            if (CharacterAtIndex == 52832)
            {
              v16 = v6;
              goto LABEL_193;
            }
            v17 = 54036;
LABEL_172:
            if (CharacterAtIndex != v17)
              return result;
LABEL_173:
            v8 += 8;
            goto LABEL_212;
          }
          if (CharacterAtIndex > 50695)
          {
            if (CharacterAtIndex == 50696)
            {
              if (++v6 >= v5 || CFStringGetCharacterAtIndex(a1, v6) != 49692)
                return 0;
              v39 = v8 / 10;
              if ((v10 & 1) != 0)
                v39 = v8;
              if (v39 <= 1)
                v39 = 1;
              v26 = 60 * v39;
              goto LABEL_163;
            }
            if (CharacterAtIndex != 50724)
            {
              if (CharacterAtIndex != 50977)
                return result;
LABEL_181:
              v8 += 6;
              goto LABEL_212;
            }
            goto LABEL_120;
          }
          if (CharacterAtIndex == 50668)
          {
            if (++v6 >= v5)
              return 0;
            v36 = CFStringGetCharacterAtIndex(a1, v6);
            if (v36 != 45919)
            {
              if (v36 == 46304)
              {
                v41 = v8 / 10;
                if ((v10 & 1) != 0)
                  v41 = v8;
                if (v41 <= 1)
                  v41 = 1;
                v26 = 80 * v41;
                goto LABEL_163;
              }
              if (v36 != 49455)
                return 0;
              goto LABEL_181;
            }
            goto LABEL_173;
          }
          if (CharacterAtIndex == 50676)
            goto LABEL_147;
          v20 = 50689;
        }
        if (CharacterAtIndex != v20)
          return result;
      }
      else
      {
        if (CharacterAtIndex <= 3663)
        {
          v16 = v6;
          switch(CharacterAtIndex)
          {
            case ' ':
            case ',':
            case '.':
              v8 /= 10;
              goto LABEL_212;
            case '!':
            case '"':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case '-':
            case '/':
              return result;
            case '0':
              goto LABEL_160;
            case '1':
              goto LABEL_211;
            case '2':
              goto LABEL_190;
            case '3':
              goto LABEL_104;
            case '4':
              goto LABEL_111;
            case '5':
              goto LABEL_120;
            case '6':
              goto LABEL_181;
            case '7':
              goto LABEL_193;
            case '8':
              goto LABEL_173;
            case '9':
              goto LABEL_136;
            default:
              v16 = v6;
              switch(CharacterAtIndex)
              {
                case 2406:
                  goto LABEL_160;
                case 2407:
                  goto LABEL_211;
                case 2408:
                  goto LABEL_190;
                case 2409:
                  goto LABEL_104;
                case 2410:
                  goto LABEL_111;
                case 2411:
                  goto LABEL_120;
                case 2412:
                  goto LABEL_181;
                case 2413:
                  goto LABEL_193;
                case 2414:
                  goto LABEL_173;
                case 2415:
                  goto LABEL_136;
                default:
                  return result;
              }
          }
          return result;
        }
        if (CharacterAtIndex <= 12294)
        {
          if (CharacterAtIndex <= 12031)
          {
            v16 = v6;
            switch(CharacterAtIndex)
            {
              case 3664:
                goto LABEL_160;
              case 3665:
                goto LABEL_211;
              case 3666:
                goto LABEL_190;
              case 3667:
                goto LABEL_104;
              case 3668:
                goto LABEL_111;
              case 3669:
                goto LABEL_120;
              case 3670:
                goto LABEL_181;
              case 3671:
                goto LABEL_193;
              case 3672:
                goto LABEL_173;
              case 3673:
                goto LABEL_136;
              default:
                return result;
            }
            return result;
          }
          if (CharacterAtIndex == 12032)
            goto LABEL_211;
          if (CharacterAtIndex == 12038)
            goto LABEL_190;
          v17 = 12043;
          goto LABEL_172;
        }
        if (CharacterAtIndex > 20060)
        {
          if (CharacterAtIndex > 20190)
          {
            if (CharacterAtIndex <= 20840)
            {
              if (CharacterAtIndex == 20191)
                goto LABEL_81;
              v19 = 20336;
              goto LABEL_51;
            }
            if (CharacterAtIndex == 20841)
              goto LABEL_190;
            v17 = 20843;
            goto LABEL_172;
          }
          if (CharacterAtIndex == 20061)
            goto LABEL_136;
          if (CharacterAtIndex == 20108)
            goto LABEL_190;
          if (CharacterAtIndex != 20116)
            return result;
          goto LABEL_120;
        }
        if (CharacterAtIndex > 19967)
        {
          v16 = v6;
          switch(CharacterAtIndex)
          {
            case 19968:
              goto LABEL_211;
            case 19969:
            case 19970:
            case 19972:
            case 19973:
            case 19974:
            case 19976:
              return result;
            case 19971:
              goto LABEL_193;
            case 19975:
              goto LABEL_124;
            case 19977:
              goto LABEL_104;
            default:
              if (CharacterAtIndex == 20004)
                goto LABEL_190;
              break;
          }
          return result;
        }
        if (CharacterAtIndex != 12295)
        {
          v35 = 12583;
LABEL_168:
          if (CharacterAtIndex != v35)
            return result;
          goto LABEL_211;
        }
      }
LABEL_160:
      if ((v10 & 1) != 0)
      {
        v32 = 5 * v8;
LABEL_162:
        v26 = 2 * v32;
        goto LABEL_163;
      }
      v10 = 0;
LABEL_212:
      v9 |= v15;
      if (++v6 >= v5)
      {
        if ((v9 & 1) != 0)
          v43 = v11;
        else
          v43 = 1;
        v42 = v43 * v8;
        a2 = v44;
        goto LABEL_230;
      }
    }
  }
  v7 = 0;
  v42 = 0;
LABEL_230:
  if (v7 >= (v42 ^ 0x7FFFFFFFFFFFFFFFLL))
    return 0;
  *a2 = v42 + v7;
  return 1;
}

BOOL DDDeletionFilterBlocks_block_invoke_5(int a1, int a2, CFStringRef theString)
{
  return _typesAreEqual(theString, CFSTR("QuotedShortPhoneNumber"))
      || _typesAreEqual(theString, CFSTR("UnquotedShortPhoneNumber"));
}

BOOL DDDeletionFilterBlocks_block_invoke_4(int a1, int a2, CFStringRef theString)
{
  return _typesAreEqual(theString, CFSTR("QuotedShortPhoneNumber"));
}

BOOL DDDeletionFilterBlocks_block_invoke_9(int a1, uint64_t a2, CFStringRef theString)
{
  const __CFString **SubresultWithType;

  if (_typesAreEqual(theString, CFSTR("DateTime")))
  {
    SubresultWithType = DDResultGetSubresultWithType(a2, CFSTR("Time"));
    if (!SubresultWithType)
      return 1;
  }
  else
  {
    if (!_typesAreEqual(theString, CFSTR("Time")))
      return 1;
    SubresultWithType = (const __CFString **)a2;
  }
  return !timeIsTimeStamp((uint64_t)SubresultWithType);
}

const __CFString **timeIsTimeStamp(uint64_t a1)
{
  const __CFString **result;
  const __CFString **v2;
  const __CFString *v3;
  BOOL v4;
  int v5;

  result = DDResultGetSubresultWithType(a1, CFSTR("Seconds"));
  if (result)
  {
    v2 = result;
    v3 = result[10];
    if (v3)
    {
      v5 = 0;
    }
    else
    {
      if (!v2[9])
        return 0;
      v5 = 0;
      v3 = v2[9];
    }
    if (DDFastIntegerExtraction(v3, &v5))
      v4 = v5 == 0;
    else
      v4 = 1;
    return (const __CFString **)!v4;
  }
  return result;
}

CFStringRef *timeIsApprox(CFStringRef *result)
{
  const __CFArray *v1;

  if (result)
  {
    v1 = (const __CFArray *)result;
    if (CFArrayGetCount((CFArrayRef)result) == 1)
    {
      result = (CFStringRef *)CFArrayGetValueAtIndex(v1, 0);
      if (result)
        return (CFStringRef *)_typesAreEqual(result[8], CFSTR("ApproxTime"));
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t DDDeletionFilterBlocks_block_invoke_8(uint64_t a1, uint64_t a2)
{
  removeNoResultSubResults(a2);
  return 1;
}

void removeNoResultSubResults(uint64_t a1)
{
  const __CFArray *v1;
  CFIndex Count;
  unint64_t v4;
  CFStringRef *ValueAtIndex;
  CFStringRef *v6;
  const void *v7;

  v1 = *(const __CFArray **)(a1 + 56);
  if (v1)
  {
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    if (Count >= 1)
    {
      v4 = Count + 1;
      do
      {
        ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(v1, v4 - 2);
        v6 = ValueAtIndex;
        if (ValueAtIndex && _typesAreEqual(ValueAtIndex[8], CFSTR("NoResult")))
          CFArrayRemoveValueAtIndex(v1, v4 - 2);
        else
          removeNoResultSubResults(v6);
        --v4;
      }
      while (v4 > 1);
    }
    if (!CFArrayGetCount(v1))
    {
      v7 = *(const void **)(a1 + 56);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(a1 + 56) = 0;
      }
    }
  }
}

void DDGlobalFilterBlocks_block_invoke_12(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  _QWORD *ValueAtIndex;
  _QWORD *v7;
  unint64_t j;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  CFIndex v22;

  Count = CFArrayGetCount(theArray);
  if (Count >= 2)
  {
    v4 = Count;
    for (i = 1; i < v4; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      if (i >= 1)
      {
        v7 = ValueAtIndex;
        for (j = i + 1; j > 1; --j)
        {
          v9 = CFArrayGetValueAtIndex(theArray, j - 2);
          v10 = v9[2];
          v11 = v9[3];
          v12 = v7[2];
          v13 = v7[3];
          v16 = HIDWORD(v10) == HIDWORD(v12);
          v14 = (uint64_t)(int)v10 >> 16;
          v15 = (uint64_t)(int)v12 >> 16;
          v16 = v16 && (_DWORD)v14 == (_DWORD)v15;
          v17 = v16 && HIDWORD(v11) == HIDWORD(v13);
          if (!v17 || (int)v11 >> 16 != (int)v13 >> 16)
            break;
          v19 = (uint64_t)v9;
          v20 = (const __CFString *)v7[8];
          v21 = (const __CFString *)v9[8];
          if (_typesAreEqual(v20, v21) && !_typesAreEqual(v20, CFSTR("DateTime"))
            || !assistantAcceptTypeWithTypeOrdered(v20, v21, (uint64_t)v7, v19)
            && !assistantAcceptTypeWithTypeOrdered(v21, v20, v19, (uint64_t)v7))
          {
            if (v7[6] >= *(_QWORD *)(v19 + 48))
              v22 = j - 2;
            else
              v22 = i;
            CFArrayRemoveValueAtIndex(theArray, v22);
            --v4;
            --i;
            break;
          }
        }
      }
    }
  }
}

uint64_t assistantAcceptTypeWithTypeOrdered(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4)
{
  const __CFArray *SubresultWithTypePath;
  const __CFArray *v9;
  uint64_t v10;
  const __CFArray *v11;
  uint64_t ValueAtIndex;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString **v15;
  const __CFString **v16;
  const __CFString **v17;
  const __CFString **v18;
  const __CFString *v19;
  _BOOL4 v20;
  uint64_t result;
  NSObject *v22;
  const __CFString *v23;
  _BOOL4 v24;
  int v25;
  _BOOL4 v26;
  const __CFString **v27;
  const __CFString **v28;
  const __CFString **v29;
  const __CFString **v30;
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (_typesAreEqual(a1, CFSTR("Time")))
  {
    if (_typesAreEqual(a2, CFSTR("DateSpan")) && DDResultGetSubresultWithType(a4, CFSTR("YearNumber"))
      || _typesAreEqual(a2, CFSTR("TimeSpan")))
    {
      return 1;
    }
    if (_typesAreEqual(a2, CFSTR("TimeDuration")))
    {
      if (DDResultGetSubresultWithType(a3, CFSTR("MinutesBefore")))
      {
        SubresultWithTypePath = DDResultGetSubresultWithTypePath(a4, CFSTR("BeginTime.Time"));
        v9 = DDResultGetSubresultWithTypePath(a4, CFSTR("EndTime.Time"));
        if (SubresultWithTypePath)
        {
          v10 = (uint64_t)v9;
          if (v9)
          {
            if (CFArrayGetCount(*((CFArrayRef *)SubresultWithTypePath + 7)) == 1
              && CFArrayGetCount(*(CFArrayRef *)(v10 + 56)) <= 2
              && DDResultGetSubresultWithType((uint64_t)SubresultWithTypePath, CFSTR("Hours"))
              && DDResultGetSubresultWithType(v10, CFSTR("Hours"))
              && !DDResultGetSubresultWithType(v10, CFSTR("Minutes"))
              && !DDResultGetSubresultWithType(v10, CFSTR("MinutesBefore")))
            {
              return 1;
            }
          }
        }
      }
      return 0;
    }
    v14 = CFSTR("TimeSpanWithReference");
    return _typesAreEqual(a2, v14);
  }
  if (_typesAreEqual(a1, CFSTR("TimeDuration")))
  {
    if (!_typesAreEqual(a2, CFSTR("TimeSpanWithReference")))
    {
      if (!_typesAreEqual(a2, CFSTR("DateDuration")))
        return 0;
      v11 = *(const __CFArray **)(a4 + 56);
      if (CFArrayGetCount(v11) == 1)
      {
        ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v11, 0);
        v13 = CFSTR("DateSpan.YearNumber");
      }
      else
      {
        if (!DDResultGetSubresultWithTypePath(a4, CFSTR("BeginDate.DateSpan.YearNumber")))
          return 0;
        v13 = CFSTR("EndDate.DateSpan.YearNumber");
        ValueAtIndex = a4;
      }
      if (!DDResultGetSubresultWithTypePath(ValueAtIndex, v13))
        return 0;
    }
    return 1;
  }
  if (_typesAreEqual(a1, CFSTR("DateDuration")))
  {
    v14 = CFSTR("DateSpanWithReference");
    return _typesAreEqual(a2, v14);
  }
  if (!_typesAreEqual(a1, CFSTR("DateTime")) || !_typesAreEqual(a2, CFSTR("DateTime")))
    return 0;
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  getDateFromDateTime(a3, &v28, &v30);
  getDateFromDateTime(a4, &v27, &v29);
  v16 = v29;
  v15 = v30;
  v18 = v27;
  v17 = v28;
  if (v30 && v29 && v28 && v27)
  {
    v19 = v27[8];
    if (v19)
      v20 = _typesAreEqual(v28[8], v19);
    else
      v20 = 0;
    v23 = v16[8];
    if (v23)
      v24 = _typesAreEqual(v15[8], v23);
    else
      v24 = 0;
    if (v20)
      v25 = 1;
    else
      v25 = assistantAcceptTypeWithTypeOrdered(v17[8], v18[8], v17, v18);
    v26 = v24 || assistantAcceptTypeWithTypeOrdered(v15[8], v16[8], v15, v16) != 0;
    if (!v25)
      v26 = 0;
    return v26 && (!v20 || !v24);
  }
  else
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v22 = DDLogHandle_error_log_handle;
    result = os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 67109888;
      v32 = v17 == 0;
      v33 = 1024;
      v34 = v18 == 0;
      v35 = 1024;
      v36 = v15 == 0;
      v37 = 1024;
      v38 = v16 == 0;
      _os_log_error_impl(&dword_19BC07000, v22, OS_LOG_TYPE_ERROR, "One required component of a DateTime was NULL (dates %d-%d and times %d-%d)", buf, 0x1Au);
      return 0;
    }
  }
  return result;
}

const __CFString **getDateFromDateTime(uint64_t a1, const __CFString ***a2, const __CFString ***a3)
{
  const __CFString **SubresultWithType;
  const __CFString **result;

  SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("Time"));
  if (!SubresultWithType)
  {
    SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("TimeSpan"));
    if (!SubresultWithType)
      SubresultWithType = DDResultGetSubresultWithType(a1, CFSTR("TimeDuration"));
  }
  *a3 = SubresultWithType;
  result = DDResultGetSubresultWithType(a1, CFSTR("Date"));
  if (!result)
    result = DDResultGetSubresultWithType(a1, CFSTR("DateSpan"));
  *a2 = result;
  return result;
}

CFIndex DDGlobalFilterBlocks_block_invoke_15(int a1, CFArrayRef theArray)
{
  CFIndex v3;
  CFIndex result;
  _QWORD *ValueAtIndex;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  CFIndex v11;
  CFRange v12;

  v12.length = CFArrayGetCount(theArray);
  v12.location = 0;
  CFArraySortValues(theArray, v12, (CFComparatorFunction)DDResultRangeCompare, 0);
  v3 = 0;
  while (1)
  {
    result = CFArrayGetCount(theArray);
    if (v3 >= result - 1)
      break;
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, v3);
    v6 = ValueAtIndex[4];
    v7 = ValueAtIndex[5];
    v8 = CFArrayGetValueAtIndex(theArray, v3 + 1);
    v9 = v8[4];
    if (v9 >= v6 + v7)
    {
      ++v3;
    }
    else
    {
      if (v8[5] >= v7 && v6 == v9)
        v11 = v3;
      else
        v11 = v3 + 1;
      CFArrayRemoveValueAtIndex(theArray, v11);
    }
  }
  return result;
}

CFIndex DDGlobalFilterBlocks_block_invoke_11(int a1, CFArrayRef theArray, uint64_t a3)
{
  const __CFArray *v3;
  CFIndex result;
  CFIndex v5;
  const __CFArray **ValueAtIndex;
  CFIndex v7;
  const __CFString **v8;
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  CFIndex v16;
  uint64_t v17;
  const __CFArray **v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t *v22;
  unsigned int v23;
  _BOOL4 v24;
  _BOOL4 v25;
  CFIndex v26;
  CFIndex v27;
  uint64_t v28;
  uint64_t *v29;
  const __CFArray *v30;
  CFIndex v31;
  CFIndex v32;
  CFIndex v33;
  char v34;
  char v35;
  const __CFString *v36;
  const __CFArray *v37;
  CFIndex v38;
  CFIndex v39;
  CFIndex v40;
  char v41;
  char v42;
  const __CFString *v43;
  uint64_t v44;
  _BOOL4 v45;
  const __CFString *v46;
  _BOOL4 v47;
  BOOL v48;
  unsigned int v49;
  const __CFString *v50;
  const __CFString *v51;
  CFIndex v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  const __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CFIndex v66;
  uint64_t v67;
  uint64_t v68;
  __CFArray *v69;
  CFIndex v70;
  CFIndex idx;
  CFIndex v72;
  uint64_t *v73;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  const __CFString *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const __CFString *v83;

  v3 = theArray;
  result = CFArrayGetCount(theArray);
  if (result >= 2)
  {
    v5 = 0;
    v69 = v3;
    while (1)
    {
LABEL_3:
      result = CFArrayGetCount(v3);
      if (v5 >= result - 1)
        return result;
      ValueAtIndex = (const __CFArray **)CFArrayGetValueAtIndex(v3, v5);
      v7 = v5 + 1;
      v8 = (const __CFString **)CFArrayGetValueAtIndex(v3, v5 + 1);
      Count = CFArrayGetCount(v3);
      v79 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v76 = 0;
      v15 = 0;
      v16 = v5;
      v17 = 0;
      v72 = v16;
      v70 = v7;
      idx = v16 + 2;
      if (Count > v16 + 2)
      {
LABEL_5:
        v17 = (uint64_t)CFArrayGetValueAtIndex(v3, idx);
        v13 = v79;
        v14 = v10;
        v76 = v11;
        v15 = v12;
      }
      v79 = v13;
      v12 = v15;
      v18 = ValueAtIndex;
      while (1)
      {
        v75 = v14;
        ValueAtIndex = (const __CFArray **)v8;
        v19 = *(_QWORD *)(a3 + 56);
        v20 = (const __CFString *)v18[8];
        v21 = v8[8];
        v22 = (uint64_t *)v18;
        if (v12)
        {
          v23 = 0;
        }
        else
        {
          v24 = _typesAreEqual(CFSTR("Contact"), (const __CFString *)v18[8]);
          if (v24)
            v24 = _typesAreEqual(CFSTR("FullAddress"), v21);
          v23 = !v24;
        }
        if (!resultsAreCloseEnoughToCoalesce(v19, v22, (uint64_t)ValueAtIndex, v23)
          || !resultTypeIsCoalescibleInSignatures(v20)
          || !resultTypeIsCoalescibleInSignatures(v21))
        {
          goto LABEL_130;
        }
        v25 = _typesAreEqual(CFSTR("Contact"), v21);
        v82 = (uint64_t)ValueAtIndex;
        v83 = v20;
        v73 = v22;
        if (!v12)
          break;
        if (v25)
        {
          v67 = v75;
          goto LABEL_132;
        }
        v26 = CFArrayGetCount((CFArrayRef)v12[7]);
        if (v26 < 1)
        {
          v27 = v72;
          v28 = (uint64_t)v79;
          goto LABEL_113;
        }
LABEL_78:
        v78 = v21;
        v52 = 0;
        v81 = 0;
        v53 = 0;
        v54 = 0;
        v55 = 0;
        v56 = 0;
        v57 = 0;
        do
        {
          if (v12)
          {
            v58 = CFArrayGetValueAtIndex((CFArrayRef)v12[7], v52);
            v59 = (const __CFString *)*((_QWORD *)v58 + 8);
          }
          else
          {
            v58 = 0;
            v59 = v83;
          }
          if (_typesAreEqual(CFSTR("PhoneNumber"), v59))
          {
            if (v12 && !v58)
              v58 = CFArrayGetValueAtIndex((CFArrayRef)v12[7], v52);
            ++v55;
            if (v58 && DDResultGetSubresultWithType((uint64_t)v58, CFSTR("Label")))
              ++v54;
          }
          else if (_typesAreEqual(CFSTR("FullAddress"), v59))
          {
            ++v56;
          }
          else if (_typesAreEqual(CFSTR("Email"), v59))
          {
            ++v53;
          }
          else if (_typesAreEqual(CFSTR("Contact"), v59))
          {
            ++v57;
          }
          else if (_typesAreEqual(CFSTR("HttpURL"), v59) || _typesAreEqual(CFSTR("WebURL"), v59))
          {
            ++v81;
          }
          ++v52;
        }
        while (v26 != v52);
        v60 = 2;
        if (!((v54 + v57 < 0) ^ __OFADD__(v54, v57) | (v54 + v57 == 0)))
          v60 = 4;
        if (v55 >= v60 && _typesAreEqual(CFSTR("PhoneNumber"), v78))
        {
          v3 = v69;
          v7 = v70;
LABEL_130:
          v67 = v75;
LABEL_131:
          v5 = v7;
          if (!v12)
            goto LABEL_3;
LABEL_132:
          v12[2] = v76;
          v12[3] = v67;
          v12[9] = DDScanQueryCopyRange(*(_QWORD *)(a3 + 56), v76, v67);
          v12[4] = DDScanQueryComputeCFRangeForQueryRange(*(_QWORD *)(a3 + 56), v76);
          v12[5] = v68;
          v12[6] = v79;
LABEL_133:
          v5 = v7;
          goto LABEL_3;
        }
        v7 = v70;
        if (v56 >= 1 && _typesAreEqual(CFSTR("FullAddress"), v78) || v53 >= 1 && _typesAreEqual(CFSTR("Email"), v78))
        {
          v3 = v69;
          goto LABEL_130;
        }
        v28 = (uint64_t)v79;
        v3 = v69;
        v27 = v72;
        ValueAtIndex = (const __CFArray **)v82;
        if (v81 >= 1 && (_typesAreEqual(CFSTR("HttpURL"), v78) || _typesAreEqual(CFSTR("WebURL"), v78)))
          goto LABEL_130;
        if (!v12)
        {
          v12 = DDRootResultCreate(CFSTR("SignatureBlock"), v73[2], v73[3]);
          DDResultAddSubresult((uint64_t)v12, v73);
          CFArraySetValueAtIndex(v69, v72, v12);
          CFRelease(v12);
          v75 = v73[3];
          v76 = v73[2];
          v28 = v73[6];
          v73[6] = 0;
        }
LABEL_113:
        DDResultAddSubresult((uint64_t)v12, ValueAtIndex);
        v11 = (uint64_t)ValueAtIndex[2];
        v10 = (uint64_t)ValueAtIndex[3];
        v61 = (uint64_t)(int)v76 >> 16;
        v62 = (uint64_t)(int)v11 >> 16;
        if ((int)v61 >= (int)v62)
        {
          v63 = v75;
          if ((int)v61 <= (int)v62 && SHIDWORD(v76) < SHIDWORD(v11))
            v11 = v76;
        }
        else
        {
          v11 = v76;
          v63 = v75;
        }
        v64 = (uint64_t)(int)v63 >> 16;
        v65 = (uint64_t)(int)v10 >> 16;
        if ((int)v64 >= (int)v65)
        {
          if ((int)v64 <= (int)v65)
          {
            if (SHIDWORD(v63) >= SHIDWORD(v10))
              v10 = v63;
          }
          else
          {
            v10 = v63;
          }
        }
        v79 = (char *)ValueAtIndex[6] + v28;
        ValueAtIndex[6] = 0;
        CFArrayRemoveValueAtIndex(v3, v7);
        if (v27 >= CFArrayGetCount(v3) - 1)
        {
          v67 = v10;
          v76 = v11;
          goto LABEL_131;
        }
        v8 = (const __CFString **)CFArrayGetValueAtIndex(v3, v7);
        v66 = CFArrayGetCount(v3);
        v17 = 0;
        v14 = v10;
        v76 = v11;
        v18 = ValueAtIndex;
        if (v66 > idx)
          goto LABEL_5;
      }
      if (!v25)
        goto LABEL_42;
      v29 = v22;
      v30 = (const __CFArray *)v22[7];
      v77 = v21;
      v80 = v19;
      if (v30 && (v31 = CFArrayGetCount(v30), v31 >= 1))
      {
        v32 = v31;
        v33 = 0;
        v34 = 0;
        v35 = 0;
        do
        {
          v36 = (const __CFString *)*((_QWORD *)CFArrayGetValueAtIndex((CFArrayRef)v29[7], v33) + 8);
          if (_typesAreEqual(CFSTR("ContactName"), v36))
          {
            v35 = 1;
          }
          else if (_typesAreEqual(CFSTR("CompanyName"), v36))
          {
            v34 = 1;
          }
          ValueAtIndex = (const __CFArray **)v82;
          ++v33;
        }
        while (v32 != v33);
      }
      else
      {
        v35 = 0;
        v34 = 0;
      }
      v37 = ValueAtIndex[7];
      if (!v37)
        goto LABEL_133;
      v38 = CFArrayGetCount(v37);
      if (v38 < 1)
        goto LABEL_133;
      v39 = v38;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      do
      {
        v43 = (const __CFString *)*((_QWORD *)CFArrayGetValueAtIndex(ValueAtIndex[7], v40) + 8);
        if (_typesAreEqual(CFSTR("ContactName"), v43))
        {
          v42 = 1;
        }
        else if (_typesAreEqual(CFSTR("CompanyName"), v43))
        {
          v41 = 1;
        }
        ++v40;
        ValueAtIndex = (const __CFArray **)v82;
      }
      while (v39 != v40);
      if (v35 != v34 && v42 != v41 && v35 != v42)
        break;
      v3 = v69;
      v5 = v70;
    }
    v19 = v80;
    v3 = v69;
    v7 = v70;
    v21 = v77;
    v20 = v83;
    if (!resultsAreCloseEnoughToCoalesce(v80, v29, v82, 0))
      goto LABEL_133;
LABEL_42:
    v44 = v19;
    v45 = _typesAreEqual(CFSTR("Contact"), v20);
    if (v17)
    {
      v46 = *(const __CFString **)(v17 + 64);
      if (v46)
      {
        v47 = _typesAreEqual(CFSTR("Contact"), *(const __CFString **)(v17 + 64));
        if (resultsAreCloseEnoughToCoalesce(v44, ValueAtIndex, v17, 0)
          && resultTypeIsCoalescibleInSignatures(v46))
        {
          LODWORD(v17) = !_typesAreEqual(CFSTR("Contact"), v46);
          v48 = v47;
          if ((v47 & v17 & 1) != 0)
            goto LABEL_133;
        }
        else
        {
          LODWORD(v17) = 0;
          v48 = v47;
        }
      }
      else
      {
        LODWORD(v17) = 0;
        v48 = 0;
      }
    }
    else
    {
      v48 = 0;
      v46 = 0;
    }
    v49 = !v45 | v17;
    if ((v49 & 1) == 0 && _typesAreEqual(v83, v21))
      goto LABEL_133;
    if (!v45)
    {
      if (!(_DWORD)v17)
      {
        if (_typesAreEqual(v83, v21)
          || _typesAreEqual(CFSTR("PhoneNumber"), v83) && _typesAreEqual(v21, CFSTR("Email")))
        {
          goto LABEL_133;
        }
        if (!_typesAreEqual(CFSTR("PhoneNumber"), v21))
          goto LABEL_63;
        v50 = v83;
        v51 = CFSTR("Email");
        goto LABEL_62;
      }
      if (_typesAreEqual(v46, v21))
      {
        v50 = v83;
        v51 = v21;
LABEL_62:
        if (_typesAreEqual(v50, v51))
          goto LABEL_133;
      }
    }
LABEL_63:
    if (_typesAreEqual(v21, CFSTR("Email")) && (!v49 || (_DWORD)v17 && (v48 || _typesAreEqual(v46, CFSTR("Email"))))
      || _typesAreEqual(CFSTR("HttpURL"), v83)
      || _typesAreEqual(CFSTR("WebURL"), v83))
    {
      goto LABEL_133;
    }
    if (_typesAreEqual(CFSTR("HttpURL"), v21) || _typesAreEqual(CFSTR("WebURL"), v21))
    {
      if (!(_DWORD)v17)
        goto LABEL_133;
      if (_typesAreEqual(CFSTR("HttpURL"), v46))
        goto LABEL_133;
      if (_typesAreEqual(CFSTR("WebURL"), v46))
        goto LABEL_133;
      v26 = 1;
      if (_typesAreEqual(v83, CFSTR("Email")))
        goto LABEL_133;
    }
    else
    {
      v26 = 1;
    }
    goto LABEL_78;
  }
  return result;
}

BOOL resultsAreCloseEnoughToCoalesce(uint64_t a1, _QWORD *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  CFIndex v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  uint64_t v28;
  unsigned int v29;
  CFIndex v30;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v8 = a2[3];
    v9 = *(_QWORD *)(a3 + 16);
    v10 = (v8 << 32) & 0xFFFF000000000000;
    v11 = v10 >> 48;
    v12 = (uint64_t)(int)v9 >> 16;
    if (v10 >> 48 >= (int)v12 && (v10 >> 48 > (int)v12 || SHIDWORD(v8) >= SHIDWORD(v9)))
    {
      v13 = 0;
    }
    else
    {
      v13 = -1;
      if (((v8 << 32) & 0x8000000000000000) == 0 && v12 < v6)
      {
        v28 = *(_QWORD *)(a3 + 16);
        v29 = a4;
        v14 = 0;
        v15 = 0;
        v30 = v8 >> 32;
        v16 = 48 * v11;
        while (1)
        {
          v17 = *(_QWORD *)(a1 + 16);
          v18 = v17 + v16;
          if (v11 + v14 >= v12)
            break;
          if (v14)
          {
            v19 = *(_QWORD *)(v17 + v16 + 16);
            v20 = v19;
          }
          else
          {
            v19 = *(_QWORD *)(v17 + 48 * (int)v11 + 16);
            v20 = v30;
          }
          v21 = v17 + v16;
          v15 += _DDScanQueryCountNewlinesInFragment(v18, v20, v19 - v20 + *(_QWORD *)(v17 + v16 + 24), 3 - v15);
          v22 = *(_DWORD *)(v21 + 40);
          if ((v22 & 0x80000000) != 0)
          {
            v23 = (v22 >> 26) & 7;
            if (v23 == 3)
            {
              ++v15;
            }
            else if (v23 == 4)
            {
              goto LABEL_18;
            }
          }
          ++v14;
          v16 += 48;
          if (v15 >= 3)
          {
LABEL_18:
            v13 = -1;
            goto LABEL_25;
          }
        }
        if ((_DWORD)v12 != (_DWORD)v11)
          v30 = *(_QWORD *)(v17 + 48 * (v11 + v14) + 16);
        v13 = _DDScanQueryCountNewlinesInFragment(v18, v30, (v28 >> 32) - v30, 3 - v15) + v15;
        if (v13 > 2)
          v13 = -1;
LABEL_25:
        a4 = v29;
      }
    }
  }
  else
  {
    v13 = -1;
  }
  v24 = *(_QWORD *)(a3 + 32) - (a2[4] + a2[5]);
  return v13 >= a4 && v24 >= 0 && v24 < 32;
}

const __CFString *resultTypeIsCoalescibleInSignatures(const __CFString *result)
{
  const __CFString *v1;

  if (result)
  {
    v1 = result;
    if (_typesAreEqual(result, CFSTR("FullAddress"))
      || _typesAreEqual(v1, CFSTR("PhoneNumber"))
      || _typesAreEqual(v1, CFSTR("Email"))
      || _typesAreEqual(v1, CFSTR("Contact"))
      || _typesAreEqual(v1, CFSTR("IMScreenName"))
      || _typesAreEqual(v1, CFSTR("HttpURL")))
    {
      return (const __CFString *)1;
    }
    else
    {
      return (const __CFString *)_typesAreEqual(v1, CFSTR("WebURL"));
    }
  }
  return result;
}

BOOL DDShouldPauseSearchForTag(int a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return 1;
  if (a3 && _typesAreEqual(*(CFStringRef *)(a3 + 64), CFSTR("Tag")))
    return 1;
  return _typesAreEqual(*(CFStringRef *)(a2 + 64), *(const __CFString **)(a3 + 64));
}

const __CFString *DDGetDataValueForMatchingTagToData(uint64_t a1, const __CFString **a2, int a3, _BYTE *a4)
{
  const __CFString *v7;
  const __CFString **SubresultWithType;
  BOOL v9;
  const __CFString *v10;
  _BOOL4 v11;
  CFComparisonResult v12;
  int v13;

  if (a2)
  {
    v7 = a2[10];
    if (!v7)
      v7 = a2[9];
  }
  else
  {
    v7 = 0;
  }
  SubresultWithType = DDResultGetSubresultWithType(a1, a2[8]);
  if (a3 && SubresultWithType)
    goto LABEL_27;
  if (SubresultWithType)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
LABEL_26:
    v7 = 0;
LABEL_27:
    *a4 = 0;
    return v7;
  }
  v10 = SubresultWithType[10];
  if (!v10)
    v10 = SubresultWithType[9];
  v11 = CFStringFind(v7, CFSTR("-"), 0).location == -1 && CFStringFind(v7, CFSTR("Generic"), 0).location == -1;
  v12 = CFStringCompare(v10, CFSTR("Generic"), 0);
  v13 = v12 != kCFCompareEqualTo;
  *a4 = v13;
  if (v11 && v12)
  {
    if (CFStringCompare(v7, v10, 0) == kCFCompareEqualTo)
      return v7;
    v13 = *a4;
  }
  if (v11)
  {
    if (!v13)
      return v7;
    goto LABEL_26;
  }
  if (!v13)
    goto LABEL_26;
  if (CFStringCompare(v7, CFSTR("Generic"), 0) == kCFCompareEqualTo)
    return v10;
  v7 = v10;
  if (!DDResultValueContains((CFArrayRef)a2, v10))
    goto LABEL_26;
  return v7;
}

void DDUpdateDataWithMatchedTag(__CFArray *a1, CFIndex a2, const void *a3, uint64_t a4, CFTypeRef cf)
{
  if (a3 && a4)
  {
    if (cf)
    {
      DDResultSetValue(a4, cf);
      CFArraySetValueAtIndex(a1, a2, a3);
    }
  }
}

__CFArray *DDCreateRelatedResultsArray(const __CFArray *a1, CFIndex a2, CFIndex a3)
{
  CFIndex Count;
  _QWORD *ValueAtIndex;
  const __CFString *v8;
  CFIndex v9;
  CFIndex v10;
  CFIndex v11;
  BOOL v12;
  char v13;
  CFIndex v14;
  const void *v15;
  __CFArray *theArray;

  Count = CFArrayGetCount(a1);
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, 0);
  CFArrayAppendValue(theArray, ValueAtIndex);
  v8 = (const __CFString *)ValueAtIndex[8];
  if (_typesAreEqual(v8, CFSTR("FullAddress"))
    || _typesAreEqual(v8, CFSTR("Date"))
    || _typesAreEqual(v8, CFSTR("Time"))
    || _typesAreEqual(v8, CFSTR("TimeDuration"))
    || _typesAreEqual(v8, CFSTR("DateTime")))
  {
    v9 = a2 + 1;
    v10 = a2;
    do
    {
      v11 = a2 - (v10 - 1);
      v12 = v10-- < 1;
      v12 = !v12 && v11 <= a3 + 1;
      v13 = !v12;
      do
      {
        if ((v13 & 1) != 0)
        {
          if (v9 >= Count)
            return theArray;
          v14 = v9 - a2;
          if (v9 - a2 > a3)
            return theArray;
        }
        else
        {
          v14 = v9 - a2;
        }
        if (v9 < Count && v14 <= a3)
        {
          v15 = CFArrayGetValueAtIndex(a1, v9);
          if (areResultRelatedRec((uint64_t)ValueAtIndex, (uint64_t)v15))
            goto LABEL_24;
          ++v9;
        }
      }
      while ((v13 & 1) != 0);
      v15 = CFArrayGetValueAtIndex(a1, v10);
    }
    while (!areResultRelatedRec((uint64_t)ValueAtIndex, (uint64_t)v15));
LABEL_24:
    CFArrayAppendValue(theArray, v15);
  }
  return theArray;
}

BOOL areResultRelatedRec(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  _BOOL8 result;

  v4 = 1;
  while (1)
  {
    while (1)
    {
      v5 = v4;
      v6 = a1;
      v7 = *(const __CFString **)(a1 + 64);
      v8 = *(const __CFString **)(a2 + 64);
      if (_typesAreEqual(v7, CFSTR("FullAddress")))
        return DDAddressResultCanBeMergedWith(v6, a2);
      if (_typesAreEqual(v7, CFSTR("Date")))
        goto LABEL_6;
      if (_typesAreEqual(v7, CFSTR("DateTime")))
        break;
      v4 = 0;
      a1 = a2;
      a2 = v6;
      if ((v5 & 1) == 0)
        return 0;
    }
    if (_typesAreEqual(v8, CFSTR("Date")))
      return 1;
LABEL_6:
    if (_typesAreEqual(v8, CFSTR("Time")))
      return 1;
    result = _typesAreEqual(v8, CFSTR("TimeDuration"));
    if (!result)
    {
      v4 = 0;
      a1 = a2;
      a2 = v6;
      if (((v5 ^ 1) & 1) == 0)
        continue;
    }
    return result;
  }
}

_QWORD *DDResultCreateFromDateTimeResults(const __CFArray *a1)
{
  _QWORD *ValueAtIndex;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString **SubresultWithType;
  const __CFString **v16;
  const __CFString **v17;
  const __CFString **v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  __int16 *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  CFStringRef v38;
  CFStringRef v39;
  uint64_t Copy;
  _QWORD *v41;
  const void *v42;
  const void *v43;
  __CFArray *Mutable;
  __int16 v45;
  uint64_t v46;
  CFTypeRef cf;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  CFTypeRef v51;
  uint64_t v52;
  uint64_t v53;

  if (CFArrayGetCount(a1) < 1)
  {
    if (CFArrayGetCount(a1) > 1)
      CFArrayGetValueAtIndex(a1, 1);
    return 0;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, 0);
  if (CFArrayGetCount(a1) <= 1)
  {
    if (ValueAtIndex)
      return CFRetain(ValueAtIndex);
    return 0;
  }
  v3 = CFArrayGetValueAtIndex(a1, 1);
  if (!ValueAtIndex)
    return 0;
  v4 = v3;
  if (!v3)
    return CFRetain(ValueAtIndex);
  v51 = 0;
  v52 = 0;
  v50 = 0;
  v49 = 0;
  if (!extractDateAndTime((uint64_t)ValueAtIndex, &v52, &v51, (_BYTE *)&v49 + 1, &v49, &v50))
    return CFRetain(ValueAtIndex);
  cf = 0;
  v48 = 0;
  v46 = 0;
  v45 = 0;
  extractDateAndTime((uint64_t)v4, &v48, &cf, (_BYTE *)&v45 + 1, &v45, &v46);
  v5 = v52;
  if (v52)
  {
    v6 = HIBYTE(v49);
    if (v50)
      v7 = v50;
    else
      v7 = v46;
    v8 = v52;
  }
  else
  {
    v8 = v48;
    v6 = HIBYTE(v45);
    if (v48)
    {
      v11 = v46;
      v12 = v50;
    }
    else
    {
      v11 = v50;
      v12 = v46;
    }
    if (v11)
      v7 = v11;
    else
      v7 = v12;
  }
  v13 = (void *)cf;
  if (v51)
  {
    if (cf)
    {
      if (v52)
      {
        v14 = v48;
        if (v48)
        {
          SubresultWithType = DDResultGetSubresultWithType(v52, CFSTR("Hours"));
          if (SubresultWithType)
          {
            v16 = SubresultWithType;
            v17 = DDResultGetSubresultWithType(v14, CFSTR("Hours"));
            if (v17)
            {
              v18 = v17;
              v53 = 0;
              v19 = v16[10];
              if (!v19)
                v19 = v16[9];
              if (DDFastIntegerExtraction(v19, (_DWORD *)&v53 + 1))
              {
                v20 = v18[10];
                if (!v20)
                  v20 = v18[9];
                if (DDFastIntegerExtraction(v20, &v53) && HIDWORD(v53) != (_DWORD)v53)
                  return CFRetain(ValueAtIndex);
              }
            }
          }
        }
      }
      v21 = _DDResultCreateFromDatesResults(*((const __CFArray **)v51 + 7), (uint64_t)cf);
      if (v21 || (v21 = _DDResultCreateFromDatesResults(*((const __CFArray **)cf + 7), (uint64_t)v51)) != 0)
      {
        v13 = (void *)v21;
LABEL_44:
        v22 = &v49;
        goto LABEL_45;
      }
      v5 = v52;
    }
    if (v5)
      return CFRetain(ValueAtIndex);
    v13 = (void *)v51;
    CFRetain(v51);
    goto LABEL_44;
  }
  if (!cf)
    return CFRetain(ValueAtIndex);
  CFRetain(cf);
  v22 = &v45;
LABEL_45:
  if (!(v8 | v7) || !v13)
  {
    if (v13)
LABEL_72:
      CFRelease(v13);
    return CFRetain(ValueAtIndex);
  }
  if (*(_BYTE *)v22 && v6)
    goto LABEL_72;
  if (v6)
    v23 = CFSTR("DateDuration");
  else
    v23 = CFSTR("DateTime");
  v24 = ValueAtIndex[2];
  v25 = ValueAtIndex[3];
  v26 = v4[2];
  v27 = v4[3];
  v28 = (uint64_t)(int)v24 >> 16;
  v29 = (uint64_t)(int)v26 >> 16;
  if (SHIDWORD(v24) >= SHIDWORD(v26))
    v30 = v4[2];
  else
    v30 = ValueAtIndex[2];
  if ((int)v28 <= (int)v29)
    v26 = v30;
  if ((int)v28 >= (int)v29)
    v31 = v26;
  else
    v31 = ValueAtIndex[2];
  v32 = (uint64_t)(int)v25 >> 16;
  v33 = (uint64_t)(int)v27 >> 16;
  if (SHIDWORD(v25) >= SHIDWORD(v27))
    v34 = ValueAtIndex[3];
  else
    v34 = v4[3];
  v35 = (int)v32 < (int)v33;
  if ((int)v32 <= (int)v33)
    v36 = v34;
  else
    v36 = ValueAtIndex[3];
  if (v35)
    v37 = v4[3];
  else
    v37 = v36;
  v9 = DDResultCreate(v23, v31, v37);
  v38 = CFStringCreateWithFormat(0, 0, CFSTR("%@ --- %@"), ValueAtIndex[9], v4[9]);
  if (v38)
  {
    v39 = v38;
    DDResultSetMatchedString((uint64_t)v9, v38);
    CFRelease(v39);
  }
  else
  {
    DDResultSetMatchedString((uint64_t)v9, CFSTR("Merged"));
  }
  DDResultAddSubresult((uint64_t)v9, v13);
  if (v8)
  {
    DDResultAddSubresultSorted((uint64_t)v9, (_QWORD *)v8);
    if (v7)
      DDResultAddSubresultSorted((uint64_t)v9, (_QWORD *)v7);
  }
  else if (v7)
  {
    Copy = DDResultCreateCopy(v7);
    if (Copy)
    {
      v41 = (_QWORD *)Copy;
      v42 = *(const void **)(Copy + 64);
      if (v42)
        CFRelease(v42);
      v41[8] = CFRetain(CFSTR("Time"));
      v43 = (const void *)v41[7];
      if (v43)
        CFRelease(v43);
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      CFArrayAppendValue(Mutable, (const void *)v7);
      v41[7] = Mutable;
      DDResultAddSubresultSorted((uint64_t)v9, v41);
      CFRelease(v41);
    }
  }
  CFRelease(v13);
  return v9;
}

uint64_t extractDateAndTime(uint64_t a1, _QWORD *a2, _QWORD *a3, _BYTE *a4, _BYTE *a5, _QWORD *a6)
{
  const __CFString *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  const void *v17;
  uint64_t result;
  const __CFArray *v19;
  const void *ValueAtIndex;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v12 = *(const __CFString **)(a1 + 64);
  if (!_typesAreEqual(v12, CFSTR("DateTime")))
  {
    if (_typesAreEqual(v12, CFSTR("Date")))
    {
      if (a3)
        *a3 = a1;
      if (a5)
        *a5 = 0;
    }
    else
    {
      if (_typesAreEqual(v12, CFSTR("SpecialDateTime")))
      {
        if (a3)
          *a3 = a1;
        result = 1;
        if (a5)
          *a5 = 1;
        return result;
      }
      if (_typesAreEqual(v12, CFSTR("Time")))
      {
        v24 = 0;
        v19 = *(const __CFArray **)(a1 + 56);
        if (v19
          && CFArrayGetCount(*(CFArrayRef *)(a1 + 56)) == 1
          && (ValueAtIndex = CFArrayGetValueAtIndex(v19, 0),
              extractDateAndTime(ValueAtIndex, 0, 0, 0, 0, &v24),
              v24))
        {
          *a6 = v24;
        }
        else if (a2)
        {
          *a2 = a1;
        }
        if (a4)
          *a4 = 0;
      }
      else
      {
        if (_typesAreEqual(v12, CFSTR("TimeDuration")))
        {
          if (a2)
            *a2 = a1;
          result = 1;
          if (a4)
            *a4 = 1;
          return result;
        }
        result = _typesAreEqual(v12, CFSTR("ApproxTime"));
        if (!(_DWORD)result)
          return result;
        if (a6)
          *a6 = a1;
      }
    }
    return 1;
  }
  v13 = *(const __CFArray **)(a1 + 56);
  Count = CFArrayGetCount(v13);
  v23 = 0;
  v24 = 0;
  v22 = 0;
  v21 = 0;
  if (Count < 1)
  {
LABEL_6:
    if (a3)
      *a3 = v23;
    if (a2)
      *a2 = v24;
    if (a4)
      *a4 = HIBYTE(v21);
    if (a5)
      *a5 = v21;
    if (a6)
      *a6 = v22;
    return 1;
  }
  v15 = Count;
  v16 = 0;
  while (1)
  {
    v17 = CFArrayGetValueAtIndex(v13, v16);
    result = extractDateAndTime(v17, &v24, &v23, (char *)&v21 + 1, &v21, &v22);
    if (!(_DWORD)result)
      return result;
    if (v15 == ++v16)
      goto LABEL_6;
  }
}

uint64_t _DDResultCreateFromDatesResults(const __CFArray *a1, uint64_t a2)
{
  CFStringRef *ValueAtIndex;
  CFStringRef *v5;
  const __CFArray *v6;
  CFStringRef *v7;
  uint64_t Copy;
  CFMutableArrayRef *v9;

  if (!a1)
    return 0;
  if (CFArrayGetCount(a1) != 1)
    return 0;
  ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(a1, 0);
  if (!ValueAtIndex)
    return 0;
  v5 = ValueAtIndex;
  if (!_typesAreEqual(ValueAtIndex[8], CFSTR("RelativeDayOfWeek")))
    return 0;
  v6 = *(const __CFArray **)(a2 + 56);
  if (!v6)
    return 0;
  if (CFArrayGetCount(*(CFArrayRef *)(a2 + 56)) != 1)
    return 0;
  v7 = (CFStringRef *)CFArrayGetValueAtIndex(v6, 0);
  if (!v7 || !_typesAreEqual(v7[8], CFSTR("AbsoluteDate")))
    return 0;
  Copy = DDResultCreateCopy(a2);
  v9 = (CFMutableArrayRef *)CFArrayGetValueAtIndex(*(CFArrayRef *)(Copy + 56), 0);
  CFArrayAppendValue(v9[7], v5);
  return Copy;
}

void sub_19BC3B944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *createContactNameComponentInText(void *a1, void *a2, const void *a3, NSRange *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSUInteger v10;
  _QWORD *v11;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;

  v7 = a1;
  v8 = a2;
  if (v8 && (v9 = objc_msgSend(v7, "rangeOfString:", v8), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v13 = v9;
    v14 = v10;
    v11 = DDResultCreate(a3, (v9 << 32) | 0x10000, ((unint64_t)(v9 + v10) << 32) | 0x10000);
    DDResultSetMatchedString((uint64_t)v11, v8);
    v11[4] = v13;
    v11[5] = v14;
    if (a4->location == 0x7FFFFFFFFFFFFFFFLL)
    {
      a4->location = v13;
      a4->length = v14;
    }
    else
    {
      v15.location = v13;
      v15.length = v14;
      *a4 = NSUnionRange(*a4, v15);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t _DDResultIsURL(uint64_t a1)
{
  uint64_t v3;
  void *v4;

  if (_DDResultIsURL__sURLTypes)
  {
    if (a1)
      return objc_msgSend((id)_DDResultIsURL__sURLTypes, "containsObject:", a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("HttpURL"), CFSTR("WebURL"), CFSTR("MailURL"), CFSTR("MapsURL"), CFSTR("GenericURL"), CFSTR("Email"), 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_DDResultIsURL__sURLTypes;
    _DDResultIsURL__sURLTypes = v3;

    if (a1)
      return objc_msgSend((id)_DDResultIsURL__sURLTypes, "containsObject:", a1);
  }
  return 0;
}

uint64_t DataDetectorsProximitySort(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_msgSend(v5, "cfRange");
  v10 = v9;
  v11 = objc_msgSend(v7, "cfRange");
  v13 = v8 + v10;
  v14 = v11 + v12;
  if (v8 + v10 >= v11 + v12)
    v15 = v11 + v12;
  else
    v15 = v8 + v10;
  if ((v11 > v8 || (v16 = v8, v8 >= v14)) && (v8 > v11 || (v16 = v11, v11 >= v13)) || v15 == v16)
  {
    v17 = v11 - v13;
    v18 = v8 - v14;
    if (v8 > v11)
      v19 = v18;
    else
      v19 = v17;
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_msgSend(v5, "cfRange");
  v22 = v21;
  v23 = objc_msgSend(v6, "cfRange");
  v25 = v20 + v22;
  v26 = v23 + v24;
  if (v20 + v22 >= v23 + v24)
    v27 = v23 + v24;
  else
    v27 = v20 + v22;
  if ((v23 > v20 || (v28 = v20, v20 >= v26)) && (v20 > v23 || (v28 = v23, v23 >= v25)) || v27 == v28)
  {
    v29 = v23 - v25;
    v30 = v20 - v26;
    if (v20 > v23)
      v29 = v30;
  }
  else
  {
    v29 = 0;
  }
  v31 = v19 <= v29;
  v32 = v19 < v29 || v7 == v5;
  v33 = !v31 || v6 == v5;
  v34 = v32 << 63 >> 63;
  if (v33)
    v35 = 1;
  else
    v35 = v34;

  return v35;
}

uint64_t DDURLSchemeIsKnown(uint64_t a1)
{
  _BOOL8 v1;
  void *v2;
  void *v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if ((_schemeCheckingDisabled & 1) != 0)
    return 1;
  v2 = (void *)DDURLWithPotentiallyInvalidURLString(a1);
  v1 = (_BOOL8)v2;
  if (v2)
  {
    v3 = (void *)objc_msgSend(v2, "scheme");
    if (objc_msgSend(v3, "length"))
    {
      if (DDURLSchemeIsKnown_sSchemeOnce != -1)
        dispatch_once(&DDURLSchemeIsKnown_sSchemeOnce, &__block_literal_global_2280);
      v6 = 0;
      v7 = &v6;
      v8 = 0x2020000000;
      v9 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __DDURLSchemeIsKnown_block_invoke_3;
      block[3] = &unk_1E3C961F8;
      block[5] = v1;
      block[6] = &v6;
      block[4] = v3;
      dispatch_sync((dispatch_queue_t)qword_1EE40D4D0, block);
      v1 = *((_BYTE *)v7 + 24) != 0;
      _Block_object_dispose(&v6, 8);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void publicSchemesUpdatedCB(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *(NSObject **)(a2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __publicSchemesUpdatedCB_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v2, block);
}

void updatePublicSchemes(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)a1)
  {

    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    *(_QWORD *)a1 = v2;
    objc_msgSend(v2, "addObject:", CFSTR("smb"));
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {

    *(_QWORD *)(a1 + 8) = 0;
  }
}

void __publicSchemesUpdatedCB_block_invoke(uint64_t a1)
{
  updatePublicSchemes(*(_QWORD *)(a1 + 32));
}

void DDLookupTrieDestroy(uint64_t a1)
{
  const void *v2;
  malloc_zone_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  malloc_zone_t *v12;
  uint64_t v13;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  _DDTrieDestroy(*(malloc_zone_t **)(a1 + 48), a1);
  v3 = *(malloc_zone_t **)(a1 + 48);
  if (v3)
    malloc_destroy_zone(v3);
  v4 = *(int *)(a1 + 24);
  if ((int)v4 >= 1)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 16);
    do
    {
      v7 = *(unsigned int *)(v6 + 16 * v5);
      if ((int)v7 >= 1)
      {
        v8 = (CFTypeRef *)(v6 + 16 * v5 + 8);
        if ((_DWORD)v7 == 1)
        {
          if (*v8)
            CFRelease(*v8);
        }
        else
        {
          v9 = 0;
          v10 = 16 * v7;
          do
          {
            v11 = *(const void **)((char *)*v8 + v9);
            if (v11)
              CFRelease(v11);
            v9 += 16;
          }
          while (v10 != v9);
          malloc_zone_free(*(malloc_zone_t **)(a1 + 40), (void *)*v8);
        }
      }
      ++v5;
    }
    while (v5 != v4);
  }
  v12 = *(malloc_zone_t **)(a1 + 40);
  if (v12)
    malloc_destroy_zone(v12);
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
    MEMORY[0x1A1ACB00C](*MEMORY[0x1E0C83DA0], v13, 8388592);
  free((void *)a1);
}

void _DDTrieDestroy(malloc_zone_t *a1, uint64_t a2)
{
  unsigned int v3;
  void **v4;
  BOOL v5;
  void **v6;
  uint64_t v7;
  void **v8;

  if ((*(_DWORD *)a2 & 1) != 0)
  {
    if ((*(_DWORD *)a2 & 0xFFEu) < 0xD)
      return;
    v4 = *(void ***)(a2 + 8);
LABEL_15:
    malloc_zone_free(a1, v4);
    return;
  }
  v3 = (*(_DWORD *)a2 >> 1) & 0x7FF;
  v4 = *(void ***)(a2 + 8);
  while (v3 == 1)
  {
    v3 = (*(_DWORD *)v4 >> 1) & 0x7FF;
    if ((*(_DWORD *)v4 & 1) != 0)
    {
      v5 = v3 >= 7;
      v3 = 0;
      if (v5)
      {
        malloc_zone_free(a1, v4[1]);
        v3 = 0;
      }
    }
    else
    {
      v6 = (void **)v4[1];
      malloc_zone_free(a1, v4);
      v4 = v6;
    }
  }
  if (v3)
  {
    v7 = v3;
    v8 = v4;
    do
    {
      _DDTrieDestroy(a1, v8);
      v8 += 2;
      --v7;
    }
    while (v7);
    goto LABEL_15;
  }
}

void DDLookupTrieInsertKeyWithExtra(unsigned int *a1, CFStringRef theString, uint64_t a3, char *a4)
{
  CFMutableStringRef MutableCopy;
  CFIndex Length;
  CFIndex v9;
  int v10;
  int CharacterAtIndex;
  int v12;
  int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *appended;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  UniChar *v25;
  UniChar *v26;
  unsigned int v27;
  int v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  kern_return_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  CFTypeRef v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned __int16 *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFIndex v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  UniChar *v58;
  uint64_t v59;
  unint64_t v60;
  __int16 *v61;
  __int16 *v62;
  uint64_t v63;
  uint64_t v64;
  UniChar *v65;
  char *v66;
  char *v67;
  unsigned int v68;
  uint64_t v69;
  UniChar *v70;
  UniChar *v71;
  UniChar *v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  char v76;
  char v77;
  UniChar *v78;
  uint64_t v79;
  malloc_zone_t *MallocZoneForSons;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  UniChar *v84;
  UniChar *v85;
  malloc_zone_t *v86;
  int v87;
  int v88;
  unsigned int v89;
  _BOOL8 v90;
  UniChar *v91;
  NSObject *v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  CFIndex idx;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  UniChar buffer[8];
  uint64_t v104;
  CFRange v105;
  CFRange v106;

  v104 = *MEMORY[0x1E0C80C00];
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  CFStringTrimWhitespace(MutableCopy);
  CFStringFold(MutableCopy, 0x81uLL, 0);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
  Length = CFStringGetLength(MutableCopy);
  if (Length < 1 || !a1)
    goto LABEL_38;
  v99 = a4;
  v100 = Length;
  v98 = a3;
  v9 = 0;
  v10 = 1;
  v102 = (uint64_t)a1;
  while (1)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(MutableCopy, v9);
    if (CharacterAtIndex == 45)
      v12 = 32;
    else
      v12 = CharacterAtIndex;
    if (CharacterAtIndex == 8217)
      v13 = 39;
    else
      v13 = v12;
    if (v13 == 8217)
      v14 = 39;
    else
      v14 = v13;
    v15 = *a1;
    if ((v15 & 1) != 0 || (v16 = (v15 >> 1) & 0x7FF, !(_DWORD)v16))
    {
      v17 = 0;
LABEL_26:
      appended = _DDTrieAppendChar(a1, v13, v102, v17);
      if (v100 + ~v9 < 1)
        goto LABEL_32;
      v25 = buffer;
      if (v100 >= 33)
        v25 = (UniChar *)malloc_type_malloc(2 * (v100 - v9), 0x1000040BDFB0063uLL);
      v105.location = v9;
      v105.length = v100 - v9;
      CFStringGetCharacters(MutableCopy, v105, v25);
      _DDTrieCellMakeLeafWithChars((void *)v102, (uint64_t)appended, (__int16 *)v25, v100 - v9);
      if (v25 == buffer)
        goto LABEL_32;
      v26 = v25;
LABEL_31:
      free(v26);
      goto LABEL_32;
    }
    v17 = 0;
    v18 = *((_QWORD *)a1 + 1);
    while (1)
    {
      v19 = v17 + (v16 >> 1);
      appended = (char *)(v18 + 16 * v19);
      v21 = *((unsigned __int16 *)appended + 2);
      if (v21 == v14)
        break;
      v22 = v16 >> 1;
      v16 += v17 + ~v19;
      if (v21 < v14)
        v17 = v19 + 1;
      else
        v16 = v22;
      if ((uint64_t)v16 <= 0)
        goto LABEL_26;
    }
    LODWORD(v23) = *(_DWORD *)appended;
    v24 = v9 + 1;
    if ((*(_DWORD *)appended & 1) != 0)
      break;
    --v10;
    a1 = (unsigned int *)(v18 + 16 * v19);
    ++v9;
    if (v24 == v100)
      goto LABEL_32;
  }
  v38 = v100;
  v39 = v9 + 1;
  v40 = v9;
  if (v24 < v100 && (v23 & 0xFFC) != 0)
  {
    v41 = 0;
    v42 = v18 + 16 * (v17 + (v16 >> 1)) + 6;
    while (1)
    {
      v43 = CFStringGetCharacterAtIndex(MutableCopy, v9 + v41 + 1);
      if (v43 == 45)
        v44 = 32;
      else
        v44 = v43;
      if (v43 == 8217)
        v45 = 39;
      else
        v45 = v44;
      v23 = *(unsigned int *)appended;
      v46 = (unsigned __int16 *)(appended + 4);
      if ((v23 & 1) != 0)
      {
        v46 = (unsigned __int16 *)v42;
        if ((unint64_t)(v41 + 1) >= 2)
        {
          v46 = (unsigned __int16 *)v42;
          if ((*(_DWORD *)appended & 0xFFEu) >= 0xE)
            v46 = (unsigned __int16 *)(*(_QWORD *)(v18 + 16 * v19 + 8) + 2 * (v41 - 1));
        }
      }
      if (v45 != *v46)
      {
        v40 = v9 + v41;
        v24 = v9 + v41 + 1;
        v38 = v100;
        v39 = v24;
        goto LABEL_94;
      }
      if (!(v9 - v100 + 2 + v41))
        break;
      v42 += 2;
      v47 = v41 + 1;
      v48 = v41 + 2;
      ++v41;
      if (v48 >= ((v23 >> 1) & 0x7FF))
      {
        v40 = v9 + v47;
        v24 = v9 + v47 + 1;
        v39 = v24;
        v38 = v100;
        goto LABEL_94;
      }
    }
    v51 = 0;
    v40 = v9 + v41 + 1;
    v38 = v100;
    v39 = v100;
    v24 = v100;
LABEL_95:
    v52 = v39 - v9;
    v53 = (v23 >> 1) & 0x7FF;
    if (v52 != v53)
      goto LABEL_98;
    goto LABEL_32;
  }
LABEL_94:
  v51 = v38 - v24;
  if (v38 == v24)
    goto LABEL_95;
  v53 = (v23 >> 1) & 0x7FF;
LABEL_98:
  idx = v24;
  v54 = v40 - v9;
  *(_OWORD *)buffer = *(_OWORD *)appended;
  *(_DWORD *)appended = 4096;
  *(_QWORD *)(v18 + 16 * v19 + 8) = 0;
  if (v54 <= 0)
  {
    LODWORD(v63) = v54 + 1;
    v56 = *(_DWORD *)buffer;
  }
  else
  {
    v55 = 0;
    v56 = *(_DWORD *)buffer;
    v57 = *(_QWORD *)&buffer[4];
    v96 = v53;
    v58 = &buffer[3];
    v59 = (v40 + v10) - 1;
    do
    {
      v60 = v55 + 1;
      v61 = (__int16 *)&buffer[2];
      if ((buffer[0] & 1) != 0)
      {
        v62 = (__int16 *)(v57 + 2 * (v55 - 1));
        if (v60 < 2)
          v62 = (__int16 *)v58;
        if ((buffer[0] & 0xFFEu) >= 0xE)
          v61 = v62;
        else
          v61 = (__int16 *)v58;
      }
      appended = _DDTrieAppendChar((unsigned int *)appended, *v61, v102, 0);
      ++v58;
      v55 = v60;
    }
    while (v59 != v60);
    v38 = v100;
    LODWORD(v63) = v54 + 1;
    LODWORD(v53) = v96;
  }
  v64 = (v53 - v63);
  if ((int)v53 <= (int)v63)
  {
    *(_DWORD *)appended = v56 & 0xFFFFF000 | *(_DWORD *)appended & 0xFFF;
  }
  else
  {
    if ((v56 & 1) != 0)
    {
      if (v54 < 1 || (v56 & 0xFFEu) <= 0xD)
        v65 = &buffer[(int)v63 + 2];
      else
        v65 = (UniChar *)(*(_QWORD *)&buffer[4] + 2 * (v54 - 1));
    }
    else
    {
      v65 = &buffer[2];
    }
    v66 = _DDTrieAppendChar((unsigned int *)appended, *v65, v102, 0);
    v67 = v66;
    v68 = v56 & 0xFFFFF000;
    if ((_DWORD)v64 == 1)
    {
      *(_DWORD *)v66 = v68;
    }
    else
    {
      *(_DWORD *)v66 = v68 | (2 * (v64 & 0x7FF)) | 1;
      v63 = (int)v63;
      if (v64 >= 7)
      {
        v73 = 0;
        v74 = v56 & 0xFFE;
        v75 = *(_QWORD *)&buffer[4];
        v76 = 1;
        do
        {
          v77 = v76;
          v78 = &buffer[2];
          if ((v56 & 1) != 0)
          {
            v79 = v73 + (int)v63;
            if (v74 < 0xE || v79 <= 1)
              v78 = &buffer[v79 + 2];
            else
              v78 = (UniChar *)(v75 + 2 * (v79 - 2));
          }
          v76 = 0;
          *(_WORD *)&v66[2 * v73 + 4] = *v78;
          v73 = 1;
        }
        while ((v77 & 1) != 0);
        v101 = v75;
        MallocZoneForSons = _getMallocZoneForSons(v102);
        v81 = (v64 - 2);
        v82 = malloc_type_zone_malloc(MallocZoneForSons, 2 * v81, 0x1000040BDFB0063uLL);
        v83 = 0;
        *((_QWORD *)v67 + 1) = v82;
        v84 = &buffer[(int)v63 + 4];
        do
        {
          v85 = &buffer[2];
          if ((v56 & 1) != 0)
          {
            v85 = (int)v63 + v83 >= 0 ? (UniChar *)(v101 + 2 * (v63 + v83)) : v84;
            if (v74 < 0xE)
              v85 = v84;
          }
          *(_WORD *)(*((_QWORD *)v67 + 1) + 2 * v83++) = *v85;
          ++v84;
        }
        while (v81 != v83);
      }
      else
      {
        v69 = *(_QWORD *)&buffer[4];
        v70 = (UniChar *)(v66 + 4);
        v71 = &buffer[(int)v63 + 2];
        do
        {
          v72 = &buffer[2];
          if ((v56 & 1) != 0)
          {
            v72 = (UniChar *)(v69 + 2 * (v63 - 2));
            if (v63 < 2)
              v72 = v71;
            if ((v56 & 0xFFEu) < 0xE)
              v72 = v71;
          }
          *v70++ = *v72;
          ++v71;
          ++v63;
          --v64;
        }
        while (v64);
      }
    }
  }
  if ((v56 & 0xFFEu) >= 0x201)
  {
    v86 = _getMallocZoneForSons(v102);
    malloc_zone_free(v86, *(void **)&buffer[4]);
  }
  if (v51 >= 1)
  {
    v87 = CFStringGetCharacterAtIndex(MutableCopy, idx);
    v88 = v87 == 45 ? 32 : v87;
    v89 = v87 == 8217 ? 39 : v88;
    v90 = (*(_DWORD *)appended & 0xFFE) == 2
       && (unint64_t)(v89 > *(unsigned __int16 *)(*((_QWORD *)appended + 1) + 4));
    appended = _DDTrieAppendChar((unsigned int *)appended, v89, v102, v90);
    if ((unint64_t)v51 >= 2)
    {
      v91 = buffer;
      if (v38 >= 33)
        v91 = (UniChar *)malloc_type_malloc(2 * v51, 0x1000040BDFB0063uLL);
      v106.location = idx;
      v106.length = v51;
      CFStringGetCharacters(MutableCopy, v106, v91);
      _DDTrieCellMakeLeafWithChars((void *)v102, (uint64_t)appended, (__int16 *)v91, v51);
      if (v91 != buffer)
      {
        v26 = v91;
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  if (appended == (char *)v102)
  {
LABEL_38:
    if (MutableCopy)
      CFRelease(MutableCopy);
    return;
  }
  CFRelease(MutableCopy);
  if (!appended)
    return;
  if (v98 <= 0)
  {
    if ((_DDLookupTrieInsertDataInTrie_alreadyLogged_22 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v92 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        buffer[0] = 0;
        _os_log_error_impl(&dword_19BC07000, v92, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)buffer, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenId > 0", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v93, 713, CFSTR("non positive token"), v96);
      _DDLookupTrieInsertDataInTrie_alreadyLogged_22 = 1;
    }
    return;
  }
  if ((unint64_t)v98 >= 0x7FFFF)
  {
    if ((_DDLookupTrieInsertDataInTrie_alreadyLogged_26 & 1) == 0)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v94 = DDLogHandle_error_log_handle;
      if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      {
        buffer[0] = 0;
        _os_log_error_impl(&dword_19BC07000, v94, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)buffer, 2u);
      }
      DDLogAssertionFailure((uint64_t)"tokenId < MaxData", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v95, 714, CFSTR("data too big for the trie"), v96);
      _DDLookupTrieInsertDataInTrie_alreadyLogged_26 = 1;
    }
    return;
  }
  v27 = *(_DWORD *)appended;
  if ((*(_DWORD *)appended & 0x1000) == 0)
  {
LABEL_37:
    _DDLookupTrieNonImmediateCellAppendItem(v102, v27, v98, v99);
    return;
  }
  if (v99 || v27 >> 13)
  {
    if (v99)
      goto LABEL_46;
  }
  else
  {
    v27 |= (_DWORD)v98 << 13;
    *(_DWORD *)appended = v27;
  }
  if (v27 >> 13 == v98)
    return;
LABEL_46:
  v28 = *(_DWORD *)(v102 + 24);
  if (v28 >= 0x7FFFF)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v29 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      buffer[0] = 0;
      v30 = "currentExtraOffset too big";
LABEL_51:
      _os_log_error_impl(&dword_19BC07000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)buffer, 2u);
      return;
    }
    return;
  }
  v31 = *(_QWORD *)(v102 + 16);
  if (v31)
  {
LABEL_58:
    v34 = v27 >> 13;
    if ((_DWORD)v34)
      v35 = v34 == v98;
    else
      v35 = 1;
    v36 = !v35;
    if (v35)
    {
      if (v99)
      {
        v37 = CFRetain(v99);
        v31 = *(_QWORD *)(v102 + 16);
      }
      else
      {
        v37 = 0;
      }
      LODWORD(v34) = v98;
    }
    else
    {
      v37 = 0;
    }
    v49 = *(int *)(v102 + 24);
    v50 = v31 + 16 * v49;
    *(_DWORD *)v50 = 1;
    *(_DWORD *)(v50 + 4) = v34;
    *(_QWORD *)(v50 + 8) = v37;
    *(_DWORD *)(v102 + 24) = v49 + 1;
    v27 = *(_DWORD *)appended & 0xFFF | (v28 << 13);
    *(_DWORD *)appended = v27;
    if (v36)
      goto LABEL_37;
    return;
  }
  *(_QWORD *)buffer = 0;
  v32 = vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)buffer, 0x7FFFF0uLL, 1);
  v31 = *(_QWORD *)buffer;
  if (v32)
    v33 = 0;
  else
    v33 = *(_QWORD *)buffer;
  *(_QWORD *)(v102 + 16) = v33;
  if (v33)
  {
    v27 = *(_DWORD *)appended;
    goto LABEL_58;
  }
  if (DDLogHandle_onceToken != -1)
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
  v29 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    buffer[0] = 0;
    v30 = "cannot allocate extra data vm region";
    goto LABEL_51;
  }
}

char *_DDTrieAppendChar(unsigned int *a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4;
  int v8;
  malloc_zone_t *MallocZoneForSons;
  char *v10;
  malloc_zone_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *result;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int16 v22[8];
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = *a1;
  if ((~*a1 & 0xFFE) != 0)
  {
    v8 = ((_WORD)v4 + 2) & 0xFFE;
    *a1 = v8 | v4 & 0xFFFFF001;
    if (*((_QWORD *)a1 + 1))
    {
      MallocZoneForSons = _getMallocZoneForSons(a3);
      v10 = (char *)malloc_type_zone_realloc(MallocZoneForSons, *((void **)a1 + 1), (8 * *a1) & 0x7FF0, 0x102204052CB07EBuLL);
      goto LABEL_6;
    }
    if (v8 == 2)
    {
      v11 = _getMallocZoneForSons(a3);
      v10 = (char *)malloc_type_zone_calloc(v11, 1uLL, 0x10uLL, 0x102204052CB07EBuLL);
LABEL_6:
      *((_QWORD *)a1 + 1) = v10;
      if (v10)
      {
        v12 = *a1;
        v13 = (int)(((v12 >> 1) & 0x7FF) - 1);
        if (v13 > a4)
        {
          v14 = 16 * ((v12 >> 1) & 0x7FF);
          do
          {
            --v13;
            *(_OWORD *)(*((_QWORD *)a1 + 1) + v14 - 16) = *(_OWORD *)(*((_QWORD *)a1 + 1) + v14 - 32);
            v14 -= 16;
          }
          while (v13 > a4);
          v10 = (char *)*((_QWORD *)a1 + 1);
        }
        result = &v10[16 * a4];
        *(_QWORD *)(result + 4) = 0;
        *((_DWORD *)result + 3) = 0;
        *((_WORD *)result + 2) = a2;
        *(_DWORD *)result = 4096;
        return result;
      }
      if ((_DDTrieAppendChar_alreadyLogged_14 & 1) == 0)
      {
        if (DDLogHandle_onceToken != -1)
          dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
        v18 = DDLogHandle_error_log_handle;
        if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
        {
          v22[0] = 0;
          _os_log_error_impl(&dword_19BC07000, v18, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", (uint8_t *)v22, 2u);
        }
        DDLogAssertionFailure((uint64_t)"trie->storage.sons != NULL", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v19, 138, CFSTR("Allocation failed"));
        result = 0;
        _DDTrieAppendChar_alreadyLogged_14 = 1;
        return result;
      }
      return 0;
    }
    if ((_DDTrieAppendChar_alreadyLogged_10 & 1) != 0)
      return 0;
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v20 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_19BC07000, v20, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", v23, 2u);
    }
    DDLogAssertionFailure((uint64_t)"trie->sonsOrCharCount == 1", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v21, 133, CFSTR("should have a buffer"));
    result = 0;
    _DDTrieAppendChar_alreadyLogged_10 = 1;
  }
  else
  {
    if ((_DDTrieAppendChar_alreadyLogged & 1) != 0)
      return 0;
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v16 = DDLogHandle_error_log_handle;
    if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "DDRequire failed: the following assertion will only be logged once", buf, 2u);
    }
    DDLogAssertionFailure((uint64_t)"(int)(trie->sonsOrCharCount) < MaxNumberOfSons", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/DataDetectorsCore/Sources/Lookup/DDTrie.c", v17, 129, CFSTR("overflow in the trie"));
    result = 0;
    _DDTrieAppendChar_alreadyLogged = 1;
  }
  return result;
}

void *_DDTrieCellMakeLeafWithChars(void *result, uint64_t a2, __int16 *a3, uint64_t a4)
{
  int v5;
  uint64_t v6;
  __int16 *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int16 v11;
  __int16 v12;
  _WORD *v13;
  __int16 v14;
  malloc_zone_t *MallocZoneForSons;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)a2 | 1;
  *(_DWORD *)a2 = v5;
  if (a4 >= 256)
    v6 = 256;
  else
    v6 = a4;
  if (a4 < 1)
  {
    *(_DWORD *)a2 = v5 & 0xFFFFF001 | (2 * (v6 & 0x7FF));
  }
  else
  {
    v7 = a3;
    v8 = 0;
    if (v6 <= 1)
      v9 = 1;
    else
      v9 = v6;
    do
    {
      v10 = (unsigned __int16)a3[v8];
      if (v10 == 8217)
        v11 = 39;
      else
        v11 = a3[v8];
      if (v10 == 45)
        v12 = 32;
      else
        v12 = v11;
      a3[v8++] = v12;
    }
    while (v9 != v8);
    *(_DWORD *)a2 = *(_DWORD *)a2 & 0xFFFFF001 | (2 * (v6 & 0x7FF));
    v13 = (_WORD *)(a2 + 4);
    if (v6 > 6)
    {
      *(_WORD *)(a2 + 4) = *a3;
      *(_WORD *)(a2 + 6) = a3[1];
      MallocZoneForSons = _getMallocZoneForSons((uint64_t)result);
      v16 = v6 - 2;
      result = malloc_type_zone_malloc(MallocZoneForSons, 2 * v16, 0x1000040BDFB0063uLL);
      v17 = 0;
      *(_QWORD *)(a2 + 8) = result;
      do
      {
        *(_WORD *)(*(_QWORD *)(a2 + 8) + 2 * v17) = v7[v17 + 2];
        ++v17;
      }
      while (v16 != v17);
    }
    else
    {
      do
      {
        v14 = *v7++;
        *v13++ = v14;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

malloc_zone_t *_getMallocZoneForSons(uint64_t a1)
{
  malloc_zone_t *zone;

  zone = *(malloc_zone_t **)(a1 + 48);
  if (!zone)
  {
    zone = malloc_create_zone(0x400000uLL, 0);
    malloc_set_zone_name(zone, "DataDetectorsTrieSons");
    *(_QWORD *)(a1 + 48) = zone;
  }
  return zone;
}

void _DDLookupTrieNonImmediateCellAppendItem(uint64_t a1, unsigned int a2, uint64_t a3, char *a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  __int16 v9;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  malloc_zone_t *v15;
  malloc_zone_t *zone;
  _WORD *v17;
  CFTypeRef v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t v22;
  int v23;
  char *v24;
  CFTypeRef v25;
  __int16 v26;
  uint8_t buf[2];

  v4 = *(_QWORD *)(a1 + 16);
  v5 = a2 >> 13;
  v6 = (int *)(v4 + 16 * v5);
  v7 = *v6;
  if ((int)v7 <= 0)
  {
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v20 = "unexpected size";
    v21 = buf;
    goto LABEL_14;
  }
  v9 = a3;
  v11 = v4 + 16 * v5;
  v14 = *(char **)(v11 + 8);
  v13 = (_QWORD *)(v11 + 8);
  v12 = v14;
  if ((_DWORD)v7 == 1)
  {
    if (v12 == a4 && *(_DWORD *)(v4 + 16 * v5 + 4) == a3)
      return;
    v15 = *(malloc_zone_t **)(a1 + 40);
    if (v15)
      goto LABEL_8;
    zone = malloc_create_zone(0x400000uLL, 0);
    if (zone)
    {
      v15 = zone;
      malloc_set_zone_name(zone, "DataDetectorsTrieItems");
      *(_QWORD *)(a1 + 40) = v15;
LABEL_8:
      v17 = malloc_type_zone_calloc(v15, 2uLL, 0x10uLL, 0x10C00408E2ACF4FuLL);
      v17[4] = *(_DWORD *)(v4 + 16 * v5 + 4);
      v17[12] = v9;
      *(_QWORD *)v17 = *v13;
      if (a4)
        v18 = CFRetain(a4);
      else
        v18 = 0;
      *((_QWORD *)v17 + 2) = v18;
      v23 = 2;
LABEL_25:
      *v6 = v23;
      *v13 = v17;
      return;
    }
    if (DDLogHandle_onceToken != -1)
      dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
    v19 = DDLogHandle_error_log_handle;
    if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
      return;
    v26 = 0;
    v20 = "can't allocate trie_items_malloc_zone in trie";
    v21 = (uint8_t *)&v26;
LABEL_14:
    _os_log_error_impl(&dword_19BC07000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    return;
  }
  v22 = 0;
  while (*(char **)&v12[v22] != a4 || *(__int16 *)&v12[v22 + 8] != a3)
  {
    v22 += 16;
    if (16 * v7 == v22)
    {
      v23 = v7 + 1;
      v17 = malloc_type_zone_realloc(*(malloc_zone_t **)(a1 + 40), v12, 16 * ((int)v7 + 1), 0x10C00408E2ACF4FuLL);
      v24 = (char *)&v17[8 * v7];
      *((_WORD *)v24 + 4) = v9;
      if (a4)
        v25 = CFRetain(a4);
      else
        v25 = 0;
      *(_QWORD *)v24 = v25;
      goto LABEL_25;
    }
  }
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C50](tz, units, at);
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1E0C97C68](tz, at);
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2)
{
  MEMORY[0x1E0C97D58](theArray, idx1, idx2);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C97FF0](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1E0C98088](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1E0C98108](bundle, functionName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98220](calendar, at, options, componentDesc);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98228](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1E0C98230]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar)
{
  return MEMORY[0x1E0C98250](calendar);
}

CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x1E0C98270](calendar, smallerUnit, biggerUnit, at);
  result.length = v5;
  result.location = v4;
  return result;
}

void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale)
{
  MEMORY[0x1E0C98288](calendar, locale);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x1E0C98428](theData, range.location, range.length, newBytes, newLength);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x1E0C98468](allocator, tmplate, options, locale);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C98748](*(_QWORD *)&gdate.year, *(_QWORD *)&gdate.second, tz);
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1E0C98938](allocator, locale, style);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x1E0C98978](formatter, string, rangep, numberType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

uint64_t CFPhoneNumberCopyNumberForInternationalAssist()
{
  return MEMORY[0x1E0D17820]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17840]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1E0C98F20](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions, locale);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98FA0](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C99028](alloc, pStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x1E0C99078](theString, theFlags, theLocale);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1E0C991E0]();
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
  MEMORY[0x1E0C99200](theString, chars, length, capacity);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99270]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99288](allocator, name, tryAbbrev);
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99290](allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1E0CFA360]();
}

uint64_t CloseStreamCompressor()
{
  return MEMORY[0x1E0CFCE48]();
}

uint64_t CreateStreamCompressor()
{
  return MEMORY[0x1E0CFCE60]();
}

uint64_t CreateStreamCompressorQueueWithOptions()
{
  return MEMORY[0x1E0CFCE68]();
}

uint64_t FinishStreamCompressorQueue()
{
  return MEMORY[0x1E0CFCE70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t NLStringTokenizerAdvanceToNextToken()
{
  return MEMORY[0x1E0D17200]();
}

uint64_t NLStringTokenizerCreate()
{
  return MEMORY[0x1E0D17210]();
}

uint64_t NLStringTokenizerGetCurrentSubTokens()
{
  return MEMORY[0x1E0D17218]();
}

uint64_t NLStringTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x1E0D17220]();
}

uint64_t NLStringTokenizerSetStringWithOptions()
{
  return MEMORY[0x1E0D17228]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x1E0D17890]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t VolumeSupportsCompression()
{
  return MEMORY[0x1E0CFCE78]();
}

uint64_t WriteToStreamCompressor()
{
  return MEMORY[0x1E0CFCE80]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t operator delete()
{
  return off_1E3C94050();
}

uint64_t operator new()
{
  return off_1E3C94058();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __stpcpy_chk()
{
  return MEMORY[0x1E0C80C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1E0C812A0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E80]();
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
  MEMORY[0x1E0C83E90](zone);
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x1E0C83EC0](ptr);
}

void malloc_make_purgeable(void *ptr)
{
  MEMORY[0x1E0C83EC8](ptr);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x1E0C83ED8](zone, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F20](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F28](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F40](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C84F78]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1E0DE5978](*(_QWORD *)&c);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1E0DE59C0](*(_QWORD *)&c, *(_QWORD *)&which);
}

int32_t u_strFoldCase(UChar *dest, int32_t destCapacity, const UChar *src, int32_t srcLength, uint32_t options, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE5A90](dest, *(_QWORD *)&destCapacity, src, *(_QWORD *)&srcLength, *(_QWORD *)&options, pErrorCode);
}

void uidna_close(UIDNA *idna)
{
  MEMORY[0x1E0DE62B0](idna);
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62C8](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1E0DE62E0](*(_QWORD *)&options, pErrorCode);
}

UChar32 uiter_next32(UCharIterator *iter)
{
  return MEMORY[0x1E0DE62E8](iter);
}

void uiter_setString(UCharIterator *iter, const UChar *s, int32_t length)
{
  MEMORY[0x1E0DE62F0](iter, s, *(_QWORD *)&length);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t unorm2_getInstance()
{
  return MEMORY[0x1E0DE64C8]();
}

uint64_t unorm2_quickCheck()
{
  return MEMORY[0x1E0DE6508]();
}

uint64_t unorm_next()
{
  return MEMORY[0x1E0DE6518]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1E0DE6A50](ut);
}

UChar32 utext_current32(UText *ut)
{
  return MEMORY[0x1E0DE6A58](ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return MEMORY[0x1E0DE6A78](ut, *(_QWORD *)&delta);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x1E0DE6A88](ut);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
  MEMORY[0x1E0DE6AA8](ut, nativeIndex);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur)
{
  return (xmlNodePtr)MEMORY[0x1E0DE8C58](parent, cur);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x1E0DE8C78](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x1E0DE8C80]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x1E0DE8C88](buf);
}

void xmlFreeNode(xmlNodePtr cur)
{
  MEMORY[0x1E0DE8D48](cur);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x1E0DE8DA0](node, name);
}

xmlAttrPtr xmlHasProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlAttrPtr)MEMORY[0x1E0DE8DA8](node, name);
}

xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar *name)
{
  return (xmlNodePtr)MEMORY[0x1E0DE8E08](ns, name);
}

xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar *name, const xmlChar *value)
{
  return (xmlAttrPtr)MEMORY[0x1E0DE8E20](node, name, value);
}

xmlNodePtr xmlNewText(const xmlChar *content)
{
  return (xmlNodePtr)MEMORY[0x1E0DE8E28](content);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x1E0DE8E60](buf, doc, cur, *(_QWORD *)&level, *(_QWORD *)&format);
}

uint64_t MRLNeuralNetworkCreate_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Montreal))
    dlopenHelper_Montreal(a1);
  return MEMORY[0x1E0D50490]();
}

uint64_t MRLNeuralNetworkSetInput_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Montreal))
    dlopenHelper_Montreal(a1);
  return MEMORY[0x1E0D504D0]();
}

uint64_t MRLNeuralNetworkPredict_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Montreal))
    dlopenHelper_Montreal(a1);
  return MEMORY[0x1E0D504B8]();
}

uint64_t MRLNeuralNetworkGetOutput_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Montreal))
    dlopenHelper_Montreal(a1);
  return MEMORY[0x1E0D504A0]();
}

uint64_t LDEnumerateAssetDataItems_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_LinguisticData))
    dlopenHelper_LinguisticData(a1);
  return MEMORY[0x1E0D43818]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GeoServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/GeoServices.framework/GeoServices", 0);
  atomic_store(1u, &dlopenHelperFlag_GeoServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_LinguisticData(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/LinguisticData.framework/LinguisticData", 0);
  atomic_store(1u, &dlopenHelperFlag_LinguisticData);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_NaturalLanguage(double a1)
{
  dlopen("/System/Library/Frameworks/NaturalLanguage.framework/NaturalLanguage", 0);
  atomic_store(1u, &dlopenHelperFlag_NaturalLanguage);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Montreal(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/Montreal.framework/Montreal", 0);
  atomic_store(1u, &dlopenHelperFlag_Montreal);
  return a1;
}

double gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Montreal))
    return dlopenHelper_Montreal(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___NLTokenizer(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage))
    dlopenHelper_NaturalLanguage(a1);
}

double gotLoadHelper_x8__NLNaturalLanguageErrorDomain(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage))
    return dlopenHelper_NaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NLTagger(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage))
    return dlopenHelper_NaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__NLTagSchemeTokenType(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage))
    return dlopenHelper_NaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__kLDAssetTypeDataDetectorHead(double result)
{
  if (!atomic_load(&dlopenHelperFlag_LinguisticData))
    return dlopenHelper_LinguisticData(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___NLContextualEmbedding(double result)
{
  if (!atomic_load(&dlopenHelperFlag_NaturalLanguage))
    return dlopenHelper_NaturalLanguage(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___GEOMapURLBuilder(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GeoServices))
    return dlopenHelper_GeoServices(result);
  return result;
}

