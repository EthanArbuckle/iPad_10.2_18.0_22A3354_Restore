@implementation MAAutoAsset

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 error:(id *)a5
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", a3, a4, 0, 0, a5);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 completingFromQueue:(id)a5 error:(id *)a6
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", a3, a4, 0, a5, a6);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 error:(id *)a6
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", a3, a4, a5, 0, a6);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  MAAutoAsset *v16;
  MAAutoAssetSelector **p_assetSelector;
  MAAutoAssetSelector *contentLockedSelector;
  NSString *contentLockedReason;
  NSURL *localContentURL;
  NSDictionary *assetAttributes;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *completionDispatchQueue;
  MAAutoAsset *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v29 = a5;
  v15 = a6;
  +[MAAutoAsset logMAAutoAssetVersion](MAAutoAsset, "logMAAutoAssetVersion");
  v30.receiver = self;
  v30.super_class = (Class)MAAutoAsset;
  v16 = -[MAAutoAsset init](&v30, sel_init);
  if (!v16)
  {
LABEL_10:
    v24 = v16;
    goto LABEL_23;
  }
  +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
  objc_storeStrong((id *)&v16->_autoAssetClientName, a3);
  p_assetSelector = &v16->_assetSelector;
  objc_storeStrong((id *)&v16->_assetSelector, a4);
  objc_storeStrong((id *)&v16->_updateCategoryDesiredByClient, a5);
  contentLockedSelector = v16->_contentLockedSelector;
  v16->_contentLockedSelector = 0;

  contentLockedReason = v16->_contentLockedReason;
  v16->_contentLockedReason = 0;

  localContentURL = v16->_localContentURL;
  v16->_localContentURL = 0;

  assetAttributes = v16->_assetAttributes;
  v16->_assetAttributes = 0;

  if (v15)
  {
    v22 = (OS_dispatch_queue *)v15;
  }
  else
  {
    +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
    v22 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  completionDispatchQueue = v16->_completionDispatchQueue;
  v16->_completionDispatchQueue = v22;

  v16->_locksOfContent = 0;
  if (v16->_autoAssetClientName && *p_assetSelector)
  {
    if (v16->_completionDispatchQueue)
    {
      if (a7)
        *a7 = 0;
      goto LABEL_10;
    }
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("failed to initialize, missing:"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v16->_completionDispatchQueue)
        objc_msgSend(v26, "appendString:", CFSTR(" completionDispatchQueue"));
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6101, CFSTR("auto(defaultDispatchQueue)"), 0, v27);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_18:
    v24 = 0;
    goto LABEL_23;
  }
  if (!a7)
    goto LABEL_18;
  if (v16->_autoAssetClientName)
  {
    v25 = CFSTR("assetSelector is a required parameter that was not provided");
  }
  else if (*p_assetSelector)
  {
    v25 = CFSTR("autoAssetClientName is a required parameter that was not provided");
  }
  else
  {
    v25 = CFSTR("autoAssetClientName and assetSelector are required parameters yet neither was provided");
  }
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6102, CFSTR("auto(initForClientName)"), 0, v25);
  v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v24;
}

- (MAAutoAsset)initWithCoder:(id)a3
{
  id v4;
  MAAutoAsset *v5;
  uint64_t v6;
  NSString *autoAssetClientName;
  uint64_t v8;
  MAAutoAssetSelector *assetSelector;
  uint64_t v10;
  NSString *updateCategoryDesiredByClient;
  uint64_t v12;
  MAAutoAssetSelector *contentLockedSelector;
  uint64_t v14;
  NSString *contentLockedReason;
  uint64_t v16;
  NSURL *localContentURL;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *assetAttributes;
  objc_super v24;
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAsset;
  v5 = -[MAAutoAsset init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAssetClientName"));
    v6 = objc_claimAutoreleasedReturnValue();
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSelector"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateCategoryDesiredByClient"));
    v10 = objc_claimAutoreleasedReturnValue();
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentLockedSelector"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentLockedSelector = v5->_contentLockedSelector;
    v5->_contentLockedSelector = (MAAutoAssetSelector *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentLockedReason"));
    v14 = objc_claimAutoreleasedReturnValue();
    contentLockedReason = v5->_contentLockedReason;
    v5->_contentLockedReason = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localContentURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    v25[5] = objc_opt_class();
    v25[6] = objc_opt_class();
    v25[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("assetAttributes"));
    v21 = objc_claimAutoreleasedReturnValue();
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MAAutoAsset autoAssetClientName](self, "autoAssetClientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("autoAssetClientName"));

  -[MAAutoAsset assetSelector](self, "assetSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetSelector"));

  -[MAAutoAsset updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("updateCategoryDesiredByClient"));

  -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contentLockedSelector"));

  -[MAAutoAsset contentLockedReason](self, "contentLockedReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("contentLockedReason"));

  -[MAAutoAsset localContentURL](self, "localContentURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("localContentURL"));

  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("assetAttributes"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)interestInContent:(id)a3 completion:(id)a4
{
  -[MAAutoAsset interestInContent:withInterestPolicy:completion:](self, "interestInContent:withInterestPolicy:completion:", a3, 0, a4);
}

- (void)interestInContent:(id)a3 withInterestPolicy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke;
    v13[3] = &unk_1E5D5CB68;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v16 = v10;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset interestInContent:withInterestPolicy:completion:].cold.1();

  }
}

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  void *v11;
  MAAutoAssetInfoDesire *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedInterestInContent:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v10, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), -101, -101, 0);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("desire"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:INTEREST_IN_CONTENT"), v15, 0, v13);
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v17, "connectClientSendServerMessage:proxyObject:withReply:", v16, 0, v18);

  }
}

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = *(void **)(a1 + 32);
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = *(void **)(a1 + 32);
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(v9, "_failedInterestInContent:withResponseError:description:completion:", v10, v11, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_successInterestInContent:completion:", v7, *(_QWORD *)(a1 + 40));

  }
}

- (id)interestInContentSync:(id)a3
{
  return -[MAAutoAsset interestInContentSync:withInterestPolicy:](self, "interestInContentSync:withInterestPolicy:", a3, 0);
}

- (id)interestInContentSync:(id)a3 withInterestPolicy:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[8];
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;

  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke;
  v15[3] = &unk_1E5D5DFF0;
  v17 = v21;
  v18 = v31;
  v19 = &v25;
  v20 = v23;
  v10 = v8;
  v16 = v10;
  -[MAAutoAsset interestInContent:withInterestPolicy:completion:](self, "interestInContent:withInterestPolicy:completion:", v6, v7, v15);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v10, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v23;
    block[5] = v21;
    block[6] = v31;
    block[7] = &v25;
    dispatch_sync(v11, block);

  }
  v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return v12;
}

void __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v12 = v5;
  v13 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(interestInContentSync)"), 0, CFSTR("timeout (at framework layer) while waiting for interest-in-content to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)checkForNewer:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
  -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:](self, "checkForNewer:withUsagePolicy:withTimeout:completion:", a3, 0, a4, a5);
}

- (void)checkForNewer:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  int64_t v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke;
    v15[3] = &unk_1E5D5E040;
    v15[4] = self;
    v16 = v11;
    v17 = v10;
    v19 = a5;
    v18 = v12;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:].cold.1();

  }
}

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  void *v11;
  MAAutoAssetInfoDesire *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedCheckForNewer:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v10, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), -101, 0);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("desire"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:CHECK_FOR_NEWER"), v15, 0, v13);
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v17, "connectClientSendServerMessage:proxyObject:withReply:", v16, 0, v18);

  }
}

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      v13 = CFSTR("failure reported by server");
      v14 = 0;
      v15 = v5;
    }
    else
    {
      v13 = CFSTR("no response message from server");
      v14 = 6104;
      v15 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedCheckForNewer:withResponseError:description:completion:", v14, v15, v13, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v16, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("found"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "newerVersionError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v7, "currentStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "newerVersionError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_failedCheckForNewer:withResponseError:description:completion:", 0, v12, CFSTR("found-information indicated error"), *(_QWORD *)(a1 + 40));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_successCheckForNewer:completion:", v7, *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_failedCheckForNewer:withResponseError:description:completion:", 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 40));
    }

  }
}

- (id)checkForNewerSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  return -[MAAutoAsset checkForNewerSync:withUsagePolicy:withTimeout:discoveredAttributes:error:](self, "checkForNewerSync:withUsagePolicy:withTimeout:discoveredAttributes:error:", a3, 0, a4, a5, a6);
}

- (id)checkForNewerSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 discoveredAttributes:(id *)a6 error:(id *)a7
{
  id v10;
  id v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[8];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[3];
  char v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v10 = a3;
  v11 = a4;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__5;
  v50 = __Block_byref_object_dispose__5;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__5;
  v44 = __Block_byref_object_dispose__5;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v12 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke;
  v20[3] = &unk_1E5D5E090;
  v22 = v28;
  v23 = &v46;
  v24 = v32;
  v25 = &v40;
  v26 = &v34;
  v27 = v30;
  v13 = v12;
  v21 = v13;
  -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:](self, "checkForNewer:withUsagePolicy:withTimeout:completion:", v10, v11, a5, v20);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v13, a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v30;
    block[5] = v28;
    block[6] = &v40;
    block[7] = &v34;
    dispatch_sync(v14, block);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v41[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v35[5]);
  v15 = (id)v47[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v15;
}

void __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  __int128 v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char v26;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v17 = *(_OWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 64);
  v23 = *(_OWORD *)(a1 + 48);
  v24 = v13;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_1E5D5E068;
  v26 = a3;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v25 = *(_QWORD *)(a1 + 80);
  v14 = v17[0];
  v22 = *(_OWORD *)v17;
  v15 = v11;
  v16 = v10;
  v17[0] = v9;
  dispatch_sync(v12, block);

}

intptr_t __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = *(_BYTE *)(v1 + 112);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 40), *(id *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }
  return result;
}

void __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(checkForNewerSync)"), 0, CFSTR("timeout (at framework layer) while waiting for check-for-newer to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)determineIfAvailable:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke;
    v12[3] = &unk_1E5D5E0B8;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset determineIfAvailable:withTimeout:completion:].cold.1();

  }
}

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  void *v11;
  MAAutoAssetInfoDesire *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedDetermineIfAvailable:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v10, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v11, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), -101, 0);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("desire"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:DETERMINE_IF_AVAILABLE"), v15, 0, v13);
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v17, "connectClientSendServerMessage:proxyObject:withReply:", v16, 0, v18);

  }
}

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      v13 = CFSTR("failure reported by server");
      v14 = 0;
      v15 = v5;
    }
    else
    {
      v13 = CFSTR("no response message from server");
      v14 = 6104;
      v15 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedDetermineIfAvailable:withResponseError:description:completion:", v14, v15, v13, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v16, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("found"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "newerVersionError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v7, "currentStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "newerVersionError");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_failedDetermineIfAvailable:withResponseError:description:completion:", 0, v12, CFSTR("found-information indicated error"), *(_QWORD *)(a1 + 40));

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_successDetermineIfAvailable:completion:", v7, *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_failedDetermineIfAvailable:withResponseError:description:completion:", 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 40));
    }

  }
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[8];
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v9 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5;
  v46 = __Block_byref_object_dispose__5;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke;
  v19[3] = &unk_1E5D5E108;
  v21 = v26;
  v22 = &v42;
  v12 = v9;
  v23 = &v36;
  v24 = &v30;
  v25 = v28;
  v13 = v10;
  v20 = v13;
  -[MAAutoAsset determineIfAvailable:withTimeout:completion:](self, "determineIfAvailable:withTimeout:completion:", v9, a4, v19);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v13, a4))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v28;
    block[5] = v26;
    block[6] = &v36;
    block[7] = &v30;
    dispatch_sync(v14, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v37[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v31[5]);
  v15 = (id)v43[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v15;
}

void __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v15 = a1[2];
  v11 = a1[4];
  v21 = a1[3];
  v22 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_1E5D5E0E0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v12 = v15[0];
  v20 = *(_OWORD *)v15;
  v13 = v9;
  v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);

}

intptr_t __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }
  return result;
}

