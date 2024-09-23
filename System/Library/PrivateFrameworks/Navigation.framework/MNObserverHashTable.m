@implementation MNObserverHashTable

- (MNObserverHashTable)initWithProtocol:(id)a3
{
  id v5;
  MNObserverHashTable *v6;
  MNObserverHashTable *v7;
  uint64_t v8;
  geo_isolater *observerLock;
  MNObserverHashTable *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNObserverHashTable;
  v6 = -[MNObserverHashTable init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_protocol, a3);
    v8 = geo_isolater_create();
    observerLock = v7->_observerLock;
    v7->_observerLock = (geo_isolater *)v8;

    v10 = v7;
  }

  return v7;
}

- (unint64_t)count
{
  unint64_t v2;
  id v4;
  id location;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  geo_isolate_sync();
  v2 = v7[3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void __28__MNObserverHashTable_count__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "setRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "count");

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[MNObserverHashTable count]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)hasObservers
{
  return -[MNObserverHashTable count](self, "count") != 0;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  geo_isolate_sync();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __40__MNObserverHashTable_registerObserver___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[2];
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
      v6 = (void *)v3[2];
      v3[2] = v5;

      v4 = (void *)v3[2];
    }
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[MNObserverHashTable registerObserver:]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  geo_isolate_sync();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __42__MNObserverHashTable_unregisterObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "removeObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[MNObserverHashTable unregisterObserver:]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v7;
  void *v8;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNObserverHashTable doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
    v8 = 0;
  }
  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _QWORD *v14;
  id v15;
  id location;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  v18 = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __41__MNObserverHashTable_forwardInvocation___block_invoke;
  v13 = &unk_1E61D1AC0;
  objc_copyWeak(&v15, &location);
  v14 = v17;
  geo_isolate_sync();
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(v4, "retainArguments");
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __41__MNObserverHashTable_forwardInvocation___block_invoke_8;
  v7[3] = &unk_1E61D1B10;
  v6 = v4;
  v8 = v6;
  v9 = v17;
  MNRunAsynchronouslyOnMainThread(v7);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);

}

void __41__MNObserverHashTable_forwardInvocation___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[MNObserverHashTable forwardInvocation:]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }

  }
}

void __41__MNObserverHashTable_forwardInvocation___block_invoke_8(uint64_t a1)
{
  id v2;
  uint64_t v3;
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
  objc_msgSend(*(id *)(a1 + 32), "selector");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v7, (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __34__MNObserverHashTable_description__block_invoke;
  v16 = &unk_1E61D1AC0;
  objc_copyWeak(&v18, &location);
  v17 = &v20;
  geo_isolate_sync();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("MNObserverHashTable observers count: %d"), -[MNObserverHashTable count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v21[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@ (%p)"), objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v26, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  return v3;
}

void __34__MNObserverHashTable_description__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "allObjects");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[MNObserverHashTable description]_block_invoke";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
