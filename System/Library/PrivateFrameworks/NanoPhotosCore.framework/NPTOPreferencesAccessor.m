@implementation NPTOPreferencesAccessor

- (id)npto_fetchSyncedAlbum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("SyncAlbum"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x24BDE3498];
      v26[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchAssetCollectionsWithLocalIdentifiers:options:", v6, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[NPTOPreferencesAccessor device](self, "device");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B340]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              if (objc_msgSend(v15, "assetCollectionType", (_QWORD)v19) == 1
                && objc_msgSend(v15, "assetCollectionSubtype") == 101)
              {
                nanophotos_log_NanoPhotosCore();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v24 = v15;
                  _os_log_impl(&dword_21387D000, v16, OS_LOG_TYPE_DEFAULT, "Synced album is cloud shared: %@", buf, 0xCu);
                }

                -[NPTOPreferencesAccessor setObject:forKey:](self, "setObject:forKey:", CFSTR("none"), CFSTR("SyncAlbum"));
                goto LABEL_2;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      if (objc_msgSend(v4, "count", (_QWORD)v19))
      {
        if (v4)
          goto LABEL_25;
      }
      else
      {
        nanophotos_log_NanoPhotosCore();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v3;
          _os_log_impl(&dword_21387D000, v17, OS_LOG_TYPE_DEFAULT, "Synced album is missing: %@", buf, 0xCu);
        }

        -[NPTOPreferencesAccessor removeObjectForKey:](self, "removeObjectForKey:", CFSTR("SyncAlbum"));
      }
    }
    -[NPTOPreferencesAccessor _npto_defaultAlbum](self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_2:
  v4 = 0;
LABEL_25:

  return v4;
}

- (id)_npto_defaultAlbum
{
  void *v1;
  void *v2;
  void *v3;
  char v4;
  void *v6;
  int v7;
  uint64_t v8;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) != 0)
      return 0;
    objc_msgSend(v1, "objectForKey:", CFSTR("TinkerGraduated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
      v8 = 206;
    else
      v8 = 203;
    objc_msgSend(MEMORY[0x24BDE3498], "fetchAssetCollectionsWithType:subtype:options:", 2, v8, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)npto_syncedAlbumIdentifier
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("SyncAlbum"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NPTOPreferencesAccessor _npto_defaultAlbum](self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("none");
    if (v6)
      v8 = (__CFString *)v6;
    v3 = v8;

    nanophotos_log_NanoPhotosCore();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NPTOPreferencesAccessor device](self, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21387D000, v9, OS_LOG_TYPE_DEFAULT, "No album identifier found for device: %@. Defaulting to %@.", (uint8_t *)&v12, 0x16u);

    }
  }
  return v3;
}

- (unint64_t)npto_syncedPhotosLimit
{
  uint64_t v2;
  void *v3;
  unint64_t v4;

  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("SyncCount"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_24D06AF50;
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)npto_appPhotosSyncingEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("AppPhotosSync"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x24BDBD1C8];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)npto_memoriesSyncingEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("Memories"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x24BDBD1C8];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)npto_featuredPhotosSyncingEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("FeaturedPhotos"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x24BDBD1C8];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)npto_appLastOpenDate
{
  return -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("AppLastOpenDate"));
}

- (unint64_t)npto_fetchCountForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlbumFetchCounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "npto_uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (void)npto_setFetchCount:(unint64_t)a3 forAssetCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlbumFetchCounts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "npto_uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v11);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCount_forAssetCollection___block_invoke;
  v13[3] = &unk_24D069668;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[NPTOPreferencesAccessor performBatchUpdates:synchronizeToRemoteDevice:](self, "performBatchUpdates:synchronizeToRemoteDevice:", v13, 1);

}

void __77__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCount_forAssetCollection___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("WatchFaceAlbumFetchCounts"));

}

- (void)npto_removeFetchCountForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlbumFetchCounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "npto_uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__NPTOPreferencesAccessor_WatchFaces__npto_removeFetchCountForAssetCollection___block_invoke;
  v10[3] = &unk_24D069668;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NPTOPreferencesAccessor performBatchUpdates:synchronizeToRemoteDevice:](self, "performBatchUpdates:synchronizeToRemoteDevice:", v10, 1);

}

void __79__NPTOPreferencesAccessor_WatchFaces__npto_removeFetchCountForAssetCollection___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("WatchFaceAlbumFetchCounts"));

}

- (BOOL)npto_isAlwaysUpdatingEnabledForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlwaysUpdatingAlbums"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "npto_uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

- (void)npto_setAlwaysUpdatingEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v11 = a4;
  v6 = (void *)MEMORY[0x24BDBCEF0];
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlwaysUpdatingAlbums"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "npto_uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
  }
  else
  {
    objc_msgSend(v11, "npto_uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v10);
  }

  if (v8)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabled_forAssetCollection___block_invoke;
    v12[3] = &unk_24D069668;
    v12[4] = self;
    v13 = v8;
    -[NPTOPreferencesAccessor performBatchUpdates:synchronizeToRemoteDevice:](self, "performBatchUpdates:synchronizeToRemoteDevice:", v12, 1);

  }
}

