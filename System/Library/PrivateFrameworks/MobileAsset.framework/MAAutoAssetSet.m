@implementation MAAutoAssetSet

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v15, v14, v13, 0, v12, 0, v16, a7);

  return v17;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 completingFromQueue:(id)a7 error:(id *)a8
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", a3, a4, a5, 0, a6, 0, a7, a8);
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v18, v17, v16, 0, v15, v14, v19, a8);

  return v20;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 completingFromQueue:(id)a8 error:(id *)a9
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v9, CFSTR("SHORT_TERM_LOCKER"), v8, 1, 0, 0, v10, a5);

  return v11;
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](self, "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", a3, CFSTR("SHORT_TERM_LOCKER"), a4, 1, 0, a5, a6, a7);
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 asShortTermLocker:(BOOL)a6 comprisedOfEntries:(id)a7 usingDesiredPolicyCategory:(id)a8 completingFromQueue:(id)a9 error:(id *)a10
{
  _BOOL4 v12;
  id v17;
  id v18;
  MAAutoAssetSet *v19;
  OS_dispatch_queue *v20;
  MAAutoAssetSet *v21;
  OS_dispatch_queue *completionDispatchQueue;
  const __CFString *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v12 = a6;
  v17 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a7;
  v26 = a8;
  v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)MAAutoAssetSet;
  v19 = -[MAAutoAssetSet init](&v30, sel_init);
  if (!v19)
  {
    v21 = 0;
    goto LABEL_24;
  }
  +[MAAutoAssetSet frameworkInstanceSetLogDomain](MAAutoAssetSet, "frameworkInstanceSetLogDomain", v26, v27, v28, v29);
  objc_storeStrong((id *)&v19->_clientDomainName, a3);
  objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
  objc_storeStrong((id *)&v19->_assetSetIdentifier, a5);
  v19->_shortTermLocker = v12;
  objc_storeStrong((id *)&v19->_autoAssetEntries, a7);
  objc_storeStrong((id *)&v19->_updateCategoryDesiredByClient, a8);
  if (v18)
  {
    v20 = (OS_dispatch_queue *)v18;
  }
  else
  {
    +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
    v20 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  completionDispatchQueue = v19->_completionDispatchQueue;
  v19->_completionDispatchQueue = v20;

  if (!v12)
  {
    if (v19->_completionDispatchQueue)
      goto LABEL_14;
    goto LABEL_16;
  }
  if (__maAutoAssetSetShortTermLockerOnce != -1)
    dispatch_once(&__maAutoAssetSetShortTermLockerOnce, &__block_literal_global_15);
  if (!v19->_completionDispatchQueue)
  {
LABEL_16:
    v23 = CFSTR("no completion dispatch queue");
    goto LABEL_18;
  }
  if (__maAutoAssetSetShortTermLockerDispatchQueue)
  {
    if (!__maAutoAssetSetSharedProcessByClientDomainName)
    {
      v23 = CFSTR("no SHORT-TERM lock tracking dictionary");
      goto LABEL_18;
    }
LABEL_14:
    v24 = 0;
    if (!a10)
      goto LABEL_20;
    goto LABEL_19;
  }
  v23 = CFSTR("no SHORT-TERM locker dispatch queue");
LABEL_18:
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6101, CFSTR("auto-set(initUsingClientDomain)"), 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a10)
LABEL_19:
    *a10 = objc_retainAutorelease(v24);
LABEL_20:
  if (v24)
    v21 = 0;
  else
    v21 = v19;

LABEL_24:
  return v21;
}

void __166__MAAutoAssetSet_initUsingClientDomain_forClientName_forAssetSetIdentifier_asShortTermLocker_comprisedOfEntries_usingDesiredPolicyCategory_completingFromQueue_error___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  id v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("process.MobileAssetFramework.shortTermLocker", v0);
  v2 = (void *)__maAutoAssetSetShortTermLockerDispatchQueue;
  __maAutoAssetSetShortTermLockerDispatchQueue = (uint64_t)v1;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
  __maAutoAssetSetSharedProcessByClientDomainName = (uint64_t)v3;

}

- (MAAutoAssetSet)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSet *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *clientDomainName;
  uint64_t v11;
  NSString *autoAssetSetClientName;
  uint64_t v13;
  NSString *assetSetIdentifier;
  uint64_t v15;
  NSArray *autoAssetEntries;
  uint64_t v17;
  NSString *updateCategoryDesiredByClient;
  objc_super v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSet;
  v5 = -[MAAutoAssetSet init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDomainName"));
    v9 = objc_claimAutoreleasedReturnValue();
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAssetSetClientName"));
    v11 = objc_claimAutoreleasedReturnValue();
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v13;

    v5->_shortTermLocker = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shortTermLocker"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("autoAssetEntries"));
    v15 = objc_claimAutoreleasedReturnValue();
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateCategoryDesiredByClient"));
    v17 = objc_claimAutoreleasedReturnValue();
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v17;

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
  id v9;

  v4 = a3;
  -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientDomainName"));

  -[MAAutoAssetSet autoAssetSetClientName](self, "autoAssetSetClientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("autoAssetSetClientName"));

  -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assetSetIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"), CFSTR("shortTermLocker"));
  -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("autoAssetEntries"));

  -[MAAutoAssetSet updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("updateCategoryDesiredByClient"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 completion:(id)a5
{
  -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:](self, "alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:", a3, a4, 0, a5);
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("alterEntriesRepresentingAtomic"), v14, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v13);

    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_1E5D5E9C0;
      v17[4] = self;
      v18 = v11;
      v19 = v12;
      v20 = v10;
      v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:].cold.1();

  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("alterEntriesRepresentingAtomic"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 64));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, v12, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, -101, -101, 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"), v18, 0, v16);
    v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E5D5CB18;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v20, "connectClientSendServerMessage:proxyObject:withReply:", v19, 0, v21);

  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("alterEntriesRepresentingAtomic"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("alterEntriesRepresentingAtomic"), v7, *(_QWORD *)(a1 + 40));
  }

}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4
{
  return -[MAAutoAssetSet alterEntriesRepresentingAtomicSync:toBeComprisedOfEntries:withNeedPolicy:](self, "alterEntriesRepresentingAtomicSync:toBeComprisedOfEntries:withNeedPolicy:", a3, a4, 0);
}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[8];
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__8;
  v34[4] = __Block_byref_object_dispose__8;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v11 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke;
  v18[3] = &unk_1E5D5E9E8;
  v20 = v24;
  v21 = v34;
  v22 = &v28;
  v23 = v26;
  v13 = v11;
  v19 = v13;
  -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:](self, "alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:", v8, v9, v10, v18);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v13, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v26;
    block[5] = v24;
    block[6] = v34;
    block[7] = &v28;
    dispatch_sync(v14, block);

  }
  v15 = (id)v29[5];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v15;
}

void __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2;
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

intptr_t __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2(intptr_t result)
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

void __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(alterEntriesRepresentingAtomicSync)"), 0, CFSTR("timeout (at framework layer) while waiting for alter-entries-representing-atomic to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)needForAtomic:(id)a3 completion:(id)a4
{
  -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:](self, "needForAtomic:withNeedPolicy:completion:", a3, 0, a4);
}

- (void)needForAtomic:(id)a3 withNeedPolicy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("needForAtomic"), v11, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v10);

    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke;
      v14[3] = &unk_1E5D5CB68;
      v14[4] = self;
      v15 = v9;
      v16 = v8;
      v17 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:].cold.1();

  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("needForAtomic"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, v12, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, -101, -101, 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:NEED_FOR_ATOMIC"), v18, 0, v16);
    v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E5D5CB18;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v20, "connectClientSendServerMessage:proxyObject:withReply:", v19, 0, v21);

  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("needForAtomic"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("needForAtomic"), v7, *(_QWORD *)(a1 + 40));
  }

}

- (id)needForAtomicSync:(id)a3
{
  return -[MAAutoAssetSet needForAtomicSync:withNeedPolicy:](self, "needForAtomicSync:withNeedPolicy:", a3, 0);
}

- (id)needForAtomicSync:(id)a3 withNeedPolicy:(id)a4
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
  v31[3] = __Block_byref_object_copy__8;
  v31[4] = __Block_byref_object_dispose__8;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
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
  v15[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke;
  v15[3] = &unk_1E5D5E9E8;
  v17 = v21;
  v18 = v31;
  v19 = &v25;
  v20 = v23;
  v10 = v8;
  v16 = v10;
  -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:](self, "needForAtomic:withNeedPolicy:completion:", v6, v7, v15);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v10, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3;
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

void __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2;
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

intptr_t __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2(intptr_t result)
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

void __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(needForAtomicSync)"), 0, CFSTR("timeout (at framework layer) while waiting for need-for-atomic to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, 0, 0, a5, 0, a6);
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, 0, a6, 0, a7);
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, 0, a5, a6, 0, a7);
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 completion:(id)a8
{
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 reportingProgress:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  BOOL v30;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (v19)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("checkAtomic"), v20, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v19);

    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      v23[3] = &unk_1E5D5EA10;
      v23[4] = self;
      v24 = v16;
      v25 = v17;
      v30 = a5;
      v26 = v15;
      v29 = a7;
      v27 = v18;
      v28 = v19;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v23);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();

  }
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  MAAutoAssetSetInfoInstance *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("checkAtomic"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 72));

  }
  else
  {
    v24 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = __maAutoAssetSetSharedClientProcessName;
    v9 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "autoAssetEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v24, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v6, v7, v8, v9, v10, v11, v12, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), -101, *(_QWORD *)(a1 + 64) != 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:CHECK_ATOMIC"), v18, 0, v16);
    v20 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProxyObjectForSetProgressBlock:", *(_QWORD *)(a1 + 64));
    v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v25[3] = &unk_1E5D5E180;
    v22 = *(_QWORD *)(a1 + 32);
    v26 = v20;
    v27 = v22;
    v28 = *(id *)(a1 + 72);
    v23 = v20;
    objc_msgSend(v21, "connectClientSendServerMessage:proxyObject:withReply:", v19, v23, v25);

  }
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  if (!v24 || v5)
  {
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v15, "assetSetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v16 = CFSTR("failure reported by server");
      v17 = v15;
      v18 = v7;
      v19 = 0;
      v20 = v5;
    }
    else
    {
      v16 = CFSTR("no response message from server");
      v17 = v15;
      v18 = v7;
      v19 = 6104;
      v20 = 0;
    }
    objc_msgSend(v17, "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("checkAtomic"), v18, v19, v20, v16, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v24, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setFound"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentSetStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "newerVersionError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "assetSetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentSetStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
      {
        objc_msgSend(v12, "newerVersionError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("checkAtomic"), v11, 0, v14, CFSTR("found-information indicated error"), *(_QWORD *)(a1 + 48));
      }
      else
      {
        objc_msgSend(v12, "newerAtomicInstanceDiscovered");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentSetStatus");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "newerDiscoveredAtomicEntries");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:", CFSTR("checkAtomic"), v11, v14, v23, *(_QWORD *)(a1 + 48));

      }
    }
    else
    {
      v21 = *(void **)(a1 + 40);
      objc_msgSend(v21, "assetSetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("checkAtomic"), v11, 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 48));
    }

  }
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 discoveredAtomicEntries:(id *)a6 error:(id *)a7
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:](self, "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:", a3, a4, 0, 0, a5, a6, a7, 0);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:](self, "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:", a3, a4, a5, 0, a6, a7, a8, 0);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:](self, "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:", a3, a4, a5, 0, a6, a7, a8, a9);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:](self, "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:", a3, a4, 0, a5, a6, a7, a8, 0);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:](self, "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9 reportingProgress:(id)a10
{
  id v12;
  id v13;
  id v14;
  dispatch_semaphore_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v22;
  _BOOL4 v24;
  _QWORD block[10];
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD *v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];
  char v39;
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
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[5];
  id v59;

  v24 = a5;
  v22 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a10;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__8;
  v58[4] = __Block_byref_object_dispose__8;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__8;
  v56 = __Block_byref_object_dispose__8;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8;
  v50 = __Block_byref_object_dispose__8;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__8;
  v44 = __Block_byref_object_dispose__8;
  v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v15 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_1E5D5EA60;
  v30 = v36;
  v31 = v58;
  v16 = v12;
  v28 = v16;
  v32 = &v52;
  v33 = &v46;
  v34 = &v40;
  v35 = v38;
  v17 = v15;
  v29 = v17;
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:", v22, v16, v24, v13, a7, v14, v27);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v17, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E5D5EA88;
    block[4] = v38;
    block[5] = v36;
    block[6] = v58;
    block[7] = &v52;
    block[8] = &v46;
    block[9] = &v40;
    dispatch_sync(v18, block);

  }
  if (a8)
    *a8 = objc_retainAutorelease((id)v47[5]);
  if (a9)
    *a9 = objc_retainAutorelease((id)v41[5]);
  v19 = (id)v53[5];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(v58, 8);
  return v19;
}

void __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  __int128 v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E5D5EA38;
  v21 = *(_OWORD *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  v17 = v7;
  v11 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 64);
  v23 = v11;
  v18 = v8;
  v19 = v9;
  v20 = *(id *)(a1 + 40);
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_sync(v10, block);

}

intptr_t __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 72) + 8) + 24))
  {
    v1 = result;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 80) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 40), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40), *(id *)(v1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 64));
  }
  return result;
}