void __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(determineIfAvailableSync)"), 0, CFSTR("timeout (at framework layer) while waiting for determine-if-available to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

+ (BOOL)hasStartupActivatedCompletedOnce
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/run/MobileAssetStartupActivation.doneThisBoot"));

  return v3;
}

- (void)currentStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__MAAutoAsset_currentStatus___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset currentStatus:].cold.1();

  }
}

void __29__MAAutoAsset_currentStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedCurrentStatus:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:CURRENT_STATUS"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __29__MAAutoAsset_currentStatus___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __29__MAAutoAsset_currentStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15 && !v5)
  {
    objc_msgSend(v15, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("found"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      if (v8)
      {
        objc_msgSend(v9, "_successCurrentStatus:completion:", v7, *(_QWORD *)(a1 + 40));
LABEL_13:

        goto LABEL_14;
      }
      v14 = CFSTR("found-information yet no status provided");
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v14 = CFSTR("no found-information provided by server");
    }
    objc_msgSend(v9, "_failedCurrentStatus:withResponseError:description:completion:", 6104, 0, v14, v10);
    goto LABEL_13;
  }
  if (v5)
  {
    v11 = CFSTR("failure reported by server");
    v12 = 0;
    v13 = v5;
  }
  else
  {
    v11 = CFSTR("no response message from server");
    v12 = 6104;
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_failedCurrentStatus:withResponseError:description:completion:", v12, v13, v11, *(_QWORD *)(a1 + 40));
LABEL_14:

}

- (id)currentStatusSync:(id *)a3
{
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[8];
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__MAAutoAsset_currentStatusSync___block_invoke;
  v12[3] = &unk_1E5D5E158;
  v14 = v18;
  v15 = &v28;
  v16 = &v22;
  v17 = v20;
  v7 = v5;
  v13 = v7;
  -[MAAutoAsset currentStatus:](self, "currentStatus:", v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v7, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v20;
    block[5] = v18;
    block[6] = &v28;
    block[7] = &v22;
    dispatch_sync(v8, block);

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v23[5]);
  v9 = (id)v29[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v9;
}

void __33__MAAutoAsset_currentStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v12 = v5;
  v13 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __33__MAAutoAsset_currentStatusSync___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __33__MAAutoAsset_currentStatusSync___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(currentStatusSync)"), 0, CFSTR("timeout (at framework layer) while waiting for current-status to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", a3, 0, a4, 0, a5);
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, 0, a6);
}

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 reportingProgress:(id)a5 completion:(id)a6
{
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", a3, 0, a4, a5, a6);
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke;
    v18[3] = &unk_1E5D5E1A8;
    v23 = a5;
    v18[4] = self;
    v19 = v13;
    v20 = v12;
    v21 = v14;
    v22 = v15;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:].cold.1();

  }
}

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  MAAutoAssetInfoInstance *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  MAAutoAssetInfoDesire *v11;
  void *v12;
  MAAutoAssetInfoDesire *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedLockContent:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (*(_QWORD *)(a1 + 72))
      v3 = -2;
    else
      v3 = 0;
    v4 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __maAutoAssetSharedClientProcessName;
    v7 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v4, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v5, v6, v7, v8, v9);

    v11 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v11, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56) != 0);

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSafeObject:forKey:", v10, CFSTR("instance"));
    objc_msgSend(v14, "setSafeObject:forKey:", v13, CFSTR("desire"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:LOCK_CONTENT"), v16, 0, v14);
    v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProxyObjectForLockProgressBlock:", *(_QWORD *)(a1 + 56));
    v19 = (void *)__maAutoAssetSharedConnectionClient;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v22[3] = &unk_1E5D5E180;
    v20 = *(_QWORD *)(a1 + 32);
    v23 = v18;
    v24 = v20;
    v25 = *(id *)(a1 + 64);
    v21 = v18;
    objc_msgSend(v19, "connectClientSendServerMessage:proxyObject:withReply:", v17, v21, v22);

  }
}

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  id v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!v18 || v5)
  {
    if (v5)
    {
      v15 = CFSTR("failure reported by server");
      v16 = 0;
      v17 = v5;
    }
    else
    {
      v15 = CFSTR("no response message from server");
      v16 = 6104;
      v17 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "_failedLockContent:withResponseError:description:completion:", v16, v17, v15, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v18, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("found"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeObjectForKey:ofClass:", CFSTR("desire"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeStringForKey:", CFSTR("sandboxExtensionKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "message");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeStringForKey:", CFSTR("sandboxExtensionPathKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 40);
    if (v7)
      objc_msgSend(v14, "_successLockContent:dueToDesire:sandboxExtension:sandboxExtensionPath:completion:", v7, v9, v11, v13, *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v14, "_failedLockContent:withResponseError:description:completion:", 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 48));

  }
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:](self, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:", a3, 0, a4, a5, a6, a7, 0);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:](self, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:](self, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:", a3, 0, a4, a5, a6, a7, a8);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[11];
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[3];
  char v35;
  _QWORD v36[3];
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[3];
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v11 = a3;
  v12 = a4;
  v13 = a9;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__5;
  v62 = __Block_byref_object_dispose__5;
  v63 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__5;
  v54 = __Block_byref_object_dispose__5;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__5;
  v48 = __Block_byref_object_dispose__5;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__5;
  v42 = __Block_byref_object_dispose__5;
  v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v14 = dispatch_semaphore_create(0);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke;
  v25[3] = &unk_1E5D5E1F8;
  v27 = v34;
  v28 = &v58;
  v29 = v56;
  v30 = &v50;
  v31 = &v44;
  v32 = &v38;
  v15 = v13;
  v33 = v36;
  v16 = v14;
  v26 = v16;
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", v11, v12, a5, v15, v25);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v16, a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E5D5E220;
    block[4] = v36;
    block[5] = v34;
    block[6] = &v58;
    block[7] = v56;
    block[8] = &v50;
    block[9] = &v44;
    block[10] = &v38;
    dispatch_sync(v17, block);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v59[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v45[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v39[5]);
  v18 = (id)v51[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);

  return v18;
}

void __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, char a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22[2];
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  v16 = a1[4];
  v17 = a1[5];
  *(_OWORD *)v22 = a1[2];
  v29 = a1[3];
  v30 = v16;
  v31 = v17;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E5D5E1D0;
  v32 = a3;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v18 = v22[0];
  v28 = *(_OWORD *)v22;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22[0] = v11;
  dispatch_sync(v15, block);

}

intptr_t __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 24) = *(_BYTE *)(v1 + 128);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 40), *(id *)(v1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 64));
  }
  return result;
}

void __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    v4 = *(_QWORD *)(a1[8] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1[9] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(lockContentSync)"), 0, CFSTR("timeout (at framework layer) while waiting for lock-content to complete"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[10] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)mapLockedContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset mapLockedContent:completion:].cold.1();

  }
}

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  void *v11;
  MAAutoAssetInfoDesire *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedMapLockedContent:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v10, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v11, 0, *(_QWORD *)(a1 + 40), 0, 0, 0);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("desire"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"), v15, 0, v13);
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v17, "connectClientSendServerMessage:proxyObject:withReply:", v16, 0, v18);

  }
}

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (!v14 || v5)
  {
    if (v5)
    {
      v11 = CFSTR("failure reported by server");
      v12 = 0;
      v13 = v5;
    }
    else
    {
      v11 = CFSTR("no response message from server");
      v12 = 6104;
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedMapLockedContent:withResponseError:description:completion:", v12, v13, v11, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v14, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("found"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeObjectForKey:ofClass:", CFSTR("desire"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v10, "_successMapLockedContent:dueToDesire:completion:", v7, v9, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v10, "_failedMapLockedContent:withResponseError:description:completion:", 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

- (id)mapLockedContentSync:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[8];
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke;
  v14[3] = &unk_1E5D5DFF0;
  v16 = v20;
  v17 = &v30;
  v18 = &v24;
  v19 = v22;
  v9 = v7;
  v15 = v9;
  -[MAAutoAsset mapLockedContent:completion:](self, "mapLockedContent:completion:", v6, v14);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v9, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v22;
    block[5] = v20;
    block[6] = &v30;
    block[7] = &v24;
    dispatch_sync(v10, block);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v25[5]);
  v11 = (id)v31[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

void __42__MAAutoAsset_mapLockedContentSync_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v12 = v5;
  v13 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(mapLockedContentSync)"), 0, CFSTR("timeout (at framework layer) while waiting for map-locked-content to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)continueLockUsage:(id)a3 completion:(id)a4
{
  -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:](self, "continueLockUsage:withUsagePolicy:completion:", a3, 0, a4);
}

- (void)continueLockUsage:(id)a3 withUsagePolicy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke;
    v13[3] = &unk_1E5D5CB68;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v16 = v10;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:].cold.1();

  }
}

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MAAutoAssetInfoDesire *v12;
  void *v13;
  MAAutoAssetInfoDesire *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedContinueLockUsage:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "contentLockedSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "contentLockedSelector");
    else
      objc_msgSend(v8, "assetSelector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v9, v10);

    v12 = [MAAutoAssetInfoDesire alloc];
    objc_msgSend(*(id *)(a1 + 32), "updateCategoryDesiredByClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v12, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), -101, -101, 0);

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setSafeObject:forKey:", v11, CFSTR("instance"));
    objc_msgSend(v15, "setSafeObject:forKey:", v14, CFSTR("desire"));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:CONTINUE_LOCK_USAGE"), v17, 0, v15);
    v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2;
    v20[3] = &unk_1E5D5CB18;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 56);
    objc_msgSend(v19, "connectClientSendServerMessage:proxyObject:withReply:", v18, 0, v20);

  }
}

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = *(void **)(a1 + 32);
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = *(void **)(a1 + 32);
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(v9, "_failedContinueLockUsage:withResponseError:description:completion:", v10, v11, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_successContinueLockUsage:completion:", v7, *(_QWORD *)(a1 + 40));

  }
}

- (id)continueLockUsageSync:(id)a3
{
  return -[MAAutoAsset continueLockUsageSync:withUsagePolicy:](self, "continueLockUsageSync:withUsagePolicy:", a3, 0);
}

- (id)continueLockUsageSync:(id)a3 withUsagePolicy:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[8];
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;

  v6 = a3;
  v7 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5;
  v29 = __Block_byref_object_dispose__5;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke;
  v15[3] = &unk_1E5D5DFF0;
  v17 = v21;
  v18 = v31;
  v19 = &v25;
  v20 = v23;
  v10 = v8;
  v16 = v10;
  -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:](self, "continueLockUsage:withUsagePolicy:completion:", v6, v7, v15);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v10, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v23;
    block[5] = v21;
    block[6] = v31;
    block[7] = &v25;
    dispatch_sync(v11, block);

  }
  v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return v12;
}

void __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v12 = v5;
  v13 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(contniueLockUsageSync)"), 0, CFSTR("timeout (at framework layer) while waiting for continue-lock-usage to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)endLockUsage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset endLockUsage:completion:].cold.1();

  }
}

void __39__MAAutoAsset_endLockUsage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  MAAutoAssetInfoEnd *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEndLockUsage:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "contentLockedSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "contentLockedSelector");
    else
      objc_msgSend(v8, "assetSelector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v9, v10);

    v12 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]([MAAutoAssetInfoEnd alloc], "initWithLockReason:endingLockCount:", *(_QWORD *)(a1 + 40), 1);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setSafeObject:forKey:", v11, CFSTR("instance"));
    objc_msgSend(v13, "setSafeObject:forKey:", v12, CFSTR("end"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:END_LOCK_USAGE"), v15, 0, v13);
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v17, "connectClientSendServerMessage:proxyObject:withReply:", v16, 0, v18);

  }
}

void __39__MAAutoAsset_endLockUsage_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = *(void **)(a1 + 32);
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = *(void **)(a1 + 32);
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(v9, "_failedEndLockUsage:withResponseError:description:completion:", v10, v11, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_successEndLockUsage:completion:", v7, *(_QWORD *)(a1 + 40));

  }
}

