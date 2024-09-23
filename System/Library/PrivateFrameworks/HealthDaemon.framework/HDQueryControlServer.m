@implementation HDQueryControlServer

- (void)queryServerDidFinish:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDQueryControlServer _lock_queryDidFinish:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HDQueryControlServer)initWithParentServer:(id)a3 connectionQueue:(id)a4
{
  id v6;
  id v7;
  HDQueryControlServer *v8;
  HDQueryControlServer *v9;
  uint64_t v10;
  HDHealthStoreClient *client;
  uint64_t v12;
  HDProfile *profile;
  NSMutableDictionary *v14;
  NSMutableDictionary *queryServersByUUID;
  NSMutableDictionary *v16;
  NSMutableDictionary *queryServerEndpointsByUUID;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDQueryControlServer;
  v8 = -[HDQueryControlServer init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_server, v6);
    objc_msgSend(v6, "client");
    v10 = objc_claimAutoreleasedReturnValue();
    client = v9->_client;
    v9->_client = (HDHealthStoreClient *)v10;

    objc_msgSend(v6, "profile");
    v12 = objc_claimAutoreleasedReturnValue();
    profile = v9->_profile;
    v9->_profile = (HDProfile *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryServersByUUID = v9->_queryServersByUUID;
    v9->_queryServersByUUID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryServerEndpointsByUUID = v9->_queryServerEndpointsByUUID;
    v9->_queryServerEndpointsByUUID = v16;

    objc_storeStrong((id *)&v9->_connectionQueue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSMutableDictionary *queryServersByUUID;
  void *v6;
  NSMutableDictionary *queryServerEndpointsByUUID;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_queryServersByUUID, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queryServersByUUID = self->_queryServersByUUID;
  self->_queryServersByUUID = 0;

  -[NSMutableDictionary allValues](self->_queryServerEndpointsByUUID, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queryServerEndpointsByUUID = self->_queryServerEndpointsByUUID;
  self->_queryServerEndpointsByUUID = 0;

  os_unfair_lock_unlock(p_lock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = MEMORY[0x1E0C809B0];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v24[0] = v12;
        v24[1] = 3221225472;
        v24[2] = __34__HDQueryControlServer_invalidate__block_invoke;
        v24[3] = &unk_1E6CE8080;
        v24[4] = self;
        v24[5] = v14;
        objc_msgSend(v14, "deactivateServerWithCompletion:", v24);
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "invalidate", (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v17);
  }

}

void __34__HDQueryControlServer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
    objc_msgSend(v3, "queryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Stopped query server %@", (uint8_t *)&v6, 0xCu);

  }
}

- (id)createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  HDHealthStoreClient *client;
  uint64_t v19;
  void *v20;
  os_unfair_lock_s *p_lock;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("Nil query server identifier");
LABEL_13:
    objc_msgSend(v23, "hk_assignError:code:format:", a7, 3, v24);
    v25 = 0;
    goto LABEL_21;
  }
  if (!v13)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("Nil query UUID");
    goto LABEL_13;
  }
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "taskServerRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    client = self->_client;
  else
    client = 0;
  objc_msgSend(v17, "createTaskServerEndpointForIdentifier:taskUUID:instanceUUID:configuration:client:connectionQueue:error:", v12, v13, v13, v14, client, self->_connectionQueue, a7);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_queryServersByUUID, "objectForKeyedSubscript:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        -[HDQueryControlServer _lock_queryDidFinish:]((uint64_t)self, v22);
    }
    else
    {
      v22 = 0;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_queryServerEndpointsByUUID, "objectForKeyedSubscript:", v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v13, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hk_assignError:code:format:", a7, 100, CFSTR("Query '%@' already exists"), v28);

      objc_msgSend(v20, "invalidate");
      v20 = 0;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queryServerEndpointsByUUID, "setObject:forKeyedSubscript:", v20, v13);
      objc_msgSend(v20, "setDelegate:", self);
      objc_msgSend(v20, "setTaskServerDelegate:", self);
      objc_msgSend(v20, "resume");
    }
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v22, "deactivateServerWithCompletion:", 0);
    objc_msgSend(v20, "listenerEndpoint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

LABEL_21:
  return v25;
}