void __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3(_QWORD *a1)
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

    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1[8] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(checkAtomicSync)"), 0, CFSTR("timeout (at framework layer) while waiting for check-atomic to complete"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[9] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, 0, a5, 0, a6);
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
  -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, a6, 0, a7);
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:", a3, a4, 0, a5, a6, a7);
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("lockAtomic"), v19, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v18);

    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      v22[3] = &unk_1E5D5EAB0;
      v22[4] = self;
      v23 = v15;
      v24 = v16;
      v25 = v14;
      v28 = a6;
      v26 = v17;
      v27 = v18;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v22);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();

  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  MAAutoAssetSetInfoInstance *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("lockAtomic"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 72));

  }
  else
  {
    v24 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = __maAutoAssetSetSharedClientProcessName;
    v9 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "autoAssetEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v24, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v6, v7, v8, v9, v10, v11, v12, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1, -101, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64) != 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:LOCK_ATOMIC"), v18, 0, v16);
    v20 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProxyObjectForSetProgressBlock:", *(_QWORD *)(a1 + 64));
    v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v25[3] = &unk_1E5D5E180;
    v22 = *(_QWORD *)(a1 + 32);
    v26 = v20;
    v27 = v22;
    v28 = *(id *)(a1 + 72);
    v23 = v20;
    objc_msgSend(v21, "connectClientSendServerMessage:proxyObject:withReply:", v19, v23, v25);

  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = a3;
  if (!v30 || v5)
  {
    v19 = *(void **)(a1 + 40);
    objc_msgSend(v19, "assetSetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v20 = CFSTR("failure reported by server");
      v21 = v19;
      v22 = v7;
      v23 = 0;
      v24 = v5;
    }
    else
    {
      v20 = CFSTR("no response message from server");
      v21 = v19;
      v22 = v7;
      v23 = 6104;
      v24 = 0;
    }
    objc_msgSend(v21, "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("lockAtomic"), v22, v23, v24, v20, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v30, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setFound"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeStringForKey:", CFSTR("sandboxExtensionKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeStringForKey:", CFSTR("sandboxExtensionPathKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentSetStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "availableForUseError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(void **)(a1 + 40);
      objc_msgSend(v14, "assetSetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentSetStatus");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v13)
      {
        objc_msgSend(v16, "availableForUseError");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("lockAtomic"), v15, 0, v18, CFSTR("found-information indicated error"), *(_QWORD *)(a1 + 48));

      }
      else
      {
        objc_msgSend(v16, "latestDownloadedAtomicInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currentSetStatus");
        v26 = v9;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "latestDowloadedAtomicInstanceEntries");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:", CFSTR("lockAtomic"), v15, v29, v28, v26, v11, *(_QWORD *)(a1 + 48));

        v9 = v26;
      }

    }
    else
    {
      v25 = *(void **)(a1 + 40);
      objc_msgSend(v25, "assetSetIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("lockAtomic"), v15, 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(a1 + 48));
    }

  }
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:](self, "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:", a3, a4, 0, a5, a6, a7, 0);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:](self, "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:](self, "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:", a3, a4, 0, a5, a6, a7, a8);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD block[9];
  _QWORD v27[4];
  NSObject *v28;
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

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a9;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__8;
  v54 = __Block_byref_object_dispose__8;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__8;
  v48 = __Block_byref_object_dispose__8;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v16 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_1E5D5EAD8;
  v29 = v34;
  v30 = &v50;
  v17 = v15;
  v31 = &v44;
  v32 = &v38;
  v18 = v12;
  v33 = v36;
  v19 = v16;
  v28 = v19;
  -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:](self, "lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:", v12, v13, v14, a6, v15, v27);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v19, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E5D5E450;
    block[4] = v36;
    block[5] = v34;
    block[6] = &v50;
    block[7] = &v44;
    block[8] = &v38;
    dispatch_sync(v20, block);

  }
  if (a7)
    *a7 = objc_retainAutorelease((id)v45[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v39[5]);
  v21 = (id)v51[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v21;
}

void __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v15 = a1[2];
  v11 = a1[4];
  v21 = a1[3];
  v22 = v11;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2;
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

intptr_t __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2(intptr_t result)
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

void __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(lockAtomicSync)"), 0, CFSTR("timeout (at framework layer) while waiting for lock-atomic to complete"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)mapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  MAAutoAssetSet *v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("mapLockedAtomicEntry"), v14, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v13);

    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke;
      v17[3] = &unk_1E5D5E9C0;
      v18 = v12;
      v19 = self;
      v20 = v11;
      v21 = v10;
      v22 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:].cold.1();

  }
}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  MAAutoAssetSetEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MAAutoAssetSetInfoInstance *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("mapLockedAtomicEntry"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 64));

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = [MAAutoAssetSetEntry alloc];
    objc_msgSend(*(id *)(a1 + 32), "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:](v7, "initForAssetType:withAssetSpecifier:matchingAssetVersion:", v8, v9, v10);

    v11 = v6;
    objc_msgSend(v6, "addObject:", v27);
    v12 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "clientDomainName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "autoAssetSetClientName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = __maAutoAssetSetSharedClientProcessName;
    v16 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 48);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v12, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v13, v14, v15, v16, v17, v18, v11, 0, v19);

    v21 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 56), 0, -101, -101, 0);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setSafeObject:forKey:", v20, CFSTR("setInstance"));
    objc_msgSend(v22, "setSafeObject:forKey:", v21, CFSTR("setDesire"));
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"), v24, 0, v22);
    v26 = (void *)__maAutoAssetSetSharedConnectionClient;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2;
    v28[3] = &unk_1E5D5EB00;
    v28[4] = *(_QWORD *)(a1 + 40);
    v31 = *(id *)(a1 + 64);
    v29 = *(id *)(a1 + 32);
    v30 = *(id *)(a1 + 48);
    objc_msgSend(v26, "connectClientSendServerMessage:proxyObject:withReply:", v25, 0, v28);

    v3 = 0;
  }

}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v28 = a1;
    v29 = *(void **)(a1 + 32);
    objc_msgSend(v29, "assetSetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v30 = CFSTR("failure reported by server");
      v31 = v29;
      v32 = v9;
      v33 = 0;
      v34 = v7;
    }
    else
    {
      v30 = CFSTR("no response message from server");
      v31 = v29;
      v32 = v9;
      v33 = 6104;
      v34 = 0;
    }
    objc_msgSend(v31, "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("mapLockedAtomicEntry"), v32, v33, v34, v30, *(_QWORD *)(v28 + 56));
    goto LABEL_25;
  }
  v44 = a1;
  objc_msgSend(v5, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeObjectForKey:ofClass:", CFSTR("setFound"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v35 = *(void **)(v44 + 32);
    objc_msgSend(v35, "assetSetIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("mapLockedAtomicEntry"), v36, 6104, 0, CFSTR("no found-information provided by server"), *(_QWORD *)(v44 + 56));

    goto LABEL_25;
  }
  v40 = v5;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v39 = v9;
  objc_msgSend(v9, "currentSetStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestDowloadedAtomicInstanceEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  v13 = v44;
  if (!v12)
  {
LABEL_15:

    goto LABEL_23;
  }
  v14 = v12;
  v15 = *(_QWORD *)v46;
  v16 = 0x1E0DA8000uLL;
  v41 = *(_QWORD *)v46;
LABEL_6:
  v17 = 0;
  v42 = v14;
  while (1)
  {
    if (*(_QWORD *)v46 != v15)
      objc_enumerationMutation(obj);
    v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
    v19 = *(void **)(v16 + 2336);
    objc_msgSend(v18, "fullAssetSelector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "assetType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v13 + 40), "assetType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "stringIsEqual:to:", v21, v22) & 1) == 0)
    {

      goto LABEL_13;
    }
    v23 = *(void **)(v16 + 2336);
    objc_msgSend(v18, "fullAssetSelector");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "assetSpecifier");
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v13 + 40), "assetSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v23, "stringIsEqual:to:", v26, v27);

    v13 = v44;
    v16 = v25;
    v14 = v42;

    v15 = v41;
    if ((v23 & 1) != 0)
      break;
LABEL_13:
    if (v14 == ++v17)
    {
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v14)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  objc_msgSend(v18, "fullAssetSelector");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(*(id *)(v44 + 32), "_successMapLockedAtomicEntry:forAtomicInstance:forMappedSelector:completion:", CFSTR("mapLockedAtomicEntry"), *(_QWORD *)(v44 + 48), v37, *(_QWORD *)(v44 + 56));
    goto LABEL_24;
  }
LABEL_23:
  v38 = *(void **)(v13 + 32);
  objc_msgSend(v38, "assetSetIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("mapLockedAtomicEntry"), v37, 6102, 0, CFSTR("found-information did not include latest downloaded atomic-instance-entry for mapped selector"), *(_QWORD *)(v13 + 56));
LABEL_24:
  v9 = v39;
  v7 = 0;

  v5 = v40;
LABEL_25:

}

- (id)mapLockedAtomicEntrySync:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 mappedSelector:(id *)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[8];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
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

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke;
  v20[3] = &unk_1E5D5EB28;
  v22 = v26;
  v23 = &v36;
  v24 = &v30;
  v25 = v28;
  v15 = v13;
  v21 = v15;
  -[MAAutoAssetSet mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:](self, "mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:", v10, v11, v12, v20);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v15, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3;
    v19[3] = &unk_1E5D5E018;
    v19[4] = v28;
    v19[5] = v26;
    v19[6] = &v36;
    v19[7] = &v30;
    dispatch_sync(v16, v19);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v37[5]);
  v17 = (id)v31[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v17;
}

void __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11[2];
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v11 = *(_OWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2;
  block[3] = &unk_1E5D5CAA0;
  v13 = v6;
  v14 = v7;
  v17 = *(_QWORD *)(a1 + 64);
  v9 = v11[0];
  v15 = *(_OWORD *)v11;
  v10 = v7;
  v11[0] = v6;
  dispatch_sync(v8, block);

}

intptr_t __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2(intptr_t result)
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

void __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(mapLockedAtomicEntrySync)"), 0, CFSTR("timeout (at framework layer) while waiting for map-locked-atomic-entry to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
  -[MAAutoAssetSet _lockAtomicWithContentValidationOption:forAtomicInstance:performContentValidation:completion:](self, "_lockAtomicWithContentValidationOption:forAtomicInstance:performContentValidation:completion:", a3, a4, 1, a5);
}

- (void)_lockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet _shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:](self, "_shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:", v10, v11, v7, v12);
    }
    else
    {
      -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
      v16[3] = &unk_1E5D5EB50;
      v18 = v7;
      v17 = v12;
      dispatch_async(v15, v16);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();

  }
}

void __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = CFSTR("auto-set(lockAtomic)");
  else
    v2 = CFSTR("auto-set(lockAtomic:Fast)");
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6581, v2, 0, CFSTR("restricted to SHORT-TERM locker instance"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return -[MAAutoAssetSet lockAtomicSyncWithContentValidationOption:forAtomicInstance:performContentValidation:error:](self, "lockAtomicSyncWithContentValidationOption:forAtomicInstance:performContentValidation:error:", a3, a4, 1, a5);
}

- (id)lockAtomicSyncWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  id v15;
  id v17;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = CFSTR("auto-set(lockAtomicSync:fast)");
  if (v7)
    v12 = CFSTR("auto-set(lockAtomicSync)");
  v13 = v12;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    v17 = 0;
    -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:](self, "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:", v10, v11, v7, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6581, v13, 0, CFSTR("restricted to SHORT-TERM locker instance"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (a6)
LABEL_7:
    *a6 = objc_retainAutorelease(v15);
LABEL_8:

  return v14;
}

- (void)formSubAtomicInstance:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("formSubAtomicInstance"), v14, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v13);

    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke;
      v17[3] = &unk_1E5D5E9C0;
      v17[4] = self;
      v18 = v11;
      v19 = v12;
      v20 = v10;
      v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:].cold.1();

  }
}

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetSetInfoInstance *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:", CFSTR("formSubAtomicInstance"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v3 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = __maAutoAssetSetSharedClientProcessName;
    v7 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v3, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v4, v5, v6, v7, v8, v9, v10, 0, v11);

    v13 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 56), 0, -101, -101, 0);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSafeObject:forKey:", v12, CFSTR("setInstance"));
    objc_msgSend(v14, "setSafeObject:forKey:", v13, CFSTR("setDesire"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:FORM_SUB_ATOMIC"), v16, 0, v14);
    v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2;
    v19[3] = &unk_1E5D5CB18;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 64);
    objc_msgSend(v18, "connectClientSendServerMessage:proxyObject:withReply:", v17, 0, v19);

  }
}

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:", CFSTR("formSubAtomicInstance"), v12, v13, v11, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v14, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setFound"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "currentSetStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "newerAtomicInstanceDiscovered");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_successFormSubAtomicInstance:formedSubAtomicInstance:completion:", CFSTR("formSubAtomicInstance"), v10, *(_QWORD *)(a1 + 40));

  }
}

- (id)formSubAtomicInstanceSync:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[8];
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
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

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v13 = dispatch_semaphore_create(0);
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke;
  v20[3] = &unk_1E5D5E9E8;
  v22 = v26;
  v23 = &v36;
  v24 = &v30;
  v25 = v28;
  v15 = v13;
  v21 = v15;
  -[MAAutoAssetSet formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:](self, "formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:", v10, v11, v12, v20);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v15, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3;
    v19[3] = &unk_1E5D5E018;
    v19[4] = v28;
    v19[5] = v26;
    v19[6] = &v36;
    v19[7] = &v30;
    dispatch_sync(v16, v19);

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v31[5]);
  v17 = (id)v37[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v17;
}

