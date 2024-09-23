@implementation _CDInMemoryUserContext

- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:returningMetadataForContextualKeyPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)propertiesForContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertiesForContextualKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextForKeyPath:(id)a3
{
  id v4;
  _CDInMemoryContext *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isUserCentric"))
  {
    v5 = self->_userContext;
  }
  else
  {
    objc_msgSend(v4, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInMemoryUserContext contextForDeviceWithDeviceID:](self, "contextForDeviceWithDeviceID:", v6);
    v5 = (_CDInMemoryContext *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)contextForDeviceWithDeviceID:(id)a3
{
  id v4;
  NSObject *syncQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___CDInMemoryUserContext_contextForDeviceWithDeviceID___block_invoke;
  block[3] = &unk_1E26D4E28;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(syncQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)unsafe_contextForDeviceWithDeviceID:(id)a3
{
  id v4;
  int v5;
  NSMutableDictionary *contexts;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", self->_localDeviceID);
  contexts = self->_contexts;
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](contexts, "objectForKeyedSubscript:", self->_localDeviceID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](contexts, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[_CDInMemoryContext contextWithDeviceID:](_CDInMemoryContext, "contextWithDeviceID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contexts, "setObject:forKeyedSubscript:", v7, v4);
    }
  }

  return v7;
}

- (void)deregisterCallback:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *syncQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  _CDInMemoryUserContext *v19;
  id v20;

  v14 = a3;
  v4 = objc_msgSend(v14, "deviceSet");
  if (v4 == 1)
  {
    if (objc_msgSend(v14, "isMultiDeviceRegistration"))
    {
      objc_msgSend(v14, "predicate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInMemoryUserContext namedDeviceIDsFromPredicate:](self, "namedDeviceIDsFromPredicate:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CDInMemoryUserContext allDevices](self, "allDevices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v8 = v6;
      }
      else
      {
        -[_CDInMemoryUserContext allDeviceIDs](self, "allDeviceIDs");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v8;
      syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45___CDInMemoryUserContext_deregisterCallback___block_invoke;
      block[3] = &unk_1E26D4FD0;
      v16 = v8;
      v17 = v6;
      v18 = v14;
      v19 = self;
      v20 = v7;
      v12 = v7;
      v9 = v6;
      v13 = v10;
      dispatch_sync(syncQueue, block);

      goto LABEL_10;
    }
  }
  else if (v4)
  {
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", self->_localDeviceID);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deregisterCallback:", v14);
LABEL_10:

LABEL_11:
}

- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (_CDInMemoryUserContext)init
{
  _CDInMemoryUserContext *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *syncQueue;
  uint64_t v5;
  NSMutableDictionary *contexts;
  uint64_t v7;
  _CDInMemoryContext *userContext;
  void *v9;
  uint64_t v10;
  NSString *localDeviceID;
  void *v12;
  uint64_t v13;
  NSMutableArray *pendingAllDeviceRegistrations;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_CDInMemoryUserContext;
  v2 = -[_CDInMemoryUserContext init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.CDUserContext.ramglobalcontext", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    contexts = v2->_contexts;
    v2->_contexts = (NSMutableDictionary *)v5;

    +[_CDInMemoryContext contextWithDeviceID:](_CDInMemoryContext, "contextWithDeviceID:", v2->_localDeviceID);
    v7 = objc_claimAutoreleasedReturnValue();
    userContext = v2->_userContext;
    v2->_userContext = (_CDInMemoryContext *)v7;

    +[_CDDevice localDevice](_CDDevice, "localDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceID");
    v10 = objc_claimAutoreleasedReturnValue();
    localDeviceID = v2->_localDeviceID;
    v2->_localDeviceID = (NSString *)v10;

    +[_CDInMemoryContext contextWithDeviceID:](_CDInMemoryContext, "contextWithDeviceID:", v2->_localDeviceID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_contexts, "setObject:forKeyedSubscript:", v12, v2->_localDeviceID);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingAllDeviceRegistrations = v2->_pendingAllDeviceRegistrations;
    v2->_pendingAllDeviceRegistrations = (NSMutableArray *)v13;

  }
  return v2;
}

+ (id)userContext
{
  return objc_alloc_init(_CDInMemoryUserContext);
}

- (id)localContext
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", self->_localDeviceID);
}

- (id)valuesForKeyPaths:(id)a3 inContextsMatchingPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *syncQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  _CDInMemoryUserContext *v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72___CDInMemoryUserContext_valuesForKeyPaths_inContextsMatchingPredicate___block_invoke;
  v18 = &unk_1E26D4F10;
  v19 = self;
  v20 = v7;
  v21 = v6;
  v22 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  dispatch_sync(syncQueue, &v15);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10, v15, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)valuesForKeyPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_CDInMemoryUserContext propertiesForContextualKeyPath:](self, "propertiesForContextualKeyPath:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "hasKnowledgeOfContextualKeyPath:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)objectForContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForContextualKeyPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastModifiedDateForContextualKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContextValue:forContextualKeyPath:", v7, v6);

}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:removedObjects:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:returningMetadataForContextualKeyPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9 != 0;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "addObjects:toArrayAtKeyPath:", v7, v6);

  return v9;
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "removeObjects:fromArrayAtKeyPath:", v7, v6);

  return v9;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsMatchingPredicate:fromArrayAtKeyPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "addObjects:andRemoveObjects:fromArrayAtKeyPath:", v10, v9, v8);

  return v12;
}

