@implementation LACOnenessAuthenticationProviderSharing

- (LACOnenessAuthenticationProviderSharing)initWithReplyQueue:(id)a3
{
  id v5;
  LACOnenessAuthenticationProviderSharing *v6;
  uint64_t v7;
  SFAuthenticationManager *sharingManager;
  SFAuthenticationManager *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  OS_dispatch_queue *workQueue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LACOnenessAuthenticationProviderSharing;
  v6 = -[LACOnenessAuthenticationProviderSharing init](&v15, sel_init);
  if (v6)
  {
    if (getSFAuthenticationManagerClass())
    {
      v7 = objc_msgSend(objc_alloc((Class)getSFAuthenticationManagerClass()), "initWithQueue:", v5);
      sharingManager = v6->_sharingManager;
      v6->_sharingManager = (SFAuthenticationManager *)v7;

      -[SFAuthenticationManager setDelegate:](v6->_sharingManager, "setDelegate:", v6);
    }
    else
    {
      v9 = v6->_sharingManager;
      v6->_sharingManager = 0;

    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_replyQueue, a3);
  }

  return v6;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)authenticateClient:(id)a3 withAcmContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LACLogABM();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "Initiating companion authentication for bundleID: %{public}@ app name: %{public}@", (uint8_t *)&v22, 0x16u);

  }
  -[LACOnenessAuthenticationProviderSharing authenticationBackgroundTaskForClient:withAcmContext:](self, "authenticationBackgroundTaskForClient:withAcmContext:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "runSynchronouslyWithTimeout:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LACLogABM();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v14;
    v24 = 2114;
    v25 = v15;
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_2409DC000, v13, OS_LOG_TYPE_DEFAULT, "Authentication for bundleID: %{public}@ app name: %{public}@ returned: %{public}@", (uint8_t *)&v22, 0x20u);

  }
  objc_msgSend(v12, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 || !v16)
  {
    v18 = (id)objc_opt_new();
    objc_msgSend(v12, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:underlyingError:](LACError, "errorWithCode:underlyingError:", -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[LACOnenessAuthenticationProviderSharing _failAuthenticationWithID:error:](self, "_failAuthenticationWithID:error:", v18, v20);
  }
  else
  {
    v18 = v16;
  }

  return v18;
}

- (void)cancelAuthenticationWithID:(id)a3
{
  id v4;
  NSObject *workQueue;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (self->_sharingManager)
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__LACOnenessAuthenticationProviderSharing_cancelAuthenticationWithID___block_invoke;
    block[3] = &unk_2510C0F70;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(workQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    +[LACError errorWithCode:](LACError, "errorWithCode:", -4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACOnenessAuthenticationProviderSharing _failAuthenticationWithID:error:](self, "_failAuthenticationWithID:error:", v4, v6);

  }
}

void __70__LACOnenessAuthenticationProviderSharing_cancelAuthenticationWithID___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "cancelAuthenticationSessionWithID:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a4;
  LACLogABM();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Fetching Oneness domain state", buf, 2u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__LACOnenessAuthenticationProviderSharing_domainStateForRequest_completion___block_invoke;
  v8[3] = &unk_2510C0D98;
  v9 = v5;
  v7 = v5;
  -[LACOnenessAuthenticationProviderSharing _runDomainStateBackgroundTaskWithCompletion:](self, "_runDomainStateBackgroundTaskWithCompletion:", v8);

}

void __76__LACOnenessAuthenticationProviderSharing_domainStateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogABM();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v8 = v5;
    else
      v8 = v6;
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Oneness domain state returned: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  LACOnenessAuthenticationProviderDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authenticationProvider:didStartAuthenticationWithID:", self, v6);

}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  LACOnenessAuthenticationProviderDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authenticationProvider:didCompleteAuthenticationWithID:", self, v6);

}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  LACOnenessAuthenticationProviderDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authenticationProvider:didFailAuthenticationWithID:error:", self, v9, v8);

}

- (void)_failAuthenticationWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *replyQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  replyQueue = self->_replyQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__LACOnenessAuthenticationProviderSharing__failAuthenticationWithID_error___block_invoke;
  v11[3] = &unk_2510C0F98;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(replyQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__LACOnenessAuthenticationProviderSharing__failAuthenticationWithID_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "authenticationProvider:didFailAuthenticationWithID:error:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (id)domainStateBackgroundTask
{
  LACBackgroundTask *domainStateBackgroundTask;
  LACBackgroundTask *v4;
  LACBackgroundTask *v5;
  LACBackgroundTask *v6;
  _QWORD v8[4];
  id v9;
  id location;

  domainStateBackgroundTask = self->_domainStateBackgroundTask;
  if (!domainStateBackgroundTask)
  {
    objc_initWeak(&location, self);
    v4 = [LACBackgroundTask alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke;
    v8[3] = &unk_2510C0F20;
    objc_copyWeak(&v9, &location);
    v5 = -[LACBackgroundTask initWithIdentifier:worker:](v4, "initWithIdentifier:worker:", CFSTR("OnenessDomainStateQuery"), v8);
    v6 = self->_domainStateBackgroundTask;
    self->_domainStateBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    domainStateBackgroundTask = self->_domainStateBackgroundTask;
  }
  return domainStateBackgroundTask;
}

void __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[LACOnenessSignpostEvent eligibleDevicesRequestWillStart](LACOnenessSignpostEvent, "eligibleDevicesRequestWillStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "send");

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke_2;
    v6[3] = &unk_2510C0D98;
    v7 = v3;
    objc_msgSend(WeakRetained, "_domainStateWithCompletion:", v6);

  }
}

void __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  LACBackgroundTaskResult *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  +[LACOnenessSignpostEvent eligibleDevicesRequestDidFinish](LACOnenessSignpostEvent, "eligibleDevicesRequestDidFinish");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "send");

  v7 = *(_QWORD *)(a1 + 32);
  v8 = [LACBackgroundTaskResult alloc];
  if (v5)
    v9 = -[LACBackgroundTaskResult initWithError:](v8, "initWithError:", v5);
  else
    v9 = -[LACBackgroundTaskResult initWithValue:](v8, "initWithValue:", v11);
  v10 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);

}

- (void)_runDomainStateBackgroundTaskWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  OS_dispatch_queue *replyQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  LACOnenessAuthenticationProviderSharing *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  LACLogDTOLocation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2048;
    v16 = 0x3FC999999999999ALL;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform query with %.2f sec timeout", buf, 0x16u);
  }

  -[LACOnenessAuthenticationProviderSharing domainStateBackgroundTask](self, "domainStateBackgroundTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  replyQueue = self->_replyQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__LACOnenessAuthenticationProviderSharing__runDomainStateBackgroundTaskWithCompletion___block_invoke;
  v9[3] = &unk_2510C0F48;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v6, "runWithTimeout:queue:completion:", replyQueue, v9, 0.2);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __87__LACOnenessAuthenticationProviderSharing__runDomainStateBackgroundTaskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  }
}

- (void)_domainStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SFAuthenticationManager *sharingManager;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (!self->_sharingManager)
    goto LABEL_6;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getSFAuthenticationDeviceClass_softClass;
  v15 = getSFAuthenticationDeviceClass_softClass;
  if (!getSFAuthenticationDeviceClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getSFAuthenticationDeviceClass_block_invoke;
    v11[3] = &unk_2510C0B58;
    v11[4] = &v12;
    __getSFAuthenticationDeviceClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  if (v6)
  {
    sharingManager = self->_sharingManager;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__LACOnenessAuthenticationProviderSharing__domainStateWithCompletion___block_invoke;
    v9[3] = &unk_2510C0FC0;
    v9[4] = self;
    v10 = v4;
    -[SFAuthenticationManager listCandidateDevicesForType:completionHandler:](sharingManager, "listCandidateDevicesForType:completionHandler:", 7, v9);
    v8 = v10;
  }
  else
  {
LABEL_6:
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1, CFSTR("Authenticator not available"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
  }

}

void __70__LACOnenessAuthenticationProviderSharing__domainStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogABM();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v8 = v6;
    else
      v8 = v5;
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Listing eligible devices returned: %@", buf, 0xCu);
  }

  v9 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "enabledAsKey", (_QWORD)v20))
        {
          objc_msgSend(v15, "uniqueID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_domainStateDictionaryForJoinedIDs:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_domainStateDictionaryForJoinedIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACDomainStateDecorator createHashForDomainState:](LACDomainStateDecorator, "createHashForDomainState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("kLACDomainStateResultKeyAvailableCompanionTypes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v15 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kLACDomainStateResultKeyCompanionStateHashes"));

  }
  return v8;
}

- (id)authenticationBackgroundTaskForClient:(id)a3 withAcmContext:(id)a4
{
  id v6;
  id v7;
  LACBackgroundTask *v8;
  id v9;
  id v10;
  LACBackgroundTask *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [LACBackgroundTask alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke;
  v13[3] = &unk_2510C1010;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = -[LACBackgroundTask initWithIdentifier:worker:](v8, "initWithIdentifier:worker:", CFSTR("OnenessAuthentication"), v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[LACOnenessSignpostEvent authenticationRequestWillStart](LACOnenessSignpostEvent, "authenticationRequestWillStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "send");

    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke_2;
    v8[3] = &unk_2510C0FE8;
    v9 = v3;
    objc_msgSend(WeakRetained, "_authenticateClient:withAcmContext:completion:", v7, v6, v8);

  }
}

void __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  LACBackgroundTaskResult *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  +[LACOnenessSignpostEvent authenticationRequestDidFinish](LACOnenessSignpostEvent, "authenticationRequestDidFinish");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "send");

  v7 = *(_QWORD *)(a1 + 32);
  v8 = [LACBackgroundTaskResult alloc];
  if (v5)
    v9 = -[LACBackgroundTaskResult initWithError:](v8, "initWithError:", v5);
  else
    v9 = -[LACBackgroundTaskResult initWithValue:](v8, "initWithValue:", v11);
  v10 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);

}

- (void)_authenticateClient:(id)a3 withAcmContext:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (self->_sharingManager && getSFAuthenticationOptionsClass())
  {
    v10 = objc_alloc_init((Class)getSFAuthenticationOptionsClass());
    objc_msgSend(v10, "setAcmContext:", v8);
    objc_msgSend(v17, "bundleId");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("<UNKNOWN>");
    objc_msgSend(v10, "setBundleID:", v13);

    objc_msgSend(v17, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v10, "setAppName:", v14);
    }
    else
    {
      +[LACMobileGestalt marketingDeviceFamilyName](LACMobileGestalt, "marketingDeviceFamilyName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAppName:", v15);

    }
    -[SFAuthenticationManager authenticateForType:withOptions:](self->_sharingManager, "authenticateForType:withOptions:", 7, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16, 0);

  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("Authenticator not available"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v9)[2](v9, 0, v10);
  }

}

- (LACOnenessAuthenticationProviderDelegate)delegate
{
  return (LACOnenessAuthenticationProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_domainStateBackgroundTask, 0);
}

@end