- (void)_lock_queryDidFinish:(uint64_t)a1
{
  const os_unfair_lock *v3;
  id v4;
  id v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id WeakRetained;
  id v10;

  if (a1)
  {
    v3 = (const os_unfair_lock *)(a1 + 32);
    v4 = a2;
    os_unfair_lock_assert_owner(v3);
    objc_msgSend(v4, "queryUUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      v6 = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)a1);
      objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", v10);
      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v10);
      v8 = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)a1);
      objc_msgSend(v7, "invalidate");
      if (v6 != v8)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(WeakRetained, "_serverActivityChanged");

      }
    }

  }
}

- (BOOL)hasActiveQueries
{
  HDQueryControlServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[HDQueryControlServer _lock_hasActiveQueries]((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (const)_lock_hasActiveQueries
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 8);
    if (objc_msgSend(*(id *)&v1[2]._os_unfair_lock_opaque, "count"))
      return (const os_unfair_lock *)1;
    else
      return (const os_unfair_lock *)(objc_msgSend(*(id *)&v1[4]._os_unfair_lock_opaque, "count") != 0);
  }
  return result;
}

- (void)taskServerDidFailToInitializeForUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_queryServerEndpointsByUUID, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queryServerEndpointsByUUID, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "invalidate");

}

void __53__HDQueryControlServer__startQueryServer_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 32));
    v5 = (void *)a1[5];
    v6 = *(void **)(a1[4] + 8);
    objc_msgSend(v5, "queryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 completion:(id)a5
{
  -[HDQueryControlServer queryServer:requestsAuthorizationWithContext:promptIfNeeded:completion:](self, "queryServer:requestsAuthorizationWithContext:promptIfNeeded:completion:", a3, a4, 1, a5);
}

- (void)queryServer:(id)a3 requestsAuthorizationWithContext:(id)a4 promptIfNeeded:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  HDHealthStoreClient *client;
  HDHealthStoreClient *v13;
  void *v14;
  id v15;
  HDHealthStoreClient *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  -[HDProfile sourceManager](self->_profile, "sourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v22 = 0;
  v13 = client;
  objc_msgSend(v11, "createOrUpdateSourceForClient:error:", v13, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (v14)
  {
    v16 = self->_client;
    -[HDHealthStoreClient authorizationOracle](v16, "authorizationOracle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke;
    v21[3] = &unk_1E6CFD438;
    v21[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_195;
    v19[3] = &unk_1E6CFD460;
    v18 = v10;

    v20 = v18;
    objc_msgSend(v17, "enqueueObjectAuthorizationRequestWithContext:sourceEntity:promptIfNeeded:authorizationNeededHandler:completion:", v9, v14, v7, v21, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v15);
  }

}

void __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3)
  {
    v10 = *(_QWORD **)(a1 + 32);
    if (v10)
      v10 = (_QWORD *)v10[6];
    v11 = v10;
    objc_msgSend(v11, "authorizationOracle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      WeakRetained = objc_loadWeakRetained((id *)(v13 + 40));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "objectAuthorizationPromptHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleObjectAuthorizationRequestsWithPromptHandler:completion:", v15, &__block_literal_global_145);

  }
  else if (v8)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to determine object authorization status: %{public}@", (uint8_t *)&v17, 0xCu);
    }
  }

}

void __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to handle object authorization request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

uint64_t __95__HDQueryControlServer_queryServer_requestsAuthorizationWithContext_promptIfNeeded_completion___block_invoke_195(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queryServer:(id)a3 shouldStartWithCompletion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    objc_msgSend(WeakRetained, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__HDQueryControlServer__startQueryServer_completion___block_invoke;
      v12[3] = &unk_1E6CE7868;
      v12[4] = self;
      v13 = v6;
      v14 = v7;
      objc_msgSend(v10, "startQueryServer:completion:", v13, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Query manager unavailable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queryServerEndpointsByUUID, 0);
  objc_storeStrong((id *)&self->_queryServersByUUID, 0);
}

@end
