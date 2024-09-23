@implementation GEOOfflineLocalDataAccess

- (GEOOfflineLocalDataAccess)initWithDiskCache:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  GEOOfflineLocalDataAccess *v9;
  GEOOfflineLocalDataAccess *v10;
  uint64_t v11;
  geo_isolater *testBundlesIsolation;
  GEOOfflineLocalDataAccess *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOOfflineLocalDataAccess;
  v9 = -[GEOOfflineLocalDataAccess init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_diskCache, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = geo_isolater_create();
    testBundlesIsolation = v10->_testBundlesIsolation;
    v10->_testBundlesIsolation = (geo_isolater *)v11;

    v13 = v10;
  }

  return v10;
}

- (BOOL)_getVersionForLayer:(_QWORD *)a3 version:
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  __CFString *v10;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 16), "activeVersions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7 != 0;
  if (v7)
  {
    *a3 = objc_msgSend(v7, "unsignedLongLongValue");
  }
  else
  {
    GEOGetOfflineDataAccessLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if (a2 >= 0x15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C099F8[(int)a2];
      }
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "No known active version for layer: %{public}@", buf, 0xCu);

    }
  }

  return v8;
}

- (id)_installedTestBundles
{
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v1 = a1;
  if (a1)
  {
    geo_assert_not_isolated();
    v3 = 0;
    v4 = &v3;
    v5 = 0x3032000000;
    v6 = __Block_byref_object_copy__37;
    v7 = __Block_byref_object_dispose__37;
    v8 = 0;
    geo_isolate_sync();
    v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);

  }
  return v1;
}

void __50__GEOOfflineLocalDataAccess__installedTestBundles__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    +[GEOOfflineDataBundle installedBundles]();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = (void *)v3;
    else
      v5 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v5);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (id)_dataFromInstalledTestBundlesForKey:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[GEOOfflineLocalDataAccess _installedTestBundles](a1);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          -[GEOOfflineDataBundle dataForKey:](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), v3);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            GEOGetOfflineDataAccessLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 141558275;
              v18 = 1752392040;
              v19 = 2113;
              v20 = v3;
              _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Returning locally-overridden data for key %{private, mask.hash}@", buf, 0x16u);
            }

            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_14:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  GEOTileDB *diskCache;
  uint64_t v16;
  id *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInternalInstall");

  if (v12
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v8),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E1BFF970;
    v24 = v13;
    v25 = v10;
    v14 = v24;
    dispatch_async(v9, block);

  }
  else
  {
    v22 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, objc_msgSend(v8, "layer"), &v22))
    {
      diskCache = self->_diskCache;
      v16 = v22;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_3;
      v18[3] = &unk_1E1C099D8;
      v17 = &v19;
      v19 = v10;
      -[GEOTileDB getDataForOfflineKey:version:associatedWithFullyLoadedSubscription:callbackQueue:callback:](diskCache, "getDataForOfflineKey:version:associatedWithFullyLoadedSubscription:callbackQueue:callback:", v8, v16, 1, v9, v18);
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_2;
      v20[3] = &unk_1E1C01F48;
      v17 = &v21;
      v21 = v10;
      dispatch_async(v9, v20);
    }

  }
}

uint64_t __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("unknown version"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__GEOOfflineLocalDataAccess_getDataForKey_callbackQueue_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)v5;
  if (!(v7 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (!v8
    || (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v6),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, objc_msgSend(v6, "layer"), &v11))
    {
      -[GEOTileDB dataForOfflineKey:version:associatedWithFullyLoadedSubscription:error:](self->_diskCache, "dataForOfflineKey:version:associatedWithFullyLoadedSubscription:error:", v6, v11, 1, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("unknown version"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)hasDataForKey:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInternalInstall");

  if (v12
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v8),
        (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E1C01F48;
    v19 = v10;
    dispatch_async(v9, block);

  }
  else
  {
    v17 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, objc_msgSend(v8, "layer"), &v17))
    {
      -[GEOTileDB determineIfOfflineDataExistsForKey:version:associatedWithFullyLoadedSubscription:callbackQueue:callback:](self->_diskCache, "determineIfOfflineDataExistsForKey:version:associatedWithFullyLoadedSubscription:callbackQueue:callback:", v8, v17, 1, v9, v10);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke_2;
      v15[3] = &unk_1E1C01F48;
      v16 = v10;
      dispatch_async(v9, v15);

    }
  }

}

