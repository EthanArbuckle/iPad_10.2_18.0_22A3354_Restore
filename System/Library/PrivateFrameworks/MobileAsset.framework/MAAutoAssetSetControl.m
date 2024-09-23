@implementation MAAutoAssetSetControl

- (MAAutoAssetSetControl)init
{
  MAAutoAssetSetControl *v2;
  NSString *controlClientDomainName;
  NSString *controlClientName;
  uint64_t v5;
  NSString *controlClientProcessName;
  uint64_t v7;
  OS_dispatch_queue *completionDispatchQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MAAutoAssetSetControl;
  v2 = -[MAAutoAssetSetControl init](&v10, sel_init);
  if (v2)
  {
    +[MAAutoAssetSetControl frameworkInstanceSetLogDomain](MAAutoAssetSetControl, "frameworkInstanceSetLogDomain");
    controlClientDomainName = v2->_controlClientDomainName;
    v2->_controlClientDomainName = (NSString *)CFSTR("com.apple.MobileAsset.AutoSetControl");

    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)CFSTR("auto-set-control-client");

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v5;

    v2->_controlClientProcessID = getpid();
    +[MAAutoAssetSetControl defaultDispatchQueue](MAAutoAssetSetControl, "defaultDispatchQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (id)knownAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl knownAssetSetSummary:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "knownAssetSetSummary:limitedToSetIdentifiers:error:", a3, 0, a4);
}

+ (id)knownAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_knownAssetSummary:limitedToSetIdentifiers:completion:", v6, v7, v16);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(knownAssetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for known-asset-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_knownAssetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetSetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _knownAssetSummary:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("knownAssetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToSetIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 32))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("knownAssetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setJobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("knownAssetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("knownAssetSummary"), 6110, 0, CFSTR("no known-asset-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)lockedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl lockedAssetSetSummary:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "lockedAssetSetSummary:limitedToSetIdentifiers:error:", a3, 0, a4);
}

+ (id)lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_lockedAssetSetSummary:limitedToSetIdentifiers:completion:", v6, v7, v16);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(lockedAssetSetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for locked-asset-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetSetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _lockedAssetSetSummary:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToSetIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 32))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setLockSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlLockSummary:withLockSummaryEntries:completion:", CFSTR("lockedAssetSetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSetSummary"), 6110, 0, CFSTR("no locked-asset-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)stagedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl stagedAssetSetSummary:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "stagedAssetSetSummary:limitedToSetIdentifiers:error:", a3, 0, a4);
}

+ (id)stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_stagedAssetSetSummary:limitedToSetIdentifiers:completion:", v6, v7, v16);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(stagedAssetSetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for staged-asset-set-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetSetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _stagedAssetSetSummary:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToSetIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 32))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setJobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("stagedAssetSetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSetSummary"), 6110, 0, CFSTR("no staged-asset-set-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)activeSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl activeSetJobSummary:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "activeSetJobSummary:limitedToSetIdentifiers:error:", a3, 0, a4);
}

+ (id)activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_activeSetJobSummary:limitedToSetIdentifiers:completion:", v6, v7, v16);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(activeSetJobSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for active-set-job-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetSetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _activeSetJobSummary:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeSetJobSummary"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToSetIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 32))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeSetJobSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setJobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("activeSetJobSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeSetJobSummary"), 6110, 0, CFSTR("no active-set-job-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)scheduledSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl scheduledSetJobSummary:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "scheduledSetJobSummary:limitedToSetIdentifiers:error:", a3, 0, a4);
}

