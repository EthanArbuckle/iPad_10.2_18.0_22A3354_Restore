@implementation HDHealthStoreServer

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self);

  -[HDProfile unitPreferencesManager](self->_profile, "unitPreferencesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUnitPreferenceObserver:queue:", self, self->_queue);

  -[HDProfile conceptIndexManager](self->_profile, "conceptIndexManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

}

- (HKHealthStoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)_requireEntitlement:(void *)a3 usingBlock:(void *)a4 errorHandler:
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(id, id);
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_9;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__requireEntitlement_usingBlock_errorHandler_, a1, CFSTR("HDHealthStoreServer.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlement != nil"));

    if (v8)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__requireEntitlement_usingBlock_errorHandler_, a1, CFSTR("HDHealthStoreServer.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_11;
LABEL_4:
  v10 = *(void **)(a1 + 88);
  v15 = 0;
  v11 = objc_msgSend(v10, "hasRequiredEntitlement:error:", v7, &v15);
  v12 = v15;
  if (v11)
  {
    v8[2](v8);
  }
  else if (v9)
  {
    v9[2](v9, v12);
  }

LABEL_9:
}

- (void)remote_fetchCharacteristicWithDataType:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      clientAuthorizationOracle = self->_clientAuthorizationOracle;
      v11 = MEMORY[0x1E0C809B0];
      queue = self->_queue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke;
      v15[3] = &unk_1E6D0F358;
      v15[4] = self;
      v16 = v7;
      v17 = v8;
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_3;
      v13[3] = &unk_1E6CF7CA8;
      v14 = v17;
      -[HDClientAuthorizationOracle performIfAuthorizedToReadTypes:onQueue:usingBlock:errorHandler:](clientAuthorizationOracle, "performIfAuthorizedToReadTypes:onQueue:usingBlock:errorHandler:", v9, queue, v15, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("dataType may not be nil"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v9);
    }

  }
}

void __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__195;
  v18 = __Block_byref_object_dispose__195;
  v19 = 0;
  objc_msgSend(*(id *)(a1[4] + 72), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_2;
  v10[3] = &unk_1E6CF1528;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v12 = &v14;
  v10[4] = v5;
  v11 = v6;
  objc_msgSend(v4, "performHighPriorityTransactionsWithError:block:", &v13, v10);
  v7 = v13;

  (*(void (**)(_QWORD, uint64_t, id, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v15[5], v7, v8, v9);
  _Block_object_dispose(&v14, 8);

}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void)remote_fetchDaemonPreferenceForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke;
  v14[3] = &unk_1E6CE8C48;
  v16 = v7;
  v9 = v6;
  v15 = v9;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke_2;
  v12[3] = &unk_1E6CF7CA8;
  v10 = v16;
  v13 = v10;
  v11 = v10;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v14, v12);
    v11 = v13;
  }

}

void __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB6F50], "valueForKey:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)remote_clientResumedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  HDHealthStoreClient *client;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEBUG))
  {
    client = self->_client;
    v8 = v5;
    -[HDHealthStoreClient process](client, "process");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_debug_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEBUG, "HDHealthStoreServer resuming connection with %{public}@", buf, 0xCu);

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__HDHealthStoreServer_remote_clientResumedWithCompletion___block_invoke;
    v11[3] = &unk_1E6CE9C08;
    v11[4] = self;
    v12 = v4;
    dispatch_sync(queue, v11);

  }
LABEL_4:

}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t result;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEBUG))
  {
    v6 = "canceled";
    v7 = *(_QWORD *)(a1 + 32);
    if (a2)
      v6 = "timed out";
    v8 = 138412546;
    v9 = v7;
    v10 = 2080;
    v11 = v6;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "Client resume transaction timer for %@ %s", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_serverActivityChanged
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HDHealthStoreServer__serverActivityChanged__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __45__HDHealthStoreServer__serverActivityChanged__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if ((objc_msgSend(*(id *)(v1 + 48), "hasActiveQueries") & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
      -[HDHealthStoreServer _lock_cancelActiveClientTransaction](v1);
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
    }
  }
}

uint64_t __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 72), "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userCharacteristicForType:error:", a1[5], a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  -[HDProfile unitPreferencesManager](self->_profile, "unitPreferencesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeUnitPreferenceObserver:", self);

  -[HDProfile conceptIndexManager](self->_profile, "conceptIndexManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  os_unfair_lock_lock(&self->_lock);
  -[HDHealthStoreServer _lock_cancelActiveClientTransaction]((uint64_t)self);
  -[HDHealthStoreClient invalidateAssertions](self->_client, "invalidateAssertions");
  -[HDHealthStoreClient connection](self->_client, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[HDQueryControlServer invalidate](self->_queryControlServer, "invalidate");
  -[HDClientAuthorizationOracle invalidate](self->_clientAuthorizationOracle, "invalidate");
  -[NSMutableDictionary allValues](self->_taskServerEndpointsByUUID, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeAllObjects](self->_taskServerEndpointsByUUID, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "invalidate", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_clientAuthorizationOracle, 0);
  objc_storeStrong((id *)&self->_queryControlServer, 0);
  objc_storeStrong((id *)&self->_taskServerEndpointsByUUID, 0);
  objc_storeStrong((id *)&self->_clientTransactionTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)remote_clientWillSuspendWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  HDHealthStoreClient *client;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5340], OS_LOG_TYPE_DEBUG))
  {
    client = self->_client;
    v7 = v5;
    -[HDHealthStoreClient process](client, "process");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "HDHealthStoreServer suspending connection with %{public}@", (uint8_t *)&v10, 0xCu);

    if (!v4)
      goto LABEL_6;
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDHealthStoreServer _lock_cancelActiveClientTransaction]((uint64_t)self);
    os_unfair_lock_unlock(&self->_lock);
  }
  v4[2](v4, 1, 0);
LABEL_6:

}

- (id)clientSourceWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[HDProfile sourceManager](self->_profile, "sourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createOrUpdateSourceForClient:error:", self->_client, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_saveDataObjects:(id)a3 sourceEntity:(id)a4 sourceVersion:(id)a5 handler:(id)a6
{
  -[HDHealthStoreServer _saveDataObjects:sourceEntity:sourceVersion:skipInsertionFilter:handler:creationDate:]((id *)&self->super.isa, a3, a4, a5, 0, a6, 0);
}

- (id)_objectsToInsertWithObjects:(uint64_t)a3 error:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_17;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__objectsToInsertWithObjects_error_, a1, CFSTR("HDHealthStoreServer.m"), 1040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 3, CFSTR("Array of HKObjects to save cannot be empty"));
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  v22 = v5;
  objc_msgSend(MEMORY[0x1E0CB6950], "hd_allObjectsToInsertWithObjects:", v5);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    obj = v6;
    v24 = *(_QWORD *)v26;
    while (2)
    {
      v9 = 0;
      do
      {
        v10 = a3;
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v12 = objc_msgSend(a1[10], "applicationSDKVersionToken");
        objc_msgSend(v11, "_setSourceRevision:", 0);
        objc_msgSend(a1[11], "entitlements");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "profile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "daemon");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "behavior");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isAppleWatch");
        v18 = v12;
        a3 = v10;
        LODWORD(v11) = objc_msgSend(v11, "_validateForSavingWithClientEntitlements:applicationSDKVersionToken:isAppleWatch:error:", v13, v18, v17, v10);

        if (!(_DWORD)v11)
        {
          v6 = obj;

          v19 = 0;
          goto LABEL_15;
        }
        ++v9;
      }
      while (v8 != v9);
      v6 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
        continue;
      break;
    }
  }

  v19 = v6;
LABEL_15:

  v5 = v22;
LABEL_18:

  return v19;
}

- (void)_performIfAuthorizedToSaveObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  -[HDClientAuthorizationOracle performIfAuthorizedToSaveObjects:onQueue:usingBlock:errorHandler:](self->_clientAuthorizationOracle, "performIfAuthorizedToSaveObjects:onQueue:usingBlock:errorHandler:", a3, self->_queue, a4, a5);
}

- (id)_queue_objectsByProvenanceForInsertion:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  id v44;
  void *v45;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint8_t buf[16];
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(WeakRetained, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentDeviceProductType");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("UnknownDevice");
    if (v13)
      v15 = (__CFString *)v13;
    v59 = v15;

    objc_msgSend(v12, "currentOSBuild");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("UnknownBuild");
    if (v16)
      v18 = (__CFString *)v16;
    v58 = v18;

    v65 = 0uLL;
    v66 = 0;
    if (v12)
      objc_msgSend(v12, "currentOSVersionStruct");
    if (v10)
    {
      v57 = v10;
    }
    else
    {
      objc_msgSend(a1, "client");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sourceVersion");
      v57 = (id)objc_claimAutoreleasedReturnValue();

    }
    v45 = v12;
    v42 = v10;
    v43 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[9], "deviceManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[9], "contributorManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v44 = v8;
    obj = v8;
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v53)
    {
      v48 = 0;
      v49 = 0;
      v52 = *(_QWORD *)v62;
      v51 = *MEMORY[0x1E0CB55E0];
      while (2)
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v62 != v52)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v21, "device");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v50, "deviceEntityForDevice:error:", v22, a5);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (!v23)
              goto LABEL_32;
          }
          else
          {
            v24 = v49;
            if (!v49)
            {
              objc_msgSend(v50, "deviceEntityForNoDeviceWithError:", a5);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v23 = v24;
            v49 = v23;
            if (!v23)
            {
LABEL_32:
              _HKInitializeLogging();
              v37 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v22;
                _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "Failed to retrieve device entity for device %{public}@", buf, 0xCu);
              }

              v38 = 0;
              v9 = v43;
              v8 = v44;
              v10 = v42;
              v39 = v45;
              v40 = v54;
              goto LABEL_37;
            }
          }
          v60 = v22;
          objc_msgSend(v21, "metadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v51);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (id)v26;
          }
          else
          {
            v28 = v48;
            if (!v48)
            {
              objc_msgSend(v45, "localTimeZone");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "name");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v27 = v28;
            v48 = v27;
          }
          objc_msgSend(v55, "defaultContributorReference");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = a1;
          v32 = objc_msgSend(a1[9], "currentSyncIdentityPersistentID");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v23, "persistentID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)buf = v65;
          v68 = v66;
          +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, v32, v59, v58, buf, v57, v27, v56, v33, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v54;
          objc_msgSend(v54, "objectForKeyedSubscript:", v34);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          if (!v36)
          {
            v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v36, v34);
          }
          objc_msgSend(v36, "addObject:", v21);

          a1 = v31;
        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
        if (v53)
          continue;
        break;
      }
    }
    else
    {
      v48 = 0;
      v49 = 0;
      v35 = v54;
    }

    v38 = v35;
    v40 = v35;
    v9 = v43;
    v8 = v44;
    v10 = v42;
    v39 = v45;
LABEL_37:

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

+ (void)_authenticateWithGuard:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CF9688];
  v7 = *MEMORY[0x1E0CB7630];
  v8 = a3;
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke;
  v11[3] = &unk_1E6CE77F0;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "authenticateForSubject:completion:", v9, v11);

}

void __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__HDHealthStoreServer_AppProtectionHelper___authenticateWithGuard_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (void)authenticateWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CF9690];
  v5 = a3;
  objc_msgSend(v4, "sharedGuard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_authenticateWithGuard:completion:", v6, v5);

}

