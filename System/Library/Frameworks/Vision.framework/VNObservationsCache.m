@implementation VNObservationsCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationsCache, 0);
}

- (id)observationsAcceptedByRequest:(id)a3 testedKeyHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  uint64_t v8;
  os_unfair_lock_s *p_observationsCacheLock;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  os_unfair_lock_s *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  v8 = objc_msgSend(v6, "frameworkClass");
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMapTable keyEnumerator](self->_observationsCache, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v18 = &self->_observationsCacheLock;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "requestClass") == v8)
        {
          v15 = objc_msgSend(v6, "willAcceptCachedResultsFromRequestWithConfiguration:", v14);
          if (v7)
            v7[2](v7, v14, v15);
          if ((_DWORD)v15)
          {
            -[NSMapTable objectForKey:](self->_observationsCache, "objectForKey:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
    v16 = 0;
LABEL_14:
    p_observationsCacheLock = v18;
  }
  else
  {
    v16 = 0;
  }

  os_unfair_lock_unlock(p_observationsCacheLock);
  return v16;
}

- (void)setObservations:(id)a3 forKey:(id)a4
{
  id v6;
  os_unfair_lock_s *p_observationsCacheLock;
  NSMapTable *observationsCache;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  observationsCache = self->_observationsCache;
  if (v10)
  {
    v9 = (void *)objc_msgSend(v10, "copy");
    -[NSMapTable setObject:forKey:](observationsCache, "setObject:forKey:", v9, v6);

  }
  else
  {
    -[NSMapTable removeObjectForKey:](observationsCache, "removeObjectForKey:", v6);
  }
  os_unfair_lock_unlock(p_observationsCacheLock);

}

- (VNObservationsCache)init
{
  VNObservationsCache *v2;
  VNObservationsCache *v3;
  uint64_t v4;
  NSMapTable *observationsCache;
  VNObservationsCache *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNObservationsCache;
  v2 = -[VNObservationsCache init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observationsCacheLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observationsCache = v3->_observationsCache;
    v3->_observationsCache = (NSMapTable *)v4;

    v6 = v3;
  }

  return v3;
}

- (id)observationsForKey:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observationsCacheLock;
  void *v6;

  v4 = a3;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  -[NSMapTable objectForKey:](self->_observationsCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observationsCacheLock);

  return v6;
}

@end
