@implementation GKSavedGameManager

+ (id)sharedManager
{
  if (sharedManager_sOnceToken != -1)
    dispatch_once(&sharedManager_sOnceToken, &__block_literal_global_4);
  return (id)sharedManager_sManager;
}

void __35__GKSavedGameManager_sharedManager__block_invoke()
{
  GKSavedGameManager *v0;
  void *v1;

  v0 = objc_alloc_init(GKSavedGameManager);
  v1 = (void *)sharedManager_sManager;
  sharedManager_sManager = (uint64_t)v0;

}

- (GKSavedGameManager)init
{
  GKSavedGameManager *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKSavedGameManager;
  v2 = -[GKSavedGameManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_documentModified_, CFSTR("GKSavedGameDocumentModifiedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_documentConflictStateChanged_, CFSTR("GKSavedGameDocumentConflictStateChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_ubiquityAvailabilityChanged_, *MEMORY[0x1E0CB3370], 0);

    -[GKSavedGameManager setupUbiquity](v2, "setupUbiquity");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKSavedGameManager;
  -[GKSavedGameManager dealloc](&v4, sel_dealloc);
}

- (void)fetchSavedGamesWithCompletionHandler:(id)a3
{
  void *v4;
  NSMutableArray *fetchHandlers;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *documents;
  uint64_t v10;
  id v11;

  if (a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    fetchHandlers = self->_fetchHandlers;
    v11 = v4;
    if (fetchHandlers)
    {
      v6 = _Block_copy(v4);
      -[NSMutableArray addObject:](fetchHandlers, "addObject:", v6);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      v6 = _Block_copy(v4);
      objc_msgSend(v7, "arrayWithObject:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKSavedGameManager setFetchHandlers:](self, "setFetchHandlers:", v8);

    }
    documents = self->_documents;
    if (documents
      && (v10 = -[NSMutableDictionary count](documents, "count"),
          v10 == -[NSMetadataQuery resultCount](self->_query, "resultCount"))
      || self->_ubiquityUnavailable)
    {
      -[GKSavedGameManager callFetchHandlers](self, "callFetchHandlers");
    }

  }
}

- (id)savedGamesWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *documents;
  id v9;
  _QWORD v11[4];
  id v12;
  GKSavedGameManager *v13;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[GKSavedGameManager savedGameForDocuments:](self, "savedGameForDocuments:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_documents, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    documents = self->_documents;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__GKSavedGameManager_savedGamesWithName___block_invoke;
    v11[3] = &unk_1E75B1738;
    v9 = v7;
    v12 = v9;
    v13 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](documents, "enumerateKeysAndObjectsUsingBlock:", v11);
    v5 = v9;

    v6 = v5;
  }

  return v6;
}

void __41__GKSavedGameManager_savedGamesWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "savedGameForDocuments:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (id)savedGameForDocuments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[GKSavedGameManager savedGameForDocument:](self, "savedGameForDocument:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)savedGameForDocument:(id)a3
{
  id v3;
  GKSavedGame *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(GKSavedGame);
    objc_msgSend(v3, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSavedGame setFileURL:](v4, "setFileURL:", v5);

    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSavedGame setName:](v4, "setName:", v6);

    objc_msgSend(v3, "deviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSavedGame setDeviceName:](v4, "setDeviceName:", v7);

    objc_msgSend(v3, "modificationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKSavedGame setModificationDate:](v4, "setModificationDate:", v8);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)fileURLForName:(id)a3
{
  void *v3;
  void *v4;

  -[NSURL URLByAppendingPathComponent:](self->_ubiquityURL, "URLByAppendingPathComponent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addDocument:(id)a3
{
  NSMutableDictionary *documents;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  id v11;

  documents = self->_documents;
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](documents, "objectForKey:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v5, v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v5, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObject:forKey:", v5, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v10 = self->_documents;
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, v7);
  }

}

- (void)removeDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", v6);
  if (!objc_msgSend(v5, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_documents, "removeObjectForKey:", v7);

}

- (id)documentForSavedGame:(id)a3
{
  NSMutableDictionary *documents;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  documents = self->_documents;
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](documents, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)documentToSaveWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[GKSavedGameDocument currentDeviceName](GKSavedGameDocument, "currentDeviceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v14, "deviceName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v5);

          if (v16)
          {
            v21 = v14;

            v11 = v21;
            goto LABEL_17;
          }
          if (v11)
          {
            objc_msgSend(v14, "modificationDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "modificationDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "compare:", v18);

            if (v19 != 1)
              continue;
          }
          v20 = v14;

          v11 = v20;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }
LABEL_17:

    v4 = v23;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)currentDocumentWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_documents, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isConflictVersion", (_QWORD)v16) & 1) == 0)
          {
            v14 = v13;

            v10 = v14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)loadDataForSavedGame:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKSavedGameManager *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = a3;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m", 206, "-[GKSavedGameManager loadDataForSavedGame:completionHandler:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates");
    -[GKSavedGameManager documentForSavedGame:](self, "documentForSavedGame:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x1E0C809B0];
    if (v11)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke;
      v19[3] = &unk_1E75B1788;
      v20 = v11;
      v21 = v10;
      objc_msgSend(v21, "perform:", v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setError:", v13);

    }
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_3;
    v15[3] = &unk_1E75B17B0;
    v17 = self;
    v18 = v6;
    v16 = v10;
    v14 = v10;
    objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v15);

  }
}