- (HDHealthStoreServer)initWithClient:(id)a3 profile:(id)a4 configuration:(id)a5 connectionQueue:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  HDHealthStoreServer *v16;
  HDHealthStoreServer *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  HKHealthStoreConfiguration *configuration;
  void *v22;
  HDClientAuthorizationOracle *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  NSMutableDictionary *v29;
  NSMutableDictionary *taskServerEndpointsByUUID;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthStoreServer.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthStoreServer.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHealthStoreServer.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

LABEL_4:
  v35.receiver = self;
  v35.super_class = (Class)HDHealthStoreServer;
  v16 = -[HDHealthStoreServer init](&v35, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_connectionQueue, a6);
    objc_storeStrong((id *)&v17->_client, a3);
    v20 = objc_msgSend(v14, "copy");
    configuration = v17->_configuration;
    v17->_configuration = (HKHealthStoreConfiguration *)v20;

    objc_storeStrong((id *)&v17->_profile, a4);
    objc_msgSend(v13, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v17->_daemon, v22);

    v23 = [HDClientAuthorizationOracle alloc];
    objc_msgSend(v12, "sourceBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHealthStoreClient process](v17->_client, "process");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entitlements");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HDClientAuthorizationOracle initWithSourceBundleIdentifier:entitlements:profile:](v23, "initWithSourceBundleIdentifier:entitlements:profile:", v24, v26, v13);
    clientAuthorizationOracle = v17->_clientAuthorizationOracle;
    v17->_clientAuthorizationOracle = (HDClientAuthorizationOracle *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    taskServerEndpointsByUUID = v17->_taskServerEndpointsByUUID;
    v17->_taskServerEndpointsByUUID = v29;

  }
  return v17;
}

- (void)_lock_cancelActiveClientTransaction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("Timer cancelled"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 24), "invalidateAndInvokeCompletionWithError:", v3);
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (id)clientDebuggingIdentifier
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "debugIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)remote_createTaskServerEndpointForIdentifier:(id)a3 pluginURL:(id)a4 taskUUID:(id)a5 instanceUUID:(id)a6 configuration:(id)a7 completion:(id)a8
{
  id v14;
  void (**v15)(id, void *, id);
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  const __CFString *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  os_unfair_lock_t locka;
  os_unfair_lock_t lock;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  if (!a8)
    goto LABEL_21;
  v44 = 0;
  v15 = (void (**)(id, void *, id))a8;
  v16 = v14;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = v20;
  if (!self)
    goto LABEL_15;
  if (!v16)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = CFSTR("Nil task server identifier");
LABEL_14:
    objc_msgSend(v29, "hk_assignError:code:format:", &v44, 3, v30);
LABEL_15:
    v31 = 0;
    goto LABEL_16;
  }
  if (!v18)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = CFSTR("Nil task UUID");
    goto LABEL_14;
  }
  if (!v19)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = CFSTR("Nil instance UUID");
    goto LABEL_14;
  }
  v43 = v20;
  if (v17
    && (-[HDHealthStoreServer daemon](self, "daemon"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v22, "taskServerRegistry"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "loadTaskServersFromPluginAtURL:error:", v17, &v44),
        v23,
        v22,
        !v24))
  {
    v31 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerEndpointsByUUID, "objectForKeyedSubscript:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    if (v25)
    {
LABEL_9:
      objc_msgSend(v25, "instanceUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqual:", v19);

      if (v27)
      {
        v28 = v25;
      }
      else
      {
        locka = (os_unfair_lock_t)MEMORY[0x1E0CB35C8];
        objc_msgSend(v18, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "instanceUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "UUIDString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_unfair_lock_s hk_assignError:code:format:](locka, "hk_assignError:code:format:", &v44, 3, CFSTR("Task server endpoint for '%@' already exists (for instance '%@')"), v35, v37);

        v28 = 0;
      }
      v21 = v43;
      v31 = v28;

      goto LABEL_16;
    }
    lock = &self->_lock;
    -[HDHealthStoreServer daemon](self, "daemon");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "taskServerRegistry");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "createTaskServerEndpointForIdentifier:taskUUID:instanceUUID:configuration:client:connectionQueue:error:", v16, v18, v19, v43, self->_client, self->_connectionQueue, &v44);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      os_unfair_lock_lock(lock);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerEndpointsByUUID, "objectForKeyedSubscript:", v18);
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v25 = (void *)v40;
        os_unfair_lock_unlock(lock);

        goto LABEL_9;
      }
      objc_msgSend(v31, "setDelegate:", self);
      objc_msgSend(v31, "setTaskServerDelegate:", self);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taskServerEndpointsByUUID, "setObject:forKeyedSubscript:", v31, v18);
      os_unfair_lock_unlock(lock);
      objc_msgSend(v31, "resume");
    }
  }
  v21 = v43;
LABEL_16:

  v32 = v44;
  if (!v31)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v46 = v16;
      v47 = 2114;
      v48 = v32;
      _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Failed to create task server endpoint for identifier \"%{public}@\": %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v31, "listenerEndpoint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v34, v32);

LABEL_21:
}

- (void)taskServerDidFailToInitializeForUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskServerEndpointsByUUID, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_taskServerEndpointsByUUID, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "invalidate");

}

- (void)taskServerDidInvalidate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *taskServerEndpointsByUUID;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  taskServerEndpointsByUUID = self->_taskServerEndpointsByUUID;
  objc_msgSend(v5, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](taskServerEndpointsByUUID, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = self->_taskServerEndpointsByUUID;
  objc_msgSend(v5, "taskUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v10, "invalidate");

}

- (void)remote_createQueryServerEndpointForIdentifier:(id)a3 queryUUID:(id)a4 configuration:(id)a5 forceReactivation:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  os_unfair_lock_s *p_lock;
  void (**v13)(id, void *, id);
  id v14;
  id v15;
  id v16;
  HDQueryControlServer *queryControlServer;
  HDQueryControlServer *v18;
  HDQueryControlServer *v19;
  HDQueryControlServer *v20;
  void *v21;
  id v22;
  id v23;

  v7 = a6;
  p_lock = &self->_lock;
  v13 = (void (**)(id, void *, id))a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  os_unfair_lock_lock(p_lock);
  queryControlServer = self->_queryControlServer;
  if (!queryControlServer)
  {
    v18 = -[HDQueryControlServer initWithParentServer:connectionQueue:]([HDQueryControlServer alloc], "initWithParentServer:connectionQueue:", self, self->_connectionQueue);
    v19 = self->_queryControlServer;
    self->_queryControlServer = v18;

    queryControlServer = self->_queryControlServer;
  }
  v20 = queryControlServer;
  os_unfair_lock_unlock(p_lock);
  v23 = 0;
  -[HDQueryControlServer createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:error:](v20, "createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:error:", v16, v15, v14, v7, &v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v23;
  v13[2](v13, v21, v22);

}

- (void)performIfAuthorizedToSaveObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "setWithArray:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HDClientAuthorizationOracle performIfAuthorizedToSaveObjectsWithTypes:onQueue:usingBlock:errorHandler:](self->_clientAuthorizationOracle, "performIfAuthorizedToSaveObjectsWithTypes:onQueue:usingBlock:errorHandler:", v11, self->_queue, v10, v9);

}

- (void)performIfAuthorizedToDeleteObjectTypes:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "setWithArray:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HDClientAuthorizationOracle performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:](self->_clientAuthorizationOracle, "performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:", v11, self->_queue, v10, v9);

}

- (void)saveSamples:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v10 = 0;
  -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (v8)
  {
    -[HDHealthStoreServer _saveDataObjects:sourceEntity:sourceVersion:handler:](self, "_saveDataObjects:sourceEntity:sourceVersion:handler:", v6, v8, 0, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }

}

- (void)remote_fetchPluginServiceEndpointWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  HDHealthStoreClient *client;
  uint64_t v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  if (v8)
  {
    client = self->_client;
    v10 = *MEMORY[0x1E0CB59B0];
    v23 = 0;
    v11 = -[HDHealthStoreClient hasRequiredEntitlement:error:](client, "hasRequiredEntitlement:error:", v10, &v23);
    v12 = v23;
    if (v11)
    {
      if (v7)
      {
        -[HDProfile profileExtensionWithIdentifier:](self->_profile, "profileExtensionWithIdentifier:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HDHealthStoreClient XPCClient](self->_client, "XPCClient");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v12;
          objc_msgSend(v13, "listenerEndpointForClient:error:", v14, &v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v22;

          v8[2](v8, v15, v16);
          v12 = v16;
        }
        else
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
          objc_msgSend(WeakRetained, "daemonExtensionWithIdentifier:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[HDHealthStoreClient XPCClient](self->_client, "XPCClient");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v12;
            objc_msgSend(v15, "listenerEndpointForClient:error:", v18, &v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v21;

            v8[2](v8, v19, v20);
            v12 = v20;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Plugin \"%@\" does not export a service"), v7);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v8[2](v8, 0, v19);
          }

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("pluginIdentifier must not be nil"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, 0, v13);
      }

    }
    else
    {
      v8[2](v8, 0, v12);
    }

  }
}

- (void)remote_recalibrateEstimatesForSampleType:(id)a3 atDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = (void *)*MEMORY[0x1E0CB5150];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke;
    v17[3] = &unk_1E6CF74B0;
    v17[4] = self;
    v18 = v8;
    v19 = v11;
    v20 = v9;
    v21 = v10;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_3;
    v15[3] = &unk_1E6CF7CA8;
    v16 = v21;
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v14, v17, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
  }

}

void __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v1 + 56);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2;
  v6[3] = &unk_1E6CEEFA0;
  v6[4] = v1;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "createRecalibrateEstimatesRequestRecordForSampleType:sourceEntity:effectiveDate:handler:", v2, v4, v5, v6);

}

void __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    -[HDHealthStoreServer _clientRemoteObjectProxy](*(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientRemote_presentRecalibrateEstimatesRequestWithRecord:completion:", v4, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_clientRemoteObjectProxy
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 88), "connection");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __82__HDHealthStoreServer_remote_recalibrateEstimatesForSampleType_atDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_authorizationStatusForType:(id)a3 completion:(id)a4
{
  if (a4)
    -[HDClientAuthorizationOracle authorizationStatusForType:completion:](self->_clientAuthorizationOracle, "authorizationStatusForType:completion:", a3);
}

- (void)remote_getRequestStatusForAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  if (a5)
  {
    v8 = (void (**)(id, uint64_t, id))a5;
    v9 = a4;
    v10 = a3;
    -[HDHealthStoreServer profile](self, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "authorizationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDHealthStoreServer client](self, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sourceBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v15 = objc_msgSend(v12, "authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:error:", v14, v10, v9, &v17);

    v16 = v17;
    v8[2](v8, v15, v16);

  }
}