uint64_t __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__GEOOfflineLocalDataAccess_hasDataForKey_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("unknown version"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)hasDataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  uint64_t v12;

  v6 = a3;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v8
    && (-[GEOOfflineLocalDataAccess _dataFromInstalledTestBundlesForKey:](self, v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = 1;
  }
  else
  {
    v12 = 0;
    if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, objc_msgSend(v6, "layer"), &v12))
    {
      v10 = -[GEOTileDB hasDataForOfflineKey:version:associatedWithFullyLoadedSubscription:error:](self->_diskCache, "hasDataForOfflineKey:version:associatedWithFullyLoadedSubscription:error:", v6, v12, 1, a4);
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("unknown version"));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)getAvailableKeysForLayer:(unsigned int)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v6;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  GEOTileDB *diskCache;
  uint64_t v21;
  id *v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  void *v30;
  id v31;
  _QWORD block[4];
  void *v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v6 = *(_QWORD *)&a3;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInternalInstall");

  if (v11)
  {
    v28 = v8;
    -[GEOOfflineLocalDataAccess _installedTestBundles](self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[GEOOfflineDataBundle availableKeysForLayer:](v18, v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    v8 = v28;
  }
  else
  {
    v15 = 0;
  }
  v35 = 0;
  if (-[GEOOfflineLocalDataAccess _getVersionForLayer:version:]((uint64_t)self, v6, &v35))
  {
    diskCache = self->_diskCache;
    v21 = v35;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke_2;
    v29[3] = &unk_1E1C06CC8;
    v22 = &v31;
    v23 = &v30;
    v30 = v15;
    v31 = v9;
    v24 = v15;
    v25 = v9;
    -[GEOTileDB getOfflineKeysForLayer:version:callbackQueue:callback:](diskCache, "getOfflineKeysForLayer:version:callbackQueue:callback:", v6, v21, v8, v29);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke;
    block[3] = &unk_1E1BFF970;
    v22 = &v34;
    v23 = &v33;
    v33 = v15;
    v34 = v9;
    v26 = v15;
    v27 = v9;
    dispatch_async(v8, block);
  }

}

void __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = (id)v2;
  if (v2)
    v3 = v2;
  else
    v3 = MEMORY[0x1E0C9AA60];
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, v3, 0);

}

void __77__GEOOfflineLocalDataAccess_getAvailableKeysForLayer_callbackQueue_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v9();
    goto LABEL_7;
  }
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_msgSend(v6, "addObjectsFromArray:", v10);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

LABEL_7:
}

- (void)getOfflineVersionMetadataWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__GEOOfflineLocalDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke;
  v8[3] = &unk_1E1BFFBF0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);

}

void __81__GEOOfflineLocalDataAccess_getOfflineVersionMetadataWithCallbackQueue_callback___block_invoke(uint64_t a1)
{
  GEOOfflineVersionMetadata *v2;

  v2 = -[GEOOfflineVersionMetadata initWithDataConfiguration:]([GEOOfflineVersionMetadata alloc], "initWithDataConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)offlineTileMetadataWithState:(id)a3 error:(id *)a4
{
  GEOPBOfflineTileMetadata *v6;
  GEOOfflineDataKey *v7;
  void *v8;
  GEOOfflineDataKey *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t v15[12];
  int v16;

  -[GEOOfflineDataConfiguration tileMetadata](self->_configuration, "tileMetadata", *(_QWORD *)&a3.var0);
  v6 = (GEOPBOfflineTileMetadata *)objc_claimAutoreleasedReturnValue();
  if (v6)
    return v6;
  v16 = -1;
  v7 = [GEOOfflineDataKey alloc];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v16, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOOfflineDataKey initWithLayer:serviceKey:](v7, "initWithLayer:serviceKey:", 9, v8);

  -[GEOOfflineLocalDataAccess dataForKey:error:](self, "dataForKey:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "readDataWithError:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v6 = -[GEOPBOfflineTileMetadata initWithData:]([GEOPBOfflineTileMetadata alloc], "initWithData:", v12);
      if (v6)
        -[GEOOfflineDataConfiguration setTileMetadata:](self->_configuration, "setTileMetadata:", v6);

      return v6;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: serializedConfig != ((void *)0)", v15, 2u);
    }

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testBundlesIsolation, 0);
  objc_storeStrong((id *)&self->_testBundles, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
}

@end