void __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1760;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadDataWithCompletionHandler:", v6);

}

uint64_t __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("data"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __61__GKSavedGameManager_loadDataForSavedGame_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("data"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  }
  return objc_msgSend(*(id *)(a1 + 40), "enableQueryUpdates");
}

- (void)saveGameData:(id)a3 withName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  GKSavedGameDocument *v13;
  id v14;
  void *v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  GKSavedGameDocument *v19;
  void *v20;
  GKSavedGameDocument *v21;
  void *v22;
  id v23;
  GKSavedGameDocument *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKSavedGameManager *v28;
  GKSavedGameDocument *v29;
  id v30;
  char v31;
  _QWORD v32[4];
  GKSavedGameDocument *v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m", 232, "-[GKSavedGameManager saveGameData:withName:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates");
  -[GKSavedGameManager documentToSaveWithName:](self, "documentToSaveWithName:", v9);
  v13 = (GKSavedGameDocument *)objc_claimAutoreleasedReturnValue();
  if (-[GKSavedGameDocument hasConflict](v13, "hasConflict"))
  {
    if (!os_log_GKGeneral)
      v14 = GKOSLoggers();
    v15 = (void *)os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKSavedGameManager saveGameData:withName:completionHandler:].cold.1(v15, v13);
  }
  if (v9)
    v16 = v13 == 0;
  else
    v16 = 0;
  v17 = v16;
  v18 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    if (!self->_ubiquityURL)
    {
      v17 = 0;
      goto LABEL_19;
    }
    v19 = [GKSavedGameDocument alloc];
    -[GKSavedGameManager fileURLForName:](self, "fileURLForName:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GKSavedGameDocument initWithFileURL:](v19, "initWithFileURL:", v20);

    -[GKSavedGameDocument setName:](v13, "setName:", v9);
  }
  if (!v13)
  {
LABEL_19:
    -[GKSavedGameManager errorForNoUbiquity](self, "errorForNoUbiquity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setError:", v22);
    v21 = 0;
    goto LABEL_20;
  }
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke;
  v32[3] = &unk_1E75B1800;
  v21 = v13;
  v33 = v21;
  v34 = v8;
  v35 = v12;
  objc_msgSend(v35, "perform:", v32);

  v22 = v33;
LABEL_20:

  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_3;
  v26[3] = &unk_1E75B1828;
  v31 = v17;
  v27 = v12;
  v28 = self;
  v29 = v21;
  v30 = v10;
  v23 = v10;
  v24 = v21;
  v25 = v12;
  objc_msgSend(v25, "notifyOnMainQueueWithBlock:", v26);

}

void __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_2;
  v7[3] = &unk_1E75B17D8;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "saveData:completionHandler:", v5, v7);

}

uint64_t __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __62__GKSavedGameManager_saveGameData_withName_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      objc_msgSend(*(id *)(a1 + 40), "addDocument:", *(_QWORD *)(a1 + 48));
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "savedGameForDocument:", *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v6);

  }
  return objc_msgSend(*(id *)(a1 + 40), "enableQueryUpdates");
}

- (void)deleteSavedGamesWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKSavedGameManager *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m", 274, "-[GKSavedGameManager deleteSavedGamesWithName:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates");
  -[GKSavedGameManager currentDocumentWithName:](self, "currentDocumentWithName:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke;
    v21[3] = &unk_1E75B1788;
    v22 = v10;
    v23 = v9;
    objc_msgSend(v23, "perform:", v21);

  }
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_3;
  v16[3] = &unk_1E75B1850;
  v17 = v9;
  v18 = self;
  v19 = v6;
  v20 = v7;
  v13 = v7;
  v14 = v6;
  v15 = v9;
  objc_msgSend(v15, "notifyOnMainQueueWithBlock:", v16);

}