+ (id)scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_scheduledSetJobSummary:limitedToSetIdentifiers:completion:", v6, v7, v16);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(scheduledSetJobSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for scheduled-job-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetSetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _scheduledSetJobSummary:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledSetJobSummary"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToSetIdentifiers:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 32))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledSetJobSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setJobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("scheduledSetJobSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledSetJobSummary"), 6110, 0, CFSTR("no scheduled-job-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)assetSetsOverview:(id *)a3
{
  return +[MAAutoAssetSetControl assetSetsOverview:limitedToSetIdentifiers:error:](MAAutoAssetSetControl, "assetSetsOverview:limitedToSetIdentifiers:error:", 0, 0, a3);
}

+ (id)assetSetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[7];
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
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

  v7 = a3;
  v8 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
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
  v17[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke;
  v17[3] = &unk_1E5D5CAC8;
  v19 = v23;
  v20 = &v33;
  v21 = &v27;
  v22 = v25;
  v12 = v10;
  v18 = v12;
  objc_msgSend(v9, "_autoAssetsOverview:limitedToSetIdentifiers:completion:", v7, v8, v17);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v12, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v25;
    block[5] = v23;
    block[6] = &v27;
    dispatch_sync(v13, block);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v28[5]);
  v14 = (id)v34[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v14;
}

void __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2;
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

intptr_t __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2(intptr_t result)
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

void __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(assetSetsOverview)"), 0, CFSTR("timeout (at framework layer) while waiting for asset-sets-overview to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_autoAssetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  MAAutoAssetSetControl *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke;
    v13[3] = &unk_1E5D5CB68;
    v14 = v8;
    v15 = v9;
    v16 = self;
    v17 = v10;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

    v11 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _autoAssetsOverview:limitedToSetIdentifiers:completion:].cold.1();
  }

}

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_failedControlOverview:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetsOverview"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:]([MAAutoAssetSetInfoControl alloc], "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 48), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 48), "controlClientProcessID");
    if (*(_QWORD *)(a1 + 40))
      v11 = CFSTR("LIMITED_INSTANCES");
    else
      v11 = CFSTR("ALL_INSTANCES");
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, v11, 0, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("setControl"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:ASSET_SETS_OVERVIEW"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 48), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 56);
    v18[4] = *(_QWORD *)(a1 + 48);
    v19 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v18);

  }
}

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlOverview:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetsOverview"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setOverview"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlOverview:withOverviewEntries:completion:", CFSTR("assetSetsOverview"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("assetSetsOverview"), 6110, 0, CFSTR("no asset-sets-overview provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)assetSetDescriptorInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[7];
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

  v5 = a3;
  +[MAAutoAssetSetControl autoAssetSetControl](MAAutoAssetSetControl, "autoAssetSetControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
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
  v14[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke;
  v14[3] = &unk_1E5D5CB90;
  v16 = v20;
  v17 = &v30;
  v18 = &v24;
  v19 = v22;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v6, "_autoAssetInstanceInfo:completion:", v5, v14);
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:](MAAutoAssetSetControl, "waitOnSemaphore:withTimeout:", v9, -2))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3;
    v13[3] = &unk_1E5D5CAF0;
    v13[4] = v22;
    v13[5] = v20;
    v13[6] = &v24;
    dispatch_sync(v10, v13);

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

void __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetSetControl frameworkDispatchQueue](MAAutoAssetSetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2;
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

intptr_t __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2(intptr_t result)
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

void __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(assetSetInstanceInfo)"), 0, CFSTR("timeout (at framework layer) while waiting for asset-set-instance-info to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_autoAssetInstanceInfo:(id)a3 completion:(id)a4
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
    v10[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSetControl _autoAssetInstanceInfo:completion:].cold.1();

  }
}

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  MAAutoAssetSetInfoInstance *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:", CFSTR("autoAssetInstanceInfo"), 0, a2, CFSTR("unable to connect to the auto-asset-set XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [MAAutoAssetSetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "controlClientDomainName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "controlClientProcessID");
    v11 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:](v6, "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:", v7, v8, v9, v10, CFSTR("ALL_INSTANCES"), v11, 0, 0, v12);

    objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("setInstance"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-SET-CONTROL:SET_INSTANCE_INFO"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 32), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:", CFSTR("autoAssetInstanceInfo"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("setInstanceInfo"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlInstanceInfo:withInstanceInfo:completion:", CFSTR("autoAssetInstanceInfo"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:", CFSTR("autoAssetInstanceInfo"), 6110, 0, CFSTR("no asset-sets atomic instance information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce != -1)
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce, &__block_literal_global);
  return (id)defaultDispatchQueue_defaultQueue;
}

void __45__MAAutoAssetSetControl_defaultDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetcontrol.client"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue;
  defaultDispatchQueue_defaultQueue = (uint64_t)v1;

}

+ (id)autoAssetSetControl
{
  if (autoAssetSetControl_dispatchOnceAutoAssetSetControl != -1)
    dispatch_once(&autoAssetSetControl_dispatchOnceAutoAssetSetControl, &__block_literal_global_293);
  return (id)autoAssetSetControl___autoAssetSetControl;
}

void __44__MAAutoAssetSetControl_autoAssetSetControl__block_invoke()
{
  MAAutoAssetSetControl *v0;
  void *v1;

  v0 = objc_alloc_init(MAAutoAssetSetControl);
  v1 = (void *)autoAssetSetControl___autoAssetSetControl;
  autoAssetSetControl___autoAssetSetControl = (uint64_t)v0;

}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void (**v25)(id, _QWORD);

  v25 = (void (**)(id, _QWORD))a3;
  -[MAAutoAssetSetControl connectionClient](self, "connectionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v25[2](v25, 0);
  }
  else
  {
    +[MAAutoAssetSetControl frameworkInstanceUUID](MAAutoAssetSetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v18 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v22, v21, v20, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):KNOWN_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):ASSET_SETS_OVERVIEW"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v15, CFSTR("MA-AUTO-SET-CONTROL(REPLY):SET_INSTANCE_INFO"));
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8908]), "initForServiceName:delegate:clientID:", CFSTR("com.apple.mobileasset.autoasset"), self, v24);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8900]), "initWithClientPolicy:", v16);
    -[MAAutoAssetSetControl setConnectionClient:](self, "setConnectionClient:", v17);

    v25[2](v25, 0);
  }

}