- (id)endLockUsageSync:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[8];
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__5;
  v28[4] = __Block_byref_object_dispose__5;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke;
  v12[3] = &unk_1E5D5DFF0;
  v14 = v18;
  v15 = v28;
  v16 = &v22;
  v17 = v20;
  v7 = v5;
  v13 = v7;
  -[MAAutoAsset endLockUsage:completion:](self, "endLockUsage:completion:", v4, v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v7, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v20;
    block[5] = v18;
    block[6] = v28;
    block[7] = &v22;
    dispatch_sync(v8, block);

  }
  v9 = (id)v23[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
  return v9;
}

void __32__MAAutoAsset_endLockUsageSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v12 = v5;
  v13 = v6;
  v16 = *(_QWORD *)(a1 + 64);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __32__MAAutoAsset_endLockUsageSync___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __32__MAAutoAsset_endLockUsageSync___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(endLockUsageSync)"), 0, CFSTR("timeout (at framework layer) while waiting for end-lock-usage to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (id)assetAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MAAutoAsset assetAttributes](self, "assetAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAsset summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|attribs:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)summary
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v23;

  -[MAAutoAsset updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAsset updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("desired:%@"), v5);

  }
  else
  {
    v6 = CFSTR("byPolicy");
  }
  -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[MAAutoAsset contentLockedReason](self, "contentLockedReason"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset contentLockedReason](self, "contentLockedReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset localContentURL](self, "localContentURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__CFString *)objc_msgSend(v8, "initWithFormat:", CFSTR("locked:%@(%@)|URL:%@"), v10, v11, v13);

    goto LABEL_8;
  }
  -[MAAutoAsset localContentURL](self, "localContentURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    goto LABEL_7;
  v14 = CFSTR("unlocked");
LABEL_8:
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAsset autoAssetClientName](self, "autoAssetClientName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetSelector](self, "assetSelector");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "summary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("(w/attribs)");
  if (!v19)
    v20 = &stru_1E5D5F930;
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@(%@)|%@|%@%@"), v16, v18, v6, v14, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v4 = (void (**)(id, _QWORD))a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_1E5D5E248;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSharedDispatchOnce != -1)
    dispatch_once(&__maAutoAssetSharedDispatchOnce, v5);
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);

}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  uint8_t buf[16];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  v14 = (void *)__maAutoAssetSharedClientProcessName;
  __maAutoAssetSharedClientProcessName = v13;

  __maAutoAssetSharedClientProcessID = getpid();
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:INTEREST_IN_CONTENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:CHECK_FOR_NEWER"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:DETERMINE_IF_AVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:CURRENT_STATUS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:LOCK_CONTENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:CONTINUE_LOCK_USAGE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:END_LOCK_USAGE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:END_PREVIOUS_LOCKS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:END_ALL_PREVIOUS_LOCKS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:DOWNLOAD_GROUPS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:DOWNLOAD_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:CANCEL_OPERATION"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:PURGE_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE:ERASE_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):INTEREST_IN_CONTENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):CHECK_FOR_NEWER"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):DETERMINE_IF_AVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):CURRENT_STATUS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):LOCK_CONTENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):MAP_LOCKED_CONTENT_TO_EXCLAVE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):CONTINUE_LOCK_USAGE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):END_LOCK_USAGE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):END_PREVIOUS_LOCKS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):END_ALL_PREVIOUS_LOCKS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):CANCEL_ACTIVITY_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):ELIMINATE_ALL_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):ELIMINATE_ALL_FOR_ASSET_TYPE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO(REPLY):ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):CANCEL_OPERATION"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):PURGE_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-STAGE(REPLY):ERASE_ALL"));
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE33B000, v16, OS_LOG_TYPE_DEFAULT, "MA-auto{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks", buf, 2u);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8908]), "initForServiceName:delegate:clientID:", CFSTR("com.apple.mobileasset.autoasset"), *(_QWORD *)(a1 + 32), v31);
  v18 = (void *)MEMORY[0x1E0C99E60];
  v33[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProxyObjectClasses:", v20);

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8900]), "initWithClientPolicy:", v17);
  v22 = (void *)__maAutoAssetSharedConnectionClient;
  __maAutoAssetSharedConnectionClient = v21;

  if (__maAutoAssetSharedConnectionClient)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE33B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto{connectToServerFrameworkCompletion} connection client initialized for server connection", buf, 2u);
    }
  }
  else
  {
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6104, CFSTR("auto(connectToServerFrameworkCompletion)"), 0, CFSTR("unable to create shared SUCoreConnectClient for the client process"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1();
  }

}

- (id)_newProxyObjectForLockProgressBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__433;
  v15[4] = __Block_byref_object_dispose__434;
  objc_initWeak(&v16, self);
  v5 = objc_alloc(MEMORY[0x1E0DA8910]);
  +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke;
  v12[3] = &unk_1E5D5E270;
  v14 = v15;
  v9 = v4;
  v13 = v9;
  v10 = (void *)objc_msgSend(v5, "initWithClientID:completionQueue:genericBlock:", v7, v8, v12);

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1();
    goto LABEL_11;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "_lockContentStatusProgress:lockForUseError:progressBlock:", v3, 0, *(_QWORD *)(a1 + 32));
LABEL_12:

}

- (id)_newProxyObjectForStageProgressBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__433;
  v15[4] = __Block_byref_object_dispose__434;
  objc_initWeak(&v16, self);
  v5 = objc_alloc(MEMORY[0x1E0DA8910]);
  +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke;
  v12[3] = &unk_1E5D5E270;
  v14 = v15;
  v9 = v4;
  v13 = v9;
  v10 = (void *)objc_msgSend(v5, "initWithClientID:completionQueue:genericBlock:", v7, v8, v12);

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1();
    goto LABEL_11;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "_lockContentStatusProgress:lockForUseError:progressBlock:", v3, 0, *(_QWORD *)(a1 + 32));
LABEL_12:

}

- (void)_successInterestInContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAsset__successInterestInContent_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successInterestInContent:completion:].cold.1(v6);
  }

}

uint64_t __52__MAAutoAsset__successInterestInContent_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successInterestInContent} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_failedInterestInContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("interestInContent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedInterestInContent:withResponseError:description:completion:].cold.1();

  }
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(interestInContent)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedInterestInContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successCheckForNewer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[MAAutoAsset localContentURL](self, "localContentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__MAAutoAsset__successCheckForNewer_completion___block_invoke;
      v14[3] = &unk_1E5D5CC20;
      v15 = v6;
      v16 = v7;
      dispatch_async(v9, v14);

      v10 = v15;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(v6, "currentStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "newerVersionAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setAssetAttributes:](self, "setAssetAttributes:", v12);

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MAAutoAsset _successCheckForNewer:completion:].cold.1(v6);
LABEL_7:

}

void __48__MAAutoAsset__successCheckForNewer_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "newerVersionAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1AE33B000, v5, OS_LOG_TYPE_DEFAULT, "MA-auto{_successCheckForNewer} | %{public}@ | SUCCESS", (uint8_t *)&v11, 0xCu);

  }
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fullAssetSelector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "newerVersionAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, BOOL, void *, _QWORD))(v7 + 16))(v7, v8, v3 != 0, v10, 0);

}

- (void)_failedCheckForNewer:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5CC48;
    block[4] = self;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v15);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("checkForNewer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v15);
    }
    v17 = (void *)v16;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedCheckForNewer:withResponseError:description:completion:].cold.1();

  }
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  if (v3
    || (v7 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v7, CFSTR("auto(checkForNewer)"), 0, *(_QWORD *)(a1 + 48)), (v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1(a1, v3);

    v6 = v2;
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1AE33B000, v6, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCheckForNewer} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v3 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successDetermineIfAvailable:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[MAAutoAsset localContentURL](self, "localContentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke;
      v14[3] = &unk_1E5D5CC20;
      v15 = v6;
      v16 = v7;
      dispatch_async(v9, v14);

      v10 = v15;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(v6, "assetAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setAssetAttributes:](self, "setAssetAttributes:", v11);

    objc_msgSend(v6, "localContentURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setLocalContentURL:](self, "setLocalContentURL:", v12);

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[MAAutoAsset _successDetermineIfAvailable:completion:].cold.1(v6);
LABEL_7:

}

void __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successDetermineIfAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fullAssetSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v6, v7, 0);

}

- (void)_failedDetermineIfAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5CC48;
    block[4] = self;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v15);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("determineIfAvailable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v15);
    }
    v17 = (void *)v16;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedDetermineIfAvailable:withResponseError:description:completion:].cold.1();

  }
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  if (v3
    || (v7 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v7, CFSTR("auto(determineIfAvailable)"), 0, *(_QWORD *)(a1 + 48)), (v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1(a1, v3);

    v6 = v2;
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1AE33B000, v6, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedDetermineIfAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v3 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successCurrentStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__MAAutoAsset__successCurrentStatus_completion___block_invoke;
    v11[3] = &unk_1E5D5CD38;
    v13 = v7;
    v12 = v6;
    dispatch_async(v8, v11);

    v9 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successCurrentStatus:completion:].cold.1(v6);
  }

}

void __48__MAAutoAsset__successCurrentStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentStatus");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)_failedCurrentStatus:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("currentStatus"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedCurrentStatus:withResponseError:description:completion:].cold.1();

  }
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(currentStatus)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCurrentStatus} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_lockContentStatusProgress:(id)a3 lockForUseError:(id)a4 progressBlock:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke;
    v14[3] = &unk_1E5D5CD38;
    v16 = v8;
    v15 = v7;
    dispatch_async(v10, v14);

    v11 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "summary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1AE33B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto{_lockContentStatusProgress} | no client progress block | %{public}@", buf, 0xCu);

    }
  }

}

uint64_t __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_successLockContent:(id)a3 dueToDesire:(id)a4 sandboxExtension:(id)a5 sandboxExtensionPath:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
  block[3] = &unk_1E5D5E298;
  block[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  v21 = v13;
  v22 = v12;
  dispatch_sync(v17, block);

}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 40), "currentStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "newerVersionAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 - 8), "setAssetAttributes:", v4);

  objc_msgSend(*(id *)v2, "fullAssetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 - 8), "setContentLockedSelector:", v5);

  objc_msgSend(*(id *)(v2 + 8), "desireReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 - 8), "setContentLockedReason:", v6);

  objc_msgSend(*(id *)v2, "localContentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 - 8), "setLocalContentURL:", v7);

  objc_msgSend(*(id *)(v2 - 8), "setLocksOfContent:", objc_msgSend(*(id *)(v2 - 8), "locksOfContent") + 1);
  if (*(_QWORD *)(v2 + 32))
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:](MAAutoAssetAuthorizationPolicy, "consumeSandboxExtension:forPath:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_450;
    v11[3] = &unk_1E5D5CC20;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 72);
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1((id *)v2);
  }

}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_450(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successLockContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fullAssetSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localContentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void *, _QWORD, _QWORD))(v5 + 16))(v5, v6, 1, v7, 0, 0);

}

- (void)_failedLockContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  MAAutoAsset *v23;
  id v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5E2C0;
    v21 = v10;
    v25 = a3;
    v22 = v11;
    v23 = self;
    v24 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("lockContent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedLockContent:withResponseError:description:completion:].cold.1();

  }
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(lockContent)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedLockContent} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v2 = 0;
  }

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD, id))(v8 + 16))(v8, v9, 0, 0, 0, v2);

}

- (void)_successMapLockedContent:(id)a3 dueToDesire:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  MAAutoAsset *v14;
  id v15;

  v7 = a3;
  v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke;
  block[3] = &unk_1E5D5E2E8;
  v14 = self;
  v15 = v8;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_sync(v9, block);

}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  NSObject *v6;
  id v7;

  if (a1[6])
  {
    objc_msgSend(a1[5], "completionDispatchQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_453;
    v5[3] = &unk_1E5D5CC20;
    v6 = a1[4];
    v7 = a1[6];
    dispatch_async(v2, v5);

    v3 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1((uint64_t)a1);
  }

}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_453(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successMapLockedContent} | %{public}@ | SUCCESS", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fullAssetSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

- (void)_failedMapLockedContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("mapLockedContent"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedMapLockedContent:withResponseError:description:completion:].cold.1();

  }
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(lockContent)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedMapLockedContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successContinueLockUsage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successContinueLockUsage:completion:].cold.1(v6);
  }

}

