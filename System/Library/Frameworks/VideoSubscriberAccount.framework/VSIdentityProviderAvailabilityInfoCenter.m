@implementation VSIdentityProviderAvailabilityInfoCenter

- (void)_beginStatusUpdateAttemptWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  VSDeveloperIdentityProviderFetchAllOperation *v6;
  void *v7;
  __CFString *v8;
  VSAMSBagLoadOperation *v9;
  NSObject *v10;
  void *v11;
  id v12;
  VSDeveloperIdentityProviderFetchAllOperation *v13;
  VSAMSBagLoadOperation *v14;
  void *v15;
  _QWORD v16[5];
  VSAMSBagLoadOperation *v17;
  __CFString *v18;
  VSDeveloperIdentityProviderFetchAllOperation *v19;
  id v20;
  uint8_t buf[4];
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSIdentityProviderAvailabilityInfoCenter privateQueue](self, "privateQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(VSDeveloperIdentityProviderFetchAllOperation);
  -[VSIdentityProviderAvailabilityInfoCenter developerServiceConnection](self, "developerServiceConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeveloperIdentityProviderFetchAllOperation setConnection:](v6, "setConnection:", v7);

  objc_msgSend(v5, "addOperation:", v6);
  v8 = CFSTR("MultipleSystemOperators");
  v9 = objc_alloc_init(VSAMSBagLoadOperation);
  -[VSAMSBagLoadOperation setBagKey:](v9, "setBagKey:", v8);
  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1D2419000, v10, OS_LOG_TYPE_DEFAULT, "Will load value for bag key %@", buf, 0xCu);
  }

  objc_msgSend(v5, "addOperation:", v9);
  v11 = (void *)MEMORY[0x1E0CB34C8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E93A0C18;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v6;
  v20 = v4;
  v12 = v4;
  v13 = v6;
  v14 = v9;
  objc_msgSend(v11, "blockOperationWithBlock:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addDependency:", v13);
  objc_msgSend(v15, "addDependency:", v14);
  objc_msgSend(v5, "addOperation:", v15);

}

- (int64_t)status
{
  void *v3;
  int64_t v4;
  void *v5;

  -[VSIdentityProviderAvailabilityInfoCenter preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forcedAvailabilityStatus");

  if (!v4)
  {
    if (!-[VSIdentityProviderAvailabilityInfoCenter hasDeterminedInitialStatus](self, "hasDeterminedInitialStatus"))
    {
      -[VSIdentityProviderAvailabilityInfoCenter setHasDeterminedInitialStatus:](self, "setHasDeterminedInitialStatus:", 1);
      -[VSIdentityProviderAvailabilityInfoCenter preferences](self, "preferences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_status = objc_msgSend(v5, "cachedAvailabilityStatus");

    }
    return self->_status;
  }
  return v4;
}

- (VSPreferences)preferences
{
  VSIdentityProviderAvailabilityInfoCenter *v2;
  VSPreferences *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_preferences;
  if (!v3)
  {
    v3 = objc_alloc_init(VSPreferences);
    objc_storeStrong((id *)&v2->_preferences, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

VSIdentityProviderAvailabilityInfoCenter *__57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke_2()
{
  VSIdentityProviderAvailabilityInfoCenter *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(VSIdentityProviderAvailabilityInfoCenter);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSAccountMonitor sharedInstance](VSAccountMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObserver:selector:name:object:", v0, sel__accountStoreChanged_, CFSTR("VSAccountMonitorAccountDidChange"), v2);

  -[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:](v0, "_beginStatusUpdateAttemptWithCompletionHandler:", 0);
  return v0;
}

void __57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  __57__VSIdentityProviderAvailabilityInfoCenter_defaultCenter__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultCenter___vs_lazy_init_variable;
  defaultCenter___vs_lazy_init_variable = v0;

}

- (void)setHasDeterminedInitialStatus:(BOOL)a3
{
  self->_hasDeterminedInitialStatus = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (VSIdentityProviderAvailabilityInfoCenter)init
{
  VSIdentityProviderAvailabilityInfoCenter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  VSRemoteNotifier *v5;
  VSRemoteNotifier *remoteNotifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderAvailabilityInfoCenter;
  v2 = -[VSIdentityProviderAvailabilityInfoCenter init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSIdentityProviderAvailabilityInfoCenter"));
    v5 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v5;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
  }
  return v2;
}

- (BOOL)hasDeterminedInitialStatus
{
  return self->_hasDeterminedInitialStatus;
}

- (VSDeveloperServiceConnection)developerServiceConnection
{
  return self->_developerServiceConnection;
}

+ (id)defaultCenter
{
  if (defaultCenter___vs_lazy_init_predicate != -1)
    dispatch_once(&defaultCenter___vs_lazy_init_predicate, &__block_literal_global_44);
  return (id)defaultCenter___vs_lazy_init_variable;
}

- (void)_accountStoreChanged:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Account store changed: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:](self, "_beginStatusUpdateAttemptWithCompletionHandler:", 0);
}

- (void)_sendStatusChangeNotification
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  VSRequireMainThread();
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Will send identity provider availability status change notification.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VSIdentityProviderAvailabilityDidChangeNotification"), self);
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Did send identity provider availability status change notification.", v6, 2u);
  }

}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[6];
  _QWORD v33[5];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[4];
  const char *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cachedStoreProviderStatus");
  objc_msgSend(*(id *)(a1 + 40), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Did load value (%@) for bag key %@", buf, 0x16u);
    }
    v7 = 0;
    v3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v5 = objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Did NOT load value for bag key %@: %@", buf, 0x16u);
    }

    if (v5)
    {
      VSPublicError(0, 3, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

    }
    else
    {
      v7 = 0;
      v3 = 2;
    }
  }

  objc_msgSend(v2, "setCachedStoreProviderStatus:", v3);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v38 = objc_msgSend(v2, "cachedDeveloperProviderStatus");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__13;
  v43 = __Block_byref_object_dispose__13;
  v44 = 0;
  objc_msgSend(*(id *)(a1 + 56), "result");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "forceUnwrapObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_19;
  v34[3] = &unk_1E939EED8;
  v34[4] = &v35;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2;
  v33[3] = &unk_1E939EF00;
  v33[4] = buf;
  objc_msgSend(v18, "unwrapObject:error:", v34, v33);

  objc_msgSend(v2, "setCachedDeveloperProviderStatus:", v36[3]);
  if (v3 == 1 || (v20 = v36[3], v20 == 1))
  {
    v21 = 0;
    v22 = 1;
  }
  else if (v3 == 2 || v20 == 2)
  {
    VSPublicError(0, 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 2;
  }
  else
  {
    v26 = v7;
    if (v7 || (v26 = *(void **)(*(_QWORD *)&buf[8] + 40)) != 0)
    {
      v27 = v26;
    }
    else
    {
      VSPublicError(0, 3, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v27;
    v22 = 0;
  }
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_22;
  v32[3] = &unk_1E93A0BF0;
  v32[4] = *(_QWORD *)(a1 + 32);
  v32[5] = v22;
  VSPerformBlockOnMainThread(v32);
  if (*(_QWORD *)(a1 + 64))
  {
    VSDefaultLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 136315138;
      v40 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1D2419000, v23, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", v39, 0xCu);
    }

    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_23;
    v28[3] = &unk_1E939FEC8;
    v30 = *(id *)(a1 + 64);
    v31 = v22;
    v29 = v21;
    __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_23((uint64_t)v28);
    VSDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 136315138;
      v40 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke_3";
      _os_log_impl(&dword_1D2419000, v24, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", v39, 0xCu);
    }

    v25 = v30;
  }
  else
  {
    VSDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 136315138;
      v40 = "-[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1D2419000, v25, OS_LOG_TYPE_DEFAULT, "No completion handler passed to %s", v39, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v35, 8);

}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "count");
  v4 = 1;
  if (!result)
    v4 = 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  VSPublicError(0, 3, v3);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:", *(_QWORD *)(a1 + 40));
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_24;
  v4[3] = &unk_1E939FEC8;
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v5 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v4);

}

