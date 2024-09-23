@implementation HDAuthorizationManager

- (HDAuthorizationManager)initWithProfile:(id)a3
{
  id v5;
  HDAuthorizationManager *v6;
  HDAuthorizationManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  OS_dispatch_queue *completionQueue;
  uint64_t v12;
  OS_dispatch_queue *observationQueue;
  NSMutableDictionary *v14;
  NSMutableDictionary *requestGroupsByBundleIdentifier;
  NSMutableArray *v16;
  NSMutableArray *pendingRequestGroups;
  NSMutableDictionary *v18;
  NSMutableDictionary *pendingObjectAuthorizationRequestsByBundleIdentifier;
  NSMutableDictionary *v20;
  NSMutableDictionary *activeObjectPromptSessionsBySessionIdentifier;
  NSMutableDictionary *v22;
  NSMutableDictionary *activeRecalibrateEstimatesRequestSessionsByBundleIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAuthorizationManager.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile != nil"));

  }
  v29.receiver = self;
  v29.super_class = (Class)HDAuthorizationManager;
  v6 = -[HDAuthorizationManager init](&v29, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    HKCreateConcurrentDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    completionQueue = v7->_completionQueue;
    v7->_completionQueue = (OS_dispatch_queue *)v10;

    HKCreateSerialDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    observationQueue = v7->_observationQueue;
    v7->_observationQueue = (OS_dispatch_queue *)v12;

    v7->_requestSessionTimeout = 10.0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestGroupsByBundleIdentifier = v7->_requestGroupsByBundleIdentifier;
    v7->_requestGroupsByBundleIdentifier = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingRequestGroups = v7->_pendingRequestGroups;
    v7->_pendingRequestGroups = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingObjectAuthorizationRequestsByBundleIdentifier = v7->_pendingObjectAuthorizationRequestsByBundleIdentifier;
    v7->_pendingObjectAuthorizationRequestsByBundleIdentifier = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeObjectPromptSessionsBySessionIdentifier = v7->_activeObjectPromptSessionsBySessionIdentifier;
    v7->_activeObjectPromptSessionsBySessionIdentifier = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeRecalibrateEstimatesRequestSessionsByBundleIdentifier = v7->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier;
    v7->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier = v22;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v7, sel_applicationsUninstalledNotification_, CFSTR("HDHealthDaemonApplicationsUninstalledNotification"), 0);
    objc_msgSend(v5, "daemon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerDaemonReadyObserver:queue:", v7, v7->_observationQueue);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HDAuthorizationManager;
  -[HDAuthorizationManager dealloc](&v5, sel_dealloc);
}

- (void)setAuthorizationStatuses:(id)a3 authorizationModes:(id)a4 forBundleIdentifier:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __109__HDAuthorizationManager_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke;
  v21[3] = &unk_1E6CFA078;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a6;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, v21);

}

void __109__HDAuthorizationManager_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(id, BOOL, id);
  HDDefaultAuthorizationSchemaProvider *v10;
  id WeakRetained;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v9 = v4;
  if (!v1)
    goto LABEL_9;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion_, v1, CFSTR("HDAuthorizationManager.m"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationStatuses count] > 0"));

    if (v8)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_setAuthorizationStatuses_authorizationModes_forBundleIdentifier_options_completion_, v1, CFSTR("HDAuthorizationManager.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_11;
LABEL_4:
  v10 = objc_alloc_init(HDDefaultAuthorizationSchemaProvider);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    v17 = 0;
    v12 = -[HDDefaultAuthorizationSchemaProvider setAuthorizationStatuses:authorizationModes:bundleIdentifier:options:profile:error:](v10, "setAuthorizationStatuses:authorizationModes:bundleIdentifier:options:profile:error:", v6, v7, v8, v5, WeakRetained, &v17);
    v13 = v17;

    v9[2](v9, v12 == 1, v13);
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1B7802000, v14, OS_LOG_TYPE_FAULT, "Unexpectedly provider did not respond to a selector.", buf, 2u);
    }
  }

LABEL_9:
}

- (int64_t)authorizationRequestStatusForClientBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 error:(id *)a6
{
  return -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:]((uint64_t)self, a3, a4, a5, 0, (uint64_t)a6);
}

- (uint64_t)_authorizationRequestStatusForClientBundleIdentifier:(void *)a3 writeTypes:(void *)a4 readTypes:(uint64_t)a5 updateAuthorizationStatuses:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v27;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  char v42;
  _QWORD v43[3];
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v27 = v10;
  if (a1)
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v44 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_setByUnioningSet:otherSet:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke;
    aBlock[3] = &unk_1E6CFA140;
    v34 = v10;
    v15 = v13;
    v35 = v15;
    v36 = a1;
    v40 = &v45;
    v37 = v11;
    v38 = v12;
    v16 = v14;
    v39 = v16;
    v41 = v43;
    v42 = a5;
    v17 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[HDDatabaseTransactionContext highPriorityContext](HDDatabaseTransactionContext, "highPriorityContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a5)
      v21 = 0;
    else
      v21 = v20;
    +[HDHealthEntity transactionContextForWriting:baseContext:](HDAuthorizationEntity, "transactionContextForWriting:baseContext:", a5, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "performTransactionWithContext:error:block:inaccessibilityHandler:", v22, a6, v17, 0))goto LABEL_11;
    if (!objc_msgSend(v16, "count"))
      goto LABEL_17;
    +[HDHealthEntity transactionContextForWriting:baseContext:](HDSampleEntity, "transactionContextForWriting:baseContext:", 0, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke_271;
    v29[3] = &unk_1E6CEB640;
    v30 = v16;
    v31 = a1;
    v32 = &v45;
    v24 = objc_msgSend(v19, "performTransactionWithContext:error:block:inaccessibilityHandler:", v23, a6, v29, 0);

    if (v24)
    {
LABEL_17:
      if (*((_BYTE *)v46 + 24))
        v25 = 1;
      else
        v25 = 2;
    }
    else
    {
LABEL_11:
      v25 = 0;
    }

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_hasRequiredAuthorizationStatusesForBundleIdentifier:(id)a3 requiredReadTypes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id WeakRetained;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = a4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isClinicalType") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Required authorization check only permitted for clinical types"));
          v23 = 0;
          v15 = v9;
          goto LABEL_25;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v11)
        continue;
      break;
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", v8, v9, WeakRetained, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v15, "objectForKeyedSubscript:", v21, (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22
            || objc_msgSend(v16, "containsObject:", v21) && (objc_msgSend(v22, "readingEnabled") & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 10, CFSTR("Required authorization not granted"));

            v23 = 0;
            goto LABEL_23;
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v18)
          continue;
        break;
      }
    }
    v23 = 1;
LABEL_23:

  }
  else
  {
    v23 = 0;
  }
LABEL_25:

  return v23;
}

- (id)enqueueAuthorizationRequestForBundleIdentifier:(id)a3 writeTypes:(id)a4 readTypes:(id)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *queue;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__HDAuthorizationManager_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion___block_invoke;
  block[3] = &unk_1E6CFA0A0;
  block[4] = self;
  v19 = v17;
  v29 = v19;
  v30 = v12;
  v31 = v13;
  v32 = v14;
  v33 = v15;
  v34 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  dispatch_async(queue, block);
  v25 = v34;
  v26 = v19;

  return v26;
}