void __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_2;
  v6[3] = &unk_1E75B17D8;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteAllVersionsIncludingCurrent:withCompletionHandler:", 1, v6);

}

uint64_t __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__GKSavedGameManager_deleteSavedGamesWithName_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  return objc_msgSend(*(id *)(a1 + 40), "enableQueryUpdates");
}

- (void)documentModified:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document modified notification received on thread other than main thread"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ ([[NSThread currentThread] isMainThread])\n[%s (%s:%d)]"), v7, "-[GKSavedGameManager documentModified:]", objc_msgSend(v9, "UTF8String"), 300);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }
  objc_msgSend(v15, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSavedGameManager savedGameForDocument:](self, "savedGameForDocument:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "eventEmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "player:didModifySavedGame:", v13, v12);

}

- (id)errorForNoUbiquity
{
  void *v3;
  int v4;
  uint64_t v5;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated");

  if (v4)
  {
    if (self->_ubiquityUnavailable)
      v5 = 27;
    else
      v5 = 1;
  }
  else
  {
    v5 = 6;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", v5, 0);
}

- (void)startSavedGameQuery
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__GKSavedGameManager_startSavedGameQuery__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3768]);
    objc_msgSend(*(id *)(a1 + 32), "setQuery:", v2);

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v4 = *MEMORY[0x1E0CB2E60];
    v26[0] = *MEMORY[0x1E0CB2E58];
    v26[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchScopes:", v5);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K ENDSWITH %@"), *MEMORY[0x1E0CB2E08], CFSTR("bundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPredicate:", v6);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB2DF8], 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSortDescriptors:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_queryDidFinishGathering_, *MEMORY[0x1E0CB2E38], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_queryDidUpdate_, *MEMORY[0x1E0CB2E40], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startQuery") & 1) == 0)
    {
      v12 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v13 = GKOSLoggers();
        v12 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_2(v12, v14, v15);
      objc_msgSend(*(id *)(a1 + 32), "setQuery:", 0);
      objc_msgSend(*(id *)(a1 + 32), "callFetchHandlers");
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v16 = GKOSLoggers();
    v17 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
}

- (void)disableQueryUpdates
{
  int64_t queryDisableCount;

  queryDisableCount = self->_queryDisableCount;
  if (!queryDisableCount)
  {
    -[NSMetadataQuery disableUpdates](self->_query, "disableUpdates");
    queryDisableCount = self->_queryDisableCount;
  }
  self->_queryDisableCount = queryDisableCount + 1;
}

- (void)enableQueryUpdates
{
  int64_t v2;

  v2 = self->_queryDisableCount - 1;
  self->_queryDisableCount = v2;
  if (!v2)
    -[NSMetadataQuery enableUpdates](self->_query, "enableUpdates");
}

- (void)queryDidFinishGathering:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CB2E38], self->_query);

  -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__GKSavedGameManager_queryDidFinishGathering___block_invoke;
  v5[3] = &unk_1E75B1878;
  v5[4] = self;
  -[GKSavedGameManager updateSavedGameDocumentsForQueryWithHandler:](self, "updateSavedGameDocumentsForQueryWithHandler:", v5);
}

uint64_t __46__GKSavedGameManager_queryDidFinishGathering___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "callFetchHandlers");
  return objc_msgSend(*(id *)(a1 + 32), "enableQueryUpdates");
}

- (void)queryDidUpdate:(id)a3
{
  _QWORD v4[5];

  -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates", a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__GKSavedGameManager_queryDidUpdate___block_invoke;
  v4[3] = &unk_1E75B1878;
  v4[4] = self;
  -[GKSavedGameManager updateSavedGameDocumentsForQueryWithHandler:](self, "updateSavedGameDocumentsForQueryWithHandler:", v4);
}

uint64_t __37__GKSavedGameManager_queryDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "documents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 32), "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "resultCount");

  if (v3 == v5)
    objc_msgSend(*(id *)(a1 + 32), "callFetchHandlers");
  return objc_msgSend(*(id *)(a1 + 32), "enableQueryUpdates");
}

- (void)updateSavedGameDocumentsForQueryWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMetadataQuery *query;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKSavedGameManager *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m", 390, "-[GKSavedGameManager updateSavedGameDocumentsForQueryWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  query = self->_query;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke;
  v22[3] = &unk_1E75B1918;
  v22[4] = self;
  v11 = v7;
  v23 = v11;
  v24 = v6;
  v12 = v8;
  v25 = v12;
  v13 = v6;
  -[NSMetadataQuery enumerateResultsUsingBlock:](query, "enumerateResultsUsingBlock:", v22);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_53;
  v17[3] = &unk_1E75B1940;
  v18 = v11;
  v19 = self;
  v20 = v12;
  v21 = v4;
  v14 = v12;
  v15 = v4;
  v16 = v11;
  objc_msgSend(v13, "notifyOnMainQueueWithBlock:", v17);

}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  GKSavedGameDocument *v27;
  void *v28;
  uint64_t v29;
  GKSavedGameDocument *v30;
  id v31;
  void *v32;
  GKSavedGameDocument *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  GKSavedGameDocument *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  GKSavedGameDocument *v44;
  id v45;
  id v46;
  id v47;

  v3 = *MEMORY[0x1E0CB2E28];
  v4 = a2;
  objc_msgSend(v4, "valueForAttribute:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForAttribute:", *MEMORY[0x1E0CB2E08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForAttribute:", *MEMORY[0x1E0CB2EA8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB2EB0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v10 = objc_msgSend(v9, "startDownloadingUbiquitousItemAtURL:error:", v5, &v47);
    v11 = v47;

    if ((v10 & 1) == 0)
    {
      if (!os_log_GKGeneral)
        v12 = GKOSLoggers();
      v13 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_1((uint64_t)v5, (uint64_t)v11, v13);
    }

  }
  else
  {
    if (v5)
      v14 = v7 == 0;
    else
      v14 = 1;
    if (v14)
    {
      if (!os_log_GKGeneral)
        v15 = GKOSLoggers();
      v16 = os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
        __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v25, v7);
      objc_msgSend(v24, "objectForKey:", v5);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (GKSavedGameDocument *)v26;
      if (!v26)
      {
        v27 = -[GKSavedGameDocument initWithFileURL:]([GKSavedGameDocument alloc], "initWithFileURL:", v5);
        -[GKSavedGameDocument setName:](v27, "setName:", v7);
      }
      v28 = *(void **)(a1 + 48);
      v29 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_50;
      v43[3] = &unk_1E75B1800;
      v30 = v27;
      v44 = v30;
      v31 = v25;
      v45 = v31;
      v46 = v5;
      objc_msgSend(v28, "perform:", v43);
      v36[0] = v29;
      v36[1] = 3221225472;
      v36[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_3;
      v36[3] = &unk_1E75B18F0;
      v37 = v30;
      v32 = *(void **)(a1 + 48);
      v38 = *(id *)(a1 + 56);
      v39 = v7;
      v40 = v24;
      v41 = *(id *)(a1 + 48);
      v42 = v31;
      v33 = v30;
      v34 = v24;
      v35 = v31;
      objc_msgSend(v32, "perform:", v36);

    }
  }

}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_50(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_2;
  v6[3] = &unk_1E75B18A0;
  v4 = a1[4];
  v7 = a1[5];
  v8 = a1[4];
  v9 = a1[6];
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadMetadataWithCompletionHandler:", v6);

}

uint64_t __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_3(id *a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v3 = a2;
  v4 = objc_msgSend(a1[4], "hasConflict");
  v5 = a1[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_4;
  v7[3] = &unk_1E75B18C8;
  v8 = v5;
  v15 = v4;
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v13 = a1[9];
  v14 = v3;
  v6 = v3;
  objc_msgSend(v8, "updateConflictStateWithCompletionHandler:", v7);

}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  GKSavedGameDocument *v11;
  void *v12;
  id v13;
  GKSavedGameDocument *v14;
  id obj;
  _QWORD v16[4];
  GKSavedGameDocument *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasConflict"))
  {
    if (!*(_BYTE *)(a1 + 88))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      v7 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "URL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v10);
          v11 = (GKSavedGameDocument *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            v11 = -[GKSavedGameDocument initWithFileURL:]([GKSavedGameDocument alloc], "initWithFileURL:", v10);
            -[GKSavedGameDocument setName:](v11, "setName:", *(_QWORD *)(a1 + 48));
            -[GKSavedGameDocument setIsConflictVersion:](v11, "setIsConflictVersion:", 1);
            -[GKSavedGameDocument setHasConflict:](v11, "setHasConflict:", 1);
            -[GKSavedGameDocument setFileVersion:](v11, "setFileVersion:", v9);
          }
          v16[0] = v7;
          v16[1] = 3221225472;
          v16[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_5;
          v16[3] = &unk_1E75B1800;
          v17 = v11;
          v12 = *(void **)(a1 + 64);
          v18 = *(id *)(a1 + 72);
          v19 = v10;
          v13 = v10;
          v14 = v11;
          objc_msgSend(v12, "perform:", v16);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v5);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_5(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_6;
  v6[3] = &unk_1E75B18A0;
  v4 = a1[4];
  v7 = a1[5];
  v8 = a1[4];
  v9 = a1[6];
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadMetadataWithCompletionHandler:", v6);

}

uint64_t __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_53(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  uint8_t v25;
  _BYTE v26[15];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "count"))
          objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v5);
  }

  v24 = v2;
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsForKeys:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToArray:", v11);

  objc_msgSend(*(id *)(a1 + 40), "setDocuments:", *(_QWORD *)(a1 + 32));
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, v12 ^ 1u);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(a1 + 40), "savedGamesWithName:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v19, "count") >= 2)
        {
          +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "eventEmitter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "player:hasConflictingSavedGames:", v20, v19);

          v22 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            v23 = GKOSLoggers();
            v22 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_53_cold_1(&v25, v26, v22);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

}

