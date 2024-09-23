@implementation GEOAbstractOfflineTileRequester

+ (BOOL)requiresNetwork
{
  return 0;
}

- (GEOAbstractOfflineTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v8;
  GEOAbstractOfflineTileRequester *v9;
  dispatch_group_t v10;
  OS_dispatch_group *group;
  uint64_t v12;
  geo_isolater *keyListIsolater;
  void *v14;
  uint64_t v15;
  GEOTileKeyList *keyList;
  uint64_t v17;
  GEOApplicationAuditToken *auditToken;
  GEOAbstractOfflineTileRequester *v19;
  objc_super v21;

  v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOAbstractOfflineTileRequester;
  v9 = -[GEOTileRequester initWithTileRequest:delegateQueue:delegate:](&v21, sel_initWithTileRequest_delegateQueue_delegate_, v8, a4, a5);
  if (v9)
  {
    v9->_qos = qos_class_self();
    v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    atomic_store(0, (unsigned __int8 *)&v9->_canceled);
    v12 = geo_isolater_create();
    keyListIsolater = v9->_keyListIsolater;
    v9->_keyListIsolater = (geo_isolater *)v12;

    objc_msgSend(v8, "keyList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    keyList = v9->_keyList;
    v9->_keyList = (GEOTileKeyList *)v15;

    v9->_keyListIndex = 0;
    v9->_finished.lock._os_unfair_lock_opaque = 0;
    v9->_finished.didRun = 0;
    objc_msgSend(v8, "auditToken");
    v17 = objc_claimAutoreleasedReturnValue();
    auditToken = v9->_auditToken;
    v9->_auditToken = (GEOApplicationAuditToken *)v17;

    v19 = v9;
  }

  return v9;
}

- (void)start
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__GEOAbstractOfflineTileRequester_start__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(global_queue, block);

}

uint64_t __40__GEOAbstractOfflineTileRequester_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadTiles");
}

- (uint64_t)_offlineDataKeyForTileKey:localeKey:
{
  return 0;
}

- (uint64_t)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(uint64_t)a3 onlineTileKey:(uint64_t)a4 completionHandler:(uint64_t)a5
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
}

- (void)_loadTiles
{
  unsigned __int8 v3;
  NSObject *v4;
  unint64_t keyListIndex;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  OS_dispatch_queue *delegateQueue;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  NSObject *group;
  NSObject *v26;
  __int128 v27;
  void *v28;
  _QWORD block[5];
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  __n128 (*v33)(uint64_t);
  void *v34;
  GEOAbstractOfflineTileRequester *v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  GEOAbstractOfflineTileRequester *v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  __int128 v44;
  uint8_t buf[4];
  _BYTE v46[18];
  __int128 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  const char *v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  +[GEOOfflineDataAccess sharedInstance](GEOOfflineDataAccess, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) == 0)
  {
    v27 = 0x8410203uLL;
    while (1)
    {
      v48 = 0;
      v49 = (char *)&v48;
      v50 = 0x3010000000;
      v51 = "";
      v52 = xmmword_189CBD5D0;
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke;
      v34 = &unk_1E1BFF920;
      v35 = self;
      v36 = &v48;
      geo_isolate_sync_data();
      if ((v49[32] & 0x7F) == 1)
        break;
      GEOGetTileLoadingLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        keyListIndex = self->_keyListIndex;
        GEOStringFromTileKey(v49 + 32);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v46 = keyListIndex;
        *(_WORD *)&v46[4] = 2112;
        *(_QWORD *)&v46[6] = v6;
        _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[Offline] Loading tile %d %@", buf, 0x12u);

      }
      dispatch_group_enter((dispatch_group_t)self->_group);
      v7 = *((_QWORD *)v49 + 5);
      v8 = -97;
      if ((v49[32] & 0x60) == 0)
        v8 = -1;
      *(_QWORD *)&v47 = v8 & *((_QWORD *)v49 + 4);
      *((_QWORD *)&v47 + 1) = v7;
      -[GEOTileRequester activeTileSetForKey:](self, "activeTileSetForKey:", &v47, v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "disputedBordersOfflineKeySuffixForCountry:region:", self->super._deviceCountry, self->super._deviceRegion);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOAbstractOfflineTileRequester _offlineDataKeyForTileKey:localeKey:](self, "_offlineDataKeyForTileKey:localeKey:", &v47, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v12 = GEOTileKeyStyle((uint64_t)&v47, &v30);
      v13 = v30;
      +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v12)
        v16 = (v13 << 32) | 0x100;
      else
        v16 = 256;
      objc_msgSend(v14, "requestCounterTicketForType:auditToken:traits:", v16, self->_auditToken, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "startingRequestWithExplicitInterfaces:", 256);
      if (objc_msgSend(v10, "length"))
      {
        GEOGetTileLoadingLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          GEOStringFromTileKey(v49 + 32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v27;
          *(_QWORD *)v46 = v10;
          *(_WORD *)&v46[8] = 2112;
          *(_QWORD *)&v46[10] = v19;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_DEBUG, "[Offline] Checking for locale-specific (%{private}@) variant: %@", buf, 0x16u);

        }
      }
      if (v11)
      {
        delegateQueue = self->super._delegateQueue;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_5;
        v37[3] = &unk_1E1C14BB8;
        v21 = v10;
        v43 = &v48;
        v38 = v21;
        v39 = self;
        v44 = v47;
        v40 = v17;
        v22 = v11;
        v41 = v22;
        v42 = v28;
        objc_msgSend(v42, "getDataForKey:callbackQueue:callback:", v22, delegateQueue, v37);

        v23 = v38;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Unexpected tile key"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v23, 0, 0);
        -[GEOAbstractOfflineTileRequester _offlineTileComplete:onlineKey:tile:info:error:](self, "_offlineTileComplete:onlineKey:tile:info:error:", v49 + 32, &v47, 0, 0, v23);
        dispatch_group_leave((dispatch_group_t)self->_group);
      }

      _Block_object_dispose(&v48, 8);
      v24 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v24 & 1) != 0)
        goto LABEL_21;
    }
    _Block_object_dispose(&v48, 8);
  }
