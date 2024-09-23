@implementation HDTaskServerRegistry

- (HDTaskServerRegistry)initWithDaemon:(id)a3
{
  id v4;
  HDTaskServerRegistry *v5;
  HDTaskServerRegistry *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *taskServerClassesByTaskIdentifier;
  uint64_t v9;
  NSMapTable *taskServersByUUID;
  NSMutableDictionary *v11;
  NSMutableDictionary *taskServerObserversByUUID;
  NSMutableSet *v13;
  NSMutableSet *loadedPluginURLs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDTaskServerRegistry;
  v5 = -[HDTaskServerRegistry init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskServerClassesByTaskIdentifier = v6->_taskServerClassesByTaskIdentifier;
    v6->_taskServerClassesByTaskIdentifier = v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    taskServersByUUID = v6->_taskServersByUUID;
    v6->_taskServersByUUID = (NSMapTable *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskServerObserversByUUID = v6->_taskServerObserversByUUID;
    v6->_taskServerObserversByUUID = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    loadedPluginURLs = v6->_loadedPluginURLs;
    v6->_loadedPluginURLs = v13;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)registerTaskServerClassesWithProvider:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "taskServerClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = -[HDTaskServerRegistry registerTaskServerClasses:error:](self, "registerTaskServerClasses:error:", v6, a4);
  else
    v7 = 1;

  return v7;
}

- (BOOL)registerTaskServerClass:(Class)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  char v8;
  id v9;
  id v10;
  id v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0;
  v8 = -[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, a3, (uint64_t)&v12);
  v9 = v12;
  os_unfair_lock_unlock(p_lock);
  if ((v8 & 1) == 0)
  {
    v10 = v9;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return v8;
}

- (uint64_t)_lock_registerTaskServerClass:(uint64_t)a3 error:
{
  void *v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a2, "taskIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v6);
      if (!objc_msgSend(v7, "isSubclassOfClass:", a2)
        || (objc_msgSend(a2, "isSubclassOfClass:", v7) & 1) == 0)
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Attempt to register class '%@' as a task server for '%@', but class '%@' is already registered for that identifier."), a2, v6, objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v6));
          v8 = 0;
LABEL_11:

          return v8;
        }
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", a2, v6);
      }
      v8 = 1;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("%@ does not respond to taskIdentifier"), a2);
  }
  return 0;
}

- (BOOL)registerTaskServerClasses:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v7);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v18 = v13;
      v15 = -[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, v14, (uint64_t)&v18);
      v10 = v18;

      if (!v15)
        break;
      ++v12;
      v13 = v10;
      if (v9 == v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          goto LABEL_3;

        os_unfair_lock_unlock(&self->_lock);
        v16 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  v10 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)loadTaskServersFromPluginAtURL:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  objc_class *v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v8 = v7;
  if (!self)
    goto LABEL_24;
  if ((-[NSMutableSet containsObject:](self->_loadedPluginURLs, "containsObject:", v8) & 1) != 0)
  {
    v9 = 1;
    goto LABEL_31;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HDTaskServerRegistry daemon](self, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pluginManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowablePluginDirectoryPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (!v13)
  {
LABEL_12:

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid plugin URL for task server registration: %@"), v8);
LABEL_24:
    v9 = 0;
    goto LABEL_31;
  }
  v14 = v13;
  v15 = *(_QWORD *)v35;
LABEL_6:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v15)
      objc_enumerationMutation(v12);
    v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16);
    objc_msgSend(v8, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v18, "hasPrefix:", v17);

    if ((v17 & 1) != 0)
      break;
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v14)
        goto LABEL_6;
      goto LABEL_12;
    }
  }

  -[NSMutableSet addObject:](self->_loadedPluginURLs, "addObject:", v8);
  v19 = (void *)MEMORY[0x1E0CB69E8];
  v40 = &unk_1EF1ADC88;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (objc_class *)objc_msgSend(v19, "loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:", v20, v8, 0);

  if (!v21)
    goto LABEL_24;
  v22 = objc_alloc_init(v21);
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "taskServerClasses");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          if (!-[HDTaskServerRegistry _lock_registerTaskServerClass:error:]((uint64_t)self, *(void **)(*((_QWORD *)&v30 + 1) + 8 * i), (uint64_t)a4))
          {
            v9 = 0;
            goto LABEL_26;
          }
        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
        if (v26)
          continue;
        break;
      }
    }
    v9 = 1;
LABEL_26:

  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Unable to instantiate candidate task server class provider %{public}@", buf, 0xCu);
    }
    v9 = 0;
  }

LABEL_31:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)taskServerForTaskUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_taskServersByUUID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addObserver:(id)a3 forTaskServerUUID:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDTaskServerRegistry.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskUUID != nil"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerObserversByUUID, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB6988]);
    objc_msgSend(v10, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithName:loggingCategory:", v15, v16);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taskServerObserversByUUID, "setObject:forKeyedSubscript:", v13, v10);
  }
  objc_msgSend(v13, "registerObserver:queue:", v9, v11);
  -[NSMapTable objectForKey:](self->_taskServersByUUID, "objectForKey:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v17)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__HDTaskServerRegistry_addObserver_forTaskServerUUID_queue___block_invoke;
    v19[3] = &unk_1E6D01CA0;
    v20 = v17;
    objc_msgSend(v13, "notifyObserver:handler:", v9, v19);

  }
}

