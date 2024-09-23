@implementation NSDictionary(DiffBuilding)

- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v15, "minusSet:", v11);
  v16 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v16, "minusSet:", v14);
  v42 = v11;
  v43 = (id)objc_msgSend(v11, "mutableCopy");
  v41 = v14;
  objc_msgSend(v43, "intersectSet:", v14);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v55;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v55 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "diffDescription");
        else
          objc_msgSend(v21, "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "diffObject:againstObject:withDescription:", 0, v23, v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v18);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = v16;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v28);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v29, "diffDescription");
        else
          objc_msgSend(v29, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "diffObject:againstObject:withDescription:", v31, 0, v30);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v26);
  }
  v40 = v24;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = v43;
  v32 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v47;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v44);
        v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v35);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v36, "diffDescription");
        else
          objc_msgSend(v36, "description");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectForKeyedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "diffObject:againstObject:withDescription:", v38, v39, v37);

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v33);
  }

}

@end