void __132__HDAuthorizationManager_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, void *, BOOL, id);
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  _HDAuthorizationRequest *v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  _HDAuthorizationRequest *v23;
  uint64_t v24;
  NSSet *typesToWrite;
  uint64_t v26;
  NSSet *typesToRead;
  uint64_t v28;
  id completionHandler;
  uint64_t v30;
  _HDAuthorizationRequestGroup *v31;
  _HDAuthorizationRequest *v32;
  void *v33;
  id v34;
  uint64_t v35;
  HKSource *source;
  uint64_t v37;
  NSMutableArray *requests;
  uint64_t v39;
  NSMutableArray *completions;
  uint64_t v41;
  NSMutableSet *v42;
  uint64_t v43;
  NSMutableSet *v44;
  _HDAuthorizationRequest *v45;
  NSSet *v46;
  NSSet *v47;
  char v48;
  NSObject *v49;
  NSUUID *identifier;
  NSUUID *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSMutableSet *v55;
  NSMutableSet *v56;
  NSMutableSet *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void (**v67)(_QWORD, void *, BOOL, id);
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v69;
  id v70;
  _BYTE v71[22];
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v1 = (void *)a1[5];
  v3 = (void *)a1[6];
  v4 = (void *)a1[7];
  v5 = (void *)a1[8];
  v6 = (void *)a1[9];
  v7 = (void *)a1[10];
  v8 = v1;
  v9 = v3;
  v69 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v12;
  if (v2)
  {
    v67 = v11;
    v68 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v12;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_enqueueAuthorizationRequestWithIdentifier_bundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion_, v2, CFSTR("HDAuthorizationManager.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

    }
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
    objc_msgSend(WeakRetained, "sourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    objc_msgSend(v15, "clientSourceForBundleIdentifier:error:", v9, &v70);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v70;

    if (!v16)
    {
      v33 = v17;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_enqueueAuthorizationRequestWithIdentifier_bundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_completion_, CFSTR("Failed to look up source with bundle identifier \"%@\"), v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v68;
      if (v68)
        ((void (**)(_QWORD, id, _QWORD, void *))v68)[2](v68, v8, 0, v33);
      goto LABEL_37;
    }
    v63 = v17;
    v18 = [_HDAuthorizationRequest alloc];
    v66 = v8;
    v19 = v8;
    v20 = v69;
    v64 = v10;
    v21 = v10;
    v22 = v68;
    v65 = v19;
    if (v18)
    {
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithIdentifier_typesToWrite_typesToRead_completionHandler_, v18, CFSTR("HDAuthorizationManager.m"), 1666, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

      }
      *(_QWORD *)v71 = v18;
      *(_QWORD *)&v71[8] = _HDAuthorizationRequest;
      v23 = (_HDAuthorizationRequest *)objc_msgSendSuper2((objc_super *)v71, sel_init);
      v18 = v23;
      if (v23)
      {
        objc_storeStrong((id *)&v23->_identifier, v1);
        v24 = objc_msgSend(v20, "copy");
        typesToWrite = v18->_typesToWrite;
        v18->_typesToWrite = (NSSet *)v24;

        v26 = objc_msgSend(v21, "copy");
        typesToRead = v18->_typesToRead;
        v18->_typesToRead = (NSSet *)v26;

        v28 = objc_msgSend(v22, "copy");
        completionHandler = v18->_completionHandler;
        v18->_completionHandler = (id)v28;

      }
    }

    objc_msgSend(*(id *)(v2 + 72), "objectForKeyedSubscript:", v9);
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (_HDAuthorizationRequestGroup *)v30;
      v32 = v18;
      v8 = v66;
    }
    else
    {
      v31 = [_HDAuthorizationRequestGroup alloc];
      v34 = v16;
      v8 = v66;
      if (v31)
      {
        *(_QWORD *)v71 = v31;
        *(_QWORD *)&v71[8] = _HDAuthorizationRequestGroup;
        v31 = (_HDAuthorizationRequestGroup *)objc_msgSendSuper2((objc_super *)v71, sel_init);
        if (v31)
        {
          v35 = objc_msgSend(v34, "copy");
          source = v31->_source;
          v31->_source = (HKSource *)v35;

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37 = objc_claimAutoreleasedReturnValue();
          requests = v31->_requests;
          v31->_requests = (NSMutableArray *)v37;

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v39 = objc_claimAutoreleasedReturnValue();
          completions = v31->_completions;
          v31->_completions = (NSMutableArray *)v39;

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v31->_typesToWrite;
          v31->_typesToWrite = (NSMutableSet *)v41;

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v31->_typesToRead;
          v31->_typesToRead = (NSMutableSet *)v43;

        }
      }

      objc_msgSend(*(id *)(v2 + 72), "setObject:forKeyedSubscript:", v31, v9);
      v45 = v18;
      if (!v31)
      {
        v48 = 1;
LABEL_26:

        _HKInitializeLogging();
        v49 = (id)*MEMORY[0x1E0CB5280];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          if (v18)
            identifier = v18->_identifier;
          else
            identifier = 0;
          v51 = identifier;
          -[_HDAuthorizationRequestGroup bundleIdentifier]((id *)&v31->super.isa);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v48 & 1) != 0)
            v53 = 0;
          else
            v53 = -[NSMutableArray count](v31->_requests, "count");
          *(_DWORD *)v71 = 138543874;
          *(_QWORD *)&v71[4] = v51;
          *(_WORD *)&v71[12] = 2114;
          *(_QWORD *)&v71[14] = v52;
          v72 = 2048;
          v73 = v53;
          _os_log_impl(&dword_1B7802000, v49, OS_LOG_TYPE_DEFAULT, "Added authorization request %{public}@ to group for %{public}@. Request count: %ld", v71, 0x20u);

          v8 = v66;
        }

        v11 = v67;
        if (v67)
        {
          -[_HDAuthorizationRequestGroup bundleIdentifier]((id *)&v31->super.isa);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v48 & 1) != 0)
          {
            v55 = 0;
            v56 = 0;
          }
          else
          {
            v55 = v31->_typesToWrite;
            v56 = v31->_typesToRead;
          }
          *(_QWORD *)v71 = 0;
          v57 = v56;
          v58 = -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:](v2, v54, v55, v57, 0, (uint64_t)v71);
          v59 = *(id *)v71;

          v11 = v67;
          v67[2](v67, v65, v58 == 1, v59);

          v8 = v66;
        }

        v33 = v63;
        v10 = v64;
        v13 = v68;
LABEL_37:

        goto LABEL_38;
      }
    }
    if (v18)
    {
      -[NSMutableArray addObject:](v31->_requests, "addObject:", v18);
      v46 = v18->_typesToWrite;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", sel_addRequest_, v31, CFSTR("HDAuthorizationManager.m"), 1731, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

      -[NSMutableArray addObject:](v31->_requests, "addObject:", 0);
      v46 = 0;
    }
    -[NSMutableSet unionSet:](v31->_typesToWrite, "unionSet:", v46);
    if (v18)
      v47 = v18->_typesToRead;
    else
      v47 = 0;
    -[NSMutableSet unionSet:](v31->_typesToRead, "unionSet:", v47);
    v48 = 0;
    goto LABEL_26;
  }
LABEL_38:

}

- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *queue;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v9)
  {
    queue = self->_queue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __98__HDAuthorizationManager_handleAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke;
    v15[3] = &unk_1E6CED3D0;
    v15[4] = self;
    v16 = v9;
    v17 = v10;
    v18 = v12;
    dispatch_async(queue, v15);

  }
  else if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("nil bundle identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v14);

  }
}

void __98__HDAuthorizationManager_handleAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;

  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v10 = v2;
  if (v2)
  {
    v4 = (void *)a1[6];
    if (v4)
    {
      objc_setProperty_nonatomic_copy(v2, (SEL)v2, v4, 72);
      v3 = v10;
    }
    v5 = (void *)a1[7];
    if (v5)
    {
      v6 = v5;
      v7 = (void *)v10[5];
      v8 = _Block_copy(v6);
      objc_msgSend(v7, "addObject:", v8);

      v3 = v10;
    }
    if ((objc_msgSend(*(id *)(a1[4] + 80), "containsObject:", v3) & 1) == 0)
      objc_msgSend(*(id *)(a1[4] + 80), "addObject:", v10);
    -[HDAuthorizationManager _queue_handleNextAuthorizationRequestGroup](a1[4]);
    goto LABEL_11;
  }
  v9 = a1[7];
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, 1, 0);
LABEL_11:
    v3 = v10;
  }

}

- (void)_queue_handleNextAuthorizationRequestGroup
{
  id *v2;
  id *v3;
  void *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  os_log_t v16;
  NSObject *v17;
  id *v18;
  os_log_t v19;
  os_log_t v20;
  id v21;
  NSObject *v22;
  id *v23;
  double v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (id *)(a1 + 88);
    if (!*(_QWORD *)(a1 + 88))
    {
      objc_msgSend(*(id *)(a1 + 80), "firstObject");
      v3 = (id *)objc_claimAutoreleasedReturnValue();
      -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_15:

        return;
      }
      objc_msgSend(*(id *)(a1 + 80), "removeObjectAtIndex:", 0);
      objc_msgSend(*(id *)(a1 + 72), "removeObjectForKey:", v4);
      _HKInitializeLogging();
      v5 = (os_log_t *)MEMORY[0x1E0CB5280];
      v6 = (void *)*MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      {
        v25 = v3[1];
        v26 = v6;
        objc_msgSend(v25, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v3[2];
        objc_msgSend(v28, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v3;
        v36 = 2112;
        v37 = v27;
        v38 = 2112;
        v39 = v29;
        _os_log_debug_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEBUG, "activating request group %@ (write: %@, read: %@)", buf, 0x20u);

      }
      objc_msgSend(v3[7], "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v3[1];
      v8 = v3[2];
      v33 = 0;
      v10 = v8;
      v11 = v9;
      v12 = -[HDAuthorizationManager _authorizationRequestStatusForClientBundleIdentifier:writeTypes:readTypes:updateAuthorizationStatuses:error:](a1, v7, v11, v10, 1, (uint64_t)&v33);
      v13 = v33;

      if (v12)
      {
        if (v12 == 1
          && (v14 = v3[9]) != 0
          && (v15 = *(unsigned __int8 *)(a1 + 40), v14, !v15))
        {
          _HKInitializeLogging();
          v20 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            v21 = v3[7];
            v22 = v20;
            objc_msgSend(v21, "bundleIdentifier");
            v23 = (id *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v23;
            _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_INFO, "prompting for authorization for \"%@\", buf, 0xCu);

          }
          v24 = *(double *)(a1 + 120);
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke;
          v30[3] = &unk_1E6CE7DB8;
          v30[4] = a1;
          v31 = v3;
          v32 = v4;
          if (-[_HDAuthorizationRequestGroup promptIfNecessaryWithTimeout:completion:]((uint64_t)v31, v30, v24))
          {
            objc_storeStrong(v2, v3);

            goto LABEL_14;
          }

        }
        else
        {
          _HKInitializeLogging();
          v16 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
          {
            v17 = v16;
            -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
            v18 = (id *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v18;
            _os_log_debug_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEBUG, "NOT prompting for authorization for \"%@\", buf, 0xCu);
LABEL_23:

          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v19 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v17 = v19;
          -[_HDAuthorizationRequestGroup bundleIdentifier](v3);
          v18 = (id *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v18;
          v36 = 2114;
          v37 = v13;
          _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "failed to determine authorization request status for \"%{public}@\": %{public}@", buf, 0x16u);
          goto LABEL_23;
        }
      }
      -[HDAuthorizationManager _queue_requestGroupDidFinishPrompting:error:]((_QWORD *)a1, v3, v13);
LABEL_14:

      goto LABEL_15;
    }
  }
}

- (void)cancelAuthorizationRequestsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HDAuthorizationManager_cancelAuthorizationRequestsWithIdentifiers___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __69__HDAuthorizationManager_cancelAuthorizationRequestsWithIdentifiers___block_invoke(uint64_t a1)
{
  -[HDAuthorizationManager _queue_cancelAuthorizationRequestsWithIdentifiers:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_cancelAuthorizationRequestsWithIdentifiers:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_cancelAuthorizationRequestsWithIdentifiers_, a1, CFSTR("HDAuthorizationManager.m"), 686, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifiers != nil"));

    }
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Authorization request canceled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:](*(_QWORD *)(a1 + 88), v5, v6);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(*(id *)(a1 + 72), "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:](*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v5, v6);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(a1 + 112), "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 112), "objectForKeyedSubscript:", v17);
          v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            v18 = (_QWORD *)v18[1];
          objc_msgSend(v18, "sessionIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v5, "containsObject:", v20))
            objc_msgSend(*(id *)(a1 + 112), "removeObjectForKey:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    v4 = v22;
  }

}

- (void)beginAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__HDAuthorizationManager_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __96__HDAuthorizationManager_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  _BYTE *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id *v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 104), "objectForKeyedSubscript:", v3);
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v3;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Beginning prompt session: %@", buf, 0xCu);
      }
      v7 = v4;
      v8 = v7;
      if (v5[32])
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke;
        v28 = &unk_1E6CE7DE0;
        v9 = &v29;
        v29 = v7;
      }
      else
      {
        v5[32] = 1;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __76___HDObjectAuthorizationPromptSession_beginPromptTransactionWithCompletion___block_invoke_2;
        v28 = &unk_1E6CE8C48;
        v9 = (id *)v30;
        v17 = v7;
        v29 = v5;
        v30[0] = v17;
      }
      HKDispatchAsyncOnGlobalConcurrentQueue();

