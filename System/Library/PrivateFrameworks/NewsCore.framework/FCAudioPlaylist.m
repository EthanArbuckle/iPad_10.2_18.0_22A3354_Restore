@implementation FCAudioPlaylist

- (id)localStoreMigrator
{
  return objc_alloc_init(FCAudioPlaylistMigrator);
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:", objc_opt_class());

}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return CFSTR("audio-playlist");
}

+ (id)commandStoreFileName
{
  return CFSTR("audio-playlist-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

void __43__FCAudioPlaylist_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAllEntriesToDictionary:", obj);

  objc_msgSend((id)objc_opt_class(), "internalLocalStoreKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "removeObjectsForKeys:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 96), obj);
    v6 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  -[FCAudioPlaylist _regenerateOrderedArticleIDs](v6);

}

- (void)_regenerateOrderedArticleIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_26_2);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_28_1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v4;

  }
}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__FCAudioPlaylist_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (FCAudioPlaylist)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCAudioPlaylist *v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *itemsLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCAudioPlaylist;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v9, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

  }
  return v5;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCAudioPlaylist;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("AudioPlaylist"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  FCModifyAudioPlaylistCommand *v9;
  FCModifyAudioPlaylistCommand *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __72__FCAudioPlaylist_commandsToMergeLocalDataToCloud_privateDataDirectory___block_invoke;
  v16 = &unk_1E4646358;
  v17 = v5;
  v18 = a1;
  v7 = v5;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [FCModifyAudioPlaylistCommand alloc];
  v10 = -[FCModifyAudioPlaylistCommand initWithItems:merge:](v9, "initWithItems:merge:", v8, 1, v13, v14, v15, v16);
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __72__FCAudioPlaylist_commandsToMergeLocalDataToCloud_privateDataDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 40), "isLocalStoreKeyInternal:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *itemsByID;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62650]), "initWithCKRecord:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        if (v15)
          objc_msgSend(v8, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        if (self)
          itemsByID = self->_itemsByID;
        else
          itemsByID = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](itemsByID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "articleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v22, "articleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v24);

        }
        ++v20;
      }
      while (v18 != v20);
      v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      v18 = v25;
    }
    while (v25);
  }

  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:]((id *)&self->super.super.isa, v8, v9);
}

- (void)_modifyWithInsertedOrChangedItems:(void *)a3 removedArticleIDs:
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = a3;
  if (a1 && (objc_msgSend(v5, "count") || objc_msgSend(v31, "count")))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v30 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    v8 = v7 != 0;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
          v13 = a1[12];
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

          objc_msgSend(a1, "localStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v9);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v31;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(MEMORY[0x1E0D62650], "identifierFromArticleID:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v21), v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[12], "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(a1, "localStore");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObjectForKey:", v22);

            objc_msgSend(a1[12], "removeObjectForKey:", v22);
            v8 = 1;
          }

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v19);
    }

    v5 = v30;
    if (v8)
    {
      -[FCAudioPlaylist _regenerateOrderedArticleIDs]((uint64_t)a1);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(a1, "observers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v33;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v33 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v29++), "audioPlaylistDidChange:", a1, v30);
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        }
        while (v27);
      }

    }
  }

}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  if (self)
    self = (FCAudioPlaylist *)self->_itemsByID;
  return (id)-[FCAudioPlaylist allKeys](self, "allKeys", a3);
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("AudioPlaylist"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__50;
  v14 = __Block_byref_object_dispose__50;
  v15 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v6 = itemsLock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke;
  v9[3] = &unk_1E463AD80;
  v9[4] = self;
  v9[5] = &v10;
  -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v9);

  objc_msgSend((id)v11[5], "fc_arrayByTransformingWithBlock:", &__block_literal_global_118);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __47__FCAudioPlaylist_recordsForRestoringZoneName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (NSArray)articleIDs
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__50;
  v12 = __Block_byref_object_dispose__50;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__FCAudioPlaylist_articleIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __29__FCAudioPlaylist_articleIDs__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = v2;
  objc_msgSend(v3, "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)containsArticleID:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v6 = itemsLock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__FCAudioPlaylist_containsArticleID___block_invoke;
  v10[3] = &unk_1E463AD58;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v10);

  v8 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __37__FCAudioPlaylist_containsArticleID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = a1[5];
  v4 = v2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "containsObject:", v3);

}