uint64_t __60__HDTaskServerRegistry_addObserver_forTaskServerUUID_queue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCreateTaskServer:", *(_QWORD *)(a1 + 32));
}

- (void)removeObserver:(id)a3 forTaskServerUUID:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerObserversByUUID, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unregisterObserver:", v8);
  os_unfair_lock_unlock(p_lock);
}

- (void)removeTaskServerObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_taskServerObserversByUUID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "unregisterObserver:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)didCreateTaskServer:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMapTable *taskServersByUUID;
  void *v7;
  NSMutableDictionary *taskServerObserversByUUID;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  taskServersByUUID = self->_taskServersByUUID;
  objc_msgSend(v4, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](taskServersByUUID, "setObject:forKey:", v4, v7);

  taskServerObserversByUUID = self->_taskServerObserversByUUID;
  objc_msgSend(v4, "taskUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskServerObserversByUUID, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__HDTaskServerRegistry_didCreateTaskServer___block_invoke;
  v12[3] = &unk_1E6D01CA0;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "notifyObservers:", v12);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __44__HDTaskServerRegistry_didCreateTaskServer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCreateTaskServer:", *(_QWORD *)(a1 + 32));
}

- (void)taskServerDidInvalidate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *taskServerObserversByUUID;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  taskServerObserversByUUID = self->_taskServerObserversByUUID;
  objc_msgSend(v4, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskServerObserversByUUID, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__HDTaskServerRegistry_taskServerDidInvalidate___block_invoke;
  v12[3] = &unk_1E6D01CA0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "notifyObservers:", v12);

  v10 = self->_taskServerObserversByUUID;
  objc_msgSend(v9, "taskUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", 0, v11);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __48__HDTaskServerRegistry_taskServerDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didInvalidateTaskServer:", *(_QWORD *)(a1 + 32));
}

- (Class)_taskServerClassForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerClassesByTaskIdentifier, "objectForKeyedSubscript:", v5);

  os_unfair_lock_unlock(p_lock);
  return (Class)v6;
}

- (id)createTaskServerEndpointForIdentifier:(id)a3 taskUUID:(id)a4 instanceUUID:(id)a5 configuration:(id)a6 client:(id)a7 connectionQueue:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  objc_class *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  HDTaskServerEndpoint *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = -[HDTaskServerRegistry _taskServerClassForIdentifier:](self, "_taskServerClassForIdentifier:", v15);
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a9, 3, CFSTR("No registered task server for identifier '%@'"), v15);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromClass(v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hk_assignError:code:format:", a9, 125, CFSTR("Task server class %@ failed to implement requiredEntitlements"), v28);
    goto LABEL_16;
  }
  v35 = v17;
  v37 = v16;
  -[objc_class requiredEntitlements](v21, "requiredEntitlements");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        if (!objc_msgSend(v19, "hasRequiredEntitlement:error:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), a9))
        {

          v21 = 0;
          v17 = v35;
          v16 = v37;
          goto LABEL_19;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v24)
        continue;
      break;
    }
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class configurationClass](v21, "configurationClass");
    v17 = v35;
    v16 = v37;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a9, 3, CFSTR("Invalid configuration class %@ (expected %@)"), objc_opt_class(), -[objc_class configurationClass](v21, "configurationClass"));
LABEL_17:
      v21 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v17 = v35;
    v16 = v37;
    if (v18)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      NSStringFromClass(v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hk_assignError:code:format:", a9, 125, CFSTR("Task server class %@ does not implement configurationClass"), v28);
      goto LABEL_16;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[objc_class validateClient:error:](v21, "validateClient:error:", v19, a9))
  {
    goto LABEL_17;
  }
  if (v18)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((-[objc_class validateConfiguration:client:error:](v21, "validateConfiguration:client:error:", v18, v19, a9) & 1) == 0)
        goto LABEL_17;
      goto LABEL_27;
    }
    v33 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromClass(v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hk_assignError:code:format:", a9, 125, CFSTR("Task server class %@ failed to implement validateConfiguration:error:"), v28);
LABEL_16:

    goto LABEL_17;
  }
LABEL_27:
  v38 = [HDTaskServerEndpoint alloc];
  objc_msgSend(v19, "configuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "databaseAccessibilityAssertions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDTaskServerEndpoint initWithTaskServerClass:taskConfiguration:healthStoreConfiguration:taskUUID:instanceUUID:profile:databaseAccessibilityAssertions:connectionQueue:](v38, "initWithTaskServerClass:taskConfiguration:healthStoreConfiguration:taskUUID:instanceUUID:profile:databaseAccessibilityAssertions:connectionQueue:", v21, v18, v36, v16, v17, v34, v31, v20);

  if (v21)
    v32 = v21;
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a9, 3, CFSTR("Failed to instantiate task server endpoint for '%@'"), v15);

LABEL_19:
  return v21;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_loadedPluginURLs, 0);
  objc_storeStrong((id *)&self->_taskServerObserversByUUID, 0);
  objc_storeStrong((id *)&self->_taskServersByUUID, 0);
  objc_storeStrong((id *)&self->_taskServerClassesByTaskIdentifier, 0);
}

@end