- (void)remote_requestPerObjectReadAuthorizationForType:(id)a3 filter:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  HDObjectAuthorizationRequestContext *v17;
  void *v18;
  id v19;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "requiresPerObjectAuthorization") & 1) != 0)
  {
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v8, self->_profile);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithProfile:", self->_profile);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v12);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke;
    v26[3] = &unk_1E6CF89B8;
    v14 = v13;
    v27 = v14;
    v15 = objc_msgSend(v11, "enumerateWithError:handler:", v28, v26);
    v16 = v28[0];
    if ((v15 & 1) != 0)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6968]), "initWithExpectedObjectType:", v8);
      v17 = -[HDObjectAuthorizationRequestContext initWithSamples:metadata:]([HDObjectAuthorizationRequestContext alloc], "initWithSamples:metadata:", v14, v21);
      -[HDObjectAuthorizationRequestContext setPersistSession:](v17, "setPersistSession:", 0);
      -[HDObjectAuthorizationRequestContext setPromptWithNoSamples:](v17, "setPromptWithNoSamples:", 1);
      -[HDObjectAuthorizationRequestContext setPromptWithAllSamples:](v17, "setPromptWithAllSamples:", 1);
      v25 = 0;
      -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;
      if (v18)
      {
        clientAuthorizationOracle = self->_clientAuthorizationOracle;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_2;
        v24[3] = &unk_1E6CFD438;
        v24[4] = self;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_239;
        v22[3] = &unk_1E6CFD460;
        v23 = v10;
        -[HDClientAuthorizationOracle enqueueObjectAuthorizationRequestWithContext:sourceEntity:promptIfNeeded:authorizationNeededHandler:completion:](clientAuthorizationOracle, "enqueueObjectAuthorizationRequestWithContext:sourceEntity:promptIfNeeded:authorizationNeededHandler:completion:", v17, v18, 1, v24, v22);

      }
      else
      {
        (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v19);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v16);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Object type %@ does not support per-object authorization."), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v11);
  }

}

uint64_t __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to determine object authorization status: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v7 = *(_QWORD **)(a1 + 32);
    v8 = (void *)v7[7];
    objc_msgSend(v7, "objectAuthorizationPromptHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleObjectAuthorizationRequestsWithPromptHandler:completion:", v9, &__block_literal_global_232);

  }
}

void __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_237(uint64_t a1, char a2, void *a3)
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

uint64_t __89__HDHealthStoreServer_remote_requestPerObjectReadAuthorizationForType_filter_completion___block_invoke_239(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a4 == 0, a4);
}

- (void)remote_requestAuthorizationToShareTypes:(id)a3 readTypes:(id)a4 shouldPrompt:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  HDClientAuthorizationOracle *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  void (**v34)(id, _QWORD, void *);
  id v35;
  BOOL v36;
  char v37;
  char v38;
  id v39;
  _QWORD aBlock[5];
  id v41;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (v12)
  {
    if (v7
      && (-[HDHealthStoreClient process](self->_client, "process"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isWidgetKitExtension"),
          v13,
          v14))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 111, CFSTR("Unable to prompt for authorization using this type of extension; ignoring request."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v15);

    }
    else
    {
      v30 = v10;
      -[HDHealthStoreClient process](self->_client, "process");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isExtension");

      WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(WeakRetained, "behavior");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isAppleWatch");

      -[HDHealthStoreClient sourceBundleIdentifier](self->_client, "sourceBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(v22, "analyticsSubmissionCoordinator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "authorization_reportAuthRequestsFromBundleIdentifier:isExtension:isAppleWatch:shouldPrompt:", v21, v17, v20, v7);

      v24 = 0;
      if ((_DWORD)v17 && (v20 & 1) == 0)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke;
        aBlock[3] = &unk_1E6D0F028;
        aBlock[4] = self;
        v41 = v21;
        v24 = _Block_copy(aBlock);

      }
      v39 = 0;
      -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v39);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v39;
      if (v25)
      {
        v29 = v21;
        clientAuthorizationOracle = self->_clientAuthorizationOracle;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_244;
        v31[3] = &unk_1E6D0F050;
        v34 = v12;
        v31[4] = self;
        v32 = v30;
        v33 = v11;
        v35 = v24;
        v36 = v7;
        v37 = v20;
        v38 = v17;
        v10 = v30;
        v28 = clientAuthorizationOracle;
        v21 = v29;
        -[HDClientAuthorizationOracle updateDefaultAuthorizationStatusesForSource:completion:](v28, "updateDefaultAuthorizationStatusesForSource:completion:", v25, v31);

      }
      else
      {
        v12[2](v12, 0, v26);
        v10 = v30;
      }

    }
  }

}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char, void *);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a3)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2;
    v23 = &unk_1E6CED3F8;
    v12 = *(_QWORD *)(a1 + 32);
    v24 = *(id *)(a1 + 40);
    v13 = v11;
    v25 = v13;
    if (v12)
    {
      v14 = *(void **)(v12 + 88);
      v15 = &v20;
      v16 = v9;
      objc_msgSend(v14, "sourceBundleIdentifier", v20, v21, v22, v23, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v12 + 72), "authorizationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "openAppForAuthorization:sessionIdentifier:completion:", v17, v16, v15);

      v13 = v25;
    }

  }
  else
  {
    if (v10)
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v10;
        _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to determine whether authorization is necessary: %{public}@", buf, 0xCu);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:", 0, 0);
  }

}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    v7 = *MEMORY[0x1E0CB5280];
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v10 = 138412546;
        v11 = v8;
        v12 = 2114;
        v13 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Unable to launch host app %@ for authorization: %{public}@", (uint8_t *)&v10, 0x16u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Did not launch host app %@ for authorization", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __97__HDHealthStoreServer_remote_requestAuthorizationToShareTypes_readTypes_shouldPrompt_completion___block_invoke_244(uint64_t a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "enqueueAuthorizationRequestToWriteTypes:readTypes:authorizationNeededHandler:requestCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    if (*(_BYTE *)(a1 + 72))
    {
      if (*(_BYTE *)(a1 + 73) || !*(_BYTE *)(a1 + 74))
      {
        -[HDHealthStoreServer _authorizationPromptHandler](*(void **)(a1 + 32));
        v3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:", v3, 0);

      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:", 0, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (id)_authorizationPromptHandler
{
  _QWORD aBlock[5];

  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke;
    aBlock[3] = &unk_1E6D0F0A0;
    aBlock[4] = a1;
    a1 = _Block_copy(aBlock);
  }
  return a1;
}

- (void)remote_handleAuthorizationForExtensionWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = (void (**)(id, _QWORD, void *))a3;
  -[HDHealthStoreClient process](self->_client, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExtension");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Cannot request authorization on behalf of an extension from within an extension."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v8);

  }
  else
  {
    v12 = 0;
    -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v9)
    {
      -[HDHealthStoreServer _authorizationPromptHandler](self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDClientAuthorizationOracle handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:](self->_clientAuthorizationOracle, "handleAuthorizationRequestsWithPromptHandler:requestCompletionHandler:", v11, v5);

    }
    else
    {
      v5[2](v5, 0, v10);
    }

  }
}

- (void)remote_beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  HDHealthStoreClient *client;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  clientAuthorizationOracle = self->_clientAuthorizationOracle;
  client = self->_client;
  v9 = a3;
  -[HDHealthStoreClient process](client, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__HDHealthStoreServer_remote_beginAuthorizationDelegateTransactionWithSessionIdentifier_handler___block_invoke;
  v12[3] = &unk_1E6D0F078;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  -[HDClientAuthorizationOracle beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:clientProcess:completion:](clientAuthorizationOracle, "beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:clientProcess:completion:", v9, v10, v12);

}

void __97__HDHealthStoreServer_remote_beginAuthorizationDelegateTransactionWithSessionIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "localSourceForBundleIdentifier:error:", v5, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v11 = v10;
    if (v9)
    {
      v15 = v10;
      objc_msgSend(v8, "clientSourceForSourceEntity:error:", v9, &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
    }
    else
    {
      if (v7)
      {
        v12 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("No source for bundle identifier \"%@\"), v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }

    v11 = v13;
LABEL_9:

    goto LABEL_10;
  }
  if (v6)
  {
    v11 = v6;
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
LABEL_10:
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v12, v11);

}

- (void)remote_endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  -[HDClientAuthorizationOracle endAuthorizationRequestDelegateTransactionWithSessionIdentifier:error:](self->_clientAuthorizationOracle, "endAuthorizationRequestDelegateTransactionWithSessionIdentifier:error:", a3, a4);
}

- (void)_performIfAuthorizedToDeleteObjects:(id)a3 usingBlock:(id)a4 errorHandler:(id)a5
{
  -[HDClientAuthorizationOracle performIfAuthorizedToDeleteObjects:onQueue:usingBlock:errorHandler:](self->_clientAuthorizationOracle, "performIfAuthorizedToDeleteObjects:onQueue:usingBlock:errorHandler:", a3, self->_queue, a4, a5);
}

void __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke_2;
  v9[3] = &unk_1E6CE7868;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  +[HDHealthStoreServer authenticateWithCompletion:](HDHealthStoreServer, "authenticateWithCompletion:", v9);

}

void __50__HDHealthStoreServer__authorizationPromptHandler__block_invoke_2(uint64_t *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    -[HDHealthStoreServer _clientRemoteObjectProxy](a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientRemote_presentAuthorizationWithRequestRecord:completion:", a1[5], a1[6]);

  }
  else
  {
    if (v5)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      {
        v9 = a1[4];
        v10 = 138543618;
        v11 = v9;
        v12 = 2114;
        v13 = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v10, 0x16u);
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (id)objectAuthorizationPromptHandler
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke;
  aBlock[3] = &unk_1E6D0F0C8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

void __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke_2;
  v10[3] = &unk_1E6CF1D98;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v10[4] = v7;
  v8 = v5;
  v9 = v6;
  +[HDHealthStoreServer authenticateWithCompletion:](HDHealthStoreServer, "authenticateWithCompletion:", v10);

}

void __55__HDHealthStoreServer_objectAuthorizationPromptHandler__block_invoke_2(uint64_t *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_6;
  }
  if ((a2 & 1) == 0)
  {
LABEL_6:
    (*(void (**)(void))(a1[6] + 16))();
    goto LABEL_7;
  }
  -[HDHealthStoreServer _clientRemoteObjectProxy](a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientRemote_presentAuthorizationWithSession:completion:", a1[5], a1[6]);

LABEL_7:
}

- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 creationDateOverride:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16 = 0;
  -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;
  v15 = -[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB4A90]);
  if (v11 && !v15)
  {

    v11 = 0;
  }
  if (v13)
  {
    -[HDHealthStoreServer _saveDataObjects:sourceEntity:sourceVersion:skipInsertionFilter:handler:creationDate:]((id *)&self->super.isa, v10, v13, 0, a4 & -[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB5EE0]), v12, v11);
  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v14);
  }

}

- (void)_saveDataObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersion:(char)a5 skipInsertionFilter:(void *)a6 handler:(void *)a7 creationDate:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = v17;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate_, a1, CFSTR("HDHealthStoreServer.m"), 1086, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

      v17 = v35;
    }
    v51 = 0;
    -[HDHealthStoreServer _objectsToInsertWithObjects:error:](a1, v13, (uint64_t)&v51);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v51;
    v20 = v19;
    if (v18)
    {
      v37 = v19;
      v41 = v13;
      v21 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke;
      v44[3] = &unk_1E6D0F168;
      v44[4] = a1;
      v22 = v18;
      v45 = v22;
      v40 = v14;
      v46 = v14;
      v39 = v15;
      v47 = v15;
      v50 = a5;
      v38 = v17;
      v48 = v17;
      v49 = v16;
      v42[0] = v21;
      v42[1] = 3221225472;
      v42[2] = __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke_2;
      v42[3] = &unk_1E6CF7CA8;
      v43 = v49;
      objc_msgSend(a1, "_performIfAuthorizedToSaveObjects:usingBlock:errorHandler:", v22, v44, v42);
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A98]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22;
      v25 = v23;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v53;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v53 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v31, "quantityType");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqual:", v25);

              if ((v33 & 1) != 0)
              {

                objc_msgSend(a1[9], "unitPreferencesManager");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setPreferredUnitToDefaultIfNotSetForType:", v25);

                goto LABEL_17;
              }
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          if (v28)
            continue;
          break;
        }
      }

