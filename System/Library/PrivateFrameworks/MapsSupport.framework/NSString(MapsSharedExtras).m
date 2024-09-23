@implementation NSString(MapsSharedExtras)

- (id)_maps_prefixMatchesForSearchString:()MapsSharedExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v28;
  void *context;
  id obj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1B5E2B350]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");
  v8 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke;
  v45[3] = &unk_1E66539E0;
  v9 = v6;
  v46 = v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 1027, v45);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "length");
  v43[0] = v8;
  v43[1] = 3221225472;
  v43[2] = __65__NSString_MapsSharedExtras___maps_prefixMatchesForSearchString___block_invoke_2;
  v43[3] = &unk_1E66539E0;
  v12 = v10;
  v44 = v12;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 1027, v43);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v33)
  {
    v31 = v12;
    v32 = *(_QWORD *)v40;
    v28 = v4;
    v34 = v5;
    while (1)
    {
      v13 = 0;
LABEL_4:
      if (*(_QWORD *)v40 != v32)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = (void *)objc_msgSend(v12, "copy");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (!v16)
        break;
      v17 = v16;
      v18 = *(_QWORD *)v36;
LABEL_8:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "rangeValue");

        if (!objc_msgSend(v21, "localizedStandardRangeOfString:", v14))
          break;

        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v17)
            goto LABEL_8;
          goto LABEL_18;
        }
      }
      v24 = objc_msgSend(v14, "length");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v25);

      v12 = v31;
      objc_msgSend(v31, "removeObject:", v20);

      if (++v13 != v33)
        goto LABEL_4;
      v4 = v28;
      v5 = v34;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (!v33)
        goto LABEL_17;
    }
LABEL_18:

    objc_autoreleasePoolPop(context);
    v26 = 0;
    v4 = v28;
    v5 = v34;
  }
  else
  {
LABEL_17:

    objc_autoreleasePoolPop(context);
    v26 = v5;
  }

  return v26;
}

@end