LABEL_25:
      goto LABEL_26;
    }
    v10 = (id *)*(id *)(v1 + 88);
    v11 = (uint64_t)v10;
    if (v10)
    {
      v12 = v10[8];
      if (v12)
      {
        v13 = v12;
        if ((objc_msgSend(v12, "isEqual:", v3) & 1) != 0)
        {
          if (!*(_QWORD *)(v11 + 64) || !*(_BYTE *)(v11 + 24))
          {
            objc_msgSend(*(id *)(v11 + 56), "bundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!*(_QWORD *)(v11 + 64))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginTransaction, v11, CFSTR("HDAuthorizationManager.m"), 1813, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_promptSessionIdentifier != nil"));

            }
            if (*(_BYTE *)(v11 + 24))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_beginTransaction, v11, CFSTR("HDAuthorizationManager.m"), 1814, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_inTransaction"));

            }
            *(_BYTE *)(v11 + 24) = 1;
            -[HDWorkoutLocationSmoother _queue_cancelTimeout](v11);
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E0CB5280];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v20;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v3;
              _os_log_debug_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEBUG, "beginning authorization transaction for \"%@\" (%@)", buf, 0x16u);
            }
            v18 = 0;
            if (v20)
              goto LABEL_22;
            goto LABEL_19;
          }
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = objc_opt_class();
          v16 = CFSTR("There is already an active authorization session transaction");
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          v15 = objc_opt_class();
          v16 = CFSTR("Session identifier does not match active authorization session identifier");
        }
        objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v15, sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v18;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "cannot begin authorization transaction: %{public}@", buf, 0xCu);
        }
        v20 = 0;
LABEL_22:
        if (v4)
          (*((void (**)(id, void *, void *))v4 + 2))(v4, v20, v18);

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, CFSTR("There is no active authorization session"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = objc_opt_class();
      objc_msgSend(v3, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v25, sel__queue_beginAuthorizationDelegateTransactionWithSessionIdentifier_completion_, CFSTR("Failed to find authorization session with identifier %@"), v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
    goto LABEL_19;
  }
LABEL_26:

}

- (void)endAuthorizationDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAuthorizationManager.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HDAuthorizationManager_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

void __89__HDAuthorizationManager_endAuthorizationDelegateTransactionWithSessionIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD *v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 104), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "Ending prompt session: %@", (uint8_t *)&v19, 0xCu);
      }
      -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:]((uint64_t)v5, v4 == 0, v4);
    }
    else
    {
      v7 = *(id *)(v1 + 88);
      v8 = v7;
      if (v7)
        v7 = (_QWORD *)v7[8];
      v9 = objc_msgSend(v7, "isEqual:", v3);
      if (v8)
        v10 = v9;
      else
        v10 = 0;
      if (!v8 || !v8[8])
        goto LABEL_19;
      v11 = v10 ^ 1;
      if (!*((_BYTE *)v8 + 24))
        v11 = 1;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        v12 = (void *)*MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
        {
          v16 = v12;
          objc_msgSend((id)v8[7], "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v17;
          v21 = 2112;
          v22 = v18;
          _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "ending authorization transaction for \"%@\" (%@)", (uint8_t *)&v19, 0x16u);

        }
        -[HDAuthorizationManager _queue_requestGroupDidFinishPrompting:error:]((_QWORD *)v1, v8, v4);
      }
      else
      {
LABEL_19:
        _HKInitializeLogging();
        v13 = (void *)*MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        {
          v14 = v13;
          objc_msgSend(v3, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v15;
          _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "cannot end transaction \"%@\", (uint8_t *)&v19, 0xCu);

        }
      }

    }
  }

}

- (void)resetAllAuthorizationRecordsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Resetting all authorization records", buf, 2u);
  }
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("ResetAllAuthorizationRecords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v11 = v6;
  v12 = v4;
  block[4] = self;
  v8 = v6;
  v9 = v4;
  dispatch_async(queue, block);

}

void __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  id *v4;
  id WeakRetained;
  _BOOL4 v6;
  id v7;
  id v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke_2;
  v14 = &unk_1E6CECC08;
  v16 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 40);
  v3 = &v11;
  if (v2)
  {
    v4 = (id *)(v2 + 48);
    WeakRetained = objc_loadWeakRetained(v4);
    v18 = 0;
    v6 = +[HDAuthorizationEntity resetAllAuthorizationStatusesWithProfile:error:](HDAuthorizationEntity, "resetAllAuthorizationStatusesWithProfile:error:", WeakRetained, &v18, v11, v12);
    v7 = v18;

    if (v6)
    {
      v8 = objc_loadWeakRetained(v4);
      v17 = v7;
      v9 = +[HDObjectAuthorizationEntity resetAllObjectAuthorizationRecordsForProfile:error:](HDObjectAuthorizationEntity, "resetAllObjectAuthorizationRecordsForProfile:error:", v8, &v17);
      v10 = v17;

      v7 = v10;
    }
    else
    {
      v9 = 0;
    }
    v13((uint64_t)v3, v9, v7);

  }
}

void __69__HDAuthorizationManager_resetAllAuthorizationRecordsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to reset all authorization settings: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (void)openAppForAuthorization:(id)a3 sessionIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *queue;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:placeholder:", v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke;
    block[3] = &unk_1E6CFA0F0;
    block[4] = self;
    v16 = v9;
    v19 = v11;
    v17 = v12;
    v18 = v10;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No app with the requested bundle identifier."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v14);

  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD aBlock[5];
  id v39;
  id v40;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));
  }
  v8 = *(void **)(a1 + 64);
  if (v8)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = _Block_copy(v9);
    objc_msgSend(v7, "addObject:", v10);

  }
  if (!v6)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_2;
    aBlock[3] = &unk_1E6CE7DB8;
    v11 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v39 = v11;
    v40 = v7;
    v33 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 48), "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      v13 = *(void **)(a1 + 40);
    v14 = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0D298D0]);
    v16 = (void *)MEMORY[0x1E0CB3940];
    HKHealthKitFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB5158];
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OPEN_%@_TITLE"), &stru_1E6D11BB8, *MEMORY[0x1E0CB5158]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v19, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v20);

    v21 = (void *)MEMORY[0x1E0CB3940];
    HKHealthKitFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OPEN_%@_DESCRIPTION"), &stru_1E6D11BB8, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v23, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMessage:", v24);

    v25 = (void *)MEMORY[0x1E0CB3940];
    HKHealthKitFrameworkBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OPEN_%@"), &stru_1E6D11BB8, v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v27, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDefaultButton:", v28);

    HKHealthKitFrameworkBundle();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_1E6D11BB8, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCancelButton:", v30);

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_4;
    v34[3] = &unk_1E6CFA118;
    v31 = *(void **)(a1 + 40);
    v34[4] = *(_QWORD *)(a1 + 32);
    v35 = v31;
    v37 = v33;
    v36 = *(id *)(a1 + 56);
    v32 = v33;
    objc_msgSend(v15, "presentWithResponseHandler:", v34);

  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E6CEDBD8;
  block[4] = v6;
  v12 = v7;
  v9 = *(id *)(a1 + 48);
  v15 = a2;
  v13 = v9;
  v14 = v5;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 48), "removeAllObjects", (_QWORD)v8);
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  objc_class *v19;
  _QWORD v20[4];
  id v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v9 = (void *)_MergedGlobals_208;
    v30 = _MergedGlobals_208;
    v10 = MEMORY[0x1E0C809B0];
    if (!_MergedGlobals_208)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __getUIHealthAuthorizationActionClass_block_invoke;
      v26[3] = &unk_1E6CECDD0;
      v26[4] = &v27;
      __getUIHealthAuthorizationActionClass_block_invoke((uint64_t)v26);
      v9 = (void *)v28[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v27, 8);
    if (v11)
    {
      v12 = objc_alloc_init(v11);
      v13 = *MEMORY[0x1E0D22CE0];
      v31 = v12;
      v32 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v11 = (objc_class *)objc_claimAutoreleasedReturnValue();

    }
    v15 = *(void **)(a1 + 40);
    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_5;
    v20[3] = &unk_1E6CFA0F0;
    v21 = v15;
    v22 = v11;
    v25 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 32);
    v23 = v17;
    v24 = v18;
    v19 = v11;
    dispatch_async(v16, v20);

  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D23170];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_6;
  v7[3] = &unk_1E6CFA0C8;
  v11 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v2, "hd_openApplication:optionsDictionary:completion:", v3, v4, v7);

}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2 != 0);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = dispatch_time(0, 30000000000);
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(v4 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_7;
    block[3] = &unk_1E6CE7FB8;
    block[4] = v4;
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    dispatch_after(v3, v6, block);

  }
}

