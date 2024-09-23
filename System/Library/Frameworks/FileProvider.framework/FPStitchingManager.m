@implementation FPStitchingManager

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_42);
  return (id)sharedInstance_instance_0;
}

- (id)stitchedItemsForParentID:(id)a3
{
  id v4;
  void *v5;
  FPStitchingManager *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = self;
    objc_sync_enter(v6);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6->_stitchingSessions;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isActive", (_QWORD)v15) & 1) != 0)
          {
            objc_msgSend(v11, "stitchedItemsByParentID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", v4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              objc_msgSend(v5, "addObjectsFromArray:", v13);

          }
        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDictionary)stitchedFieldsAndItemsByItemIDs
{
  void *v3;
  FPStitchingManager *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  FPStitchingManager *v18;
  NSHashTable *obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v4;
  obj = v4->_stitchingSessions;
  v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isActive") & 1) != 0)
        {
          objc_msgSend(v5, "stitchedFieldsAndItemsByItemIDs");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v6, "allKeys");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v8)
          {
            v9 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v8; ++j)
              {
                if (*(_QWORD *)v24 != v9)
                  objc_enumerationMutation(v7);
                v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(v3, "objectForKeyedSubscript:", v11);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = v12;
                if (v12)
                  v14 = v12;
                else
                  v14 = (id)objc_opt_new();
                v15 = v14;

                objc_msgSend(v6, "objectForKeyedSubscript:", v11);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "addObject:", v16);

                objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v11);
              }
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v8);
          }

        }
      }
      v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

  objc_sync_exit(v18);
  return (NSDictionary *)v3;
}

- (NSArray)allPlaceholderReplacementsIDs
{
  void *v3;
  FPStitchingManager *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_stitchingSessions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "placeholderReplacementsIDs", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSArray *)v3;
}

- (NSDictionary)allPlaceholderItemsByParentIdentifierAndName
{
  void *v3;
  FPStitchingManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  NSMapTable *bouncedItems;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSHashTable *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4->_stitchingSessions;
  v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v5, "placeholderItems");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v23 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              bouncedItems = v4->_bouncedItems;
              objc_msgSend(v10, "itemID");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable objectForKey:](bouncedItems, "objectForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
                v14 = v13;
              else
                v14 = v10;
              v15 = v14;
              +[FPStitchingManager parentIdNameKeyForItem:](FPStitchingManager, "parentIdNameKeyForItem:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v15, v16);

            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v7);
        }

      }
      v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

  objc_sync_exit(v4);
  return (NSDictionary *)v3;
}

- (NSMutableArray)allDeletedIDs
{
  void *v3;
  FPStitchingManager *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_stitchingSessions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "deletedIDs", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return (NSMutableArray *)v3;
}

void __36__FPStitchingManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = v0;

}

- (FPStitchingManager)init
{
  FPStitchingManager *v2;
  uint64_t v3;
  NSHashTable *stitchingSessions;
  uint64_t v5;
  NSMapTable *bouncedItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FPStitchingManager;
  v2 = -[FPStitchingManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    stitchingSessions = v2->_stitchingSessions;
    v2->_stitchingSessions = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    bouncedItems = v2->_bouncedItems;
    v2->_bouncedItems = (NSMapTable *)v5;

  }
  return v2;
}

- (void)registerStitchingSession:(id)a3
{
  id v4;
  NSObject *v5;
  FPStitchingManager *v6;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPStitchingManager registerStitchingSession:].cold.1();

  v6 = self;
  objc_sync_enter(v6);
  -[NSHashTable addObject:](v6->_stitchingSessions, "addObject:", v4);
  objc_sync_exit(v6);

}

- (void)addBouncedItem:(id)a3
{
  FPStitchingManager *v4;
  NSMapTable *bouncedItems;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  bouncedItems = v4->_bouncedItems;
  objc_msgSend(v7, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](bouncedItems, "setObject:forKey:", v7, v6);

  objc_sync_exit(v4);
}

- (void)removeBouncedItemsWithIDs:(id)a3
{
  id v4;
  FPStitchingManager *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[NSMapTable removeObjectForKey:](v5->_bouncedItems, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

+ (id)parentIdNameKeyForItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "parentItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)cleanStitchedForItemID:(id)a3 ignoreSession:(id)a4
{
  id v6;
  id v7;
  FPStitchingManager *v8;
  NSHashTable *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8->_stitchingSessions;
  v10 = 0;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if (v14 != v7)
          v10 |= objc_msgSend(v14, "cleanStitchedItemForItemID:", v6, (_QWORD)v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_sync_exit(v8);
  return v10 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bouncedItems, 0);
  objc_storeStrong((id *)&self->_stitchingSessions, 0);
}

- (void)registerStitchingSession:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_opt_class();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v0, v1, "[DEBUG] registering <%@:%p>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

@end
