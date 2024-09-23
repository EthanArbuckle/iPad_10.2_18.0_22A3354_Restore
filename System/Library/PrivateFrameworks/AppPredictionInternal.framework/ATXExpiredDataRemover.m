@implementation ATXExpiredDataRemover

+ (void)removeExpiredBundleIdsFrom:(id)a3 removeExpiredActionKeysFrom:(id)a4 expiredDataProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "expiredBundleIdsAndActionKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expiredBundleIds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v33 = v8;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = v7;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v40;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1CAA48B6C]();
          objc_msgSend(v10, "expiredBundleIds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeBundleIds:", v21);

          objc_autoreleasePoolPop(v20);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v16);
    }

    v7 = v13;
    v8 = v33;
  }
  objc_msgSend(v10, "expiredActionKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v34 = v7;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v8;
    v25 = v8;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1CAA48B6C]();
          objc_msgSend(v10, "expiredActionKeys");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "removeActionKeys:", v32);

          objc_autoreleasePoolPop(v31);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

    v7 = v34;
    v8 = v24;
  }

}

@end
