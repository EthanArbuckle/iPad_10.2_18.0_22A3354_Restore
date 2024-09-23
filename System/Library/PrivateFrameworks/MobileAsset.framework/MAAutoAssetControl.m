@implementation MAAutoAssetControl

- (MAAutoAssetControl)init
{
  MAAutoAssetControl *v2;
  NSString *controlClientName;
  uint64_t v4;
  NSString *controlClientProcessName;
  uint64_t v6;
  OS_dispatch_queue *completionDispatchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetControl;
  v2 = -[MAAutoAssetControl init](&v9, sel_init);
  if (v2)
  {
    +[MAAutoAssetControl frameworkInstanceSetLogDomain](MAAutoAssetControl, "frameworkInstanceSetLogDomain");
    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)CFSTR("auto-control-client");

    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v4;

    v2->_controlClientProcessID = getpid();
    +[MAAutoAssetControl defaultDispatchQueue](MAAutoAssetControl, "defaultDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

+ (id)controlStatistics:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
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
  v14[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke;
  v14[3] = &unk_1E5D5E688;
  v16 = v20;
  v17 = &v30;
  v18 = &v24;
  v19 = v22;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v6, "_controlStatistics:completion:", v5, v14);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v9, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3;
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

void __46__MAAutoAssetControl_controlStatistics_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2;
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

intptr_t __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2(intptr_t result)
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

void __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(controlStatistics)"), 0, CFSTR("timeout (at framework layer) while waiting for control-statistics to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_controlStatistics:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke;
    v10[3] = &unk_1E5D5E6B0;
    v12 = a3;
    v10[4] = self;
    v11 = v6;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _controlStatistics:completion:].cold.1();

  }
}

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedControlStatistics:withErrorCode:withResponseError:description:completion:", CFSTR("controlStatistics"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:]([MAAutoAssetInfoControl alloc], "initClearingAfter:", *(unsigned __int8 *)(a1 + 48));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:CONTROL_STATISTICS"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 32), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlStatistics:withErrorCode:withResponseError:description:completion:", CFSTR("controlStatistics"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("controlStatistics"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlStatistics:withControlStatistics:completion:", CFSTR("controlStatistics"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlStatistics:withErrorCode:withResponseError:description:completion:", CFSTR("controlStatistics"), 6110, 0, CFSTR("no control-statistics provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)knownAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl knownAssetSummary:limitedToAssetTypes:error:](MAAutoAssetControl, "knownAssetSummary:limitedToAssetTypes:error:", a3, 0, a4);
}

+ (id)availableForStagingAssetSummary:(id *)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[7];
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

  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__6;
  v32 = __Block_byref_object_dispose__6;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
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
  v12[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke;
  v12[3] = &unk_1E5D5CAC8;
  v14 = v18;
  v15 = &v28;
  v16 = &v22;
  v17 = v20;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v4, "_availableForStagingAssetSummary:", v12);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v7, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3;
    v11[3] = &unk_1E5D5CAF0;
    v11[4] = v20;
    v11[5] = v18;
    v11[6] = &v22;
    dispatch_sync(v8, v11);

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

void __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2;
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

intptr_t __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2(intptr_t result)
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

void __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(availableForStagingAssetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for known-asset-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (id)knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
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
  v16[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_knownAssetSummary:limitedToAssetTypes:completion:", v6, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3;
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

void __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2;
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

intptr_t __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
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

void __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3(_QWORD *a1)
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

- (void)_availableForStagingAssetSummary:(id)a3
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
    v8[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke;
    v8[3] = &unk_1E5D5E130;
    v8[4] = self;
    v9 = v4;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _availableForStagingAssetSummary:].cold.1();

  }
}

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MAAutoAssetInfoInstance *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("availableForStagingAssetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v7, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v8, v9, v10, v6, v11);

    objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 32), "connectionClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("availableForStagingAssetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("jobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("availableForStagingAssetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("availableForStagingAssetSummary"), 6110, 0, CFSTR("no auto-stage-status provided by server"), *(_QWORD *)(a1 + 40));

  }
}