void __88__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabled_forAssetCollection___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("WatchFaceAlwaysUpdatingAlbums"));

}

- (id)npto_fetchCountsForAllCollections
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlbumFetchCounts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
        objc_msgSend(v3, "setObject:forKey:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)npto_setFetchCountsForAllCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCountsForAllCollections___block_invoke;
  v15[3] = &unk_24D069668;
  v15[4] = self;
  v16 = v5;
  v14 = v5;
  -[NPTOPreferencesAccessor performBatchUpdates:synchronizeToRemoteDevice:](self, "performBatchUpdates:synchronizeToRemoteDevice:", v15, 1);

}

void __76__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCountsForAllCollections___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("WatchFaceAlbumFetchCounts"));

}

- (id)npto_alwaysUpdatingEnabledForAllCollections
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NPTOPreferencesAccessor objectForKey:](self, "objectForKey:", CFSTR("WatchFaceAlwaysUpdatingAlbums"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BDD1880]);
        v11 = (void *)objc_msgSend(v10, "initWithUUIDString:", v9, (_QWORD)v14);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)npto_setAlwaysUpdatingEnabledForAllCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabledForAllCollections___block_invoke;
  v13[3] = &unk_24D069668;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  -[NPTOPreferencesAccessor performBatchUpdates:synchronizeToRemoteDevice:](self, "performBatchUpdates:synchronizeToRemoteDevice:", v13, 1);

}

void __86__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabledForAllCollections___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("WatchFaceAlwaysUpdatingAlbums"));

}

- (NPTOPreferencesAccessor)initWithDevice:(id)a3
{
  id v5;
  NPTOPreferencesAccessor *v6;
  NPTOPreferencesAccessor *v7;
  uint64_t v8;
  NPSDomainAccessor *domainAccessor;
  NPTONotificationCenter *v10;
  NPTONotificationCenter *notificationCenter;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPTOPreferencesAccessor;
  v6 = -[NPTOPreferencesAccessor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairedDevice:", CFSTR("com.apple.nanophotos"), v5);
    domainAccessor = v7->_domainAccessor;
    v7->_domainAccessor = (NPSDomainAccessor *)v8;

    v10 = (NPTONotificationCenter *)-[NPTONotificationCenter initWithDevice:]([NPTONotificationCenter alloc], v5);
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = v10;

  }
  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  return -[NPSDomainAccessor BOOLForKey:](self->_domainAccessor, "BOOLForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  return (id)-[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NPTONotificationCenter *notificationCenter;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v12 && (objc_msgSend(v12, "isEqual:", v7) & 1) == 0)
  {
    -[NPSDomainAccessor setObject:forKey:](self->_domainAccessor, "setObject:forKey:", v12, v6);
    -[NSMutableArray lastObject](self->_batchUpdatesKeyStack, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v6);

    if (!-[NSMutableArray count](self->_batchUpdatesKeyStack, "count"))
    {
      v9 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
      notificationCenter = self->_notificationCenter;
      -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v11);

    }
  }

}

- (id)_notificationNameForKey:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    v3 = *(void **)(a1 + 8);
    v4 = a2;
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.prefs.%@-changed"), v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NPTONotificationCenter *notificationCenter;
  void *v8;
  id v9;

  v9 = a3;
  -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NPSDomainAccessor removeObjectForKey:](self->_domainAccessor, "removeObjectForKey:", v9);
    -[NSMutableArray lastObject](self->_batchUpdatesKeyStack, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    if (!-[NSMutableArray count](self->_batchUpdatesKeyStack, "count"))
    {
      v6 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
      notificationCenter = self->_notificationCenter;
      -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v8);

    }
  }

}

- (void)performBatchUpdates:(id)a3 synchronizeToRemoteDevice:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  NSMutableArray *batchUpdatesKeyStack;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NPTONotificationCenter *notificationCenter;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  batchUpdatesKeyStack = self->_batchUpdatesKeyStack;
  if (!batchUpdatesKeyStack)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_batchUpdatesKeyStack;
    self->_batchUpdatesKeyStack = v8;

    batchUpdatesKeyStack = self->_batchUpdatesKeyStack;
  }
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](batchUpdatesKeyStack, "addObject:", v10);

  v6[2](v6);
  -[NSMutableArray lastObject](self->_batchUpdatesKeyStack, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_batchUpdatesKeyStack, "removeLastObject");
  v12 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        notificationCenter = self->_notificationCenter;
        -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  if (v4)
  {
    v20 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend(v13, "set", (_QWORD)v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nanophotos"), v21);

  }
}

- (id)changeObserverForKey:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPTONotificationCenter *notificationCenter;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__NPTOPreferencesAccessor_changeObserverForKey_queue_block___block_invoke;
  v16[3] = &unk_24D069708;
  objc_copyWeak(&v18, &location);
  v13 = v10;
  v17 = v13;
  -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)notificationCenter, v12, v9, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __60__NPTOPreferencesAccessor_changeObserverForKey_queue_block___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v2 = (id)objc_msgSend(WeakRetained[1], "synchronize");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_batchUpdatesKeyStack, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end
