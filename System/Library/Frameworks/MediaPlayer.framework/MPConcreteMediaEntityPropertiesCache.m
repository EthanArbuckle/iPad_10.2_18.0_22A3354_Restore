@implementation MPConcreteMediaEntityPropertiesCache

- (void)cacheValue:(id)a3 forProperty:(id)a4 persistValueInBackgroundBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaLibraryDataProvider.m"), 1710, CFSTR("Property can't be nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v12 = v9;
LABEL_6:
  v14 = v12;
  v16 = v10;
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPConcreteMediaEntityPropertiesCache _cacheValues:persistValueInBackgroundBlock:](self, "_cacheValues:persistValueInBackgroundBlock:", v15, v11);

}

- (void)_cacheValues:(id)a3 persistValueInBackgroundBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke;
  v9[3] = &unk_1E3157850;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)cachePropertyValues:(id)a3 forProperties:(id)a4 persistValueInBackgroundBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v15, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v17, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  -[MPConcreteMediaEntityPropertiesCache _cacheValues:persistValueInBackgroundBlock:](self, "_cacheValues:persistValueInBackgroundBlock:", v9, 0);
}

- (MPConcreteMediaEntityPropertiesCache)initWithLibraryDataProvider:(id)a3 dataProviderEntityClass:(Class)a4 identifier:(int64_t)a5
{
  id v7;
  MPConcreteMediaEntityPropertiesCache *v8;
  MPConcreteMediaEntityPropertiesCache *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *properties;
  NSMutableDictionary *v12;
  NSMutableDictionary *valuePersistenceBlocks;
  dispatch_queue_t v14;
  OS_dispatch_queue *calloutQueue;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPConcreteMediaEntityPropertiesCache;
  v8 = -[MPConcreteMediaEntityPropertiesCache init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataProvider, v7);
    v9->_dataProviderEntityClass = a4;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    properties = v9->_properties;
    v9->_properties = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    valuePersistenceBlocks = v9->_valuePersistenceBlocks;
    v9->_valuePersistenceBlocks = v12;

    v14 = dispatch_queue_create("com.apple.mediaplayer.EntityProperty.calloutQueue", 0);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)valueForProperty:(id)a3 isCached:(BOOL *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKey:](self->_properties, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if (a4)
      *a4 = 1;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {

      v8 = 0;
    }
  }
  return v8;
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x19403A624]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v5);
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_2;
    v17[3] = &unk_1E3161780;
    v18 = v6;
    v20 = *(id *)(a1 + 40);
    v9 = v5;
    v19 = v9;
    v10 = (void *)objc_msgSend(v17, "copy");
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v12 = (void *)MEMORY[0x19403A810]();
    objc_msgSend(v11, "setObject:forKey:", v12, v9);

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 40);
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_3;
    block[3] = &unk_1E31635F8;
    block[4] = v13;
    v16 = v9;
    dispatch_async(v14, block);

  }
  objc_autoreleasePoolPop(v7);

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  objc_msgSend(WeakRetained, "entityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEntityWithIdentifier:dataProviderEntityClass:", self->_identifier, self->_dataProviderEntityClass);

  v5.receiver = self;
  v5.super_class = (Class)MPConcreteMediaEntityPropertiesCache;
  -[MPConcreteMediaEntityPropertiesCache dealloc](&v5, sel_dealloc);
}

- (Class)dataProviderEntityClass
{
  return self->_dataProviderEntityClass;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_valuePersistenceBlocks, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)delete
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *properties;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_valuePersistenceBlocks, "removeAllObjects");
  properties = self->_properties;
  if (properties)
  {
    self->_properties = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSMutableDictionary **p_properties;
  NSMutableDictionary *properties;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_valuePersistenceBlocks, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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
        -[NSMutableDictionary valueForKey:](self->_properties, "valueForKey:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  properties = self->_properties;
  p_properties = &self->_properties;
  if (properties)
    objc_storeStrong((id *)p_properties, v5);
  os_unfair_lock_unlock(p_lock);

}

- (MPMediaLibraryDataProvider)dataProvider
{
  return (MPMediaLibraryDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (int64_t)identifier
{
  return self->_identifier;
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = *(void **)(a1 + 32);
  v5 = v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __83__MPConcreteMediaEntityPropertiesCache__cacheValues_persistValueInBackgroundBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  v2 = v3;
  if (v3)
  {
    (*((void (**)(id))v3 + 2))(v3);
    v2 = v3;
  }

}

@end