void __79__HDAuthorizationManager_openAppForAuthorization_sessionIdentifier_completion___block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v7[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAuthorizationManager _queue_cancelAuthorizationRequestsWithIdentifiers:](v2, v3);

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Application failed to prompt for authorization in a timely fashion."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HDAuthorizationRequestGroup cancelRequestsWithIdentifiers:error:]((uint64_t)v5, v6, v4);

}

- (void)applicationsUninstalledNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  HDAuthorizationManager *v12;
  id v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDHealthDaemonApplicationsUninstalledBundleIdentifiersKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("ApplicationsUninstalled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__HDAuthorizationManager_applicationsUninstalledNotification___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  v11 = v5;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(queue, block);

}

uint64_t __62__HDAuthorizationManager_applicationsUninstalledNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  id WeakRetained;
  _BOOL4 v11;
  __CFString *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v28;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v7 = *(_QWORD *)(a1 + 40);
        v26 = 0;
        if (v7)
        {
          v8 = (id *)(v7 + 48);
          v9 = v6;
          WeakRetained = objc_loadWeakRetained(v8);
          v11 = +[HDAuthorizationEntity resetAuthorizationStatusesForBundleIdentifier:profile:error:](HDAuthorizationEntity, "resetAuthorizationStatusesForBundleIdentifier:profile:error:", v9, WeakRetained, &v26);

          v12 = CFSTR("Authorization reset");
          v13 = objc_loadWeakRetained(v8);
          objc_msgSend(v13, "nanoSyncManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Authorization reset"), 0);

          v15 = v9;
          v16 = objc_loadWeakRetained(v8);
          objc_msgSend(v16, "daemon");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "xpcEventManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "authorizationChangedForBundleIdentifier:", v15);

          v19 = v26;
          v20 = v19;
          if (v11)
          {
            _HKInitializeLogging();
            v21 = *MEMORY[0x1E0CB5280];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v15;
              _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Reset authorization records for uninstalled application %@", buf, 0xCu);
            }
          }
          else if (v19)
          {
            if ((HKIsUnitTesting() & 1) == 0)
            {
              _HKInitializeLogging();
              v22 = *MEMORY[0x1E0CB5280];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v32 = v15;
                v33 = 2114;
                v34 = v20;
                _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Error resetting authorization records for uninstalled application %@: %{public}@", buf, 0x16u);
              }
            }
          }
        }
        else
        {
          v20 = 0;
        }

        ++v5;
      }
      while (v3 != v5);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      v3 = v23;
    }
    while (v23);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)daemonReady:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *schemaProviderMap;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  -[HDAuthorizationManager _builtInSchemas](self, "_builtInSchemas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
  schemaProviderMap = self->_schemaProviderMap;
  self->_schemaProviderMap = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pluginManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pluginsConformingToProtocol:", &unk_1EF2523F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "schemaProviderMap", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary hk_addEntriesFromNonNilDictionary:](self->_schemaProviderMap, "hk_addEntriesFromNonNilDictionary:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

uint64_t __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  int v43;
  uint64_t v45;
  id obj;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 48));
  +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:", v4, v5, WeakRetained, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v45 = a3;
    v8 = a1;
    if (!objc_msgSend(v7, "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
      {
        _HKInitializeLogging();
        v9 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Authorization required. There are no authorization statuses", buf, 2u);
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = *(id *)(a1 + 40);
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v54;
      v47 = v7;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v54 != v50)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "authorizationRecord");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(*(id *)(v8 + 56), "containsObject:", v11);
          v15 = objc_msgSend(*(id *)(v8 + 64), "containsObject:", v11);
          v16 = objc_msgSend(v13, "requestedSharing");
          v17 = objc_msgSend(v13, "requestedReading");
          if (objc_msgSend(v13, "readingEnabled") && objc_msgSend(v13, "mode") == 1)
          {
            objc_msgSend(v12, "objectLimitAnchor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v18, v11);

          }
          objc_msgSend(v11, "parentType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v11, "parentType");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v7;
            v22 = (void *)v20;
            objc_msgSend(v21, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "authorizationRecord");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v15 && (objc_msgSend(v24, "deniedReading") & 1) != 0
              || v14 && objc_msgSend(v25, "deniedSharing"))
            {
              v26 = 201;
              if ((v14 & v15) != 0)
                v26 = 203;
              v27 = 200;
              if (v15)
                v27 = 202;
              if (v14)
                v28 = v26;
              else
                v28 = v27;
              objc_msgSend(v49, "setObject:forKeyedSubscript:", &unk_1E6DFCB78, v11);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setObject:forKeyedSubscript:", v29, v11);

              v8 = a1;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;

              v7 = v47;
              goto LABEL_43;
            }

            v7 = v47;
          }
          v30 = (v14 ^ 1 | v16) != 1 || (v15 ^ 1 | v17) == 0;
          v8 = a1;
          if (v30 || (objc_msgSend(v12, "isAuthorizationDetermined") & 1) == 0)
          {
            v31 = 201;
            if ((v14 & v15) != 0)
              v31 = 203;
            v32 = 200;
            if (v15)
              v32 = 202;
            if (v14)
              v33 = v31;
            else
              v33 = v32;
            objc_msgSend(v49, "setObject:forKeyedSubscript:", &unk_1E6DFCB90, v11);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setObject:forKeyedSubscript:", v34, v11);

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
            if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
            {
              _HKInitializeLogging();
              v35 = (void *)*MEMORY[0x1E0CB5280];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
              {
                v36 = v35;
                v37 = objc_msgSend(v12, "isAuthorizationDetermined");
                *(_DWORD *)buf = 138413058;
                v58 = v11;
                v59 = 1024;
                v60 = v14;
                v61 = 1024;
                v62 = v15;
                v63 = 1024;
                v64 = v37;
                _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "Authorization required. Type: %@, ReqWrite: %i, ReqRead: %i, AuthNotDetermined: %i", buf, 0x1Eu);

              }
            }
          }
LABEL_43:

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v51);
    }

    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 80) + 8) + 24)
       || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 88) + 8) + 24))
      && *(_BYTE *)(v8 + 96))
    {
      v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(v8 + 48) + 48));
      objc_msgSend(v38, "sourceManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localSourceForBundleIdentifier:copyIfNecessary:error:", *(_QWORD *)(v8 + 32), 1, v45);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(v8 + 48) + 48));
        v42 = +[HDAuthorizationEntity setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:](HDAuthorizationEntity, "setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:", v49, v48, MEMORY[0x1E0C9AA70], v40, 0, v41, v45);

        v43 = v42 << 31 >> 31;
      }
      else
      {
        LOBYTE(v43) = 0;
      }

    }
    else
    {
      LOBYTE(v43) = 1;
    }

  }
  else
  {
    LOBYTE(v43) = 0;
  }

  return v43 & 1;
}

BOOL __134__HDAuthorizationManager__authorizationRequestStatusForClientBundleIdentifier_writeTypes_readTypes_updateAuthorizationStatuses_error___block_invoke_271(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  id obj;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v5)
  {
    v15 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
      +[HDSampleEntity maxAnchorForSamplesWithType:profile:error:](HDSampleEntity, "maxAnchorForSamplesWithType:profile:error:", v9, WeakRetained, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v15 = 1;
LABEL_17:

        goto LABEL_18;
      }
      v12 = objc_msgSend(v11, "longLongValue");
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "longLongValue");

      if (v12 > v14)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
          && (_HKInitializeLogging(),
              v16 = *MEMORY[0x1E0CB5280],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT)))
        {
          *(_WORD *)buf = 0;
          v15 = 2;
          _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Authorization required. Re-authorization for anchor-limited authorization", buf, 2u);
        }
        else
        {
          v15 = 2;
        }
        goto LABEL_17;
      }

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v15 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_18:

  return (v15 & 1) == 0;
}

void __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 48));
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "analyticsSubmissionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(v9, "authorization_reportAuthRequestPromptedForBundleIdentifer:profileType:", v10, objc_msgSend(v11, "profileType"));

  }
  else
  {
    v12 = *(NSObject **)(v6 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke_2;
    block[3] = &unk_1E6CE7FB8;
    block[4] = v6;
    v14 = *(id *)(a1 + 40);
    v15 = v5;
    dispatch_async(v12, block);

  }
}