uint64_t __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successContinueLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_failedContinueLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  MAAutoAsset *v23;
  id v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5E2C0;
    v21 = v10;
    v25 = a3;
    v22 = v11;
    v23 = self;
    v24 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("continueLockUsage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedContinueLockUsage:withResponseError:description:completion:].cold.1();

  }
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(continueLockUsage)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedContinueLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v2 = 0;
  }

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);

}

- (void)_successEndLockUsage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke;
  block[3] = &unk_1E5D5E310;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke(id *a1)
{
  id *v2;
  int v3;
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;

  v2 = a1 + 4;
  v3 = objc_msgSend(a1[4], "locksOfContent");
  v4 = *v2;
  v5 = objc_msgSend(*v2, "locksOfContent");
  if (v3 < 1)
  {
    if (!v5)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2((uint64_t)a1, v2, v9);

    v7 = *v2;
    v6 = 0;
  }
  else
  {
    v6 = (v5 - 1);
    v7 = v4;
  }
  objc_msgSend(v7, "setLocksOfContent:", v6);
LABEL_8:
  if ((int)objc_msgSend(*v2, "locksOfContent") <= 0)
  {
    objc_msgSend(*v2, "setLocalContentURL:", 0);
    objc_msgSend(*v2, "setContentLockedSelector:", 0);
    objc_msgSend(*v2, "setContentLockedReason:", 0);
  }
  if (a1[6])
  {
    objc_msgSend(a1[4], "completionDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_456;
    v13[3] = &unk_1E5D5CC20;
    v14 = a1[5];
    v15 = a1[6];
    dispatch_async(v10, v13);

    v11 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1((uint64_t)a1);
  }

}

uint64_t __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_456(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successEndLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_failedEndLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  MAAutoAsset *v23;
  id v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5E2C0;
    v21 = v10;
    v25 = a3;
    v22 = v11;
    v23 = self;
    v24 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("endLockUsage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedEndLockUsage:withResponseError:description:completion:].cold.1();

  }
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(endLockUsage)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedEndLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v2 = 0;
  }

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);

}

- (void)_successCancelActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MAAutoAsset__successCancelActivity___block_invoke;
  block[3] = &unk_1E5D5CD38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __38__MAAutoAsset__successCancelActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionDispatchQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__MAAutoAsset__successCancelActivity___block_invoke_459;
    v6[3] = &unk_1E5D5CC20;
    v3 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    dispatch_async(v2, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(a1);

  }
}

void __38__MAAutoAsset__successCancelActivity___block_invoke_459(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successCancelActivity} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

}

- (void)_failedCancelActivity:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  MAAutoAsset *v23;
  id v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5E2C0;
    v21 = v10;
    v25 = a3;
    v22 = v11;
    v23 = self;
    v24 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("cancelActivity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedCancelActivity:withResponseError:description:completion:].cold.1();

  }
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(cancelActivity)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCancelActivity} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v2 = 0;
  }

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);

}

- (void)_successEliminate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MAAutoAsset__successEliminate___block_invoke;
  block[3] = &unk_1E5D5CD38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __33__MAAutoAsset__successEliminate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "completionDispatchQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__MAAutoAsset__successEliminate___block_invoke_464;
    v6[3] = &unk_1E5D5CC20;
    v3 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    dispatch_async(v2, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __33__MAAutoAsset__successEliminate___block_invoke_cold_1(a1);

  }
}

void __33__MAAutoAsset__successEliminate___block_invoke_464(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successEliminate} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

}

- (void)_failedEliminate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  MAAutoAsset *v23;
  id v24;
  int64_t v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5E2C0;
    v21 = v10;
    v25 = a3;
    v22 = v11;
    v23 = self;
    v24 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("eliminateAll"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedEliminate:withResponseError:description:completion:].cold.1();

  }
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(eliminateAll)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedEliminate} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    v2 = 0;
  }

  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);

}

- (void)_successStageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageDetermineGroupsAvailableForUpdate:completion:].cold.1(v6);
  }

}

void __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | staging:%{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "byGroupAvailableForStagingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "byGroupTotalExpectedBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v6, v7, 0);

}

- (void)_failedStageDetermineGroupsAvailableForUpdate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageDetermineGroupsAvailableForStaging"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:].cold.1();

  }
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageDetermineAllAvailable)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successStageDetermineAllAvailable:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageDetermineAllAvailable:completion:].cold.1(v6);
  }

}

void __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDetermineAllAvailable} | staging:%{public}@ | SUCCESS", (uint8_t *)&v7, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allAvailableForStagingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v5 + 16))(v5, v6, objc_msgSend(*(id *)(a1 + 32), "totalExpectedBytes"), 0);

}

- (void)_failedStageDetermineAllAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageDetermineAllAvailable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageDetermineAllAvailable:withResponseError:description:completion:].cold.1();

  }
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageDetermineAllAvailable)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_stageDownloadAllStatusProgress:(id)a3 stageProgressError:(id)a4 progressBlock:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke;
    v14[3] = &unk_1E5D5CD38;
    v16 = v8;
    v15 = v7;
    dispatch_async(v10, v14);

    v11 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "summary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1AE33B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_stageDownloadAllStatusProgress} | no client progress block | %{public}@", buf, 0xCu);

    }
  }

}

uint64_t __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_successStageDownloadGroups:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageDownloadGroups:completion:].cold.1(v6);
  }

}

void __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDownloadGroups} | staged:%{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "byGroupTotalStagedBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "byGroupAssetsSuccessfullyStaged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v6, v7, 0);

}

- (void)_failedStageDownloadGroups:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageDownloadGroups"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageDownloadGroups:withResponseError:description:completion:].cold.1();

  }
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageDownloadGroups)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successStageDownloadAll:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke;
    v11[3] = &unk_1E5D5CC20;
    v12 = v6;
    v13 = v7;
    dispatch_async(v8, v11);

    v9 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageDownloadAll:completion:].cold.1(v6);
  }

}

uint64_t __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDownloadAll} | staged:%{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "totalStagedBytes"), objc_msgSend(*(id *)(a1 + 32), "assetsSuccessfullyStaged"), 0);
}

- (void)_failedStageDownloadAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageDownloadAll"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageDownloadAll:withResponseError:description:completion:].cold.1();

  }
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageDownloadAll)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successStageCancelOperation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MAAutoAsset__successStageCancelOperation___block_invoke;
    block[3] = &unk_1E5D5DB30;
    v9 = v4;
    dispatch_async(v5, block);

    v6 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageCancelOperation:].cold.1();
  }

}

uint64_t __44__MAAutoAsset__successStageCancelOperation___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageCancelOperation} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_failedStageCancelOperation:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageCancelOperation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageCancelOperation:withResponseError:description:completion:].cold.1();

  }
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageCancelOperation)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successStagePurgeAll:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MAAutoAsset__successStagePurgeAll___block_invoke;
    block[3] = &unk_1E5D5DB30;
    v9 = v4;
    dispatch_async(v5, block);

    v6 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStagePurgeAll:].cold.1();
  }

}

uint64_t __37__MAAutoAsset__successStagePurgeAll___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStagePurgeAll} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_failedStagePurgeAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stagePurgeAll"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStagePurgeAll:withResponseError:description:completion:].cold.1();

  }
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stagePurgeAll)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_successStageEraseAll:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  NSObject *v9;

  v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MAAutoAsset__successStageEraseAll___block_invoke;
    block[3] = &unk_1E5D5DB30;
    v9 = v4;
    dispatch_async(v5, block);

    v6 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _successStageEraseAll:].cold.1();
  }

}

