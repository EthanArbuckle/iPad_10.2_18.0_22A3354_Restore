@implementation GEOMapAssetMetadataFetcher

- (GEOMapAssetMetadataFetcher)init
{
  GEOMapAssetMetadataFetcher *result;

  result = (GEOMapAssetMetadataFetcher *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapAssetMetadataFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 enableASTCTextures:(BOOL)a5
{
  id v8;
  id v9;
  GEOMapAssetMetadataFetcher *v10;
  GEOTileLoader *v11;
  GEOTileLoader *tileLoader;
  uint64_t v13;
  geo_isolater *isolation;
  GEOMapAssetMetadataFetcher *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapAssetMetadataFetcher;
  v10 = -[GEOMapAssetMetadataFetcher init](&v17, sel_init);
  if (v10)
  {
    if (v8)
    {
      v11 = (GEOTileLoader *)v8;
    }
    else
    {
      +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
      v11 = (GEOTileLoader *)objc_claimAutoreleasedReturnValue();
    }
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v11;

    objc_storeStrong((id *)&v10->_auditToken, a4);
    v10->_enableASTCTextures = a5;
    v13 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)fetchAssetMetadataForMetadataKeys:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  GEOTileKeyMap *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOApplicationAuditToken *auditToken;
  GEOTileLoader *tileLoader;
  GEOTileLoader *v23;
  GEOTileKeyMap *v24;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  NSObject *queue;
  _QWORD v30[4];
  GEOTileKeyMap *v31;
  id v32;
  GEOMapAssetMetadataFetcher *v33;
  id v34;
  _QWORD *v35;
  _QWORD v36[4];
  GEOTileKeyMap *v37;
  NSObject *v38;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  _QWORD block[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD *);
  void *v52;
  GEOMapAssetMetadataFetcher *v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[4];
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  queue = a4;
  v9 = a5;
  v25 = v8;
  v26 = v9;
  v10 = objc_msgSend(v8, "count");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__93;
    v60 = __Block_byref_object_dispose__93;
    v61 = 0;
    v49 = MEMORY[0x1E0C809B0];
    v50 = 3221225472;
    v51 = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_11;
    v52 = &unk_1E1BFFFE8;
    v53 = self;
    v12 = v8;
    v54 = v12;
    v55 = &v56;
    geo_isolate_sync_data();
    if (v57[5])
    {
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_2;
      block[3] = &unk_1E1C15D38;
      v47 = v9;
      v48 = &v56;
      dispatch_async(queue, block);
      v13 = v47;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      GEOTileLoaderClientIdentifier(v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = dispatch_group_create();
      v28 = v13;
      v16 = -[GEOTileKeyMap initWithMapType:]([GEOTileKeyMap alloc], "initWithMapType:", 0);
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__93;
      v44[4] = __Block_byref_object_dispose__93;
      v45 = 0;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = v12;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v41 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            dispatch_group_enter(v15);
            auditToken = self->_auditToken;
            tileLoader = self->_tileLoader;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_3;
            v36[3] = &unk_1E1C15D60;
            v39 = v44;
            v37 = v16;
            v38 = v15;
            v23 = tileLoader;
            v13 = v28;
            -[GEOTileLoader loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:](v23, "loadKey:priority:forClient:options:reason:auditToken:callbackQ:beginNetwork:callback:", v20, 2147483646, v28, 3, 4, auditToken, queue, 0, v36);

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v64, 16);
        }
        while (v17);
      }

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_4;
      v30[3] = &unk_1E1C15D88;
      v35 = v44;
      v34 = v26;
      v31 = v16;
      v32 = obj;
      v33 = self;
      v24 = v16;
      dispatch_group_notify(v15, queue, v30);

      _Block_object_dispose(v44, 8);
    }

    _Block_object_dispose(&v56, 8);
  }
  else
  {
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke;
    v62[3] = &unk_1E1C05D48;
    v63 = v9;
    dispatch_async(queue, v62);

  }
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  GEOMapAssetMetadata *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(GEOMapAssetMetadata);
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_11(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (*(_QWORD *)(v1 + 48))
  {
    v3 = (void *)a1[5];
    v4 = *(id *)(v1 + 40);
    v5 = v3;
    v6 = objc_msgSend(v4, "count");
    if (v6 == objc_msgSend(v5, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            if ((objc_msgSend(v5, "containsKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), (_QWORD)v11) & 1) == 0)
            {

              return;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v8)
            continue;
          break;
        }
      }

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 48));
    }
    else
    {

    }
  }
}

uint64_t __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a5;
  v11 = a6;
  if (v10)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v12 + 40);
    v13 = (id *)(v12 + 40);
    v14 = v15;
    if (v15)
      v16 = v14;
    else
      v16 = v10;
    objc_storeStrong(v13, v16);
  }
  else if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v17, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  GEOMapAssetMetadata *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOVectorTile *v11;
  void *v12;
  id v13;
  GEOMapAssetMetadata *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  GEOMapAssetMetadata *obj;
  id obja;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v2 == objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v4 = (GEOMapAssetMetadata *)*(id *)(a1 + 40);
      v5 = -[GEOMapAssetMetadata countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v24;
        obj = v4;
LABEL_6:
        v7 = 0;
        while (1)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9)
          {
            v16 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Unexpectedly-missing tile"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

            goto LABEL_21;
          }
          objc_msgSend(v9, "decodedRepresentation");
          v11 = (GEOVectorTile *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v22 = 0;
            objc_msgSend(v10, "readDataWithError:", &v22);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v22;
            if (!v12)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_20:

              goto LABEL_21;
            }
            v11 = -[GEOVectorTile initWithVMP4:localizationData:tileKey:]([GEOVectorTile alloc], "initWithVMP4:localizationData:tileKey:", v12, 0, v8);

            if (!v11)
            {
              v18 = *(_QWORD *)(a1 + 56);
              objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Missing metadata tile"));
              v13 = (id)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v13);
              goto LABEL_20;
            }
          }
          objc_msgSend(v3, "addObject:", v11);

          if (v5 == ++v7)
          {
            v4 = obj;
            v5 = -[GEOMapAssetMetadata countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v5)
              goto LABEL_6;
            break;
          }
        }
      }

      v14 = -[GEOMapAssetMetadata initWithVectorTiles:enableASTCTextures:]([GEOMapAssetMetadata alloc], "initWithVectorTiles:enableASTCTextures:", v3, *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 24));
      v21 = *(id *)(a1 + 40);
      obj = v14;
      geo_isolate_sync_data();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_21:
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Unexpected number of tiles"));
      obja = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);

    }
  }
}

void __96__GEOMapAssetMetadataFetcher_fetchAssetMetadataForMetadataKeys_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoadedMetadata, 0);
  objc_storeStrong((id *)&self->_lastLoadedKeys, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