void __68__HDAuthorizationManager__queue_handleNextAuthorizationRequestGroup__block_invoke_2(uint64_t a1)
{
  -[HDAuthorizationManager _queue_requestGroupDidFinishPrompting:error:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_queue_requestGroupDidFinishPrompting:(void *)a3 error:
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  _QWORD block[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49[16];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_48;
  if (v5)
  {
    if (v6)
      goto LABEL_25;
    v8 = (void *)*((_QWORD *)v5 + 7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_requestGroupDidFinishPrompting_error_, a1, CFSTR("HDAuthorizationManager.m"), 907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestGroup != nil"));

    if (v7)
      goto LABEL_25;
    v8 = 0;
  }
  v9 = v8;
  v49[0] = 0;
  objc_msgSend(v9, "_fetchBundleWithError:", v49);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v49[0];
  if (v10)
  {
    v12 = *MEMORY[0x1E0CB5E28];
    objc_msgSend(v10, "objectForInfoDictionaryKey:", *MEMORY[0x1E0CB5E28]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v7 = 0;
LABEL_23:

      goto LABEL_24;
    }
    *(_QWORD *)&v45 = v11;
    objc_msgSend(MEMORY[0x1E0CB6978], "_objectTypesFromIdentifierArray:error:", v13, &v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)v45;

    if (v14)
    {
      if (!objc_msgSend(v14, "count"))
      {
        v7 = 0;
        goto LABEL_22;
      }
      v16 = objc_msgSend(v14, "count");
      if (v16 >= *MEMORY[0x1E0CB5630])
      {
        -[_HDAuthorizationRequestGroup bundleIdentifier](v5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v41 = v15;
        v39 = objc_msgSend(a1, "_hasRequiredAuthorizationStatusesForBundleIdentifier:requiredReadTypes:error:", v19, v14, &v41);
        v20 = (id)v41;

        if (v39)
          v21 = 0;
        else
          v21 = v20;
        v7 = v21;
        v15 = v20;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__validateRequiredAuthorizationWithRequestGroup_, CFSTR("Must specify at least %lu identifiers for \"%@\"), *MEMORY[0x1E0CB5630], v12);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v15;
      v15 = v17;
    }
    v7 = v17;
LABEL_22:

    v11 = v15;
    goto LABEL_23;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
  {
    v36 = v18;
    objc_msgSend(v9, "bundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v37;
    v52 = 2114;
    v53 = v11;
    _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "Failed to look up bundle for \"%{public}@\": %{public}@", buf, 0x16u);

  }
  v7 = 0;
LABEL_24:

  if (!v7)
  {
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEBUG, "authorization request finished successfully", buf, 2u);
    }
    v7 = 0;
    goto LABEL_27;
  }
LABEL_25:
  _HKInitializeLogging();
  v22 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v7;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "authorization request failed with error: %{public}@", buf, 0xCu);
  }
LABEL_27:
  v7 = v7;
  if (v5)
  {
    if (v5[8])
    {
      -[HDWorkoutLocationSmoother _queue_cancelTimeout]((uint64_t)v5);
      *((_BYTE *)v5 + 24) = 0;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v23 = v5[4];
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v46 != v26)
            objc_enumerationMutation(v23);
          -[_HDAuthorizationRequest invokeCompletionHandlerWithSuccess:error:](*(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), v7 == 0, v7);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
      }
      while (v25);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v28 = v5[5];
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v28);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j) + 16))();
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v30);
    }

    v33 = v5[5];
    v5[5] = 0;

  }
  if ((id *)a1[11] == v5)
  {
    a1[11] = 0;

  }
  v34 = a1[7];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDAuthorizationManager__queue_requestGroupDidFinishPrompting_error___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = a1;
  dispatch_async(v34, block);
LABEL_48:

}

uint64_t __70__HDAuthorizationManager__queue_requestGroupDidFinishPrompting_error___block_invoke(uint64_t a1)
{
  return -[HDAuthorizationManager _queue_handleNextAuthorizationRequestGroup](*(_QWORD *)(a1 + 32));
}

- (void)setObjectAuthorizationStatuses:(id)a3 forObjectType:(id)a4 bundleIdentifier:(id)a5 sessionIdentifier:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, BOOL, id);
  void *v17;
  id WeakRetained;
  uint64_t v19;
  id v20;
  HDAuthorizationManager *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  CFAbsoluteTime Current;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  _BOOL8 v45;
  void *v46;
  HDAuthorizationManager *v47;
  void *v48;
  void *v49;
  void (**v50)(id, BOOL, id);
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, BOOL, id))a7;
  -[HDAuthorizationManager _schemaProviderForType:](self, "_schemaProviderForType:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    else
      WeakRetained = 0;
    v62 = 0;
    v19 = objc_msgSend(v17, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:profile:error:", v12, v13, v14, v15, WeakRetained, &v62);
    v20 = v62;

    v16[2](v16, v19 == 1, v20);
  }
  else
  {
    v52 = v13;
    v53 = v12;
    if (self)
    {
      v21 = self;
      v22 = objc_loadWeakRetained((id *)&self->_profile);
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    objc_msgSend(v22, "sourceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v23, "localSourceForBundleIdentifier:error:", v14, &v61);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v61;

    if (v24)
    {
      if (v21)
        v25 = objc_loadWeakRetained((id *)&v21->_profile);
      else
        v25 = 0;
      v60 = v20;
      objc_msgSend(v24, "sourceUUIDWithProfile:error:", v25, &v60);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v60;

      v54 = (void *)v26;
      if (v26)
      {
        v46 = v27;
        v47 = v21;
        v48 = v24;
        v49 = v17;
        v50 = v16;
        v51 = v14;
        v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v29 = v53;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              v34 = v15;
              if (*(_QWORD *)v57 != v32)
                objc_enumerationMutation(v29);
              v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              v36 = objc_alloc(MEMORY[0x1E0CB6970]);
              objc_msgSend(v29, "objectForKeyedSubscript:", v35);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = HKObjectAuthorizationStatusForNumber();
              Current = CFAbsoluteTimeGetCurrent();
              v40 = v35;
              v15 = v34;
              v41 = (void *)objc_msgSend(v36, "initWithObjectUUID:sourceUUID:sessionUUID:status:modificationDate:", v40, v54, v34, v38, Current);

              objc_msgSend(v28, "addObject:", v41);
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          }
          while (v31);
        }

        if (v47)
        {
          v42 = objc_loadWeakRetained((id *)&v47->_profile);
          v43 = objc_msgSend(v42, "currentSyncIdentityPersistentID");
          v44 = objc_loadWeakRetained((id *)&v47->_profile);
        }
        else
        {
          v43 = objc_msgSend(0, "currentSyncIdentityPersistentID");
          v42 = 0;
          v44 = 0;
        }
        v13 = v52;
        v12 = v53;
        v16 = v50;
        v55 = v46;
        v45 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v28, 0, v43, v44, &v55, HDObjectAuthorizationEntity);
        v20 = v55;

        v16[2](v16, v45, v20);
        v14 = v51;
        v24 = v48;
        v17 = v49;
      }
      else
      {
        v16[2](v16, 0, v27);
        v13 = v52;
        v12 = v53;
        v20 = v27;
      }

    }
    else
    {
      v16[2](v16, 0, v20);
      v13 = v52;
      v12 = v53;
    }

  }
}

