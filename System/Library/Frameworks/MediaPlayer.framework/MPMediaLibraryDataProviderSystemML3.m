@implementation MPMediaLibraryDataProviderSystemML3

- (BOOL)supportsEntityChangeTrackingForMediaEntityType:(int64_t)a3 collectionGroupingType:(int64_t)a4 dataProviderClass:(Class *)a5
{
  if (!a3 && a5)
    *a5 = (Class)objc_opt_class();
  return a3 == 0;
}

- (MPMediaLibraryDataProviderSystemML3)initWithLibrary:(id)a3
{
  MPMediaLibraryDataProviderSystemML3 *v3;
  MPMediaLibraryDataProviderSystemML3 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMediaLibraryDataProviderSystemML3;
  v3 = -[MPMediaLibraryDataProviderML3 initWithLibrary:](&v6, sel_initWithLibrary_, a3);
  v4 = v3;
  if (v3)
    -[MPMediaLibraryDataProviderSystemML3 _initInstanceVariableOnce](v3, "_initInstanceVariableOnce");
  return v4;
}

- (void)_initInstanceVariableOnce
{
  _QWORD block[5];

  if (_initInstanceVariableOnce_onceToken != -1)
    dispatch_once(&_initInstanceVariableOnce_onceToken, &__block_literal_global_26201);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_initInstanceVariableOnce_initQueue, block);
}

void __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)_initInstanceVariableOnce_initQueue;
  _initInstanceVariableOnce_initQueue = (uint64_t)v0;

}

void __64__MPMediaLibraryDataProviderSystemML3__initInstanceVariableOnce__block_invoke_2(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
  {
    v2 = dispatch_queue_create("com.apple.mediaplayer.systemdataprovider", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(_QWORD *)(v3 + 136) = v2;

  }
}

- (int64_t)_currentRevision
{
  int64_t result;
  void *v4;

  result = self->_currentRevision;
  if (!result)
  {
    -[MPMediaLibraryDataProviderML3 library](self, "library");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentRevision = objc_msgSend(v4, "currentRevision");

    return self->_currentRevision;
  }
  return result;
}

- (BOOL)isGeniusEnabled
{
  void *v4;
  void *v5;
  char v6;

  if ((objc_msgSend(MEMORY[0x1E0D512D0], "hasGeniusFeatureEnabled") & 1) != 0)
    return 1;
  -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGeniusEnabled");

  return v6;
}

- (void)seedPlaylistWithIdentifier:(int64_t)a3 withItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D51230];
  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "newWithPersistentID:inLibrary:", a3, v10);

  v12 = (void *)MEMORY[0x1E0D512C8];
  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "newWithPersistentID:inLibrary:", a4, v13);

  objc_msgSend(v14, "valueForProperty:", *MEMORY[0x1E0D51148]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "longLongValue");

  if ((objc_msgSend(MEMORY[0x1E0D512D0], "hasGeniusDataAvailable") & 1) != 0 || !v16)
  {
    v17 = (void *)MEMORY[0x1E0D512D0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __105__MPMediaLibraryDataProviderSystemML3_seedPlaylistWithIdentifier_withItemWithIdentifier_completionBlock___block_invoke;
    v18[3] = &unk_1E315A6A0;
    v18[4] = self;
    v22 = v16;
    v19 = v14;
    v20 = v11;
    v21 = v8;
    objc_msgSend(v17, "populateContainer:withSeedTrack:completionBlock:", v20, v19, v18);

  }
  else
  {
    -[MPMediaLibraryDataProviderSystemML3 _seedCloudPlaylistWithTrack:container:completionBlock:](self, "_seedCloudPlaylistWithTrack:container:completionBlock:", v14, v11, v8);
  }

}

- (void)createGeniusClusterPlaylistWithSeedItemIdentifiers:(int64_t *)a3 count:(unint64_t)a4 error:(id *)a5
{
  unint64_t v6;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4); v6; --v6)
  {
    v10 = (void *)MEMORY[0x1E0D512C8];
    v11 = *a3++;
    -[MPMediaLibraryDataProviderML3 library](self, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "newWithPersistentID:inLibrary:", v11, v12);

    objc_msgSend(i, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0D512D0], "playlistControllerWithSeedTracks:error:", i, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = v14;

  return v15;
}