- (void)_knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _knownAssetSummary:limitedToAssetTypes:completion:].cold.1();
  }

}

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("knownAssetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]([MAAutoAssetInfoControl alloc], "initClearingAfter:limitedToAssetTypes:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("jobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("knownAssetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("knownAssetSummary"), 6110, 0, CFSTR("no known-asset-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)lockedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl lockedAssetSummary:limitedToAssetTypes:error:](MAAutoAssetControl, "lockedAssetSummary:limitedToAssetTypes:error:", a3, 0, a4);
}

+ (id)lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
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
  v16[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_lockedAssetSummary:limitedToAssetTypes:completion:", v6, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
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

void __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
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

intptr_t __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
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

void __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(lockedAssetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for locked-asset-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _lockedAssetSummary:limitedToAssetTypes:completion:].cold.1();
  }

}

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]([MAAutoAssetInfoControl alloc], "initClearingAfter:limitedToAssetTypes:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("lockSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlLockSummary:withLockSummaryEntries:completion:", CFSTR("lockedAssetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlLockSummary:withErrorCode:withResponseError:description:completion:", CFSTR("lockedAssetSummary"), 6110, 0, CFSTR("no locked-asset-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)stagedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl stagedAssetSummary:limitedToAssetTypes:error:](MAAutoAssetControl, "stagedAssetSummary:limitedToAssetTypes:error:", a3, 0, a4);
}

+ (id)stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
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
  v16[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_stagedAssetSummary:limitedToAssetTypes:completion:", v6, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
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

void __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
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

intptr_t __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
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

void __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(stagedAssetSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for staged-asset-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _stagedAssetSummary:limitedToAssetTypes:completion:].cold.1();
  }

}

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]([MAAutoAssetInfoControl alloc], "initClearingAfter:limitedToAssetTypes:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("jobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("stagedAssetSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("stagedAssetSummary"), 6110, 0, CFSTR("no staged-asset-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)activeJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl activeJobSummary:limitedToAssetTypes:error:](MAAutoAssetControl, "activeJobSummary:limitedToAssetTypes:error:", a3, 0, a4);
}

+ (id)activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
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
  v16[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_activeJobSummary:limitedToAssetTypes:completion:", v6, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3;
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

void __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2;
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

intptr_t __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
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

void __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(activeJobSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for active-job-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _activeJobSummary:limitedToAssetTypes:completion:].cold.1();
  }

}

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeJobSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]([MAAutoAssetInfoControl alloc], "initClearingAfter:limitedToAssetTypes:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeJobSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("jobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("activeJobSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("activeJobSummary"), 6110, 0, CFSTR("no active-job-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)scheduledJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl scheduledJobSummary:limitedToAssetTypes:error:](MAAutoAssetControl, "scheduledJobSummary:limitedToAssetTypes:error:", a3, 0, a4);
}

+ (id)scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
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
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
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
  v16[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_1E5D5CAC8;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_scheduledJobSummary:limitedToAssetTypes:completion:", v6, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3;
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

void __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2;
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

intptr_t __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2(intptr_t result)
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

void __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(scheduledJobSummary)"), 0, CFSTR("timeout (at framework layer) while waiting for scheduled-job-summary to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a3;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _scheduledJobSummary:limitedToAssetTypes:completion:].cold.1();
  }

}

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledJobSummary"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]([MAAutoAssetInfoControl alloc], "initClearingAfter:limitedToAssetTypes:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(*(id *)(a1 + 32), "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledJobSummary"), v10, v11, v9, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v12, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("jobSummary"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v8, "_successControlSummary:withJobSummaryEntries:completion:", CFSTR("scheduledJobSummary"), v7, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v8, "_failedControlSummary:withErrorCode:withResponseError:description:completion:", CFSTR("scheduledJobSummary"), 6110, 0, CFSTR("no scheduled-job-summary provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)forceGlobalUnlock:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
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
  v12[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke;
  v12[3] = &unk_1E5D5E5E0;
  v14 = v17;
  v15 = &v21;
  v16 = v19;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v4, "_forceGlobalUnlock:completion:", v3, v12);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v7, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3;
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

void __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke(uint64_t a1, void *a2)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2(intptr_t result)
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

void __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(forceGlobalUnlock)"), 0, CFSTR("timeout (at framework layer) while waiting for force-global-unlock to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_forceGlobalUnlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  MAAutoAssetControl *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v11 = v6;
    v12 = self;
    v13 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _forceGlobalUnlock:completion:].cold.1();
  }

}

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MAAutoAssetInfoInstance *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalUnlock"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v7, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v8, v9, v10, v6, v11);

    objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 48);
    v16[4] = *(_QWORD *)(a1 + 40);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalUnlock"), v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successControl:completion:", CFSTR("forceGlobalUnlock"), *(_QWORD *)(a1 + 40));
  }

}