- (id)allDevices
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _CDInMemoryUserContext *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36___CDInMemoryUserContext_allDevices__block_invoke;
  v8[3] = &unk_1E26D46A8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(syncQueue, v8);
  v6 = v5;

  return v6;
}

- (id)allDeviceIDs
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _CDInMemoryUserContext *v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38___CDInMemoryUserContext_allDeviceIDs__block_invoke;
  v8[3] = &unk_1E26D46A8;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(syncQueue, v8);
  v6 = v5;

  return v6;
}

- (id)remoteDeviceIDs
{
  NSObject *syncQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41___CDInMemoryUserContext_remoteDeviceIDs__block_invoke;
  v5[3] = &unk_1E26D4FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)deviceWithDeviceID:(id)a3 fromDevices:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "deviceID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)unsafe_remoteDevices
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext unsafe_remoteUserContextProxySourceDeviceUUIDs](self, "unsafe_remoteUserContextProxySourceDeviceUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_CDInMemoryUserContext unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:](self, "unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:", v9);
          v10 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v10, "count"))
            objc_msgSend(v3, "addObjectsFromArray:", v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v9;
            _os_log_error_impl(&dword_18DD73000, v10, OS_LOG_TYPE_ERROR, "Invalid object in remote user context proxy source device array: %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)unsafe_remoteDeviceIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext unsafe_remoteUserContextProxySourceDeviceUUIDs](self, "unsafe_remoteUserContextProxySourceDeviceUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_CDInMemoryUserContext unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v9);
          v10 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject count](v10, "count"))
            objc_msgSend(v3, "unionSet:", v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v9;
            _os_log_error_impl(&dword_18DD73000, v10, OS_LOG_TYPE_ERROR, "Invalid object in remote user context proxy source device array: %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  -[_CDInMemoryUserContext unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:](self, "unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_CDInMemoryUserContext unsafe_contextForDeviceWithDeviceID:](self, "unsafe_contextForDeviceWithDeviceID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "device");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "addObject:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v22 = v11;
            _os_log_error_impl(&dword_18DD73000, v14, OS_LOG_TYPE_ERROR, "Missing device for device %{public}@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  NSMutableDictionary *contexts;
  NSString *localDeviceID;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  contexts = self->_contexts;
  localDeviceID = self->_localDeviceID;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](contexts, "objectForKeyedSubscript:", localDeviceID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:](_CDContextQueries, "keyPathForMDCSDeviceIDsWithProxySourceDeviceUUID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_CDInMemoryUserContext unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:].cold.1();

    }
  }

  return v8;
}

- (id)unsafe_remoteDevicesByDeviceIDForRemoteUserContextProxySourceDeviceUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:](self, "unsafe_remoteDevicesForRemoteUserContextProxySourceDeviceUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "deviceID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)unsafe_remoteUserContextProxySourceDeviceUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", self->_localDeviceID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);
      objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[_CDInMemoryUserContext unsafe_remoteUserContextProxySourceDeviceUUIDs].cold.1();

      v4 = 0;
    }
  }

  return v4;
}

- (void)activateDevices:(id)a3 remoteUserContextProxySourceDeviceUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *syncQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  _CDInMemoryUserContext *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_CDContextQueries keyPathForMDCSProxies](_CDContextQueries, "keyPathForMDCSProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext addObjects:toArrayAtKeyPath:](self, "addObjects:toArrayAtKeyPath:", v9, v8);

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___CDInMemoryUserContext_activateDevices_remoteUserContextProxySourceDeviceUUID___block_invoke;
  block[3] = &unk_1E26D4680;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_sync(syncQueue, block);

}

- (id)namedDeviceIDsFromPredicate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "keyPaths", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "deviceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && (objc_msgSend(v11, "isEqualToString:", self->_localDeviceID) & 1) == 0)
        {
          -[NSObject addObject:](v5, "addObject:", v12);
        }
        else
        {

          v5 = 0;
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if ((unint64_t)-[NSObject count](v5, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0D158F0], "mdcsChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_CDInMemoryUserContext namedDeviceIDsFromPredicate:].cold.1(v4, v13);
    goto LABEL_17;
  }
  if (!-[NSObject count](v5, "count"))
  {
    v13 = v5;
    v5 = 0;
LABEL_17:

  }
  return v5;
}