LABEL_17:
      v14 = v40;
      v13 = v41;
      v15 = v39;
      v20 = v37;
      v17 = v38;
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v16 + 2))(v16, 0, v19);
    }

  }
}

void __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  char v7;
  char v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  char v13;
  int v14;
  void (*v15)(void);
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v2, "clientSourceWithError:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  v5 = *(id **)(a1 + 32);
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained(v5 + 8);
    objc_msgSend(WeakRetained, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAppleWatch");

    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "hasEntitlement:", *MEMORY[0x1E0CB59B0]);
    v14 = v12 ^ 1;
    if (v4)
      v14 = 1;
    if (v14)
      v9 = v4;
    else
      v9 = 0;
    if ((v14 & 1) == 0 && (v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 4, CFSTR("Authorization from parent application required"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  v6 = *(void **)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 64);
  v16 = v4;
  v8 = -[HDHealthStoreServer _queue_insertObjects:sourceEntity:sourceVersionOverride:shouldJournal:skipInsertionFilter:error:creationDate:](v5, v6, v3, 0, 0, v7, (uint64_t)&v16, 0);
  v9 = v16;

  if ((v8 & 1) == 0 && (objc_msgSend(v9, "hk_isDatabaseAccessibilityError") & 1) == 0)
  {
LABEL_13:
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  v15 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_14:
  v15();

}

- (uint64_t)_queue_insertObjects:(void *)a3 sourceEntity:(void *)a4 sourceVersionOverride:(char)a5 shouldJournal:(char)a6 skipInsertionFilter:(uint64_t)a7 error:(void *)a8 creationDate:
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double Current;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  char v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  double v37;
  char v38;
  char v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  double v44;
  char v45;

  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = v18;
  if (!a1)
    goto LABEL_10;
  if (v18)
    MEMORY[0x1BCCAAF70](v18);
  else
    Current = CFAbsoluteTimeGetCurrent();
  v21 = Current;
  objc_msgSend(a1[9], "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 1500, CFSTR("Nil healthDatabase"));
LABEL_10:
    v28 = 0;
    goto LABEL_11;
  }
  v31 = a5;
  v32 = v19;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "client");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accessibilityAssertions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v23, "addAccessibilityAssertions:", v25);
  objc_msgSend(a1[9], "database");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v23;
  v27 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke;
  v40[3] = &unk_1E6CFE5A8;
  v40[4] = a1;
  v41 = v15;
  v42 = v16;
  v43 = v17;
  v44 = v21;
  v45 = a6;
  v33[0] = v27;
  v33[1] = 3221225472;
  v33[2] = __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_3;
  v33[3] = &unk_1E6D0F1B8;
  v38 = v31;
  v33[4] = a1;
  v34 = v41;
  v35 = v42;
  v36 = v43;
  v37 = v21;
  v39 = a6;
  v28 = objc_msgSend(v26, "performTransactionWithContext:error:block:inaccessibilityHandler:", v30, a7, v40, v33);

  v19 = v32;
LABEL_11:

  return v28;
}

uint64_t __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_saveDataObjects:(id)a3 skipInsertionFilter:(BOOL)a4 transactionIdentifier:(id)a5 final:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  HDProfile *profile;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  id v23;
  id *v24;
  id v25;
  char v26;
  void *v27;
  uint64_t v28;
  id *v29;
  id v30;
  char v31;
  id v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  id obj;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  id v62;
  id v63;
  uint64_t v64;
  id *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v12 = a5;
  v13 = a7;
  v14 = -[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB5EE0]);
  if (v13)
  {
    v15 = v14;
    v64 = 0;
    v65 = (id *)&v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__195;
    v68 = __Block_byref_object_dispose__195;
    v69 = 0;
    v63 = 0;
    -[HDHealthStoreServer _objectsToInsertWithObjects:error:]((id *)&self->super.isa, v39, (uint64_t)&v63);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v69, v63);
    if (!v38)
    {
      (*((void (**)(id, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, v65[5]);
LABEL_24:

      _Block_object_dispose(&v64, 8);
      goto LABEL_25;
    }
    profile = self->_profile;
    if (v12)
    {
      -[HDProfile database](profile, "database");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extendedDatabaseTransactionForIdentifier:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = 0;
LABEL_20:
        (*((void (**)(id, _QWORD, BOOL, id))v13 + 2))(v13, 0, v12 != 0, v19);
        goto LABEL_24;
      }
    }
    else
    {
      -[HDProfile database](profile, "database");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v65;
      v62 = v65[5];
      objc_msgSend(v20, "beginExtendedTransactionWithContext:transactionTimeout:continuationTimeout:error:", v21, &v62, 30.0, 2.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v22 + 5, v62);

      if (!v18)
      {
        v19 = v65[5];
        goto LABEL_20;
      }
    }
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__195;
    v56 = __Block_byref_object_dispose__195;
    v57 = 0;
    v23 = v65[5];
    v65[5] = 0;

    v24 = v65;
    obj = v65[5];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke;
    v42[3] = &unk_1E6D0F140;
    v42[4] = self;
    v43 = v38;
    v48 = a4;
    v49 = v15;
    v25 = v18;
    v50 = a6;
    v44 = v25;
    v45 = &v52;
    v46 = &v58;
    v47 = &v64;
    v26 = objc_msgSend(v25, "performInTransactionWithErrorOut:block:", &obj, v42);
    objc_storeStrong(v24 + 5, obj);
    if ((v26 & 1) == 0)
    {
      v27 = (void *)v53[5];
      v53[5] = 0;

    }
    v28 = v53[5];
    if (!v28)
    {
      v29 = v65;
      if (v65[5])
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Rollback due to performInTransactionWithErrorOut:block: failed"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        v31 = objc_msgSend(v25, "rollbackDueToError:errorOut:", v30, &v40);
        v32 = v40;
        v33 = v40;
        if ((v31 & 1) == 0)
        {
          _HKInitializeLogging();
          v34 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v71 = v33;
            _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Failed to roll back extended transaction: %{public}@", buf, 0xCu);
          }
          objc_storeStrong(v65 + 5, v32);
        }
        if (!v65[5])
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Save transaction failed with an unknown error."));
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v65[5];
          v65[5] = (id)v35;

        }
      }
      else
      {
        v41 = 0;
        objc_msgSend(v25, "commitWithErrorOut:", &v41);
        v37 = v41;
        v30 = v29[5];
        v29[5] = v37;
      }

      v28 = v53[5];
    }
    (*((void (**)(id, uint64_t, _QWORD, id))v13 + 2))(v13, v28, *((unsigned __int8 *)v59 + 24), v65[5]);

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    goto LABEL_24;
  }
LABEL_25:

}

uint64_t __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  _QWORD v19[4];
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  char v26;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 80))
    v4 = *(_BYTE *)(a1 + 81) != 0;
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 48), "transactionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(a1 + 82);
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2;
  v16[3] = &unk_1E6D0F118;
  v17 = *(_OWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 72);
  v8 = v2;
  v9 = v5;
  v10 = v16;
  v11 = v10;
  if (v3)
  {
    v12 = *(void **)(v3 + 56);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke;
    v21[3] = &unk_1E6D0F0F0;
    v21[4] = v3;
    v13 = v10;
    v24 = v13;
    v14 = v8;
    v22 = v14;
    v25 = v4;
    v26 = v6;
    v23 = v9;
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __105__HDHealthStoreServer__saveValidatedDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2;
    v19[3] = &unk_1E6CF7CA8;
    v20 = v13;
    objc_msgSend(v12, "performIfAuthorizedToSaveObjects:onQueue:usingBlock:errorHandler:", v14, 0, v21, v19);

  }
  return 1;
}

void __102__HDHealthStoreServer_remote_saveDataObjects_skipInsertionFilter_transactionIdentifier_final_handler___block_invoke_2(_QWORD *a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

void __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(id **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 80);
  v10 = 0;
  v7 = -[HDHealthStoreServer _queue_insertObjects:sourceEntity:sourceVersionOverride:shouldJournal:skipInsertionFilter:error:creationDate:](v2, v3, v4, v5, 1, v6, (uint64_t)&v10, *(void **)(a1 + 64));
  v8 = v10;
  v9 = *(_QWORD *)(a1 + 72);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);

}

uint64_t __108__HDHealthStoreServer__saveDataObjects_sourceEntity_sourceVersion_skipInsertionFilter_handler_creationDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  int v12;
  uint64_t v13;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "dataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v15 = v4;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = v6;
          v16 = v5;
          v12 = HKWithAutoreleasePool();

          if (!v12)
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
      v13 = 1;
LABEL_12:
      v4 = v15;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 48), "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v4, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), 1, 0, a2, *(double *)(a1 + 56));

  return v5;
}

uint64_t __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_3(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 72))
  {
    -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), (uint64_t)a3);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = v7;
          v13 = HKWithAutoreleasePool();

          if (!v13)
          {
            v14 = 0;
            goto LABEL_16;
          }
        }
        v9 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
      v14 = 1;
    }
    else
    {
      v14 = 1;
    }
LABEL_16:

  }
  else
  {
    v15 = v5;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v14 = 0;
  }

  return v14;
}

BOOL __132__HDHealthStoreServer__queue_insertObjects_sourceEntity_sourceVersionOverride_shouldJournal_skipInsertionFilter_error_creationDate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  HDDataEntityInsertionContext *v5;
  _BOOL8 v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDDataEntityInsertionContext initWithProvenance:creationDate:skipInsertionFilter:resolveAssociations:profile:]([HDDataEntityInsertionContext alloc], "initWithProvenance:creationDate:skipInsertionFilter:resolveAssociations:profile:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72), *(double *)(a1 + 56));
  v6 = +[HDDataEntity journalObjects:insertionContext:profile:error:](HDDataEntity, "journalObjects:insertionContext:profile:error:", v4, v5, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72), a2);

  return v6;
}