+ (id)forceGlobalForget:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
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
  v12[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke;
  v12[3] = &unk_1E5D5E5E0;
  v14 = v17;
  v15 = &v21;
  v16 = v19;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v4, "_forceGlobalForget:completion:", v3, v12);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v7, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3;
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

void __40__MAAutoAssetControl_forceGlobalForget___block_invoke(uint64_t a1, void *a2)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2(intptr_t result)
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

void __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(forceGlobalForget)"), 0, CFSTR("timeout (at framework layer) while waiting for force-global-forget to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_forceGlobalForget:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  MAAutoAssetControl *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v11 = v6;
    v12 = self;
    v13 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _forceGlobalForget:completion:].cold.1();
  }

}

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  MAAutoAssetInfoInstance *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalForget"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v7, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v8, v9, v10, v6, v11);

    objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET"), v5, 0, v3);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v15 = *(void **)(a1 + 48);
    v16[4] = *(_QWORD *)(a1 + 40);
    v17 = v15;
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v16);

  }
}

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalForget"), v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successControl:completion:", CFSTR("forceGlobalForget"), *(_QWORD *)(a1 + 40));
  }

}

+ (id)forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
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
  v5 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
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
  v14[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke;
  v14[3] = &unk_1E5D5E5E0;
  v16 = v19;
  v17 = &v23;
  v18 = v21;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v6, "_forceGlobalPurge:forcingUnlock:completion:", v5, v4, v14);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v9, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3;
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

void __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke(uint64_t a1, void *a2)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2(intptr_t result)
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

void __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(forceGlobalPurge)"), 0, CFSTR("timeout (at framework layer) while waiting for force-global-purge to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  MAAutoAssetControl *v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke;
    v12[3] = &unk_1E5D5CB40;
    v16 = a4;
    v13 = v8;
    v14 = self;
    v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _forceGlobalPurge:forcingUnlock:completion:].cold.1();
  }

}

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalPurge"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initForcingUnlock:]([MAAutoAssetInfoControl alloc], "initForcingUnlock:", *(unsigned __int8 *)(a1 + 56));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalPurge"), v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successControl:completion:", CFSTR("forceGlobalPurge"), *(_QWORD *)(a1 + 40));
  }

}

+ (id)forceGlobalAbandon:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
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
  v12[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke;
  v12[3] = &unk_1E5D5E5E0;
  v14 = v17;
  v15 = &v21;
  v16 = v19;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v4, "_forceGlobalAbandon:completion:", v3, v12);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v7, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3;
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

void __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke(uint64_t a1, void *a2)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2(intptr_t result)
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

void __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(forceGlobalAbandon)"), 0, CFSTR("timeout (at framework layer) while waiting for force-global-abandon to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_forceGlobalAbandon:(id)a3 completion:(id)a4
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
    v10[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke;
    v10[3] = &unk_1E5D5CBB8;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _forceGlobalAbandon:completion:].cold.1();

  }
}

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalAbandon"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "controlClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientProcessName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "controlClientProcessID");
    v7 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSafeObject:forKey:", v9, CFSTR("instance"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON"), v12, 0, v10);
    objc_msgSend(*(id *)(a1 + 32), "connectionClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2;
    v15[3] = &unk_1E5D5CB18;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v14, "connectClientSendServerMessage:proxyObject:withReply:", v13, 0, v15);

  }
}

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("forceGlobalAbandon"), v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successControl:completion:", CFSTR("forceGlobalAbandon"), *(_QWORD *)(a1 + 40));
  }

}

