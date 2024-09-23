@implementation CLKUIResourceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance___sharedInstance;
}

void __38__CLKUIResourceManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

- (CLKUIResourceManager)init
{
  CLKUIResourceManager *v2;
  uint64_t v3;
  NSMutableDictionary *atlasesByUuid;
  uint64_t v5;
  NSMutableDictionary *providersByKey;
  uint64_t v7;
  NSMutableDictionary *recentProvidersForUuid;
  uint64_t v9;
  NSMutableArray *streamedAtlases;
  uint64_t v11;
  NSMutableArray *textureLoaderQueues;
  int v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLKUIResourceManager;
  v2 = -[CLKUIResourceManager init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    atlasesByUuid = v2->_atlasesByUuid;
    v2->_atlasesByUuid = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    providersByKey = v2->_providersByKey;
    v2->_providersByKey = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    recentProvidersForUuid = v2->_recentProvidersForUuid;
    v2->_recentProvidersForUuid = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    streamedAtlases = v2->_streamedAtlases;
    v2->_streamedAtlases = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    textureLoaderQueues = v2->_textureLoaderQueues;
    v2->_textureLoaderQueues = (NSMutableArray *)v11;

    v13 = CLKRunningInProcess();
    v14 = 36700160;
    if (!v13)
      v14 = -1;
    v2->_memoryLimit = v14;
    v2->_explicitMemoryLimit = -1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__purgeAllUnconditionally, *MEMORY[0x1E0C93E68], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C93E68], 0);

  v4.receiver = self;
  v4.super_class = (Class)CLKUIResourceManager;
  -[CLKUIResourceManager dealloc](&v4, sel_dealloc);
}

- (id)nullAtlas2D
{
  return 0;
}

- (id)nullAtlasCube
{
  return 0;
}

- (id)textureForUuid:(id)a3 delegate:(id)a4 rect:(id)a5 nullTexture:(BOOL)a6 streaming:
{
  __int128 v6;
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  CLKUITexture *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  double v22;

  v7 = a6;
  v21 = v6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v12, "resourceProviderKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = 0;
  if (v11 && v14)
  {
    objc_msgSend(v14, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_providersByKey, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = (void *)objc_msgSend((id)objc_opt_new(), "initWithDelegate:key:", v12, v17);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_providersByKey, "setObject:forKeyedSubscript:", v18, v17);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v18, v11, v21);
    objc_msgSend(v18, "addUuidToHistory:", v11);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", v11);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = -[CLKUIResourceManager _newAtlasForUuid:nullTexture:streaming:](self, "_newAtlasForUuid:nullTexture:streaming:", v11, v13, v7);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_atlasesByUuid, "setObject:forKeyedSubscript:", v19, v11);
      if (v7)
        -[NSMutableArray addObject:](self->_streamedAtlases, "addObject:", v19);
    }
    v16 = -[CLKUITexture initWithAtlas:rect:]([CLKUITexture alloc], "initWithAtlas:rect:", v19, v22);

  }
  return v16;
}

- (void)purge:(id)a3
{
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPurgable"))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "addObject:", v5);
    -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v4);

  }
}

- (unint64_t)_memoryLimit
{
  unint64_t result;

  result = self->_explicitMemoryLimit;
  if (result == -1)
    return self->_memoryLimit;
  return result;
}

- (unint64_t)_computeMemoryAvailable
{
  unint64_t v2;

  if (self->_explicitMemoryLimit == -1 && !CLKRunningInProcess())
    return -1;
  v2 = MEMORY[0x1D17A1D24]();
  if (v2 >= 0x500000)
    return v2 - 5242880;
  else
    return 0;
}