- (id)_permissionBlockForRestrictedSourceEntities:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "hk_map:", &__block_literal_global_288);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_2;
    aBlock[3] = &unk_1E6D0F248;
    v10 = v4;
    v11 = v5;
    v12 = a1;
    v6 = v5;
    v7 = _Block_copy(aBlock);
    a1 = _Block_copy(v7);

  }
  return a1;
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_3;
  v14 = &unk_1E6D0F200;
  v18 = &v19;
  v15 = *(id *)(a1 + 32);
  v7 = v6;
  v16 = v7;
  v17 = *(id *)(a1 + 40);
  v8 = _Block_copy(&v11);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:", v5, 0, v8, &__block_literal_global_290, v11, v12, v13, v14);
  v9 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __67__HDHealthStoreServer__permissionBlockForRestrictedSourceEntities___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = 1;
  if (a2)
  {
    v2 = result;
    if (*(_QWORD *)(result + 32))
    {
      result = objc_msgSend(*(id *)(result + 40), "isSubsetOfSet:", *(_QWORD *)(result + 48));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 56) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)remote_deleteDataObjects:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  unint64_t v22;
  _QWORD aBlock[4];
  id v24;

  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke;
  aBlock[3] = &unk_1E6CE77F0;
  v24 = v10;
  v12 = _Block_copy(aBlock);
  if (objc_msgSend(v9, "count"))
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_2;
    v19[3] = &unk_1E6D0F270;
    v19[4] = self;
    v22 = a4;
    v20 = v9;
    v21 = v12;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_3;
    v17[3] = &unk_1E6CF7CA8;
    v18 = v21;
    -[HDHealthStoreServer _performIfAuthorizedToDeleteObjects:usingBlock:errorHandler:](self, "_performIfAuthorizedToDeleteObjects:usingBlock:errorHandler:", v20, v19, v17);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = objc_opt_class();
    v15 = "empty";
    if (!v9)
      v15 = "nil";
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, CFSTR("dataObjects cannot be %s"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v12 + 2))(v12, 0, v16);

  }
}

uint64_t __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  HDDataDeletionConfiguration *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "sourceBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "allSourcesForBundleIdentifier:error:", v4, &v14);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v14;
    v8 = v7;
    if (!v6)
      goto LABEL_11;

    v4 = (void *)v6;
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 32), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v9 = objc_alloc_init(HDDataDeletionConfiguration);
  -[HDDataDeletionConfiguration setSecureDelete:](v9, "setSecureDelete:", 1);
  -[HDDataDeletionConfiguration setFailIfNotFound:](v9, "setFailIfNotFound:", 1);
  -[HDDataDeletionConfiguration setRecursiveDeleteAuthorizationBlock:](v9, "setRecursiveDeleteAuthorizationBlock:", v5);
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "sourceBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataDeletionConfiguration setRestrictedSourceBundleIdentifier:](v9, "setRestrictedSourceBundleIdentifier:", v10);

  }
  -[HDDataDeletionConfiguration setUserRequested:](v9, "setUserRequested:", (*(_QWORD *)(a1 + 56) >> 1) & 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "dataManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v11, "deleteObjectsWithUUIDCollection:configuration:error:", v12, v9, &v13);
  v8 = v13;

LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __64__HDHealthStoreServer_remote_deleteDataObjects_options_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_deleteDataObjectsOfType:(id)a3 matchingFilter:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    clientAuthorizationOracle = self->_clientAuthorizationOracle;
    v15 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke;
    v23[3] = &unk_1E6D0F2B8;
    v23[4] = self;
    v26 = v13;
    v24 = v12;
    v25 = v11;
    v27 = a5;
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_3;
    v21[3] = &unk_1E6CF7CA8;
    v22 = v26;
    -[HDClientAuthorizationOracle performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:](clientAuthorizationOracle, "performIfAuthorizedToDeleteObjectsWithTypes:onQueue:usingBlock:errorHandler:", v17, queue, v23, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("objectType cannot be nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v20);

  }
}

void __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;

  if (!a2)
  {
    v3 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "sourceBundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_8:
    v5 = 0;
    v22 = 0;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v4, "allSourcesForBundleIdentifier:error:", v3, &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;

  v22 = v6;
  if (!v5)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v7 + 16))(v7, 0, 0, v6);
    v5 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "hk_map:", &__block_literal_global_300_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v3;
  if (v8)
  {
    HDDataEntityPredicateForSourceIdentifierSet(7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "predicateWithProfile:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataType(*(void **)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v5;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 32), v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v27 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "dataManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "dataObjectClass"), "hd_dataEntityClass");
  v17 = *MEMORY[0x1E0D29968];
  v26 = v22;
  LOBYTE(v21) = 1;
  v18 = objc_msgSend(v15, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", v16, v13, v17, &v27, 1, 1, v21, v14, &v26);
  v19 = v26;

  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v20 + 16))(v20, v18, v27, v19);

}

uint64_t __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

uint64_t __85__HDHealthStoreServer_remote_deleteDataObjectsOfType_matchingFilter_options_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)remote_isProtectedDataAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke;
  v10[3] = &unk_1E6CE8C48;
  v10[4] = self;
  v11 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke_2;
  v8[3] = &unk_1E6CF7CA8;
  v6 = v11;
  v9 = v6;
  v7 = v6;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v10, v8);
    v7 = v9;
  }

}

void __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, objc_msgSend(v6, "isInSession"), 0);

}

uint64_t __55__HDHealthStoreServer_remote_isProtectedDataAvailable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_remote_associateSampleUUIDs:(id)a3 withSampleUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HDHealthStoreServer *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke;
  v18[3] = &unk_1E6CE7E08;
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2;
  v16[3] = &unk_1E6CF7CA8;
  v14 = v22;
  v17 = v14;
  v15 = v14;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v18, v16);
    v15 = v17;
  }

}

void __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 48), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v2, v3, 0, 0, &v10, v4, &v9);
  v6 = v10;
  v7 = v9;

  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, _BOOL8, id))(v8 + 16))(v8, v5, v7);

}

uint64_t __78__HDHealthStoreServer__remote_associateSampleUUIDs_withSampleUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)_remote_saveObjects:(id)a3 deleteObjects:(id)a4 associations:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke;
  v22[3] = &unk_1E6CFA0F0;
  v22[4] = self;
  v15 = v10;
  v23 = v15;
  v26 = v13;
  v16 = v11;
  v24 = v16;
  v17 = v12;
  v25 = v17;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke_2;
  v20[3] = &unk_1E6CF7CA8;
  v18 = v26;
  v21 = v18;
  v19 = v18;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v22, v20);
    v19 = v21;
  }

}

void __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  HDInsertDeleteAndAssociateObjectsOperation *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    v17 = 0;
    objc_msgSend(v2, "clientSourceWithError:", &v17);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
    v6 = v5;
    if (v4)
    {
      v16 = 0;
      -[HDHealthStoreServer _queue_objectsByProvenanceForInsertion:sourceEntity:sourceVersionOverride:error:]((id *)v2, v3, v4, 0, (uint64_t)&v16);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
      if (v2)
      {
        v8 = 0;
      }
      else
      {
        v9 = v7;
        v8 = v9;
        if (v9)
          v10 = objc_retainAutorelease(v9);

        v2 = 0;
        v7 = v8;
      }
    }
    else
    {
      v7 = v5;
      if (v7)
      {
        v7 = objc_retainAutorelease(v7);
        v8 = v7;
      }
      else
      {
        v8 = 0;
      }
      v2 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  v11 = v8;
  if (v2)
  {
    v12 = -[HDInsertDeleteAndAssociateObjectsOperation initWithObjectsToInsertByDataProvenance:objectsToDelete:associations:]([HDInsertDeleteAndAssociateObjectsOperation alloc], "initWithObjectsToInsertByDataProvenance:objectsToDelete:associations:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", v13, &v15);
    v14 = v15;

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v11 = v14;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __81__HDHealthStoreServer__remote_saveObjects_deleteObjects_associations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setBackgroundDeliveryFrequency:(int64_t)a3 forDataType:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  HDHealthStoreClient *client;
  void *v25;
  void *v26;
  void *v27;
  HDHealthStoreClient *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = -[HKHealthStoreConfiguration applicationSDKVersionToken](self->_configuration, "applicationSDKVersionToken");
  v12 = dyld_version_token_at_least();
  -[HDHealthStoreClient entitlements](self->_client, "entitlements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasBackgroundDeliveryAPIAccess");

  if (v14)
    v15 = 1;
  else
    v15 = v12 == 0;
  if (!v15)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
    {
      v32 = (void *)*MEMORY[0x1E0CB5130];
      *(_DWORD *)buf = 138543362;
      v40 = v32;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Missing %{public}@ entitlement.", buf, 0xCu);
    }
    -[HDProfile dataManager](self->_profile, "dataManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    client = self->_client;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke;
    v37[3] = &unk_1E6CE7DE0;
    v38 = v10;
    objc_msgSend(v23, "setBackgroundObserverFrequency:forDataType:frequency:appSDKVersionToken:completion:", client, 0, a3, v11, v37);

    v20 = v38;
    goto LABEL_19;
  }
  if ((HDBackgroundObservationSupportedForDataTypeCode(objc_msgSend(v9, "code")) & 1) != 0 || ((v12 ^ 1) & 1) != 0)
  {
    -[HDHealthStoreClient process](self->_client, "process");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applicationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      -[HDHealthStoreClient process](self->_client, "process");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v30 = *MEMORY[0x1E0CB5288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v20;
        _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Unable to get bundle ID for %{public}@", buf, 0xCu);
        if (!v10)
          goto LABEL_19;
      }
      else if (!v10)
      {
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Unable to get bundle ID for %@."), v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v31);

      goto LABEL_19;
    }
    -[HDProfile dataManager](self->_profile, "dataManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self->_client;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke_308;
    v35[3] = &unk_1E6CE7DE0;
    v36 = v10;
    objc_msgSend(v27, "setBackgroundObserverFrequency:forDataType:frequency:appSDKVersionToken:completion:", v28, v9, a3, v11, v35);

    v20 = v36;
LABEL_19:

    goto LABEL_20;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x1E0CB5288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
  {
    v33 = v16;
    objc_msgSend(v9, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v34;
    _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "%{public}@ data type is not supported for Background Delivery", buf, 0xCu);

    if (!v10)
      goto LABEL_20;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    objc_msgSend(v9, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, CFSTR("Background Delivery is not available for %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);
    goto LABEL_19;
  }
LABEL_20:

}

void __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Missing %@ entitlement."), *MEMORY[0x1E0CB5130]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __81__HDHealthStoreServer_remote_setBackgroundDeliveryFrequency_forDataType_handler___block_invoke_308(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)remote_closeTransactionWithDataTypes:(id)a3 anchor:(id)a4 ackTime:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  HDHealthStoreClient *client;
  void (**v14)(id, uint64_t, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v11 = a4;
  v12 = a5;
  client = self->_client;
  v14 = (void (**)(id, uint64_t, _QWORD))a6;
  -[HDHealthStoreClient process](client, "process");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applicationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HDProfile appSubscriptionManager](self->_profile, "appSubscriptionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ackForBundleID:dataTypes:anchor:ackTime:", v16, v19, v11, v12);

    v14[2](v14, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No valid application identifier found."));
    v18 = objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v18);

    v14 = (void (**)(id, uint64_t, _QWORD))v18;
  }

}

- (void)remote_deleteAllSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  HDHealthStoreServer *v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__195;
  v30 = __Block_byref_object_dispose__195;
  v31 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke;
  v18[3] = &unk_1E6D0F2E0;
  v15 = v11;
  v19 = v15;
  v24 = a5;
  v16 = v12;
  v20 = v16;
  v21 = self;
  v22 = &v26;
  v23 = &v32;
  v25 = a2;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2;
  v17[3] = &unk_1E6D0F308;
  v17[4] = &v26;
  if (self)
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v18, v17);
  if (v13)
    v13[2](v13, *((unsigned __int8 *)v33 + 24), v27[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

void __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id obj;
  id v19;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 80), CFSTR("sampleTypes may not be empty"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return;
  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "sourceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v19 = 0;
      objc_msgSend(v6, "allSourcesForBundleIdentifier:error:", v7, &v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v19;
      v10 = v19;

      v11 = v8 != 0;
      if (!v8)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);

    }
    else
    {
      v8 = 0;
      v11 = 1;
    }
    -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 48), v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_12;
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = (*(_QWORD *)(a1 + 72) >> 1) & 1;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v16 + 40);
  v17 = objc_msgSend(v12, "deleteSamplesWithTypes:sourceBundleIdentifier:userRequested:recursiveDeleteAuthorizationBlock:error:", v13, v14, v15, v2, &obj);
  objc_storeStrong((id *)(v16 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v17;

LABEL_12:
}

void __98__HDHealthStoreServer_remote_deleteAllSamplesWithTypes_sourceBundleIdentifier_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)remote_deleteClientSourceWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = (void *)*MEMORY[0x1E0CB5F38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke;
    v11[3] = &unk_1E6CF7C30;
    v11[4] = self;
    v12 = v5;
    v13 = a2;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke_317;
    v9[3] = &unk_1E6CF7CA8;
    v10 = v12;
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v8, v11, v9);

  }
}