+ (int64_t)simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  dispatch_semaphore_t v9;
  id *v10;
  NSObject *v11;
  NSObject *v12;
  int64_t v13;
  _QWORD v15[7];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  id obj;
  _QWORD v23[3];
  char v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6;
  v31 = __Block_byref_object_dispose__6;
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
  v10 = v28;
  obj = v28[5];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke;
  v16[3] = &unk_1E5D5E700;
  v18 = v23;
  v19 = &v33;
  v20 = &v27;
  v21 = v25;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:", v7, v6, &obj, v16);
  objc_storeStrong(v10 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3;
    v15[3] = &unk_1E5D5CAF0;
    v15[4] = v25;
    v15[5] = v23;
    v15[6] = &v27;
    dispatch_sync(v12, v15);

  }
  if (a5)
    *a5 = objc_retainAutorelease(v28[5]);
  v13 = v34[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v13;
}

void __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8[2];
  _QWORD block[4];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v8 = *(_OWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2;
  block[3] = &unk_1E5D5E6D8;
  v10 = v5;
  v13 = *(_QWORD *)(a1 + 64);
  v14 = a2;
  v7 = v8[0];
  v11 = *(_OWORD *)v8;
  v8[0] = v5;
  dispatch_sync(v6, block);

}

intptr_t __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = *(_QWORD *)(result + 80);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(simulateCacheDeleteDetermineReclaimableSpace)"), 0, CFSTR("timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  MAAutoAssetControl *v15;
  id v16;
  int v17;

  v9 = a3;
  v10 = a6;
  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke;
    v13[3] = &unk_1E5D5E728;
    v17 = a4;
    v14 = v9;
    v15 = self;
    v16 = v10;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

    v11 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:].cold.1();
  }

}

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoControl *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteDetermineReclaimableSpace"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:]([MAAutoAssetInfoControl alloc], "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), 0);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
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
    objc_msgSend(*(id *)(a1 + 32), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteDetermineReclaimableSpace"), v9, v10, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v11, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("control"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:", CFSTR("simulateCacheDeleteDetermineReclaimableSpace"), objc_msgSend(v7, "targetingPurgeAmount"), *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(*(id *)(a1 + 32), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteDetermineReclaimableSpace"), 6111, 0, CFSTR("no control results information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (int64_t)simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  id *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  _QWORD block[7];
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD *v24;
  id obj;
  _QWORD v26[3];
  char v27;
  _QWORD v28[3];
  char v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = (id *)&v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
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
  v11 = v31;
  obj = v31[5];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke;
  v19[3] = &unk_1E5D5E700;
  v21 = v26;
  v22 = &v36;
  v23 = &v30;
  v24 = v28;
  v12 = v8;
  v13 = v10;
  v20 = v13;
  objc_msgSend(v9, "_simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:", v8, v7, a5, &obj, v19);
  objc_storeStrong(v11 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v13, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v28;
    block[5] = v26;
    block[6] = &v30;
    dispatch_sync(v14, block);

  }
  if (a6)
    *a6 = objc_retainAutorelease(v31[5]);
  v15 = v37[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v15;
}

void __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8[2];
  _QWORD block[4];
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v8 = *(_OWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2;
  block[3] = &unk_1E5D5E6D8;
  v10 = v5;
  v13 = *(_QWORD *)(a1 + 64);
  v14 = a2;
  v7 = v8[0];
  v11 = *(_OWORD *)v8;
  v8[0] = v5;
  dispatch_sync(v6, block);

}

intptr_t __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = *(_QWORD *)(result + 80);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }
  return result;
}