LABEL_21:
  group = self->_group;
  v26 = self->super._delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_4;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_group_notify(group, v26, block);

}

__n128 __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  __n128 result;
  __n128 *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 88);
  if (v3 < objc_msgSend(*(id *)(v2 + 80), "count"))
  {
    v5 = (__n128 *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "keyAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    result = *v5;
    *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *v5;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  }
  return result;
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "serviceKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", 0, objc_msgSend(v8, "length"), objc_msgSend(v5, "length"));

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32;
    v35[0] = CFSTR("TileIsCacheable");
    v35[1] = CFSTR("GEOTileLoadResultSource");
    v36[0] = MEMORY[0x1E0C9AAA0];
    v36[1] = &unk_1E1E815B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_offlineTileComplete:onlineKey:tile:info:error:", v10, a1 + 80, v5, v11, v6);

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 96));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    GEOGetTileLoadingLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      GEOStringFromTileKey((char *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v13;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "[Offline] No locale-specific variant found for tile. Fetching base data: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_offlineDataKeyForTileKey:localeKey:", a1 + 80, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = *(void **)(a1 + 64);
      v16 = *(void **)(a1 + 48);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_8;
      v37[3] = &unk_1E1C14BB8;
      v38 = v16;
      v39 = v14;
      v40 = *(id *)(a1 + 56);
      v41 = 0;
      v18 = *(_QWORD *)(a1 + 72);
      v42 = *(_QWORD *)(a1 + 40);
      v43 = v18;
      v44 = *(_OWORD *)(a1 + 80);
      objc_msgSend(v15, "getDataForKey:callbackQueue:callback:", v39, v17, v37);

      v19 = v38;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Unexpected tile key"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "serviceKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v19, objc_msgSend(v25, "length"), 0);

      v26 = *(void **)(a1 + 40);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32;
      v45[0] = CFSTR("TileIsCacheable");
      v45[1] = CFSTR("GEOTileLoadResultSource");
      v46[0] = MEMORY[0x1E0C9AAA0];
      v46[1] = &unk_1E1E815B0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_offlineTileComplete:onlineKey:tile:info:error:", v27, a1 + 80, 0, v28, v19);

      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 96));
    }

  }
  else
  {
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_3;
    v29[3] = &unk_1E1C14B90;
    v21 = *(void **)(a1 + 40);
    v30 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v23 = *(_QWORD *)(a1 + 40);
    v31 = v22;
    v32 = v23;
    v33 = *(_QWORD *)(a1 + 72);
    v34 = *(_OWORD *)(a1 + 80);
    objc_msgSend(v21, "_fetchEmptyFallbackIfPossibleForOfflineTileKey:onlineTileKey:completionHandler:", v20, a1 + 80, v29);

  }
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "serviceKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    objc_msgSend(*(id *)(a1 + 48), "serviceKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", 0, objc_msgSend(v10, "length") + v9, objc_msgSend(*(id *)(a1 + 56), "length") + objc_msgSend(v5, "length"));

    v11 = *(void **)(a1 + 64);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32;
    v22[0] = CFSTR("TileIsCacheable");
    v22[1] = CFSTR("GEOTileLoadResultSource");
    v23[0] = MEMORY[0x1E0C9AAA0];
    v23[1] = &unk_1E1E815B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_offlineTileComplete:onlineKey:tile:info:error:", v12, a1 + 80, v5, v13, v6);

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 64) + 96));
  }
  else
  {
    v14 = *(void **)(a1 + 64);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_2;
    v17[3] = &unk_1E1C14B90;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    v16 = *(_OWORD *)(a1 + 80);
    v20 = *(_OWORD *)(a1 + 64);
    v21 = v16;
    objc_msgSend(v14, "_fetchEmptyFallbackIfPossibleForOfflineTileKey:onlineTileKey:completionHandler:", v15, a1 + 80, v17);

  }
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v4, objc_msgSend(v6, "length"), objc_msgSend(v3, "length"));

  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
  v10[0] = CFSTR("TileIsCacheable");
  v10[1] = CFSTR("GEOTileLoadResultSource");
  v11[0] = MEMORY[0x1E0C9AAA0];
  v11[1] = &unk_1E1E815B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_offlineTileComplete:onlineKey:tile:info:error:", v8, a1 + 64, v3, v9, v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 96));
}