void __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2;
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

intptr_t __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2(intptr_t result)
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

void __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(formSubAtomicInstanceSync)"), 0, CFSTR("timeout (at framework layer) while waiting for form-sub-atomic-instance to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:](self, "continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:", a3, a4, 0, a5);
}

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("continueAtomicLock"), v14, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v13);

    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_1E5D5E9C0;
      v17[4] = self;
      v18 = v11;
      v19 = v12;
      v20 = v10;
      v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:].cold.1();

  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("continueAtomicLock"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 64));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, v12, 0, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, -101, -101, 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"), v18, 0, v16);
    v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_1E5D5CB18;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v20, "connectClientSendServerMessage:proxyObject:withReply:", v19, 0, v21);

  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("continueAtomicLock"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("continueAtomicLock"), v7, *(_QWORD *)(a1 + 40));
  }

}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  return -[MAAutoAssetSet continueAtomicLockSync:ofAtomicInstance:withNeedPolicy:](self, "continueAtomicLockSync:ofAtomicInstance:withNeedPolicy:", a3, a4, 0);
}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD block[8];
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[3];
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__8;
  v34[4] = __Block_byref_object_dispose__8;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v11 = dispatch_semaphore_create(0);
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke;
  v18[3] = &unk_1E5D5E9E8;
  v20 = v24;
  v21 = v34;
  v22 = &v28;
  v23 = v26;
  v13 = v11;
  v19 = v13;
  -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:](self, "continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:", v8, v9, v10, v18);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v13, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3;
    block[3] = &unk_1E5D5E018;
    block[4] = v26;
    block[5] = v24;
    block[6] = v34;
    block[7] = &v28;
    dispatch_sync(v14, block);

  }
  v15 = (id)v29[5];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v15;
}

void __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2;
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

intptr_t __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2(intptr_t result)
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

void __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(continueAtomicLockSync)"), 0, CFSTR("timeout (at framework layer) while waiting for continue-atomic-lock to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)endAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (!-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2;
      v15[3] = &unk_1E5D5CB68;
      v15[4] = self;
      v16 = v9;
      v17 = v8;
      v18 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);

      goto LABEL_8;
    }
    -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:](self, "_shortTermEndAtomicLockSync:ofAtomicInstance:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke;
    block[3] = &unk_1E5D5E2E8;
    v20 = v11;
    v21 = v10;
    block[4] = self;
    v13 = v11;
    dispatch_async(v12, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:].cold.1();
  }

LABEL_8:
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("endAtomicLock"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, v12, 0, 0, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 48), 0, -101, -101, 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCK"), v18, 0, v16);
    v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3;
    v21[3] = &unk_1E5D5CB18;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v20, "connectClientSendServerMessage:proxyObject:withReply:", v19, 0, v21);

  }
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("endAtomicLock"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("endAtomicLock"), v7, *(_QWORD *)(a1 + 40));
  }

}

- (id)endAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[8];
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v34 = 0;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:](self, "_shortTermEndAtomicLockSync:ofAtomicInstance:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v30[5];
    v30[5] = v8;

  }
  else
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__8;
    v27[4] = __Block_byref_object_dispose__8;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    v10 = dispatch_semaphore_create(0);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke;
    v17[3] = &unk_1E5D5E9E8;
    v19 = v23;
    v20 = v27;
    v21 = &v29;
    v22 = v25;
    v12 = v10;
    v18 = v12;
    -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:](self, "endAtomicLock:ofAtomicInstance:completion:", v6, v7, v17);
    if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v12, -100))
    {
      +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3;
      block[3] = &unk_1E5D5E018;
      block[4] = v25;
      block[5] = v23;
      block[6] = v27;
      block[7] = &v29;
      dispatch_sync(v13, block);

    }
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

  }
  v14 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2;
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

intptr_t __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2(intptr_t result)
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

void __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(endAtomicLockSync)"), 0, CFSTR("timeout (at framework layer) while waiting for end-atomic-lock to complete"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)assetSetForStaging:(id)a3 asEntriesWhenTargeting:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetForStaging"), v11, 6580, 0, CFSTR("not supported for SHORT-TERM locker instance"), v10);

    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke;
      v14[3] = &unk_1E5D5CB68;
      v14[4] = self;
      v15 = v9;
      v16 = v8;
      v17 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet assetSetForStaging:asEntriesWhenTargeting:completion:].cold.1();

  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetForStaging"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 56));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, v12, v13);

    v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 48), 0, -101, -101, 0);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setSafeObject:forKey:", v14, CFSTR("setInstance"));
    objc_msgSend(v16, "setSafeObject:forKey:", v15, CFSTR("setDesire"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:ASSET_SET_FOR_STAGING"), v18, 0, v16);
    v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2;
    v21[3] = &unk_1E5D5CB18;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 56);
    objc_msgSend(v20, "connectClientSendServerMessage:proxyObject:withReply:", v19, 0, v21);

  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetForStaging"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("assetSetForStaging"), v7, *(_QWORD *)(a1 + 40));
  }

}

- (id)assetSetForStagingSync:(id)a3 asEntriesWhenTargeting:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD block[7];
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
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

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v8 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke;
  v15[3] = &unk_1E5D5EB78;
  v17 = v20;
  v18 = &v24;
  v19 = v22;
  v10 = v8;
  v16 = v10;
  -[MAAutoAssetSet assetSetForStaging:asEntriesWhenTargeting:completion:](self, "assetSetForStaging:asEntriesWhenTargeting:completion:", v6, v7, v15);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v10, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v22;
    block[5] = v20;
    block[6] = &v24;
    dispatch_sync(v11, block);

  }
  v12 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2(intptr_t result)
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

void __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(assetSetForStagingSync)"), 0, CFSTR("timeout (at framework layer) while waiting for asset-set-for-staging to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)currentSetStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet _shortTermCurrentSetStatus:](self, "_shortTermCurrentSetStatus:", v4);
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke;
      v7[3] = &unk_1E5D5E130;
      v7[4] = self;
      v8 = v4;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v7);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet currentSetStatus:].cold.1();

  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedCurrentSetStatus:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("currentSetStatus"), v5, 0, v3, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:CURRENT_SET_STATUS"), v16, 0, v14);
    v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke_2;
    v20[3] = &unk_1E5D5CB18;
    v19 = *(void **)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v19;
    objc_msgSend(v18, "connectClientSendServerMessage:proxyObject:withReply:", v17, 0, v20);

  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (v20 && !v5)
  {
    objc_msgSend(v20, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setFound"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "currentSetStatus");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "assetSetIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "currentSetStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:", CFSTR("currentSetStatus"), v10, v11, *(_QWORD *)(a1 + 40));

LABEL_13:
        goto LABEL_14;
      }
      v18 = *(_QWORD *)(a1 + 40);
      v19 = CFSTR("found-information yet no set-status provided");
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "assetSetIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = CFSTR("no found-information provided by server");
    }
    objc_msgSend(v9, "_failedCurrentSetStatus:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("currentSetStatus"), v10, 6104, 0, v19, v18);
    goto LABEL_13;
  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = CFSTR("failure reported by server");
    v14 = v12;
    v15 = v7;
    v16 = 0;
    v17 = v5;
  }
  else
  {
    v13 = CFSTR("no response message from server");
    v14 = v12;
    v15 = v7;
    v16 = 6104;
    v17 = 0;
  }
  objc_msgSend(v14, "_failedCurrentSetStatus:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("currentSetStatus"), v15, v16, v17, v13, *(_QWORD *)(a1 + 40));
LABEL_14:

}

- (id)currentSetStatusSync:(id *)a3
{
  id *v5;
  uint64_t v6;
  void *v7;
  id v8;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[9];
  _QWORD v15[5];
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__8;
  v39 = __Block_byref_object_dispose__8;
  v40 = 0;
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v34 = 0;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    v5 = v30;
    v28 = v30[5];
    -[MAAutoAssetSet _shortTermCurrentSetStatusSync:](self, "_shortTermCurrentSetStatusSync:", &v28);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v5 + 5, v28);
    v7 = (void *)v36[5];
    v36[5] = v6;

    if (a3)
LABEL_3:
      *a3 = objc_retainAutorelease(v30[5]);
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__8;
    v26[4] = __Block_byref_object_dispose__8;
    v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v10 = dispatch_semaphore_create(0);
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke;
    v15[3] = &unk_1E5D5EBA0;
    v17 = v22;
    v18 = v26;
    v15[4] = self;
    v19 = &v35;
    v20 = &v29;
    v21 = v24;
    v12 = v10;
    v16 = v12;
    -[MAAutoAssetSet currentSetStatus:](self, "currentSetStatus:", v15);
    if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v12, -100))
    {
      +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3;
      block[3] = &unk_1E5D5E450;
      block[4] = v24;
      block[5] = v22;
      block[6] = v26;
      block[7] = &v35;
      block[8] = &v29;
      dispatch_sync(v13, block);

    }
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

    if (a3)
      goto LABEL_3;
  }
  v8 = (id)v36[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v8;
}

void __39__MAAutoAssetSet_currentSetStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  id v10;
  id v11;
  id v12[2];
  _QWORD block[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2;
  block[3] = &unk_1E5D5E0E0;
  v8 = *(_OWORD *)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v9 = *(_OWORD *)(a1 + 72);
  v17 = v8;
  v18 = v9;
  *(_OWORD *)v12 = *(_OWORD *)(a1 + 40);
  v15 = v6;
  v10 = v12[0];
  v16 = *(_OWORD *)v12;
  v11 = v6;
  v12[0] = v5;
  dispatch_sync(v7, block);

}

intptr_t __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2(intptr_t result)
{
  intptr_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "assetSetIdentifier");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }
  return result;
}

void __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3(_QWORD *a1)
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

    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(currentSetStatusSync)"), 0, CFSTR("timeout (at framework layer) while waiting for current-set-status to complete"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[8] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)_shortTermLockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a5;
  v10 = a6;
  v21 = 0;
  -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:](self, "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:", a3, a4, v6, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
  v17[3] = &unk_1E5D5E2E8;
  v19 = v12;
  v20 = v10;
  v18 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

}

uint64_t __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_shortTermLockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
  -[MAAutoAssetSet _shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:](self, "_shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:", a3, a4, 1, a5);
}

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  MAAutoAssetSet *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
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

  v10 = a3;
  v11 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  v29 = 0;
  v12 = __maAutoAssetSetShortTermLockerDispatchQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke;
  v17[3] = &unk_1E5D5EBC8;
  v13 = v11;
  v18 = v13;
  v19 = self;
  v14 = v10;
  v23 = a5;
  v20 = v14;
  v21 = &v30;
  v22 = &v24;
  dispatch_sync(v12, v17);
  if (a6)
    *a6 = objc_retainAutorelease((id)v25[5]);
  v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  int v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id obj;
  id v55;
  id v56;
  id v57;
  unsigned __int8 v58;
  uint8_t buf[4];
  _BYTE v60[34];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v58 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "clientDomainName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assetSetIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:](MAAutoAssetSetStatus, "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:", v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *(void **)(a1 + 40);
    v23 = *(_QWORD *)(a1 + 48);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    v26 = *(unsigned __int8 *)(a1 + 72);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v56 = *(id *)(v27 + 40);
    v57 = v25;
    v28 = objc_msgSend(v22, "_shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:", CFSTR("auto-set(_shortTermLockAtomicSync)[atomic-instance]"), v2, v23, v26, v21, &v57, &v56);
    objc_storeStrong((id *)(v24 + 40), v57);
    objc_storeStrong((id *)(v27 + 40), v56);
    if ((v28 & 0x80000000) != 0)
    {
      v10 = 0;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "latestDownloadedAtomicInstance");
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = *(void **)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    v32 = *(_BYTE *)(a1 + 72);
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v55 = *(id *)(v33 + 40);
    LOBYTE(v52) = v32;
    objc_msgSend(v30, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v29, 1, v28, v31, &v58, 0, v52, &v55);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v33 + 40), v55);
    if (v10)
    {
      v34 = v58;
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      v36 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          v37 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v10, "summary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)v60 = v29;
          *(_WORD *)&v60[8] = 2114;
          *(_QWORD *)&v60[10] = v37;
          *(_WORD *)&v60[18] = 2114;
          *(_QWORD *)&v60[20] = v38;
          v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ |"
                " holding shared lock | shortTermLock:%{public}@";
          v40 = v13;
          v41 = 32;
LABEL_27:
          _os_log_impl(&dword_1AE33B000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v36)
      {
        v44 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v10, "summary");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v60 = v29;
        *(_WORD *)&v60[8] = 2114;
        *(_QWORD *)&v60[10] = v44;
        *(_WORD *)&v60[18] = 2114;
        *(_QWORD *)&v60[20] = v45;
        _os_log_impl(&dword_1AE33B000, v13, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | additional (locally tracked usage) of shared lock | shortTermLock:%{public}@", buf, 0x20u);

      }
    }
    if (close(v28))
    {
      v46 = *__error();
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v60 = v28;
        *(_WORD *)&v60[4] = 2114;
        *(_QWORD *)&v60[6] = v29;
        *(_WORD *)&v60[14] = 2114;
        *(_QWORD *)&v60[16] = v48;
        *(_WORD *)&v60[24] = 1024;
        *(_DWORD *)&v60[26] = v46;
        _os_log_error_impl(&dword_1AE33B000, v13, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | WARNING | (extraFileLockToClose) failed close of sharedLockedFileDescriptor, errno:%d", buf, 0x22u);
      }
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "summary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v60 = v28;
      *(_WORD *)&v60[4] = 2114;
      *(_QWORD *)&v60[6] = v29;
      *(_WORD *)&v60[14] = 2114;
      *(_QWORD *)&v60[16] = v50;
      *(_WORD *)&v60[24] = 2114;
      *(_QWORD *)&v60[26] = v38;
      v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n"
            "[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | (extraFileLockToClose) released sharedLockedFi"
            "leDescriptor | shortTermLock:%{public}@";
      v40 = v13;
      v41 = 38;
      goto LABEL_27;
    }
