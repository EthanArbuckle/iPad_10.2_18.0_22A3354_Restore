@implementation _EMActivityRegistryObserverWrapper

- (void)startedActivity:(id)a3
{
  void *v4;
  NSMutableDictionary *trackedActivities;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_EMActivityRegistryObserverWrapper registry](self, "registry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    trackedActivities = self->_trackedActivities;
    objc_msgSend(v8, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](trackedActivities, "setObject:forKeyedSubscript:", v8, v6);

    os_unfair_lock_unlock(&self->_lock);
    -[_EMActivityRegistryObserverWrapper observer](self, "observer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityRegistry:startedActivity:", v4, v8);

  }
}

- (void)setActivities:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *trackedActivities;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  -[_EMActivityRegistryObserverWrapper registry](self, "registry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMActivityRegistryObserverWrapper observer](self, "observer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 && v33)
  {
    os_unfair_lock_lock(&self->_lock);
    v4 = self->_trackedActivities;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedActivities = self->_trackedActivities;
    self->_trackedActivities = v5;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = v32;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v12 = self->_trackedActivities;
          objc_msgSend(v11, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = v14 == 0;

          if ((_DWORD)v12)
          {
            v15 = self->_trackedActivities;
            objc_msgSend(v11, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v11, v16);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v8);
    }

    os_unfair_lock_unlock(&self->_lock);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v21, "objectID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v21, "progress");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "error");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              objc_msgSend(v23, "setCompletedCount:totalCount:", objc_msgSend(v24, "completedUnitCount"), objc_msgSend(v24, "totalUnitCount"));
            objc_msgSend(v21, "finished");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
              objc_msgSend(v23, "finishWithError:", v25);
            objc_msgSend(v21, "objectID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", 0, v27);

          }
          else
          {
            objc_msgSend(v33, "activityRegistry:startedActivity:", v34, v21);
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v18);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSMutableDictionary allValues](v4, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "finishWithError:", 0);
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v29);
    }

  }
}

- (EMActivityRegistry)registry
{
  return (EMActivityRegistry *)objc_loadWeakRetained((id *)&self->_registry);
}

- (EMActivityObserver)observer
{
  return (EMActivityObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (_EMActivityRegistryObserverWrapper)initWithConnection:(id)a3 registry:(id)a4 observer:(id)a5
{
  id v9;
  id v10;
  id v11;
  _EMActivityRegistryObserverWrapper *v12;
  _EMActivityRegistryObserverWrapper *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *trackedActivities;
  EMRemoteConnection *connection;
  uint64_t v17;
  EMRemoteConnection *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_EMActivityRegistryObserverWrapper;
  v12 = -[_EMActivityRegistryObserverWrapper init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_registry, v10);
    objc_storeWeak((id *)&v13->_observer, v11);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedActivities = v13->_trackedActivities;
    v13->_trackedActivities = v14;

    v13->_lock._os_unfair_lock_opaque = 0;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    connection = v13->_connection;
    v17 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke;
    v22[3] = &unk_1E70F1F78;
    objc_copyWeak(&v23, &location);
    -[EMRemoteConnection addResetHandler:](connection, "addResetHandler:", v22);
    v18 = v13->_connection;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __75___EMActivityRegistryObserverWrapper_initWithConnection_registry_observer___block_invoke_2;
    v20[3] = &unk_1E70F1F78;
    objc_copyWeak(&v21, &location);
    -[EMRemoteConnection addRecoveryHandler:](v18, "addRecoveryHandler:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)_startObservingIfNecessary
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _EMActivityRegistryObserverWrapper *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_observerCancelable)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    objc_storeStrong((id *)&self->_observerCancelable, v4);
    -[EMRemoteConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64___EMActivityRegistryObserverWrapper__startObservingIfNecessary__block_invoke;
    v7[3] = &unk_1E70F2130;
    v6 = v4;
    v8 = v6;
    v9 = self;
    objc_msgSend(v5, "registerActivityObserver:completion:", self, v7);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_observerCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_EMActivityRegistryObserverWrapper;
  -[_EMActivityRegistryObserverWrapper dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  -[_EMActivityRegistryObserverWrapper _resetWithCancelable:](self, "_resetWithCancelable:", 0);
}

- (void)_resetWithCancelable:(id)a3
{
  EFCancelable *observerCancelable;
  BOOL v5;
  EFCancelable *v6;
  EFCancelable *v7;

  v7 = (EFCancelable *)a3;
  os_unfair_lock_lock(&self->_lock);
  observerCancelable = self->_observerCancelable;
  if (!v7 || (v5 = observerCancelable == v7, observerCancelable = v7, v5))
  {
    -[EFCancelable cancel](observerCancelable, "cancel");
    v6 = self->_observerCancelable;
    self->_observerCancelable = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_registry);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_trackedActivities, 0);
  objc_storeStrong((id *)&self->_observerCancelable, 0);
}

- (void)removedActivityWithID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_trackedActivities, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)activities
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSArray *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_trackedActivities, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v5;

  return v6;
}

- (id)activityWithObjectID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_trackedActivities, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)activityWithID:(id)a3 setUserInfoObject:(id)a4 forKey:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[_EMActivityRegistryObserverWrapper activityWithObjectID:](self, "activityWithObjectID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfoObject:forKey:", v10, v8);

}

- (void)activityWithID:(id)a3 setCompletedCount:(id)a4 totalCount:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[_EMActivityRegistryObserverWrapper activityWithObjectID:](self, "activityWithObjectID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletedCount:totalCount:", objc_msgSend(v10, "integerValue"), objc_msgSend(v8, "integerValue"));

}

- (void)activityWithID:(id)a3 finishedWithError:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[_EMActivityRegistryObserverWrapper activityWithObjectID:](self, "activityWithObjectID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithError:", v7);

}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setRegistry:(id)a3
{
  objc_storeWeak((id *)&self->_registry, a3);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

@end