- (void)callFetchHandlers
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (**v10)(void *, void *, void *);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_ubiquityUnavailable)
  {
    -[GKSavedGameManager errorForNoUbiquity](self, "errorForNoUbiquity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }
  else
  {
    -[GKSavedGameManager savedGamesWithName:](self, "savedGamesWithName:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_fetchHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void (**)(void *, void *, void *))_Block_copy(*(const void **)(*((_QWORD *)&v11 + 1) + 8 * i));
        v10[2](v10, v4, v3);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[GKSavedGameManager setFetchHandlers:](self, "setFetchHandlers:", 0, (_QWORD)v11);
}

- (void)documentConflictStateChanged:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document conflict notification received on thread other than main thread"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ ([[NSThread currentThread] isMainThread])\n[%s (%s:%d)]"), v7, "-[GKSavedGameManager documentConflictStateChanged:]", objc_msgSend(v9, "UTF8String"), 520);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }
  -[GKSavedGameManager updateSavedGameDocumentsForQueryWithHandler:](self, "updateSavedGameDocumentsForQueryWithHandler:", 0);
}

- (void)resolveConflictingSavedGames:(id)a3 withData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  GKSavedGameManager *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKSavedGameManager.m", 533, "-[GKSavedGameManager resolveConflictingSavedGames:withData:completionHandler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKSavedGameManager disableQueryUpdates](self, "disableQueryUpdates");
    -[GKSavedGameManager currentDocumentWithName:](self, "currentDocumentWithName:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke;
      v27[3] = &unk_1E75B1800;
      v28 = v15;
      v29 = v8;
      v30 = v14;
      objc_msgSend(v30, "perform:", v27);

    }
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_7;
    v20[3] = &unk_1E75B19E0;
    v21 = v8;
    v22 = self;
    v23 = v12;
    v24 = v9;
    v25 = v14;
    v26 = v10;
    v18 = v14;
    objc_msgSend(v18, "notifyOnMainQueueWithBlock:", v20);

  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v19);

  }
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_2;
  v6[3] = &unk_1E75B1990;
  v4 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[4];
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "updateConflictStateWithCompletionHandler:", v6);

}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v10, "fileURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "fileURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v7);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  v15 = v32;
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v19, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v4, "containsObject:", v20);

        if (v21)
          objc_msgSend(v32, "addObject:", v19);
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v16);
  }

  v22 = objc_msgSend(v32, "count");
  if (v22 == objc_msgSend(v13, "count"))
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_3;
    v41[3] = &unk_1E75B1788;
    v23 = *(void **)(a1 + 40);
    v42 = *(id *)(a1 + 48);
    v43 = *(id *)(a1 + 40);
    objc_msgSend(v23, "perform:", v41);

    v24 = v42;
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v32;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v38;
      do
      {
        v28 = v24;
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v28);
          v30 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_5;
          v33[3] = &unk_1E75B1800;
          v31 = *(void **)(a1 + 40);
          v34 = *(id *)(a1 + 48);
          v35 = v30;
          v36 = *(id *)(a1 + 40);
          objc_msgSend(v31, "perform:", v33);

        }
        v24 = v28;
        v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      }
      while (v26);
      v15 = v32;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_4;
  v6[3] = &unk_1E75B17D8;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteAllVersionsIncludingCurrent:withCompletionHandler:", 1, v6);

}