uint64_t __37__MAAutoAsset__successStageEraseAll___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageEraseAll} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_failedStageEraseAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5DA68;
    v21 = v10;
    v24 = a3;
    v22 = v11;
    v23 = v12;
    dispatch_async(v13, block);

    v14 = v21;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v10)
    {
      objc_msgSend(v10, "checkedSummary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | error:%@"), v11, v16);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, CFSTR("stageEraseAll"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ | result:%@"), v11, v16);
    }
    v14 = (void *)v17;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _failedStageEraseAll:withResponseError:description:completion:].cold.1();

  }
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, CFSTR("auto(stageEraseAll)"), 0, *(_QWORD *)(a1 + 40)), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
  +[MAAutoAsset interestInContent:forAssetSelector:withInterestPolicy:completion:](MAAutoAsset, "interestInContent:forAssetSelector:withInterestPolicy:completion:", a3, a4, 0, a5);
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v24 = 0;
    v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+interestInContent}"), v10, 0, 0, &v24);
    v14 = v24;
    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v16 = &v21;
      v21 = v12;
      v19 = v10;
      v20 = v14;
      dispatch_async(v15, block);

    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke;
      v22[3] = &unk_1E5D5E338;
      v16 = &v23;
      v23 = v12;
      objc_msgSend(v13, "interestInContent:withInterestPolicy:completion:", v9, v11, v22);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset interestInContent:forAssetSelector:withInterestPolicy:completion:].cold.1();
  }

}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset interestInContentSync:forAssetSelector:withInterestPolicy:](MAAutoAsset, "interestInContentSync:forAssetSelector:withInterestPolicy:", a3, a4, 0);
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v13 = 0;
  v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+interestInContentSync}"), v9, 0, 0, &v13);

  v11 = v13;
  if (!v11)
  {
    objc_msgSend(v10, "interestInContentSync:withInterestPolicy:", v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (void)determineIfAvailable:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v21 = 0;
    v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+determineIfAvailable}"), v8, 0, 0, &v21);
    v11 = v21;
    if (v11)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v13 = &v18;
      v18 = v9;
      v16 = v8;
      v17 = v11;
      dispatch_async(v12, block);

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke;
      v19[3] = &unk_1E5D5E360;
      v13 = &v20;
      v20 = v9;
      objc_msgSend(v10, "determineIfAvailable:withTimeout:completion:", v7, -2, v19);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset determineIfAvailable:forAssetSelector:completion:].cold.1();
  }

}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)determineIfAvailableSync:(id)a3 forAssetSelector:(id)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v17 = 0;
  v11 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+determineIfAvailableSync}"), v10, 0, 0, &v17);

  v12 = v17;
  if (!v12)
  {
    v16 = 0;
    objc_msgSend(v11, "determineIfAvailableSync:withTimeout:discoveredAttributes:error:", v9, -2, a5, &v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = v12;
  v14 = 0;
  if (a6)
LABEL_3:
    *a6 = objc_retainAutorelease(v13);
LABEL_4:

  return v14;
}

+ (void)endPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5 completion:(id)a6
{
  +[MAAutoAsset endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:](MAAutoAsset, "endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:", a3, 0, a4, a5, a6);
}

+ (void)endPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v14)
  {
    v26 = 0;
    v15 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v12, v13, 0, 0, &v26);
    v16 = v26;
    if (v16)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v18 = &v23;
      v23 = v14;
      v21 = v13;
      v22 = v16;
      dispatch_async(v17, block);

    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke;
      v24[3] = &unk_1E5D5E338;
      v18 = &v25;
      v25 = v14;
      objc_msgSend(v15, "_endPreviousLocksOfReason:removingLockCount:completion:", v11, a6, v24);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:].cold.1();
  }

}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endPreviousLocksOfReason:(id)a3 removingLockCount:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke;
    v12[3] = &unk_1E5D5E0B8;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _endPreviousLocksOfReason:removingLockCount:completion:].cold.1();

  }
}

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoEnd *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEndLockUsage:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]([MAAutoAssetInfoEnd alloc], "initWithLockReason:endingLockCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("end"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:END_PREVIOUS_LOCKS"), v13, 0, v11);
    v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = *(void **)(a1 + 32);
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = *(void **)(a1 + 32);
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(v9, "_failedEndLockUsage:withResponseError:description:completion:", v10, v11, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_successEndLockUsage:completion:", v7, *(_QWORD *)(a1 + 40));

  }
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5
{
  return +[MAAutoAsset endPreviousLocksOfReasonSync:forClientName:forAssetSelector:removingLockCount:](MAAutoAsset, "endPreviousLocksOfReasonSync:forClientName:forAssetSelector:removingLockCount:", a3, 0, a4, a5);
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v15 = 0;
  v12 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v11, v10, 0, 0, &v15);

  v13 = v15;
  if (!v13)
  {
    objc_msgSend(v12, "_endPreviousLocksOfReasonSync:removingLockCount:", v9, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_endPreviousLocksOfReasonSync:(id)a3 removingLockCount:(int64_t)a4
{
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[7];
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;
  _QWORD v21[3];
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke;
  v14[3] = &unk_1E5D5E3B0;
  v16 = v19;
  v17 = &v23;
  v18 = v21;
  v9 = v7;
  v15 = v9;
  -[MAAutoAsset _endPreviousLocksOfReason:removingLockCount:completion:](self, "_endPreviousLocksOfReason:removingLockCount:completion:", v6, a4, v14);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v9, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v21;
    block[5] = v19;
    block[6] = &v23;
    dispatch_sync(v10, block);

  }
  v11 = (id)v24[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(endPreviousLocksOfReasonSync)"), 0, CFSTR("timeout (at framework layer) while waiting for end-previous-locks to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)endAllPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
  +[MAAutoAsset endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:](MAAutoAsset, "endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:", a3, 0, a4, a5);
}

+ (void)endAllPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v24 = 0;
    v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v10, v11, 0, 0, &v24);
    v14 = v24;
    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v16 = &v21;
      v21 = v12;
      v19 = v11;
      v20 = v14;
      dispatch_async(v15, block);

    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke;
      v22[3] = &unk_1E5D5E338;
      v16 = &v23;
      v23 = v12;
      objc_msgSend(v13, "_endAllPreviousLocksOfReason:completion:", v9, v22);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:].cold.1();
  }

}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAllPreviousLocksOfReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _endAllPreviousLocksOfReason:completion:].cold.1();

  }
}

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoEnd *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEndLockUsage:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]([MAAutoAssetInfoEnd alloc], "initWithLockReason:endingLockCount:", *(_QWORD *)(a1 + 40), -1);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("end"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:END_ALL_PREVIOUS_LOCKS"), v13, 0, v11);
    v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = *(void **)(a1 + 32);
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = *(void **)(a1 + 32);
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(v9, "_failedEndLockUsage:withResponseError:description:completion:", v10, v11, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_successEndLockUsage:completion:", v7, *(_QWORD *)(a1 + 40));

  }
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:](MAAutoAsset, "endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:", a3, 0, a4);
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v13 = 0;
  v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v9, v8, 0, 0, &v13);

  v11 = v13;
  if (!v11)
  {
    objc_msgSend(v10, "_endAllPreviousLocksOfReasonSync:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_endAllPreviousLocksOfReasonSync:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[7];
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[3];
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke;
  v12[3] = &unk_1E5D5E3B0;
  v14 = v17;
  v15 = &v21;
  v16 = v19;
  v7 = v5;
  v13 = v7;
  -[MAAutoAsset _endAllPreviousLocksOfReason:completion:](self, "_endAllPreviousLocksOfReason:completion:", v4, v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v7, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v19;
    block[5] = v17;
    block[6] = &v21;
    dispatch_sync(v8, block);

  }
  v9 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(endAllPreviousLocksOfReasonSync)"), 0, CFSTR("timeout (at framework layer) while waiting for end-all-previous-locks to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)endAllPreviousLocksOfSelector:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke;
  v10[3] = &unk_1E5D5CD38;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke(uint64_t a1)
{
  id v2;

  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto(endAllPreviousLocksOfSelector:completion:)"), 0, CFSTR("method was never implemented [marked as deprecated] use endAllPreviousLocksOfSelector:forClientName:completion: instead"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)endAllPreviousLocksOfSelector:(id)a3 forClientName:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v21 = 0;
    v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v8, v7, 0, 0, &v21);
    v11 = v21;
    if (v11)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v13 = &v18;
      v18 = v9;
      v16 = v7;
      v17 = v11;
      dispatch_async(v12, block);

    }
    else
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke;
      v19[3] = &unk_1E5D5E338;
      v13 = &v20;
      v20 = v9;
      objc_msgSend(v10, "_endAllPreviousLocksOfReason:completion:", 0, v19);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset endAllPreviousLocksOfSelector:forClientName:completion:].cold.1();
  }

}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto(endAllPreviousLocksOfSelectorSync)"), 0, CFSTR("method was never implemented [marked as deprecated] use endAllPreviousLocksOfSelectorSync:forClientName: instead"));
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = 0;
  v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v5, v6, 0, 0, &v10);

  v8 = v10;
  if (!v8)
  {
    objc_msgSend(v7, "_endAllPreviousLocksOfReasonSync:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)cancelActivityForSelector:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v18 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+cancelActivityForSelector}"), v5, 0, 0, &v18);
    v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v10 = &v15;
      v15 = v6;
      v13 = v5;
      v14 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke;
      v16[3] = &unk_1E5D5E338;
      v10 = &v17;
      v17 = v6;
      objc_msgSend(v7, "_cancelActivityForSelector:", v16);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset cancelActivityForSelector:completion:].cold.1();
  }

}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_cancelActivityForSelector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _cancelActivityForSelector:].cold.1();

  }
}

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedCancelActivity:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedCancelActivity:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successCancelActivity:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)cancelActivityForSelectorSync:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v7;

  v3 = a3;
  v7 = 0;
  v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+cancelActivityForSelectorSync}"), v3, 0, 0, &v7);

  v5 = v7;
  if (!v5)
  {
    objc_msgSend(v4, "_cancelActivityForSelectorSync");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_cancelActivityForSelectorSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke;
  v10[3] = &unk_1E5D5E3B0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _cancelActivityForSelector:](self, "_cancelActivityForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(cancelActivityForSelectorSync)"), 0, CFSTR("timeout (at framework layer) while waiting for cancel-activity to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v18 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminateAllForSelector}"), v5, 0, 0, &v18);
    v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v10 = &v15;
      v15 = v6;
      v13 = v5;
      v14 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke;
      v16[3] = &unk_1E5D5E338;
      v10 = &v17;
      v17 = v6;
      objc_msgSend(v7, "_eliminateAllForSelector:", v16);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset eliminateAllForSelector:completion:].cold.1();
  }

}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForSelector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _eliminateAllForSelector:].cold.1();

  }
}

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEliminate:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedEliminate:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successEliminate:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)eliminateAllForSelectorSync:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v7;

  v3 = a3;
  v7 = 0;
  v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminateAllForSelectorSync}"), v3, 0, 0, &v7);

  v5 = v7;
  if (!v5)
  {
    objc_msgSend(v4, "_eliminateAllForSelectorSync");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_eliminateAllForSelectorSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke;
  v10[3] = &unk_1E5D5E3B0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _eliminateAllForSelector:](self, "_eliminateAllForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(eliminateAllForSelectorSync)"), 0, CFSTR("timeout (at framework layer) while waiting for elimination to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)eliminateAllForAssetType:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]([MAAutoAssetSelector alloc], "initForAssetType:withAssetSpecifier:", v5, CFSTR("MAAutoAsset-all-asset-specifiers"));
    v19 = 0;
    v8 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminateAllForAssetType}"), v7, 0, 0, &v19);
    v9 = v19;
    if (v9)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v11 = &v16;
      v16 = v6;
      v14 = v7;
      v15 = v9;
      dispatch_async(v10, block);

    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke;
      v17[3] = &unk_1E5D5E338;
      v11 = &v18;
      v18 = v6;
      objc_msgSend(v8, "_eliminateAllForAssetType:", v17);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset eliminateAllForAssetType:completion:].cold.1();
  }

}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForAssetType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _eliminateAllForAssetType:].cold.1();

  }
}

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEliminate:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedEliminate:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successEliminate:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)eliminateAllForAssetTypeSync:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;

  v3 = a3;
  v4 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]([MAAutoAssetSelector alloc], "initForAssetType:withAssetSpecifier:", v3, CFSTR("MAAutoAsset-all-asset-specifiers"));

  v8 = 0;
  v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminateAllForAssetTypeSync}"), v4, 0, 0, &v8);
  v6 = v8;
  if (!v6)
  {
    objc_msgSend(v5, "_eliminateAllForAssetTypeSync");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_eliminateAllForAssetTypeSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke;
  v10[3] = &unk_1E5D5E3B0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _eliminateAllForAssetType:](self, "_eliminateAllForAssetType:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(eliminateAllForAssetTypeSync)"), 0, CFSTR("timeout (at framework layer) while waiting for elimination to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v18 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminatePromotedNeverLockedForSelector}"), v5, 0, 0, &v18);
    v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v10 = &v15;
      v15 = v6;
      v13 = v5;
      v14 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke;
      v16[3] = &unk_1E5D5E338;
      v10 = &v17;
      v17 = v6;
      objc_msgSend(v7, "_eliminatePromotedNeverLockedForSelector:", v16);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset eliminatePromotedNeverLockedForSelector:completion:].cold.1();
  }

}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminatePromotedNeverLockedForSelector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _eliminatePromotedNeverLockedForSelector:].cold.1();

  }
}

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedEliminate:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedEliminate:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successEliminate:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)eliminatePromotedNeverLockedForSelectorSync:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v7;

  v3 = a3;
  v7 = 0;
  v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]([MAAutoAsset alloc], "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("MA-auto{+eliminatePromotedNeverLockedForSelectorSync}"), v3, 0, 0, &v7);

  v5 = v7;
  if (!v5)
  {
    objc_msgSend(v4, "_eliminatePromotedNeverLockedForSelectorSync");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_eliminatePromotedNeverLockedForSelectorSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke;
  v10[3] = &unk_1E5D5E3B0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _eliminatePromotedNeverLockedForSelector:](self, "_eliminatePromotedNeverLockedForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7[2];
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(eliminatePromotedNeverLockedForSelectorSync)"), 0, CFSTR("timeout (at framework layer) while waiting for elimination to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MAAutoAsset *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("TrainName"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("RestoreVersion"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("GroupNames"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v8 && v11 && v9 && v10)
    {
      v22 = v9;
      v12 = [MAAutoAsset alloc];
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
      +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v7, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v21 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v12, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v13, v14, 0, 0, &v28);
      v15 = v28;

      if (v15)
      {
        +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
        block[3] = &unk_1E5D5CD38;
        v17 = &v25;
        v25 = v6;
        v24 = v15;
        dispatch_async(v16, block);

        v18 = v21;
        v9 = v22;
      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_597;
        v26[3] = &unk_1E5D5E400;
        v17 = &v27;
        v27 = v6;
        v18 = v21;
        objc_msgSend(v21, "_stageDetermineGroupsAvailableForUpdate:completion:", v5, v26);
        v9 = v22;
      }

    }
    else
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
      v29[3] = &unk_1E5D5E3D8;
      v30 = v7;
      v31 = v8;
      v32 = v9;
      v33 = v10;
      v34 = v11;
      v35 = v6;
      dispatch_async(v20, v29);

      v15 = v30;
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdate:completion:].cold.1();
  }

}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke(_QWORD *a1)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = CFSTR("MISSING");
  v4 = (const __CFString *)a1[4];
  v5 = (const __CFString *)a1[5];
  if (!v4)
    v4 = CFSTR("MISSING");
  if (!v5)
    v5 = CFSTR("MISSING");
  v6 = (const __CFString *)a1[6];
  v7 = (const __CFString *)a1[7];
  if (!v6)
    v6 = CFSTR("MISSING");
  if (!v7)
    v7 = CFSTR("MISSING");
  if (a1[8])
    v3 = CFSTR("Y");
  v8 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@"), v4, v5, v6, v7, v3);
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6102, CFSTR("auto(stageDetermineGroupsAvailableForUpdate)"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[9] + 16))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_597(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageDetermineGroupsAvailableForUpdate:completion:].cold.1();

  }
}

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoStaging *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:]([MAAutoAssetInfoStaging alloc], "initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:", *(_QWORD *)(a1 + 40), 0, 0);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("staging"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"), v13, 0, v11);
    v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      v9 = CFSTR("failure reported by server");
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v9 = CFSTR("no response message from server");
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:", v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("staging"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successStageDetermineGroupsAvailableForUpdate:completion:", v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:", 6104, 0, CFSTR("no staging-information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  MAAutoAsset *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  NSObject *v26;
  id *v28;
  void *v29;
  id v31;
  id v32;

  v6 = a3;
  objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("TrainName"), objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("RestoreVersion"), objc_opt_class());
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("GroupNames"), objc_opt_class());
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v29 = (void *)v9;
  if (v7 && v8 && v11)
  {
    v28 = a4;
    v13 = [MAAutoAsset alloc];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v16 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v13, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v14, v15, 0, 0, &v32);
    v17 = v32;

    if (!v17)
    {
      v31 = 0;
      objc_msgSend(v16, "_stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:", v6, v28, &v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v31;
      goto LABEL_24;
    }
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = CFSTR("MISSING");
    if (v7)
      v21 = v7;
    else
      v21 = CFSTR("MISSING");
    if (v8)
      v22 = v8;
    else
      v22 = CFSTR("MISSING");
    if (v9)
      v23 = (const __CFString *)v9;
    else
      v23 = CFSTR("MISSING");
    if (v10)
      v24 = v10;
    else
      v24 = CFSTR("MISSING");
    if (v12)
      v20 = CFSTR("present");
    v16 = (id)objc_msgSend(v19, "initWithFormat:", CFSTR("pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@"), v21, v22, v23, v24, v20);
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6102, CFSTR("auto(stageDetermineGroupsAvailableForUpdateSync)"), 0, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:].cold.1();

  }
  v18 = 0;
