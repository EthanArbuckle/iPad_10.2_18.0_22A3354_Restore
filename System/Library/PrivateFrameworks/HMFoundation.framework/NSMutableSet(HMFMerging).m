@implementation NSMutableSet(HMFMerging)

- (uint64_t)shouldMergeObject:()HMFMerging
{
  id v3;
  uint64_t v4;

  v3 = a3;
  objc_opt_class();
  v4 = (v3 != 0) & objc_opt_isKindOfClass();

  return v4;
}

- (uint64_t)mergeObject:()HMFMerging
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  v28 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v7, "minusSet:", v6);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  v10 = v9 != 0;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = a1;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v6, "member:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20
          && objc_msgSend(v19, "conformsToProtocol:", &unk_1EE408168)
          && objc_msgSend(v19, "shouldMergeObject:", v20))
        {
          v10 |= objc_msgSend(v19, "mergeObject:", v20);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v16);
  }

  v21 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v21, "minusSet:", v14);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
    LOBYTE(v10) = 1;
  }

  return v10 & 1;
}

@end