- (id)enqueueObjectAuthorizationRequestForBundleIdentifier:(id)a3 context:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _HDObjectAuthorizationRequest *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  NSUUID *identifier;
  uint64_t v24;
  NSArray *samples;
  uint64_t v26;
  HKObjectAuthorizationPromptSessionMetadata *metadata;
  void *v28;
  id completion;
  char v30;
  HDProfile **p_profile;
  id WeakRetained;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  NSObject *completionQueue;
  _HDObjectAuthorizationRequest *v45;
  id v46;
  NSUUID *v47;
  NSUUID *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t k;
  NSObject *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  void *v72;
  void *v73;
  NSObject *queue;
  id v75;
  NSUUID *v76;
  void *v78;
  NSObject *v79;
  _HDObjectAuthorizationRequest *v80;
  NSUUID *v81;
  HDAuthorizationManager *v82;
  void *v83;
  id v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  _QWORD v92[4];
  _HDObjectAuthorizationRequest *v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[5];
  id v105;
  id v106;
  _HDObjectAuthorizationRequest *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  _QWORD block[4];
  _HDObjectAuthorizationRequest *v115;
  id v116;
  id v117;
  id v118;
  _QWORD v119[4];
  _HDObjectAuthorizationRequest *v120;
  id v121;
  objc_super v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v86 = a5;
  v126 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = [_HDObjectAuthorizationRequest alloc];
  objc_msgSend(v13, "samples");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  v20 = v18;
  v21 = v15;
  if (v16)
  {
    v122.receiver = v16;
    v122.super_class = (Class)_HDObjectAuthorizationRequest;
    v16 = -[HDAuthorizationManager init](&v122, sel_init);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = objc_claimAutoreleasedReturnValue();
      identifier = v16->_identifier;
      v16->_identifier = (NSUUID *)v22;

      v24 = objc_msgSend(v19, "copy");
      samples = v16->_samples;
      v16->_samples = (NSArray *)v24;

      v26 = objc_msgSend(v20, "copy");
      metadata = v16->_metadata;
      v16->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v26;

      v28 = _Block_copy(v21);
      completion = v16->_completion;
      v16->_completion = v28;

    }
  }

  v30 = objc_msgSend(v13, "promptWithAllSamples");
  if (v16)
    v16->_promptWithAllSamples = v30;
  if (v12)
  {
    v91 = v14;
    v89 = v21;
    p_profile = &self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "sourceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v90 = v12;
    objc_msgSend(v33, "localSourceForBundleIdentifier:error:", v12, &v118);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v118;

    if (!v34)
    {
      completionQueue = self->_completionQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_2;
      block[3] = &unk_1E6CEBCA0;
      v21 = v89;
      v117 = v89;
      v45 = v16;
      v115 = v45;
      v46 = v35;
      v116 = v46;
      dispatch_async(completionQueue, block);
      if (v16)
        v47 = v45->_identifier;
      else
        v47 = 0;
      v14 = v91;
      v48 = v47;

      v49 = v117;
      goto LABEL_54;
    }
    v82 = self;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v36 = objc_claimAutoreleasedReturnValue();
    v85 = (void *)v36;
    if (objc_msgSend(v13, "persistSession"))
      v37 = (void *)v36;
    else
      v37 = 0;
    v39 = v37;
    if (v16)
      objc_setProperty_nonatomic_copy(v16, v38, v39, 56);
    objc_msgSend(v13, "samples");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_loadWeakRetained((id *)p_profile);
    v113 = v35;
    v83 = v39;
    +[HDObjectAuthorizationEntity authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:](HDObjectAuthorizationEntity, "authorizationRecordsForSamples:sourceEntity:sessionIdentifier:profile:error:", v40, v34, v39, v41, &v113);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v113;

    v43 = objc_msgSend(v13, "promptWithNoSamples");
    v88 = v42;
    if (objc_msgSend(v13, "promptWithAllSamples"))
    {
      -[HDSmoothingTask setTransaction:]((uint64_t)v16, v42);
      v21 = v89;
      v14 = v91;
      if (!v86)
      {
LABEL_33:
        if (!v42)
        {
          v46 = v84;
          if (v16)
          {
            (*((void (**)(id, NSUUID *, _QWORD, id))v21 + 2))(v21, v16->_identifier, 0, v84);
            v76 = v16->_identifier;
          }
          else
          {
            (*((void (**)(id, _QWORD, _QWORD, id))v21 + 2))(v21, 0, 0, v84);
            v76 = 0;
          }
          v49 = v85;
          goto LABEL_53;
        }
        v87 = v34;
        v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        objc_msgSend(v13, "samples");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
        if (v60)
        {
          v61 = v60;
          v62 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v61; ++i)
            {
              if (*(_QWORD *)v101 != v62)
                objc_enumerationMutation(v59);
              v64 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              objc_msgSend(v64, "UUID");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setObject:forKeyedSubscript:", v64, v65);

            }
            v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
          }
          while (v61);
        }

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v66 = v88;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v96, v123, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v97;
          do
          {
            for (j = 0; j != v68; ++j)
            {
              if (*(_QWORD *)v97 != v69)
                objc_enumerationMutation(v66);
              v71 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
              if (objc_msgSend(v71, "status") == 2)
              {
                objc_msgSend(v71, "objectUUID");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "objectForKeyedSubscript:", v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "addObject:", v73);

              }
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v96, v123, 16);
          }
          while (v68);
        }

        queue = v82->_queue;
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_5;
        v92[3] = &unk_1E6CEBCA0;
        v21 = v89;
        v95 = v89;
        v93 = v16;
        v94 = v57;
        v75 = v57;
        dispatch_async(queue, v92);

        v12 = v90;
        v14 = v91;
        v49 = v85;
        v34 = v87;
LABEL_51:
        v46 = v84;
        if (v16)
          v76 = v16->_identifier;
        else
          v76 = 0;
LABEL_53:
        v48 = v76;

LABEL_54:
        goto LABEL_55;
      }
    }
    else
    {
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v50 = v42;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
      v14 = v91;
      if (v51)
      {
        v52 = v51;
        v53 = v34;
        v54 = *(_QWORD *)v110;
        while (2)
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v110 != v54)
              objc_enumerationMutation(v50);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * k), "status"))
            {
              -[HDSmoothingTask setTransaction:]((uint64_t)v16, v50);
              v43 = 1;
              goto LABEL_29;
            }
          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
          if (v52)
            continue;
          break;
        }
LABEL_29:
        v34 = v53;
        v14 = v91;
      }

      v42 = v88;
      v21 = v89;
      if (!v43 || !v86)
        goto LABEL_33;
    }
    v56 = v82->_queue;
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_3;
    v104[3] = &unk_1E6CF74B0;
    v104[4] = v82;
    v105 = v12;
    v49 = v85;
    v106 = v85;
    v107 = v16;
    v108 = v14;
    dispatch_async(v56, v104);

    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAuthorizationManager.m"), 1130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  v79 = self->_completionQueue;
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke;
  v119[3] = &unk_1E6CE8C48;
  v121 = v21;
  v80 = v16;
  v120 = v80;
  dispatch_async(v79, v119);
  if (v16)
    v81 = v80->_identifier;
  else
    v81 = 0;
  v48 = v81;

  v46 = v121;
LABEL_55:

  return v48;
}

void __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  id v5;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1)
    v1 = (_QWORD *)v1[3];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = v1;
  objc_msgSend(v3, "hk_error:description:", 3, CFSTR("Bundle identifier must be non-nil when requesting object authorization."));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD *, _QWORD, id))(v2 + 16))(v2, v4, 0, v5);

}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[6];
  v3 = a1[4];
  if (v3)
    v4 = *(_QWORD *)(v3 + 24);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, v4, 0, a1[5]);
}

void __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_3(uint64_t a1)
{
  _HDObjectAuthorizationPromptSession *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  _HDObjectAuthorizationPromptSession *v9;
  uint64_t v10;
  NSUUID *sessionIdentifier;
  NSMutableArray *v12;
  NSMutableArray *requests;
  NSMutableArray *v14;
  NSMutableArray *completions;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  objc_super v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (_HDObjectAuthorizationPromptSession *)objc_claimAutoreleasedReturnValue();
  if (v2)
    goto LABEL_6;
  v2 = [_HDObjectAuthorizationPromptSession alloc];
  v4 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v6 = v4;
  v7 = v3;
  v8 = WeakRetained;
  if (v2)
  {
    v20.receiver = v2;
    v20.super_class = (Class)_HDObjectAuthorizationPromptSession;
    v9 = (_HDObjectAuthorizationPromptSession *)objc_msgSendSuper2(&v20, sel_init);
    v2 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_profile, v8);
      v10 = objc_msgSend(v7, "copy");
      sessionIdentifier = v2->_sessionIdentifier;
      v2->_sessionIdentifier = (NSUUID *)v10;

      objc_storeStrong((id *)&v2->_bundleIdentifier, v4);
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      requests = v2->_requests;
      v2->_requests = v12;

      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      completions = v2->_completions;
      v2->_completions = v14;

    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  if (v2)
  {
LABEL_6:
    -[NSMutableArray addObject:](v2->_requests, "addObject:", *(_QWORD *)(a1 + 56));

  }
  v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_4;
  v17[3] = &unk_1E6CE8C48;
  v19 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 56);
  dispatch_async(v16, v17);

}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 24);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 1, 0);
}

uint64_t __140__HDAuthorizationManager_enqueueObjectAuthorizationRequestForBundleIdentifier_context_promptIfNeeded_authorizationNeededHandler_completion___block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[6];
  v3 = a1[4];
  if (v3)
    v4 = *(_QWORD *)(v3 + 24);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, v4, a1[5], 0);
}

- (void)handleObjectAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke;
  v15[3] = &unk_1E6CED3D0;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  const void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _QWORD *v24;
  dispatch_time_t v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[5];
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id buf[17];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = *(id *)(v3 + 104);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(v3 + 104), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10));
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          v11 = (_QWORD *)v11[6];
        if ((objc_msgSend(v11, "isEqualToString:", v5) & 1) != 0)
          break;

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v12 = 0;
    }

    if (v12)
    {
      if (v2 && objc_msgSend(*(id *)(v2 + 16), "count"))
      {
        v13 = *(const void **)(a1 + 48);
        v14 = *(void **)(v2 + 24);
      }
      else
      {
        v13 = *(const void **)(a1 + 48);
        v14 = (void *)v12[3];
      }
      v15 = _Block_copy(v13);
      objc_msgSend(v14, "addObject:", v15);

      goto LABEL_27;
    }
  }
  else
  {

  }
  if (v2 && objc_msgSend(*(id *)(v2 + 16), "count"))
  {
    v16 = *(void **)(v2 + 24);
    v17 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v16, "addObject:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(v2 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Beginning a new prompt session.", (uint8_t *)buf, 2u);
    }
    v19 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_301;
    v35[3] = &unk_1E6CEB718;
    v35[4] = *(_QWORD *)(a1 + 32);
    v20 = (id)v2;
    v36 = v20;
    v21 = objc_msgSend(v35, "copy");
    v22 = (void *)v20[5];
    v20[5] = v21;

    v23 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_3;
    block[3] = &unk_1E6CE8C48;
    v34 = *(id *)(a1 + 56);
    v24 = v20;
    v33 = v24;
    dispatch_async(v23, block);
    objc_initWeak(buf, v24);
    v25 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 120) * 1000000000.0));
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_5;
    v30[3] = &unk_1E6CECE78;
    objc_copyWeak(&v31, buf);
    dispatch_after(v25, MEMORY[0x1E0C80D38], v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(buf);

    v26 = v36;
  }
  else
  {
    v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_6;
    v28[3] = &unk_1E6CE7DE0;
    v29 = *(id *)(a1 + 48);
    dispatch_async(v27, v28);
    v26 = v29;
  }

  v12 = 0;