void __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(simulateCacheDeleteReclaimSpace)"), 0, CFSTR("timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6 completion:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  MAAutoAssetControl *v17;
  id v18;
  int64_t v19;
  int v20;

  v11 = a3;
  v12 = a7;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke;
    v15[3] = &unk_1E5D5E750;
    v20 = a4;
    v19 = a5;
    v16 = v11;
    v17 = self;
    v18 = v12;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);

    v13 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:].cold.1();
  }

}

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoControl *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MAAutoAssetInfoInstance *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteReclaimSpace"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = -[MAAutoAssetInfoControl initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:]([MAAutoAssetInfoControl alloc], "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:](MAAutoAssetControl, "assetSelectorOrAllSelector:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 40), "controlClientName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "controlClientProcessName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 40), "controlClientProcessID");
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v8, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v9, v10, v11, v7, v12);

    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("instance"));
    objc_msgSend(v4, "setSafeObject:forKey:", v3, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE"), v6, 0, v4);
    objc_msgSend(*(id *)(a1 + 40), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2;
    v17[3] = &unk_1E5D5CB18;
    v16 = *(void **)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = v16;
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v17);

  }
}

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
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
    objc_msgSend(*(id *)(a1 + 32), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteReclaimSpace"), v9, v10, v8, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v11, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeObjectForKey:ofClass:", CFSTR("control"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:", CFSTR("simulateCacheDeleteReclaimSpace"), objc_msgSend(v7, "targetingPurgeAmount"), *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(*(id *)(a1 + 32), "_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:", CFSTR("simulateCacheDeleteReclaimSpace"), 6111, 0, CFSTR("no control results information provided by server"), *(_QWORD *)(a1 + 40));

  }
}

+ (id)simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5
{
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

  v7 = a5;
  +[MAAutoAssetControl autoAssetControl](MAAutoAssetControl, "autoAssetControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke;
  v16[3] = &unk_1E5D5E5E0;
  v18 = v21;
  v19 = &v25;
  v20 = v23;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v8, "_simulateSetJobOperation:withEndEvent:forSelector:completion:", a3, a4, v7, v16);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:](MAAutoAssetControl, "waitOnSemaphore:withTimeout:", v11, -2))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3;
    block[3] = &unk_1E5D5CAF0;
    block[4] = v23;
    block[5] = v21;
    block[6] = &v25;
    dispatch_sync(v12, block);

  }
  v13 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke(uint64_t a1, void *a2)
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
  +[MAAutoAssetControl frameworkDispatchQueue](MAAutoAssetControl, "frameworkDispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  *(_OWORD *)v6 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2;
  block[3] = &unk_1E5D5E388;
  v8 = v3;
  v5 = v6[0];
  v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);

}

intptr_t __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2(intptr_t result)
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

void __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6105, CFSTR("auto-control(simulateSetJobOperation)"), 0, CFSTR("timeout (at framework layer) while waiting for simulate-job-operation to complete"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)_simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  int64_t v18;

  v10 = a5;
  v11 = a6;
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke;
    v14[3] = &unk_1E5D5E778;
    v14[4] = self;
    v15 = v10;
    v17 = a3;
    v18 = a4;
    v16 = v11;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _simulateSetJobOperation:withEndEvent:forSelector:completion:].cold.1();

  }
}

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MAAutoAssetInfoInstance *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("simulateSetJobOperation"), 0, a2, CFSTR("unable to connect to the auto-asset XPC service"), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = [MAAutoAssetInfoInstance alloc];
    objc_msgSend(*(id *)(a1 + 32), "controlClientName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controlClientProcessName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "controlClientProcessID");
    v7 = *(_QWORD *)(a1 + 40);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:](v3, "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:", v4, v5, v6, v7, v8);

    v10 = -[MAAutoAssetInfoControl initForSimulateOperation:withSimulateEnd:]([MAAutoAssetInfoControl alloc], "initForSimulateOperation:withSimulateEnd:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("instance"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("control"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8918]), "initWithType:messageName:clientID:version:message:", 1, CFSTR("MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION"), v13, 0, v11);
    objc_msgSend(*(id *)(a1 + 32), "connectionClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2;
    v16[3] = &unk_1E5D5CB18;
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v15, "connectClientSendServerMessage:proxyObject:withReply:", v14, 0, v16);

  }
}

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "_failedControl:withErrorCode:withResponseError:description:completion:", CFSTR("simulateSetJobOperation"), v8, v9, v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v6, "_successControl:completion:", CFSTR("simulateSetJobOperation"), *(_QWORD *)(a1 + 40));
  }

}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_2 != -1)
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_2, &__block_literal_global_10);
  return (id)defaultDispatchQueue_defaultQueue_2;
}