- (id)dateAddedForArticleID:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (-[FCAudioPlaylist containsArticleID:](self, "containsArticleID:", v4))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__50;
    v16 = __Block_byref_object_dispose__50;
    v17 = 0;
    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v6 = itemsLock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__FCAudioPlaylist_dateAddedForArticleID___block_invoke_2;
    v9[3] = &unk_1E463AFC0;
    v9[4] = self;
    v10 = v4;
    v11 = &v12;
    -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v9);

    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __41__FCAudioPlaylist_dateAddedForArticleID___block_invoke_2(uint64_t *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[FCAudioPlaylist _itemWithArticleID:](a1[4], a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasDateAdded"))
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "dateAdded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dateWithPBDate:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)_itemWithArticleID:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0D62650];
    v4 = *(id *)(a1 + 96);
    objc_msgSend(v3, "identifierFromArticleID:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)insertArticleID:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  FCMTWriterLock *itemsLock;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke;
  v9[3] = &unk_1E463D0E0;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v9);

}

void __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  FCModifyAudioPlaylistCommand *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  unint64_t v33;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D62650]);
    objc_msgSend(MEMORY[0x1E0D62650], "identifierFromArticleID:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    objc_msgSend(v5, "setArticleID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pbDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateAdded:", v8);

    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v9 = (_QWORD *)v9[12];
    v10 = v9;
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, v11);

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(void **)(v12 + 96);
  else
    v13 = 0;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = objc_msgSend(v13, "count");
  v16 = *(_QWORD **)(a1 + 32);
  if (v16)
    v16 = (_QWORD *)v16[13];
  if (v14 >= v15 - 1)
    v17 = v15 - 1;
  else
    v17 = v14;
  v18 = (void *)objc_msgSend(v16, "mutableCopy");
  v19 = (void *)MEMORY[0x1E0C99D20];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke_2;
  v28[3] = &unk_1E4646380;
  v29 = v18;
  v20 = *(id *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 32);
  v30 = v20;
  v31 = v21;
  v32 = v5;
  v33 = v17;
  v22 = v5;
  v23 = v18;
  objc_msgSend(v19, "fc_array:", v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
  -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v25, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:](*(id **)(a1 + 32), v26, 0);
  v27 = -[FCModifyAudioPlaylistCommand initWithItems:merge:]([FCModifyAudioPlaylistCommand alloc], "initWithItems:merge:", v26, 0);
  objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", v27);

}

void __43__FCAudioPlaylist_insertArticleID_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAudioPlaylist _itemWithArticleID:](*(_QWORD *)(a1 + 48), (uint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(*(id *)(a1 + 56), "copyWithOrder:", 0);
  objc_msgSend(v10, "addObject:", v6);
  v7 = *(_QWORD *)(a1 + 64) + 1;
  if (v7 != objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 64) + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCAudioPlaylist _itemWithArticleID:](*(_QWORD *)(a1 + 48), (uint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

  }
}

- (void)removeArticleID:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__FCAudioPlaylist_removeArticleID___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v7);

}

void __35__FCAudioPlaylist_removeArticleID___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  FCRemoveFromAudioPlaylistCommand *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAudioPlaylist _modifyWithInsertedOrChangedItems:removedArticleIDs:](v2, 0, v3);

  v4 = -[FCRemoveFromAudioPlaylistCommand initWithArticleID:]([FCRemoveFromAudioPlaylistCommand alloc], "initWithArticleID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", v4);

}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCAudioPlaylist;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)save
{
  id v2;

  -[FCPrivateDataController localStore](self, "localStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "save");

}

uint64_t __47__FCAudioPlaylist__regenerateOrderedArticleIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "order");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "order");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend((id)v6, "compare:", v7);
    if (!v9)
    {
LABEL_9:
      objc_msgSend(v4, "articleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "articleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "compare:", v11);

    }
  }
  else
  {
    if (v6)
      v9 = -1;
    else
      v9 = 1;
    if (!(v6 | v7))
      goto LABEL_9;
  }

  return v9;
}

uint64_t __47__FCAudioPlaylist__regenerateOrderedArticleIDs__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_orderedArticleIDs, 0);
  objc_storeStrong((id *)&self->_itemsByID, 0);
}

@end
