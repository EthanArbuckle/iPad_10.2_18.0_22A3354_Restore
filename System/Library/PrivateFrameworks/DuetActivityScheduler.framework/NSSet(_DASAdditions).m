@implementation NSSet(_DASAdditions)

+ (id)setWithObjectsFrom:()_DASAdditions
{
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id *)&a10;
  v13 = a9;
  if (v13)
  {
    v14 = v13;
    while (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEEDD200))
    {
      v11 += objc_msgSend(v14, "count");
      objc_msgSend(v12, "addObject:", v14);
      v15 = v39++;
      v16 = *v15;

      v14 = v16;
      if (!v16)
        goto LABEL_5;
    }

    v17 = 0;
  }
  else
  {
LABEL_5:
    if (v11 > 1)
    {
      v30 = v10;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1 << ((unint64_t)log2((double)(v11 - 1)) + 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v24 = v23;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v32;
              do
              {
                for (j = 0; j != v26; ++j)
                {
                  if (*(_QWORD *)v32 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
              }
              while (v26);
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v20);
      }

      v10 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17;
}

- (BOOL)enumerateObjectsInChunksOfSize:()_DASAdditions block:
{
  void (**v6)(id, void *, uint64_t, unsigned __int8 *);
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  _BOOL8 v18;
  void *v20;
  unsigned __int8 v21;

  v6 = a4;
  objc_msgSend(a1, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(a1, "count") / (double)a3);
  v21 = 0;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = v7 - 1;
    v12 = a3;
    do
    {
      v13 = objc_msgSend(a1, "count");
      if (v13 >= v12)
        v14 = v12;
      else
        v14 = v13;
      objc_msgSend(v20, "subarrayWithRange:", v9, v14 + v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v15, v10, &v21);
      v16 = v21;

      if (v16)
        break;
      v9 += a3;
      v8 -= a3;
      v12 += a3;
    }
    while (v11 != v10++);
    v18 = v21 == 0;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

@end
