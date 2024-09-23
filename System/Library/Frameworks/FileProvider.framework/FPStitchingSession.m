@implementation FPStitchingSession

- (FPStitchingSession)init
{
  FPStitchingSession *v2;
  uint64_t v3;
  NSMutableDictionary *originalItems;
  uint64_t v5;
  NSMutableDictionary *stitchedItems;
  uint64_t v7;
  NSMutableDictionary *stitchedPlaceholders;
  uint64_t v9;
  NSMutableDictionary *placeholderReplacements;
  uint64_t v11;
  NSMutableDictionary *deletedItems;
  uint64_t v13;
  NSMutableDictionary *stitchedFields;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FPStitchingSession;
  v2 = -[FPStitchingSession init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    originalItems = v2->_originalItems;
    v2->_originalItems = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    stitchedItems = v2->_stitchedItems;
    v2->_stitchedItems = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    stitchedPlaceholders = v2->_stitchedPlaceholders;
    v2->_stitchedPlaceholders = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    placeholderReplacements = v2->_placeholderReplacements;
    v2->_placeholderReplacements = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    deletedItems = v2->_deletedItems;
    v2->_deletedItems = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    stitchedFields = v2->_stitchedFields;
    v2->_stitchedFields = (NSMutableDictionary *)v13;

    +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerStitchingSession:", v2);

  }
  return v2;
}

- (void)dealloc
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
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v0, v1, "[DEBUG] <%@:%p dealloc>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_1();
}

- (NSArray)placeholderItems
{
  void *v3;
  void *v4;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_stitchedPlaceholders, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (NSArray)placeholderReplacementsIDs
{
  void *v3;
  void *v4;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_placeholderReplacements, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (BOOL)cleanStitchedItemForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedItems, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isTrashed"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_stitchedItems, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_stitchedFields, "removeObjectForKey:", v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)stitchedFieldsAndItemsByItemIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_stitchedFields, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedItems, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedFields, "objectForKeyedSubscript:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          v20[0] = CFSTR("FPStitchingSessionItemKey");
          v20[1] = CFSTR("FPStitchingSessionFields");
          v21[0] = v9;
          v21[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

  objc_sync_exit(obj);
  return (NSDictionary *)v3;
}

- (NSDictionary)stitchedItemsByParentID
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = (id)objc_opt_new();
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_stitchedFields, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedItems, "objectForKeyedSubscript:", v7, obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedFields, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (!v11 && objc_msgSend(v9, "containsObject:", CFSTR("parentItemIdentifier")))
        {
          objc_msgSend(v8, "parentItemID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            v15 = v13;
          else
            v15 = (id)objc_opt_new();
          v16 = v15;

          objc_msgSend(v16, "addObject:", v8);
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v12);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
  return (NSDictionary *)v19;
}

- (NSArray)deletedIDs
{
  void *v3;
  void *v4;
  NSMutableDictionary *deletedItems;
  id v6;
  _QWORD v8[4];
  id v9;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableDictionary count](self->_deletedItems, "count"));
  deletedItems = self->_deletedItems;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__FPStitchingSession_deletedIDs__block_invoke;
  v8[3] = &unk_1E444E310;
  v6 = v4;
  v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deletedItems, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v3);
  return (NSArray *)v6;
}

void __32__FPStitchingSession_deletedIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  objc_msgSend(v5, "formerItemID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "formerItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v5, "formerItemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }

}

- (void)start
{
  void *v4;
  id obj;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (self->_started)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPStitchingSession.m"), 293, CFSTR("already started"));

  }
  self->_started = 1;
  objc_sync_exit(obj);

}

- (void)finish
{
  void *v3;
  void *v4;
  id v5;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  if (self->_started && !self->_finished)
  {
    -[NSMutableDictionary removeAllObjects](self->_originalItems, "removeAllObjects");
    -[NSMutableDictionary allKeys](self->_stitchedItems, "allKeys");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](self->_stitchedItems, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_stitchedPlaceholders, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_placeholderReplacements, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_deletedItems, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_stitchedFields, "removeAllObjects");
    *(_WORD *)&self->_started = 256;
  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v3);

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeBouncedItemsWithIDs:", v5);

}

- (BOOL)isActive
{
  void *v3;
  BOOL v4;

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v4 = self->_started && !self->_finished;
  objc_sync_exit(v3);

  return v4;
}