- (int64_t)generateItemIdentifiersForGeniusClusterPlaylist:(void *)a3 count:(unint64_t *)a4 error:(id *)a5
{
  int64_t *v5;
  void *v7;
  unint64_t v8;
  uint64_t i;
  void *v10;

  v5 = 0;
  if (a3 && a4)
  {
    objc_msgSend(a3, "tracksFromClusterForCount:error:", *a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v5 = (int64_t *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v7, "objectAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5[i] = objc_msgSend(v10, "persistentID");

      }
    }
    *a4 = v8;

  }
  return v5;
}

- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  MPMediaItem *v19;
  MPMediaItem *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)MEMORY[0x1E0D512C8];
  v8 = objc_msgSend(a3, "persistentID");
  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "newWithPersistentID:inLibrary:", v8, v9);

  objc_msgSend(MEMORY[0x1E0D512D0], "geniusTracksForSeedTrack:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        v19 = [MPMediaItem alloc];
        v20 = -[MPMediaItem initWithPersistentID:](v19, "initWithPersistentID:", objc_msgSend(v18, "persistentID", (_QWORD)v21));
        objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  if (v6)
    v6[2](v6, v12);

}

- (void)_seedCloudPlaylistWithTrack:(id)a3 container:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char IsCellular;
  void *v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "networkType");

  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "preferredMusicLowBandwidthResolution");

  v16 = IsCellular ^ 1;
  if (v15 > 0)
    v16 = 1;
  if (v12 && (v16 & 1) != 0)
  {
    v17 = v15 > 0;
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0D51148]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    -[MPMediaLibraryDataProviderML3 userIdentity](self, "userIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke;
    v23[3] = &unk_1E315A6F0;
    v27 = v17;
    v23[4] = self;
    v24 = v9;
    v25 = v8;
    v26 = v10;
    objc_msgSend(v21, "loadGeniusItemsForSagaID:completionHandler:", v19, v23);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_localizedCloudGeniusErrorForError:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v22);

  }
}

- (id)errorResolverForItem:(id)a3
{
  void *v3;
  void *v4;
  MPStorePurchaseErrorResolver *v5;

  objc_msgSend(a3, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:", CFSTR("storeAccountID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPStorePurchaseErrorResolver initWithStoreAccountIdentifier:]([MPStorePurchaseErrorResolver alloc], "initWithStoreAccountIdentifier:", v4);

  return v5;
}

- (void)updateEntitesToCurrentRevision
{
  NSObject *queue;
  _QWORD block[5];

  -[MPMediaLibraryDataProviderSystemML3 _initInstanceVariableOnce](self, "_initInstanceVariableOnce");
  if (updateEntitesToCurrentRevision_onceToken != -1)
    dispatch_once(&updateEntitesToCurrentRevision_onceToken, &__block_literal_global_48_26180);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_2;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_currentRevision");
  objc_msgSend(*(id *)(a1 + 32), "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_3;
  v4[3] = &unk_1E315A738;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  objc_msgSend(v3, "enumeratePersistentIDsAfterRevision:revisionTrackingCode:maximumRevisionType:usingBlock:", v2, 0x7FFFFFFFFFFFFFFFLL, 3, v4);

}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "entityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)__revisionTrackingCodeToEntityClassMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatePropertyValuesInEntityWithIdentifier:dataProviderEntityClass:deleted:", a2, v13, a4 != 0);

  if (*(_QWORD *)(a1 + 40) < a3)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = a3;
}

void __69__MPMediaLibraryDataProviderSystemML3_updateEntitesToCurrentRevision__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;
  _QWORD v32[7];

  v32[5] = *MEMORY[0x1E0C80C00];
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "revisionTrackingCode"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)__revisionTrackingCodeToEntityClassMap;
  __revisionTrackingCodeToEntityClassMap = v10;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        v18 = (void *)__revisionTrackingCodeToEntityClassMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "revisionTrackingCode"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v17, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

}

void __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v5 = a2;
  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__26192;
  v28 = __Block_byref_object_dispose__26193;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "networkType");

  if (v8 && (!ICEnvironmentNetworkTypeIsCellular() || *(_BYTE *)(a1 + 64)))
  {
    v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke_42;
    v16[3] = &unk_1E315A6C8;
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v17 = v10;
    v18 = v11;
    v22 = &v30;
    v19 = v12;
    v20 = *(id *)(a1 + 48);
    v23 = &v24;
    v21 = v6;
    objc_msgSend(v9, "performTransactionWithBlock:", v16);

    v13 = v17;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_localizedCloudGeniusErrorForError:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25[5];
    v25[5] = v14;
  }

  if (*((_BYTE *)v31 + 24))
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 32));
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 16))(v15, *((unsigned __int8 *)v31 + 24), v25[5]);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

