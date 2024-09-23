@implementation FIPresentationNodeMap

+ (id)shared
{
  void *v2;
  FIPresentationNodeMap *v3;
  void *v4;
  id v5;

  std::mutex::lock(&PresentationNodeMapLock(void)::sMutex);
  v2 = (void *)gPresentationMap;
  if (!gPresentationMap)
  {
    v3 = objc_alloc_init(FIPresentationNodeMap);
    v4 = (void *)gPresentationMap;
    gPresentationMap = (uint64_t)v3;

    v2 = (void *)gPresentationMap;
  }
  v5 = v2;
  std::mutex::unlock(&PresentationNodeMapLock(void)::sMutex);
  return v5;
}

+ (void)finalize
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  std::mutex::lock(&PresentationNodeMapLock(void)::sMutex);
  v2 = (void *)gPresentationMap;
  if (gPresentationMap)
  {
    LogObj(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CBC4A000, v3, OS_LOG_TYPE_DEBUG, "Finalized presentation map", v4, 2u);
    }

    v2 = (void *)gPresentationMap;
  }
  gPresentationMap = 0;

  std::mutex::unlock(&PresentationNodeMapLock(void)::sMutex);
}

- (FIPresentationNodeMap)init
{
  FIPresentationNodeMap *v2;
  uint64_t v3;
  NSMapTable *lookupTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FIPresentationNodeMap;
  v2 = -[FIPresentationNodeMap init](&v6, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 20);
  lookupTable = v2->_lookupTable;
  v2->_lookupTable = (NSMapTable *)v3;

  return v2;
}

- (id)presentationNodeForKeyNode:(id)a3
{
  id v4;
  FIPresentationNodeMap *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](v5->_lookupTable, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

+ (id)presentationNodeForKeyNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationNodeForKeyNode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)registerPresentationNode:(id)a3 forNode:(id)a4 clearOlderKeyNodes:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  FIPresentationNodeMap *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (v5)
    -[FIPresentationNodeMap unregisterAllForPresentationNode:](v9, "unregisterAllForPresentationNode:", v10);
  -[FIPresentationNodeMap registerPresentationNode:forNode:](v9, "registerPresentationNode:forNode:", v10, v8);
  objc_sync_exit(v9);

}

- (void)registerPresentationNode:(id)a3 forNode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FIPresentationNodeMap *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    -[NSMapTable setObject:forKey:](v9->_lookupTable, "setObject:forKey:", v6, v8);
    LogObj(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1CBC4A000, v10, OS_LOG_TYPE_DEBUG, "Adding to lookup table %{public}@ for %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_sync_exit(v9);
  }
  else
  {
    LogObj(5);
    v9 = (FIPresentationNodeMap *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1CBC4A000, &v9->super, OS_LOG_TYPE_ERROR, "Trying to register a nil node", (uint8_t *)&v11, 2u);
    }
  }

}

- (void)unregisterAllForPresentationNode:(id)a3
{
  id v4;
  FIPresentationNodeMap *v5;
  NSMapTable *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v5->_lookupTable;
  v7 = 0;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v5->_lookupTable, "objectForKey:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v4)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v7, "addObject:", v11);
        }

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        -[NSMapTable removeObjectForKey:](v5->_lookupTable, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v14);
  }

  objc_sync_exit(v5);
  if (v13)
  {
    LogObj(5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218242;
      v28 = v18;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_1CBC4A000, v17, OS_LOG_TYPE_DEBUG, "Removed %ld keys for presentation node %@", buf, 0x16u);
    }

  }
}

- (void)unregisterKeyNode:(id)a3
{
  id v4;
  FIPresentationNodeMap *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (IsDebugLogCategoryEnabled(5))
  {
    -[NSMapTable objectForKey:](v5->_lookupTable, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[NSMapTable removeObjectForKey:](v5->_lookupTable, "removeObjectForKey:", v4);
  objc_sync_exit(v5);

  if (v6)
  {
    LogObj(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CBC4A000, v7, OS_LOG_TYPE_DEBUG, "Removed keyNode %@ for presentation node %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupTable, 0);
}

@end