- (id)_fetchOldestAtlas
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_atlasesByUuid;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isPurgable"))
        {
          if (v6)
          {
            objc_msgSend(v10, "boundTime");
            if (v11 < v8)
            {
              v12 = v11;
              v13 = v10;

              v8 = v12;
              v6 = v13;
            }
          }
          else
          {
            v6 = v10;
            objc_msgSend(v6, "boundTime");
            v8 = v14;
          }
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)borrowTextureLoadingQueue
{
  void *v3;
  NSObject *v4;

  if (-[NSMutableArray count](self->_textureLoaderQueues, "count"))
  {
    -[NSMutableArray lastObject](self->_textureLoaderQueues, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_textureLoaderQueues, "removeLastObject");
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("CLKUIMetalTexture queue", v4);

  }
  return v3;
}

- (void)returnTextureLoadingQueue:(id)a3
{
  -[NSMutableArray addObject:](self->_textureLoaderQueues, "addObject:", a3);
}

- (BOOL)memoryIsAvailable:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
  return self->_memoryUsed + a3 <= -[CLKUIResourceManager _memoryLimit](self, "_memoryLimit") && v5 >= a3;
}

- (BOOL)ensureMemoryAvailable:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  NSObject *v9;
  unint64_t memoryUsed;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  unint64_t v26;
  __int128 v28;
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
  v6 = -[CLKUIResourceManager _memoryLimit](self, "_memoryLimit");
  if (self->_memoryUsed + a3 > v6 || v5 < a3)
  {
    v8 = v6;
    CLKLoggingObjectForDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      memoryUsed = self->_memoryUsed;
      *(_DWORD *)buf = 134218752;
      v30 = a3;
      v31 = 2048;
      v32 = v5;
      v33 = 2048;
      v34 = memoryUsed;
      v35 = 2048;
      v36 = v8;
      _os_log_impl(&dword_1CB9A4000, v9, OS_LOG_TYPE_DEFAULT, "evications begin (needs %lu bytes, %lu available bytes, %lu memory used, %lu limit)", buf, 0x2Au);
    }

    -[CLKUIResourceManager purgeAllUnused](self, "purgeAllUnused");
    v11 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
    v12 = v11;
    if (self->_memoryUsed + a3 > v8 || v11 < a3)
    {
      v13 = objc_opt_new();
      -[CLKUIResourceManager _fetchOldestAtlas](self, "_fetchOldestAtlas");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
LABEL_19:
        CLKLoggingObjectForDomain();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = self->_memoryUsed;
          *(_DWORD *)buf = 134218240;
          v30 = v12;
          v31 = 2048;
          v32 = v24;
          _os_log_impl(&dword_1CB9A4000, v23, OS_LOG_TYPE_DEFAULT, "evications end: failed (%lu available bytes, %lu memory used)", buf, 0x16u);
        }

        v15 = 0;
        goto LABEL_26;
      }
      v18 = (void *)v16;
      *(_QWORD *)&v17 = 138412290;
      v28 = v17;
      while (1)
      {
        CLKLoggingObjectForDomain();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v28;
          v30 = (unint64_t)v20;
          _os_log_impl(&dword_1CB9A4000, v19, OS_LOG_TYPE_DEFAULT, "evict uuid %@", buf, 0xCu);

        }
        -[NSObject addObject:](v13, "addObject:", v18);
        -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v13);
        -[NSObject removeAllObjects](v13, "removeAllObjects");
        v21 = -[CLKUIResourceManager _computeMemoryAvailable](self, "_computeMemoryAvailable");
        v12 = v21;
        if (self->_memoryUsed + a3 <= v8 && v21 >= a3)
          break;
        -[CLKUIResourceManager _fetchOldestAtlas](self, "_fetchOldestAtlas", v28);
        v22 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v22;
        if (!v22)
          goto LABEL_19;
      }
      CLKLoggingObjectForDomain();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_memoryUsed;
        *(_DWORD *)buf = 134218240;
        v30 = v12;
        v31 = 2048;
        v32 = v26;
        _os_log_impl(&dword_1CB9A4000, v25, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
      }

    }
    else
    {
      CLKLoggingObjectForDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_memoryUsed;
        *(_DWORD *)buf = 134218240;
        v30 = v12;
        v31 = 2048;
        v32 = v14;
        _os_log_impl(&dword_1CB9A4000, v13, OS_LOG_TYPE_DEFAULT, "evications end: success (%lu available bytes, %lu memory used)", buf, 0x16u);
      }
    }
    v15 = 1;