LABEL_24:

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v18;
}

- (id)_stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[9];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v8 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v16[3] = &unk_1E5D5E428;
  v18 = v23;
  v19 = &v39;
  v20 = &v33;
  v21 = &v27;
  v22 = v25;
  v11 = v9;
  v17 = v11;
  -[MAAutoAsset _stageDetermineGroupsAvailableForUpdate:completion:](self, "_stageDetermineGroupsAvailableForUpdate:completion:", v8, v16);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v11, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    v15[3] = &unk_1E5D5E450;
    v15[4] = v25;
    v15[5] = v23;
    v15[6] = &v39;
    v15[7] = &v33;
    v15[8] = &v27;
    dispatch_sync(v12, v15);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v34[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v28[5]);
  v13 = (id)v40[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

void __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v15 = a1[2];
  v11 = a1[4];
  v21 = a1[3];
  v22 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E5D5E0E0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v12 = v15[0];
  v20 = *(_OWORD *)v15;
  v13 = v9;
  v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);

}

intptr_t __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }
  return result;
}

void __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageDetermineGroupsAvailableForUpdate)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-determine-groups-available-for-update to complete"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

+ (void)stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  MAAutoAsset *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = CFSTR("STAGE_GENERAL");
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = CFSTR("STAGE_GENERAL");
    v10 = [MAAutoAsset alloc];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v10, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v11, v12, 0, 0, &v23);
    v14 = v23;

    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v16 = &v20;
      v20 = v6;
      v19 = v14;
      dispatch_async(v15, block);

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke;
      v21[3] = &unk_1E5D5E478;
      v16 = &v22;
      v22 = v6;
      objc_msgSend(v13, "_stageDetermineAllAvailableForUpdate:completion:", v5, v21);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDetermineAllAvailableForUpdate:completion:].cold.1();
  }

}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageDetermineAllAvailableForUpdate:completion:].cold.1();

  }
}

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoStaging *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineAllAvailable:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoStaging initWithAvailableForStaging:withTotalExpectedBytes:]([MAAutoAssetInfoStaging alloc], "initWithAvailableForStaging:withTotalExpectedBytes:", *(_QWORD *)(a1 + 40), 0);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("staging"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"), v13, 0, v11);
    v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      v9 = CFSTR("failure reported by server");
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v9 = CFSTR("no response message from server");
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineAllAvailable:withResponseError:description:completion:", v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("staging"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successStageDetermineAllAvailable:completion:", v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedStageDetermineAllAvailable:withResponseError:description:completion:", 6104, 0, CFSTR("no staging-information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  MAAutoAsset *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  id v19;

  v7 = a3;
  objc_msgSend(v7, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = CFSTR("TargetOSVersion");
  if (v9)
    v10 = (__CFString *)v9;
  else
    v10 = CFSTR("TargetBuildVersion");
  v11 = [MAAutoAsset alloc];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v14 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v11, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v12, v13, 0, 0, &v19);
  v15 = v19;

  if (!v15)
  {
    v18 = 0;
    objc_msgSend(v14, "_stageDetermineAllAvailableForUpdateSync:totalExpectedBytes:error:", v7, a4, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v16 = 0;
  if (a5)
LABEL_8:
    *a5 = objc_retainAutorelease(v15);
LABEL_9:

  return v16;
}

- (id)_stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[9];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v8 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__5;
  v41 = __Block_byref_object_dispose__5;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v16[3] = &unk_1E5D5E4C8;
  v18 = v23;
  v19 = &v37;
  v20 = &v33;
  v21 = &v27;
  v22 = v25;
  v11 = v9;
  v17 = v11;
  -[MAAutoAsset _stageDetermineAllAvailableForUpdate:completion:](self, "_stageDetermineAllAvailableForUpdate:completion:", v8, v16);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v11, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    v15[3] = &unk_1E5D5E450;
    v15[4] = v25;
    v15[5] = v23;
    v15[6] = &v37;
    v15[7] = &v33;
    v15[8] = &v27;
    dispatch_sync(v12, v15);

  }
  if (a4)
    *a4 = v34[3];
  if (a5)
    *a5 = objc_retainAutorelease((id)v28[5]);
  v13 = (id)v38[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v13;
}

void __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  __int128 v10;
  id v11;
  id v12;
  id v13[2];
  _QWORD block[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  v10 = a1[4];
  *(_OWORD *)v13 = a1[2];
  v18 = a1[3];
  v19 = v10;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E5D5E4A0;
  v20 = a3;
  v15 = v7;
  v16 = v8;
  v11 = v13[0];
  v17 = *(_OWORD *)v13;
  v12 = v8;
  v13[0] = v7;
  dispatch_sync(v9, block);

}

intptr_t __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = *(_QWORD *)(v1 + 96);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageDetermineAllAvailableForUpdate)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-determine-all-available to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[8] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

+ (void)stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MAAutoAsset *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = [MAAutoAsset alloc];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v10, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v11, v12, 0, 0, &v23);
    v14 = v23;

    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v16 = &v20;
      v20 = v9;
      v19 = v14;
      dispatch_async(v15, block);

    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
      v21[3] = &unk_1E5D5E478;
      v16 = &v22;
      v22 = v9;
      objc_msgSend(v13, "_stageDetermineAllAvailable:forTargetBuildVersion:completion:", v7, v8, v21);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDetermineAllAvailable:forTargetBuildVersion:completion:].cold.1();
  }

}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v6 = a5;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
    v10[3] = &unk_1E5D5E130;
    v10[4] = self;
    v11 = v6;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageDetermineAllAvailable:forTargetBuildVersion:completion:].cold.1();

  }
}

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineAllAvailable:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      v9 = CFSTR("failure reported by server");
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v9 = CFSTR("no response message from server");
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDetermineAllAvailable:withResponseError:description:completion:", v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("staging"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successStageDetermineAllAvailable:completion:", v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedStageDetermineAllAvailable:withResponseError:description:completion:", 6104, 0, CFSTR("no staging-information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  MAAutoAsset *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = [MAAutoAsset alloc];
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v14 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v11, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v12, v13, 0, 0, &v19);
  v15 = v19;

  if (!v15)
  {
    v18 = 0;
    objc_msgSend(v14, "_stageDetermineAllAvailableSync:forTargetBuildVersion:totalExpectedBytes:error:", v9, v10, a5, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (!a6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = 0;
  if (a6)
LABEL_3:
    *a6 = objc_retainAutorelease(v15);
LABEL_4:

  return v16;
}

- (id)_stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD block[9];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[3];
  char v28;
  _QWORD v29[3];
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v9 = a3;
  v10 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5;
  v45 = __Block_byref_object_dispose__5;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  v36 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v11 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke;
  v20[3] = &unk_1E5D5E4C8;
  v22 = v27;
  v23 = &v41;
  v13 = v9;
  v24 = &v37;
  v25 = &v31;
  v26 = v29;
  v14 = v11;
  v21 = v14;
  -[MAAutoAsset _stageDetermineAllAvailable:forTargetBuildVersion:completion:](self, "_stageDetermineAllAvailable:forTargetBuildVersion:completion:", v9, v10, v20);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v14, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3;
    block[3] = &unk_1E5D5E450;
    block[4] = v29;
    block[5] = v27;
    block[6] = &v41;
    block[7] = &v37;
    block[8] = &v31;
    dispatch_sync(v15, block);

  }
  if (a5)
    *a5 = v38[3];
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  v16 = (id)v42[5];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v16;
}

void __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  __int128 v10;
  id v11;
  id v12;
  id v13[2];
  _QWORD block[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  v10 = a1[4];
  *(_OWORD *)v13 = a1[2];
  v18 = a1[3];
  v19 = v10;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E5D5E4A0;
  v20 = a3;
  v15 = v7;
  v16 = v8;
  v11 = v13[0];
  v17 = *(_OWORD *)v13;
  v12 = v8;
  v13[0] = v7;
  dispatch_sync(v9, block);

}

intptr_t __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = *(_QWORD *)(v1 + 96);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

void __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageDetermineAllAvailable)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-determine-all-available to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[8] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

+ (void)stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MAAutoAsset *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  int64_t v33;
  _QWORD block[4];
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v10 = a4;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  if (v13)
  {
    v32 = v10;
    v33 = a5;
    objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("TrainName"), objc_opt_class());
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("RestoreVersion"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("GroupNames"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && v15 && v18 && v16 && v17)
    {
      v30 = v12;
      v31 = (void *)v16;
      v19 = [MAAutoAsset alloc];
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
      +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v29 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v19, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v20, v21, 0, 0, &v39);
      v22 = v39;

      if (v22)
      {
        +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
        block[3] = &unk_1E5D5CD38;
        v24 = &v36;
        v36 = v13;
        v35 = v22;
        dispatch_async(v23, block);

        v25 = v29;
        v12 = v30;
      }
      else
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_624;
        v37[3] = &unk_1E5D5E400;
        v24 = &v38;
        v38 = v13;
        v25 = v29;
        v12 = v30;
        objc_msgSend(v29, "_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:", v11, v32, v33, v30, v37);
      }

      v27 = v31;
    }
    else
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v27 = (void *)v16;
      v28 = objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
      v40[3] = &unk_1E5D5E3D8;
      v41 = v14;
      v42 = v15;
      v43 = v27;
      v44 = v17;
      v45 = v18;
      v46 = v13;
      dispatch_async(v28, v40);

      v22 = v41;
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:].cold.1();
  }

}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke(_QWORD *a1)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = CFSTR("MISSING");
  v4 = (const __CFString *)a1[4];
  v5 = (const __CFString *)a1[5];
  if (!v4)
    v4 = CFSTR("MISSING");
  if (!v5)
    v5 = CFSTR("MISSING");
  v6 = (const __CFString *)a1[6];
  v7 = (const __CFString *)a1[7];
  if (!v6)
    v6 = CFSTR("MISSING");
  if (!v7)
    v7 = CFSTR("MISSING");
  if (a1[8])
    v3 = CFSTR("present");
  v8 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@"), v4, v5, v6, v7, v3);
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6102, CFSTR("auto(stageDownloadGroups)"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1();

  (*(void (**)(void))(a1[9] + 16))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_624(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  BOOL v22;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (v14)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
    v17[3] = &unk_1E5D5E4F0;
    v22 = a4;
    v17[4] = self;
    v21 = a5;
    v19 = v13;
    v18 = v12;
    v20 = v14;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:].cold.1();

  }
}

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  uint64_t v11;
  MAAutoAssetInfoDesire *v12;
  MAAutoAssetInfoStaging *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDownloadGroups:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = [MAAutoAssetInfoDesire alloc];
    if (*(_BYTE *)(a1 + 72))
      v11 = -1;
    else
      v11 = -2;
    v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:](v10, "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, 0, 0, v11, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48) != 0);
    v13 = -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:]([MAAutoAssetInfoStaging alloc], "initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:", *(_QWORD *)(a1 + 40), 0, 0);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v14, "setSafeObject:forKey:", v12, CFSTR("desire"));
    objc_msgSend(v14, "setSafeObject:forKey:", v13, CFSTR("staging"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:DOWNLOAD_GROUPS"), v16, 0, v14);
    v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProxyObjectForStageProgressBlock:", *(_QWORD *)(a1 + 48));
    v19 = (void *)__maAutoAssetSharedConnectionClient;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
    v22[3] = &unk_1E5D5E180;
    v20 = *(_QWORD *)(a1 + 32);
    v23 = v18;
    v24 = v20;
    v25 = *(id *)(a1 + 56);
    v21 = v18;
    objc_msgSend(v19, "connectClientSendServerMessage:proxyObject:withReply:", v17, v21, v22);

  }
}

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      v9 = CFSTR("failure reported by server");
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v9 = CFSTR("no response message from server");
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "_failedStageDownloadGroups:withResponseError:description:completion:", v10, v11, v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("staged"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 40);
    if (v7)
      objc_msgSend(v8, "_successStageDownloadGroups:completion:", v7, *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v8, "_failedStageDownloadGroups:withResponseError:description:completion:", 6104, 0, CFSTR("no staged-information provided by server"), *(_QWORD *)(a1 + 48));

  }
}