uint64_t __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_6;
  v6[3] = &unk_1E75B1968;
  v7 = *(id *)(a1 + 48);
  v5 = a2;
  objc_msgSend(v3, "deleteConflictVersion:completionHandler:", v4, v6);
  v5[2](v5);

}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "setError:", v4);

}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  GKSavedGameDocument *v9;
  GKSavedGameDocument *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GKSavedGameDocument *v14;
  _QWORD v15[5];
  GKSavedGameDocument *v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "documentForSavedGame:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 40), "removeDocument:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "documentToSaveWithName:", *(_QWORD *)(a1 + 48));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (GKSavedGameDocument *)v8;
  if (!v8)
  {
    v10 = [GKSavedGameDocument alloc];
    objc_msgSend(*(id *)(a1 + 40), "fileURLForName:", *(_QWORD *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GKSavedGameDocument initWithFileURL:](v10, "initWithFileURL:", v11);

    -[GKSavedGameDocument setName:](v9, "setName:", *(_QWORD *)(a1 + 48));
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_8;
  v15[3] = &unk_1E75B19B8;
  v20 = v8 == 0;
  v12 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v9;
  v17 = v12;
  v19 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 64);
  v14 = v9;
  -[GKSavedGameDocument saveData:completionHandler:](v14, "saveData:completionHandler:", v13, v15);

}

void __78__GKSavedGameManager_resolveConflictingSavedGames_withData_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!v6 && *(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "addDocument:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "savedGamesWithName:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setHasConflict:", (unint64_t)objc_msgSend(v3, "count") > 1);
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
  {
    if (v6)
    {
      (*(void (**)(_QWORD, void *))(v4 + 16))(*(_QWORD *)(a1 + 64), v3);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "enableQueryUpdates");

}

- (void)setupUbiquity
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GKSavedGameManager_setupUbiquity__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __35__GKSavedGameManager_setupUbiquity__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForUbiquityContainerIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUbiquityURL:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 16))
  {
    result = objc_msgSend((id)v4, "startSavedGameQuery");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 24), "stopQuery");
    objc_msgSend(*(id *)(a1 + 32), "setQuery:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "callFetchHandlers");
  }
  return result;
}

- (NSURL)ubiquityURL
{
  return self->_ubiquityURL;
}

- (void)setUbiquityURL:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityURL, a3);
}

- (BOOL)ubiquityUnavailable
{
  return self->_ubiquityUnavailable;
}

- (void)setUbiquityUnavailable:(BOOL)a3
{
  self->_ubiquityUnavailable = a3;
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSMutableDictionary)documents
{
  return self->_documents;
}

- (void)setDocuments:(id)a3
{
  objc_storeStrong((id *)&self->_documents, a3);
}

- (int64_t)queryDisableCount
{
  return self->_queryDisableCount;
}

- (void)setQueryDisableCount:(int64_t)a3
{
  self->_queryDisableCount = a3;
}

- (NSMutableArray)fetchHandlers
{
  return self->_fetchHandlers;
}

- (void)setFetchHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_fetchHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchHandlers, 0);
  objc_storeStrong((id *)&self->_documents, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_ubiquityURL, 0);
}

- (void)saveGameData:(void *)a1 withName:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_ERROR, "Unresolved saved game conflict for file: \"%{public}@\". Provide a GKSavedGameListener protocol conformance to resolve conflicts. https://developer.apple.com/documentation/gamekit/gksavedgamelistener", (uint8_t *)&v5, 0xCu);

}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, a1, a3, "Error - Unable to access the iCloud ubiquity container", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __41__GKSavedGameManager_startSavedGameQuery__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_2_3(&dword_1BCDE3000, a1, a3, "GKSavedGameManager in startSavedGameQuery Error - Failed to start NSMetaDataQuery", v3);
  OUTLINED_FUNCTION_1();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "GKSavedGameManager->updateSavedGameDocumentsForQueryWithHandler: Error - error downloading item at url: %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCDE3000, a1, a3, "GKSavedGameManager->updateSavedGameDocumentsForQueryWithHandler: Error - saved game document NSMetadataItem missing URL or filename", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __66__GKSavedGameManager_updateSavedGameDocumentsForQueryWithHandler___block_invoke_53_cold_1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_3(&dword_1BCDE3000, a3, (uint64_t)a3, "Saved Games API: hasConflictingSavedGames:savedGames event emitter fired.", a1);
}

@end