void __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v5 = objc_msgSend(v4, "deleteSourceWithBundleIdentifier:error:", v3, &v16);
    v6 = v16;

    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52B0];
    v8 = *MEMORY[0x1E0CB52B0];
    if (v5)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_9;
      }
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      v10 = v7;
      objc_msgSend(v9, "process");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v3;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" deleted source %{public}@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v15 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      v10 = v7;
      objc_msgSend(v15, "process");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      v19 = 2114;
      v20 = v3;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" failed to deleted source %{public}@: %{public}@", buf, 0x20u);
    }

    goto LABEL_8;
  }
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("bundleIdentifier"), objc_opt_class(), *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

LABEL_9:
}

uint64_t __63__HDHealthStoreServer_remote_deleteClientSourceWithCompletion___block_invoke_317(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_deleteObjectsWithUUIDs:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  HDHealthStoreServer *v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  SEL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v9 = a3;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__195;
  v25 = __Block_byref_object_dispose__195;
  v26 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke;
  v14[3] = &unk_1E6D0F330;
  v12 = v9;
  v15 = v12;
  v16 = self;
  v17 = &v27;
  v18 = &v21;
  v19 = a4;
  v20 = a2;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke_2;
  v13[3] = &unk_1E6D0F308;
  v13[4] = &v21;
  if (self)
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v14, v13);
  if (v10)
    v10[2](v10, *((unsigned __int8 *)v28 + 24), v22[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id obj;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      -[HDHealthStoreServer _permissionBlockForRestrictedSourceEntities:](*(void **)(a1 + 40), 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "dataManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (*(_QWORD *)(a1 + 64) >> 1) & 1;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    v10 = objc_msgSend(v6, "deleteSamplesWithUUIDs:userRequested:recursiveDeleteAuthorizationBlock:error:", v7, v8, v2, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 72), CFSTR("uuids array may not be empty"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __72__HDHealthStoreServer_remote_deleteObjectsWithUUIDs_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__HDHealthStoreServer_remote_fetchCharacteristicWithDataType_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hk_isAuthorizationDeniedError"))
    v3 = 0;
  else
    v3 = v4;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v3);

}

- (void)remote_setCharacteristic:(id)a3 forDataType:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  HDHealthStoreServer *v21;
  id v22;
  id v23;
  SEL v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke;
  v19[3] = &unk_1E6CED420;
  v13 = v10;
  v20 = v13;
  v21 = self;
  v14 = v9;
  v22 = v14;
  v23 = v11;
  v24 = a2;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke_323;
  v17[3] = &unk_1E6CF7CA8;
  v15 = v23;
  v18 = v15;
  v16 = v15;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v19, v17);
    v16 = v18;
  }

}

void __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    objc_msgSend(*(id *)(a1[5] + 72), "userCharacteristicsManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = a1[6];
    v4 = a1[4];
    v10 = 0;
    objc_msgSend(v2, "setUserCharacteristic:forType:error:", v3, v4, &v10);
    v5 = v10;

    v6 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[8], CFSTR("dataType may not be nil"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)a1[4];
      v9 = v7;
      *(_DWORD *)buf = 134218242;
      v12 = objc_msgSend(v8, "code");
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Error setting characteristic for data type %ld: %{public}@", buf, 0x16u);

    }
    v6 = *(void (**)(void))(a1[7] + 16);
  }
  v6();

}

uint64_t __68__HDHealthStoreServer_remote_setCharacteristic_forDataType_handler___block_invoke_323(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_fetchModificationDateForCharacteristicWithDataType:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  HDHealthStoreServer *v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke;
  v15[3] = &unk_1E6CED448;
  v10 = v7;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v19 = a2;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke_324;
  v13[3] = &unk_1E6CF7CA8;
  v11 = v18;
  v14 = v11;
  v12 = v11;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v15, v13);
    v12 = v14;
  }

}

void __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    objc_msgSend(*(id *)(a1[5] + 72), "userCharacteristicsManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = a1[4];
    v7 = 0;
    objc_msgSend(v2, "modificationDateForCharacteristicWithType:error:", v3, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("dataType may not be nil"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Error retrieving modification date for data type: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __89__HDHealthStoreServer_remote_fetchModificationDateForCharacteristicWithDataType_handler___block_invoke_324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setHealthLiteValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0CB5160];
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke;
  v18[3] = &unk_1E6CE7E08;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E6CF7CA8;
  v17 = v21;
  v13 = v21;
  v14 = v9;
  v15 = v8;
  -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v11, v18, v16);

}

void __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "healthLiteUserDefaultsDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1[5];
  v5 = a1[6];
  v13 = 0;
  v6 = objc_msgSend(v3, "setNumber:forKey:error:", v4, v5, &v13);
  v7 = v13;
  if ((_DWORD)v6)
  {
    v8 = objc_loadWeakRetained((id *)(a1[4] + 64));
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isAppleWatch");

    if (v10)
    {
      objc_msgSend(*(id *)(a1[4] + 72), "nanoSyncManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("HealthLite key/value update"), 0);

    }
  }
  v12 = a1[7];
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v6, v7);

}

uint64_t __67__HDHealthStoreServer_remote_setHealthLiteValue_forKey_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)remote_getHealthLiteValueForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0CB5160];
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke;
  v14[3] = &unk_1E6CEA160;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke_2;
  v12[3] = &unk_1E6CF7CA8;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, v8, v14, v12);

}

void __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "healthLiteUserDefaultsDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1[5];
  v8 = 0;
  objc_msgSend(v3, "numberForKey:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);

}

uint64_t __66__HDHealthStoreServer_remote_getHealthLiteValueForKey_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)remote_fetchServerURLForAssetType:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke;
  v14[3] = &unk_1E6CE9C08;
  v9 = v6;
  v15 = v9;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke_2;
  v12[3] = &unk_1E6CF7CA8;
  v10 = v16;
  v13 = v10;
  v11 = v10;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v14, v12);
    v11 = v13;
  }

}

void __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;

  ASServerURLForAssetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v2, v3);

}

uint64_t __68__HDHealthStoreServer_remote_fetchServerURLForAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)remote_setServerURL:(id)a3 forAssetType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke;
  v18[3] = &unk_1E6CEA160;
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v21 = v10;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke_2;
  v16[3] = &unk_1E6CF7CA8;
  v14 = v21;
  v17 = v14;
  v15 = v14;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v18, v16);
    v15 = v17;
  }

}

uint64_t __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  ASSetAssetServerURLForAssetType();
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __67__HDHealthStoreServer_remote_setServerURL_forAssetType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HDHealthStoreServer clientDebuggingIdentifier](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[HDHealthStoreServer clientDebuggingIdentifier](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" [%@]"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E6D11BB8;
  }

  -[HDHealthStoreClient process](self->_client, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%d)%@"), v9, objc_msgSend(v7, "processIdentifier"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __58__HDHealthStoreServer_remote_clientResumedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD aBlock[4];
  id v23;
  id v24;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && objc_msgSend(*(id *)(v2 + 48), "hasActiveQueries"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    if (v3)
    {
      v5 = (os_unfair_lock_s *)(v3 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 32));
      -[HDHealthStoreServer _lock_cancelActiveClientTransaction](v3);
      objc_msgSend(*(id *)(v3 + 88), "process");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke;
      aBlock[3] = &unk_1E6CF7C80;
      v23 = v7;
      v24 = v4;
      v9 = v7;
      v10 = _Block_copy(aBlock);
      v11 = objc_alloc(MEMORY[0x1E0CB6F98]);
      v12 = *(_QWORD *)(v3 + 16);
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_337;
      v20[3] = &unk_1E6CE77F0;
      v13 = v10;
      v21 = v13;
      v14 = objc_msgSend(v11, "initWithQueue:completion:", v12, v20);
      v15 = *(void **)(v3 + 24);
      *(_QWORD *)(v3 + 24) = v14;

      v16 = *(void **)(v3 + 24);
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_2;
      v18[3] = &unk_1E6CE7DE0;
      v19 = v13;
      v17 = v13;
      objc_msgSend(v16, "startWithTimeoutInterval:handler:", v18, 29.0);
      os_unfair_lock_unlock(v5);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_337(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__HDHealthStoreServer__holdActiveClientTransactionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setPreferredUnit:(id)a3 forType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, HDHealthStoreServer *, id);
  _BOOL4 v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, HDHealthStoreServer *, id))a5;
  v16 = 0;
  if (self)
  {
    v11 = -[HDHealthStoreClient hasRequiredEntitlement:error:](self->_client, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], &v16);
    v12 = v16;
    v13 = v12;
    if (v11)
    {

      -[HDProfile unitPreferencesManager](self->_profile, "unitPreferencesManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      self = (HDHealthStoreServer *)objc_msgSend(v14, "setPreferredUnit:forType:error:", v8, v9, &v15);
      v13 = v15;

    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  v10[2](v10, self, v13);

}

- (void)remote_removePreferredUnitForType:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, HDHealthStoreServer *, _QWORD);
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, HDHealthStoreServer *, _QWORD))a4;
  v15 = 0;
  if (self)
  {
    v8 = -[HDHealthStoreClient hasRequiredEntitlement:error:](self->_client, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], &v15);
    v9 = v15;
    v10 = v9;
    if (v8)
    {
      -[HDProfile unitPreferencesManager](self->_profile, "unitPreferencesManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v10;
      self = (HDHealthStoreServer *)objc_msgSend(v11, "removePreferredUnitForType:error:", v6, &v14);
      v12 = v14;

      if ((_DWORD)self)
        v13 = 0;
      else
        v13 = v12;
      v10 = v12;
    }
    else
    {
      self = 0;
      v13 = v9;
    }
  }
  else
  {
    v10 = 0;
    v13 = 0;
  }
  ((void (**)(id, HDHealthStoreServer *, id))v7)[2](v7, self, v13);

}

