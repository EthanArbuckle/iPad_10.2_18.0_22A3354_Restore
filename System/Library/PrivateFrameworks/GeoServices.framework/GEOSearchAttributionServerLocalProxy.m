@implementation GEOSearchAttributionServerLocalProxy

- (GEOSearchAttributionServerLocalProxy)init
{
  GEOSearchAttributionServerLocalProxy *v2;
  GEOSearchAttributionServerLocalProxy *v3;
  uint64_t v4;
  geo_isolater *isolater;
  void *v6;
  void *global_workloop;
  GEOSearchAttributionServerLocalProxy *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOSearchAttributionServerLocalProxy;
  v2 = -[GEOSearchAttributionServerLocalProxy init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_attributionManifestLock._os_unfair_lock_opaque = 0;
    v2->_listenersLock._os_unfair_lock_opaque = 0;
    v4 = geo_isolater_create();
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    global_workloop = (void *)geo_get_global_workloop();
    objc_msgSend(v6, "addTileGroupObserver:queue:", v3, global_workloop);

    v8 = v3;
  }

  return v3;
}

- (id)_attributionManifest
{
  os_unfair_lock_s *p_attributionManifestLock;
  GEOSearchAttributionManifest *attributionManifest;
  id v5;
  void *v6;
  void *v7;
  GEOSearchAttributionManifest *v8;
  GEOSearchAttributionManifest *v9;
  GEOSearchAttributionManifest *v10;

  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock(&self->_attributionManifestLock);
  attributionManifest = self->_attributionManifest;
  if (!attributionManifest)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithContentsOfFile:", v6);

    v8 = -[GEOSearchAttributionManifest initWithData:]([GEOSearchAttributionManifest alloc], "initWithData:", v7);
    v9 = self->_attributionManifest;
    self->_attributionManifest = v8;

    attributionManifest = self->_attributionManifest;
  }
  v10 = attributionManifest;
  os_unfair_lock_unlock(p_attributionManifestLock);
  return v10;
}

- (void)_sendInfo:(id)a3 toListener:(id)a4
{
  os_unfair_lock_s *p_listenersLock;
  id v7;
  NSMapTable *listeners;
  void *v9;
  id v10;

  p_listenersLock = &self->_listenersLock;
  v7 = a4;
  v10 = a3;
  os_unfair_lock_lock_with_options();
  listeners = self->_listeners;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](listeners, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(p_listenersLock);
  objc_msgSend(v7, "handleInfo:", v10);

}

- (void)_sendError:(id)a3 toListener:(id)a4
{
  os_unfair_lock_s *p_listenersLock;
  id v7;
  NSMapTable *listeners;
  void *v9;
  id v10;

  p_listenersLock = &self->_listenersLock;
  v7 = a4;
  v10 = a3;
  os_unfair_lock_lock_with_options();
  listeners = self->_listeners;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](listeners, "removeObjectForKey:", v9);

  os_unfair_lock_unlock(p_listenersLock);
  objc_msgSend(v7, "handleError:", v10);

}

- (void)_loadAttributionInfoForListener:(id)a3
{
  id v4;
  GEOSearchAttributionLoader *v5;
  void *v6;
  GEOSearchAttributionLoader *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = [GEOSearchAttributionLoader alloc];
  -[GEOSearchAttributionServerLocalProxy _attributionManifest](self, "_attributionManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOSearchAttributionLoader initWithAttributionManifest:](v5, "initWithAttributionManifest:", v6);

  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__GEOSearchAttributionServerLocalProxy__loadAttributionInfoForListener___block_invoke;
  v10[3] = &unk_1E1C128D8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[GEOSearchAttributionLoader loadAttributionInfoForIdentifier:allowNetwork:completionHandler:](v7, "loadAttributionInfoForIdentifier:allowNetwork:completionHandler:", v8, 1, v10);

}

uint64_t __72__GEOSearchAttributionServerLocalProxy__loadAttributionInfoForListener___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
    return objc_msgSend(v4, "_sendInfo:toListener:", a2, v5);
  else
    return objc_msgSend(v4, "_sendError:toListener:", a3, v5);
}

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _GEOSearchAttributionListener *v17;
  _GEOSearchAttributionListener *v18;
  NSMapTable *v19;
  NSMapTable *listeners;
  NSObject *global_queue;
  id v22;
  id v23;
  id v24;
  dispatch_block_t v25;
  id v26;
  id obj;
  void *v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  NSObject *v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v13 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
        v38[3] = &unk_1E1C12900;
        v38[4] = self;
        v39 = v29;
        v40 = v12;
        v14 = v7;
        v41 = v14;
        v15 = (void *)MEMORY[0x18D765024](v38);
        v34[0] = v13;
        v34[1] = 3221225472;
        v34[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3;
        v34[3] = &unk_1E1C02018;
        v34[4] = self;
        v35 = v28;
        v36 = v12;
        v37 = v14;
        v16 = (void *)MEMORY[0x18D765024](v34);
        os_unfair_lock_lock(&self->_listenersLock);
        -[NSMapTable objectForKey:](self->_listeners, "objectForKey:", v12);
        v17 = (_GEOSearchAttributionListener *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          -[_GEOSearchAttributionListener addCompletionHandler:errorHandler:](v17, "addCompletionHandler:errorHandler:", v15, v16);
          os_unfair_lock_unlock(&self->_listenersLock);
        }
        else
        {
          if (!self->_listeners)
          {
            v19 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 512, 5);
            listeners = self->_listeners;
            self->_listeners = v19;

          }
          v18 = -[_GEOSearchAttributionListener initWithIdentifier:]([_GEOSearchAttributionListener alloc], "initWithIdentifier:", v12);
          -[NSMapTable setObject:forKey:](self->_listeners, "setObject:forKey:", v18, v12);
          -[_GEOSearchAttributionListener addCompletionHandler:errorHandler:](v18, "addCompletionHandler:errorHandler:", v15, v16);
          os_unfair_lock_unlock(&self->_listenersLock);
          -[GEOSearchAttributionServerLocalProxy _loadAttributionInfoForListener:](self, "_loadAttributionInfoForListener:", v18);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v9);
  }

  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_5;
  block[3] = &unk_1E1C01358;
  v31 = v29;
  v32 = v28;
  v33 = v26;
  v22 = v28;
  v23 = v29;
  v24 = v26;
  v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  dispatch_group_notify(v7, global_queue, v25);

}

void __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 40);
  v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __92__GEOSearchAttributionServerLocalProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  os_unfair_lock_s *p_attributionManifestLock;
  GEOSearchAttributionManifest *attributionManifest;

  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock_with_options();
  attributionManifest = self->_attributionManifest;
  self->_attributionManifest = 0;

  os_unfair_lock_unlock(p_attributionManifestLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_attributionManifest, 0);
  objc_storeStrong((id *)&self->_updateManifestErrorHandlers, 0);
  objc_storeStrong((id *)&self->_updateManifestCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