LABEL_16:

    v2 = (id)v29;
    goto LABEL_17;
  }
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  v8 = *(_BYTE *)(a1 + 72);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v53 = *(id *)(v9 + 40);
  obj = v7;
  LOBYTE(v51) = v8;
  objc_msgSend(v4, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v3, 1, 0xFFFFFFFFLL, v5, &v58, &obj, v51, &v53);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v9 + 40), v53);
  if (v10)
  {
    v11 = v58;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v10, "summary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v60 = v15;
        *(_WORD *)&v60[8] = 2114;
        *(_QWORD *)&v60[10] = v16;
        *(_WORD *)&v60[18] = 2114;
        *(_QWORD *)&v60[20] = v17;
        v18 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | h"
              "olding shared lock | shortTermLock:%{public}@";
LABEL_14:
        _os_log_impl(&dword_1AE33B000, v13, OS_LOG_TYPE_DEFAULT, v18, buf, 0x20u);

      }
    }
    else if (v14)
    {
      v42 = *(_QWORD *)(a1 + 32);
      v43 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v10, "summary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v60 = v42;
      *(_WORD *)&v60[8] = 2114;
      *(_QWORD *)&v60[10] = v43;
      *(_WORD *)&v60[18] = 2114;
      *(_QWORD *)&v60[20] = v17;
      v18 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | add"
            "itional (locally tracked usage) of shared lock | shortTermLock:%{public}@";
      goto LABEL_14;
    }
    v21 = 0;
    v29 = (uint64_t)v2;
    goto LABEL_16;
  }
  v21 = 0;
LABEL_17:
  objc_msgSend(*(id *)(a1 + 40), "_shortTermLogResult:forLockReason:forAtomicInstance:atomicInstanceFilename:forShortTermLock:withSetStatus:returningError:", CFSTR("_shortTermLockAtomicSync"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v21, v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:](self, "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:", a3, a4, 1, a5);
}

- (void)_shortTermEndAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a5;
  -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:](self, "_shortTermEndAtomicLockSync:ofAtomicInstance:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke;
  block[3] = &unk_1E5D5E2E8;
  v14 = v9;
  v15 = v8;
  block[4] = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

}

void __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (id)_shortTermEndAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  MAAutoAssetSet *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  v23 = 0;
  v8 = __maAutoAssetSetShortTermLockerDispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke;
  v13[3] = &unk_1E5D5EBF0;
  v14 = v7;
  v15 = v6;
  v16 = self;
  v17 = &v18;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  uint64_t v39;
  id v40;
  char v41;
  uint64_t j;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id obj;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = a1 + 32;
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v2)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot end SHORT-TERM locks of all atomic-instances when lock-reason provided | endLockReason:%@"), *(_QWORD *)(a1 + 40));
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6111, CFSTR("auto-set(_shortTermEndAtomicLockSync)"), 0, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v9 = 0;
      goto LABEL_69;
    }
    v27 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    objc_msgSend(*(id *)(a1 + 48), "clientDomainName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeObjectForKey:ofClass:", v28, objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot end SHORT-TERM locks of all atomic-instances (byAssetSetIdenfier empty) | endLockReason:%@"), *(_QWORD *)(a1 + 40));
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6111, CFSTR("auto-set(_shortTermEndAtomicLockSync)"), 0, v56);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v59 = *(void **)(v58 + 40);
      *(_QWORD *)(v58 + 40) = v57;

      v9 = 0;
LABEL_68:

      goto LABEL_69;
    }
    objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "safeObjectForKey:ofClass:", v30, objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot end SHORT-TERM locks of all atomic-instances (byAtomicInstance empty) | endLockReason:%@"), *(_QWORD *)(a1 + 40));
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6111, CFSTR("auto-set(_shortTermEndAtomicLockSync)"), 0, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v66 = *(void **)(v65 + 40);
      *(_QWORD *)(v65 + 40) = v64;

      v9 = 0;
LABEL_67:

      goto LABEL_68;
    }
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v85 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(v32, "addObject:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v84, v88, 16);
      }
      while (v35);
    }

    v38 = objc_msgSend(v32, "count");
    if (v38 < 1)
    {
      v40 = 0;
    }
    else
    {
      v39 = v38;
      v81 = v29;
      v40 = 0;
      v41 = 0;
      for (j = 0; j != v39; ++j)
      {
        objc_msgSend(v32, "objectAtIndex:", j);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v80) = 0;
        objc_msgSend(*(id *)(a1 + 48), "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v43, 0, 0xFFFFFFFFLL, 0, 0, 0, v80, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "removeObjectForKey:", v43);
        if (v44)
        {
          objc_msgSend(*(id *)(a1 + 48), "_closeAndRemoveShortTermLock:forShortTermLock:", CFSTR("_shortTermEndAtomicLockSync(ending all locks of atomic-instances and lock-reasons)"), v44);
          if (v40)
            v41 = 1;
          else
            v40 = v44;
        }

      }
      if ((v41 & 1) != 0)
      {
        v9 = 0;
        v29 = v81;
LABEL_66:

        goto LABEL_67;
      }
      v29 = v81;
    }
    v40 = v40;
    v9 = v40;
    goto LABEL_66;
  }
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v5 + 40);
  v7 = (id *)(v5 + 40);
  v6 = v8;
  if (v2)
  {
    obj = v6;
    LOBYTE(v80) = 0;
    objc_msgSend(v4, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v80, &obj);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, obj);
    if (v9)
    {
      objc_msgSend(v9, "lockCountByReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeObjectForKey:ofClass:", *(_QWORD *)(a1 + 40), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_msgSend(v11, "intValue");
        v13 = v12;
        if ((int)v12 > 0)
        {
          if ((_DWORD)v12 != 1)
          {
            v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", (v12 - 1));

            objc_msgSend(v9, "lockCountByReason");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setSafeObject:forKey:", v60, *(_QWORD *)(a1 + 40));

            if (objc_msgSend(v9, "totalLockCount") < 2)
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "oslog");
              v26 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4(v3, (uint64_t)v9, v26);
              v11 = (void *)v60;
              goto LABEL_62;
            }
            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
            v11 = (void *)v60;
            goto LABEL_60;
          }
          objc_msgSend(v9, "lockCountByReason");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

          v15 = objc_msgSend(v9, "totalLockCount");
          if (v15 < 1)
          {
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "oslog");
            v69 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3(v3, (uint64_t)v9, v69);

          }
          else
          {
            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
          }
          objc_msgSend(v9, "lockCountByReason");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v70, "count"))
          {

          }
          else
          {
            v71 = objc_msgSend(v9, "totalLockCount");

            if (v71 > 0)
            {
              if (v15 < 1)
              {
LABEL_63:

                goto LABEL_69;
              }
              goto LABEL_60;
            }
            objc_msgSend(*(id *)(a1 + 48), "_closeAndRemoveShortTermLock:forShortTermLock:", CFSTR("_shortTermEndAtomicLockSync(ending specific atomic-instance lock)"), v9);
          }
          if (v15 <= 0)
            goto LABEL_63;
LABEL_60:
          v72 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
          objc_msgSend(*(id *)(a1 + 48), "clientDomainName");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "safeObjectForKey:ofClass:", v73, objc_opt_class());
          v26 = objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject safeObjectForKey:ofClass:](v26, "safeObjectForKey:ofClass:", v74, objc_opt_class());
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "assetSetAtomicInstance");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setSafeObject:forKey:", v9, v76);

            objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setSafeObject:forKey:](v26, "setSafeObject:forKey:", v75, v77);

            v78 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
            objc_msgSend(*(id *)(a1 + 48), "clientDomainName");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "setSafeObject:forKey:", v26, v79);

          }
          goto LABEL_62;
        }
        v50 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v9, "summary");
        v26 = objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "initWithFormat:", CFSTR("SHORT-TERM lock lockCountForReason has invalid lock count | shortTermLock:%@ | endLockReason:%@ | lockCount:%d"), v26, *(_QWORD *)(a1 + 40), v13);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6501, CFSTR("auto-set(_shortTermEndAtomicLockSync)"), 0, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v54 = *(void **)(v53 + 40);
        *(_QWORD *)(v53 + 40) = v52;

        goto LABEL_45;
      }
      v45 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v9, "summary");
      v26 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("SHORT-TERM lock is not currently locked for reason to end-lock for | shortTermLock:%@ | endLockReason:%@"), v26, *(_QWORD *)(a1 + 40));
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6501, CFSTR("auto-set(_shortTermEndAtomicLockSync)"), 0, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v49 = *(void **)(v48 + 40);
      *(_QWORD *)(v48 + 40) = v47;

      v11 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    v83 = v6;
    LOBYTE(v80) = 0;
    objc_msgSend(v4, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", v80, &v83);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, v83);
    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v20 && objc_msgSend(v20, "code") == 6110)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = 0;

    }
    if (v9)
    {
      v23 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      objc_msgSend(*(id *)(a1 + 48), "clientDomainName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "safeObjectForKey:ofClass:", v24, objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "oslog");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1(v3, (uint64_t)v9, v26);
        goto LABEL_62;
      }
      objc_msgSend(*(id *)(a1 + 48), "assetSetIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeObjectForKey:ofClass:", v25, objc_opt_class());
      v26 = objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "oslog");
        v51 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2(v3, (uint64_t)v9, v51);
LABEL_45:

        goto LABEL_62;
      }
      objc_msgSend(*(id *)(a1 + 48), "_closeAndRemoveShortTermLock:forShortTermLock:", CFSTR("_shortTermEndAtomicLockSync(ending specific atomic-instance locks - all lock-reasons)"), v9);
LABEL_62:

      goto LABEL_63;
    }
  }
LABEL_69:
  objc_msgSend(*(id *)(a1 + 48), "_shortTermLogResult:forLockReason:forAtomicInstance:atomicInstanceFilename:forShortTermLock:withSetStatus:returningError:", CFSTR("_shortTermEndAtomicLockSync"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, v9, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (void)_shortTermCurrentSetStatus:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v15 = 0;
  -[MAAutoAssetSet _shortTermCurrentSetStatusSync:](self, "_shortTermCurrentSetStatusSync:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke;
  v11[3] = &unk_1E5D5E2E8;
  v13 = v6;
  v14 = v4;
  v12 = v5;
  v8 = v6;
  v9 = v5;
  v10 = v4;
  dispatch_async(v7, v11);

}

uint64_t __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_shortTermCurrentSetStatusSync:(id *)a3
{
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke;
  block[3] = &unk_1E5D5EC18;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v8[5]);
  v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id obj;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:](MAAutoAssetSetStatus, "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(id *)(v8 + 40);
  obj = v7;
  v9 = objc_msgSend(v5, "_shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:", CFSTR("auto-set(_shortTermCurrentSetStatus)"), 0, 0, 0, v4, &obj, &v21);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v21);
  if ((v9 & 0x80000000) == 0)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(id *)(v11 + 40);
    objc_msgSend(v10, "_readLockedSetStatusFromSharedLockFile:error:", v4, &v20);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), v20);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (close(v9))
    {
      v15 = *__error();
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "latestDownloadedAtomicInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v24 = v9;
        v25 = 2114;
        v26 = v18;
        v27 = 2114;
        v28 = v4;
        v29 = 1024;
        v30 = v15;
        _os_log_error_impl(&dword_1AE33B000, v17, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | latestAtomicInstanceFilename:%{public}@ | errno:%d", buf, 0x22u);
LABEL_7:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "latestDownloadedAtomicInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        v24 = v9;
        v25 = 2114;
        v26 = v18;
        v27 = 2114;
        v28 = v4;
        _os_log_impl(&dword_1AE33B000, v17, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | released sharedLockedFileDescriptor | | latestAtomicInstanceFilename:%{public}@", buf, 0x1Cu);
        goto LABEL_7;
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_shortTermLogResult:forLockReason:forAtomicInstance:atomicInstanceFilename:forShortTermLock:withSetStatus:returningError:", CFSTR("_shortTermCurrentSetStatusSync"), 0, 0, v4, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 shouldVerifyContent:(BOOL)a9 error:(id *)a10
{
  uint64_t v11;
  _BOOL4 v12;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  void *v73;
  uint64_t v74;
  int v75;
  os_log_t log;
  void *v77;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint8_t buf[4];
  _BYTE v87[34];
  __int16 v88;
  int v89;
  uint64_t v90;

  v11 = *(_QWORD *)&a5;
  v12 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  v16 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
  -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeObjectForKey:ofClass:", v17, objc_opt_class());
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v81 = v14;
  if (!v18)
  {
    if (v12)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v34 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSafeObject:forKey:", v18, v35);

      if (v18)
        goto LABEL_2;
      v25 = 0;
      v36 = 0;
      v28 = 0;
    }
    else
    {
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No current SHORT-TERM lock (by clientDomainName) | assetSetAtomicInstance:%@ | lockReason:%@"), v14, v15);
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6110, CFSTR("auto-set(_shortTermLockForAtomicInstance)"), 0, v47);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v25 = 0;
      v36 = 0;
    }
    v27 = 0;
    v22 = 0;
    v48 = a8;
    goto LABEL_47;
  }
LABEL_2:
  v80 = v15;
  -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeObjectForKey:ofClass:", v19, objc_opt_class());
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    if (!v12)
    {
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No current SHORT-TERM lock (by assetSetIdentifier) | assetSetAtomicInstance:%@ | lockReason:%@"), v14, v80);
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6110, CFSTR("auto-set(_shortTermLockForAtomicInstance)"), 0, v49);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      v20 = 0;
      goto LABEL_24;
    }
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSafeObject:forKey:", v20, v37);

    if (!v20)
    {
      v25 = 0;
LABEL_43:
      v36 = 0;
      v28 = 0;
      goto LABEL_44;
    }
  }
  objc_msgSend(v20, "safeObjectForKey:ofClass:", v14, objc_opt_class());
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    if (v12)
    {
      -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
      v38 = v14;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v38;
      +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:](MAAutoAssetSetStatus, "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:", v39, v40, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v11 & 0x80000000) != 0)
      {
        v84 = 0;
        v85 = 0;
        v62 = -[MAAutoAssetSet _shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:](self, "_shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:", CFSTR("auto-set(_shortTermLockForAtomicInstance)[atomic-instance]"), v41, v80, a9, v25, &v85, &v84);
        v27 = v85;
        v28 = v84;
        if ((v62 & 0x80000000) == 0)
        {
          v22 = -[MAAutoAssetSetShortTermLock initForAssetSetAtomicInstance:withLockedFilename:withLockedFileDescriptor:forFirstLockReason:]([MAAutoAssetSetShortTermLock alloc], "initForAssetSetAtomicInstance:withLockedFilename:withLockedFileDescriptor:forFirstLockReason:", v81, v25, v62, v80);
          if (!v22)
          {
            v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to allocate SHORT-TERM lock tracking | lockReason:%@ | atomicInstanceFilename:%@"), v80, v25);
            +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6582, CFSTR("auto-set(_shortTermLockForAtomicInstance)"), 0, v73);
            v74 = objc_claimAutoreleasedReturnValue();

            v36 = 0;
            v28 = (id)v74;
            goto LABEL_46;
          }
          objc_msgSend(v20, "setSafeObject:forKey:", v22, v81);
          -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setSafeObject:forKey:", v20, v63);

          v64 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
          -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setSafeObject:forKey:", v18, v65);

          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "oslog");
          v67 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "summary");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)v87 = v81;
            *(_WORD *)&v87[8] = 2114;
            *(_QWORD *)&v87[10] = v80;
            *(_WORD *)&v87[18] = 2114;
            *(_QWORD *)&v87[20] = v68;
            _os_log_impl(&dword_1AE33B000, v67, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance} (%{public}@) | lockReason:%{public}@ | holding shared lock | shortTermLock:%{public}@", buf, 0x20u);

          }
          goto LABEL_39;
        }
        v36 = 0;