void __42__MAAutoAssetControl_defaultDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetcontrol.client"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_2;
  defaultDispatchQueue_defaultQueue_2 = (uint64_t)v1;

}

+ (id)autoAssetControl
{
  if (autoAssetControl_dispatchOnceAutoAssetControl != -1)
    dispatch_once(&autoAssetControl_dispatchOnceAutoAssetControl, &__block_literal_global_338);
  return (id)autoAssetControl___autoAssetControl;
}

void __38__MAAutoAssetControl_autoAssetControl__block_invoke()
{
  MAAutoAssetControl *v0;
  void *v1;

  v0 = objc_alloc_init(MAAutoAssetControl);
  v1 = (void *)autoAssetControl___autoAssetControl;
  autoAssetControl___autoAssetControl = (uint64_t)v0;

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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  MAAutoAssetControl *v37;
  void *v38;
  void (**v39)(id, _QWORD);

  v39 = (void (**)(id, _QWORD))a3;
  -[MAAutoAssetControl connectionClient](self, "connectionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v39[2](v39, 0);
  }
  else
  {
    +[MAAutoAssetControl frameworkInstanceUUID](MAAutoAssetControl, "frameworkInstanceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v34 = objc_opt_class();
    v33 = objc_opt_class();
    v32 = objc_opt_class();
    v31 = objc_opt_class();
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v26 = objc_opt_class();
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v23 = objc_opt_class();
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v20 = objc_opt_class();
    v19 = objc_opt_class();
    v37 = self;
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      objc_opt_class(),
      0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:CONTROL_STATISTICS"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:NEED_FOR_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:CHECK_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:LOCK_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:FORM_SUB_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:ASSET_SET_FOR_STAGING"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:CURRENT_SET_STATUS"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET:ELIMINATE_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):CONTROL_STATISTICS"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):KNOWN_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):AVAILABLE_FOR_STAGING_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):LOCKED_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):STAGED_ASSET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):ACTIVE_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):SCHEDULED_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_UNLOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_FORGET"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_PURGE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_ABANDON"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_RECLAIM_SPACE"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-CONTROL(REPLY):SIM_SET_JOB_OPERATION"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):CHECK_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):LOCK_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"));
    objc_msgSend(MEMORY[0x1E0DA8908], "setAllowlistedClasses:forKey:", v16, CFSTR("MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8908]), "initForServiceName:delegate:clientID:", CFSTR("com.apple.mobileasset.autoasset"), v37, v38);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8900]), "initWithClientPolicy:", v17);
    -[MAAutoAssetControl setConnectionClient:](v37, "setConnectionClient:", v18);

    v39[2](v39, 0);
  }

}

+ (id)assetSelectorOrAllSelector:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = v3;
  if (!v3)
    v4 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]([MAAutoAssetSelector alloc], "initForAssetType:withAssetSpecifier:", CFSTR("MAAutoAssetControl-all-asset-types"), CFSTR("MAAutoAssetControl-all-asset-specifiers"));

  return v4;
}

- (void)_successControlStatistics:(id)a3 withControlStatistics:(id)a4 completion:(id)a5
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke;
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
      -[MAAutoAssetControl _successControlStatistics:withControlStatistics:completion:].cold.1();
  }

}

uint64_t __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlStatistics} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_failedControlStatistics:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetControl _failedControlStatistics:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__MAAutoAssetControl__successControl_completion___block_invoke;
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
      -[MAAutoAssetControl _successControl:completion:].cold.1();
  }

}