LABEL_27:

}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_301(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_2;
  v4[3] = &unk_1E6CE8080;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v1)
    v3 = *(_QWORD *)(v1 + 56);
  else
    v3 = 0;
  return objc_msgSend(v2, "removeObjectForKey:", v3);
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v2 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6958]), "initForBundleIdentifier:sessionIdentifier:", v2[6], v2[7]);
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_4;
  v5[3] = &unk_1E6CE77C8;
  v6 = v4;
  (*(void (**)(uint64_t, _QWORD *, _QWORD *))(v1 + 16))(v1, v2, v5);

}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
    -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:](*(_QWORD *)(a1 + 32), 0, a3);
}

void __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_5(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;
  void *v3;
  _BYTE *v4;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[32])
  {
    v4 = WeakRetained;
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "Timed out waiting on prompt transaction to begin.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Timed out waiting for authorization transaction to begin."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDObjectAuthorizationPromptSession endPromptTransactionWithSuccess:error:]((uint64_t)v4, 0, v3);

    WeakRetained = v4;
  }

}

uint64_t __104__HDAuthorizationManager_handleObjectAuthorizationRequestsForBundleIdentifier_promptHandler_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchAuthorizationContextForPromptSession:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *activeObjectPromptSessionsBySessionIdentifier;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v63;
  id *v64;
  id obj;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  activeObjectPromptSessionsBySessionIdentifier = self->_activeObjectPromptSessionsBySessionIdentifier;
  v63 = v6;
  objc_msgSend(v6, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](activeObjectPromptSessionsBySessionIdentifier, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v64 = (id *)v9;
  if (!v9)
    goto LABEL_57;
  v10 = *(id *)(v9 + 48);
  objc_msgSend(v63, "bundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (id)v11)
  {

LABEL_7:
    v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = *(id *)(v9 + 16);
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
    if (!v68)
    {
LABEL_53:

      v56 = objc_alloc(MEMORY[0x1E0CB6960]);
      objc_msgSend(v64[2], "firstObject");
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v57;
      if (v57)
        v59 = *(_QWORD *)(v57 + 40);
      else
        v59 = 0;
      v60 = (void *)objc_msgSend(v56, "initWithSamplesRequiringAuthorization:metadata:", v67, v59);

      goto LABEL_62;
    }
    v66 = *(_QWORD *)v75;
LABEL_9:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v66)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v18);
      if (!v19)
      {
        v33 = 0;
        goto LABEL_49;
      }
      v69 = v18;
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v70 = v19;
      v72 = *(id *)(v19 + 48);
      v21 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v83 != v23)
              objc_enumerationMutation(v72);
            v25 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            v26 = objc_alloc(MEMORY[0x1E0CB6970]);
            objc_msgSend(v25, "objectUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sourceUUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "sessionUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v25, "status");
            objc_msgSend(v25, "modificationDate");
            v31 = (void *)objc_msgSend(v26, "initWithObjectUUID:sourceUUID:sessionUUID:status:modificationDate:", v27, v28, v29, v30);

            objc_msgSend(v25, "objectUUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, v32);

          }
          v22 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
        }
        while (v22);
      }

      v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (!*(_BYTE *)(v70 + 8))
        break;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v73 = *(id *)(v70 + 32);
      v34 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
      v18 = v69;
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v79;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v79 != v36)
              objc_enumerationMutation(v73);
            v38 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
            objc_msgSend(v38, "UUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, v38);
            }
            else
            {
              v41 = objc_alloc_init(MEMORY[0x1E0CB6970]);
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v41, v38);

            }
          }
          v35 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
        }
        while (v35);
      }
LABEL_48:

LABEL_49:
      objc_msgSend(v67, "addEntriesFromDictionary:", v33);

      if (++v18 == v68)
      {
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v86, 16);
        v68 = v55;
        if (!v55)
          goto LABEL_53;
        goto LABEL_9;
      }
    }
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v73 = *(id *)(v70 + 32);
    v42 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
    if (!v42)
      goto LABEL_47;
    v43 = v42;
    v71 = *(_QWORD *)v79;
LABEL_34:
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v79 != v71)
        objc_enumerationMutation(v73);
      v45 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v44);
      objc_msgSend(v45, "UUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        break;
      v48 = (void *)v47;
      objc_msgSend(v45, "UUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "status");

      if (!v51)
        goto LABEL_41;
LABEL_45:
      if (v43 == ++v44)
      {
        v43 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v78, v87, 16);
        if (!v43)
        {
LABEL_47:
          v18 = v69;
          goto LABEL_48;
        }
        goto LABEL_34;
      }
    }

LABEL_41:
    objc_msgSend(v45, "UUID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v53, v45);
    }
    else
    {
      v54 = objc_alloc_init(MEMORY[0x1E0CB6970]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v54, v45);

    }
    goto LABEL_45;
  }
  v12 = (void *)v11;
  objc_msgSend(v63, "bundleIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v64[6];
    objc_msgSend(v63, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    v9 = (uint64_t)v64;
    if ((v17 & 1) == 0)
      goto LABEL_57;
    goto LABEL_7;
  }

LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Could not locate prompt session"));
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v61);
    else
      _HKLogDroppedError();
  }

  v60 = 0;
LABEL_62:

  return v60;
}

- (int64_t)objectAuthorizationRecordForSource:(id)a3 objectUUID:(id)a4 resolveAssociations:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  id v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  _QWORD v26[4];
  id v27;
  HDAuthorizationManager *v28;
  id v29;
  id v30;
  BOOL v31;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __98__HDAuthorizationManager_objectAuthorizationRecordForSource_objectUUID_resolveAssociations_error___block_invoke;
  v26[3] = &unk_1E6CFA168;
  v15 = v11;
  v31 = a5;
  v27 = v15;
  v28 = self;
  v16 = v10;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  LODWORD(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDObjectAuthorizationEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v26);

  if (!(_DWORD)a6)
    goto LABEL_11;
  if ((objc_msgSend(v17, "containsObject:", &unk_1E6DFCBA8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E6DFCBC0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v17 == (id)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E6DFCBC0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {

LABEL_11:
        v18 = 0;
        goto LABEL_12;
      }
      v22 = (void *)v21;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E6DFCBC0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v17, "isEqualToSet:", v23);

      if (!v24)
        goto LABEL_11;
    }
    v18 = 2;
    goto LABEL_12;
  }
  v18 = 1;
LABEL_12:

  return v18;
}

BOOL __98__HDAuthorizationManager_objectAuthorizationRecordForSource_objectUUID_resolveAssociations_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  __objc2_class **v14;
  uint64_t v15;
  uint64_t v16;
  __objc2_class *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a1;
  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(v4 + 64))
  {
    v6 = *(_QWORD *)(v4 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v4 + 40) + 48));
    +[HDAssociationEntity associationUUIDsForObjectUUID:subObjectReference:excludeDeleted:profile:error:](HDAssociationEntity, "associationUUIDsForObjectUUID:subObjectReference:excludeDeleted:profile:error:", v6, 0, 1, WeakRetained, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  v9 = *(void **)(v4 + 48);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(v4 + 40) + 48));
  objc_msgSend(v9, "sourceUUIDWithProfile:error:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = v5;
    v12 = v5;
    v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v32)
    {
      v13 = *(_QWORD *)v34;
      v14 = off_1E6CE3000;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
          v17 = v14[444];
          v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(v4 + 40) + 48));
          -[__objc2_class authorizationRecordsBySourceForSampleWithUUID:profile:error:](v17, "authorizationRecordsBySourceForSampleWithUUID:profile:error:", v16, v18, a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", v11);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              v22 = objc_msgSend(v20, "status");
              if (v22)
              {
                v23 = *(void **)(v4 + 56);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
                v24 = v13;
                v25 = v4;
                v26 = a3;
                v27 = v12;
                v28 = v11;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v29);

                v11 = v28;
                v12 = v27;
                a3 = v26;
                v4 = v25;
                v13 = v24;
                v14 = off_1E6CE3000;
              }
            }

          }
          ++v15;
        }
        while (v32 != v15);
        v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v32);
    }

    v5 = v31;
  }

  return v11 != 0;
}

- (void)performObjectAuthorizationForSource:(id)a3 samples:(id)a4 associatedWithSamplesOfType:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void (**v31)(id, _QWORD, id);
  id v32;
  void *v33;
  id v34;
  id v35;
  id *location;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  location = (id *)&self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v44 = 0;
  +[HDObjectAuthorizationEntity authorizationStatusForSamplesOfType:sourceEntity:profile:error:](HDObjectAuthorizationEntity, "authorizationStatusForSamplesOfType:sourceEntity:profile:error:", v12, v10, WeakRetained, &v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v44;

  if (v15)
  {
    v31 = v13;
    v32 = v12;
    v33 = v11;
    v34 = v10;
    v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v30 = v15;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        v22 = v16;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v21);
          if (objc_msgSend(v23, "status") == 2)
          {
            objc_msgSend(v23, "objectUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_loadWeakRetained(location);
            v39 = v22;
            +[HDAssociationEntity objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:](HDAssociationEntity, "objectUUIDsAssociatedWithObjectUUID:subObjectReference:excludeDeleted:profile:error:", v24, 0, 1, v25, &v39);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v39;

            if (v26)
            {
              objc_msgSend(v35, "addObjectsFromArray:", v26);
            }
            else
            {
              _HKInitializeLogging();
              v27 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v24;
                v47 = 2112;
                v48 = v16;
                _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_INFO, "Error looking up samples associated with %@: %@", buf, 0x16u);
              }
            }

            v22 = v16;
          }
          else
          {
            v16 = v22;
          }
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v19);
    }

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __109__HDAuthorizationManager_performObjectAuthorizationForSource_samples_associatedWithSamplesOfType_completion___block_invoke;
    v37[3] = &unk_1E6CEDCE0;
    v38 = v35;
    v28 = v35;
    v11 = v33;
    objc_msgSend(v33, "hk_filter:", v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v31;
    ((void (**)(id, void *, id))v31)[2](v31, v29, 0);

    v10 = v34;
    v12 = v32;
    v15 = v30;
  }
  else
  {
    v13[2](v13, 0, v16);
  }

}