LABEL_45:
        v22 = 0;
        goto LABEL_46;
      }
      v42 = -[MAAutoAssetSetShortTermLock initForAssetSetAtomicInstance:withLockedFilename:withLockedFileDescriptor:forFirstLockReason:]([MAAutoAssetSetShortTermLock alloc], "initForAssetSetAtomicInstance:withLockedFilename:withLockedFileDescriptor:forFirstLockReason:", v41, v25, v11, v80);
      v43 = v41;
      if (v42)
      {
        v22 = v42;
        objc_msgSend(v20, "setSafeObject:forKey:", v42, v41);
        -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSafeObject:forKey:", v20, v44);

        v45 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
        -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setSafeObject:forKey:", v18, v46);

        v28 = 0;
        v27 = 0;
LABEL_39:
        v36 = 1;
        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "oslog");
      v70 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)v87 = v43;
        *(_WORD *)&v87[8] = 2114;
        *(_QWORD *)&v87[10] = v80;
        *(_WORD *)&v87[18] = 2114;
        *(_QWORD *)&v87[20] = v25;
        _os_log_error_impl(&dword_1AE33B000, v70, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance} (%{public}@) | lockReason:%{public}@ | WARNING | unable to allocate MAAutoAssetSetShortTermLock (when already locked) | atomicInstanceFilename:%{public}@", buf, 0x20u);
      }

      goto LABEL_43;
    }
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No current SHORT-TERM lock (by atomicInstance) | assetSetAtomicInstance:%@ | lockReason:%@"), v14, v80);
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6110, CFSTR("auto-set(_shortTermLockForAtomicInstance)"), 0, v50);
    v28 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
    v25 = 0;
    v36 = 0;
LABEL_44:
    v27 = 0;
    goto LABEL_45;
  }
  v22 = (id)v21;
  if (v12)
  {
    -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:](MAAutoAssetSetStatus, "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:", v23, v24, v81);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = 0;
    v83 = 0;
    v26 = -[MAAutoAssetSet _shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:](self, "_shortTermOpenSharedLockFile:lockingAtomicInstance:forLockReason:verifyingLocalContentURLs:openingFilename:providingLockedSetStatus:sharedLockError:", CFSTR("auto-set(_shortTermLockForAtomicInstance)[atomic-instance]"), v81, v80, a9, v25, &v83, &v82);
    v27 = v83;
    v28 = v82;
    if (v26 < 0)
    {
LABEL_33:
      v36 = 0;
      goto LABEL_46;
    }
    objc_msgSend(v22, "lockCountByReason");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "safeObjectForKey:ofClass:", v80, objc_opt_class());
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (close(v26))
    {
      v75 = v26;
      v30 = *__error();
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "oslog");
      v32 = objc_claimAutoreleasedReturnValue();

      log = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v27, "latestDownloadedAtomicInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v87 = v75;
        *(_WORD *)&v87[4] = 2114;
        *(_QWORD *)&v87[6] = v33;
        *(_WORD *)&v87[14] = 2114;
        *(_QWORD *)&v87[16] = v80;
        *(_WORD *)&v87[24] = 2114;
        *(_QWORD *)&v87[26] = v25;
        v88 = 1024;
        v89 = v30;
        _os_log_error_impl(&dword_1AE33B000, v32, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | WARNING | failed close of validation lock file | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x2Cu);
LABEL_27:

        v53 = 0x1E0CB3000;
LABEL_29:

        objc_msgSend(v22, "lockCountByReason");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_alloc(*(Class *)(v53 + 2024));
        if (v77)
          v56 = (int)(objc_msgSend(v77, "intValue") + 1);
        else
          v56 = 1;
        v57 = (void *)objc_msgSend(v55, "initWithInteger:", v56);
        objc_msgSend(v54, "setSafeObject:forKey:", v57, v80);

        objc_msgSend(v22, "setTotalLockCount:", objc_msgSend(v22, "totalLockCount") + 1);
        objc_msgSend(v22, "assetSetAtomicInstance");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSafeObject:forKey:", v22, v58);

        -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSafeObject:forKey:", v20, v59);

        v60 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
        -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setSafeObject:forKey:", v18, v61);

        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "oslog");
      v52 = objc_claimAutoreleasedReturnValue();

      log = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "latestDownloadedAtomicInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v87 = v26;
        *(_WORD *)&v87[4] = 2114;
        *(_QWORD *)&v87[6] = v33;
        *(_WORD *)&v87[14] = 2114;
        *(_QWORD *)&v87[16] = v80;
        *(_WORD *)&v87[24] = 2114;
        *(_QWORD *)&v87[26] = v25;
        v32 = v52;
        _os_log_impl(&dword_1AE33B000, v52, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockForAtomicInstance}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | released validateFileDescriptor | atomicInstanceFilename:%{public}@ ", buf, 0x26u);
        goto LABEL_27;
      }
    }
    v53 = 0x1E0CB3000uLL;
    v32 = log;
    goto LABEL_29;
  }
  v25 = 0;
  v36 = 0;
  v28 = 0;
  v27 = 0;
LABEL_46:
  v48 = a8;

  v15 = v80;
LABEL_47:
  if (a7)
    *a7 = v36;
  if (v48)
    *v48 = objc_retainAutorelease(v27);
  if (a10)
    *a10 = objc_retainAutorelease(v28);
  -[MAAutoAssetSet _shortTermLogResult:forLockReason:forAtomicInstance:atomicInstanceFilename:forShortTermLock:withSetStatus:returningError:](self, "_shortTermLogResult:forLockReason:forAtomicInstance:atomicInstanceFilename:forShortTermLock:withSetStatus:returningError:", CFSTR("_shortTermLockForAtomicInstance"), v15, v81, v25, v22, 0, v28);
  v71 = v22;

  return v71;
}

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 error:(id *)a9
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return -[MAAutoAssetSet _shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:](self, "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, v10, a9);
}

- (int)_shortTermOpenSharedLockFile:(id)a3 lockingAtomicInstance:(id)a4 forLockReason:(id)a5 verifyingLocalContentURLs:(BOOL)a6 openingFilename:(id)a7 providingLockedSetStatus:(id *)a8 sharedLockError:(id *)a9
{
  _BOOL4 v11;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  id v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  id *v69;
  id *v70;
  _BOOL4 v71;
  int v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  uint64_t v89;
  void *v90;
  _BOOL4 v91;
  uint64_t v92;
  __CFString *v93;
  void *v94;
  void *v95;
  id *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  __CFString *v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  id v108;
  uint8_t buf[4];
  id v110;
  __int16 v111;
  _BYTE v112[40];
  uint64_t v113;
  _BYTE v114[128];
  uint64_t v115;

  v11 = a6;
  v115 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (__CFString *)a4;
  v17 = a5;
  v18 = a7;
  v19 = CFSTR("SYMLINK");
  v101 = v16;
  if (v16)
    v19 = v16;
  v20 = v19;
  v21 = objc_retainAutorelease(v18);
  v22 = open((const char *)objc_msgSend(v21, "UTF8String"), 20);
  v102 = v15;
  v103 = v17;
  v98 = v22;
  if (v22 < 0)
  {
    v29 = v11;
    v30 = *__error();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to obtain shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@ | errno:%d"), v20, v17, v21, v30);
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6582, v15, 0, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "oslog");
    v33 = objc_claimAutoreleasedReturnValue();

    v24 = v33;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v110 = v15;
      v111 = 2114;
      *(_QWORD *)v112 = v20;
      *(_WORD *)&v112[8] = 2114;
      *(_QWORD *)&v112[10] = v103;
      *(_WORD *)&v112[18] = 2114;
      *(_QWORD *)&v112[20] = v21;
      *(_WORD *)&v112[28] = 1024;
      *(_DWORD *)&v112[30] = v30;
      _os_log_error_impl(&dword_1AE33B000, v33, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile} (%{public}@) | lockReason:%{public}@ | unable to obtain shared lock | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x30u);
    }
    v27 = 0;
    v97 = 0;
    v11 = v29;
    v28 = a9;
    v23 = v98;
    goto LABEL_53;
  }
  v23 = v22;
  v108 = 0;
  -[MAAutoAssetSet _readLockedSetStatusFromSharedLockFile:error:](self, "_readLockedSetStatusFromSharedLockFile:error:", v21, &v108);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v108;
  if (v25)
  {
    v26 = v25;
    v97 = 0;
    v27 = 0;
    v28 = a9;
    goto LABEL_46;
  }
  if (!v24)
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to read contents of shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@"), v20, v103, v21);
    v67 = 6582;