uint64_t __49__MAAutoAssetControl__successControl_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControl} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetControl _failedControl:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetControl _successControlSummary:withJobSummaryEntries:completion:].cold.1();
  }

}

uint64_t __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetControl _successControlLockSummary:withLockSummaryEntries:completion:].cold.1();
  }

}

uint64_t __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successControlLockSummary} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_successSimulateCacheDeleteOperation:(id)a3 withReclaimableSpace:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[4];
  NSObject *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke;
    block[3] = &unk_1E5D5E7C0;
    v14 = v8;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, block);

    v11 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetControl _successSimulateCacheDeleteOperation:withReclaimableSpace:completion:].cold.1();
  }

}

uint64_t __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1AE33B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_failedSimulateCacheDeleteOperation:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
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
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetControl _failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:].cold.1();

  }
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke(uint64_t a1)
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
    __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (id)pushNotificationHistory:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetPushNotificationHistory sharedInstance](MAAutoAssetPushNotificationHistory, "sharedInstance", a3, a4);
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1 != -1)
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1, &__block_literal_global_472);
}

void __51__MAAutoAssetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%s"), CFSTR("com.apple.MAAutoControlClient"), getprogname());
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "useDomain:", v1);

}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_1 != -1)
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_1, &__block_literal_global_476);
  return (id)frameworkDispatchQueue_frameworkQueue_1;
}

void __44__MAAutoAssetControl_frameworkDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.autoassetcontrol.framework"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)frameworkDispatchQueue_frameworkQueue_1;
  frameworkDispatchQueue_frameworkQueue_1 = (uint64_t)v1;

}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_1 != -1)
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_1, &__block_literal_global_477);
  return (id)frameworkInstanceUUID_frameworkUUID_1;
}

void __43__MAAutoAssetControl_frameworkInstanceUUID__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v1 = (void *)frameworkInstanceUUID_frameworkUUID_1;
  frameworkInstanceUUID_frameworkUUID_1 = (uint64_t)v0;

}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
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
}

- (void)_controlStatistics:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("controlStatistics"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{controlStatistics} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_availableForStagingAssetSummary:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("availableForStagingAssetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{availableForStagingAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_knownAssetSummary:limitedToAssetTypes:completion:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{knownAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_lockedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("lockedAssetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{lockedAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("stagedAssetSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{stagedAssetSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_activeJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("activeJobSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{activeJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_scheduledJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("scheduledJobSummary"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{scheduledJobSummary} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalUnlock:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("forceGlobalUnlock"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{forceGlobalUnlock} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalForget:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("forceGlobalForget"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{forceGlobalForget} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalPurge:forcingUnlock:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("forceGlobalPurge"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{forceGlobalPurge} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalAbandon:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("forceGlobalAbandon"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{forceGlobalAbandon} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("simulateCacheDeleteDetermineReclaimableSpace"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{simulateCacheDeleteDetermineReclaimableSpace} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("simulateCacheDeleteDetermineReclaimableSpace"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{simulateCacheDeleteReclaimSpace} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateSetJobOperation:withEndEvent:forSelector:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", 6102, CFSTR("simulateSetJobOperation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_1AE33B000, v1, v2, "MA-auto-control{simulateSetJobOperation} | no client completion block | %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_successControlStatistics:withControlStatistics:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-control{_successControlStatistics} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlStatistics:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-control{_failedControlStatistics} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-control{_failedControlStatistics} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControl:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-control{_successControl} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-control{_failedControl} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-control{_failedControl} | %{public}@ | error:%{public}@", v6);

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
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-control{_successControlSummary} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-control{_failedControlSummary} | %{public}@ | error:%{public}@", v6);

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
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-control{_successControlLockSummary} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-control{_failedControlLockSummary} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1AE33B000, v0, v1, "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | no client completion block", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, v0, (uint64_t)v0, "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | no client completion block | %{public}@", v1);
  OUTLINED_FUNCTION_8();
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, a2), "checkedSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AE33B000, a3, v5, "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

@end