- (void)flush
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[NSMutableDictionary allValues](self->_stitchedItems, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_stitchedPlaceholders, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPStitchingSession deletedIDs](self, "deletedIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_stitchedItems, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_originalItems, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedItems, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (!v11)
        {
          objc_msgSend(v9, "fieldDifferencesWithItem:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stitchedFields, "setObject:forKeyedSubscript:", v12, v8);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1B00850](self->_placeholdersCreationBlock);
  objc_sync_exit(v3);

  if (v13)
    ((void (**)(_QWORD, void *))v13)[2](v13, v17);
  +[FPItemCollection consumeUpdates:deletes:](FPItemCollection, "consumeUpdates:deletes:", v15, v14);

}

- (void)transformItems:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  FPStitchingSession *v19;
  NSMutableDictionary *originalItems;
  void *v21;
  NSMutableDictionary *stitchedItems;
  void *v23;
  NSObject *v24;
  void *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "copyAsPending");
        v7[2](v7, v12);
        objc_msgSend(v12, "providerDomainID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "providerDomainID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v12, "providerDomainID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "providerDomainID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPStitchingSession.m"), 368, CFSTR("stitch for item %@ changed provider identifier (new item is %@) in transform; this cannot work."),
              v11,
              v12);

          }
        }
        v19 = self;
        objc_sync_enter(v19);
        originalItems = self->_originalItems;
        objc_msgSend(v11, "itemID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](originalItems, "setObject:forKeyedSubscript:", v11, v21);

        stitchedItems = self->_stitchedItems;
        objc_msgSend(v12, "itemID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedItems, "setObject:forKeyedSubscript:", v12, v23);

        objc_sync_exit(v19);
        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v12;
          _os_log_debug_impl(&dword_1A0A34000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] FPStitchingSession: stitched item %@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }

}

- (void)deleteItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *originalItems;
  void *v12;
  NSMutableDictionary *deletedItems;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        originalItems = self->_originalItems;
        objc_msgSend(v10, "itemID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](originalItems, "setObject:forKeyedSubscript:", v10, v12);

        deletedItems = self->_deletedItems;
        objc_msgSend(v10, "itemID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](deletedItems, "setObject:forKeyedSubscript:", v10, v14);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)trashItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *originalItems;
  void *v12;
  NSMutableDictionary *deletedItems;
  void *v14;
  NSMutableDictionary *stitchedPlaceholders;
  void *v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v4;
  v5 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v18);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "providerDomainID", obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPItem placeholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:](FPItem, "placeholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:", v8, 1, CFSTR("NSFileProviderTrashContainerItemIdentifier"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        originalItems = self->_originalItems;
        objc_msgSend(v8, "itemID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](originalItems, "setObject:forKeyedSubscript:", v8, v12);

        deletedItems = self->_deletedItems;
        objc_msgSend(v8, "itemID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](deletedItems, "setObject:forKeyedSubscript:", v8, v14);

        stitchedPlaceholders = self->_stitchedPlaceholders;
        objc_msgSend(v10, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", v10, v16);

      }
      v5 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  objc_sync_exit(obj);
}

- (void)finishWithItems:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t section;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint8_t v57[128];
  uint8_t v58[32];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = a4;
  v6 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v11, "itemID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v8);
  }

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (v39)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v39, "fp_prettyDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPStitchingSession finishWithItems:error:].cold.1(v14, v58, section, v13);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[NSMutableDictionary allValues](self->_originalItems, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v19, "itemID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (v22)
          {
            fp_current_or_default_log();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v19;
              _os_log_debug_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] reverting to %@", buf, 0xCu);
            }

            objc_msgSend(v19, "itemID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v24);

          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      }
      while (v16);
    }

    __fp_leave_section_Debug((uint64_t)&section);
  }
  v40 = (void *)objc_opt_new();
  if (!v39 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[NSMutableDictionary allValues](self->_stitchedItems, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          objc_msgSend(v30, "itemID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v25, "containsObject:", v31);

          if ((v32 & 1) == 0)
          {
            objc_msgSend(v30, "itemID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v33);

          }
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v27);
    }

  }
  -[NSMutableDictionary allValues](self->_stitchedPlaceholders, "allValues");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "fp_itemIDs");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPStitchingSession finish](self, "finish");
  objc_sync_exit(obj);

  objc_msgSend(v6, "allValues");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItemCollection replacePlaceholders:withActualItems:deletedIDs:](FPItemCollection, "replacePlaceholders:withActualItems:deletedIDs:", v35, v36, v40);

}

- (void)finishWithItem:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v9 = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", &v9, 1);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[FPStitchingSession finishWithItems:error:](self, "finishWithItems:error:", a3, v6, v9, v10);

}

- (void)associateItem:(id)a3 withPlaceholderID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFormerIdentifier:", v7);

  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v8, "cleanStitchedForItemID:ignoreSession:", v9, self);

  if ((_DWORD)self)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FPStitchingSession associateItem:withPlaceholderID:].cold.1(v6, v10);

  }
}