+ (id)stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  MAAutoAsset *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  int64_t v34;
  id *v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  id v40;
  id v41;

  v37 = a4;
  v11 = a3;
  v12 = a8;
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("OSVersion"), objc_opt_class());
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("Build"), objc_opt_class());
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("TrainName"), objc_opt_class());
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("RestoreVersion"), objc_opt_class());
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeObjectForKey:ofClass:", CFSTR("GroupNames"), objc_opt_class());
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v38 = (void *)v15;
  if (v13 && v14 && v17)
  {
    v34 = a5;
    v35 = a6;
    v36 = v12;
    v19 = [MAAutoAsset alloc];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", v13, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v22 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v19, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v20, v21, 0, 0, &v41);
    v23 = v41;

    if (v23)
    {
      v24 = 0;
      v12 = v36;
    }
    else
    {
      v40 = 0;
      v12 = v36;
      objc_msgSend(v22, "_stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:", v11, v37, v34, v35, &v40, v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v40;
    }
  }
  else
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    v26 = CFSTR("MISSING");
    if (v13)
      v27 = v13;
    else
      v27 = CFSTR("MISSING");
    if (v14)
      v28 = v14;
    else
      v28 = CFSTR("MISSING");
    if (v15)
      v29 = (const __CFString *)v15;
    else
      v29 = CFSTR("MISSING");
    if (v16)
      v30 = v16;
    else
      v30 = CFSTR("MISSING");
    if (v18)
      v26 = CFSTR("present");
    v22 = (id)objc_msgSend(v25, "initWithFormat:", CFSTR("pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@"), v27, v28, v29, v30, v26);
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6102, CFSTR("auto(stageDownloadGroupsSync)"), 0, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "oslog");
    v32 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:].cold.1();

    v24 = 0;
  }

  if (a7)
    *a7 = objc_retainAutorelease(v23);

  return v24;
}

- (id)_stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  _BOOL8 v10;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD block[9];
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[3];
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v10 = a4;
  v12 = a3;
  v13 = a8;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v14 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke;
  v22[3] = &unk_1E5D5E428;
  v24 = v29;
  v25 = &v45;
  v26 = &v39;
  v27 = &v33;
  v28 = v31;
  v15 = v14;
  v23 = v15;
  -[MAAutoAsset _stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:](self, "_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:", v12, v10, a5, v13, v22);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v15, a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E5D5E450;
    block[4] = v31;
    block[5] = v29;
    block[6] = &v45;
    block[7] = &v39;
    block[8] = &v33;
    dispatch_sync(v16, block);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v40[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v34[5]);
  v17 = (id)v46[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v17;
}

void __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  id v15[2];
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v15 = a1[2];
  v11 = a1[4];
  v21 = a1[3];
  v22 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E5D5E0E0;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v12 = v15[0];
  v20 = *(_OWORD *)v15;
  v13 = v9;
  v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);

}

intptr_t __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }
  return result;
}

void __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageDownloadGroups)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-download-groups to complete"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

+ (void)stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  MAAutoAsset *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id *v15;
  void *v16;
  _QWORD block[4];
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = [MAAutoAsset alloc];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v12 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v9, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v10, v11, 0, 0, &v22);
    v13 = v22;

    if (v13)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v15 = &v19;
      v19 = v8;
      v18 = v13;
      dispatch_async(v14, block);

    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke;
      v20[3] = &unk_1E5D5E518;
      v15 = &v21;
      v21 = v8;
      objc_msgSend(v12, "_stageDownloadAll:reportingProgress:completion:", a3, v7, v20);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageDownloadAll:reportingProgress:completion:].cold.1();
  }

}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke;
    v12[3] = &unk_1E5D5E540;
    v12[4] = self;
    v15 = a3;
    v13 = v8;
    v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageDownloadAll:reportingProgress:completion:].cold.1();

  }
}

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  MAAutoAssetInfoDesire *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageDownloadAll:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetInfoDesire alloc], "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, 0, 0, -2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40) != 0);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("desire"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:DOWNLOAD_ALL"), v13, 0, v11);
    v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProxyObjectForStageProgressBlock:", *(_QWORD *)(a1 + 40));
    v16 = (void *)__maAutoAssetSharedConnectionClient;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2;
    v19[3] = &unk_1E5D5E180;
    v17 = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v17;
    v22 = *(id *)(a1 + 48);
    v18 = v15;
    objc_msgSend(v16, "connectClientSendServerMessage:proxyObject:withReply:", v14, v18, v19);

  }
}

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      v9 = CFSTR("failure reported by server");
      v10 = 0;
      v11 = v5;
    }
    else
    {
      v9 = CFSTR("no response message from server");
      v10 = 6104;
      v11 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "_failedStageDownloadAll:withResponseError:description:completion:", v10, v11, v9, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("staged"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 40);
    if (v7)
      objc_msgSend(v8, "_successStageDownloadAll:completion:", v7, *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(v8, "_failedStageDownloadAll:withResponseError:description:completion:", 6104, 0, CFSTR("no staged-information provided by server"), *(_QWORD *)(a1 + 48));

  }
}

+ (unint64_t)stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v9;
  MAAutoAsset *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  id v17;
  id v18;

  v9 = a6;
  v10 = [MAAutoAsset alloc];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v10, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v11, v12, 0, 0, &v18);
  v14 = v18;

  if (!v14)
  {
    v17 = 0;
    v15 = objc_msgSend(v13, "_stageDownloadAllSync:assetsSuccessfullyStaged:error:reportingProgress:", a3, a4, &v17, v9);
    v14 = v17;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 0;
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v14);
LABEL_4:

  return v15;
}

- (unint64_t)_stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  _QWORD block[9];
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v9 = a6;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke;
  v19[3] = &unk_1E5D5E590;
  v21 = v26;
  v22 = &v40;
  v12 = v9;
  v23 = &v36;
  v24 = &v30;
  v25 = v28;
  v13 = v10;
  v20 = v13;
  -[MAAutoAsset _stageDownloadAll:reportingProgress:completion:](self, "_stageDownloadAll:reportingProgress:completion:", a3, v9, v19);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v13, a3))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E5D5E450;
    block[4] = v28;
    block[5] = v26;
    block[6] = &v40;
    block[7] = &v36;
    block[8] = &v30;
    dispatch_sync(v14, block);

  }
  if (a4)
    *a4 = v37[3];
  if (a5)
    *a5 = objc_retainAutorelease((id)v31[5]);
  v15 = v41[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v15;
}

void __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke(_OWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  __int128 v9;
  id v10;
  id v11[2];
  _QWORD block[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a4;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v11 = a1[2];
  v9 = a1[4];
  v15 = a1[3];
  v16 = v9;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E5D5E568;
  v17 = a2;
  v18 = a3;
  v13 = v7;
  v10 = v11[0];
  v14 = *(_OWORD *)v11;
  v11[0] = v7;
  dispatch_sync(v8, block);

}

intptr_t __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2(intptr_t result)
{
  intptr_t v1;
  uint64_t v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 96);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = *(_QWORD *)(result + 88);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) = v2;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageDownloadAll)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-download-all to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[8] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)stageCancelOperation:(id)a3
{
  id v3;
  MAAutoAsset *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  if (v3)
  {
    v4 = [MAAutoAsset alloc];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v4, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v5, v6, 0, 0, &v17);
    v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v10 = &v14;
      v14 = v3;
      v13 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke;
      v15[3] = &unk_1E5D5E5B8;
      v10 = &v16;
      v16 = v3;
      objc_msgSend(v7, "_stageCancelOperation:", v15);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageCancelOperation:].cold.1();
  }

}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_stageCancelOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageCancelOperation:].cold.1();

  }
}

void __37__MAAutoAsset__stageCancelOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageCancelOperation:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:CANCEL_OPERATION"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __37__MAAutoAsset__stageCancelOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedStageCancelOperation:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successStageCancelOperation:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)stageCancelOperationSync
{
  MAAutoAsset *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  v2 = [MAAutoAsset alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v2, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v3, v4, 0, 0, &v8);
  v6 = v8;

  if (!v6)
  {
    objc_msgSend(v5, "_stageCancelOperationSync");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stageCancelOperationSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke;
  v10[3] = &unk_1E5D5E5E0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _stageCancelOperation:](self, "_stageCancelOperation:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __40__MAAutoAsset__stageCancelOperationSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6[2];
  _QWORD block[4];
  id v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageCancelOperation)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-cancel-operation to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)stagePurgeAll:(id)a3
{
  id v3;
  MAAutoAsset *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  if (v3)
  {
    v4 = [MAAutoAsset alloc];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v4, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v5, v6, 0, 0, &v17);
    v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v10 = &v14;
      v14 = v3;
      v13 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke;
      v15[3] = &unk_1E5D5E5B8;
      v10 = &v16;
      v16 = v3;
      objc_msgSend(v7, "_stagePurgeAll:", v15);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stagePurgeAll:].cold.1();
  }

}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_stagePurgeAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stagePurgeAll:].cold.1();

  }
}

void __30__MAAutoAsset__stagePurgeAll___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStagePurgeAll:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:PURGE_ALL"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __30__MAAutoAsset__stagePurgeAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      v7 = CFSTR("failure reported by server");
      v8 = 0;
      v9 = v5;
    }
    else
    {
      v7 = CFSTR("no response message from server");
      v8 = 6104;
      v9 = 0;
    }
    objc_msgSend(v6, "_failedStagePurgeAll:withResponseError:description:completion:", v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successStagePurgeAll:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)stagePurgeAllSync
{
  MAAutoAsset *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  v2 = [MAAutoAsset alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v2, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v3, v4, 0, 0, &v8);
  v6 = v8;

  if (!v6)
  {
    objc_msgSend(v5, "_stagePurgeAllSync");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stagePurgeAllSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke;
  v10[3] = &unk_1E5D5E5E0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _stagePurgeAll:](self, "_stagePurgeAll:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __33__MAAutoAsset__stagePurgeAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6[2];
  _QWORD block[4];
  id v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stagePurgeAll)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-purge-all to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)stageEraseAll:(id)a3
{
  id v3;
  MAAutoAsset *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  if (v3)
  {
    v4 = [MAAutoAsset alloc];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v4, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v5, v6, 0, 0, &v17);
    v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](MAAutoAsset, "defaultDispatchQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__MAAutoAsset_stageEraseAll___block_invoke_2;
      block[3] = &unk_1E5D5CD38;
      v10 = &v14;
      v14 = v3;
      v13 = v8;
      dispatch_async(v9, block);

    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __29__MAAutoAsset_stageEraseAll___block_invoke;
      v15[3] = &unk_1E5D5E5B8;
      v10 = &v16;
      v16 = v3;
      objc_msgSend(v7, "_stageEraseAll:", v15);
    }

  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](MAAutoAsset, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[MAAutoAsset stageEraseAll:].cold.1();
  }

}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_stageEraseAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__MAAutoAsset__stageEraseAll___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAsset _stageEraseAll:].cold.1();

  }
}