- (void)registerCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *syncQueue;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _CDInMemoryUserContext *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    LOBYTE(v9) = 0;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        if ((v9 & 1) != 0)
          v9 = 1;
        else
          v9 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isUserCentric");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);

    if (v9)
    {
      -[_CDInMemoryContext registerCallback:](self->_userContext, "registerCallback:", v4);
      goto LABEL_23;
    }
  }
  else
  {

  }
  v12 = objc_msgSend(v4, "deviceSet");
  if (v12 != 1)
  {
    if (v12)
      goto LABEL_23;
    goto LABEL_20;
  }
  if (!objc_msgSend(v4, "isMultiDeviceRegistration"))
  {
LABEL_20:
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", self->_localDeviceID);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerCallback:", v4);

    goto LABEL_23;
  }
  objc_msgSend(v4, "predicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInMemoryUserContext namedDeviceIDsFromPredicate:](self, "namedDeviceIDsFromPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInMemoryUserContext allDevices](self, "allDevices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v16 = v14;
  }
  else
  {
    -[_CDInMemoryUserContext allDeviceIDs](self, "allDeviceIDs");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v16;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43___CDInMemoryUserContext_registerCallback___block_invoke;
  block[3] = &unk_1E26D4FD0;
  v24 = v16;
  v25 = v14;
  v26 = v4;
  v27 = self;
  v28 = v15;
  v20 = v15;
  v21 = v14;
  v22 = v18;
  dispatch_sync(syncQueue, block);

LABEL_23:
}

- (BOOL)hasMultiDeviceRegistrations
{
  NSObject *syncQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___CDInMemoryUserContext_hasMultiDeviceRegistrations__block_invoke;
  v5[3] = &unk_1E26D4FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)unsafe_hasMultiDeviceRegistrations
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t j;
  char v19;
  NSMutableDictionary *v20;
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

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_contexts;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v19 = 0;
    v6 = *(_QWORD *)v26;
    v7 = 0x1E26D3000uLL;
    v20 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", self->_localDeviceID) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "allRegistrations");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v12 = v11;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v13)
            {
              v14 = v13;
              v15 = v7;
              v16 = *(_QWORD *)v22;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v22 != v16)
                    objc_enumerationMutation(v12);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "isMultiDeviceRegistration") & 1) != 0)
                  {
                    v19 = 1;
                    goto LABEL_18;
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
                if (v14)
                  continue;
                break;
              }
LABEL_18:
              v7 = v15;
              v3 = v20;
            }

          }
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  else
  {
    v19 = 0;
  }

  return v19 & 1;
}

- (id)unsafe_multiDeviceRegistrations
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_CDInMemoryUserContext unsafe_multiDeviceRegistrationsByDeviceID](self, "unsafe_multiDeviceRegistrationsByDeviceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)unsafe_multiDeviceRegistrationsByDeviceID
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_contexts, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_contexts;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", self->_localDeviceID, (_QWORD)v13) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contexts, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "allRegistrations");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count"))
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

          }
        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)evaluatePredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "keyPaths", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_CDInMemoryUserContext propertiesForContextualKeyPath:](self, "propertiesForContextualKeyPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "evaluateWithObject:substitutionVariables:", v5, &unk_1E26DFED8);

  return v13;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_CDInMemoryUserContext contextForKeyPath:](self, "contextForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForContextualKeyPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  NSObject *syncQueue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _CDInMemoryUserContext *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncQueue = self->_syncQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37___CDInMemoryUserContext_description__block_invoke;
  v11 = &unk_1E26D46A8;
  v12 = v3;
  v13 = self;
  v5 = v3;
  dispatch_sync(syncQueue, &v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (NSMutableArray)pendingAllDeviceRegistrations
{
  return self->_pendingAllDeviceRegistrations;
}

- (void)setPendingAllDeviceRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAllDeviceRegistrations, a3);
}

- (_CDInMemoryContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong((id *)&self->_userContext, a3);
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_pendingAllDeviceRegistrations, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)unsafe_remoteDeviceIDsForRemoteUserContextProxySourceDeviceUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_18DD73000, v1, OS_LOG_TYPE_ERROR, "Invalid object at %{public}@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)unsafe_remoteUserContextProxySourceDeviceUUIDs
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, v0, v1, "Invalid object at %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)namedDeviceIDsFromPredicate:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_18DD73000, a2, v4, "Multi-device predicates are not yet supported: %@", v5);

}

- (void)evaluatePredicate:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18DD73000, v0, OS_LOG_TYPE_FAULT, "Invalid predicate: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