LABEL_26:

    return v15;
  }
  return 1;
}

- (void)purgeAllUnused
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    -[CLKUIResourceManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_purgeAllUnused, 0, 0);
    return;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = self->_providersByKey;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_providersByKey, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!v6)
            v6 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v9);
        }

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = self->_atlasesByUuid;
  v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v12);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "instanceCount"))
        {
          if (objc_msgSend(v19, "isPurgable"))
          {
            if (!v16)
              v16 = (void *)objc_opt_new();
            objc_msgSend(v16, "addObject:", v19);
          }
          if (!v15)
            v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "addObject:", v19);
        }

      }
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v14);

    if (v16)
      -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v16);
    if (!v6)
      goto LABEL_35;
  }
  else
  {

    v16 = 0;
    v15 = 0;
    if (!v6)
      goto LABEL_35;
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_providersByKey, "removeObjectsForKeys:", v6);
LABEL_35:
  if (v15)
  {
    v28 = v16;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
          objc_msgSend(v25, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          CLKLoggingObjectForDomain();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v26;
            _os_log_impl(&dword_1CB9A4000, v27, OS_LOG_TYPE_DEFAULT, "discard uuid %@", buf, 0xCu);
          }

          -[NSMutableDictionary removeObjectForKey:](self->_atlasesByUuid, "removeObjectForKey:", v26);
          -[NSMutableDictionary removeObjectForKey:](self->_recentProvidersForUuid, "removeObjectForKey:", v26);
          -[NSMutableArray removeObject:](self->_streamedAtlases, "removeObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v22);
    }

    v16 = v28;
  }

}

- (void)updateTextureStreaming
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_streamedAtlases;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CLKUIResourceManager _updateTextureStreamingForAtlas:](self, "_updateTextureStreamingForAtlas:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)notifyAtlas:(id)a3 willChangeToMemoryCost:(unint64_t)a4
{
  self->_memoryUsed += a4;
  self->_memoryUsed -= objc_msgSend(a3, "memoryCost");
}

- (id)delegateForUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentProvidersForUuid, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "delegate"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_providersByKey;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v17 = v6;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_providersByKey, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "delegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            objc_msgSend(v13, "uuidHistory");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsObject:", v4);

            if ((v15 & 1) != 0)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentProvidersForUuid, "setObject:forKeyedSubscript:", v13, v4);

              goto LABEL_14;
            }
          }

        }
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
      v7 = 0;
LABEL_14:
      v6 = v17;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)_purgeAllUnconditionally
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v3 = (void *)objc_opt_new();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_atlasesByUuid;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_atlasesByUuid, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isPurgable"))
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[CLKUIResourceManager _purgeAtlases:](self, "_purgeAtlases:", v3);
  }
  else
  {
    -[CLKUIResourceManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__purgeAllUnconditionally, 0, 0);
  }
}

- (id)_newAtlasForUuid:(id)a3 nullTexture:(id)a4 streaming:(BOOL)a5
{
  return 0;
}

- (unint64_t)explicitMemoryLimit
{
  return self->_explicitMemoryLimit;
}

- (void)setExplicitMemoryLimit:(unint64_t)a3
{
  self->_explicitMemoryLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureLoaderQueues, 0);
  objc_storeStrong((id *)&self->_streamedAtlases, 0);
  objc_storeStrong((id *)&self->_providersByKey, 0);
  objc_storeStrong((id *)&self->_atlasesByUuid, 0);
  objc_storeStrong((id *)&self->_recentProvidersForUuid, 0);
}

@end