- (id)itemWithPlaceholderID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_stitchedPlaceholders, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)replacePlaceholderWithID:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *placeholderReplacements;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *stitchedPlaceholders;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    -[FPStitchingSession associateItem:withPlaceholderID:](self, "associateItem:withPlaceholderID:", v8, v6);
    objc_msgSend(v8, "formerItemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      placeholderReplacements = self->_placeholderReplacements;
      objc_msgSend(v8, "itemID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](placeholderReplacements, "setObject:forKeyedSubscript:", v8, v12);

      +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeBouncedItemsWithIDs:", v14);

      stitchedPlaceholders = self->_stitchedPlaceholders;
      objc_msgSend(v8, "formerItemID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", 0, v16);

    }
    objc_sync_exit(v9);

    objc_msgSend(v8, "formerItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPItemCollection replacePlaceholders:withActualItems:deletedIDs:](FPItemCollection, "replacePlaceholders:withActualItems:deletedIDs:", v18, v19, MEMORY[0x1E0C9AA60]);

  }
}

- (id)createPlaceholderWithCopyOfExistingItem:(id)a3 lastUsageUpdatePolicy:(unint64_t)a4 underParent:(id)a5 inProviderDomainID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableDictionary *stitchedPlaceholders;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[FPItem placeholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:](FPItem, "placeholderWithCopyOfExistingItem:lastUsageUpdatePolicy:underParent:inProviderDomainID:", v10, a4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  objc_msgSend(v13, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", v13, v16);

  objc_sync_exit(v14);
  objc_msgSend(v13, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createGenericArchivePlaceholderUnderParent:(id)a3 inProviderDomainID:(id)a4 withArchiveFormat:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *stitchedPlaceholders;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  +[FPItem genericArchivePlaceholderUnderParent:inProviderDomainID:withArchiveFormat:](FPItem, "genericArchivePlaceholderUnderParent:inProviderDomainID:withArchiveFormat:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  objc_msgSend(v10, "itemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", v10, v13);

  objc_sync_exit(v11);
  objc_msgSend(v10, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)createArchivePlaceholderForItem:(id)a3 underParent:(id)a4 inProviderDomainID:(id)a5 withArchiveFormat:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableDictionary *stitchedPlaceholders;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[FPItem archivePlaceholderForItem:underParent:inProviderDomainID:withArchiveFormat:](FPItem, "archivePlaceholderForItem:underParent:inProviderDomainID:withArchiveFormat:", v10, v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  objc_msgSend(v13, "itemID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", v13, v16);

  objc_sync_exit(v14);
  objc_msgSend(v13, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createPlaceholderWithName:(id)a3 isFolder:(BOOL)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  _QWORD *v7;

  v7 = (_QWORD *)MEMORY[0x1E0CEC4F0];
  if (!a4)
    v7 = (_QWORD *)MEMORY[0x1E0CEC528];
  return -[FPStitchingSession createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](self, "createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", a3, *v7, a5, a6, a7);
}

- (id)createPlaceholderWithName:(id)a3 typeIdentifier:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = (void *)MEMORY[0x1E0CEC3F8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  objc_msgSend(v12, "fp_cachedTypeWithIdentifier:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPStitchingSession createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](self, "createPlaceholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v16, v17, v15, v14, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)createPlaceholderWithName:(id)a3 contentType:(id)a4 contentAccessDate:(id)a5 underParent:(id)a6 inProviderDomainID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableDictionary *stitchedPlaceholders;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[FPItem placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:](FPItem, "placeholderWithName:contentType:contentAccessDate:underParent:inProviderDomainID:", v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPStitchingManager sharedInstance](FPStitchingManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v18);
  stitchedPlaceholders = self->_stitchedPlaceholders;
  objc_msgSend(v17, "itemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](stitchedPlaceholders, "setObject:forKeyedSubscript:", v17, v20);

  objc_sync_exit(v18);
  objc_msgSend(v17, "itemID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)placeholdersCreationBlock
{
  return self->_placeholdersCreationBlock;
}

- (void)setPlaceholdersCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_placeholdersCreationBlock, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_placeholderReplacements, 0);
  objc_storeStrong((id *)&self->_stitchedPlaceholders, 0);
  objc_storeStrong((id *)&self->_stitchedItems, 0);
  objc_storeStrong((id *)&self->_originalItems, 0);
  objc_storeStrong((id *)&self->_stitchedFields, 0);
}

- (void)finishWithItems:(uint64_t)a3 error:(os_log_t)log .cold.1(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1A0A34000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reverting items to their original state after failure: %@", buf, 0x16u);

}

- (void)associateItem:(void *)a1 withPlaceholderID:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Deleted item with same ID (%@) has been unstitched to allow creation", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_6_1();
}

@end