LABEL_42:
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v67, v15, 0, v66);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
LABEL_43:
    v97 = 0;
    v28 = a9;
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "oslog");
  v35 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v110 = v15;
    v111 = 1024;
    *(_DWORD *)v112 = v23;
    *(_WORD *)&v112[4] = 2114;
    *(_QWORD *)&v112[6] = v20;
    *(_WORD *)&v112[14] = 2112;
    *(_QWORD *)&v112[16] = v103;
    *(_WORD *)&v112[24] = 2114;
    *(_QWORD *)&v112[26] = v21;
    _os_log_impl(&dword_1AE33B000, v35, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_OPEN][%d] (%{public}@) | lockReason:%@ | successfully opened SHORT-TERM | atomicInstanceFilename:%{public}@ | ", buf, 0x30u);
  }

  objc_msgSend(v24, "latestDownloadedAtomicInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No latestDownloadedAtomicInstance in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@"), v20, v103, v21);
    v67 = 6111;
    goto LABEL_42;
  }
  objc_msgSend(v24, "latestDowloadedAtomicInstanceEntries");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v37, "count");

  if (!v27)
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Empty latestDowloadedAtomicInstanceEntries in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@"), v20, v103, v21);
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6110, v15, 0, v66);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (!v11)
  {
    v27 = 0;
    v97 = 0;
    v26 = 0;
    v28 = a9;
    goto LABEL_54;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(v24, "latestDowloadedAtomicInstanceEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = a9;
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
  v27 = 0;
  if (!v92)
  {
    v97 = 0;
    v26 = 0;
    goto LABEL_71;
  }
  v96 = a8;
  v97 = 0;
  v26 = 0;
  v89 = *(_QWORD *)v105;
  v90 = v24;
  v93 = v20;
  v91 = v11;
  do
  {
    v38 = 0;
    do
    {
      v99 = v27;
      if (*(_QWORD *)v105 != v89)
        objc_enumerationMutation(obj);
      v39 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v38);
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localContentURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)v40;
      objc_msgSend(v42, "componentsSeparatedByCharactersInSet:", v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_msgSend(v43, "count");
      v45 = v44 - 1;
      if (v44 <= 1)
      {
        v80 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "summary");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (void *)objc_msgSend(v80, "initWithFormat:", CFSTR("AtomicEntry in locked set-status that has too few path components (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@"), v93, v103, v21, v81);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6108, v102, 0, v82);
        v83 = objc_claimAutoreleasedReturnValue();

        v20 = v93;
        v26 = (void *)v83;
        v11 = v91;
        a8 = v96;
        v24 = v90;
        v27 = v99;
        goto LABEL_71;
      }
      v46 = v44;
      objc_msgSend(v43, "objectAtIndex:", v45);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v47, CFSTR(".AssetData"));
      v94 = (void *)v47;
      if ((v48 & 1) == 0 && (objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v47, CFSTR("AssetData")) & 1) == 0)
      {
        v58 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "summary");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v58, "initWithFormat:", CFSTR("AtomicEntry in locked set-status that is neither standard nor secure asset (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@"), v93, v103, v21, v49);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6108, v102, 0, v50);
        v59 = objc_claimAutoreleasedReturnValue();

        v54 = 0;
        v26 = (void *)v59;
        goto LABEL_32;
      }
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v43);
      if (objc_msgSend(v49, "count") != v46)
      {
        v55 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "summary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("Unable to verify AtomicEntry in locked set-status (array count inconsistency) (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@"), v93, v103, v21, v50);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6108, v102, 0, v56);
        v57 = objc_claimAutoreleasedReturnValue();

LABEL_31:
        v54 = 0;
        v26 = (void *)v57;
        goto LABEL_32;
      }
      objc_msgSend(v49, "replaceObjectAtIndex:withObject:", v45, CFSTR("Info.plist"));
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("/"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v87, "fileExistsAtPath:", v50))
      {
        v60 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "summary");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)objc_msgSend(v60, "initWithFormat:", CFSTR("AtomicEntry in locked set-status has localContentURL where Info.plist is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | infoPlistPath:%@"), v93, v103, v21, v56, v50);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6108, v102, 0, v61);
        v57 = objc_claimAutoreleasedReturnValue();

        goto LABEL_31;
      }
      if (v48)
      {
        v51 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "localContentURL");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "path");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("%@/%@"), v52, CFSTR("System/Library/CoreServices/RestoreVersion.plist"));

        v86 = v53;
        if (objc_msgSend(v87, "fileExistsAtPath:", v53))
        {
          v27 = v99 + 1;

          v54 = 1;
          goto LABEL_33;
        }
        v62 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v39, "summary");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v62, "initWithFormat:", CFSTR("AtomicEntry in locked set-status for secure grafted/mounted auto-asset where required content is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | secureGraftedReqiredFilename:%@"), v93, v103, v21, v63, v86);
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6108, v102, 0, v64);
        v84 = objc_claimAutoreleasedReturnValue();

        v54 = 0;
        v26 = (void *)v84;
      }
      else
      {
        ++v97;
        v54 = 1;
      }
LABEL_32:
      v27 = v99;
LABEL_33:

      if (!v54)
      {
        v20 = v93;
        v11 = v91;
        v28 = a9;
        a8 = v96;
        v24 = v90;
        goto LABEL_71;
      }
      ++v38;
      v20 = v93;
      v11 = v91;
      v28 = a9;
      v24 = v90;
    }
    while (v92 != v38);
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
    a8 = v96;
    v92 = v65;
  }
  while (v65);
LABEL_71:

  v66 = v87;
LABEL_44:

  if (v26)
  {
    v23 = v98;
LABEL_46:
    v100 = v27;
    if (close(v23))
    {
      v68 = v21;
      v69 = a8;
      v70 = v28;
      v71 = v11;
      v72 = *__error();
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "oslog");
      v74 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544642;
        v110 = v102;
        v111 = 1024;
        *(_DWORD *)v112 = v98;
        *(_WORD *)&v112[4] = 2114;
        *(_QWORD *)&v112[6] = v20;
        *(_WORD *)&v112[14] = 2112;
        *(_QWORD *)&v112[16] = v103;
        *(_WORD *)&v112[24] = 2114;
        *(_QWORD *)&v112[26] = v68;
        *(_WORD *)&v112[34] = 1024;
        *(_DWORD *)&v112[36] = v72;
        _os_log_error_impl(&dword_1AE33B000, v74, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%@ | WARNING | failed close of shared lock file | atomicInstanceFilename:%{public}@ | errno:%d", buf, 0x36u);
      }
      v11 = v71;
      v28 = v70;
      a8 = v69;
      v21 = v68;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "oslog");
      v74 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544386;
        v110 = v102;
        v111 = 1024;
        *(_DWORD *)v112 = v23;
        *(_WORD *)&v112[4] = 2114;
        *(_QWORD *)&v112[6] = v20;
        *(_WORD *)&v112[14] = 2112;
        *(_QWORD *)&v112[16] = v103;
        *(_WORD *)&v112[24] = 2114;
        *(_QWORD *)&v112[26] = v21;
        _os_log_impl(&dword_1AE33B000, v74, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%@ | released sharedLockFileDescriptor | atomicInstanceFilename:%{public}@", buf, 0x30u);
      }
    }
    v27 = v100;

    v23 = -1;
LABEL_53:

    v24 = 0;
  }
  else
  {
    v23 = v98;
  }
LABEL_54:
  if (a8)
    *a8 = objc_retainAutorelease(v24);
  if (v28)
    *v28 = objc_retainAutorelease(v26);
  if (v11 && !v26 && v24)
  {
    v76 = v27;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "oslog");
    v78 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544642;
      v110 = v102;
      v111 = 2114;
      *(_QWORD *)v112 = v21;
      *(_WORD *)&v112[8] = 2112;
      *(_QWORD *)&v112[10] = v20;
      *(_WORD *)&v112[18] = 2114;
      *(_QWORD *)&v112[20] = v103;
      *(_WORD *)&v112[28] = 2048;
      *(_QWORD *)&v112[30] = v97;
      *(_WORD *)&v112[38] = 2048;
      v113 = v76;
      _os_log_impl(&dword_1AE33B000, v78, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile} | successfully locked SHORT-TERM (%{public}@) | lockReason:%@ | atomicInstanceFilename:%{public}@ | standardURLs:%ld | secureURLs:%ld", buf, 0x3Eu);
    }

  }
  return v23;
}

- (void)_shortTermLogResult:(id)a3 forLockReason:(id)a4 forAtomicInstance:(id)a5 atomicInstanceFilename:(id)a6 forShortTermLock:(id)a7 withSetStatus:(id)a8 returningError:(id)a9
{
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  __CFString *v24;
  const __CFString *v25;
  __CFString *v26;
  _BOOL4 v27;
  uint64_t v28;
  __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  __CFString *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v15 = (__CFString *)a4;
  v16 = (__CFString *)a5;
  v17 = (__CFString *)a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v27)
      {
        -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("N");
        if (v15)
          v30 = v15;
        else
          v30 = CFSTR("N");
        v49 = v30;
        v52 = (void *)v28;
        objc_msgSend(v18, "summary");
        v31 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v19, "summary");
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138544386;
        v56 = v54;
        v57 = 2114;
        v58 = v52;
        v59 = 2114;
        v60 = v49;
        v61 = 2114;
        v62 = v31;
        v63 = 2114;
        v64 = v29;
        _os_log_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | shortTermLock:%{public}@ | setStatus:%{public}@", buf, 0x34u);
        if (v19)

      }
      goto LABEL_22;
    }
    if (!v27)
      goto LABEL_53;
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("N");
    if (v15)
      v40 = v15;
    else
      v40 = CFSTR("N");
    if (v16)
      v41 = v16;
    else
      v41 = CFSTR("N");
    if (v17)
      v42 = v17;
    else
      v42 = CFSTR("N");
    if (v19)
    {
      v43 = v42;
      objc_msgSend(v19, "summary");
      v44 = objc_claimAutoreleasedReturnValue();
      v42 = v43;
      v35 = (__CFString *)v44;
    }
    *(_DWORD *)buf = 138544642;
    v56 = v54;
    v57 = 2114;
    v58 = v53;
    v59 = 2114;
    v60 = v40;
    v61 = 2114;
    v62 = v41;
    v63 = 2114;
    v64 = (__CFString *)v42;
    v65 = 2114;
    v66 = v35;
    _os_log_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | forAtomicInstance:%{public}@ | atomicInstanceFilename:%{public}@ | setStatus:%{public}@", buf, 0x3Eu);
    if (!v19)
    {
LABEL_52:

      goto LABEL_53;
    }
LABEL_51:

    goto LABEL_52;
  }
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (!v18)
  {
    if (!v23)
      goto LABEL_53;
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("N");
    if (v15)
      v36 = v15;
    else
      v36 = CFSTR("N");
    if (v16)
      v37 = v16;
    else
      v37 = CFSTR("N");
    v50 = v37;
    v53 = (void *)v34;
    if (v17)
      v38 = v17;
    else
      v38 = CFSTR("N");
    v46 = v38;
    if (v19)
    {
      objc_msgSend(v19, "summary");
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "checkedDescription", v46);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v56 = v54;
    v57 = 2114;
    v58 = v53;
    v59 = 2114;
    v60 = v36;
    v61 = 2114;
    v62 = v50;
    v63 = 2114;
    v64 = v47;
    v65 = 2114;
    v66 = v35;
    v67 = 2114;
    v68 = v39;
    _os_log_error_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ ERROR | lockReason:%{public}@ | forAtomicInstance:%{public}@ | atomicInstanceFilename:%{public}@ | setStatus:%{public}@ | error:%{public}@", buf, 0x48u);

    if (!v19)
      goto LABEL_52;
    goto LABEL_51;
  }
  if (v23)
  {
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("N");
    if (v15)
      v25 = v15;
    else
      v25 = CFSTR("N");
    objc_msgSend(v18, "summary", v25);
    v48 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v19, "summary");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "checkedDescription");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v56 = v54;
    v57 = 2114;
    v58 = v51;
    v59 = 2114;
    v60 = v45;
    v61 = 2114;
    v62 = v48;
    v63 = 2114;
    v64 = v24;
    v65 = 2114;
    v66 = v26;
    _os_log_error_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ ERROR | lockReason:%{public}@ | shortTermLock:%{public}@ | setStatus:%{public}@ | error:%{public}@", buf, 0x3Eu);

    if (v19)
  }
LABEL_22:

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "oslog");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "lockCountByReason");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v56 = v33;
    _os_log_impl(&dword_1AE33B000, v22, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] lockCountByReason:\n%{public}@", buf, 0xCu);

  }
LABEL_53:

}

- (id)_readLockedSetStatusFromSharedLockFile:(id)a3 error:(id *)a4
{
  id v5;
  __objc2_class **p_superclass;
  id v7;
  __objc2_class **v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  char v28;
  id v29;
  __objc2_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  MAAutoAssetSetShortTermLockInMemoryRecord *v36;
  void *v37;
  NSObject *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  char v48[128];
  char v49[1024];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_superclass = &OBJC_METACLASS___MAAutoAssetAuthorizationPolicy.superclass;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  if (_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce != -1)
    dispatch_once(&_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce, &__block_literal_global_418);
  v7 = objc_retainAutorelease(v5);
  v8 = &OBJC_METACLASS___MAAutoAssetAuthorizationPolicy.superclass;
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v7, "fileSystemRepresentation"), v49))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v49);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = (id)_readLockedSetStatusFromSharedLockFile_error__recordArray;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
        objc_msgSend(v15, "lockerFileRealPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if (v17)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v12)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      if ((objc_msgSend(v15, "isCurrentlyValid") & 1) != 0)
      {
        objc_msgSend(v15, "setStatus");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        goto LABEL_43;
      }
      v18 = v15;
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "oslog");
      v26 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v7;
        _os_log_impl(&dword_1AE33B000, v26, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: In memory record for lock file(%@) not valid. Discarding", buf, 0xCu);
      }

      v8 = &OBJC_METACLASS___MAAutoAssetAuthorizationPolicy.superclass;
      p_superclass = &OBJC_METACLASS___MAAutoAssetAuthorizationPolicy.superclass;
      if (v18)
        objc_msgSend((id)_readLockedSetStatusFromSharedLockFile_error__recordArray, "removeObject:", v18);
    }
    else
    {
LABEL_12:

      v18 = 0;
      v8 = (__objc2_class **)(&OBJC_METACLASS___MAAutoAssetAuthorizationPolicy + 8);
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___MAAutoAssetAuthorizationPolicy + 8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v7;
      _os_log_impl(&dword_1AE33B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Failed to determine realpath for %@. Skipping caching", buf, 0xCu);
    }

    v9 = 0;
    v18 = 0;
  }
  v27 = objc_alloc(MEMORY[0x1E0DA8970]);
  v28 = objc_opt_respondsToSelector();

  v29 = objc_alloc(MEMORY[0x1E0DA8970]);
  v30 = p_superclass[204];
  if ((v28 & 1) != 0)
    v31 = (void *)objc_msgSend(v29, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:", v30, v7, CFSTR("1.0"), 0);
  else
    v31 = (void *)objc_msgSend(v29, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v30, v7, CFSTR("1.0"));
  v20 = v31;
  if (!v31)
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to create persisted-state for shared lock file | sharedLockFilename:%@"), v7);
    goto LABEL_33;
  }
  if (!objc_msgSend(v31, "loadPersistedState"))
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to load persisted-state for shared lock file | sharedLockFilename:%@"), v7);
    goto LABEL_33;
  }
  objc_msgSend(v20, "secureCodedObjectForKey:ofClass:", CFSTR("sharedLockSetStatus"), objc_opt_class());
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to read set-status from persisted-state for shared lock file | sharedLockFilename:%@"), v7);
LABEL_33:
    v35 = (void *)v34;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6101, CFSTR("auto-set(_readLockedSetStatusFromSharedLockFile)"), 0, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    if (!a4)
      goto LABEL_35;
    goto LABEL_34;
  }
  v33 = (void *)v32;
  v21 = 0;
  if (a4)