- (void)_successControl:(id)a3 completion:(id)a4
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAssetSetControl__successControl_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControl:completion:].cold.1();
  }

}

uint64_t __52__MAAutoAssetSetControl__successControl_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControl} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
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
      objc_msgSend(v13, "checkedSummary");
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
      -[MAAutoAssetSetControl _failedControl:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
    block[3] = &unk_1E5D5CC70;
    v15 = v8;
    v17 = v10;
    v16 = v9;
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
      -[MAAutoAssetSetControl _successControlSummary:withJobSummaryEntries:completion:].cold.1();
  }

}

uint64_t __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      objc_msgSend(v13, "checkedSummary");
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
      -[MAAutoAssetSetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
    block[3] = &unk_1E5D5CC70;
    v15 = v8;
    v17 = v10;
    v16 = v9;
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
      -[MAAutoAssetSetControl _successControlLockSummary:withLockSummaryEntries:completion:].cold.1();
  }

}

uint64_t __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlLockSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      objc_msgSend(v13, "checkedSummary");
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
      -[MAAutoAssetSetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successControlOverview:(id)a3 withOverviewEntries:(id)a4 completion:(id)a5
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke;
    block[3] = &unk_1E5D5CC70;
    v15 = v8;
    v17 = v10;
    v16 = v9;
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
      -[MAAutoAssetSetControl _successControlOverview:withOverviewEntries:completion:].cold.1();
  }

}

uint64_t __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlOverview} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_failedControlOverview:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke;
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
      objc_msgSend(v13, "checkedSummary");
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
      -[MAAutoAssetSetControl _failedControlOverview:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successControlInstanceInfo:(id)a3 withInstanceInfo:(id)a4 completion:(id)a5
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke;
    block[3] = &unk_1E5D5CC70;
    v15 = v8;
    v17 = v10;
    v16 = v9;
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
      -[MAAutoAssetSetControl _successControlInstanceInfo:withInstanceInfo:completion:].cold.1();
  }

}

uint64_t __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_failedControlInstanceInfo:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke;
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
      objc_msgSend(v13, "checkedSummary");
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
      -[MAAutoAssetSetControl _failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", v3, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce != -1)
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce, &__block_literal_global_329);
}

void __54__MAAutoAssetSetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%s"), CFSTR("com.apple.MAAutoSetControlClient"), getprogname());
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "useDomain:", v1);

}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce != -1)
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce, &__block_literal_global_333);
  return (id)frameworkDispatchQueue_frameworkQueue;
}

void __47__MAAutoAssetSetControl_frameworkDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetcontrol.framework"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)frameworkDispatchQueue_frameworkQueue;
  frameworkDispatchQueue_frameworkQueue = (uint64_t)v1;

}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce != -1)
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce, &__block_literal_global_334);
  return (id)frameworkInstanceUUID_frameworkUUID;
}

void __46__MAAutoAssetSetControl_frameworkInstanceUUID__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v1 = (void *)frameworkInstanceUUID_frameworkUUID;
  frameworkInstanceUUID_frameworkUUID = (uint64_t)v0;

}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)controlClientDomainName
{
  return self->_controlClientDomainName;
}

- (NSString)controlClientName
{
  return self->_controlClientName;
}

- (NSString)controlClientProcessName
{
  return self->_controlClientProcessName;
}

- (int64_t)controlClientProcessID
{
  return self->_controlClientProcessID;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (SUCoreConnectClient)connectionClient
{
  return self->_connectionClient;
}

- (void)setConnectionClient:(id)a3
{
  objc_storeStrong((id *)&self->_connectionClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_controlClientProcessName, 0);
  objc_storeStrong((id *)&self->_controlClientName, 0);
  objc_storeStrong((id *)&self->_controlClientDomainName, 0);
}

- (void)_knownAssetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("knownAssetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{knownAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_lockedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("lockedAssetSetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{lockedAssetSetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stagedAssetSetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{stagedAssetSetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_activeSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("activeSetJobSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{activeSetJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_scheduledSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("scheduledSetJobSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{scheduledSetJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_autoAssetsOverview:limitedToSetIdentifiers:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("assetSetsOverview"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{assetSetsOverview} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_autoAssetInstanceInfo:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("autoAssetInstanceInfo"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-set-control{autoAssetInstanceInfo} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_successControl:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-set-control{_successControl} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set-control{_failedControl} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set-control{_failedControl} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlSummary:withJobSummaryEntries:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-set-control{_successControlSummary} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set-control{_failedControlSummary} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlLockSummary:withLockSummaryEntries:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-set-control{_successControlLockSummary} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlOverview:withOverviewEntries:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-set-control{_successControlOverview} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlOverview:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set-control{_failedControlOverview} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set-control{_failedControlOverview} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlInstanceInfo:withInstanceInfo:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

@end
