@implementation IMPhotoLibraryPersistenceManager

+ (id)sharedInstance
{
  if (qword_1ECF12528 != -1)
    dispatch_once(&qword_1ECF12528, &unk_1E471D718);
  return (id)qword_1ECF12550;
}

- (IMPhotoLibraryPersistenceManager)init
{
  IMPhotoLibraryPersistenceManager *v2;
  uint64_t v3;
  CPLRUDictionary *syndicationIdentifierSaveStateCache;
  uint64_t v5;
  CPLRUDictionary *syndicationIdentifierFetchResultCache;
  NSMutableDictionary *v7;
  NSMutableDictionary *syndicationIdentifierToAssetUUIDCache;
  NSMutableSet *v9;
  NSMutableSet *syndicationIdentifiersWithActiveFetch;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMPhotoLibraryPersistenceManager;
  v2 = -[IMPhotoLibraryPersistenceManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA998]), "initWithMaximumCapacity:", 512);
    syndicationIdentifierSaveStateCache = v2->_syndicationIdentifierSaveStateCache;
    v2->_syndicationIdentifierSaveStateCache = (CPLRUDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA998]), "initWithMaximumCapacity:", 512);
    syndicationIdentifierFetchResultCache = v2->_syndicationIdentifierFetchResultCache;
    v2->_syndicationIdentifierFetchResultCache = (CPLRUDictionary *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    syndicationIdentifierToAssetUUIDCache = v2->_syndicationIdentifierToAssetUUIDCache;
    v2->_syndicationIdentifierToAssetUUIDCache = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    syndicationIdentifiersWithActiveFetch = v2->_syndicationIdentifiersWithActiveFetch;
    v2->_syndicationIdentifiersWithActiveFetch = v9;

    v2->_libraryAlreadyOpened = 0;
  }
  return v2;
}

+ (id)_assetFetchQueue
{
  if (qword_1EE65EAE0 != -1)
    dispatch_once(&qword_1EE65EAE0, &unk_1E47208A0);
  return (id)qword_1EE65EB08;
}

+ (id)_photoLibraryInternalQueue
{
  if (qword_1EE65EAA8 != -1)
    dispatch_once(&qword_1EE65EAA8, &unk_1E47208C0);
  return (id)qword_1EE65EAB0;
}

+ (id)photosSyndicationIdentifiersForMessage:(id)a3 transcriptChatItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5
    || (objc_msgSend(v5, "fileTransferGUIDs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileTransferGUIDs");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v6, "transferGUID");
    v16 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v16;
    if (!v16)
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    v23[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

LABEL_8:
  v12 = (void *)objc_opt_new();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = sub_1A20A5B34;
  v20 = &unk_1E471FE38;
  v21 = v5;
  v22 = v12;
  v13 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v17);
  v14 = (void *)objc_msgSend(v13, "copy", v17, v18, v19, v20);

LABEL_10:
  return v14;
}

- (BOOL)_invalidateCacheDueToChanges:(id)a3
{
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id obj;
  id v25;
  IMPhotoLibraryPersistenceManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Invalidating cache", buf, 2u);
    }

  }
  v26 = self;
  objc_sync_enter(v26);
  if (objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion")
    && (objc_msgSend(v25, "deletedObjectIDs"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count") == 0,
        v5,
        v6))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "Not flushing save state cache as there were no deletions", buf, 2u);
      }

    }
    v8 = 0;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[CPLRUDictionary allKeys](v26->_syndicationIdentifierFetchResultCache, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      obj = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[CPLRUDictionary objectForKey:](v26->_syndicationIdentifierFetchResultCache, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "changeDetailsForFetchResult:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "fetchResultAfterChanges");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v15, "fetchResultAfterChanges");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "count");

              objc_msgSend(v15, "fetchResultBeforeChanges");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

              -[CPLRUDictionary setObject:forKey:](v26->_syndicationIdentifierFetchResultCache, "setObject:forKey:", v16, v12);
              v8 = (v18 != 0) ^ (v20 != 0);
            }
            else
            {
              -[CPLRUDictionary removeObjectForKey:](v26->_syndicationIdentifierFetchResultCache, "removeObjectForKey:", v12);
              v8 = 1;
            }

          }
        }
        v7 = obj;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v9);
    }

    -[NSMutableDictionary removeAllObjects](v26->_syndicationIdentifierToAssetUUIDCache, "removeAllObjects");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v32 = v8 & 1;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Photo library changed, will invalidate %d", buf, 8u);
      }

    }
  }
  objc_sync_exit(v26);

  return v8 & 1;
}

- (id)_cachedSaveStateForIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D397F8];
  v5 = a3;
  if (objc_msgSend(v4, "IMDeviceIsChinaRegion"))
  {
    -[CPLRUDictionary objectForKey:](self->_syndicationIdentifierSaveStateCache, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CPLRUDictionary objectForKey:](self->_syndicationIdentifierFetchResultCache, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "count") != 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v5 = v7;
  }

  return v6;
}