- (void)remote_fetchUnitPreferencesForTypes:(id)a3 version:(int64_t)a4 withCompletion:(id)a5
{
  HDProfile *profile;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  HDClientAuthorizationOracle *clientAuthorizationOracle;
  void *v13;
  id v14;
  id v15;

  profile = self->_profile;
  v9 = (void (**)(id, void *, id))a5;
  v10 = a3;
  -[HDProfile unitPreferencesManager](profile, "unitPreferencesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  clientAuthorizationOracle = self->_clientAuthorizationOracle;
  v15 = 0;
  objc_msgSend(v11, "unitPreferencesDictionaryForTypes:version:authorizationOracle:error:", v10, a4, clientAuthorizationOracle, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v15;
  v9[2](v9, v13, v14);

}

- (void)unitPreferencesManagerDidUpdateUnitPreferences:(id)a3
{
  void *v4;
  NSObject *queue;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("HDHealthStoreServerUserPreferencesDidChangeNotification"), self);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDHealthStoreServer_unitPreferencesManagerDidUpdateUnitPreferences___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __70__HDHealthStoreServer_unitPreferencesManagerDidUpdateUnitPreferences___block_invoke(uint64_t a1)
{
  id v1;

  -[HDHealthStoreServer _clientRemoteObjectProxy](*(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientRemote_unitPreferencesDidUpdate");

}

- (void)remote_setAllHealthDataAccessForSiri:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  HDHealthStoreClient *client;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  HDKeyValueDomain *v12;
  uint64_t v13;
  void *v14;
  HDKeyValueDomain *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  HDHealthStoreServer *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  client = self->_client;
  v8 = *MEMORY[0x1E0CB4800];
  v9 = *MEMORY[0x1E0CB4DC8];
  v24 = 0;
  v10 = -[HDHealthStoreClient hasRequiredArrayEntitlement:containing:error:](client, "hasRequiredArrayEntitlement:containing:error:", v8, v9, &v24);
  v11 = v24;
  if (v10)
  {
    v12 = [HDKeyValueDomain alloc];
    v13 = *MEMORY[0x1E0CB77B0];
    -[HDHealthStoreServer profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v12, "initWithCategory:domainName:profile:", 5, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CB77B8];
    v23 = v11;
    v18 = -[HDKeyValueDomain setNumber:forKey:error:](v15, "setNumber:forKey:error:", v16, v17, &v23);
    v19 = v23;

    if (v18)
    {
      -[HDProfile nanoSyncManager](self->_profile, "nanoSyncManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Siri authorization changed"), 0);

      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfuly saved the authorization status for Siri", buf, 0xCu);
      }
      v6[2](v6, 1, 0);
    }
    else
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v26 = self;
        v27 = 2114;
        v28 = v17;
        v29 = 2114;
        v30 = v19;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
      }
      ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v19);
    }

  }
  else
  {
    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v11);
    v19 = v11;
  }

}

- (void)remote_getAllHealthDataAccessForSiriWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  int v6;
  void *v7;
  id v8;
  HDHealthStoreClient *client;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  HDKeyValueDomain *v14;
  uint64_t v15;
  void *v16;
  HDKeyValueDomain *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void (*v23)(id, uint64_t, id);
  void (**v24)(id, _QWORD, id);
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  HDHealthStoreServer *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, id))a3;
  -[HDHealthStoreClient sourceBundleIdentifier](self->_client, "sourceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB77C0]);

  if (!v6)
  {
    v8 = 0;
LABEL_5:
    client = self->_client;
    v10 = *MEMORY[0x1E0CB4800];
    v11 = *MEMORY[0x1E0CB4DB8];
    v29 = 0;
    v12 = -[HDHealthStoreClient hasRequiredArrayEntitlement:containing:error:](client, "hasRequiredArrayEntitlement:containing:error:", v10, v11, &v29);
    v13 = v29;
    if (!v12)
    {
      v4[2](v4, 0, v13);
      v20 = v13;
LABEL_18:

      goto LABEL_19;
    }
    v14 = [HDKeyValueDomain alloc];
    v15 = *MEMORY[0x1E0CB77B0];
    -[HDHealthStoreServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v14, "initWithCategory:domainName:profile:", 5, v15, v16);

    v18 = *MEMORY[0x1E0CB77B8];
    v28 = v13;
    -[HDKeyValueDomain numberForKey:error:](v17, "numberForKey:error:", v18, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v28;

    if (v19)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfuly returned the authorization status for Siri", buf, 0xCu);
      }
      v22 = objc_msgSend(v19, "integerValue");
      v23 = v4[2];
      v24 = v4;
    }
    else
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5280];
      v27 = *MEMORY[0x1E0CB5280];
      if (v20)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v32 = self;
          v33 = 2114;
          v34 = v20;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Getting the value for key value domain failed with error: %{public}@", buf, 0x16u);
        }
        v23 = v4[2];
        v24 = v4;
        v22 = 0;
        v25 = v20;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Found no existing authorization status for Siri, and returning not determined status.", buf, 0xCu);
      }
      v23 = v4[2];
      v24 = v4;
      v22 = 3;
    }
    v25 = 0;
LABEL_17:
    v23(v24, v22, v25);

    goto LABEL_18;
  }
  v30 = 0;
  -[HDHealthStoreServer clientSourceWithError:](self, "clientSourceWithError:", &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  if (v7)
  {

    goto LABEL_5;
  }
  v4[2](v4, 0, v8);
LABEL_19:

}

- (void)conceptIndexManagerDidBecomeQuiescent:(id)a3 samplesProcessedCount:(int64_t)a4
{
  HDHealthStoreClient *client;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  v13 = 0;
  v7 = -[HDHealthStoreClient verifyHealthRecordsPermissionGrantedWithError:](client, "verifyHealthRecordsPermissionGrantedWithError:", &v13);
  v8 = v13;
  if (v7)
  {
    -[HDHealthStoreServer _clientRemoteObjectProxy]((uint64_t)self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientRemote_conceptIndexManagerDidBecomeQuiescentWithSamplesProcessedCount:", a4);

  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      HKSensitiveLogItem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "Dropping concept index manager quiescence notification with permission error %{public}@", buf, 0xCu);

    }
  }

}

- (void)remote_splitTotalCalories:(double)a3 timeInterval:(double)a4 withCompletion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[5];
  id v27;
  double v28;
  double v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6D0F380;
  aBlock[4] = self;
  v28 = a3;
  v29 = a4;
  v10 = v8;
  v27 = v10;
  v11 = _Block_copy(aBlock);
  v12 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kg"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quantitySampleWithType:quantity:startDate:endDate:", v13, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_2;
  v24[3] = &unk_1E6D0F3A8;
  v25 = v11;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_3;
  v22[3] = &unk_1E6CF7CA8;
  v21 = v25;
  v23 = v21;
  if (self)
    -[HDClientAuthorizationOracle performIfAuthorizedToReadObjects:onQueue:usingBlock:errorHandler:](self->_clientAuthorizationOracle, "performIfAuthorizedToReadObjects:onQueue:usingBlock:errorHandler:", v20, self->_queue, v24, v22);

}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  double v5;
  double v6;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "userCharacteristicsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restingCaloriesFromTotalCalories:timeInterval:authorizedToRead:", a2, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v6 = v5;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, 0, v6);
  return result;
}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__HDHealthStoreServer_remote_splitTotalCalories_timeInterval_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__HDHealthStoreServer_remote_fetchDaemonPreferenceForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_setDaemonPreferenceValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke;
  v18[3] = &unk_1E6CEBCA0;
  v21 = v10;
  v12 = v8;
  v19 = v12;
  v13 = v9;
  v20 = v13;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke_2;
  v16[3] = &unk_1E6CF7CA8;
  v14 = v21;
  v17 = v14;
  v15 = v14;
  if (self)
  {
    -[HDHealthStoreServer _requireEntitlement:usingBlock:errorHandler:]((uint64_t)self, (void *)*MEMORY[0x1E0CB59B0], v18, v16);
    v15 = v17;
  }

}

uint64_t __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], objc_msgSend(MEMORY[0x1E0CB6F50], "setValue:forKey:", a1[4], a1[5]), 0);
}

uint64_t __73__HDHealthStoreServer_remote_setDaemonPreferenceValue_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remote_dropEntitlement:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, uint64_t, _QWORD);

  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[HDHealthStoreServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dropEntitlement:", v6);

  v9[2](v9, 1, 0);
}

- (void)remote_restoreEntitlement:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, uint64_t, _QWORD);

  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[HDHealthStoreServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "restoreEntitlement:", v6);

  v9[2](v9, 1, 0);
}

- (void)remote_getIsFeatureSetAvailable:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  char v18;

  v17 = 0;
  v6 = (void (**)(id, _QWORD, id))a4;
  if (!self)
    goto LABEL_13;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__getIsFeatureSetAvailable_error_, CFSTR("Unsupported feature."), v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v17 = objc_retainAutorelease(v12);

    goto LABEL_13;
  }
  if (!-[HDHealthStoreClient verifyHealthRecordsPermissionGrantedWithError:](self->_client, "verifyHealthRecordsPermissionGrantedWithError:", &v17))
  {
LABEL_13:
    v11 = 0;
    goto LABEL_18;
  }
  -[HDProfile profileExtensionsConformingToProtocol:](self->_profile, "profileExtensionsConformingToProtocol:", &unk_1EF252278, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18 = 0;
    v9 = objc_msgSend(v8, "deviceConfigurationSupportsHealthRecords:error:", &v18, &v17);
    v10 = 1;
    if (!v18)
      v10 = 2;
    if (v9)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Health Records plugin unavailable."));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v17 = objc_retainAutorelease(v14);

    v11 = 0;
  }

LABEL_18:
  v16 = v17;
  v6[2](v6, v11, v16);

}

- (void)remote_addSamples:(id)a3 toWorkout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  char v21;
  _QWORD v23[4];
  id v24;
  id v25;
  HDHealthStoreServer *v26;
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthStoreServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDWorkoutEntity, "anyWithPredicate:healthDatabase:error:", v12, v14, &v29);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (unint64_t)v29;

  if (v15 | v16)
  {
    v28 = 0;
    v21 = objc_msgSend(MEMORY[0x1E0CB6DD0], "_validateObjects:forClass:error:", v8, objc_opt_class(), &v28);
    v19 = v28;

    if ((v21 & 1) != 0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke;
      v23[3] = &unk_1E6CEFB70;
      v27 = v10;
      v24 = v8;
      v25 = v9;
      v26 = self;
      -[HDHealthStoreServer remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:](self, "remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:", v24, 0, 0, v23);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v19);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = objc_opt_class();
    objc_msgSend(v9, "UUID");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v18, a2, CFSTR("Workout with UUID (%@) has not yet been saved"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v20);

  }
}

