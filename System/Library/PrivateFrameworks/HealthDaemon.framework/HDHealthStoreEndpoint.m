@implementation HDHealthStoreEndpoint

+ (id)endpointWithClient:(id)a3 healthDaemon:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HDHealthStoreErrorEndpoint *v26;
  void *v27;
  id *v28;
  id v30;
  objc_super v31;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "behavior");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = objc_msgSend(v7, "isDeviceSupported");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthDataUnavailableError");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = objc_retainAutorelease(v18);

    v21 = v19;
    goto LABEL_15;
  }
  objc_msgSend(v6, "behavior");
  v30 = 0;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_opt_self();
  objc_msgSend(v10, "process");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CB5140];
  if ((objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x1E0CB5140]) & 1) != 0
    || (objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x1E0CB59B0]) & 1) != 0)
  {
    objc_msgSend(v9, "additionalEntitlementForConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13
      || (v14 = (void *)v13,
          objc_msgSend(v9, "additionalEntitlementForConnection"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v11, "hasEntitlement:", v15),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = 1;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthDataUnavailableError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = objc_msgSend(v22, "code");
    objc_msgSend(v22, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hk_assignError:code:description:", &v30, v24, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v30, 4, CFSTR("Missing %@ entitlement."), v12);
  }
  v17 = 0;
LABEL_13:

  v21 = v30;
  if ((v17 & 1) != 0)
  {
    v26 = -[HDHealthStoreEndpoint initWithClient:daemon:]([HDHealthStoreEndpoint alloc], "initWithClient:daemon:", v10, v6);
    goto LABEL_21;
  }
LABEL_15:
  v27 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 1, CFSTR("Health data is not available for this client."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = [HDHealthStoreErrorEndpoint alloc];
  v21 = v27;
  if (v26)
  {
    v31.receiver = v26;
    v31.super_class = (Class)HDHealthStoreErrorEndpoint;
    v28 = objc_msgSendSuper2(&v31, sel_initWithClient_daemon_, v5, v6);
    v26 = (HDHealthStoreErrorEndpoint *)v28;
    if (v28)
      objc_storeStrong(v28 + 7, v27);
  }

LABEL_21:
  return v26;
}

- (HDHealthStoreEndpoint)initWithClient:(id)a3 daemon:(id)a4
{
  id v7;
  id v8;
  HDHealthStoreEndpoint *v9;
  HDHealthStoreEndpoint *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  OS_dispatch_queue *connectionQueue;
  NSMutableArray *v17;
  NSMutableArray *serverCompletionsAwaitingProfileReady;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDHealthStoreEndpoint;
  v9 = -[HDHealthStoreEndpoint init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_msgSend(v7, "process");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("connection.%@.%d"), v13, objc_msgSend(v11, "processIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v10->_daemon, v8);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    serverCompletionsAwaitingProfileReady = v10->_serverCompletionsAwaitingProfileReady;
    v10->_serverCompletionsAwaitingProfileReady = v17;

  }
  return v10;
}

- (void)remote_serverForConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  HDHealthStoreClient *v17;
  id v18;
  HDHealthStoreClient *v19;
  HDHealthStoreClient *v20;
  void *v21;
  char v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  os_unfair_lock_s *p_lock;
  HDHealthStoreServer *v29;
  HDHealthStoreServer *v30;
  void *v31;
  char v32;
  void *v33;
  NSMutableArray *serverCompletionsAwaitingProfileReady;
  void *v35;
  os_unfair_lock_s *v36;
  void *v37;
  void *v38;
  os_unfair_lock_t lock;
  _QWORD v40[4];
  HDHealthStoreServer *v41;
  void (**v42)(id, _QWORD, uint64_t);
  id v43;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "profileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "profileForIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthStoreUnavailableError");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isiPad"))
    {
      objc_msgSend(v7, "applicationSDKVersionToken");
      v14 = dyld_version_token_at_least();

      if ((v14 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthDataUnavailableError");
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v16 = (void *)v15;
        v8[2](v8, 0, v15);

LABEL_41:
        goto LABEL_42;
      }
    }
    else
    {

    }
    v17 = -[HDHealthStoreClient initWithXPCClient:configuration:profile:databaseAccessibilityAssertions:]([HDHealthStoreClient alloc], "initWithXPCClient:configuration:profile:databaseAccessibilityAssertions:", self->_client, v7, v12, 0);
    objc_msgSend(v7, "sourceBundleIdentifier");
    v43 = 0;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = v19;
    if (!v18
      || (-[HDHealthStoreClient defaultSourceBundleIdentifier](v19, "defaultSourceBundleIdentifier"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v18, "isEqualToString:", v21),
          v21,
          (v22 & 1) != 0))
    {
      v23 = 1;
      goto LABEL_23;
    }
    -[HDXPCClient process](self->_client, "process");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "hasEntitlement:", *MEMORY[0x1E0CB4A90]) & 1) != 0)
      goto LABEL_21;
    v25 = *MEMORY[0x1E0CB5F28];
    if (objc_msgSend(v24, "hasArrayEntitlement:containing:", *MEMORY[0x1E0CB5F28], *MEMORY[0x1E0CB4758]))
    {
      if ((objc_msgSend(MEMORY[0x1E0CB6C18], "isAppleDeviceBundleIdentifier:", v18) & 1) != 0)
        goto LABEL_21;
    }
    if (objc_msgSend(v24, "hasEntitlement:", *MEMORY[0x1E0CB5F38]))
    {
      -[HDXPCClient process](self->_client, "process");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "applicationIdentifier");
      lock = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();

      if (-[os_unfair_lock_s length](lock, "length") && objc_msgSend(v18, "hasPrefix:", lock))
      {

        goto LABEL_21;
      }

    }
    if ((objc_msgSend(v24, "hasArrayEntitlement:containing:", v25, v18) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v43, 4, CFSTR("Unauthorized use of source bundle identifier \"%@\"), v18);
      v23 = 0;
      goto LABEL_22;
    }
LABEL_21:
    v23 = 1;
LABEL_22:

LABEL_23:
    v27 = v43;

    if ((v23 & 1) != 0)
    {
      if (-[HDHealthStoreClient _isAuthorizedToAccessProfile:](v20, "_isAuthorizedToAccessProfile:", v12))
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v29 = self->_server;
        if (v29)
        {
          v30 = v29;
          os_unfair_lock_unlock(&self->_lock);
          -[HDHealthStoreServer configuration](v30, "configuration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqual:", v7);

          if ((v32 & 1) != 0)
          {
            p_lock = &self->_lock;
LABEL_32:
            os_unfair_lock_lock(p_lock);
            serverCompletionsAwaitingProfileReady = self->_serverCompletionsAwaitingProfileReady;
            if (serverCompletionsAwaitingProfileReady)
            {
              v40[0] = MEMORY[0x1E0C809B0];
              v40[1] = 3221225472;
              v40[2] = __66__HDHealthStoreEndpoint_remote_serverForConfiguration_completion___block_invoke;
              v40[3] = &unk_1E6CE8C48;
              v42 = v8;
              v41 = v30;
              v35 = (void *)objc_msgSend(v40, "copy");
              v36 = p_lock;
              v37 = _Block_copy(v35);
              -[NSMutableArray addObject:](serverCompletionsAwaitingProfileReady, "addObject:", v37);

              p_lock = v36;
            }
            else
            {
              ((void (**)(id, HDHealthStoreServer *, uint64_t))v8)[2](v8, v30, 0);
            }
            os_unfair_lock_unlock(p_lock);
            goto LABEL_39;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Requested server configuration does not match existing server configuration."));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, 0, (uint64_t)v38);

        }
        else
        {
          v30 = -[HDHealthStoreServer initWithClient:profile:configuration:connectionQueue:]([HDHealthStoreServer alloc], "initWithClient:profile:configuration:connectionQueue:", v20, v12, v7, self->_connectionQueue);
          objc_storeStrong((id *)&self->_server, v30);
          objc_msgSend(v12, "registerProfileReadyObserver:queue:", self, 0);
          os_unfair_lock_unlock(&self->_lock);
          if (v30)
          {
            -[HDHealthStoreServer start](v30, "start");
            goto LABEL_32;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Requested server configuration is invalid."));
          v30 = (HDHealthStoreServer *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, 0, (uint64_t)v30);
        }
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_healthStoreUnavailableError");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, (uint64_t)v33);

    }
    else
    {
      v8[2](v8, 0, (uint64_t)v27);
    }
LABEL_40:

    goto LABEL_41;
  }
LABEL_42:

}

uint64_t __66__HDHealthStoreEndpoint_remote_serverForConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  HDHealthStoreServer *server;
  HDHealthStoreServer *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  server = self->_server;
  self->_server = 0;
  v5 = server;

  os_unfair_lock_unlock(p_lock);
  -[HDHealthStoreServer invalidate](v5, "invalidate");
  -[HDXPCClient connection](self->_client, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "connectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpointInvalidated:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_serverCompletionsAwaitingProfileReady, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (HKProfileIdentifier)profileIdentifier
{
  void *v2;
  void *v3;

  -[HDHealthStoreServer profile](self->_server, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKProfileIdentifier *)v3;
}

- (void)connectionConfigured
{
  id v3;

  -[HDXPCClient connection](self->_client, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setQueue:", self->_connectionQueue);

}

- (void)profileDidBecomeReady:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *serverCompletionsAwaitingProfileReady;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_server)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_serverCompletionsAwaitingProfileReady;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  serverCompletionsAwaitingProfileReady = self->_serverCompletionsAwaitingProfileReady;
  self->_serverCompletionsAwaitingProfileReady = 0;

  os_unfair_lock_unlock(p_lock);
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HDXPCClient)client
{
  return self->_client;
}

- (HDHealthStoreServer)server
{
  return self->_server;
}

@end