uint64_t __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_24(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

+ (BOOL)automaticallyNotifiesObserversOfStatus
{
  return 0;
}

- (void)setStatus:(int64_t)a3
{
  void *v5;

  if (self->_status != a3)
  {
    -[VSIdentityProviderAvailabilityInfoCenter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    self->_status = a3;
    -[VSIdentityProviderAvailabilityInfoCenter preferences](self, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCachedAvailabilityStatus:", a3);

    -[VSIdentityProviderAvailabilityInfoCenter _sendStatusChangeNotification](self, "_sendStatusChangeNotification");
    -[VSIdentityProviderAvailabilityInfoCenter didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  }
}

- (void)determineIdentityProviderAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VSIdentityProviderAvailabilityInfoCenter determineIdentityProviderAvailabilityWithCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__VSIdentityProviderAvailabilityInfoCenter_determineIdentityProviderAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E93A0C40;
  v8 = v4;
  v6 = v4;
  -[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:](self, "_beginStatusUpdateAttemptWithCompletionHandler:", v7);

}

uint64_t __103__VSIdentityProviderAvailabilityInfoCenter_determineIdentityProviderAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Info center received remote notification.", v6, 2u);
  }

  -[VSIdentityProviderAvailabilityInfoCenter _beginStatusUpdateAttemptWithCompletionHandler:](self, "_beginStatusUpdateAttemptWithCompletionHandler:", 0);
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (void)setDeveloperServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_developerServiceConnection, a3);
}

- (VSAMSBagLoadOperation)mockAMSBagLoadOperation
{
  return self->_mockAMSBagLoadOperation;
}

- (void)setMockAMSBagLoadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_mockAMSBagLoadOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockAMSBagLoadOperation, 0);
  objc_storeStrong((id *)&self->_developerServiceConnection, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error determining identity provider availability: %@", a5, a6, a7, a8, 2u);
}

void __91__VSIdentityProviderAvailabilityInfoCenter__beginStatusUpdateAttemptWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error fetching developer providers: %@", a5, a6, a7, a8, 2u);
}

@end