LABEL_34:
    *a4 = objc_retainAutorelease(v21);
LABEL_35:
  if (v33 && v9)
  {
    if ((unint64_t)-[__objc2_class count](v8[200], "count") >= 0x1F)
      -[__objc2_class removeObjectAtIndex:](v8[200], "removeObjectAtIndex:", 0);
    v36 = -[MAAutoAssetSetShortTermLockInMemoryRecord initWithPathAndSetStatus:setStatus:]([MAAutoAssetSetShortTermLockInMemoryRecord alloc], "initWithPathAndSetStatus:setStatus:", v9, v33);
    -[__objc2_class addObject:](v8[200], "addObject:", v36);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "oslog");
    v38 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v45 = v7;
      v46 = 2112;
      v47 = v9;
      _os_log_impl(&dword_1AE33B000, v38, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Updating in memory record for lockerFile:'%@' realPath:'%@'", buf, 0x16u);
    }

  }
  v22 = v33;
  v19 = v22;
LABEL_43:

  return v19;
}

void __63__MAAutoAssetSet__readLockedSetStatusFromSharedLockFile_error___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)_readLockedSetStatusFromSharedLockFile_error__recordArray;
  _readLockedSetStatusFromSharedLockFile_error__recordArray = (uint64_t)v0;

}

- (void)_closeAndRemoveShortTermLock:(id)a3 forShortTermLock:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _WORD v33[17];

  *(_QWORD *)&v33[13] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  v8 = objc_msgSend(v7, "lockedFileDescriptor");
  if ((objc_msgSend(v7, "lockedFileDescriptor") & 0x80000000) == 0)
  {
    v9 = close(objc_msgSend(v7, "lockedFileDescriptor"));
    objc_msgSend(v7, "setLockedFileDescriptor:", 0xFFFFFFFFLL);
    if (v9)
    {
      v10 = *__error();
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "assetSetAtomicInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "summary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138544386;
        v27 = v6;
        v28 = 1024;
        v29 = v8;
        v30 = 2114;
        v31 = v13;
        v32 = 1024;
        *(_DWORD *)v33 = v10;
        v33[2] = 2114;
        *(_QWORD *)&v33[3] = v14;
        _os_log_error_impl(&dword_1AE33B000, v12, OS_LOG_TYPE_ERROR, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | errno:%d | shortTermLock:%{public}@", (uint8_t *)&v26, 0x2Cu);
LABEL_9:

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "assetSetAtomicInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "summary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138544130;
        v27 = v6;
        v28 = 1024;
        v29 = v8;
        v30 = 2114;
        v31 = v13;
        v32 = 2114;
        *(_QWORD *)v33 = v14;
        _os_log_impl(&dword_1AE33B000, v12, OS_LOG_TYPE_DEFAULT, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n[SHORT_FILE_CLOSE][%d] (%{public}@) | released shared lock | shortTermLock:%{public}@", (uint8_t *)&v26, 0x26u);
        goto LABEL_9;
      }
    }

    v18 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safeObjectForKey:ofClass:", v19, objc_opt_class());
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject safeObjectForKey:ofClass:](v16, "safeObjectForKey:ofClass:", v20, objc_opt_class());
      v21 = objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "setLockCountByReason:", v22);

        objc_msgSend(v7, "setTotalLockCount:", 0);
        objc_msgSend(v7, "assetSetAtomicInstance");
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectForKey:](v21, "removeObjectForKey:", v23);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "oslog");
        v23 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.3((uint64_t)v6, v7, v23);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oslog");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.2((uint64_t)v6, v7, v21);
    }

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.1((uint64_t)v6, v7, v16);
LABEL_19:

}

- (id)summary
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSet autoAssetSetClientName](self, "autoAssetSetClientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "count"));
    v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@"), v4, v5, v6, v10);

  }
  else
  {
    v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@"), v4, v5, v6, CFSTR("N"));
  }

  return v11;
}

+ (void)endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MAAutoAssetSet *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id *v25;
  void *v26;
  id v27;
  _QWORD block[4];
  id v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (v19)
  {
    v27 = v14;
    v20 = [MAAutoAssetSet alloc];
    +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v22 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](v20, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v15, v16, v17, 0, 0, v21, &v34);
    v23 = v34;

    if (v23)
    {
      +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v25 = &v31;
      v31 = v19;
      v29 = v17;
      v30 = v23;
      dispatch_async(v24, block);

    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
      v32[3] = &unk_1E5D5EC60;
      v25 = &v33;
      v33 = v19;
      objc_msgSend(v22, "_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:", v27, v15, v16, v17, v18, a8, v32);
    }

    v14 = v27;
  }
  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain](MAAutoAssetSet, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "oslog");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[MAAutoAssetSet endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:].cold.1();
  }

}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  MAAutoAssetSet *v30;
  id v31;
  int64_t v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (v20)
  {
    if (!v15 && a8 != -1)
    {
      v21 = CFSTR("endLockReason is nil but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL");
LABEL_13:
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:](self, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("endAtomicLocks"), v18, 6108, 0, v21, v20);
      goto LABEL_15;
    }
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("ALL_INSTANCES")))
    {
      if (a8 != -1)
      {
        v21 = CFSTR("MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL");
        goto LABEL_13;
      }
      if (v15)
      {
        v21 = CFSTR("MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockReason is not nil");
        goto LABEL_13;
      }
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
    v24[3] = &unk_1E5D5EC88;
    v25 = v16;
    v26 = v17;
    v27 = v18;
    v28 = v19;
    v32 = a8;
    v29 = v15;
    v30 = self;
    v31 = v20;
    -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v24);

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[MAAutoAssetSet _endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:].cold.1();

LABEL_15:
}

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetSetInfoInstance *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  MAAutoAssetSetInfoEnd *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 72), "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("endAtomicLocks"), *(_QWORD *)(a1 + 48), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 80));
  }
  else
  {
    v3 = [MAAutoAssetSetInfoInstance alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = __maAutoAssetSetSharedClientProcessName;
    v7 = __maAutoAssetSetSharedClientProcessID;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v3, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v4, v5, v6, v7, v8, v9, 0, 0, v10);

    v12 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 64), 0, -101, -101, 0);
    v13 = -[MAAutoAssetSetInfoEnd initWithLockReason:endingLockCount:]([MAAutoAssetSetInfoEnd alloc], "initWithLockReason:endingLockCount:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSafeObject:forKey:", v11, CFSTR("setInstance"));
    objc_msgSend(v14, "setSafeObject:forKey:", v12, CFSTR("setDesire"));
    objc_msgSend(v14, "setSafeObject:forKey:", v13, CFSTR("setEnd"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"), v16, 0, v14);
    v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
    v19[3] = &unk_1E5D5E180;
    v19[4] = *(_QWORD *)(a1 + 72);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 80);
    objc_msgSend(v18, "connectClientSendServerMessage:proxyObject:withReply:", v17, 0, v19);

  }
}

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = (void *)a1[4];
  v7 = a1[5];
  if (!v11 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = 0;
      v10 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = 6104;
      v10 = 0;
    }
    objc_msgSend(v6, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("endAtomicLocks"), v7, v9, v10, v8, a1[6]);
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("endAtomicLocks"), v7, a1[6]);
  }

}

+ (id)endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MAAutoAssetSet *v18;
  void *v19;
  id v20;
  id v21;
  id v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = [MAAutoAssetSet alloc];
  +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v20 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](v18, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v14, v15, v16, 0, 0, v19, &v23);
  v21 = v23;

  if (!v21)
  {
    objc_msgSend(v20, "_endAtomicLocksSync:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:", v13, v14, v15, v16, v17, a8);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)_endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  dispatch_semaphore_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  _QWORD block[7];
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[3];
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__8;
  v39 = __Block_byref_object_dispose__8;
  v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v18 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke;
  v26[3] = &unk_1E5D5EB78;
  v28 = v31;
  v29 = &v35;
  v30 = v33;
  v20 = v18;
  v27 = v20;
  -[MAAutoAssetSet _endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:](self, "_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:", v13, v14, v15, v16, v17, a8, v26);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v20, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v33;
    block[5] = v31;
    block[6] = &v35;
    dispatch_sync(v21, block);

  }
  v22 = (id)v36[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

void __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2(intptr_t result)
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

void __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(endAtomicLocks)"), 0, CFSTR("timeout (at framework layer) while waiting for end-atomic-locks to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:", a3, a4, a5, 0, a6);
}

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  MAAutoAssetSet *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id *v20;
  void *v21;
  _QWORD block[4];
  id v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v14)
  {
    v15 = [MAAutoAssetSet alloc];
    +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v17 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](v15, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v12, CFSTR("ALL_CLIENTS"), v13, 0, 0, v16, &v28);
    v18 = v28;

    if (v18)
    {
      +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2;
      block[3] = &unk_1E5D5E2E8;
      v20 = &v25;
      v25 = v14;
      v23 = v13;
      v24 = v18;
      dispatch_async(v19, block);

    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke;
      v26[3] = &unk_1E5D5EC60;
      v20 = &v27;
      v27 = v14;
      objc_msgSend(v17, "_eliminateAtomic:awaitingUnlocked:completion:", v11, v8, v26);
    }

  }
  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain](MAAutoAssetSet, "frameworkInstanceSetLogDomain");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[MAAutoAssetSet eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:].cold.1();
  }

}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAtomic:(id)a3 awaitingUnlocked:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v12[4] = self;
    v13 = v8;
    v15 = a4;
    v14 = v9;
    -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _eliminateAtomic:awaitingUnlocked:completion:].cold.1();

  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "assetSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("eliminateAtomic"), v5, 0, v3, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));

  }
  else
  {
    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "clientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "autoAssetSetClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __maAutoAssetSetSharedClientProcessName;
    v10 = __maAutoAssetSetSharedClientProcessID;
    objc_msgSend(*(id *)(a1 + 32), "assetSetIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    v14 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]([MAAutoAssetSetInfoDesire alloc], "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:", 0, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), -101, -101, 0);
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v15, "setSafeObject:forKey:", v14, CFSTR("setDesire"));
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET:ELIMINATE_ATOMIC"), v17, 0, v15);
    v19 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2;
    v20[3] = &unk_1E5D5CB18;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v19, "connectClientSendServerMessage:proxyObject:withReply:", v18, 0, v20);

  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "assetSetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      v8 = CFSTR("failure reported by server");
      v9 = v6;
      v10 = v7;
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v8 = CFSTR("no response message from server");
      v9 = v6;
      v10 = v7;
      v11 = 6104;
      v12 = 0;
    }
    objc_msgSend(v9, "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:", CFSTR("eliminateAtomic"), v10, v11, v12, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successOperation:forAssetSetIdentifier:completion:", CFSTR("eliminateAtomic"), v7, *(_QWORD *)(a1 + 40));
  }

}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5
{
  return (id)objc_msgSend(a1, "eliminateAtomicSync:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:", a3, a4, a5, 0);
}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  MAAutoAssetSet *v12;
  void *v13;
  id v14;
  id v15;
  id v17;

  v6 = a6;
  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = [MAAutoAssetSet alloc];
  +[MAAutoAssetSet defaultDispatchQueue](MAAutoAssetSet, "defaultDispatchQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:](v12, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:", v11, CFSTR("ALL_CLIENTS"), v10, 0, 0, v13, &v17);

  v15 = v17;
  if (!v15)
  {
    objc_msgSend(v14, "_eliminateAtomicSync:awaitingUnlocked:", v9, v6);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_eliminateAtomicSync:(id)a3 awaitingUnlocked:(BOOL)a4
{
  _BOOL8 v4;
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

  v4 = a4;
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
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
  v14[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke;
  v14[3] = &unk_1E5D5EB78;
  v16 = v19;
  v17 = &v23;
  v18 = v21;
  v9 = v7;
  v15 = v9;
  -[MAAutoAssetSet _eliminateAtomic:awaitingUnlocked:completion:](self, "_eliminateAtomic:awaitingUnlocked:completion:", v6, v4, v14);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:](MAAutoAssetSet, "waitOnSemaphore:withDaemonTriggeredTimeout:", v9, -100))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3;
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

void __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v9 = v4;
  v6 = v7[0];
  v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);

}

intptr_t __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2(intptr_t result)
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