uint64_t __93__MPMediaLibraryDataProviderSystemML3__seedCloudPlaylistWithTrack_container_completionBlock___block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2 + 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "library");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      v7 = *MEMORY[0x1E0D51148];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(obj);
          v9 = (void *)MEMORY[0x1E0D512C8];
          objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v7, objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "longLongValue"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "anyInLibrary:predicate:", v3, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v12);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v5);
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v13 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "valueForProperty:", *MEMORY[0x1E0D50AD8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forProperty:", v14, *MEMORY[0x1E0D50A90]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 56), "persistentID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "replaceObjectAtIndex:withObject:", 0, v15);

      objc_msgSend(*(id *)(a1 + 48), "setTracksWithPersistentIDs:notify:", v21, 1);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_localizedGeniusErrorForError:geniusEnabled:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "isGeniusEnabled"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
}

void __105__MPMediaLibraryDataProviderSystemML3_seedPlaylistWithIdentifier_withItemWithIdentifier_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_localizedGeniusErrorForError:geniusEnabled:", v7, objc_msgSend(*(id *)(a1 + 32), "isGeniusEnabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0)
    {
LABEL_3:
      +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
    if ((a2 & 1) != 0)
      goto LABEL_3;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_seedCloudPlaylistWithTrack:container:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_9;
  }
LABEL_7:
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v5);
LABEL_9:

}

+ (id)_localizedCloudGeniusErrorForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int IsCellular;
  int v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasCellularDataCapability"))
  {
    +[MPPlaybackUserDefaults standardUserDefaults](MPPlaybackUserDefaults, "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "preferredMusicLowBandwidthResolution") < 1;

  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkType");

  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  v9 = objc_msgSend(v4, "hasWiFiCapability");
  v10 = objc_msgSend(v4, "hasWAPICapability");
  if (v6 || !v9 || (IsCellular & 1) != 0)
  {
    if (((v6 | IsCellular) & 1) != 0)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("GENIUS_PLAYLIST_OFFLINE_SUBTITLE_WIFI");
        v14 = CFSTR("GENIUS_PLAYLIST_OFFLINE_SUBTITLE_WLAN");
        goto LABEL_11;
      }
      v21 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GENIUS_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v23;
      v24 = CFSTR("GENIUS_FEATURE_NOT_AVAILABLE_SUBTITLE");
    }
    else
    {
      v21 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("GENIUS_PLAYLIST_OFFLINE_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v23;
      v24 = CFSTR("GENIUS_PLAYLIST_OFFLINE_SUBTITLE_CELLULAR");
    }
    objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v18, v22, v25, *MEMORY[0x1E0CB2D68], 0);

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = CFSTR("GENIUS_PLAYLIST_OFFLINE_SUBTITLE_ALL");
  v14 = CFSTR("GENIUS_PLAYLIST_OFFLINE_SUBTITLE_ALL_WLAN");
LABEL_11:
  if (v10)
    v15 = v14;
  else
    v15 = v13;
  objc_msgSend(v11, "localizedStringForKey:value:table:", v15, &stru_1E3163D10, CFSTR("MediaPlayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("GENIUS_PLAYLIST_OFFLINE_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v19, *MEMORY[0x1E0CB2D50], v16, *MEMORY[0x1E0CB2D68], 0);
LABEL_18:

  if (v3)
  {
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "userInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v3, "userInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addEntriesFromDictionary:", v28);

    }
    if (v20)
      objc_msgSend(v26, "addEntriesFromDictionary:", v20);
    v29 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, objc_msgSend(v3, "code"), v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", &stru_1E3163D10, 0, v20);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v31;
}

+ (id)_localizedGeniusErrorForError:(id)a3 geniusEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENIUS_PICKER_NO_RESULTS_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("GENIUS_PICKER_NO_RESULTS_MESSAGE");
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENIUS_FEATURE_NOT_AVAILABLE_TITLE"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("GENIUS_FEATURE_NOT_AVAILABLE_SUBTITLE");
  }
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E3163D10, CFSTR("MediaPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v9, v10, v14, *MEMORY[0x1E0CB2D68], 0);

  if (v5)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v5, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addEntriesFromDictionary:", v18);

    }
    if (v15)
      objc_msgSend(v16, "addEntriesFromDictionary:", v15);
    v19 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v5, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v5, "code"), v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", &stru_1E3163D10, 0, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

@end
