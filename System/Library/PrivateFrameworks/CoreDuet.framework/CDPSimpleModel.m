@implementation CDPSimpleModel

void __29___CDPSimpleModel_loadModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "peopleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && (unint64_t)objc_msgSend(v3, "count") <= 0x14)
  {
    while (1)
    {
      v4 = *(_QWORD **)(a1 + 32);
      if (v4[2] < v4[3])
        break;
      objc_msgSend(v4, "_reallocModel");
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) = objc_msgSend(v7, "userIsSender");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) = objc_msgSend(v7, "userIsThreadInitiator");
    objc_msgSend(v7, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) = v6;

    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void __29___CDPSimpleModel_loadModel___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  size_t v9;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  int8x8_t v36;
  uint8x8_t v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    if (v2 < 0x9C5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("Too many interactions as input.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("No past interactions with the specified seed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 0;
  }
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.people"), v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v9 && (v9 <= 0x9C4 ? (v10 = v8 == 0) : (v10 = 0), v10))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = malloc_type_calloc(v9, 8uLL, 0x10040436913F5uLL);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 8uLL, 0x100004000313F17uLL);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 4uLL, 0x100004052888210uLL);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 256);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v14);
    }

    objc_msgSend(v11, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 104);
    *(_QWORD *)(v19 + 104) = v18;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = *(id *)(a1 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v40;
      do
      {
        v26 = 0;
        v27 = v24;
        v28 = 8 * v24;
        do
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v21);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + v28) = objc_msgSend(*(id *)(a1 + 32), "_newIdsForPeople:length:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v26++), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + v28, (_QWORD)v39);
          v28 += 8;
        }
        while (v23 != v26);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        v24 = v27 + v26;
      }
      while (v23);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v11, "count");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 8uLL, 0x10040436913F5uLL);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = malloc_type_calloc(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 8uLL, 0x100004000313F17uLL);
    v29 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v29 + 32))
    {
      v30 = 0;
      v31 = 1;
      do
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 8 * v30) = malloc_type_calloc(4uLL, 4uLL, 0x100004052888210uLL);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 8 * v30) = 0;
        v30 = v31;
        v29 = *(_QWORD *)(a1 + 32);
        v38 = *(_QWORD *)(v29 + 32) > (unint64_t)v31++;
      }
      while (v38);
    }
    if (*(_QWORD *)(v29 + 16))
    {
      v32 = 0;
      v33 = 0;
      do
      {
        if (*(_QWORD *)(*(_QWORD *)(v29 + 72) + 8 * v32))
        {
          v34 = 0;
          do
          {
            v35 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v29 + 64) + 8 * v32) + 4 * v34);
            v36 = *(int8x8_t *)(*(_QWORD *)(v29 + 96) + 8 * v35);
            v37 = (uint8x8_t)vcnt_s8(v36);
            v37.i16[0] = vaddlv_u8(v37);
            v38 = *(_QWORD *)&v36 < 4uLL || v37.u32[0] > 1uLL;
            if (!v38)
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 8 * v35) = malloc_type_realloc(*(void **)(*(_QWORD *)(v29 + 88)+ 8 * v35), 8 * *(_QWORD *)&v36, 0x100004052888210uLL);
              v29 = *(_QWORD *)(a1 + 32);
            }
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v29 + 88) + 8 * v35) + 4 * *(_QWORD *)&v36) = v33;
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 8 * v35);
            ++v34;
            v29 = *(_QWORD *)(a1 + 32);
          }
          while (*(_QWORD *)(*(_QWORD *)(v29 + 72) + 8 * v32) > v34);
        }
        v32 = ++v33;
      }
      while (*(_QWORD *)(v29 + 16) > (unint64_t)v33);
    }
    *(_BYTE *)(v29 + 9) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __43___CDPSimpleModel__newIdsForPeople_length___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

unint64_t __36___CDPSimpleModel__printPrediction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (__PAIR64__(*(float *)(a2 + 4) < *(float *)(a3 + 4), *(_DWORD *)(a3 + 4)) - *(unsigned int *)(a2 + 4)) >> 32;
}

@end
