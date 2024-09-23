@implementation INExtensionContextIntentResponseObserver

- (INExtensionContextIntentResponseObserver)init
{
  INExtensionContextIntentResponseObserver *v2;
  uint64_t v3;
  NSMapTable *remoteObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INExtensionContextIntentResponseObserver;
  v2 = -[INExtensionContextIntentResponseObserver init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    remoteObservers = v2->_remoteObservers;
    v2->_remoteObservers = (NSMapTable *)v3;

  }
  return v2;
}

- (void)setObserver:(id)a3 forConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[INExtensionContextIntentResponseObserver remoteObservers](self, "remoteObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)_intentResponseDidUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[INCache sharedCache](INCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "_intents_cacheableObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "cacheIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "cacheableObjectForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v13;
        else
          v14 = v11;
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke;
  v17[3] = &unk_1E2291E38;
  v17[4] = self;
  v18 = v3;
  v15 = v3;
  +[INSerializedCacheItem serializeCacheableObjects:completion:](INSerializedCacheItem, "serializeCacheableObjects:completion:", v5, v17);

}

- (NSMapTable)remoteObservers
{
  return self->_remoteObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObservers, 0);
  objc_storeStrong((id *)&self->_remoteObserver, 0);
}

void __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "remoteObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke_2;
  v8[3] = &unk_1E2291E10;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __69__INExtensionContextIntentResponseObserver__intentResponseDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      v7 = 136315394;
      v8 = "-[INExtensionContextIntentResponseObserver _intentResponseDidUpdate:]_block_invoke_2";
      v9 = 2048;
      v10 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Sending %tu serialized cache items.", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(v3, "intentResponseDidUpdate:withSerializedCacheItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "intentResponseDidUpdate:", *(_QWORD *)(a1 + 40));
  }

}

@end