void __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_387_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(*(id *)(a1 + 48), "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = +[HDAssociationEntity associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:](HDAssociationEntity, "associateSampleUUIDs:withSampleUUID:type:destinationSubObjectReference:lastInsertedEntityID:profile:error:", v3, v4, 0, 0, &v11, v5, &v10);
    v7 = v11;
    v8 = v10;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("HDHealthStoreServerDidAssociateWorkoutSamples"), 0);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __62__HDHealthStoreServer_remote_addSamples_toWorkout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)remote_replaceWorkout:(id)a3 withWorkout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(id, _QWORD, id);
  id v28;
  id v29;
  void (**v30)(id, _QWORD, id);
  void *v31;
  void *v32;
  void (**v33)(void *, uint64_t, _QWORD);
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  HDHealthStoreServer *v57;
  id v58;
  id v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v53 = 0;
  if (!self)
  {
    v12 = 0;
    goto LABEL_18;
  }
  v11 = -[HDHealthStoreClient hasRequiredEntitlement:error:](self->_client, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], &v53);
  v12 = v53;
  if (!v11)
  {
LABEL_18:
    v10[2](v10, 0, v12);
    goto LABEL_19;
  }
  v48 = v8;
  v49 = v9;
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthStoreServer profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDWorkoutEntity, "anyWithPredicate:healthDatabase:error:", v14, v16, &v52);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v52;

  if (v17 || !v18)
  {
    v46 = v17;
    v47 = v12;
    objc_msgSend(v9, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHealthStoreServer profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;
    +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDWorkoutEntity, "anyWithPredicate:healthDatabase:error:", v20, v22, &v51);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v51;

    if (v24)
    {
      v10[2](v10, 0, v24);
      v18 = v24;
      v9 = v49;
      v8 = v48;
      v17 = v46;
    }
    else
    {
      v25 = v48;
      v26 = v49;
      v27 = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __93__HDHealthStoreServer__completionHandlerForReplaceWithOriginalWorkout_newWorkout_completion___block_invoke;
      aBlock[3] = &unk_1E6CEFBC0;
      v28 = v25;
      v55 = v28;
      v29 = v26;
      v56 = v29;
      v57 = self;
      v30 = v27;
      v58 = v30;
      v31 = _Block_copy(aBlock);
      v32 = v23;
      v33 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(v31);

      v45 = v32;
      if (v32)
      {
        v33[2](v33, 1, 0);
        v18 = 0;
        v8 = v48;
        v9 = v49;
        v17 = v46;
        v12 = v47;
      }
      else
      {
        objc_msgSend(v28, "sourceRevision");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "source");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bundleIdentifier");
        v36 = objc_claimAutoreleasedReturnValue();

        -[HDHealthStoreServer profile](self, "profile");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sourceManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v44 = (void *)v36;
        objc_msgSend(v38, "localSourceForBundleIdentifier:copyIfNecessary:error:", v36, 1, &v50);
        v39 = objc_claimAutoreleasedReturnValue();
        v18 = v50;

        v12 = v47;
        if (v39)
        {
          v59 = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "sourceRevision");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "version");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDHealthStoreServer _saveDataObjects:sourceEntity:sourceVersion:handler:](self, "_saveDataObjects:sourceEntity:sourceVersion:handler:", v40, v39, v42, v33);

        }
        else
        {
          v60[0] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDHealthStoreServer remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:](self, "remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:", v40, 0, 0, v33);
        }
        v43 = (void *)v39;
        v8 = v48;
        v9 = v49;
        v17 = v46;

      }
      v23 = v45;
    }

  }
  else
  {
    v10[2](v10, 0, v18);
    v8 = v48;
  }

LABEL_19:
}

void __93__HDHealthStoreServer__completionHandlerForReplaceWithOriginalWorkout_newWorkout_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    LOBYTE(v3) = +[HDWorkoutEntity copySampleAssociationsFromWorkout:toWorkout:profile:error:](HDWorkoutEntity, "copySampleAssociationsFromWorkout:toWorkout:profile:error:", v3, v4, v5, &v14);
    v6 = v14;

    if ((v3 & 1) != 0)
    {
      v7 = *(void **)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remote_deleteDataObjects:options:handler:", v8, 0, *(_QWORD *)(a1 + 56));

    }
    else
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v10 = *(void **)(a1 + 32);
        v11 = v9;
        objc_msgSend(v10, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v12;
        v18 = 2114;
        v19 = v13;
        v20 = 2114;
        v21 = v6;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Unable to copy sample associations from workout with UUID %{public}@ to workout with UUID %{public}@: %{public}@", buf, 0x20u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
}

- (void)remote_startWatchAppWithWorkoutConfiguration:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[HDHealthStoreServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HDHealthStoreServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startWatchAppWithWorkoutConfiguration:client:completion:", v10, v9, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }

}

- (void)remote_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(_QWORD *)&a4;
  v12 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  -[HDHealthStoreServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "startWatchAppWithWorkoutPlanData:processIdentifier:completion:", v12, v6, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

  }
}

- (void)remote_recoverActiveWorkoutSessionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  HDHealthStoreServer *v11;
  id v12;

  v8 = a3;
  -[HDHealthStoreServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke;
    block[3] = &unk_1E6CEA160;
    v10 = v5;
    v11 = self;
    v12 = v8;
    dispatch_sync(queue, block);

    v7 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, v7);
  }

}

void __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6D0F410;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v2, "recoverWorkoutSessionForClient:server:completion:", v3, v4, v6);

}

void __72__HDHealthStoreServer_remote_recoverActiveWorkoutSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    +[HDWorkoutBuilderServer recoveredWorkoutBuilderConfigurationForClient:sessionIdentifier:builderIdentifierOut:profile:error:](HDWorkoutBuilderServer, "recoveredWorkoutBuilderConfigurationForClient:sessionIdentifier:builderIdentifierOut:profile:error:", v7, v8, &v17, v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = v16;

    if (v10 || !v12)
    {
      v13 = v5;
      v14 = v10;
      v15 = v11;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
    }
    (*(void (**)(_QWORD, id, void *, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v13, v14, v15, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v12 = v6;
  }

}

- (void)remote_setMirroredWorkoutSessionObserverStateToEnabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *queue;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  HDHealthStoreServer *v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  HDHealthStoreServer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HDHealthStoreServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__HDHealthStoreServer_remote_setMirroredWorkoutSessionObserverStateToEnabled_completion___block_invoke;
    v12[3] = &unk_1E6D0F438;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v6;
    dispatch_async(queue, v12);

    v10 = v13;
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = self;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to update remote workout session observer state.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);
  }

}

uint64_t __89__HDHealthStoreServer_remote_setMirroredWorkoutSessionObserverStateToEnabled_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "registerCurrentWorkoutObserver:", v4);
  else
    objc_msgSend(v3, "unregisterCurrentWorkoutObserver:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)remote_relateReplaceRatingOfExertionSample:(id)a3 toWorkout:(id)a4 workoutActivity:(id)a5 samples:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, _QWORD, id);
  BOOL v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void (**v24)(id, _QWORD, id);
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, _QWORD, id))a7;
  v30 = 0;
  if (!self)
  {
    v19 = 0;
    goto LABEL_11;
  }
  v18 = -[HDHealthStoreClient hasRequiredEntitlement:error:](self->_client, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], &v30);
  v19 = v30;
  if (!v18)
  {
LABEL_11:
    v17[2](v17, 0, v19);
    goto LABEL_12;
  }
  objc_msgSend(v13, "quantityType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "code");

  if (v21 != 304)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Sample is expected to be of type HKQuantityTypeIdentifierWorkoutEffortScore"));
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v27 = (void *)v26;
    v17[2](v17, 0, (id)v26);

    goto LABEL_12;
  }
  if (v15)
  {
    objc_msgSend(v14, "workoutActivities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v15);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Activity must be inside workout activities."));
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke;
  v28[3] = &unk_1E6D0F460;
  v28[4] = self;
  v24 = v17;
  v29 = v24;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v28);
  v31[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthStoreServer remote_relateSamples:withObject:subObject:type:completion:](self, "remote_relateSamples:withObject:subObject:type:completion:", v25, v14, v15, 1, v24);

LABEL_12:
}

void __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 == 304)
  {
    objc_msgSend(v3, "sourceRevision");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "_isAppleWatch") & 1) != 0
      || (objc_msgSend(v7, "bundleIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0CB75C0]),
          v8,
          v9))
    {
      v10 = *(void **)(a1 + 32);
      v14[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke_2;
      v12[3] = &unk_1E6CE77F0;
      v13 = *(id *)(a1 + 40);
      objc_msgSend(v10, "remote_deleteDataObjects:options:handler:", v11, 0, v12);

    }
  }

}

uint64_t __111__HDHealthStoreServer_remote_relateReplaceRatingOfExertionSample_toWorkout_workoutActivity_samples_completion___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)remote_relateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  id v32;

  v11 = a3;
  v12 = a4;
  v25 = a5;
  v13 = a7;
  objc_msgSend(v12, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthStoreServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  +[HDHealthEntity anyWithPredicate:healthDatabase:error:](HDDataEntity, "anyWithPredicate:healthDatabase:error:", v15, v17, &v32);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t)v32;

  if (v18 | v19)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __81__HDHealthStoreServer_remote_relateSamples_withObject_subObject_type_completion___block_invoke;
    v26[3] = &unk_1E6D0F488;
    v30 = v13;
    v26[4] = self;
    v27 = v11;
    v28 = v12;
    v31 = a6;
    v29 = v25;
    -[HDHealthStoreServer remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:](self, "remote_saveDataObjects:skipInsertionFilter:creationDateOverride:handler:", v27, 0, 0, v26);

    v22 = v30;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = objc_opt_class();
    objc_msgSend(v12, "UUID");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v21, a2, CFSTR("Workout with UUID (%@) has not yet been saved"), v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v22);
  }

}

void __81__HDHealthStoreServer_remote_relateSamples_withObject_subObject_type_completion___block_invoke(_QWORD *a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 72), "associationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[9];
    v7 = a1[7];
    v9 = 0;
    objc_msgSend(v3, "associateObjects:withObject:type:destinationSubObject:error:", v4, v5, v6, v7, &v9);
    v8 = v9;

    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (void)remote_unrelateSamples:(id)a3 withObject:(id)a4 subObject:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  HDProfile *profile;
  void (**v12)(id, uint64_t, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  profile = self->_profile;
  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[HDProfile associationManager](profile, "associationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v17 = objc_msgSend(v16, "disassociateObjects:withObject:type:destinationSubObject:error:", v15, v14, a6, v13, &v19);

  v18 = v19;
  v12[2](v12, v17, v18);

}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  HDHealthStoreServer *v5;
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *taskServerEndpointsByUUID;
  void *v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  HDHealthStoreServer *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (HDHealthStoreServer *)a4;
  if (-[HDHealthStoreServer sessionType](v5, "sessionType") == 1)
  {
    -[HDHealthStoreClient sourceBundleIdentifier](self->_client, "sourceBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHealthStoreServer clientProcessBundleIdentifier](v5, "clientProcessBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      os_unfair_lock_lock(&self->_lock);
      taskServerEndpointsByUUID = self->_taskServerEndpointsByUUID;
      -[HDHealthStoreServer identifier](v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](taskServerEndpointsByUUID, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (os_log_t *)MEMORY[0x1E0CB5380];
      if (v11)
      {
        _HKInitializeLogging();
        v13 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v5;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[mirroring] Will invalidate previous task server for workout %@", buf, 0xCu);
        }
        v14 = self->_taskServerEndpointsByUUID;
        -[HDHealthStoreServer identifier](v5, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v15);

      }
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v11, "invalidate");
      v20 = 0;
      -[HDHealthStoreServer taskServerConfigurationForRecoveryWithError:](v5, "taskServerConfigurationForRecoveryWithError:", &v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v20;
      if (v16)
      {
        -[HDHealthStoreServer _clientRemoteObjectProxy]((uint64_t)self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clientRemote_didCreateRemoteSessionWithConfiguration:", v16);

        -[HDHealthStoreServer setClientDidSetupSession:](v5, "setClientDidSetupSession:", 1);
      }
      else
      {
        _HKInitializeLogging();
        v19 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v22 = self;
          v23 = 2112;
          v24 = v17;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Error occurred while retrieving task configuration for remote session: %@", buf, 0x16u);
        }
      }

    }
  }

}

@end