uint64_t __109__HDAuthorizationManager_performObjectAuthorizationForSource_samples_associatedWithSamplesOfType_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)createRecalibrateEstimatesRequestRecordForSource:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  NSObject *queue;
  _QWORD v19[4];
  id v20;
  HDAuthorizationManager *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v15, "clientSourceForSourceEntity:error:", v13, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v25;
  if (v16)
  {
    queue = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __108__HDAuthorizationManager_createRecalibrateEstimatesRequestRecordForSource_sampleType_effectiveDate_handler___block_invoke;
    v19[3] = &unk_1E6CFA0F0;
    v20 = v16;
    v21 = self;
    v24 = v12;
    v22 = v10;
    v23 = v11;
    dispatch_async(queue, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v17);
  }

}

void __108__HDAuthorizationManager_createRecalibrateEstimatesRequestRecordForSource_sampleType_effectiveDate_handler___block_invoke(uint64_t a1)
{
  void **v2;
  id v3;
  void *v4;
  void *v5;
  _HDRecalibrateEstimatesRequestSession *v6;
  id v7;
  _HDRecalibrateEstimatesRequestSession *v8;
  uint64_t v9;
  NSDate *creationDate;
  uint64_t v11;
  id v12;
  objc_super v13;

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:");
  v2 = (void **)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!-[HDAuthorizationManager _isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:](*(void **)(a1 + 40), v2[2]))
    {
      v11 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("An active recalibrate estimates request session already exists."));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v7);
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", 0, v12);
  }
  v3 = objc_alloc(MEMORY[0x1E0CB6AB8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSessionIdentifier:source:sampleType:effectiveDate:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v6 = [_HDRecalibrateEstimatesRequestSession alloc];
  v7 = v5;
  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)_HDRecalibrateEstimatesRequestSession;
    v8 = (_HDRecalibrateEstimatesRequestSession *)objc_msgSendSuper2(&v13, sel_init);
    v6 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_requestRecord, v5);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = objc_claimAutoreleasedReturnValue();
      creationDate = v6->_creationDate;
      v6->_creationDate = (NSDate *)v9;

    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", v6, v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_9:
}

- (void)_isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:(void *)result
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v2 = result;
    v3 = (void *)MEMORY[0x1E0C99D68];
    v4 = a2;
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "requestSessionTimeout");
    objc_msgSend(v4, "dateByAddingTimeInterval:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v5, "hk_isAfterDate:", v6);
    return (void *)v7;
  }
  return result;
}

- (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  HDProfile **p_profile;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  p_profile = &self->_profile;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  +[HDAuthorizationStatus authorizationStatusForTypes:bundleIdentifier:profile:error:](HDAuthorizationStatus, "authorizationStatusForTypes:bundleIdentifier:profile:error:", v9, v8, WeakRetained, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  void *v19;
  int v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v26;
  void *v28;

  v7 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAuthorizationManager.m"), 1439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationStatus != nil"));

  }
  v15 = objc_msgSend(v13, "integerValue");
  v16 = HKAuthorizationStatusAllowsSharing();
  v17 = HKAuthorizationStatusAllowsReading();
  v18 = *MEMORY[0x1E0CB5DF0];
  v28 = v12;
  objc_msgSend(v12, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v14, "arrayEntitlement:containsString:", v18, v19);

  if ((unint64_t)(v15 - 101) < 4)
  {
    if (v7)
      v21 = v16;
    else
      v21 = v17;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
  if (v15 != 100)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAuthorizationManager.m"), 1461, CFSTR("Unexpected authorization status %@"), v13);

LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Not authorized"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v7 || v20 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, CFSTR("Authorization is not determined"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v22 = 0;
    *a7 = v23;
    goto LABEL_16;
  }
LABEL_8:
  v22 = 1;
LABEL_16:

  return v22;
}

- (void)validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HDAuthorizationManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HDAuthorizationManager_validateRecalibrateEstimatesRequestRecord_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __79__HDAuthorizationManager_validateRecalibrateEstimatesRequestRecord_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void **v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", v11);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void **)v3;
  if (v3 && objc_msgSend(*(id *)(v3 + 8), "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setObject:forKeyedSubscript:", 0, v11);
    v5 = -[HDAuthorizationManager _isRecalibrateEstimatesRequestSessionExpiredWithCreationDate:](*(void **)(a1 + 40), v4[2]);
    v6 = *(_QWORD *)(a1 + 48);
    if (!v5)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Recalibrate estimates request session timed out.");
    v9 = 103;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Recalibrate estimates request record validation failed.");
    v9 = 3;
  }
  objc_msgSend(v7, "hk_error:description:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v10);

LABEL_7:
}

- (id)diagnosticDescription
{
  void *v3;
  _HDAuthorizationRequestGroup *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_promptingRequestGroup;
  if (v4)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Prompting request group:"));
    objc_msgSend(v3, "appendFormat:", CFSTR("\n%@\n\n"), v4);
  }
  v5 = (void *)-[NSMutableArray copy](self->_pendingRequestGroups, "copy");
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Pending request groups:"));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          -[_HDAuthorizationRequestGroup bundleIdentifier](v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v13 = objc_msgSend(v11[4], "count");
          else
            v13 = 0;
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\"%@\" (%lu requests)"), v12, v13, (_QWORD)v16);

          ++v10;
        }
        while (v8 != v10);
        v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v8 = v14;
      }
      while (v14);
    }

    objc_msgSend(v3, "appendFormat:", CFSTR("\n\n"));
  }

  return v3;
}

- (id)_schemaProviderForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HDDefaultAuthorizationSchemaProvider *v7;
  HDDefaultAuthorizationSchemaProvider *v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_schemaProviderMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(HDDefaultAuthorizationSchemaProvider);
  v8 = v7;

  return v8;
}

- (id)unitTest_schemaProviderMap
{
  return self->_schemaProviderMap;
}

- (int64_t)isClientAuthorizedToReadObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "hd_sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAuthorizationManager _schemaProviderForType:](self, "_schemaProviderForType:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v17, "isClientAuthorizedToReadObject:sourceBundleIdentifier:clientEntitlements:profile:error:", v12, v13, v14, v15, a7);
  else
    v18 = 0;

  return v18;
}

- (int64_t)isClientAuthorizedToReadType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int64_t v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HDAuthorizationManager _schemaProviderForType:](self, "_schemaProviderForType:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v16, "isClientAuthorizedToReadType:sourceBundleIdentifier:clientEntitlements:profile:error:", v12, v13, v14, v15, a7);
  else
    v17 = 0;

  return v17;
}

- (int64_t)isClientAuthorizedToWriteObject:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "hd_sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAuthorizationManager _schemaProviderForType:](self, "_schemaProviderForType:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = objc_msgSend(v17, "isClientAuthorizedToWriteObject:sourceBundleIdentifier:clientEntitlements:profile:error:", v12, v13, v14, v15, a7);
  else
    v18 = 0;

  return v18;
}

- (int64_t)isClientAuthorizedToWriteType:(id)a3 sourceBundleIdentifier:(id)a4 clientEntitlements:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int64_t v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HDAuthorizationManager _schemaProviderForType:](self, "_schemaProviderForType:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = objc_msgSend(v16, "isClientAuthorizedToWriteType:sourceBundleIdentifier:clientEntitlements:profile:error:", v12, v13, v14, v15, a7);
  else
    v17 = 0;

  return v17;
}

- (BOOL)suppressAuthorizationPrompt
{
  return self->_suppressAuthorizationPrompt;
}

- (void)setSuppressAuthorizationPrompt:(BOOL)a3
{
  self->_suppressAuthorizationPrompt = a3;
}

- (double)requestSessionTimeout
{
  return self->_requestSessionTimeout;
}

- (void)setRequestSessionTimeout:(double)a3
{
  self->_requestSessionTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRecalibrateEstimatesRequestSessionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeObjectPromptSessionsBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingObjectAuthorizationRequestsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_promptingRequestGroup, 0);
  objc_storeStrong((id *)&self->_pendingRequestGroups, 0);
  objc_storeStrong((id *)&self->_requestGroupsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_schemaProviderMap, 0);
  objc_storeStrong((id *)&self->_remoteAuthorizationRecordsByBundleID, 0);
  objc_storeStrong((id *)&self->_openAppCompletionHandlersByBundleID, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

- (id)_builtInSchemas
{
  HDVisionPrescriptionAuthorizationSchemaProvider *v2;
  void *v3;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDVisionPrescriptionAuthorizationSchemaProvider);
  v5 = &unk_1E6DFE468;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
