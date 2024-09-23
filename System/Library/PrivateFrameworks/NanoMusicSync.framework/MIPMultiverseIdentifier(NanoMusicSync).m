@implementation MIPMultiverseIdentifier(NanoMusicSync)

+ (id)midDataArrayFromAlbumSyncIDs:()NanoMusicSync
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_pidsFromSyncIDs:containerClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)midDataArrayFromPlaylistSyncIDs:()NanoMusicSync
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_pidsFromSyncIDs:containerClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v5, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)midDataFromPlaylistSyncID:()NanoMusicSync
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v10 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(a1, "midDataArrayFromPlaylistSyncIDs:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)midDataArrayFromAlbumPIDs:()NanoMusicSync
{
  return objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", a3, 1);
}

+ (uint64_t)midDataArrayFromPlaylistPIDs:()NanoMusicSync
{
  return objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", a3, 6);
}

+ (id)midDataFromAlbumPID:()NanoMusicSync
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v10 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v6, 1, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)midDataFromPlaylistPID:()NanoMusicSync
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v10 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(a1, "_multiverseIdentifiersWithPIDs:groupingType:", v6, 6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pidFromMIDData:()NanoMusicSync
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v10 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(a1, "pidsFromMIDDataArray:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pidsFromMIDDataArray:()NanoMusicSync
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B170]), "initWithData:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9));
        objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entityWithMultiverseIdentifier:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = objc_msgSend(v12, "persistentID");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

          NMLogForCategory(5);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v23 = v13;
            v24 = 2114;
            v25 = v10;
            _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_INFO, "[NMSyncDefaults] Found PID %lld which matches MID %{public}@", buf, 0x16u);
          }
        }
        else
        {
          NMLogForCategory(5);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v23 = (uint64_t)v10;
            _os_log_error_impl(&dword_216E27000, v15, OS_LOG_TYPE_ERROR, "[NMSyncDefaults] Failed to create entity->PID for MID: %{public}@", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

+ (id)_multiverseIdentifiersWithPIDs:()NanoMusicSync groupingType:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138543618;
    v20 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary", v20, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", objc_msgSend(v13, "longLongValue"), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "data");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

          NMLogForCategory(5);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v26 = v15;
            v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_INFO, "[NMSyncDefaults] Created MID %{public}@ for PID %{public}@", buf, 0x16u);
          }
        }
        else
        {
          NMLogForCategory(5);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = v13;
            v27 = 2048;
            v28 = a4;
            _os_log_error_impl(&dword_216E27000, v17, OS_LOG_TYPE_ERROR, "[NMSyncDefaults] Failed to create multiverse id for pid: %{public}@, type: %ld", buf, 0x16u);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v6, "copy");
  return v18;
}

+ (id)_pidsFromSyncIDs:()NanoMusicSync containerClass:
{
  id v5;
  id v6;
  int v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((void *)objc_opt_class() == a4)
  {
    v8 = (id *)MEMORY[0x24BE6B0E8];
  }
  else
  {
    if ((void *)objc_opt_class() != a4)
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_7;
    }
    v8 = (id *)MEMORY[0x24BE6B078];
  }
  v6 = *v8;
  v7 = 1;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B1B0], "predicateWithProperty:values:", v6, v5);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)v11;
    objc_msgSend(a4, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v12, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __74__MIPMultiverseIdentifier_NanoMusicSync___pidsFromSyncIDs_containerClass___block_invoke;
    v29[3] = &unk_24D647E08;
    v15 = v10;
    v30 = v15;
    objc_msgSend(v13, "enumeratePersistentIDsAndProperties:usingBlock:", v14, v29);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v9, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v18);
    }

  }
  v22 = (void *)objc_msgSend(v9, "copy");

  return v22;
}

@end
