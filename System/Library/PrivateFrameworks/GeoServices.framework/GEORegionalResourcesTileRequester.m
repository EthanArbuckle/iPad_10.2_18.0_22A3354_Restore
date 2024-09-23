@implementation GEORegionalResourcesTileRequester

uint64_t __42__GEORegionalResourcesTileRequester_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GEOTileData *v4;
  void *v5;
  GEOTileData *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  GEOTileData *v10;
  _QWORD v11[5];
  GEOTileData *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [GEOTileData alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GEOTileData initWithData:](v4, "initWithData:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_4;
  v11[3] = &unk_1E1C14AF0;
  v11[1] = 3221225472;
  v12 = v6;
  v13 = v8;
  v11[4] = v7;
  v14 = *(_OWORD *)(a1 + 48);
  v10 = v6;
  dispatch_async(v9, v11);

}

- (uint64_t)_generateEndSignpostEventIfNecessary:
{
  return geo_isolate_sync_data();
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  id v10;

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "resourceManifestManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(v6, "tileSetForKey:", a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "activeTileSetForKey:", a1 + 56);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", v6, v7, v4, v8, v9, 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tileRequesterFinished:", *(_QWORD *)(a1 + 32));

  }
}

void __74__GEORegionalResourcesTileRequester__generateEndSignpostEventIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", a1 + 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
    GEOGetTileLoadingLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v6, OS_SIGNPOST_INTERVAL_END, v4, "SubmittedToRequester", (const char *)&unk_189D97683, v7, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectForKey:", a1 + 40);
  }

}

- (void)start
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  _OWORD *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  _GEORegionalResourcesTileLoader *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(_QWORD *);
  void *v37;
  GEORegionalResourcesTileRequester *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[3];
  uint64_t v52;
  _QWORD v53[6];
  __int128 v54;
  _QWORD v55[6];
  __int128 v56;
  uint8_t buf[24];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  -[GEOTileRequester tileRequest](self, "tileRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v52 = v5;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[GEOTileRequest keyList](self->super._tileRequest, "keyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__82;
        v45 = __Block_byref_object_dispose__82;
        v46 = 0;
        v34 = v8;
        v35 = 3221225472;
        v36 = __42__GEORegionalResourcesTileRequester_start__block_invoke;
        v37 = &unk_1E1C00A50;
        v38 = self;
        v39 = &v41;
        v40 = v11;
        geo_isolate_sync_data();
        v12 = (void *)v42[5];
        if (v12)
        {
          v13 = objc_msgSend(v12, "unsignedLongLongValue");
          GEOGetTileLoadingLog();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1885A9000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SubmittedToRequester", "Type=RegionalResource", buf, 2u);
          }

        }
        _Block_object_dispose(&v41, 8);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v7);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[GEOTileRequester tileRequest](self, "tileRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyList");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v58, 16);
  if (v17)
  {
    v27 = *(_QWORD *)v31;
    do
    {
      v28 = v17;
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v31 != v27)
          objc_enumerationMutation(obj);
        v19 = *(_OWORD **)(*((_QWORD *)&v30 + 1) + 8 * j);
        *(_OWORD *)buf = *v19;
        v41 = 0;
        v42 = &v41;
        v43 = 0x3032000000;
        v44 = __Block_byref_object_copy__82;
        v45 = __Block_byref_object_dispose__82;
        v46 = 0;
        geo_isolate_sync_data();
        v20 = (void *)v42[5];
        if (v20)
          v21 = objc_msgSend(v20, "unsignedLongLongValue");
        else
          v21 = 0;
        v29 = objc_alloc_init(_GEORegionalResourcesTileLoader);
        geo_isolate_sync();
        -[GEOTileRequester tileRequest](self, "tileRequest");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "manifestConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOTileRequester tileRequest](self, "tileRequest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "auditToken");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v8;
        v55[1] = 3221225472;
        v55[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_3;
        v55[3] = &unk_1E1C14B18;
        v56 = *(_OWORD *)buf;
        v55[4] = self;
        v55[5] = v51;
        v53[0] = v8;
        v53[1] = 3221225472;
        v53[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_5;
        v53[3] = &unk_1E1C14B40;
        v54 = *(_OWORD *)buf;
        v53[4] = self;
        v53[5] = v51;
        -[_GEORegionalResourcesTileLoader loadResourcesForTileKey:manifestConfiguration:auditToken:signpostID:finished:error:](v29, "loadResourcesForTileKey:manifestConfiguration:auditToken:signpostID:finished:error:", v19, v23, v25, v21, v55, v53);

        _Block_object_dispose(&v41, 8);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v58, 16);
    }
    while (v17);
  }

  _Block_object_dispose(v51, 8);
}

+ (unsigned)tileProviderIdentifier
{
  return 8;
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_6(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__GEORegionalResourcesTileRequester_start__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (GEORegionalResourcesTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  id v8;
  GEORegionalResourcesTileRequester *v9;
  NSMutableArray *v10;
  NSMutableArray *loaders;
  uint64_t v12;
  geo_isolater *loadersIsolater;
  uint64_t v14;
  GEOTileKeyMap *signpostIDs;
  uint64_t v16;
  geo_isolater *signpostIDsIsolater;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEORegionalResourcesTileRequester;
  v9 = -[GEOTileRequester initWithTileRequest:delegateQueue:delegate:](&v19, sel_initWithTileRequest_delegateQueue_delegate_, v8, a4, a5);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    loaders = v9->_loaders;
    v9->_loaders = v10;

    v12 = geo_isolater_create();
    loadersIsolater = v9->_loadersIsolater;
    v9->_loadersIsolater = (geo_isolater *)v12;

    objc_msgSend(v8, "signpostIDs");
    v14 = objc_claimAutoreleasedReturnValue();
    signpostIDs = v9->_signpostIDs;
    v9->_signpostIDs = (GEOTileKeyMap *)v14;

    v16 = geo_isolater_create();
    signpostIDsIsolater = v9->_signpostIDsIsolater;
    v9->_signpostIDsIsolater = (geo_isolater *)v16;

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostIDsIsolater, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_loadersIsolater, 0);
  objc_storeStrong((id *)&self->_loaders, 0);
}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __42__GEORegionalResourcesTileRequester_start__block_invoke_6;
  v8[3] = &unk_1E1C14AF0;
  v8[1] = 3221225472;
  v9 = v3;
  v10 = v5;
  v8[4] = v4;
  v11 = *(_OWORD *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __42__GEORegionalResourcesTileRequester_start__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileRequester:receivedError:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tileRequesterFinished:", *(_QWORD *)(a1 + 32));

  }
}

- (void)cancel
{
  geo_isolate_sync();
}

uint64_t __43__GEORegionalResourcesTileRequester_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "cancel", (_QWORD)v10);
        v8 = (_QWORD *)objc_msgSend(v7, "tileKeyPtr");
        objc_msgSend(*(id *)(a1 + 32), "_generateEndSignpostEventIfNecessary:", *v8, v8[1]);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
}

@end