void __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "explicitInterfaceRequestCompleted:xmitBytes:recvBytes:", v4, objc_msgSend(v6, "length"), objc_msgSend(v3, "length"));

  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32;
  v10[0] = CFSTR("TileIsCacheable");
  v10[1] = CFSTR("GEOTileLoadResultSource");
  v11[0] = MEMORY[0x1E0C9AAA0];
  v11[1] = &unk_1E1E815B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_offlineTileComplete:onlineKey:tile:info:error:", v8, a1 + 64, v3, v9, v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 48) + 96));
}

uint64_t __45__GEOAbstractOfflineTileRequester__loadTiles__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finished");
}

- (void)_offlineTileComplete:(char *)a3 onlineKey:(uint64_t)a4 tile:(void *)a5 info:(void *)a6 error:(void *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  dispatch_assert_queue_V2(a1[3]);
  GEOGetTileLoadingLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v16)
    {
      GEOStringFromTileKey(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "[Offline] Failed to load tile %@: %@", buf, 0x16u);

    }
    -[dispatch_queue_t delegate](a1, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tileRequester:receivedError:forKey:", a1, v14, *(_QWORD *)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    if (v16)
    {
      GEOStringFromTileKey(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "[Offline] Successfully loaded tile %@", buf, 0xCu);

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tileEdition"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntValue");

    LODWORD(v20) = -[dispatch_queue_t tileSetForKey:](a1, "tileSetForKey:", a4);
    -[dispatch_queue_t activeTileSetForKey:](a1, "activeTileSetForKey:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_t delegate](a1, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", a1, v12, v21, v20, v18, 0, *(_QWORD *)a3, *((_QWORD *)a3 + 1), v13);

  }
}

- (void)_finished
{
  _QWORD v3[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._delegateQueue);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__GEOAbstractOfflineTileRequester__finished__block_invoke;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = self;
  GEOOnce((uint64_t)&self->_finished, v3);
}

void __44__GEOAbstractOfflineTileRequester__finished__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  GEOGetTileLoadingLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "[Offline] Finished loading all tiles", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tileRequesterFinished:", *(_QWORD *)(a1 + 32));

}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (uint64_t)cancelKey:
{
  return geo_isolate_sync_data();
}

unint64_t __45__GEOAbstractOfflineTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  __int128 v5;
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v9;
  void *v10;
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 88);
  result = objc_msgSend(*(id *)(v2 + 80), "count");
  if (v3 < result)
  {
    *(_QWORD *)&v5 = 138412546;
    v11 = v5;
    do
    {
      v6 = *(_QWORD **)(a1 + 40);
      v7 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "keyAtIndex:", v3, v11);
      if (*v6 == *v7 && v6[1] == v7[1])
      {
        GEOGetTileLoadingLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          GEOStringFromTileKey(*(char **)(a1 + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v11;
          v13 = v10;
          v14 = 1024;
          v15 = v3;
          _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "[Offline] Canceling tile %@ at index %d", buf, 0x12u);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeKey:", *(_QWORD *)(a1 + 40));
      }
      else
      {
        ++v3;
      }
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
    }
    while (v3 < result);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_keyList, 0);
  objc_storeStrong((id *)&self->_keyListIsolater, 0);
}

@end