- (unint64_t)cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 shouldFetchAndNotifyAsNeeded:(BOOL)a4 didStartFetch:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  IMPhotoLibraryPersistenceManager *v16;
  void *v17;
  IMPhotoLibraryPersistenceManager *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  BOOL *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  _QWORD v27[4];
  id v28;
  IMPhotoLibraryPersistenceManager *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5)
    *a5 = 0;
  if (objc_msgSend(v8, "count"))
  {
    v25 = v6;
    v23 = a5;
    v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v9;
    v10 = v9;
    v11 = 0;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = self;
          objc_sync_enter(v16);
          -[IMPhotoLibraryPersistenceManager _cachedSaveStateForIdentifier:](v16, "_cachedSaveStateForIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_exit(v16);

          if (v17)
          {
            if ((objc_msgSend(v17, "BOOLValue") & 1) != 0)
              ++v11;
          }
          else if ((objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion") & 1) == 0)
          {
            v18 = v16;
            objc_sync_enter(v18);
            v19 = -[NSMutableSet containsObject:](self->_syndicationIdentifiersWithActiveFetch, "containsObject:", v15);
            objc_sync_exit(v18);

            if ((v19 & 1) == 0)
            {
              objc_msgSend(v26, "addObject:", v15);
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "-[IMPhotoLibraryPersistenceManager cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:"
                        "shouldFetchAndNotifyAsNeeded:didStartFetch:]";
                  v36 = 2112;
                  v37 = v15;
                  _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "%s Identifier needs save state fetch %@", buf, 0x16u);
                }

              }
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v12);
    }

    if (v25 && objc_msgSend(v26, "count"))
    {
      if (v23)
        *v23 = 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (const char *)v26;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Fetching identifiers that weren't cached %@", buf, 0xCu);
        }

      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1A20A64F8;
      v27[3] = &unk_1E47208E8;
      v28 = v26;
      v29 = self;
      -[IMPhotoLibraryPersistenceManager fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:completion:](self, "fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:completion:", v28, v27);

    }
    v9 = v24;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)cacheCompletedSaveForSyndicationIdentifiers:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IMPhotoLibraryPersistenceManager *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      v8 = MEMORY[0x1E0C9AAB0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
          v11 = self;
          objc_sync_enter(v11);
          -[CPLRUDictionary setObject:forKey:](self->_syndicationIdentifierSaveStateCache, "setObject:forKey:", v8, v10, (_QWORD)v12);
          objc_sync_exit(v11);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  IMPhotoLibraryPersistenceManager *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  IMPhotoLibraryPersistenceManager *v17;
  char v18;
  NSObject *v19;
  IMPhotoLibraryPersistenceManager *v20;
  NSMutableSet *syndicationIdentifiersWithActiveFetch;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD, _QWORD);
  uint64_t *v32;
  _BYTE *v33;
  uint64_t *v34;
  _QWORD block[5];
  id v36;
  NSObject *v37;
  _BYTE *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE buf[24];
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_1A200AE14;
    v48 = sub_1A200AC7C;
    v49 = 0;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
    if (v9)
    {
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          v13 = self;
          objc_sync_enter(v13);
          -[IMPhotoLibraryPersistenceManager _cachedSaveStateForIdentifier:](v13, "_cachedSaveStateForIdentifier:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v45[5])
          {
            -[NSMutableDictionary objectForKey:](self->_syndicationIdentifierToAssetUUIDCache, "objectForKey:", v12);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v45[5];
            v45[5] = v15;

          }
          objc_sync_exit(v13);

          if (v14)
          {
            if (objc_msgSend(v14, "BOOLValue"))
              ++v51[3];
          }
          else if ((objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceIsChinaRegion") & 1) == 0)
          {
            v17 = v13;
            objc_sync_enter(v17);
            v18 = -[NSMutableSet containsObject:](self->_syndicationIdentifiersWithActiveFetch, "containsObject:", v12);
            objc_sync_exit(v17);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(v29, "addObject:", v12);
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "-[IMPhotoLibraryPersistenceManager fetchInfoForSyndicationIdentifiersSavedToSyste"
                                       "mPhotoLibrary:completion:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v12;
                  _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "%s Identifier needs save state fetch %@", buf, 0x16u);
                }

              }
            }
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v29, "count") && (sub_1A20A6C80(), (objc_opt_respondsToSelector() & 1) != 0))
    {
      v20 = self;
      objc_sync_enter(v20);
      syndicationIdentifiersWithActiveFetch = v20->_syndicationIdentifiersWithActiveFetch;
      objc_msgSend(v29, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](syndicationIdentifiersWithActiveFetch, "addObjectsFromArray:", v22);

      objc_sync_exit(v20);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v55 = 0;
      v23 = dispatch_group_create();
      dispatch_group_enter(v23);
      objc_msgSend((id)objc_opt_class(), "_assetFetchQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A20A6D38;
      block[3] = &unk_1E4720910;
      block[4] = v20;
      v38 = buf;
      v39 = &v44;
      v36 = v29;
      v37 = v23;
      v26 = v23;
      dispatch_async(v24, block);

      v30[0] = v25;
      v30[1] = 3221225472;
      v30[2] = sub_1A20A70A4;
      v30[3] = &unk_1E4720938;
      v32 = &v50;
      v33 = buf;
      v31 = v27;
      v34 = &v44;
      dispatch_group_notify(v26, MEMORY[0x1E0C80D38], v30);

      _Block_object_dispose(buf, 8);
    }
    else if (v27)
    {
      v27[2](v27, v51[3], v45[5]);
    }

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);
    v7 = v27;
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (BOOL)_isListenerRegistered:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMPhotoLibraryPersistenceManager listeners](self, "listeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)registerPhotoLibraryPersistenceManagerListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1A2196D74(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_10;
  }
  if (!-[IMPhotoLibraryPersistenceManager _isListenerRegistered:](self, "_isListenerRegistered:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Registering as photo library persistence change listener %@", (uint8_t *)&v14, 0xCu);
      }

    }
    -[IMPhotoLibraryPersistenceManager listeners](self, "listeners");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v4);