void __30__MAAutoAsset__stageEraseAll___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedStageEraseAll:withResponseError:description:completion:", 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "autoAssetClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = __maAutoAssetSharedClientProcessName;
    v6 = __maAutoAssetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAsset frameworkInstanceUUID](MAAutoAsset, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-STAGE:ERASE_ALL"), v12, 0, v10);
    v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __30__MAAutoAsset__stageEraseAll___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __30__MAAutoAsset__stageEraseAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (!v8 || v5)
  {
    if (v5)
      objc_msgSend(v6, "_failedStageEraseAll:withResponseError:description:completion:", 0, v5, CFSTR("failure reported by server"), v7);
    else
      objc_msgSend(v6, "_failedStagePurgeAll:withResponseError:description:completion:", 6104, 0, CFSTR("no response message from server"), v7);
  }
  else
  {
    objc_msgSend(v6, "_successStageEraseAll:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)stageEraseAllSync
{
  MAAutoAsset *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v8;

  v2 = [MAAutoAsset alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:](MAAutoAsset, "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:](v2, "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:", v3, v4, 0, 0, &v8);
  v6 = v8;

  if (!v6)
  {
    objc_msgSend(v5, "_stageEraseAllSync");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stageEraseAllSync
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[7];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke;
  v10[3] = &unk_1E5D5E5E0;
  v12 = v15;
  v13 = &v19;
  v14 = v17;
  v5 = v3;
  v11 = v5;
  -[MAAutoAsset _stageEraseAll:](self, "_stageEraseAll:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAsset, "waitOnSemaphore:withDaemonTriggeredTimeout:", v5, -100))
  {
    +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v17;
    block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);

  }
  v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __33__MAAutoAsset__stageEraseAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6[2];
  _QWORD block[4];
  id v8;
  __int128 v9;
  __int128 v10;

  v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](MAAutoAsset, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __33__MAAutoAsset__stageEraseAllSync__block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __33__MAAutoAsset__stageEraseAllSync__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto(stageEraseAll)"), 0, CFSTR("timeout (at framework layer) while waiting for stage-erase-all to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (id)assetSelectorForAssetTargetOSVersion:(id)a3 forTargetBuildVersion:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  if (v5)
    v7 = v5;
  else
    v7 = CFSTR("MAAutoAssetStage-target-os-version-specifier");
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR("MAAutoAssetControl-target-build-version-version");
  v9 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]([MAAutoAssetSelector alloc], "initForAssetType:withAssetSpecifier:matchingAssetVersion:", CFSTR("MAAutoAssetStage-target-all-asset-types"), v7, v8);

  return v9;
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0 != -1)
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0, &__block_literal_global_9);
}

void __44__MAAutoAsset_frameworkInstanceSetLogDomain__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%s"), CFSTR("com.apple.MAAutoClient"), getprogname());
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "useDomain:", v1);

}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_1 != -1)
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_1, &__block_literal_global_661);
  return (id)defaultDispatchQueue_defaultQueue_1;
}

void __35__MAAutoAsset_defaultDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoasset.client"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_1;
  defaultDispatchQueue_defaultQueue_1 = (uint64_t)v1;

}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_0 != -1)
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_0, &__block_literal_global_662);
  return (id)frameworkDispatchQueue_frameworkQueue_0;
}

void __37__MAAutoAsset_frameworkDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoasset.framework"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)frameworkDispatchQueue_frameworkQueue_0;
  frameworkDispatchQueue_frameworkQueue_0 = (uint64_t)v1;

}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_0 != -1)
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_0, &__block_literal_global_663);
  return (id)frameworkInstanceUUID_frameworkUUID_0;
}

void __36__MAAutoAsset_frameworkInstanceUUID__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v1 = (void *)frameworkInstanceUUID_frameworkUUID_0;
  frameworkInstanceUUID_frameworkUUID_0 = (uint64_t)v0;

}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)logMAAutoAssetVersion
{
  if (__maAutoAssetLogVersionDispatchOnce != -1)
    dispatch_once(&__maAutoAssetLogVersionDispatchOnce, &__block_literal_global_665);
}

void __36__MAAutoAsset_logMAAutoAssetVersion__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E5D5F930);
  objc_msgSend(v0, "appendString:", CFSTR("|TARGET_OS_MAC"));
  objc_msgSend(v0, "appendString:", CFSTR("|TARGET_OS_IPHONE"));
  if (objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v0, &stru_1E5D5F930))
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(NO_TARGETS_DEFINED)"));

    v0 = (void *)v1;
  }
  else
  {
    objc_msgSend(v0, "appendString:", CFSTR("|"));
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = CFSTR("2.1.2");
    v6 = 2114;
    v7 = v0;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(FRAMEWORK_VERSION:%{public}@) | build environment:%{public}@", (uint8_t *)&v4, 0x16u);
  }

}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetSelector)contentLockedSelector
{
  return self->_contentLockedSelector;
}

- (void)setContentLockedSelector:(id)a3
{
  objc_storeStrong((id *)&self->_contentLockedSelector, a3);
}

- (NSString)contentLockedReason
{
  return self->_contentLockedReason;
}

- (void)setContentLockedReason:(id)a3
{
  objc_storeStrong((id *)&self->_contentLockedReason, a3);
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (void)setLocalContentURL:(id)a3
{
  objc_storeStrong((id *)&self->_localContentURL, a3);
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (void)setAssetAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_assetAttributes, a3);
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (int)locksOfContent
{
  return self->_locksOfContent;
}

- (void)setLocksOfContent:(int)a3
{
  self->_locksOfContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_contentLockedReason, 0);
  objc_storeStrong((id *)&self->_contentLockedSelector, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

- (void)interestInContent:withInterestPolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("interestInContent"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{interestInContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)checkForNewer:withUsagePolicy:withTimeout:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("checkForNewer"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{checkForNewer} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)determineIfAvailable:withTimeout:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("determineIfAvailable"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{determineIfAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)currentStatus:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("currentStatus"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{currentStatus} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("lockContent"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{lockContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)mapLockedContent:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("mapLockedContent"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{mapLockedContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)continueLockUsage:withUsagePolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("continueLockUsage"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{continueLockUsage} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)endLockUsage:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("endLockUsage"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{endLockUsage} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto{connectToServerFrameworkCompletion} unable to create shared SUCoreConnectClient for the client process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | no progress provided | no progress reported to client at this time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | no progress provided | unexpected type for statusWithProgress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | no progress provided | no progress reported to staging-client at this time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | no progress provided | unexpected type for statusWithProgress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_successInterestInContent:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successInterestInContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedInterestInContent:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedInterestInContent} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedInterestInContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successCheckForNewer:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successCheckForNewer} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedCheckForNewer:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedCheckForNewer} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedCheckForNewer} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successDetermineIfAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successDetermineIfAvailable} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedDetermineIfAvailable:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedDetermineIfAvailable} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedDetermineIfAvailable} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successCurrentStatus:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successCurrentStatus} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedCurrentStatus:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedCurrentStatus} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedCurrentStatus} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successLockContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedLockContent:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedLockContent} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedLockContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successMapLockedContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedMapLockedContent:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedMapLockedContent} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedMapLockedContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successContinueLockUsage:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successContinueLockUsage} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedContinueLockUsage:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedContinueLockUsage} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedContinueLockUsage} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto{_successEndLockUsage} | no client completion block | %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*a2, "locksOfContent");
  v7 = 138543618;
  v8 = v5;
  v9 = 1024;
  v10 = v6;
  _os_log_error_impl(&dword_1AE33B000, a3, OS_LOG_TYPE_ERROR, "MA-auto{_successEndLockUsage} | %{public}@ | end lock when locksOfContent=%d | cleared locksOfContent", (uint8_t *)&v7, 0x12u);

  OUTLINED_FUNCTION_6();
}

- (void)_failedEndLockUsage:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedEndLockUsage} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedEndLockUsage} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v3, v4, "MA-auto{_successCancelActivity} | no client completion block | %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_failedCancelActivity:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedCancelActivity} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedCancelActivity} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __33__MAAutoAsset__successEliminate___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "summary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v3, v4, "MA-auto{_successEliminate} | no client completion block | %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_failedEliminate:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto{_failedEliminate} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto{_failedEliminate} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDetermineGroupsAvailableForUpdate:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | no client completion block | staging:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDetermineAllAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto(staging-client){_successStageDetermineAllAvailable} | no client completion block | staging:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDetermineAllAvailable:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDownloadGroups:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto(staging-client){_successStageDownloadGroups} | no client completion block | staged:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDownloadGroups:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageDownloadGroups} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDownloadAll:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "summary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v2, v3, "MA-auto(staging-client){_successStageDownloadAll} | no client completion block | staged:%{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDownloadAll:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageDownloadAll} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageCancelOperation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_successStageCancelOperation} | no client completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_failedStageCancelOperation:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageCancelOperation} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStagePurgeAll:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_successStagePurgeAll} | no client completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_failedStagePurgeAll:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStagePurgeAll} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageEraseAll:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_successStageEraseAll} | no client completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_failedStageEraseAll:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto(staging-client){_failedStageEraseEraseAll} | no client completion block | %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "checkedSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

+ (void)interestInContent:forAssetSelector:withInterestPolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+interestInContent"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+interestInContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)determineIfAvailable:forAssetSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+determineIfAvailable"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+determineIfAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+endPreviousLocksOfReason"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+endPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endPreviousLocksOfReason:removingLockCount:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_endPreviousLocksOfReason"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_endPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+endAllPreviousLocksOfReason"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+endAllPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endAllPreviousLocksOfReason:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_endAllPreviousLocksOfReason"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_endAllPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endAllPreviousLocksOfSelector:forClientName:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+endAllPreviousLocksOfSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+endAllPreviousLocksOfSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)cancelActivityForSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+cancelActivityForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+cancelActivityForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_cancelActivityForSelector:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_cancelActivityForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_cancelActivityForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAllForSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+eliminateAllForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+eliminateAllForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAllForSelector:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_eliminateAllForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_eliminateAllForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAllForAssetType:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+eliminateAllForAssetType"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+eliminateAllForAssetType} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAllForAssetType:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_eliminateAllForAssetType"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_eliminateAllForAssetType} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminatePromotedNeverLockedForSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+eliminatePromotedNeverLockedForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{+eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminatePromotedNeverLockedForSelector:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_eliminatePromotedNeverLockedForSelector"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto{_eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageDetermineGroupsAvailableForUpdate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageDetermineGroupsAvailableForUpdate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdateSync} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

+ (void)stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageDetermineAllAvailableForUpdate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageDetermineAllAvailableForUpdate} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageDetermineAllAvailable"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageDetermineAllAvailable"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageDetermineAllAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageDetermineAllAvailable"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageDownloadGroups"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageDownloadGroups} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){stageDownloadGroups} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageDownloadGroups"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageDownloadGroups} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_13();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v0, v1), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0(&dword_1AE33B000, v3, v4, "MA-auto(staging-client){stageDownloadGroupsSync} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6();
}

+ (void)stageDownloadAll:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageDownloadAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageDownloadAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDownloadAll:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageDownloadAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageDownloadAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageCancelOperation:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageCancelOperation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageCancelOperation} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageCancelOperation:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageCancelOperation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageCancelOperation} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stagePurgeAll:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stagePurgeAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stagePurgeAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagePurgeAll:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stagePurgeAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stagePurgeAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageEraseAll:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+stageEraseAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){+stageEraseAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageEraseAll:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stageEraseAll"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto(staging-client){stageEraseAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

@end