void __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-set(eliminateAtomicSync)"), 0, CFSTR("timeout (at framework layer) while waiting for eliminate-atomic to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
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
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_1E5D5E248;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSetSharedDispatchOnce != -1)
    dispatch_once(&__maAutoAssetSetSharedDispatchOnce, v5);
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);

}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
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
  void *v30;
  uint8_t buf[16];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
  v14 = (void *)__maAutoAssetSetSharedClientProcessName;
  __maAutoAssetSetSharedClientProcessName = v13;

  __maAutoAssetSetSharedClientProcessID = getpid();
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:NEED_FOR_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:CHECK_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:LOCK_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:FORM_SUB_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCK"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:ASSET_SET_FOR_STAGING"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:CURRENT_SET_STATUS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET:ELIMINATE_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):CHECK_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):LOCK_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"));
  objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v12, CFSTR("MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"));
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE33B000, v16, OS_LOG_TYPE_DEFAULT, "MA-auto-set{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks", buf, 2u);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8908]), "initForServiceName:delegate:clientID:", CFSTR("com.apple.mobileasset.autoasset"), *(_QWORD *)(a1 + 32), v30);
  v18 = (void *)MEMORY[0x1E0C99E60];
  v32[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProxyObjectClasses:", v20);

  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8900]), "initWithClientPolicy:", v17);
  v22 = (void *)__maAutoAssetSetSharedConnectionClient;
  __maAutoAssetSetSharedConnectionClient = v21;

  if (__maAutoAssetSetSharedConnectionClient)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE33B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto-set{connectToServerFrameworkCompletion} connection client initialized for server connection", buf, 2u);
    }
  }
  else
  {
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6104, CFSTR("auto-set(connectToServerFrameworkCompletion)"), 0, CFSTR("unable to create shared SUCoreConnectClient for the client process"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1();
  }

}

- (id)_newProxyObjectForSetProgressBlock:(id)a3
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
  v15[3] = __Block_byref_object_copy__515;
  v15[4] = __Block_byref_object_dispose__516;
  objc_initWeak(&v16, self);
  v5 = objc_alloc(MEMORY[0x1E0DA8910]);
  +[MAAutoAssetSet frameworkInstanceUUID](MAAutoAssetSet, "frameworkInstanceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke;
  v12[3] = &unk_1E5D5ECB0;
  v14 = v15;
  v9 = v4;
  v13 = v9;
  v10 = (void *)objc_msgSend(v5, "initWithClientID:completionQueue:genericBlock:", v7, v8, v12);

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v3 = a2;
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
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
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1();
    goto LABEL_11;
  }
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2();
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
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "_lockAtomicStatusProgress:lockAtomicError:progressBlock:", v3, 0, *(_QWORD *)(a1 + 32));
LABEL_12:

}

- (void)_successCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 newerInstanceDiscovered:(id)a5 discoveredAtomicEntries:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke;
    block[3] = &unk_1E5D5ECD8;
    v21 = v12;
    v22 = v13;
    v25 = v16;
    v23 = v14;
    v24 = v15;
    dispatch_async(v17, block);

    v18 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:].cold.1();
  }

}

uint64_t __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successCheckAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_failedCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5ED00;
    v27 = v16;
    v32 = a5;
    v28 = v14;
    v29 = v15;
    v30 = v17;
    v31 = v18;
    dispatch_async(v19, block);

    v20 = v27;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v16)
    {
      objc_msgSend(v16, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | error:%@"), v17, v22);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a5, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | result:%@"), v17, v22);
    }
    v20 = (void *)v23;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v14;
      v35 = 2114;
      v36 = v20;
      v37 = 2112;
      v38 = v15;
      _os_log_error_impl(&dword_1AE33B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }

  }
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 72)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@) | assetSetIdentifier:%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 56)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_successCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetStatus:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke;
    v17[3] = &unk_1E5D5ED28;
    v18 = v10;
    v19 = v11;
    v21 = v13;
    v20 = v12;
    dispatch_async(v14, v17);

    v15 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:].cold.1();
  }

}

uint64_t __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successCurrentSetStatus:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)_failedCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5ED00;
    v27 = v16;
    v32 = a5;
    v28 = v14;
    v29 = v15;
    v30 = v17;
    v31 = v18;
    dispatch_async(v19, block);

    v20 = v27;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v16)
    {
      objc_msgSend(v16, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | error:%@"), v17, v22);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a5, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | result:%@"), v17, v22);
    }
    v20 = (void *)v23;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v14;
      v35 = 2114;
      v36 = v20;
      v37 = 2112;
      v38 = v15;
      _os_log_error_impl(&dword_1AE33B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }

  }
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 72)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@) | assetSetIdentifier:%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 56)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_lockAtomicStatusProgress:(id)a3 lockAtomicError:(id)a4 progressBlock:(id)a5
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
  +[MAAutoAssetSet frameworkDispatchQueue](MAAutoAssetSet, "frameworkDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke;
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
      _os_log_impl(&dword_1AE33B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_lockAtomicStatusProgress} | no client progress block | %{public}@", buf, 0xCu);

    }
  }

}

uint64_t __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)_successLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 lockedAtomicInstance:(id)a5 lockedAtomicEntries:(id)a6 sandboxExtension:(id)a7 sandboxExtensionPath:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if (v19)
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:](MAAutoAssetAuthorizationPolicy, "consumeSandboxExtension:forPath:", a7, a8);
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
    block[3] = &unk_1E5D5ECD8;
    v24 = v15;
    v25 = v16;
    v28 = v19;
    v26 = v17;
    v27 = v18;
    dispatch_async(v20, block);

    v21 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:].cold.1();
  }

}

uint64_t __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successLockAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)_failedLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5ED00;
    v27 = v16;
    v32 = a5;
    v28 = v14;
    v29 = v15;
    v30 = v17;
    v31 = v18;
    dispatch_async(v19, block);

    v20 = v27;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v16)
    {
      objc_msgSend(v16, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | error:%@"), v17, v22);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a5, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | result:%@"), v17, v22);
    }
    v20 = (void *)v23;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v14;
      v35 = 2114;
      v36 = v20;
      v37 = 2112;
      v38 = v15;
      _os_log_error_impl(&dword_1AE33B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }

  }
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 72)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@) | assetSetIdentifier:%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 56)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_successMapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 forMappedSelector:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke;
    v18[3] = &unk_1E5D5ED50;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    dispatch_async(v14, v18);

    v15 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v12)
      {
        objc_msgSend(v12, "summary");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = CFSTR("N");
      }
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v17;
      _os_log_error_impl(&dword_1AE33B000, v15, OS_LOG_TYPE_ERROR, "MA-auto-set{_successMapLockedAtomicEntry:%{public}@}| assetSetAtomicInstance:%{public}@ | mappedSelector:%{public}@ | no client completion block", buf, 0x20u);
      if (v12)

    }
  }

}

uint64_t __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "summary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successMapLockedAtomicEntry:%{public}@} | assetSetAtomicInstance:%{public}@ | mappedSelector:%{public}@ | SUCCESS", (uint8_t *)&v8, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_failedMapLockedAtomicEntry:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5ED00;
    v27 = v16;
    v32 = a5;
    v28 = v14;
    v29 = v15;
    v30 = v17;
    v31 = v18;
    dispatch_async(v19, block);

    v20 = v27;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v16)
    {
      objc_msgSend(v16, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | error:%@"), v17, v22);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a5, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | result:%@"), v17, v22);
    }
    v20 = (void *)v23;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v14;
      v35 = 2114;
      v36 = v20;
      v37 = 2112;
      v38 = v15;
      _os_log_error_impl(&dword_1AE33B000, v25, OS_LOG_TYPE_ERROR, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block", buf, 0x20u);
    }

  }
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 72)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@) | assetSetIdentifier:%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 56)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS", buf, 0x20u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_successFormSubAtomicInstance:(id)a3 formedSubAtomicInstance:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke;
    block[3] = &unk_1E5D5E310;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    dispatch_async(v11, block);

    v12 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _successFormSubAtomicInstance:formedSubAtomicInstance:completion:].cold.1();
  }

}

uint64_t __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successFormSubAtomicInstance:%{public}@} | subAtomicInstance:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_failedFormSubAtomicInstance:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5CC48;
    v24 = v13;
    v28 = a4;
    v25 = v12;
    v26 = v14;
    v27 = v15;
    dispatch_async(v16, block);

    v17 = v24;
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v13)
    {
      objc_msgSend(v13, "checkedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@ | error:%@"), v14, v19);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a4, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@ | result:%@"), v14, v19);
    }
    v17 = (void *)v20;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "oslog");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@)"), *(_QWORD *)(a1 + 40)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 48)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | SUCCESS", buf, 0x16u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successOperation:(id)a3 forAssetSetIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke;
    block[3] = &unk_1E5D5E310;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    dispatch_async(v11, block);

    v12 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _successOperation:forAssetSetIdentifier:completion:].cold.1();
  }

}

uint64_t __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS", (uint8_t *)&v7, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_failedOperation:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E5D5CC48;
    v27 = v16;
    v31 = a5;
    v28 = v14;
    v29 = v17;
    v30 = v18;
    dispatch_async(v19, block);

    v20 = v27;
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v16)
    {
      objc_msgSend(v16, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | error:%@"), v17, v22);
    }
    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a5, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@ | result:%@"), v17, v22);
    }
    v20 = (void *)v23;

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2
    || (v5 = *(_QWORD *)(a1 + 64)) != 0
    && (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("auto-set(%@)"), *(_QWORD *)(a1 + 40)), +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v5, v6, 0, *(_QWORD *)(a1 + 48)), v2 = (id)objc_claimAutoreleasedReturnValue(), v6, v2))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1AE33B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | SUCCESS", buf, 0x16u);
    }
    v2 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce != -1)
    dispatch_once(&frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce, &__block_literal_global_528);
}

void __47__MAAutoAssetSet_frameworkInstanceSetLogDomain__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%s"), CFSTR("com.apple.MAAutoSetClient"), getprogname());
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "useDomain:", v1);

}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_setDefaultQueueOnce != -1)
    dispatch_once(&defaultDispatchQueue_setDefaultQueueOnce, &__block_literal_global_531);
  return (id)defaultDispatchQueue_setDefaultQueue;
}

void __38__MAAutoAssetSet_defaultDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetset.client"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_setDefaultQueue;
  defaultDispatchQueue_setDefaultQueue = (uint64_t)v1;

}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_setFrameworkQueueOnce != -1)
    dispatch_once(&frameworkDispatchQueue_setFrameworkQueueOnce, &__block_literal_global_532);
  return (id)frameworkDispatchQueue_setFrameworkQueue;
}

void __40__MAAutoAssetSet_frameworkDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetset.framework"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)frameworkDispatchQueue_setFrameworkQueue;
  frameworkDispatchQueue_setFrameworkQueue = (uint64_t)v1;

}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_setFrameworkUUIDOnce != -1)
    dispatch_once(&frameworkInstanceUUID_setFrameworkUUIDOnce, &__block_literal_global_533);
  return (id)frameworkInstanceUUID_setFrameworkUUID;
}

void __39__MAAutoAssetSet_frameworkInstanceUUID__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v1 = (void *)frameworkInstanceUUID_setFrameworkUUID;
  frameworkInstanceUUID_setFrameworkUUID = (uint64_t)v0;

}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_clientDomainName, a3);
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (void)setAutoAssetSetClientName:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSetClientName, a3);
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetIdentifier, a3);
}

- (BOOL)shortTermLocker
{
  return self->_shortTermLocker;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (void)setAutoAssetEntries:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetEntries, a3);
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (void)setUpdateCategoryDesiredByClient:(id)a3
{
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, a3);
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_autoAssetSetClientName, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

- (void)alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("alterEntriesRepresentingAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{alterEntriesRepresentingAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)needForAtomic:withNeedPolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("needForAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{needForAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("checkAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{checkAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("lockAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{lockAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("mapLockedAtomicEntry"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{mapLockedAtomicEntry} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("formSubAtomicInstance"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{formSubAtomicInstance} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("continueAtomicLock"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{continueAtomicLock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)endAtomicLock:ofAtomicInstance:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("endAtomicLock"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{endAtomicLock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)assetSetForStaging:asEntriesWhenTargeting:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("assetSetForStaging"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{assetSetForStaging} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)currentSetStatus:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("currentSetStatus"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{currentSetStatus} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1, a2), "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAssetSetIdentifier when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@", v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1, a2), "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAtomicInstance when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@", v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1, a2), "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLockCount (ending last lock) | shortTermLock:%@", v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_15(a1, a2), "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLockCount (not last lock) | shortTermLock:%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(NSObject *)a3 forShortTermLock:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | invalid lockedFileDesciptor | shortTermLock:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(NSObject *)a3 forShortTermLock:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAssetSetIdentifier when ending SHORT-TERM lock | shortTermLock:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(NSObject *)a3 forShortTermLock:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAtomicInstance when ending SHORT-TERM lock | shortTermLock:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

+ (void)endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+endAtomicLocks"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{+endAtomicLocks} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_endAtomicLocks"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{_endAtomicLocks} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("+eliminateAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{+eliminateAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAtomic:awaitingUnlocked:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("_eliminateAtomic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set{_eliminateAtomic} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto-set{connectToServerFrameworkCompletion} unable to create shared SUCoreConnectClient for the client process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | no progress provided | no progress reported to client at this time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8_0(&dword_1AE33B000, v0, v1, "MA-auto-set{_newProxyObjectForSetProgressBlock} | no progress provided | unexpected type for setStatusWithProgress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_successCheckAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_successCurrentSetStatus:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_successLockAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_1();
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_11_0(a1, a2), "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successFormSubAtomicInstance:formedSubAtomicInstance:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_successFormSubAtomicInstance:%{public}@}| subAtomicInstance:%{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

- (void)_failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_18();
}

- (void)_successOperation:forAssetSetIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | no client completion block", v1);
  OUTLINED_FUNCTION_8();
}

- (void)_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set{_failedOperation:%{public}@} | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "checkedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16(&dword_1AE33B000, v3, v4, "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_18();
}

@end