LABEL_10:

  }
}

- (void)unregisterPhotoLibraryPersistenceManagerListener:(id)a3
{
  id v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[IMPhotoLibraryPersistenceManager _isListenerRegistered:](self, "_isListenerRegistered:", v4);
    v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Unregistering as photo library persistence change listener %@", (uint8_t *)&v18, 0xCu);
        }

      }
      if (self->_listeners)
      {
        -[IMPhotoLibraryPersistenceManager listeners](self, "listeners");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v4);

      }
    }
    else if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v4;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Not unregistering listener because it's already not listening %@", (uint8_t *)&v18, 0xCu);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1A2196DA8(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (NSHashTable)listeners
{
  NSHashTable *listeners;
  NSHashTable *v4;
  NSHashTable *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[5];
  _QWORD block[5];

  listeners = self->_listeners;
  if (!listeners)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_listeners;
    self->_listeners = v4;

    objc_msgSend((id)objc_opt_class(), "_photoLibraryInternalQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A20A7534;
    block[3] = &unk_1E471E348;
    block[4] = self;
    dispatch_async(v6, block);

    listeners = self->_listeners;
  }
  if (!self->_libraryAlreadyOpened && listeners)
  {
    objc_msgSend((id)objc_opt_class(), "_photoLibraryInternalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A20A75E8;
    v9[3] = &unk_1E471E348;
    v9[4] = self;
    dispatch_async(v7, v9);

    listeners = self->_listeners;
  }
  return listeners;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A20A766C;
  v6[3] = &unk_1E471E7C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)_notifyListeners
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMPhotoLibraryPersistenceManager listeners](self, "listeners");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v15 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Broadcasting changes to %lu listeners", buf, 0xCu);

    }
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSHashTable allObjects](self->_listeners, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "photoLibraryPersistedSyndicatedAssetSetDidChange");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_openPhotoLibraryIfNecessary
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  if (!self->_libraryAlreadyOpened)
  {
    objc_msgSend(sub_1A20A6FEC(), "sharedPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v4 = objc_msgSend(v3, "openAndWaitWithUpgrade:error:", 0, &v7);
    v5 = v7;

    if ((v4 & 1) != 0)
    {
      self->_libraryAlreadyOpened = 1;
    }
    else
    {
      IMLogHandleForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_1A2196DDC((uint64_t)v5, v6);

    }
  }
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (CPLRUDictionary)syndicationIdentifierSaveStateCache
{
  return self->_syndicationIdentifierSaveStateCache;
}

- (void)setSyndicationIdentifierSaveStateCache:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationIdentifierSaveStateCache, a3);
}

- (CPLRUDictionary)syndicationIdentifierFetchResultCache
{
  return self->_syndicationIdentifierFetchResultCache;
}

- (void)setSyndicationIdentifierFetchResultCache:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationIdentifierFetchResultCache, a3);
}

- (NSMutableDictionary)syndicationIdentifierToAssetUUIDCache
{
  return self->_syndicationIdentifierToAssetUUIDCache;
}

- (void)setSyndicationIdentifierToAssetUUIDCache:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationIdentifierToAssetUUIDCache, a3);
}

- (NSMutableSet)syndicationIdentifiersWithActiveFetch
{
  return self->_syndicationIdentifiersWithActiveFetch;
}

- (void)setSyndicationIdentifiersWithActiveFetch:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationIdentifiersWithActiveFetch, a3);
}

- (BOOL)libraryAlreadyOpened
{
  return self->_libraryAlreadyOpened;
}

- (void)setLibraryAlreadyOpened:(BOOL)a3
{
  self->_libraryAlreadyOpened = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syndicationIdentifiersWithActiveFetch, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierToAssetUUIDCache, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierFetchResultCache, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifierSaveStateCache, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
