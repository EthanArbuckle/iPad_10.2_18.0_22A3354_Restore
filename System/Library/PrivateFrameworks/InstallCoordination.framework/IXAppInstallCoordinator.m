@implementation IXAppInstallCoordinator

- (IXAppInstallCoordinator)initWithSeed:(id)a3
{
  id v5;
  IXAppInstallCoordinator *v6;
  IXAppInstallCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXAppInstallCoordinator;
  v6 = -[IXAppInstallCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_seed, a3);

  return v7;
}

- (OS_dispatch_queue)observerCalloutQueue
{
  if (observerCalloutQueue_onceToken != -1)
    dispatch_once(&observerCalloutQueue_onceToken, &__block_literal_global_0);
  return (OS_dispatch_queue *)(id)observerCalloutQueue_sObserverCalloutQueue;
}

void __47__IXAppInstallCoordinator_observerCalloutQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.installcoordination.coordinator_observer", v2);
  v1 = (void *)observerCalloutQueue_sObserverCalloutQueue;
  observerCalloutQueue_sObserverCalloutQueue = (uint64_t)v0;

}

- (OS_dispatch_queue)internalQueue
{
  if (internalQueue_onceToken != -1)
    dispatch_once(&internalQueue_onceToken, &__block_literal_global_3);
  return (OS_dispatch_queue *)(id)internalQueue_sInternalQueue;
}

void __40__IXAppInstallCoordinator_internalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.installcoordination.coordinator_internal", v2);
  v1 = (void *)internalQueue_sInternalQueue;
  internalQueue_sInternalQueue = (uint64_t)v0;

}

- (void)_conveyCurrentPriorityBoostReplacingExisting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke;
  v14[3] = &unk_1E4DC4020;
  objc_copyWeak(&v16, &location);
  v8 = v5;
  v15 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_6;
  v11[3] = &unk_1E4DC4020;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:conveyPriorityReplacingExisting:withCompletion:", v10, v3, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136315906;
    v8 = "-[IXAppInstallCoordinator _conveyCurrentPriorityBoostReplacingExisting:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = WeakRetained;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to convey priority boost for coordinator UUID %@ : %@ : %@", (uint8_t *)&v7, 0x2Au);
  }

}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator _conveyCurrentPriorityBoostReplacingExisting:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_ERROR, "%s: Got error in priority boost conveyance completion block for coordinator UUID %@ : %@ : %@", (uint8_t *)&v8, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_6_cold_1();
  }

}

- (void)_updateInitWithSeed:(id)a3 notifyDaemon:(BOOL)a4
{
  _BOOL8 v4;
  IXAppInstallCoordinatorSeed *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  IXAppInstallCoordinatorSeed *seed;
  IXAppInstallCoordinatorSeed *v13;
  id v14;

  v4 = a4;
  v6 = (IXAppInstallCoordinatorSeed *)a3;
  if (!-[IXAppInstallCoordinatorSeed creator](v6, "creator")
    || (-[IXAppInstallCoordinatorSeed uniqueIdentifier](v6, "uniqueIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    v10 = -[IXAppInstallCoordinatorSeed creator](v6, "creator");
    -[IXAppInstallCoordinatorSeed uniqueIdentifier](v6, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Expected client and uniqueID to be initialized but instead got %lu %@"), v10, v11);

  }
  seed = self->_seed;
  self->_seed = v6;
  v13 = v6;

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "registerAppInstallCoordinatorForUpdates:notifyDaemon:", self, v4);
}

- (void)dealloc
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_DEBUG, "%s: %@: Skipping unregistering with daemon because not currently registered", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_12();
}

+ (void)setSkipIntentValidation:(BOOL)a3
{
  gSkipIntentValidation = a3;
}

+ (BOOL)skipIntentValidation
{
  return gSkipIntentValidation;
}

+ (BOOL)modifiesLocalLaunchServicesDatabase
{
  return 1;
}

+ (unint64_t)intent
{
  return 0;
}

+ (void)_validatePreconditionForIntent:(unint64_t)a3 matchesCurrentInstallStateForBundleID:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  const char *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (!objc_msgSend(a1, "skipIntentValidation"))
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
    v7 = v9;
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      -[NSObject applicationState](v9, "applicationState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isInstalled");
      v13 = -[NSObject isPlaceholder](v7, "isPlaceholder");
      v14 = -[NSObject hasParallelPlaceholder](v7, "hasParallelPlaceholder");
      v15 = 78;
      if (v14)
        v16 = 89;
      else
        v16 = 78;
      if (v13)
        v17 = 89;
      else
        v17 = 78;
      if (v12)
        v15 = 89;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("isInstalled:%c isPlaceholder:%c hasParallelPlaceholder:%c"), v15, v17, v16);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("No record found");
    }
    switch(a3)
    {
      case 1uLL:
      case 3uLL:
      case 4uLL:
        if (v7 && (-[NSObject isPlaceholder](v7, "isPlaceholder") & 1) == 0)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            goto LABEL_36;
          _StringForIXCoordinatorIntent(a3);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
          v23 = 2112;
          v24 = v19;
          v25 = 2112;
          v26 = v6;
          v27 = 2112;
          v28 = v8;
          v20 = "%s: Warning: client is attempting to create a coordinator of type %@ for %@, but the app is already installed! (%@)";
          goto LABEL_27;
        }
        break;
      case 2uLL:
      case 6uLL:
        if (!v7 || -[NSObject isPlaceholder](v7, "isPlaceholder"))
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            _StringForIXCoordinatorIntent(a3);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
            v23 = 2112;
            v24 = v19;
            v25 = 2112;
            v26 = v6;
            v27 = 2112;
            v28 = v8;
            v20 = "%s: Warning: client is attempting to create a coordinator of type %@ for %@, but the app is not curren"
                  "tly installed! (%@)";
LABEL_27:
            _os_log_fault_impl(&dword_1A4BF6000, v18, OS_LOG_TYPE_FAULT, v20, buf, 0x2Au);

          }
          goto LABEL_36;
        }
        break;
      case 5uLL:
        if (!v7)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:].cold.2();
          goto LABEL_36;
        }
        if ((-[NSObject isPlaceholder](v7, "isPlaceholder") & 1) == 0)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:].cold.3((uint64_t)v6, (uint64_t)v8, v18);
          goto LABEL_36;
        }
        break;
      case 7uLL:
        goto LABEL_37;
      default:
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          +[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:].cold.1(a3, v18);
LABEL_36:

        break;
    }
    goto LABEL_37;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), a3);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4DC49D0[a3];
    }
    *(_DWORD *)buf = 136315650;
    v22 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Skipping intent validation for bundle ID %@ with intent %@", buf, 0x20u);
LABEL_37:

  }
}

+ (id)_coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 intent:(unint64_t)a6 createIfNotExisting:(BOOL)a7 requireMatchingIntent:(BOOL)a8 scopeRequirement:(unsigned __int8)a9 created:(BOOL *)a10 error:(id *)a11
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v31;
  id v32;
  void *v33;
  unint64_t v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  _QWORD v41[9];
  BOOL v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _DWORD v64[12];
  uint64_t v65;

  v11 = a8;
  v12 = a7;
  v65 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  if (!v17)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]", 272, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Expected a non-nil application identity"), v27, v38);
    v28 = objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    v29 = (void *)v45[5];
    v45[5] = v28;
    goto LABEL_13;
  }
  v40 = a1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke;
  v43[3] = &unk_1E4DC4048;
  v43[4] = &v50;
  v43[5] = &v44;
  objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v43);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v21 = 0;
    goto LABEL_15;
  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setCreator:", a5);
  objc_msgSend(v21, "setIntent:", a6);
  objc_msgSend(v21, "setIdentity:", v17);
  objc_msgSend(v21, "setInstallationDomain:", a4);
  v41[0] = v19;
  v41[1] = 3221225472;
  v41[2] = __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_20;
  v41[3] = &unk_1E4DC4070;
  v41[4] = &v44;
  v41[5] = &v50;
  v42 = v11;
  v41[6] = &v58;
  v41[7] = &v54;
  v41[8] = a6;
  objc_msgSend(v20, "_remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:", v21, v12, v11, a9, v41);
  if (*((_BYTE *)v51 + 24))
    goto LABEL_15;
  if (*((_BYTE *)v55 + 24))
  {
    objc_msgSend(v17, "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:", a6, v22);

  }
  v23 = (objc_class *)objc_msgSend(v40, "classForIntent:", objc_msgSend((id)v59[5], "intent"));
  if (!v23)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      _StringForIXCoordinatorIntent(objc_msgSend((id)v59[5], "intent"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v59[5], "identity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:].cold.2(v32, v33, v64);
    }

    v34 = objc_msgSend((id)v59[5], "intent");
    if (v34 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E4DC49D0[v34];
    }
    objc_msgSend((id)v59[5], "identity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]", 320, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to find class for coordinator intent %@ for coordinator %@"), v36, (uint64_t)v35);
    v37 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v45[5];
    v45[5] = v37;
LABEL_13:

    goto LABEL_15;
  }
  v24 = objc_alloc_init(v23);
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "_updateInitWithSeed:notifyDaemon:", v59[5], 0);
    objc_msgSend(v25, "_conveyCurrentPriorityBoostReplacingExisting:", *((unsigned __int8 *)v55 + 24));
    objc_msgSend(v25, "setIsRegisteredWithDaemon:", 1);
    if (a10)
      *a10 = *((_BYTE *)v55 + 24);
    goto LABEL_17;
  }
LABEL_15:
  v25 = 0;
  if (a11)
    *a11 = objc_retainAutorelease((id)v45[5]);
LABEL_17:

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

  return v25;
}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:create"
         "IfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_20(uint64_t a1, void *a2, char a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v8 = a2;
  v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (*(_BYTE *)(a1 + 72) && (v10 = *(_QWORD *)(a1 + 64), v10 != objc_msgSend(v8, "intent")))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_20_cold_1(a1 + 64, v8);

    v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "intent");
    _CreateError((uint64_t)"+[IXAppInstallCoordinator _coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:]_block_invoke", 298, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Expected to create coordinator with intent %lu but created object had intent %lu"), v13, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  }

}

+ (id)coordinatorForAppWithBundleID:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  uint64_t v13;
  uint64_t v14;
  IXApplicationIdentity *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v9 = a5;
  v12 = a3;
  v13 = objc_msgSend((id)objc_opt_class(), "intent");
  if (v13)
  {
    v14 = v13;
    v15 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v12);
    LOBYTE(v22) = 2;
    objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v15, 1, a4, v14, v9, 1, v22, a6, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]", 353, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("%s must be called on a concrete subclass, not the abstract superclass"), v18, (uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a7)
      *a7 = objc_retainAutorelease(v19);

    v16 = 0;
  }

  return v16;
}

+ (id)existingCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  IXApplicationIdentity *v7;
  void *v8;

  v6 = a3;
  v7 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v6);

  objc_msgSend(a1, "existingCoordinatorForAppWithIdentity:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)coordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return (id)objc_msgSend(a1, "coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:", a3, 1, a4, a5, a6, a7);
}

+ (id)coordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v10 = a6;
  v14 = a3;
  v15 = objc_msgSend((id)objc_opt_class(), "intent");
  if (v15)
  {
    LOBYTE(v22) = 2;
    objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v14, a4, a5, v15, v10, 1, v22, a7, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]", 379, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("%s must be called on concrete subclasses, not the abstract superclass"), v18, (uint64_t)"+[IXAppInstallCoordinator coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a8)
      *a8 = objc_retainAutorelease(v19);

    v16 = 0;
  }

  return v16;
}

+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 withClientID:(unint64_t)a4 createIfNotExisting:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return (id)objc_msgSend(a1, "processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:", a3, 1, a4, a5, a6, a7);
}

+ (id)processScopedCoordinatorForAppWithIdentity:(id)a3 targetingInstallationDomain:(unint64_t)a4 withClientID:(unint64_t)a5 createIfNotExisting:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v10 = a6;
  v14 = a3;
  v15 = objc_msgSend((id)objc_opt_class(), "intent");
  if (v15)
  {
    LOBYTE(v22) = 1;
    objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v14, a4, a5, v15, v10, 1, v22, a7, a8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]", 398, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("%s must be called on a concrete subclass, not the abstract superclass"), v18, (uint64_t)"+[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a8)
      *a8 = objc_retainAutorelease(v19);

    v16 = 0;
  }

  return v16;
}

+ (id)existingCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v10;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "intent") != 0;
  LOBYTE(v10) = 0;
  objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v6, 1, 0, objc_msgSend((id)objc_opt_class(), "intent"), 0, v7, v10, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)enumerateCoordinatorsWithBlock:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "enumerateCoordinatorsWithError:usingBlock:", a4, a3);
}

+ (BOOL)enumerateCoordinatorsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = objc_msgSend(a1, "_synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:", objc_msgSend((id)objc_opt_class(), "intent"), a3, v6);

  return (char)a3;
}

+ (void)enumerateCoordinatorsUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "_asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:", objc_msgSend((id)objc_opt_class(), "intent"), v4);

}

+ (Class)classForIntent:(unint64_t)a3
{
  NSObject *v4;
  Class result;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      objc_opt_class();
      result = (Class)(id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315394;
        v7 = "+[IXAppInstallCoordinator classForIntent:]";
        v8 = 2048;
        v9 = a3;
        _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: No class for intent %lu", (uint8_t *)&v6, 0x16u);
      }

      result = (Class)0;
      break;
  }
  return result;
}

+ (void)_asynchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;
  id v12;

  v6 = a4;
  IXQueueForConcurrentOperations();
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke;
  v9[3] = &unk_1E4DC4188;
  v10 = v6;
  v11 = a3;
  v12 = a1;
  v8 = v6;
  IXDispatchAsyncWithAutoreleasePool(v7, v9);

}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2;
  v12[3] = &unk_1E4DC40C0;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_39;
    v8[3] = &unk_1E4DC4160;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v11 = v7;
    v9 = v4;
    objc_msgSend(v9, "_remote_fetchSeedsForCoordinatorsWithIntent:completion:", v5, v8);

  }
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke_2";
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", buf, 0x16u);
  }

  IXQueueForConcurrentOperations();
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_38;
  v8[3] = &unk_1E4DC4098;
  v6 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  IXDispatchAsyncWithAutoreleasePool(v5, v8);

}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IXQueueForConcurrentOperations();
    v7 = objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3;
    v28[3] = &unk_1E4DC4098;
    v30 = *(id *)(a1 + 40);
    v29 = v6;
    IXDispatchAsyncWithAutoreleasePool(v7, v28);

    v8 = v30;
  }
  else if (objc_msgSend(v5, "count"))
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v20 = 0;
    v21 = (id *)&v20;
    v22 = 0x3042000000;
    v23 = __Block_byref_object_copy__40;
    v24 = __Block_byref_object_dispose__41;
    v25 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42;
    v14[3] = &unk_1E4DC4138;
    v18 = &v20;
    v17 = *(id *)(a1 + 40);
    v8 = v9;
    v10 = *(_QWORD *)(a1 + 48);
    v15 = v8;
    v19 = v10;
    v16 = *(id *)(a1 + 32);
    v11 = (void *)objc_msgSend(v14, "copy");
    objc_storeWeak(v21 + 5, v11);
    IXQueueForConcurrentOperations();
    v12 = objc_claimAutoreleasedReturnValue();
    IXDispatchAsyncWithAutoreleasePool(v12, v11);

    _Block_object_dispose(&v20, 8);
    objc_destroyWeak(&v25);
  }
  else
  {
    IXQueueForConcurrentOperations();
    v13 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4;
    v26[3] = &unk_1E4DC3E68;
    v27 = *(id *)(a1 + 40);
    IXDispatchAsyncWithAutoreleasePool(v13, v26);

    v8 = v27;
  }

}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  id v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
      v4 = (objc_class *)objc_msgSend(*(id *)(a1 + 64), "classForIntent:", objc_msgSend(v3, "intent"));
      if (v4)
      {
        v5 = (id)objc_msgSend([v4 alloc], "initWithSeed:", v3);
        if (v5)
        {
          v6 = *(void **)(a1 + 40);
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3_53;
          v34[3] = &unk_1E4DC4110;
          v35 = v3;
          v7 = *(id *)(a1 + 48);
          v8 = *(_QWORD *)(a1 + 64);
          v38 = v7;
          v40 = v8;
          v5 = v5;
          v36 = v5;
          v37 = *(id *)(a1 + 32);
          v39 = WeakRetained;
          objc_msgSend(v6, "_remote_createAppInstallCoordinatorWithSeed:createIfNotExisting:requireMatchingIntent:scopeRequirement:completion:", v35, 0, 1, 0, v34);

          v9 = v35;
        }
        else
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_4();

          _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 533, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to create coordinator object"), v24, v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          IXQueueForConcurrentOperations();
          v26 = objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_52;
          v41[3] = &unk_1E4DC4098;
          v27 = *(id *)(a1 + 48);
          v42 = v25;
          v43 = v27;
          v9 = v25;
          IXDispatchAsyncWithAutoreleasePool(v26, v41);

        }
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_3(v3);

        v21 = objc_msgSend(v3, "intent");
        if (v21 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v21);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = off_1E4DC49D0[v21];
        }
        objc_msgSend(v3, "identity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 524, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to find class for coordinator intent %@ for coordinator %@"), v28, (uint64_t)v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        IXQueueForConcurrentOperations();
        v30 = objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_49;
        v44[3] = &unk_1E4DC4098;
        v31 = *(id *)(a1 + 48);
        v45 = v29;
        v46 = v31;
        v5 = v29;
        IXDispatchAsyncWithAutoreleasePool(v30, v44);

        v9 = v46;
      }
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_2();

      _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 513, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to get next seed while enumerating install coordinators"), v16, v32);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IXQueueForConcurrentOperations();
      v18 = objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_48;
      v47[3] = &unk_1E4DC4098;
      v19 = *(id *)(a1 + 48);
      v48 = v17;
      v49 = v19;
      v5 = v17;
      IXDispatchAsyncWithAutoreleasePool(v18, v47);

      v9 = v49;
    }

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 504, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Async enumeration block reference somehow became nil while enumerating install coordinators"), v11, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IXQueueForConcurrentOperations();
    v13 = objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_45;
    v50[3] = &unk_1E4DC4098;
    v14 = *(id *)(a1 + 48);
    v51 = v12;
    v52 = v14;
    v3 = v12;
    IXDispatchAsyncWithAutoreleasePool(v13, v50);

    v5 = v52;
  }

}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_2_52(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_3_53(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;

  v7 = a2;
  v8 = a4;
  IXQueueForConcurrentOperations();
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_54;
  v13[3] = &unk_1E4DC40E8;
  v14 = v8;
  v15 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 56);
  v22 = a3;
  v21 = *(_QWORD *)(a1 + 72);
  v19 = v10;
  v16 = v7;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 64);
  v11 = v7;
  v12 = v8;
  IXDispatchAsyncWithAutoreleasePool(v9, v13);

}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_54(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("IXErrorDomain")))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v4 == 5)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "identity");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke_4";
          v31 = 2112;
          v32 = v6;
          v7 = "%s: When enumerating coordinators, existing coordinator for %@ had a different intent than expected (likely recreated)";
LABEL_15:
          _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);
LABEL_26:

          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("IXErrorDomain")))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v14 == 6)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "identity");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
          v31 = 2112;
          v32 = v6;
          v7 = "%s: When enumerating coordinators, coordinator for %@ no longer existed when we tried to fetch it";
          goto LABEL_15;
        }
LABEL_27:

LABEL_28:
        if (objc_msgSend(*(id *)(a1 + 64), "count"))
        {
          IXQueueForConcurrentOperations();
          v27 = objc_claimAutoreleasedReturnValue();
          IXDispatchAsyncWithAutoreleasePool(v27, *(void **)(a1 + 80));

          return;
        }
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
          _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: Enumeration complete; calling client block to signal",
            buf,
            0xCu);
        }
        goto LABEL_32;
      }
    }
    else
    {

    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, got unexpected error when trying to fetch coordinator for %@ : %@", buf, 0x20u);

    }
LABEL_32:

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    return;
  }
  if (*(_BYTE *)(a1 + 96))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_54_cold_1(a1, v8);

    objc_msgSend(*(id *)(a1 + 40), "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke", 559, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Unexpectedly created coordinator for %@ while enumerating; canceling it"),
      v10,
      (uint64_t)v9);
    v5 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelCoordinatorForAppWithIdentity:withReason:client:error:", v12, v5, 15, 0);

    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
      v31 = 2112;
      v32 = v6;
      v33 = 2112;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Got back a different coordinator for %@ than fetched originally; got %@ expected %@ (likely recreated in the meantime)",
        buf,
        0x2Au);

      goto LABEL_26;
    }
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 56), "_updateInitWithSeed:notifyDaemon:", *(_QWORD *)(a1 + 48), 0);
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 56), "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(*(id *)(a1 + 48), "intent");
    if (v23 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E4DC49D0[v23];
    }
    *(_DWORD *)buf = 136315650;
    v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
    v31 = 2112;
    v32 = v22;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: Enumeration is calling client block with coordinator for %@ intent %@", buf, 0x20u);

  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))() & 1) != 0)
    goto LABEL_28;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "+[IXAppInstallCoordinator _asynchronouslyEnumerateCoordinatorsForIntent:usingBlock:]_block_invoke";
    _os_log_impl(&dword_1A4BF6000, v28, OS_LOG_TYPE_DEFAULT, "%s: Client returned NO from enumeration block so we're stopping", buf, 0xCu);
  }

}

+ (BOOL)_synchronouslyEnumerateCoordinatorsForIntent:(unint64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  unint64_t v24;
  __CFString *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t *v39;
  __CFString *v40;
  NSObject *v41;
  uint64_t v43;
  id obj;
  uint64_t (**v46)(id, void *);
  void *v47;
  uint64_t v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[6];
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  __CFString *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v46 = (uint64_t (**)(id, void *))a5;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy_;
  v67 = __Block_byref_object_dispose_;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke;
  v56[3] = &unk_1E4DC41B0;
  v56[4] = &v63;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v56);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47
    || (v55[0] = v7,
        v55[1] = 3221225472,
        v55[2] = __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke_58,
        v55[3] = &unk_1E4DC41D8,
        v55[4] = &v63,
        v55[5] = &v57,
        objc_msgSend(v47, "_remote_fetchSeedsForCoordinatorsWithIntent:completion:", a3, v55),
        v64[5]))
  {
LABEL_3:
    LOBYTE(v8) = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v64[5]);
    goto LABEL_49;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = (id)v58[5];
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
  if (!v9)
  {
LABEL_43:

    goto LABEL_46;
  }
  v48 = *(_QWORD *)v52;
LABEL_8:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v52 != v48)
      objc_enumerationMutation(obj);
    v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
    v11 = (void *)MEMORY[0x1A85A5738]();
    objc_msgSend(v10, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "installationDomain");
    v14 = objc_msgSend(v10, "creator");
    v15 = objc_msgSend(v10, "intent");
    v50 = 0;
    LOBYTE(v43) = 0;
    objc_msgSend(a1, "_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:", v12, v13, v14, v15, 0, 1, v43, 0, &v50);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)v50;

    if (!v16)
    {
      -[__CFString domain](v17, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "isEqualToString:", CFSTR("IXErrorDomain")))
      {
        v27 = -[__CFString code](v17, "code") == 5;

        if (v27)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "identity");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
            v71 = 2112;
            v72 = v28;
            _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, existing coordinator for %@ had a different intent than expected (likely recreated)", buf, 0x16u);

          }
          goto LABEL_22;
        }
      }
      else
      {

      }
      -[__CFString domain](v17, "domain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v34, "isEqualToString:", CFSTR("IXErrorDomain")))
      {

LABEL_29:
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "identity");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
          v71 = 2112;
          v72 = v38;
          v73 = 2112;
          v74 = v17;
          _os_log_impl(&dword_1A4BF6000, v37, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, got unexpected error when trying to fetch coordinator for %@ : %@", buf, 0x20u);

        }
        v39 = v64;
        v40 = v17;
        v33 = 0;
        v21 = v39[5];
        v39[5] = (uint64_t)v40;
        v32 = 2;
        goto LABEL_39;
      }
      v35 = -[__CFString code](v17, "code") == 6;

      if (!v35)
        goto LABEL_29;
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "identity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
        v71 = 2112;
        v72 = v36;
        _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: When enumerating coordinators, coordinator for %@ no longer existed when we tried to fetch it", buf, 0x16u);

      }
      goto LABEL_22;
    }
    objc_msgSend(v16, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v22)
      {
        objc_msgSend(v10, "identity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uniqueIdentifier");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
        v71 = 2112;
        v72 = v29;
        v73 = 2112;
        v74 = v30;
        v75 = 2112;
        v76 = v31;
        _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: Got back a different coordinator for %@ than fetched originally; got %@ expected %@ (likely recreated in the meantime)",
          buf,
          0x2Au);

      }
LABEL_22:
      v32 = 0;
      v33 = 1;
      goto LABEL_39;
    }
    if (v22)
    {
      objc_msgSend(v16, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v10, "intent");
      if (v24 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown intent value %lu"), v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = off_1E4DC49D0[v24];
      }
      *(_DWORD *)buf = 136315650;
      v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      v71 = 2112;
      v72 = v23;
      v73 = 2112;
      v74 = v25;
      _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: Enumeration is calling client block with coordinator for %@ intent %@", buf, 0x20u);

    }
    if ((v46[2](v46, v16) & 1) != 0)
    {
      v32 = 0;
      v33 = 1;
      goto LABEL_40;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      _os_log_impl(&dword_1A4BF6000, v21, OS_LOG_TYPE_DEFAULT, "%s: Client returned NO from enumeration block so we're stopping", buf, 0xCu);
    }
    v33 = 0;
    v32 = 3;
LABEL_39:

LABEL_40:
    objc_autoreleasePoolPop(v11);
    if (!v33)
      break;
    if (v9 == ++v8)
    {
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
      if (v9)
        goto LABEL_8;
      goto LABEL_43;
    }
  }

  if (v32 == 2)
    goto LABEL_3;
  if (v32 == 3)
  {
LABEL_46:
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v70 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]";
      _os_log_impl(&dword_1A4BF6000, v41, OS_LOG_TYPE_DEFAULT, "%s: Enumeration complete", buf, 0xCu);
    }

    LOBYTE(v8) = 1;
  }
LABEL_49:

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v8 & 1;
}

void __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator _synchronouslyEnumerateCoordinatorsForIntent:error:usingBlock:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __89__IXAppInstallCoordinator__synchronouslyEnumerateCoordinatorsForIntent_error_usingBlock___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

+ (BOOL)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  IXApplicationIdentity *v12;

  v10 = a4;
  v11 = a3;
  v12 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v11);

  LOBYTE(a6) = objc_msgSend(a1, "cancelCoordinatorForAppWithIdentity:withReason:client:error:", v12, v10, a5, a6);
  return (char)a6;
}

+ (void)cancelCoordinatorForAppWithBundleID:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  IXApplicationIdentity *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v12);

  objc_msgSend(a1, "cancelCoordinatorForAppWithIdentity:withReason:client:completion:", v13, v11, a5, v10);
}

+ (BOOL)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  _CheckCancelRequestSanity(v10, a5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v22[5];
  v22[5] = v11;

  v13 = (void *)v22[5];
  if (v13)
  {
    v14 = 0;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke;
    v20[3] = &unk_1E4DC41B0;
    v20[4] = &v21;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke_59;
    v19[3] = &unk_1E4DC4200;
    v19[4] = &v21;
    objc_msgSend(v17, "_remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:", v9, v10, a5, v19);

    v13 = (void *)v22[5];
    v14 = v13 == 0;
    if (!a6)
      goto LABEL_7;
  }
  if (!v14)
    *a6 = objc_retainAutorelease(v13);
LABEL_7:
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:withReason:client:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __87__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_error___block_invoke_59(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (!v5 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireDatabase");

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

+ (void)cancelCoordinatorForAppWithIdentity:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, void *);
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, void *);
  _QWORD v19[4];
  void (**v20)(id, void *);

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  _CheckCancelRequestSanity(v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke;
    v19[3] = &unk_1E4DC40C0;
    v15 = v11;
    v20 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke_62;
    v17[3] = &unk_1E4DC4228;
    v18 = v15;
    objc_msgSend(v16, "_remote_cancelCoordinatorForAppWithIdentity:reason:client:completion:", v9, v10, a5, v17);

  }
}

void __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator cancelCoordinatorForAppWithIdentity:withReason:client:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__IXAppInstallCoordinator_cancelCoordinatorForAppWithIdentity_withReason_client_completion___block_invoke_62(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireDatabase");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;

  v10 = a4;
  +[IXApplicationIdentity identitiesForBundleIdentifiers:](IXApplicationIdentity, "identitiesForBundleIdentifiers:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(a1, "cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:error:", v11, v10, a5, a6);

  return (char)a6;
}

+ (void)cancelCoordinatorsForAppsWithBundleIDs:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  +[IXApplicationIdentity identitiesForBundleIdentifiers:](IXApplicationIdentity, "identitiesForBundleIdentifiers:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:completion:", v12, v11, a5, v10);

}

+ (BOOL)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  _CheckCancelRequestSanity(v10, a5);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v22[5];
  v22[5] = v11;

  v13 = (void *)v22[5];
  if (v13)
  {
    v14 = 0;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke;
    v20[3] = &unk_1E4DC41B0;
    v20[4] = &v21;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke_63;
    v19[3] = &unk_1E4DC4200;
    v19[4] = &v21;
    objc_msgSend(v17, "_remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:", v9, v10, a5, v19);

    v13 = (void *)v22[5];
    v14 = v13 == 0;
    if (!a6)
      goto LABEL_7;
  }
  if (!v14)
    *a6 = objc_retainAutorelease(v13);
LABEL_7:
  _Block_object_dispose(&v21, 8);

  return v14;
}

void __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __102__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_error___block_invoke_63(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (!v5 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireDatabase");

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

+ (void)cancelCoordinatorsForAppsWithApplicationIdentities:(id)a3 withReason:(id)a4 client:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, void *);
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, void *);
  _QWORD v19[4];
  void (**v20)(id, void *);

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  _CheckCancelRequestSanity(v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke;
    v19[3] = &unk_1E4DC40C0;
    v15 = v11;
    v20 = v15;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke_64;
    v17[3] = &unk_1E4DC4228;
    v18 = v15;
    objc_msgSend(v16, "_remote_cancelCoordinatorsForAppsWithIdentities:reason:client:completion:", v9, v10, a5, v17);

  }
}

void __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator cancelCoordinatorsForAppsWithApplicationIdentities:withReason:client:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __107__IXAppInstallCoordinator_cancelCoordinatorsForAppsWithApplicationIdentities_withReason_client_completion___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireDatabase");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)pauseCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  IXApplicationIdentity *v7;

  v6 = a3;
  v7 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v6);

  LOBYTE(a4) = objc_msgSend(a1, "pauseCoordinatorForAppWithIdentity:error:", v7, a4);
  return (char)a4;
}

+ (void)pauseCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IXApplicationIdentity *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(a1, "pauseCoordinatorForAppWithIdentity:completion:", v8, v6);
}

+ (BOOL)pauseCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke_65;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v8, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 1, v5, v12);
  v9 = (void *)v15[5];
  if (a4 && v9)
  {
    *a4 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator pauseCoordinatorForAppWithIdentity:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __68__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_error___block_invoke_65(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)pauseCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E4DC40C0;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 1, v6, v8);
}

void __73__IXAppInstallCoordinator_pauseCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator pauseCoordinatorForAppWithIdentity:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)resumeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  IXApplicationIdentity *v7;

  v6 = a3;
  v7 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v6);

  LOBYTE(a4) = objc_msgSend(a1, "resumeCoordinatorForAppWithIdentity:error:", v7, a4);
  return (char)a4;
}

+ (void)resumeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IXApplicationIdentity *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(a1, "resumeCoordinatorForAppWithIdentity:completion:", v8, v6);
}

+ (BOOL)resumeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke_66;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v8, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 0, v5, v12);
  v9 = (void *)v15[5];
  if (a4 && v9)
  {
    *a4 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator resumeCoordinatorForAppWithIdentity:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_error___block_invoke_66(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)resumeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E4DC40C0;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_remote_setIsPaused:forCoordinatorForAppWithIdentity:completion:", 0, v6, v8);
}

void __74__IXAppInstallCoordinator_resumeCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator resumeCoordinatorForAppWithIdentity:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)prioritizeCoordinatorForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  IXApplicationIdentity *v7;

  v6 = a3;
  v7 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v6);

  LOBYTE(a4) = objc_msgSend(a1, "prioritizeCoordinatorForAppWithIdentity:error:", v7, a4);
  return (char)a4;
}

+ (void)prioritizeCoordinatorForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IXApplicationIdentity *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(a1, "prioritizeCoordinatorForAppWithIdentity:completion:", v8, v6);
}

+ (BOOL)prioritizeCoordinatorForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke_67;
  v12[3] = &unk_1E4DC4200;
  v12[4] = &v14;
  objc_msgSend(v8, "_remote_prioritizeCoordinatorForAppWithIdentity:completion:", v5, v12);
  v9 = (void *)v15[5];
  if (a4 && v9)
  {
    *a4 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator prioritizeCoordinatorForAppWithIdentity:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __73__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_error___block_invoke_67(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (!v5 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acquireDatabase");

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

+ (void)prioritizeCoordinatorForAppWithIdentity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a4;
  v6 = a3;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke;
  v14[3] = &unk_1E4DC40C0;
  v9 = v5;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke_68;
  v12[3] = &unk_1E4DC4228;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "_remote_prioritizeCoordinatorForAppWithIdentity:completion:", v6, v12);

}

void __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator prioritizeCoordinatorForAppWithIdentity:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__IXAppInstallCoordinator_prioritizeCoordinatorForAppWithIdentity_completion___block_invoke_68(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acquireDatabase");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (BOOL)uninstallAppWithBundleID:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:error:", a3, 0, 0, a4);
}

+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 completion:(id)a5
{
  objc_msgSend(a1, "uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:completion:", a3, a4, 0, a5);
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v15 = 0;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setRequestUserConfirmation:", v8);
  objc_msgSend(v11, "setWaitForDeletion:", v7);
  objc_msgSend(v11, "setShowArchiveOption:", 0);
  v13 = 0;
  if (objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:", v10, v11, &v15, a6))
  {
    if (v15 == 1)
    {
      if (a6)
      {
        _CreateError((uint64_t)"+[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:error:]", 977, CFSTR("IXErrorDomain"), 0x15uLL, 0, 0, CFSTR("User canceled the uninstall of the app with bundle ID %@"), v12, (uint64_t)v10);
        v13 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 1;
    }
  }

  return v13;
}

+ (void)uninstallAppWithBundleID:(id)a3 requestUserConfirmation:(BOOL)a4 waitForDeletion:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setRequestUserConfirmation:", v8);
  objc_msgSend(v12, "setWaitForDeletion:", v7);
  objc_msgSend(v12, "setShowArchiveOption:", 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__IXAppInstallCoordinator_uninstallAppWithBundleID_requestUserConfirmation_waitForDeletion_completion___block_invoke;
  v15[3] = &unk_1E4DC4250;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend(a1, "uninstallAppWithBundleID:options:completion:", v14, v12, v15);

}

void __103__IXAppInstallCoordinator_uninstallAppWithBundleID_requestUserConfirmation_waitForDeletion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v6 = v7;
  if (a2 == 1)
  {
    _CreateError((uint64_t)"+[IXAppInstallCoordinator uninstallAppWithBundleID:requestUserConfirmation:waitForDeletion:completion:]_block_invoke", 997, CFSTR("IXErrorDomain"), 0x15uLL, 0, 0, CFSTR("User canceled the uninstall of the app with bundle ID %@"), v5, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  IXApplicationIdentity *v15;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v14);

  LOBYTE(a6) = objc_msgSend(a1, "uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:", v15, v13, a5, a6, v12);
  return (char)a6;
}

+ (BOOL)uninstallAppWithBundleID:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:", a3, a4, a5, a6, 0);
}

+ (void)uninstallAppWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  IXApplicationIdentity *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v10);

  objc_msgSend(a1, "uninstallAppWithIdentity:options:completion:", v11, v9, v8);
}

+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6 legacyProgressBlock:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  int v24;
  NSObject *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id obj;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  const __CFString *v58;
  _QWORD v59[2];
  _QWORD v60[5];

  v60[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a7;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (v14)
  {
    v59[0] = CFSTR("PercentComplete");
    v59[1] = CFSTR("Status");
    v60[0] = &unk_1E4DD8328;
    IXStatusForUninstallationProgress(50);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v16);

  }
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke;
  v40[3] = &unk_1E4DC41B0;
  v40[4] = &v45;
  objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v40);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  v36[1] = 3221225472;
  v36[2] = __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke_79;
  v36[3] = &unk_1E4DC4278;
  v38 = &v45;
  v20 = v12;
  v37 = v20;
  v39 = &v41;
  objc_msgSend(v19, "_remote_uninstallAppWithIdentity:options:completion:", v20, v13, v36);

  v21 = v42[3];
  if (v21 != 4)
  {
LABEL_6:
    if ((unint64_t)(v21 - 3) <= 1)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v42[3] == 3)
          v26 = CFSTR("uninstall");
        else
          v26 = CFSTR("demotion");
        *(_DWORD *)buf = 136315650;
        v54 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]";
        v55 = 2112;
        v56 = v20;
        v57 = 2112;
        v58 = v26;
        _os_log_impl(&dword_1A4BF6000, v25, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about %@ of %@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "acquireDatabase");

      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (v42[3] == 3)
          v29 = CFSTR("uninstall");
        else
          v29 = CFSTR("demotion");
        *(_DWORD *)buf = 136315650;
        v54 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]";
        v55 = 2112;
        v56 = v20;
        v57 = 2112;
        v58 = v29;
        _os_log_impl(&dword_1A4BF6000, v28, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after %@ of %@", buf, 0x20u);
      }

    }
    if (a5)
      goto LABEL_19;
    goto LABEL_20;
  }
  v22 = objc_msgSend(v13, "waitForDeletion");
  v23 = (id *)(v46 + 5);
  obj = (id)v46[5];
  v24 = objc_msgSend(a1, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:", v20, 2, v22, 0, &obj);
  objc_storeStrong(v23, obj);
  if (v24)
  {
    v21 = v42[3];
    goto LABEL_6;
  }
  v42[3] = 0;
  if (a5)
LABEL_19:
    *a5 = v42[3];
LABEL_20:
  if (v14)
  {
    v51[0] = CFSTR("PercentComplete");
    v51[1] = CFSTR("Status");
    v52[0] = &unk_1E4DD8340;
    IXStatusForUninstallationProgress(90);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v31);

  }
  v32 = (void *)v46[5];
  if (a6 && v32)
  {
    *a6 = objc_retainAutorelease(v32);
    v32 = (void *)v46[5];
  }
  v33 = v32 == 0;

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v33;
}

void __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __98__IXAppInstallCoordinator_uninstallAppWithIdentity_options_disposition_error_legacyProgressBlock___block_invoke_79(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)a1[4];
      v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v12 = 136315650;
      v13 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to uninstall bundleID:%@ with:%@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForUninstallDisposition(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v12 = 136315650;
      v13 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from installcoordinationd for bundleID %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

+ (BOOL)uninstallAppWithIdentity:(id)a3 options:(id)a4 disposition:(unint64_t *)a5 error:(id *)a6
{
  return objc_msgSend(a1, "uninstallAppWithIdentity:options:disposition:error:legacyProgressBlock:", a3, a4, a5, a6, 0);
}

+ (void)uninstallAppWithIdentity:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke;
  v21[3] = &unk_1E4DC42C8;
  v22 = v8;
  v12 = v10;
  v24 = v12;
  v25 = a1;
  v23 = v9;
  v13 = v9;
  v14 = v8;
  v15 = (void *)MEMORY[0x1A85A58E8](v21);
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_86;
  v19[3] = &unk_1E4DC40C0;
  v20 = v12;
  v17 = v12;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_remote_uninstallAppWithIdentity:options:completion:", v14, v13, v15);

}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (*v10)(void);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    IXStringForUninstallDisposition(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received disposition %@ from installcoordinationd for %@", buf, 0x20u);

  }
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_cold_1();

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  if (a2 == 3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about uninstall of %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acquireDatabase");

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v23 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after uninstall of %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (a2 != 4)
  {
LABEL_15:
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
    v10();
    goto LABEL_17;
  }
  v11 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = objc_msgSend(*(id *)(a1 + 40), "waitForDeletion");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_85;
  v19[3] = &unk_1E4DC42A0;
  v21 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v11, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:completion:", v12, 2, v13, 0, v19);

LABEL_17:
}

uint64_t __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_85(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, a2);
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Resyncing local LS database to ensure it knows about demotion of %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acquireDatabase");

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136315394;
    v10 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Resync of local LS database complete after demotion of %@", (uint8_t *)&v9, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "+[IXAppInstallCoordinator uninstallAppWithIdentity:options:completion:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (BOOL)revertAppWithBundleID:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "revertAppWithBundleID:resultingApplicationRecord:error:", a3, 0, a4);
}

+ (BOOL)revertAppWithBundleID:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5
{
  id v8;
  IXApplicationIdentity *v9;

  v8 = a3;
  v9 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v8);

  LOBYTE(a5) = objc_msgSend(a1, "revertAppWithIdentity:resultingApplicationRecord:error:", v9, a4, a5);
  return (char)a5;
}

+ (void)revertAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__IXAppInstallCoordinator_revertAppWithBundleID_completion___block_invoke;
  v8[3] = &unk_1E4DC42F0;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "revertAppWithBundleID:completionWithApplicationRecord:", a3, v8);

}

uint64_t __60__IXAppInstallCoordinator_revertAppWithBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)revertAppWithBundleID:(id)a3 completionWithApplicationRecord:(id)a4
{
  id v6;
  id v7;
  IXApplicationIdentity *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(a1, "revertAppWithIdentity:completionWithApplicationRecord:", v8, v6);
}

+ (BOOL)revertAppWithIdentity:(id)a3 resultingApplicationRecord:(id *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke;
  v18[3] = &unk_1E4DC41B0;
  v18[4] = &v25;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_88;
  v17[3] = &unk_1E4DC4318;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v10, "_remote_revertAppWithIdentity:completion:", v7, v17);

  v11 = (void *)v26[5];
  if (!v11)
  {
    v12 = (void *)v20[5];
    objc_msgSend(v7, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IXApplicationRecordForRecordPromise(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v11 = (void *)v26[5];
  }
  if (a5 && v11)
  {
    *a5 = objc_retainAutorelease(v11);
    v11 = (void *)v26[5];
  }
  v15 = v11 == 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_cold_1();

  }
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

+ (void)revertAppWithIdentity:(id)a3 completionWithApplicationRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke;
  v16[3] = &unk_1E4DC40C0;
  v9 = v6;
  v17 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke_90;
  v13[3] = &unk_1E4DC4340;
  v14 = v5;
  v15 = v9;
  v11 = v5;
  v12 = v9;
  objc_msgSend(v10, "_remote_revertAppWithIdentity:completion:", v11, v13);

}

void __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "+[IXAppInstallCoordinator revertAppWithIdentity:completionWithApplicationRecord:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __81__IXAppInstallCoordinator_revertAppWithIdentity_completionWithApplicationRecord___block_invoke_90(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IXApplicationRecordForRecordPromise(v7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (unint64_t)removabilityForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  IXApplicationIdentity *v7;
  unint64_t v8;

  v6 = a3;
  v7 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v6);

  v8 = objc_msgSend(a1, "removabilityForAppWithIdentity:error:", v7, a4);
  return v8;
}

+ (unint64_t)removabilityForAppWithIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  IXGetUncachedRemovabilityMetadataForApp(v5, 1, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removability");
  if (v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForAppRemovability(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:error:]";
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@, for identity:%@", buf, 0x20u);

    }
    v17[3] = v7;
  }
  else
  {
    v7 = v17[3];
    if (!v7)
    {
      +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke;
      v15[3] = &unk_1E4DC41B0;
      v15[4] = &v20;
      objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke_91;
      v14[3] = &unk_1E4DC4368;
      v14[4] = &v20;
      v14[5] = &v16;
      objc_msgSend(v12, "_remote_removabilityForAppWithIdentity:completion:", v5, v14);

      v7 = v17[3];
      if (a4)
      {
        if (!v7)
        {
          *a4 = objc_retainAutorelease((id)v21[5]);
          v7 = v17[3];
        }
      }
    }
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __64__IXAppInstallCoordinator_removabilityForAppWithIdentity_error___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  else
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }

}

+ (void)removabilityForAppWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IXApplicationIdentity *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(a1, "removabilityForAppWithIdentity:completion:", v8, v6);
}

+ (void)removabilityForAppWithIdentity:(id)a3 completion:(id)a4
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
  IXQueueForConcurrentOperations();
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke;
  v10[3] = &unk_1E4DC4390;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  IXDispatchAsyncWithAutoreleasePool(v7, v10);

}

void __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  IXGetUncachedRemovabilityMetadataForApp(*(void **)(a1 + 32), 1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removability");
  if (v3)
  {
    v4 = v3;
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForAppRemovability(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v13 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:completion:]_block_invoke";
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Returning locally read removability, %@, for %@.", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke_92;
    v10[3] = &unk_1E4DC40C0;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_remote_removabilityForAppWithIdentity:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __69__IXAppInstallCoordinator_removabilityForAppWithIdentity_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator removabilityForAppWithIdentity:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "setRemovability:forAppWithBundleID:byClient:completion:", a3, a4, 1, a5);
}

+ (void)setRemovability:(unint64_t)a3 forAppWithBundleID:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  IXApplicationIdentity *v12;

  v10 = a6;
  v11 = a4;
  v12 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v11);

  objc_msgSend(a1, "setRemovability:forAppWithIdentity:byClient:completion:", a3, v12, a5, v10);
}

+ (void)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;

  v9 = a4;
  v10 = a6;
  IXQueueForConcurrentOperations();
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke;
  v14[3] = &unk_1E4DC43B8;
  v15 = v9;
  v16 = v10;
  v17 = a3;
  v18 = a5;
  v12 = v10;
  v13 = v9;
  IXDispatchAsyncWithAutoreleasePool(v11, v14);

}

void __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  IXGetUncachedRemovabilityMetadataForApp(*(void **)(a1 + 32), 1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removability");
  if (v3 && *(_QWORD *)(a1 + 48) == v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      IXStringForAppRemovability(*(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v12 = "+[IXAppInstallCoordinator setRemovability:forAppWithIdentity:byClient:completion:]_block_invoke";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Removability requested to be set for %@ is unchanged: %@; skipping write.",
        buf,
        0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke_93;
    v9[3] = &unk_1E4DC40C0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_remote_setRemovability:forAppWithIdentity:byClient:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }

}

void __82__IXAppInstallCoordinator_setRemovability_forAppWithIdentity_byClient_completion___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator setRemovability:forAppWithIdentity:byClient:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)removabilityDataWithChangeClock:(id *)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[7];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  obj = 0;
  IXGetUncachedRemovabilityDataStore(&obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v22, obj);
  v7 = (void *)v24[5];
  v24[5] = v6;

  v8 = (void *)v24[5];
  if (!v8)
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke;
    v15[3] = &unk_1E4DC41B0;
    v15[4] = &v29;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke_94;
    v14[3] = &unk_1E4DC43E0;
    v14[4] = &v29;
    v14[5] = &v23;
    v14[6] = &v17;
    objc_msgSend(v11, "_remote_removabilityDataWithCompletion:", v14);

    v8 = (void *)v24[5];
    if (a4)
    {
      if (!v8)
      {
        *a4 = objc_retainAutorelease((id)v30[5]);
        v8 = (void *)v24[5];
      }
    }
  }
  if (a3 && v8)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v8 = (void *)v24[5];
  }
  v12 = v8;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

void __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator removabilityDataWithChangeClock:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65__IXAppInstallCoordinator_removabilityDataWithChangeClock_error___block_invoke_94(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  void **v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = (void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v12 = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    v11 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v12 = v8;
  }
  v13 = v12;
  v14 = *v11;
  *v11 = v13;

}

+ (void)removabilityDataWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  IXQueueForConcurrentOperations();
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke;
  v6[3] = &unk_1E4DC3E68;
  v7 = v3;
  v5 = v3;
  IXDispatchAsyncWithAutoreleasePool(v4, v6);

}

void __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v11 = 0;
  IXGetUncachedRemovabilityDataStore(&v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v11;
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke_2;
    v9 = &unk_1E4DC40C0;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_remote_removabilityDataWithCompletion:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9);
  }

}

void __58__IXAppInstallCoordinator_removabilityDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator removabilityDataWithCompletion:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)updateSINFForAppWithIdentity:(id)a3 wrapperURL:(id)a4 sinfData:(id)a5 error:(id *)a6
{
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:]", 1407, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v8, (uint64_t)"+[IXAppInstallCoordinator updateSINFForAppWithIdentity:wrapperURL:sinfData:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a6)
    *a6 = objc_retainAutorelease(v9);

  return 0;
}

+ (BOOL)updateSINFForAppWithIdentity:(id)a3 sinfData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke;
  v23[3] = &unk_1E4DC41B0;
  v23[4] = &v24;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke_98;
  v19[3] = &unk_1E4DC4408;
  v21 = &v24;
  v15 = v9;
  v20 = v15;
  v22 = &v30;
  objc_msgSend(v14, "_remote_updateSINFForAppWithIdentity:sinfData:options:completion:", v15, v10, v11, v19);

  v16 = *((unsigned __int8 *)v31 + 24);
  if (a6 && !*((_BYTE *)v31 + 24))
  {
    *a6 = objc_retainAutorelease((id)v25[5]);
    v16 = *((unsigned __int8 *)v31 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v17;
}

void __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "+[IXAppInstallCoordinator updateSINFForAppWithIdentity:sinfData:options:error:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __79__IXAppInstallCoordinator_updateSINFForAppWithIdentity_sinfData_options_error___block_invoke_98(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v8 = 136315650;
      v9 = "+[IXAppInstallCoordinator updateSINFForAppWithIdentity:sinfData:options:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update SINF for identity:%@ with:%@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 wrapperURL:(id)a4 plistData:(id)a5 error:(id *)a6
{
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:]", 1459, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v8, (uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a6)
    *a6 = objc_retainAutorelease(v9);

  return 0;
}

+ (BOOL)updateiTunesMetadataForAppWithIdentity:(id)a3 plistData:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v17;
  id v18;

  v9 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0D3AD68], "metadataFromPlistData:error:", a4, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10)
  {
    v12 = objc_msgSend(a1, "updateiTunesMetadata:forAppWithIdentity:error:", v10, v9, a6);
    v13 = v11;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:plistData:options:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadataForAppWithIdentity:plistData:options:error:]", 1472, CFSTR("IXErrorDomain"), 0x35uLL, v11, 0, CFSTR("Unable to decode supplied plist data"), v15, v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v13 = objc_retainAutorelease(v13);
      v12 = 0;
      *a6 = v13;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 wrapperURL:(id)a5 error:(id *)a6
{
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:]", 1504, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v8, (uint64_t)"+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a6)
    *a6 = objc_retainAutorelease(v9);

  return 0;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentity:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[5];
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

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke;
  v20[3] = &unk_1E4DC41B0;
  v20[4] = &v21;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke_102;
  v16[3] = &unk_1E4DC4408;
  v18 = &v21;
  v12 = v8;
  v17 = v12;
  v19 = &v27;
  objc_msgSend(v11, "_remote_updateiTunesMetadata:forAppWithIdentity:completion:", v7, v12, v16);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:error:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update iTunesMetadata: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __73__IXAppInstallCoordinator_updateiTunesMetadata_forAppWithIdentity_error___block_invoke_102(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v8 = 136315650;
      v9 = "+[IXAppInstallCoordinator updateiTunesMetadata:forAppWithIdentity:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to update iTunesMetadata for identity %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

+ (BOOL)refreshDataContainerForBundleID:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v40 = 1;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1554, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Reason passed to %s was nil!"), v28, (uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v16 = 0;
    v13 = 0;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]";
    v43 = 2112;
    v44 = v7;
    v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: Request to refresh data container for identifier %@ with reason %@", buf, 0x20u);
  }

  v11 = objc_alloc(MEMORY[0x1E0D87E00]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Refreshing data container: %@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithExplanation:", v12);

  objc_msgSend(v13, "setMaximumTerminationResistance:", 40);
  v14 = objc_alloc(MEMORY[0x1E0D87E08]);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPredicate:context:", v15, v13);

  if (!v16)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:].cold.2();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1566, CFSTR("IXErrorDomain"), 0x13uLL, 0, 0, CFSTR("Failed to create termination request for identifier %@"), v30, (uint64_t)v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v16 = 0;
    goto LABEL_33;
  }
  v38 = 0;
  v39 = 0;
  v17 = objc_msgSend(v16, "execute:error:", &v39, &v38);
  v18 = v39;
  v19 = v38;
  v20 = v19;
  if ((v17 & 1) != 0)
  {
    if (v18)
      goto LABEL_7;
    goto LABEL_25;
  }
  objc_msgSend(v19, "domain");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0D87E40]) || objc_msgSend(v20, "code") != 3)
  {

    goto LABEL_25;
  }

  if (!v18)
  {
LABEL_25:
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]";
      v43 = 2112;
      v44 = v7;
      v45 = 2112;
      v46 = v18;
      v47 = 2112;
      v48 = v20;
      _os_log_error_impl(&dword_1A4BF6000, v32, OS_LOG_TYPE_ERROR, "%s: Failed to execute termination request for identifier %@: assertion = %@ : %@", buf, 0x2Au);
    }

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1571, CFSTR("IXErrorDomain"), 0x13uLL, v20, 0, CFSTR("Failed to execute termination request for identifier %@: assertion = %@"), v33, (uint64_t)v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_32;
LABEL_33:
    v23 = 0;
    if (!a5)
      goto LABEL_36;
    goto LABEL_34;
  }
LABEL_7:
  v37 = objc_retainAutorelease(v7);
  objc_msgSend(v37, "UTF8String");
  v21 = container_create_or_lookup_for_current_user();
  if (!v21)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:].cold.3();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1577, CFSTR("IXErrorDomain"), 0x23uLL, 0, 0, CFSTR("Failed to look up container for identifier %@: container error = %llu"), v35, (uint64_t)v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
    objc_msgSend(v18, "invalidate");
    goto LABEL_33;
  }
  v22 = v21;
  v40 = container_delete_all_container_content();
  v23 = v40 == 1;
  if (v40 != 1)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:].cold.4();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshDataContainerForBundleID:reason:error:]", 1582, CFSTR("IXErrorDomain"), 0x23uLL, 0, 0, CFSTR("Failed to refresh data container for identifier %@: container error = %llu"), v25, (uint64_t)v37);
    v26 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v26;
  }
  objc_msgSend(v18, "invalidate");
  MEMORY[0x1A85A5588](v22);
  v27 = v20;
  if (a5)
  {
LABEL_34:
    if (!v23)
      *a5 = objc_retainAutorelease(v27);
  }
LABEL_36:

  return v23;
}

+ (BOOL)refreshContainerTypes:(unint64_t)a3 forBundleID:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  IXApplicationIdentity *v12;

  v10 = a5;
  v11 = a4;
  v12 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v11);

  LOBYTE(a6) = objc_msgSend(a1, "refreshContainerTypes:forApplicationIdentity:reason:error:", a3, v12, v10, a6);
  return (char)a6;
}

+ (BOOL)refreshContainerTypes:(unint64_t)a3 forApplicationIdentity:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (v10)
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke;
    v21[3] = &unk_1E4DC41B0;
    v21[4] = &v26;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_120;
    v20[3] = &unk_1E4DC4048;
    v20[4] = &v26;
    v20[5] = &v22;
    objc_msgSend(v13, "_remote_refreshContainerTypes:forAppWithIdentity:reason:completion:", a3, v9, v10, v20);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:].cold.1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:]", 1621, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Reason passed to %s was nil"), v15, (uint64_t)"+[IXAppInstallCoordinator refreshContainerTypes:forApplicationIdentity:reason:error:]");
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v27[5];
    v27[5] = v16;
  }

  v17 = *((unsigned __int8 *)v23 + 24);
  if (a6 && !*((_BYTE *)v23 + 24))
  {
    *a6 = objc_retainAutorelease((id)v27[5]);
    v17 = *((unsigned __int8 *)v23 + 24);
  }
  v18 = v17 != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_cold_1();

  }
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_120(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)cancelForReason:(id)a3
{
  -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", a3, 14, 0);
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  BOOL v24;
  uint64_t v26[5];
  id v27;
  unint64_t v28;
  _QWORD v29[7];
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v8 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  if (!v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[IXAppInstallCoordinator cancelForReason:client:error:].cold.1();

    _CreateError((uint64_t)"-[IXAppInstallCoordinator cancelForReason:client:error:]", 1662, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Reason passed to -[IXAppInstallCoordinator cancelForReason:client:error:] was nil!"), v19, v26[0]);
    v20 = objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_13;
  }
  v9 = v8;
  if (!a4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[IXAppInstallCoordinator cancelForReason:client:error:].cold.2();

    _CreateError((uint64_t)"-[IXAppInstallCoordinator cancelForReason:client:error:]", 1667, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-[IXAppInstallCoordinator cancelForReason:client:error:] was called with client of IXClientNone which is invalid"), v22, v26[0]);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = (void *)v32[5];
    v32[5] = v20;
LABEL_14:

    goto LABEL_15;
  }
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke;
  v30[3] = &unk_1E4DC4430;
  v30[4] = self;
  v30[5] = &v31;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_125;
  v29[3] = &unk_1E4DC4458;
  v29[4] = self;
  v29[5] = &v31;
  v29[6] = &v37;
  objc_msgSend(v12, "_remote_IXSCoordinatedAppInstall:cancelForReason:client:completion:", v13, v9, a4, v29);

  if (*((_BYTE *)v38 + 24))
  {
    IXUserPresentableErrorForInsufficientSpaceError(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;

      v9 = v16;
    }
    -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = (uint64_t)__56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_126;
    v26[3] = (uint64_t)&unk_1E4DC3EB8;
    v26[4] = (uint64_t)self;
    v9 = v9;
    v27 = v9;
    v28 = a4;
    dispatch_sync(v17, v26);

    goto LABEL_14;
  }
LABEL_15:
  v23 = *((unsigned __int8 *)v38 + 24);
  if (a5 && !*((_BYTE *)v38 + 24))
  {
    *a5 = objc_retainAutorelease((id)v32[5]);
    v23 = *((unsigned __int8 *)v38 + 24);
  }
  v24 = v23 != 0;
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v24;
}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator cancelForReason:client:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_125(_QWORD *a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v10 = 136315650;
      v11 = "-[IXAppInstallCoordinator cancelForReason:client:error:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel %@ : %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "acquireDatabase");

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

void __56__IXAppInstallCoordinator_cancelForReason_client_error___block_invoke_126(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
}

- (BOOL)setPlaceholderPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  IXAppInstallCoordinator *v37;
  uint64_t *v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  IXAppInstallCoordinator *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  -[IXAppInstallCoordinator validInstallTypes](self, "validInstallTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[IXAppInstallCoordinator setPlaceholderPromise:error:].cold.1();

    _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1719, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("placeholderPromise argument to %s was nil"), v18, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "placeholderType") != 1)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[IXAppInstallCoordinator setPlaceholderPromise:error:].cold.2();

    _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1724, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("App extension placeholder promise passed to %s instead of app placeholder promise"), v21, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v22 = (void *)v49[5];
    v49[5] = v19;
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "installType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v6, "installType");
      *(_DWORD *)buf = 136316418;
      v55 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]";
      v56 = 2080;
      v57 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]";
      v58 = 2112;
      v59 = v33;
      v60 = 2048;
      v61 = v34;
      v62 = 2112;
      v63 = v22;
      v64 = 2112;
      v65 = 0;
      _os_log_error_impl(&dword_1A4BF6000, v26, OS_LOG_TYPE_ERROR, "%s: Placeholder promise passed to %s for %@ has unpermitted install type %lu (permitted types %@) : %@", buf, 0x3Eu);

    }
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installType");
    _CreateError((uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]", 1730, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Placeholder promise passed to %s for %@ has unpermitted install type %lu (permitted types %@)"), v29, (uint64_t)"-[IXAppInstallCoordinator setPlaceholderPromise:error:]");
    v30 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v49[5];
    v49[5] = v30;

    goto LABEL_14;
  }
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke;
  v40[3] = &unk_1E4DC4480;
  v12 = v6;
  v41 = v12;
  v42 = self;
  v43 = &v48;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke_136;
  v35[3] = &unk_1E4DC44A8;
  v36 = v12;
  v37 = self;
  v38 = &v48;
  v39 = &v44;
  objc_msgSend(v13, "_remote_IXSCoordinatedAppInstall:setPlaceholderPromiseUUID:completion:", v14, v15, v35);

  if (!*((_BYTE *)v45 + 24))
  {
    v16 = v49[5];
    if (v16)
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v16, 15, 0);
  }
LABEL_15:
  v23 = *((unsigned __int8 *)v45 + 24);
  if (a4 && !*((_BYTE *)v45 + 24))
  {
    *a4 = objc_retainAutorelease((id)v49[5]);
    v23 = *((unsigned __int8 *)v45 + 24);
  }
  v24 = v23 != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v24;
}

void __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __55__IXAppInstallCoordinator_setPlaceholderPromise_error___block_invoke_136(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setPlaceholderPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)placeholderPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getPlaceholderPromise:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder promise: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1780, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for a placeholder data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1777, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke", 1772, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A placeholder promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXAppInstallCoordinator placeholderPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasPlaceholderPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke_146;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:hasPlaceholderPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator hasPlaceholderPromise]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a placeholder promise: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __48__IXAppInstallCoordinator_hasPlaceholderPromise__block_invoke_146(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator hasPlaceholderPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a placeholder promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setAppAssetPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXAppInstallCoordinator *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  IXAppInstallCoordinator *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke;
  v23[3] = &unk_1E4DC4480;
  v9 = v6;
  v24 = v9;
  v25 = self;
  v26 = &v31;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke_147;
  v18[3] = &unk_1E4DC44A8;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v31;
  v22 = &v27;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setAppAssetPromiseUUID:completion:", v11, v12, v18);

  if (*((_BYTE *)v28 + 24))
  {
    v14 = 1;
  }
  else
  {
    v15 = v32[5];
    if (v15)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v14 = *((unsigned __int8 *)v28 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v14)
    {
      *a4 = objc_retainAutorelease((id)v32[5]);
      v14 = *((unsigned __int8 *)v28 + 24);
    }
  }
LABEL_9:
  v16 = v14 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setAppAssetPromise:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __52__IXAppInstallCoordinator_setAppAssetPromise_error___block_invoke_147(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setAppAssetPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)appAssetPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getAppAssetPromise:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1854, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an owned data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1851, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke", 1846, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("An app asset promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXAppInstallCoordinator appAssetPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasAppAssetPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke_154;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:hasAppAssetPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator hasAppAssetPromise]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an app asset promise: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __45__IXAppInstallCoordinator_hasAppAssetPromise__block_invoke_154(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator hasAppAssetPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has an app asset promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)appAssetPromiseHasBegunFulfillment:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke_155;
  v14[3] = &unk_1E4DC4548;
  v14[4] = &v16;
  v14[5] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:appAssetPromiseHasBegunFulfillment:", v10, v14);

  v11 = (void *)v17[5];
  if (a4 && v11)
  {
    *a4 = objc_retainAutorelease(v11);
    v11 = (void *)v17[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator appAssetPromiseHasBegunFulfillment:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if app asset promise for %@ has begun fulfillment : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __68__IXAppInstallCoordinator_appAssetPromiseHasBegunFulfillment_error___block_invoke_155(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    **(_BYTE **)(a1 + 40) = a2;
  }

}

- (BOOL)setAppAssetPromiseResponsibleClient:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (a3)
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke;
    v19[3] = &unk_1E4DC41B0;
    v19[4] = &v24;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke_158;
    v18[3] = &unk_1E4DC4048;
    v18[4] = &v24;
    v18[5] = &v20;
    objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setAppAssetPromiseDRI:completion:", v10, a3, v18);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:].cold.1();

    _CreateError((uint64_t)"-[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:]", 1908, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Client IXClientNone was passed to -setAppAssetPromiseResponsibleClient:error:, but that doesn't make sense"), v12, v17);
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v25[5];
    v25[5] = v13;
  }

  v14 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((_BYTE *)v21 + 24))
  {
    *a4 = objc_retainAutorelease((id)v25[5]);
    v14 = *((unsigned __int8 *)v21 + 24);
  }
  v15 = v14 != 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator setAppAssetPromiseResponsibleClient:error:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set app asset promise responsible client: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__IXAppInstallCoordinator_setAppAssetPromiseResponsibleClient_error___block_invoke_158(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (unint64_t)appAssetPromiseResponsibleClientWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v17;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke_159;
  v11[3] = &unk_1E4DC4368;
  v11[4] = &v13;
  v11[5] = &v17;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getAppAssetPromiseDRI:", v8, v11);

  v9 = v14[3];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v18[5]);
    v9 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator appAssetPromiseResponsibleClientWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get app asset promise responsible client: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__IXAppInstallCoordinator_appAssetPromiseResponsibleClientWithError___block_invoke_159(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setInstallOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  IXPromisedInMemoryData *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[7];
  _QWORD v29[6];
  id obj;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v6 = a3;
  v7 = v6;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (v6)
  {
    obj = 0;
    IXEncodeRootObject(v6, &obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v40, obj);
    if (v8)
    {
      v9 = -[IXPromisedInMemoryData initWithName:client:data:]([IXPromisedInMemoryData alloc], "initWithName:client:data:", CFSTR("MIInstallOptions data"), 15, v8);
      if (v9)
      {
        +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke;
        v29[3] = &unk_1E4DC4430;
        v29[4] = self;
        v29[5] = &v35;
        objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IXDataPromise uniqueIdentifier](v9, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v11;
        v28[1] = 3221225472;
        v28[2] = __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke_167;
        v28[3] = &unk_1E4DC4570;
        v28[4] = self;
        v28[5] = &v35;
        v28[6] = &v31;
        objc_msgSend(v12, "_remote_IXSCoordinatedAppInstall:setInstallOptionsPromiseUUID:completion:", v13, v14, v28);

        goto LABEL_13;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[IXAppInstallCoordinator setInstallOptions:error:].cold.2();

      _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallOptions:error:]", 1974, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to create data promise for serialized install options"), v21, v27);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v36[5];
      v36[5] = v22;

    }
    v9 = 0;
LABEL_13:
    if (*((_BYTE *)v32 + 24))
    {
      v24 = 1;
LABEL_22:
      v19 = v24 != 0;

      goto LABEL_23;
    }
    v25 = v36[5];
    if (v25)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v25, 15, 0);
      v24 = *((unsigned __int8 *)v32 + 24);
      if (!a4)
        goto LABEL_22;
    }
    else
    {
      v24 = 0;
      if (!a4)
        goto LABEL_22;
    }
    if (!v24)
    {
      *a4 = objc_retainAutorelease((id)v36[5]);
      v24 = *((unsigned __int8 *)v32 + 24);
    }
    goto LABEL_22;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setInstallOptions:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallOptions:error:]", 1957, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Options argument to -setInstallOptions:error: was nil"), v16, v27);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v36[5];
  v36[5] = v17;

  v19 = 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v36[5]);
LABEL_23:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

void __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator setInstallOptions:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set install options on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __51__IXAppInstallCoordinator_setInstallOptions_error___block_invoke_167(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = 136315650;
      v8 = "-[IXAppInstallCoordinator setInstallOptions:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set install options on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)hasInstallOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke_168;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:hasInstallOptions:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator hasInstallOptions]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __44__IXAppInstallCoordinator_hasInstallOptions__block_invoke_168(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator hasInstallOptions]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (id)installOptionsWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke_169;
  v12[3] = &unk_1E4DC4598;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getInstallOptions:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator installOptionsWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has install options: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __51__IXAppInstallCoordinator_installOptionsWithError___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (BOOL)setImportance:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__IXAppInstallCoordinator_setImportance_error___block_invoke;
  v15[3] = &unk_1E4DC45C0;
  v15[5] = &v16;
  v15[6] = a3;
  v15[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __47__IXAppInstallCoordinator_setImportance_error___block_invoke_171;
  v14[3] = &unk_1E4DC45E8;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setImportance:completion:", v10, a3, v14);

  -[IXAppInstallCoordinator _conveyCurrentPriorityBoostReplacingExisting:](self, "_conveyCurrentPriorityBoostReplacingExisting:", 1);
  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __47__IXAppInstallCoordinator_setImportance_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    IXStringForCoordinatorImportance(a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setImportance:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set importance to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);

  }
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __47__IXAppInstallCoordinator_setImportance_error___block_invoke_171(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForCoordinatorImportance(a1[7]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setImportance:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set importance to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (unint64_t)importanceWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[7];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__IXAppInstallCoordinator_importanceWithError___block_invoke;
  v12[3] = &unk_1E4DC4430;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __47__IXAppInstallCoordinator_importanceWithError___block_invoke_172;
  v11[3] = &unk_1E4DC4610;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &v19;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:importanceWithCompletion:", v8, v11);

  v9 = v20[3];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = v20[3];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __47__IXAppInstallCoordinator_importanceWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator importanceWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get importance from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __47__IXAppInstallCoordinator_importanceWithError___block_invoke_172(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = 136315650;
      v10 = "-[IXAppInstallCoordinator importanceWithError:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get importance from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }

}

- (BOOL)setInitialODRAssetPromises:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[7];
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v7 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v9);
  }

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke;
  v22[3] = &unk_1E4DC4430;
  v22[4] = self;
  v22[5] = &v27;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke_174;
  v21[3] = &unk_1E4DC4570;
  v21[4] = self;
  v21[5] = &v27;
  v21[6] = &v33;
  objc_msgSend(v15, "_remote_IXSCoordinatedAppInstall:setInitialODRAssetPromiseUUIDs:completion:", v16, v7, v21);

  if (*((_BYTE *)v34 + 24))
  {
    v17 = 1;
  }
  else
  {
    v18 = v28[5];
    if (v18)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v18, 15, 0);
      v17 = *((unsigned __int8 *)v34 + 24);
      if (!a4)
        goto LABEL_16;
    }
    else
    {
      v17 = 0;
      if (!a4)
        goto LABEL_16;
    }
    if (!v17)
    {
      *a4 = objc_retainAutorelease((id)v28[5]);
      v17 = *((unsigned __int8 *)v34 + 24);
    }
  }
LABEL_16:
  v19 = v17 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

void __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator setInitialODRAssetPromises:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set initial ODR asset promises on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __60__IXAppInstallCoordinator_setInitialODRAssetPromises_error___block_invoke_174(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = 136315650;
      v8 = "-[IXAppInstallCoordinator setInitialODRAssetPromises:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set initial ODR asset promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (id)initialODRAssetPromisesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _DWORD v55[12];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke;
  v42[3] = &unk_1E4DC41B0;
  v42[4] = &v49;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke_175;
  v41[3] = &unk_1E4DC41D8;
  v41[4] = &v49;
  v41[5] = &v43;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getInitialODRAssetPromises:", v7, v41);

  if (v50[5])
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_25;
  }
  v9 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = (id)v44[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
  if (!v11)
    goto LABEL_13;
  v12 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator initialODRAssetPromisesWithError:].cold.3();
        }

        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2152, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@"), v20, (uint64_t)v14);
        v21 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v50[5];
        v50[5] = v21;
        goto LABEL_24;
      }
      v15 = (objc_class *)objc_msgSend(v14, "clientPromiseClass");
      v16 = (void *)objc_msgSend([v15 alloc], "initWithSeed:", v14);
      if (!v16)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator initialODRAssetPromisesWithError:].cold.1(v23, (uint64_t)v14, v55);
        }

        NSStringFromClass(v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2158, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ from seed %@"), v25, (uint64_t)v24);
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v50[5];
        v50[5] = v26;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator initialODRAssetPromisesWithError:].cold.2();
        }

        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]", 2161, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Object %@ should have been for an opaque data promise subclass but was instead for class %@"), v31, (uint64_t)v16);
        v32 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v50[5];
        v50[5] = v32;
LABEL_23:

LABEL_24:
        v8 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v9, "addObject:", v16);

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
    if (v11)
      continue;
    break;
  }
LABEL_13:

  v8 = (void *)objc_msgSend(v9, "copy");
LABEL_25:
  if (a3 && !v8)
    *a3 = objc_retainAutorelease((id)v50[5]);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v8;
}

void __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get initial ODR asset promises: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__IXAppInstallCoordinator_initialODRAssetPromisesWithError___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[12];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v8 = a3;
  if (v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)&v15[4] = "-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke";
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get initial ODR asset promises: %@", v15, 0x16u);
    }

    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v11 = a3;
  }
  else
  {
    if (!v6)
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator initialODRAssetPromisesWithError:]_block_invoke", 2139, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("No Initial ODR asset promises are currently set."), v7, *(uint64_t *)v15);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:

}

- (BOOL)hasInitialODRAssetPromises
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke_186;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:hasInitialODRAssetPromises:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator hasInitialODRAssetPromises]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has initial ODR asset promises: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __53__IXAppInstallCoordinator_hasInitialODRAssetPromises__block_invoke_186(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator hasInitialODRAssetPromises]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has initial ODR asset promises: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)setUserDataPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXAppInstallCoordinator *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  IXAppInstallCoordinator *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke;
  v23[3] = &unk_1E4DC4480;
  v9 = v6;
  v24 = v9;
  v25 = self;
  v26 = &v31;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke_187;
  v18[3] = &unk_1E4DC44A8;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v31;
  v22 = &v27;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setUserDataPromiseUUID:completion:", v11, v12, v18);

  if (*((_BYTE *)v28 + 24))
  {
    v14 = 1;
  }
  else
  {
    v15 = v32[5];
    if (v15)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v14 = *((unsigned __int8 *)v28 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v14)
    {
      *a4 = objc_retainAutorelease((id)v32[5]);
      v14 = *((unsigned __int8 *)v28 + 24);
    }
  }
LABEL_9:
  v16 = v14 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setUserDataPromise:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set user data promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __52__IXAppInstallCoordinator_setUserDataPromise_error___block_invoke_187(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setUserDataPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set user data promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)userDataPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getUserDataPromise:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2239, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2236, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke", 2231, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A user data promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXAppInstallCoordinator userDataPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)hasUserDataPromise
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke;
  v9[3] = &unk_1E4DC44F8;
  v9[4] = self;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke_194;
  v8[3] = &unk_1E4DC4520;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "_remote_IXSCoordinatedAppInstall:hasUserDataPromise:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator hasUserDataPromise]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a user data promise: %@", (uint8_t *)&v6, 0x20u);
  }

}

void __45__IXAppInstallCoordinator_hasUserDataPromise__block_invoke_194(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator hasUserDataPromise]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a user data promise: %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (id)userDataRestoreShouldBegin:(BOOL *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke;
  v12[3] = &unk_1E4DC4430;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke_195;
  v11[3] = &unk_1E4DC4638;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = a3;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getUserDataRestoreShouldBegin:", v8, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator userDataRestoreShouldBegin:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin user data restore: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __54__IXAppInstallCoordinator_userDataRestoreShouldBegin___block_invoke_195(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v12 = 136315650;
      v13 = "-[IXAppInstallCoordinator userDataRestoreShouldBegin:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin user data restore: %@", (uint8_t *)&v12, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v9 = (_BYTE *)a1[6];
    if (v9)
      *v9 = a2;
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
}

- (id)preparationPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getPreparationPromise:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get user data promise: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2307, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2304, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke", 2299, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A preparation promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXAppInstallCoordinator preparationPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get preparation promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)setPreparationPromise:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXAppInstallCoordinator *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  IXAppInstallCoordinator *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke;
  v23[3] = &unk_1E4DC4480;
  v9 = v6;
  v24 = v9;
  v25 = self;
  v26 = &v31;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke_199;
  v18[3] = &unk_1E4DC44A8;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v31;
  v22 = &v27;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setPreparationPromiseUUID:completion:", v11, v12, v18);

  if (*((_BYTE *)v28 + 24))
  {
    v14 = 1;
  }
  else
  {
    v15 = v32[5];
    if (v15)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v14 = *((unsigned __int8 *)v28 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v14)
    {
      *a4 = objc_retainAutorelease((id)v32[5]);
      v14 = *((unsigned __int8 *)v28 + 24);
    }
  }
LABEL_9:
  v16 = v14 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setPreparationPromise:withError:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set preparation promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __59__IXAppInstallCoordinator_setPreparationPromise_withError___block_invoke_199(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setPreparationPromise:withError:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set preparation promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (BOOL)setDeviceSecurityPromise:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  IXAppInstallCoordinator *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  IXAppInstallCoordinator *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke;
  v23[3] = &unk_1E4DC4480;
  v9 = v6;
  v24 = v9;
  v25 = self;
  v26 = &v31;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke_200;
  v18[3] = &unk_1E4DC44A8;
  v13 = v9;
  v19 = v13;
  v20 = self;
  v21 = &v31;
  v22 = &v27;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setDeviceSecurityPromiseUUID:completion:", v11, v12, v18);

  if (*((_BYTE *)v28 + 24))
  {
    v14 = 1;
  }
  else
  {
    v15 = v32[5];
    if (v15)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v14 = *((unsigned __int8 *)v28 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v14 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v14)
    {
      *a4 = objc_retainAutorelease((id)v32[5]);
      v14 = *((unsigned __int8 *)v28 + 24);
    }
  }
LABEL_9:
  v16 = v14 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

void __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setDeviceSecurityPromise:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set device security promise %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __58__IXAppInstallCoordinator_setDeviceSecurityPromise_error___block_invoke_200(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setDeviceSecurityPromise:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set device security promise %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (id)deviceSecurityPromiseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v20;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201;
  v12[3] = &unk_1E4DC44D0;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getDeviceSecurityPromise:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get device security promise: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (!v7)
  {
    if (v5)
    {
      v9 = (objc_class *)objc_msgSend(v5, "clientPromiseClass");
      v10 = objc_msgSend([v9 alloc], "initWithSeed:", v5);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_17;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = 0;

        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201_cold_2();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2393, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@"), v17, (uint64_t)v5);
      }
      else
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201_cold_1();

        NSStringFromClass(v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2390, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ with seed %@"), v22, (uint64_t)v16);
      }
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke", 2385, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("A device security promise is not currently set."), v6, v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    goto LABEL_17;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[IXAppInstallCoordinator deviceSecurityPromiseWithError:]_block_invoke";
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get device security promise: %@", buf, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
LABEL_17:

}

- (BOOL)getHasDeviceSecurityPromise:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke_204;
  v14[3] = &unk_1E4DC4660;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:getHasDeviceSecurityPromise:", v10, v14);

  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator getHasDeviceSecurityPromise:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a device security promise: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __61__IXAppInstallCoordinator_getHasDeviceSecurityPromise_error___block_invoke_204(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v10 = 136315650;
      v11 = "-[IXAppInstallCoordinator getHasDeviceSecurityPromise:error:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has a device security promise: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v9 = (_BYTE *)a1[7];
    if (v9)
      *v9 = a2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)setNeedsPostProcessing:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[7];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke;
  v16[3] = &unk_1E4DC4430;
  v16[4] = self;
  v16[5] = &v21;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke_205;
  v15[3] = &unk_1E4DC4570;
  v15[4] = self;
  v15[5] = &v21;
  v15[6] = &v17;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setNeedsPostProcessing:completion:", v10, v5, v15);

  if (*((_BYTE *)v18 + 24))
  {
    v11 = 1;
  }
  else
  {
    v12 = v22[5];
    if (v12)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v12, 15, 0);
      v11 = *((unsigned __int8 *)v18 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v11 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v11)
    {
      *a4 = objc_retainAutorelease((id)v22[5]);
      v11 = *((unsigned __int8 *)v18 + 24);
    }
  }
LABEL_9:
  v13 = v11 != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator setNeedsPostProcessing:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set needs post processing on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __56__IXAppInstallCoordinator_setNeedsPostProcessing_error___block_invoke_205(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = 136315650;
      v8 = "-[IXAppInstallCoordinator setNeedsPostProcessing:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set needs post processing on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)getNeedsPostProcessing:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke_206;
  v14[3] = &unk_1E4DC4660;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:getNeedsPostProcessing:", v10, v14);

  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator getNeedsPostProcessing:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ needs post processing: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __56__IXAppInstallCoordinator_getNeedsPostProcessing_error___block_invoke_206(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v10 = 136315650;
      v11 = "-[IXAppInstallCoordinator getNeedsPostProcessing:error:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ needs post processing: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v9 = (_BYTE *)a1[7];
    if (v9)
      *v9 = a2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)getPostProcessingShouldBegin:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke_207;
  v14[3] = &unk_1E4DC4660;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:getPostProcessingShouldBegin:", v10, v14);

  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator getPostProcessingShouldBegin:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin post processing: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __62__IXAppInstallCoordinator_getPostProcessingShouldBegin_error___block_invoke_207(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v10 = 136315650;
      v11 = "-[IXAppInstallCoordinator getPostProcessingShouldBegin:error:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ should begin post processing: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v9 = (_BYTE *)a1[7];
    if (v9)
      *v9 = a2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)setEssentialAssetPromises:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  _QWORD v22[7];
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v7 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v9);
  }

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke;
  v23[3] = &unk_1E4DC4430;
  v23[4] = self;
  v23[5] = &v28;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v7, "copy");
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke_208;
  v22[3] = &unk_1E4DC4570;
  v22[4] = self;
  v22[5] = &v28;
  v22[6] = &v34;
  objc_msgSend(v15, "_remote_IXSCoordinatedAppInstall:setEssentialAssetPromiseUUIDs:completion:", v16, v17, v22);

  if (*((_BYTE *)v35 + 24))
  {
    v18 = 1;
  }
  else
  {
    v19 = v29[5];
    if (v19)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v19, 15, 0);
      v18 = *((unsigned __int8 *)v35 + 24);
      if (!a4)
        goto LABEL_16;
    }
    else
    {
      v18 = 0;
      if (!a4)
        goto LABEL_16;
    }
    if (!v18)
    {
      *a4 = objc_retainAutorelease((id)v29[5]);
      v18 = *((unsigned __int8 *)v35 + 24);
    }
  }
LABEL_16:
  v20 = v18 != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

void __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator setEssentialAssetPromises:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set essential asset promises on %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __59__IXAppInstallCoordinator_setEssentialAssetPromises_error___block_invoke_208(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = 136315650;
      v8 = "-[IXAppInstallCoordinator setEssentialAssetPromises:error:]_block_invoke";
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set essential asset promises on %@ : %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (id)essentialAssetPromisesWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _DWORD v55[12];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke;
  v42[3] = &unk_1E4DC41B0;
  v42[4] = &v49;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke_209;
  v41[3] = &unk_1E4DC41D8;
  v41[4] = &v49;
  v41[5] = &v43;
  objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getEssentialAssetPromises:", v7, v41);

  if (v50[5])
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_25;
  }
  v9 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = (id)v44[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
  if (!v11)
    goto LABEL_13;
  v12 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator essentialAssetPromisesWithError:].cold.3();
        }

        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2573, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@"), v20, (uint64_t)v14);
        v21 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v50[5];
        v50[5] = v21;
        goto LABEL_24;
      }
      v15 = (objc_class *)objc_msgSend(v14, "clientPromiseClass");
      v16 = (void *)objc_msgSend([v15 alloc], "initWithSeed:", v14);
      if (!v16)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator essentialAssetPromisesWithError:].cold.1(v23, (uint64_t)v14, v55);
        }

        NSStringFromClass(v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2579, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Failed to initialize promise class %@ from seed %@"), v25, (uint64_t)v24);
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v50[5];
        v50[5] = v26;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          objc_claimAutoreleasedReturnValue();
          -[IXAppInstallCoordinator essentialAssetPromisesWithError:].cold.2();
        }

        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]", 2582, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("Object %@ should have been for an opaque data promise subclass but was instead for class %@"), v31, (uint64_t)v16);
        v32 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v50[5];
        v50[5] = v32;
LABEL_23:

LABEL_24:
        v8 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v9, "addObject:", v16);

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v56, 16);
    if (v11)
      continue;
    break;
  }
LABEL_13:

  v8 = (void *)objc_msgSend(v9, "copy");
LABEL_25:
  if (a3 && !v8)
    *a3 = objc_retainAutorelease((id)v50[5]);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v8;
}

void __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get essential asset promises: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __59__IXAppInstallCoordinator_essentialAssetPromisesWithError___block_invoke_209(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[12];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v8 = a3;
  if (v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)&v15[4] = "-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke";
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get essential asset promises: %@", v15, 0x16u);
    }

    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v11 = a3;
  }
  else
  {
    if (!v6)
    {
      _CreateError((uint64_t)"-[IXAppInstallCoordinator essentialAssetPromisesWithError:]_block_invoke", 2560, CFSTR("IXErrorDomain"), 0x17uLL, 0, 0, CFSTR("No essential asset promises are currently set."), v7, *(uint64_t *)v15);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      goto LABEL_8;
    }
    v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);
LABEL_8:

}

- (BOOL)getHasEssentialAssetPromises:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke_212;
  v14[3] = &unk_1E4DC4660;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:hasEssentialAssetPromises:", v10, v14);

  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator getHasEssentialAssetPromises:error:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has essential asset promises: %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __62__IXAppInstallCoordinator_getHasEssentialAssetPromises_error___block_invoke_212(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v10 = 136315650;
      v11 = "-[IXAppInstallCoordinator getHasEssentialAssetPromises:error:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to check if %@ has essential asset promises: %@", (uint8_t *)&v10, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v9 = (_BYTE *)a1[7];
    if (v9)
      *v9 = a2;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (BOOL)setInstallTargetDirectoryURL:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:]", 2651, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v6, (uint64_t)"-[IXAppInstallCoordinator setInstallTargetDirectoryURL:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (id)installTargetDirectoryURLWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator installTargetDirectoryURLWithError:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator installTargetDirectoryURLWithError:]", 2682, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v5, (uint64_t)"-[IXAppInstallCoordinator installTargetDirectoryURLWithError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)setTargetBundleURL:(id)a3 preservingTargetBundleNameOnUpdate:(BOOL)a4 error:(id *)a5
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:]", 2717, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v7, (uint64_t)"-[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return 0;
}

- (BOOL)setTargetBundleURL:(id)a3 error:(id *)a4
{
  return -[IXAppInstallCoordinator setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:](self, "setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:", a3, 0, a4);
}

- (id)targetBundleURLWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator targetBundleURLWithError:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator targetBundleURLWithError:]", 2755, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v5, (uint64_t)"-[IXAppInstallCoordinator targetBundleURLWithError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)setAppQuitPromise:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setAppQuitPromise:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setAppQuitPromise:error:]", 2784, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v6, (uint64_t)"-[IXAppInstallCoordinator setAppQuitPromise:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (id)appQuitPromiseWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator appQuitPromiseWithError:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator appQuitPromiseWithError:]", 2821, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v5, (uint64_t)"-[IXAppInstallCoordinator appQuitPromiseWithError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)setManagedInstallUUID:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setManagedInstallUUID:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setManagedInstallUUID:error:]", 2852, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v6, (uint64_t)"-[IXAppInstallCoordinator setManagedInstallUUID:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (id)managedInstallUUIDWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator managedInstallUUIDWithError:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator managedInstallUUIDWithError:]", 2880, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v5, (uint64_t)"-[IXAppInstallCoordinator managedInstallUUIDWithError:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (BOOL)setShouldOverrideGatekeeper:(BOOL)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:]", 2911, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v6, (uint64_t)"-[IXAppInstallCoordinator setShouldOverrideGatekeeper:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)getShouldOverrideGatekeeperValue:(BOOL *)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:].cold.1();

  _CreateError((uint64_t)"-[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:]", 2941, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is unsupported on this platform."), v6, (uint64_t)"-[IXAppInstallCoordinator getShouldOverrideGatekeeperValue:error:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  _QWORD v16[8];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke;
  v17[3] = &unk_1E4DC45C0;
  v17[5] = &v18;
  v17[6] = a3;
  v17[4] = self;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke_213;
  v16[3] = &unk_1E4DC45E8;
  v16[4] = self;
  v16[5] = &v18;
  v16[6] = &v24;
  v16[7] = a3;
  objc_msgSend(v11, "_remote_IXSCoordinatedAppInstall:setRemovability:byClient:completion:", v12, a3, a4, v16);

  v13 = *((unsigned __int8 *)v25 + 24);
  if (a5 && !*((_BYTE *)v25 + 24))
  {
    *a5 = objc_retainAutorelease((id)v19[5]);
    v13 = *((unsigned __int8 *)v25 + 24);
  }
  v14 = v13 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    IXStringForAppRemovability(a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setRemovability:byClient:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set removability state to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);

  }
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __58__IXAppInstallCoordinator_setRemovability_byClient_error___block_invoke_213(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForAppRemovability(a1[7]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setRemovability:byClient:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set removability state to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (unint64_t)removabilityWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[7];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__IXAppInstallCoordinator_removabilityWithError___block_invoke;
  v12[3] = &unk_1E4DC4430;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__IXAppInstallCoordinator_removabilityWithError___block_invoke_214;
  v11[3] = &unk_1E4DC4610;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &v19;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:removabilityWithCompletion:", v8, v11);

  v9 = v20[3];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = v20[3];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __49__IXAppInstallCoordinator_removabilityWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator removabilityWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get removability state from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __49__IXAppInstallCoordinator_removabilityWithError___block_invoke_214(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = 136315650;
      v10 = "-[IXAppInstallCoordinator removabilityWithError:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get removability state from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }

}

- (BOOL)setPlaceholderDisposition:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[8];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke;
  v15[3] = &unk_1E4DC45C0;
  v15[5] = &v16;
  v15[6] = a3;
  v15[4] = self;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke_215;
  v14[3] = &unk_1E4DC45E8;
  v14[4] = self;
  v14[5] = &v16;
  v14[6] = &v22;
  v14[7] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:setPlaceholderDisposition:completion:", v10, a3, v14);

  v11 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v11 = *((unsigned __int8 *)v23 + 24);
  }
  v12 = v11 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    IXStringForPlaceholderDisposition(a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[4];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setPlaceholderDisposition:error:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder disposition to %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);

  }
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __59__IXAppInstallCoordinator_setPlaceholderDisposition_error___block_invoke_215(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      IXStringForPlaceholderDisposition(a1[7]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setPlaceholderDisposition:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set placeholder disposition to %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

- (unint64_t)placeholderDispositionWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[7];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke;
  v12[3] = &unk_1E4DC4430;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke_216;
  v11[3] = &unk_1E4DC4610;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &v19;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getPlaceholderDispositionWithCompletion:", v8, v11);

  v9 = v20[3];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = v20[3];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator placeholderDispositionWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder disposition from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __59__IXAppInstallCoordinator_placeholderDispositionWithError___block_invoke_216(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      v9 = 136315650;
      v10 = "-[IXAppInstallCoordinator placeholderDispositionWithError:]_block_invoke";
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to get placeholder disposition from %@ : %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }

}

- (unsigned)coordinatorScopeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke;
  v12[3] = &unk_1E4DC4430;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke_217;
  v11[3] = &unk_1E4DC4688;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getCoordinatorScopeWithCompletion:", v8, v11);

  v9 = *((_BYTE *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v14[5]);
    v9 = *((_BYTE *)v20 + 24);
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator coordinatorScopeWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordinator scope from %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __53__IXAppInstallCoordinator_coordinatorScopeWithError___block_invoke_217(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (BOOL)convertToGloballyScopedCoordinatorWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v18;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke_219;
  v12[3] = &unk_1E4DC4048;
  v12[4] = &v18;
  v12[5] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:convertToGloballyScopedWithCompletion:", v8, v12);

  v9 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((_BYTE *)v15 + 24))
  {
    *a3 = objc_retainAutorelease((id)v19[5]);
    v9 = *((unsigned __int8 *)v15 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator convertToGloballyScopedCoordinatorWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to convert to global scope for %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __71__IXAppInstallCoordinator_convertToGloballyScopedCoordinatorWithError___block_invoke_219(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)progressHintWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__IXAppInstallCoordinator_progressHintWithError___block_invoke;
  v13[3] = &unk_1E4DC41B0;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __49__IXAppInstallCoordinator_progressHintWithError___block_invoke_220;
  v12[3] = &unk_1E4DC46B0;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getProgressHintWithCompletion:", v8, v12);

  v9 = (void *)v21[5];
  if (a3 && !v9)
  {
    *a3 = objc_retainAutorelease((id)v15[5]);
    v9 = (void *)v21[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __49__IXAppInstallCoordinator_progressHintWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[IXAppInstallCoordinator progressHintWithError:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__IXAppInstallCoordinator_progressHintWithError___block_invoke_220(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v12 = 136315650;
      v13 = "-[IXAppInstallCoordinator progressHintWithError:]_block_invoke";
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get progress hint for %@ : %@", (uint8_t *)&v12, 0x20u);
    }

    v10 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
    v11 = a3;
  }
  else
  {
    v10 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v11 = a2;
  }
  objc_storeStrong(v10, v11);

}

- (BOOL)setProgressHint:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  IXAppInstallCoordinator *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  IXAppInstallCoordinator *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
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
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke;
  v22[3] = &unk_1E4DC4480;
  v9 = v6;
  v23 = v9;
  v24 = self;
  v25 = &v30;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke_222;
  v17[3] = &unk_1E4DC44A8;
  v12 = v9;
  v18 = v12;
  v19 = self;
  v20 = &v30;
  v21 = &v26;
  objc_msgSend(v10, "_remote_IXSCoordinatedAppInstall:setProgressHint:completion:", v11, v12, v17);

  if (*((_BYTE *)v27 + 24))
  {
    v13 = 1;
  }
  else
  {
    v14 = v31[5];
    if (v14)
    {
      -[IXAppInstallCoordinator cancelForReason:client:error:](self, "cancelForReason:client:error:", v14, 15, 0);
      v13 = *((unsigned __int8 *)v27 + 24);
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      v13 = 0;
      if (!a4)
        goto LABEL_9;
    }
    if (!v13)
    {
      *a4 = objc_retainAutorelease((id)v31[5]);
      v13 = *((unsigned __int8 *)v27 + 24);
    }
  }
LABEL_9:
  v15 = v13 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[IXAppInstallCoordinator setProgressHint:withError:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to set progress hint %@ on %@ : %@", (uint8_t *)&v9, 0x2Au);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __53__IXAppInstallCoordinator_setProgressHint_withError___block_invoke_222(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v7 = a1[5];
      v8 = 136315906;
      v9 = "-[IXAppInstallCoordinator setProgressHint:withError:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to set progress hint %@ on %@ : %@", (uint8_t *)&v8, 0x2Au);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }

}

- (NSError)error
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__IXAppInstallCoordinator_error__block_invoke;
  block[3] = &unk_1E4DC46D8;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v13;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v14 + 24))
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __32__IXAppInstallCoordinator_error__block_invoke_2;
    v11[3] = &unk_1E4DC4430;
    v11[4] = self;
    v11[5] = &v17;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __32__IXAppInstallCoordinator_error__block_invoke_223;
    v10[3] = &unk_1E4DC4700;
    v10[4] = self;
    v10[5] = &v17;
    objc_msgSend(v6, "_remote_IXSCoordinatedAppInstall:getErrorInfo:", v7, v10);

  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return (NSError *)v8;
}

void __32__IXAppInstallCoordinator_error__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1[4];
  v2 = *(void **)(v1 + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v2);
  }
  else if (*(_BYTE *)(v1 + 8))
  {
    v3 = *(_QWORD *)(a1[5] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __32__IXAppInstallCoordinator_error__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator error]_block_invoke_2";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property for %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __32__IXAppInstallCoordinator_error__block_invoke_223(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a2 && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "internalQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__IXAppInstallCoordinator_error__block_invoke_2_224;
    block[3] = &unk_1E4DC3EB8;
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v13 = a2;
    dispatch_sync(v8, block);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v15 = "-[IXAppInstallCoordinator error]_block_invoke";
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error property for %@ : %@", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __32__IXAppInstallCoordinator_error__block_invoke_2_224(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
}

- (void)setError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  IXUserPresentableErrorForInsufficientSpaceError(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;

    v4 = v7;
  }
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__IXAppInstallCoordinator_setError___block_invoke;
  block[3] = &unk_1E4DC4728;
  block[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, block);

}

void __36__IXAppInstallCoordinator_setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (unint64_t)errorSourceIdentifier
{
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke;
  block[3] = &unk_1E4DC4750;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  v5 = v14[3];
  if (!v5)
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2;
    v11[3] = &unk_1E4DC44F8;
    v11[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_225;
    v10[3] = &unk_1E4DC4700;
    v10[4] = self;
    v10[5] = &v13;
    objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getErrorInfo:", v8, v10);

    v5 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator errorSourceIdentifier]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source for %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_225(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 && v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "internalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2_226;
    block[3] = &unk_1E4DC3EB8;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = a2;
    dispatch_sync(v7, block);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  else if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v14 = "-[IXAppInstallCoordinator errorSourceIdentifier]_block_invoke";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get error source for %@ : %@", buf, 0x20u);
    }

  }
}

void __48__IXAppInstallCoordinator_errorSourceIdentifier__block_invoke_2_226(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__IXAppInstallCoordinator_setErrorSourceIdentifier___block_invoke;
  v6[3] = &unk_1E4DC4778;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __52__IXAppInstallCoordinator_setErrorSourceIdentifier___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)isComplete
{
  NSObject *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke;
  block[3] = &unk_1E4DC4750;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v16 + 24))
  {
    v5 = 1;
  }
  else
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_2;
    v13[3] = &unk_1E4DC44F8;
    v13[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_227;
    v12[3] = &unk_1E4DC4520;
    v12[4] = self;
    v12[5] = &v15;
    objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getIsComplete:", v8, v12);

    if (*((_BYTE *)v16 + 24))
    {
      -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __37__IXAppInstallCoordinator_isComplete__block_invoke_228;
      v11[3] = &unk_1E4DC47A0;
      v11[4] = self;
      v11[5] = &v15;
      dispatch_sync(v9, v11);

    }
    v5 = *((_BYTE *)v16 + 24) != 0;
  }
  _Block_object_dispose(&v15, 8);
  return v5;
}

uint64_t __37__IXAppInstallCoordinator_isComplete__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void __37__IXAppInstallCoordinator_isComplete__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator isComplete]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete property for %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __37__IXAppInstallCoordinator_isComplete__block_invoke_227(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator isComplete]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get isComplete property for %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

uint64_t __37__IXAppInstallCoordinator_isComplete__block_invoke_228(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  return result;
}

- (void)setComplete:(BOOL)a3 forApplicationRecord:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__IXAppInstallCoordinator_setComplete_forApplicationRecord___block_invoke;
  block[3] = &unk_1E4DC47C8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __60__IXAppInstallCoordinator_setComplete_forApplicationRecord___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void)setComplete:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__IXAppInstallCoordinator_setComplete___block_invoke;
  v6[3] = &unk_1E4DC47F0;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __39__IXAppInstallCoordinator_setComplete___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_onObserverCalloutQueue_handleObserverForCompletedCoordinator:(id)a3 completedApplicationRecord:(id)a4 error:(id)a5 client:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[IXAppInstallCoordinator setObserversCalled:](self, "setObserversCalled:", -[IXAppInstallCoordinator observersCalled](self, "observersCalled") | 0x800);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "coordinatorDidRegisterForObservation:", self);
  v13 = -[IXAppInstallCoordinator observersCalled](self, "observersCalled");
  if (v11)
  {
    -[IXAppInstallCoordinator setObserversCalled:](self, "setObserversCalled:", v13 | 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "coordinator:canceledWithReason:", self, v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "coordinator:canceledWithReason:client:", self, v11, a6);
  }
  else
  {
    -[IXAppInstallCoordinator setObserversCalled:](self, "setObserversCalled:", v13 | 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "coordinatorDidCompleteSuccessfully:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "coordinatorDidCompleteSuccessfully:forApplicationRecord:", self, v10);
  }

}

- (unint64_t)observersCalled
{
  NSObject *v3;

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_observersCalled;
}

- (void)setObserversCalled:(unint64_t)a3
{
  NSObject *v5;

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_observersCalled = a3;
}

- (IXAppInstallCoordinatorObserver)observer
{
  return (IXAppInstallCoordinatorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke;
  v7[3] = &unk_1E4DC4728;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__IXAppInstallCoordinator_setObserver___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  _QWORD block[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v33 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy_;
      v24 = __Block_byref_object_dispose_;
      v25 = 0;
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy_;
      v18 = __Block_byref_object_dispose_;
      v19 = 0;
      objc_msgSend(*(id *)(a1 + 32), "internalQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_2;
      block[3] = &unk_1E4DC4818;
      block[4] = *(_QWORD *)(a1 + 32);
      block[5] = &v30;
      block[6] = &v26;
      block[7] = &v20;
      block[8] = &v14;
      dispatch_sync(v4, block);

      if (*((_BYTE *)v31 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "_onObserverCalloutQueue_handleObserverForCompletedCoordinator:completedApplicationRecord:error:client:", *(_QWORD *)(a1 + 40), v15[5], v21[5], v27[3]);
      }
      else
      {
        +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_3;
        v12[3] = &unk_1E4DC44F8;
        v12[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v5;
        v10[1] = 3221225472;
        v10[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_239;
        v10[3] = &unk_1E4DC4868;
        v9 = *(void **)(a1 + 40);
        v10[4] = *(_QWORD *)(a1 + 32);
        v11 = v9;
        objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:fireObserversWithCompletion:", v8, v10);

      }
      _Block_object_dispose(&v14, 8);

      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v30, 8);
    }
  }
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_2(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 8);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 24);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 56));
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator setObserver:]_block_invoke_3";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to fire observer methods for newly added observer to %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_239(uint64_t a1, void *a2)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  _QWORD block[5];
  uint64_t (*v11)(uint64_t, uint64_t);
  _BYTE *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[IXAppInstallCoordinator setObserver:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v26 = v3;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to fire observers for %@ : %@", buf, 0x20u);
    }

  }
  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("IXErrorDomain")))
  {
    v8 = objc_msgSend(v3, "code") == 6;

    if (v8 && (objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 1) == 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v26 = __Block_byref_object_copy_;
      v27 = __Block_byref_object_dispose_;
      v28 = 0;
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy_;
      v19 = __Block_byref_object_dispose_;
      v20 = 0;
      objc_msgSend(*(id *)(a1 + 32), "internalQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__IXAppInstallCoordinator_setObserver___block_invoke_240;
      block[3] = &unk_1E4DC4840;
      block[4] = *(_QWORD *)(a1 + 32);
      v12 = buf;
      v13 = &v21;
      v14 = &v15;
      v11 = v3;
      dispatch_sync(v9, block);

      objc_msgSend(*(id *)(a1 + 32), "_onObserverCalloutQueue_handleObserverForCompletedCoordinator:completedApplicationRecord:error:client:", *(_QWORD *)(a1 + 40), v16[5], *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v22[3]);
      _Block_object_dispose(&v15, 8);

      _Block_object_dispose(&v21, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {

  }
}

void __39__IXAppInstallCoordinator_setObserver___block_invoke_240(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = *(void **)(v2 + 16);
    if (!v3)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(v2 + 56));
      return;
    }
    goto LABEL_5;
  }
  *(_BYTE *)(v2 + 8) = 1;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v4 + 16);
  v5 = (id *)(v4 + 16);
  v3 = v6;
  if (v6)
  {
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    return;
  }
  objc_storeStrong(v5, *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 15;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 15;
}

- (BOOL)pauseWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__IXAppInstallCoordinator_pauseWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __42__IXAppInstallCoordinator_pauseWithError___block_invoke_241;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:setIsPaused:completion:", v8, 1, v12);

  v9 = (void *)v15[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __42__IXAppInstallCoordinator_pauseWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator pauseWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send pause message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __42__IXAppInstallCoordinator_pauseWithError___block_invoke_241(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)resumeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__IXAppInstallCoordinator_resumeWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __43__IXAppInstallCoordinator_resumeWithError___block_invoke_242;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:setIsPaused:completion:", v8, 0, v12);

  v9 = (void *)v15[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __43__IXAppInstallCoordinator_resumeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator resumeWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __43__IXAppInstallCoordinator_resumeWithError___block_invoke_242(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isPaused:(BOOL *)a3 withError:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__IXAppInstallCoordinator_isPaused_withError___block_invoke;
  v15[3] = &unk_1E4DC4430;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __46__IXAppInstallCoordinator_isPaused_withError___block_invoke_243;
  v14[3] = &unk_1E4DC4548;
  v14[4] = &v16;
  v14[5] = a3;
  objc_msgSend(v9, "_remote_IXSCoordinatedAppInstall:getIsPausedWithCompletion:", v10, v14);

  v11 = (void *)v17[5];
  if (a4 && v11)
  {
    *a4 = objc_retainAutorelease(v11);
    v11 = (void *)v17[5];
  }
  v12 = v11 == 0;
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __46__IXAppInstallCoordinator_isPaused_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator isPaused:withError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __46__IXAppInstallCoordinator_isPaused_withError___block_invoke_243(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    v6 = v7;
  }
  else
  {
    **(_BYTE **)(a1 + 40) = a2;
  }

}

- (BOOL)prioritizeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke;
  v13[3] = &unk_1E4DC4430;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke_244;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v14;
  objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:prioritizeWithCompletion:", v8, v12);

  v9 = (void *)v15[5];
  if (a3 && v9)
  {
    *a3 = objc_retainAutorelease(v9);
    v9 = (void *)v15[5];
  }
  v10 = v9 == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "-[IXAppInstallCoordinator prioritizeWithError:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to send resume message to coordinator: %@ : %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __47__IXAppInstallCoordinator_prioritizeWithError___block_invoke_244(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IXStringForClientID(-[IXAppInstallCoordinator creatorIdentifier](self, "creatorIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> identity:%@ uuid:%@ creator:%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)descriptionWithRemoteState
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IXStringForClientID(-[IXAppInstallCoordinator creatorIdentifier](self, "creatorIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IXAppInstallCoordinator coordinationState](self, "coordinationState");
  if (v9 > 0x1C)
    v10 = 0;
  else
    v10 = off_1E4DC4A10[v9];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@<%p> identity:%@ uuid:%@ creator:%@ state:%@>"), v5, self, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)coordinationState
{
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke;
  block[3] = &unk_1E4DC47A0;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  v5 = v14[3];
  if (!v5)
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke_2;
    v11[3] = &unk_1E4DC44F8;
    v11[4] = self;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXAppInstallCoordinator uniqueIdentifier](self, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __44__IXAppInstallCoordinator_coordinationState__block_invoke_249;
    v10[3] = &unk_1E4DC4700;
    v10[4] = self;
    v10[5] = &v13;
    objc_msgSend(v7, "_remote_IXSCoordinatedAppInstall:getCoordinationState:", v8, v10);

    v5 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __44__IXAppInstallCoordinator_coordinationState__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = 1;
  }
  else
  {
    if (!*(_BYTE *)(v1 + 8))
      return result;
    v2 = 28;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __44__IXAppInstallCoordinator_coordinationState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[IXAppInstallCoordinator coordinationState]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordination state for %@ : %@", (uint8_t *)&v6, 0x20u);
  }

}

void __44__IXAppInstallCoordinator_coordinationState__block_invoke_249(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[IXAppInstallCoordinator coordinationState]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to get coordination state for %@ : %@", (uint8_t *)&v8, 0x20u);
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (NSString)bundleID
{
  void *v2;
  void *v3;

  -[IXAppInstallCoordinator identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IXApplicationIdentity)identity
{
  void *v2;
  void *v3;

  -[IXAppInstallCoordinator seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IXApplicationIdentity *)v3;
}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[IXAppInstallCoordinator seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (unint64_t)creatorIdentifier
{
  void *v2;
  unint64_t v3;

  -[IXAppInstallCoordinator seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "creator");

  return v3;
}

- (unsigned)creatorEUID
{
  void *v2;
  unsigned int v3;

  -[IXAppInstallCoordinator seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "creatorEUID");

  return v3;
}

- (void)_clientDelegate_didRegisterForObservation
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got observer registration delegate", buf, 0x16u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__IXAppInstallCoordinator__clientDelegate_didRegisterForObservation__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_async(v4, block);

}

void __68__IXAppInstallCoordinator__clientDelegate_didRegisterForObservation__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      v19 = 2112;
      v20 = v10;
      v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 0x800) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      v19 = 2112;
      v20 = v12;
      v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x800);
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorDidRegisterForObservation_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136316162;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2048;
      v24 = v2;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);

    }
    goto LABEL_12;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorDidRegisterForObservation_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136316162;
    v18 = "-[IXAppInstallCoordinator _clientDelegate_didRegisterForObservation]_block_invoke";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    v25 = 2048;
    v26 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);

  }
  objc_msgSend(v2, "coordinatorDidRegisterForObservation:", *(_QWORD *)(a1 + 32));
LABEL_13:

}

- (void)_clientDelegate_shouldPrioritize
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should prioritize delegate", buf, 0x16u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__IXAppInstallCoordinator__clientDelegate_shouldPrioritize__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_async(v4, block);

}

void __59__IXAppInstallCoordinator__clientDelegate_shouldPrioritize__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 136315394;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorShouldPrioritize_);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136316162;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = v2;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorShouldPrioritize_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPrioritize]_block_invoke";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(v2, "coordinatorShouldPrioritize:", *(_QWORD *)(a1 + 32));
LABEL_11:

}

- (void)_clientDelegate_shouldResume
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should resume delegate", buf, 0x16u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__IXAppInstallCoordinator__clientDelegate_shouldResume__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_async(v4, block);

}

void __55__IXAppInstallCoordinator__clientDelegate_shouldResume__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 136315394;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorShouldResume_);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136316162;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = v2;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorShouldResume_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldResume]_block_invoke";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(v2, "coordinatorShouldResume:", *(_QWORD *)(a1 + 32));
LABEL_11:

}

- (void)_clientDelegate_shouldPause
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should pause delegate", buf, 0x16u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__IXAppInstallCoordinator__clientDelegate_shouldPause__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_async(v4, block);

}

void __54__IXAppInstallCoordinator__clientDelegate_shouldPause__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v15 = 136315394;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }
    goto LABEL_10;
  }
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorShouldPause_);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136316162;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = v2;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);

    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorShouldPause_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[IXAppInstallCoordinator _clientDelegate_shouldPause]_block_invoke";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2048;
    v24 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);

  }
  objc_msgSend(v2, "coordinatorShouldPause:", *(_QWORD *)(a1 + 32));
LABEL_11:

}

- (void)_clientDelegate_promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  IXAppInstallCoordinator *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v9 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]";
    v10 = 2112;
    v11 = self;
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got promise did begin fulfillment for identifier %lu", buf, 0x20u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__IXAppInstallCoordinator__clientDelegate_promiseDidBeginFulfillmentWithIdentifier___block_invoke;
  v7[3] = &unk_1E4DC4778;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

void __84__IXAppInstallCoordinator__clientDelegate_promiseDidBeginFulfillmentWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v29 = 136315394;
      v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      v31 = 2112;
      v32 = v6;
      v7 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_10:
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v29, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v3 = *(_QWORD *)(a1 + 40) - 1;
  if (v3 > 7)
    v4 = 0;
  else
    v4 = qword_1A4C55440[v3];
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & v4) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v29 = 136315394;
      v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      v31 = 2112;
      v32 = v8;
      v7 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | v4);
  v9 = objc_opt_respondsToSelector();
  if ((v9 & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_promiseDidBeginFulfillmentWithIdentifier_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136316162;
      v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v14;
      v37 = 2048;
      v38 = v2;
      _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);

    }
    objc_msgSend(v2, "promiseDidBeginFulfillmentWithIdentifier:", *(_QWORD *)(a1 + 40));
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_12;
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136316162;
        v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
        v31 = 2112;
        v32 = v25;
        v33 = 2112;
        v34 = v27;
        v35 = 2048;
        v36 = v2;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v29, 0x34u);

      }
      goto LABEL_11;
    }
    goto LABEL_23;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinator_configuredPromisePromiseDidBeginFulfillment_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136316162;
    v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v17;
    v35 = 2112;
    v36 = v19;
    v37 = 2048;
    v38 = v2;
    _os_log_impl(&dword_1A4BF6000, v15, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);

  }
  objc_msgSend(v2, "coordinator:configuredPromisePromiseDidBeginFulfillment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
LABEL_23:
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_coordinator_configuredPromiseDidBeginFulfillment_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136316162;
      v30 = "-[IXAppInstallCoordinator _clientDelegate_promiseDidBeginFulfillmentWithIdentifier:]_block_invoke";
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      v35 = 2112;
      v36 = v24;
      v37 = 2048;
      v38 = v2;
      _os_log_impl(&dword_1A4BF6000, v20, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v29, 0x34u);

    }
    objc_msgSend(v2, "coordinator:configuredPromiseDidBeginFulfillment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
LABEL_12:

}

- (void)_clientDelegate_shouldBeginRestoringUserData
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  IXAppInstallCoordinator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should begin restoring user data delegate", buf, 0x16u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__IXAppInstallCoordinator__clientDelegate_shouldBeginRestoringUserData__block_invoke;
  block[3] = &unk_1E4DC4890;
  block[4] = self;
  dispatch_async(v4, block);

}

void __71__IXAppInstallCoordinator__clientDelegate_shouldBeginRestoringUserData__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      v19 = 2112;
      v20 = v10;
      v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 0x80) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      v19 = 2112;
      v20 = v12;
      v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x80);
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136316162;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2048;
      v24 = v2;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);

    }
    goto LABEL_12;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorShouldBeginRestoringUserData_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136316162;
    v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginRestoringUserData]_block_invoke";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    v25 = 2048;
    v26 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);

  }
  objc_msgSend(v2, "coordinatorShouldBeginRestoringUserData:", *(_QWORD *)(a1 + 32));
LABEL_13:

}

- (void)_clientDelegate_shouldBeginPostProcessingForApplicationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  IXAppInstallCoordinator *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got should begin post processing delegate for app record %@", buf, 0x20u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__IXAppInstallCoordinator__clientDelegate_shouldBeginPostProcessingForApplicationRecord___block_invoke;
  v8[3] = &unk_1E4DC4728;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __89__IXAppInstallCoordinator__clientDelegate_shouldBeginPostProcessingForApplicationRecord___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      v19 = 2112;
      v20 = v10;
      v11 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_11:
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 0x2000) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v17 = 136315394;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      v19 = 2112;
      v20 = v12;
      v11 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x2000);
  v3 = objc_opt_respondsToSelector();
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136316162;
      v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2048;
      v24 = v2;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v17, 0x34u);

    }
    goto LABEL_12;
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(sel_coordinatorShouldBeginPostProcessing_forApplicationRecord_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136316162;
    v18 = "-[IXAppInstallCoordinator _clientDelegate_shouldBeginPostProcessingForApplicationRecord:]_block_invoke";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    v25 = 2048;
    v26 = v2;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v17, 0x34u);

  }
  objc_msgSend(v2, "coordinatorShouldBeginPostProcessing:forApplicationRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_13:

}

- (void)_clientDelegate_placeholderDidInstallForApplicationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  IXAppInstallCoordinator *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got placeholder did install delegate for app record %@", buf, 0x20u);
  }

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__IXAppInstallCoordinator__clientDelegate_placeholderDidInstallForApplicationRecord___block_invoke;
  v8[3] = &unk_1E4DC4728;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __85__IXAppInstallCoordinator__clientDelegate_placeholderDidInstallForApplicationRecord___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v9;
      v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 4) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v11;
      v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v7;
      v30 = 2048;
      v31 = v2;
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

    }
    objc_msgSend(v2, "coordinatorDidInstallPlaceholder:", *(_QWORD *)(a1 + 32));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_16:
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136316162;
        v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v16;
        v30 = 2048;
        v31 = v2;
        _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

      }
      objc_msgSend(v2, "coordinatorDidInstallPlaceholder:forApplicationRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorDidInstallPlaceholder_forApplicationRecord_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_placeholderDidInstallForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v20;
      v28 = 2048;
      v29 = v2;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);

    }
  }
LABEL_14:

}

- (void)_clientDelegate_didCompleteForApplicationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  IXAppInstallCoordinator *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: %@: Got completion delegate for app record %@", buf, 0x20u);
  }

  -[IXAppInstallCoordinator setComplete:forApplicationRecord:](self, "setComplete:forApplicationRecord:", 1, v4);
  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__IXAppInstallCoordinator__clientDelegate_didCompleteForApplicationRecord___block_invoke;
  v8[3] = &unk_1E4DC4728;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __75__IXAppInstallCoordinator__clientDelegate_didCompleteForApplicationRecord___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v9;
      v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 2) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v11;
      v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v7;
      v30 = 2048;
      v31 = v2;
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

    }
    objc_msgSend(v2, "coordinatorDidCompleteSuccessfully:", *(_QWORD *)(a1 + 32));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_16:
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136316162;
        v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v16;
        v30 = 2048;
        v31 = v2;
        _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

      }
      objc_msgSend(v2, "coordinatorDidCompleteSuccessfully:forApplicationRecord:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      goto LABEL_14;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinatorDidCompleteSuccessfully_forApplicationRecord_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCompleteForApplicationRecord:]_block_invoke";
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v20;
      v28 = 2048;
      v29 = v2;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);

    }
  }
LABEL_14:

}

- (void)_clientDelegate_didCancelWithError:(id)a3 client:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  _QWORD block[5];
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  IXAppInstallCoordinator *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    IXStringForClientID(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v21 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]";
    v22 = 2112;
    v23 = self;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: Got cancel delegate with reason %@ client %@", buf, 0x2Au);

  }
  -[IXAppInstallCoordinator internalQueue](self, "internalQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke;
  block[3] = &unk_1E4DC3EB8;
  block[4] = self;
  v11 = v6;
  v18 = v11;
  v19 = a4;
  dispatch_sync(v9, block);

  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke_2;
  v14[3] = &unk_1E4DC3EB8;
  v14[4] = self;
  v15 = v11;
  v16 = a4;
  v13 = v11;
  dispatch_async(v12, v14);

}

void __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
}

void __69__IXAppInstallCoordinator__clientDelegate_didCancelWithError_client___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke_2";
      v24 = 2112;
      v25 = v9;
      v10 = "%s: %@: Ignoring delegate message; no observer set";
LABEL_12:
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v22 = 136315394;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      v24 = 2112;
      v25 = v11;
      v10 = "%s: %@: Ignoring delegate message; already called";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(sel_coordinator_canceledWithReason_);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v7;
      v30 = 2048;
      v31 = v2;
      _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

    }
    objc_msgSend(v2, "coordinator:canceledWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_16:
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 136316162;
        v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v16;
        v30 = 2048;
        v31 = v2;
        _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v22, 0x34u);

      }
      objc_msgSend(v2, "coordinator:canceledWithReason:client:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      goto LABEL_14;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_coordinator_canceledWithReason_client_);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[IXAppInstallCoordinator _clientDelegate_didCancelWithError:client:]_block_invoke";
      v24 = 2112;
      v25 = v18;
      v26 = 2112;
      v27 = v20;
      v28 = 2048;
      v29 = v2;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@ (or any deprecated equivalent)", (uint8_t *)&v22, 0x34u);

    }
  }
LABEL_14:

}

- (void)_clientDelegate_didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5
{
  NSObject *v9;
  __CFString *v10;
  NSObject *v11;
  _QWORD block[8];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  IXAppInstallCoordinator *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown progress value %lu"), a4);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E4DC4AF8[a4];
    }
    *(_DWORD *)buf = 136316162;
    v14 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]";
    v15 = 2112;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    v19 = 2112;
    v20 = v10;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1A4BF6000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@: Got did update progress delegate with percentComplete %f phase %@ overallProgress %f", buf, 0x34u);

  }
  -[IXAppInstallCoordinator observerCalloutQueue](self, "observerCalloutQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__IXAppInstallCoordinator__clientDelegate_didUpdateProgress_forPhase_overallProgress___block_invoke;
  block[3] = &unk_1E4DC48B8;
  block[4] = self;
  *(double *)&block[5] = a3;
  block[6] = a4;
  *(double *)&block[7] = a5;
  dispatch_async(v11, block);

}

void __86__IXAppInstallCoordinator__clientDelegate_didUpdateProgress_forPhase_overallProgress___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(sel_coordinator_didUpdateProgress_forPhase_overallProgress_);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136316162;
        v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
        v17 = 2112;
        v18 = v4;
        v19 = 2112;
        v20 = v5;
        v21 = 2112;
        v22 = v7;
        v23 = 2048;
        v24 = v2;
        _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: %@: Calling selector %@ on observer <%@ 0x%p>", (uint8_t *)&v15, 0x34u);

      }
      objc_msgSend(v2, "coordinator:didUpdateProgress:forPhase:overallProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 40), *(double *)(a1 + 56));
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "observersCalled") & 0x1000) == 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_coordinator_didUpdateProgress_forPhase_overallProgress_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136316162;
        v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v13;
        v21 = 2048;
        v22 = v2;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: Observer <%@ 0x%p> does not respond to %@", (uint8_t *)&v15, 0x34u);

      }
      objc_msgSend(*(id *)(a1 + 32), "setObserversCalled:", objc_msgSend(*(id *)(a1 + 32), "observersCalled") | 0x1000);
    }
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 136315394;
      v16 = "-[IXAppInstallCoordinator _clientDelegate_didUpdateProgress:forPhase:overallProgress:]_block_invoke";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: Ignoring delegate message; no observer set",
        (uint8_t *)&v15,
        0x16u);
    }

  }
}

- (IXAppInstallCoordinatorSeed)seed
{
  return self->_seed;
}

- (LSApplicationRecord)completedApplicationRecord
{
  return self->_completedApplicationRecord;
}

- (BOOL)isRegisteredWithDaemon
{
  return self->_isRegisteredWithDaemon;
}

- (void)setIsRegisteredWithDaemon:(BOOL)a3
{
  self->_isRegisteredWithDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedApplicationRecord, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)purgeAllCoordinatorsAndPromisesForCreator:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke;
  v9[3] = &unk_1E4DC41B0;
  v9[4] = &v10;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke_602;
  v8[3] = &unk_1E4DC41B0;
  v8[4] = &v10;
  objc_msgSend(v6, "_remote_purgeRegisteredCoordinatorsAndPromisesForCreator:completion:", a3, v8);

  LOBYTE(a3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return a3;
}

void __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator(IXTesting) purgeAllCoordinatorsAndPromisesForCreator:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __80__IXAppInstallCoordinator_IXTesting__purgeAllCoordinatorsAndPromisesForCreator___block_invoke_602(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "+[IXAppInstallCoordinator(IXTesting) purgeAllCoordinatorsAndPromisesForCreator:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to purge registered coordinators and promises: %@", (uint8_t *)&v5, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

+ (BOOL)killDaemonForTesting
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke;
  v16[3] = &unk_1E4DC41B0;
  v16[4] = &v17;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_603;
  v15[3] = &unk_1E4DC48E0;
  v15[4] = &v17;
  v15[5] = &v25;
  objc_msgSend(v4, "_remote_pingDaemonWithCompletion:", v15);

  if (*((_BYTE *)v18 + 24))
  {
    +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_605;
    v14[3] = &unk_1E4DC41B0;
    v14[4] = &v17;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_remote_killDaemonForTestingWithCompletion:", &__block_literal_global_607);

    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_608;
    v13[3] = &unk_1E4DC4948;
    v13[4] = &v21;
    v7 = +[IXServerConnection retrySynchronousIPC:](IXServerConnection, "retrySynchronousIPC:", v13);
    if (*((_DWORD *)v26 + 6) == *((_DWORD *)v22 + 6))
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *((_DWORD *)v26 + 6);
        v10 = *((_DWORD *)v22 + 6);
        *(_DWORD *)buf = 136315650;
        v30 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]";
        v31 = 1024;
        v32 = v9;
        v33 = 1024;
        v34 = v10;
        _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Daemon restart didn't work - before PID equal to after PID (%d == %d)", buf, 0x18u);
      }

      v11 = 0;
      *((_BYTE *)v18 + 24) = 0;
    }
    else
    {
      v11 = *((_BYTE *)v18 + 24) != 0;
    }
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v11;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_603(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_605(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 4097)
      goto LABEL_8;
  }
  else
  {

  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:

}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_606(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      v10 = 2112;
      v11 = v2;
      v5 = "%s: Got completion error: %@";
      v6 = v3;
      v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    v8 = 136315138;
    v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
    v5 = "%s: Got completion";
    v6 = v3;
    v7 = 12;
    goto LABEL_6;
  }

}

id __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_608(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_2;
  v9[3] = &unk_1E4DC41B0;
  v9[4] = &v10;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_609;
  v8[3] = &unk_1E4DC48E0;
  v5 = *(_QWORD *)(a1 + 32);
  v8[4] = &v10;
  v8[5] = v5;
  objc_msgSend(v4, "_remote_pingDaemonWithCompletion:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __58__IXAppInstallCoordinator_IXTesting__killDaemonForTesting__block_invoke_609(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) killDaemonForTesting]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

+ (int)daemonPid
{
  id v2;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke;
  v5[3] = &unk_1E4DC4948;
  v5[4] = &v6;
  v2 = +[IXServerConnection retrySynchronousIPC:](IXServerConnection, "retrySynchronousIPC:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_2;
  v9[3] = &unk_1E4DC41B0;
  v9[4] = &v10;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_611;
  v8[3] = &unk_1E4DC48E0;
  v5 = *(_QWORD *)(a1 + 32);
  v8[4] = &v10;
  v8[5] = v5;
  objc_msgSend(v4, "_remote_pingDaemonWithCompletion:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator(IXTesting) daemonPid]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __47__IXAppInstallCoordinator_IXTesting__daemonPid__block_invoke_611(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) daemonPid]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

+ (BOOL)postNSCurrentLocaleDidChangeNotification
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke;
  v7[3] = &unk_1E4DC41B0;
  v7[4] = &v8;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke_612;
  v6[3] = &unk_1E4DC41B0;
  v6[4] = &v8;
  objc_msgSend(v4, "_remote_postNSCurrentLocaleDidChangeNotification:", v6);

  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 4097)
      goto LABEL_8;
  }
  else
  {

  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator(IXTesting) postNSCurrentLocaleDidChangeNotification]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_8:

}

void __78__IXAppInstallCoordinator_IXTesting__postNSCurrentLocaleDidChangeNotification__block_invoke_612(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "+[IXAppInstallCoordinator(IXTesting) postNSCurrentLocaleDidChangeNotification]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Posting NSCurrentLocaleDidChange got completion error: %@", (uint8_t *)&v5, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }

}

+ (BOOL)setTestingEnabled:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_613);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke_614;
  v7[3] = &unk_1E4DC41B0;
  v7[4] = &v8;
  objc_msgSend(v5, "_remote_setTestingEnabled:completion:", v3, v7);

  LOBYTE(v3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __56__IXAppInstallCoordinator_IXTesting__setTestingEnabled___block_invoke_614(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      v5 = "%s: Got completion error: %@";
      v6 = v4;
      v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[IXAppInstallCoordinator(IXTesting) setTestingEnabled:]_block_invoke";
      v5 = "%s: Got completion";
      v6 = v4;
      v7 = 12;
      goto LABEL_6;
    }
  }

}

+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4 testSpecificValidationData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v7 = a3;
  v8 = a5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_615);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke_616;
  v12[3] = &unk_1E4DC41B0;
  v12[4] = &v13;
  objc_msgSend(v10, "_remote_setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:completion:", v7, a4, v8, v12);

  LOBYTE(a4) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return a4;
}

void __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __105__IXAppInstallCoordinator_IXTesting__setTestModeForIdentifierPrefix_testMode_testSpecificValidationData___block_invoke_616(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      v5 = "%s: Got completion error: %@";
      v6 = v4;
      v7 = 22;
LABEL_6:
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[IXAppInstallCoordinator(IXTesting) setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:]_block_invoke";
      v5 = "%s: Got completion";
      v6 = v4;
      v7 = 12;
      goto LABEL_6;
    }
  }

}

+ (BOOL)setTestModeForIdentifierPrefix:(id)a3 testMode:(unint64_t)a4
{
  return objc_msgSend(a1, "setTestModeForIdentifierPrefix:testMode:testSpecificValidationData:", a3, a4, 0);
}

+ (BOOL)simulateClientDeath
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  int v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke;
  v16[3] = &unk_1E4DC41B0;
  v16[4] = &v17;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_617;
  v15[3] = &unk_1E4DC48E0;
  v15[4] = &v17;
  v15[5] = &v25;
  objc_msgSend(v4, "_remote_pingDaemonWithCompletion:", v15);

  if (*((_BYTE *)v18 + 24))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]";
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Simulating client death by resetting daemon connection", buf, 0xCu);
    }

    objc_msgSend(v2, "resetDaemonConnection");
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_618;
    v12[3] = &unk_1E4DC49B0;
    v13 = v2;
    v14 = &v21;
    v6 = +[IXServerConnection retrySynchronousIPC:](IXServerConnection, "retrySynchronousIPC:", v12);
    if (*((_DWORD *)v26 + 6) == *((_DWORD *)v22 + 6))
    {
      v7 = *((_BYTE *)v18 + 24) != 0;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *((_DWORD *)v26 + 6);
        v10 = *((_DWORD *)v22 + 6);
        *(_DWORD *)buf = 136315650;
        v30 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]";
        v31 = 1024;
        v32 = v9;
        v33 = 1024;
        v34 = v10;
        _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Daemon died when we reset our connection to it (%d != %d)", buf, 0x18u);
      }

      v7 = 0;
      *((_BYTE *)v18 + 24) = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_617(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

id __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_618(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v3 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_2;
  v9[3] = &unk_1E4DC41B0;
  v9[4] = &v10;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_619;
  v8[3] = &unk_1E4DC48E0;
  v5 = *(_QWORD *)(a1 + 40);
  v8[4] = &v10;
  v8[5] = v5;
  objc_msgSend(v4, "_remote_pingDaemonWithCompletion:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Ping got error %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __57__IXAppInstallCoordinator_IXTesting__simulateClientDeath__block_invoke_619(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[IXAppInstallCoordinator(IXTesting) simulateClientDeath]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1A4BF6000, v7, OS_LOG_TYPE_DEFAULT, "%s: Ping got completion error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

+ (BOOL)associateMultiPersonaAppsWithBundleIDs:(id)a3 withPersona:(id)a4 withError:(id *)a5
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:].cold.1(v6);

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]", 34, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is not available on this platform."), v7, (uint64_t)"+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return 0;
}

+ (BOOL)registerContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[6];
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

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke;
  v20[3] = &unk_1E4DC4048;
  v20[4] = &v21;
  v20[5] = &v27;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1;
  v16[3] = &unk_1E4DC4458;
  v12 = v7;
  v17 = v12;
  v18 = &v21;
  v19 = &v27;
  objc_msgSend(v11, "_remote_registerContentsForDiskImageAtURL:options:completion:", v12, v8, v16);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1_cold_1(a1);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;

}

+ (BOOL)unregisterContentsForDiskImageAtURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[6];
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

  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke;
  v20[3] = &unk_1E4DC4048;
  v20[4] = &v21;
  v20[5] = &v27;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3;
  v16[3] = &unk_1E4DC4458;
  v12 = v7;
  v17 = v12;
  v18 = &v21;
  v19 = &v27;
  objc_msgSend(v11, "_remote_unregisterContentsForDiskImageAtURL:options:completion:", v12, v8, v16);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if ((a2 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3_cold_1(a1);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;

}

+ (id)_coordinatorForIdentity:(id)a3 created:(BOOL *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __objc2_class *v11;
  id *v12;
  uint64_t *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v7, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0);

  if (v10 && (objc_msgSend(v10, "isPlaceholder") & 1) == 0)
  {
    v11 = IXUpdatingAppInstallCoordinator;
    v19 = 0;
    v12 = (id *)&v19;
    v13 = &v19;
  }
  else
  {
    v11 = IXInitiatingAppInstallCoordinator;
    v18 = 0;
    v12 = (id *)&v18;
    v13 = &v18;
  }
  -[__objc2_class processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](v11, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v7, 12, 1, a4, v13, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v12;
  v16 = v15;
  if (a5 && !v14)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (void)installApplication:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "_beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:", a3, a4, a5, a6, 0, a7);
}

+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v10 = a5;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_class();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __136__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completion___block_invoke;
  v20[3] = &unk_1E4DC4EC8;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "_beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:", v17, v16, v10, v15, v14, v20);

}

void __136__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "bundleID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)_beginInstallForURL:(id)a3 forPersonaUniqueString:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 progressBlock:(id)a7 completionWithIdentity:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v11 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (sAppInstallCoordinatorQueueOnce != -1)
    dispatch_once(&sAppInstallCoordinatorQueueOnce, &__block_literal_global_3);
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "path");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    *(_DWORD *)buf = 136315906;
    v38 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:"
          "progressBlock:completionWithIdentity:]";
    v39 = 2112;
    if (v11)
      v22 = 89;
    else
      v22 = 78;
    v40 = v20;
    v41 = 1024;
    v42 = v22;
    v43 = 2112;
    v44 = v16;
    _os_log_impl(&dword_1A4BF6000, v19, OS_LOG_TYPE_DEFAULT, "%s: Beginning install for %@ consuming source:%c options:%@", buf, 0x26u);

  }
  v23 = sAppInstallCoordinatorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117;
  block[3] = &unk_1E4DC4F18;
  v36 = v11;
  v30 = v14;
  v31 = v16;
  v32 = v15;
  v33 = v18;
  v34 = v17;
  v35 = a1;
  v24 = v17;
  v25 = v15;
  v26 = v16;
  v27 = v18;
  v28 = v14;
  dispatch_async(v23, block);

}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)sOutstandingDelegates;
  sOutstandingDelegates = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.installcoordination.simple_install_coordinator", v4);
  v3 = (void *)sAppInstallCoordinatorQueue;
  sAppInstallCoordinatorQueue = (uint64_t)v2;

}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117(uint64_t a1)
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IXPromisedTransferToPath *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  id v35;
  IXPromisedTransferToPath *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int v42;
  id v43;
  int v44;
  int v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  int v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  IXApplicationIdentity *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  uint64_t *v97;
  char v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  char v105;
  char v106;
  _BYTE v107[32];
  uint8_t buf[4];
  const char *v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v106 = 0;
  +[IXFileManager defaultManager](IXFileManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 1;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__5;
  v103 = __Block_byref_object_dispose__5;
  v104 = 0;
  v78 = *(id *)(a1 + 32);
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119;
  v93[3] = &unk_1E4DC4EF0;
  v98 = *(_BYTE *)(a1 + 80);
  v3 = v2;
  v94 = v3;
  v95 = *(id *)(a1 + 32);
  v97 = &v99;
  v96 = *(id *)(a1 + 56);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A58E8](v93);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v79 = v5;
    if (objc_msgSend(v79, "installTargetType") != 1)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_8();

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 303, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("This SPI can only install apps"), v7, v72);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else
  {
    v79 = (id)objc_opt_new();
    objc_msgSend(v79, "setInstallTargetType:", 1);
  }
  v9 = *(_QWORD *)(a1 + 32);
  v92 = 0;
  v10 = objc_msgSend(v3, "itemExistsAtURL:isDirectory:error:", v9, &v105, &v92);
  v11 = v92;
  v8 = v11;
  if (!v10)
  {
LABEL_13:
    v15 = 0;
    v14 = 0;
LABEL_14:
    v16 = 0;
    v17 = 0;
    v76 = 0;
    v77 = 0;
    goto LABEL_15;
  }
  if (v105)
  {
    v12 = v11;
  }
  else
  {
    v91 = v11;
    objc_msgSend(v3, "createTemporaryExtractionDirectoryWithError:", &v91);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v91;

    v31 = (void *)v100[5];
    v100[5] = v29;

    v32 = v100[5];
    if (!v32)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_3((uint64_t)v30, v49, v50, v51, v52, v53, v54, v55);

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 318, CFSTR("IXErrorDomain"), 0x2AuLL, v30, 0, CFSTR("Failed to create directory for extraction"), v56, v72);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v17 = 0;
      v76 = 0;
      v77 = 0;
      goto LABEL_65;
    }
    v33 = *(_QWORD *)(a1 + 32);
    v90 = v30;
    v34 = objc_msgSend(MEMORY[0x1E0D4E428], "extractZipArchiveAtURL:toURL:withError:", v33, v32, &v90);
    v12 = v90;

    if ((v34 & 1) == 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "path");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v100[5], "path");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v109 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:opt"
               "ions:progressBlock:completionWithIdentity:]_block_invoke";
        v110 = 2112;
        v111 = v68;
        v112 = 2112;
        v113 = v69;
        v114 = 2112;
        v115 = v12;
        _os_log_error_impl(&dword_1A4BF6000, v57, OS_LOG_TYPE_ERROR, "%s: Failed to extract %@ to %@ : %@", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 32), "path");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v100[5], "path");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 323, CFSTR("IXErrorDomain"), 0x2AuLL, v12, 0, CFSTR("Failed to extract %@ to %@"), v58, (uint64_t)v30);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      v17 = 0;
      v76 = 0;
      v77 = 0;
      goto LABEL_63;
    }
    v35 = (id)v100[5];

    v78 = v35;
  }
  objc_msgSend(v79, "iTunesMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v12;
  +[IXPlaceholder placeholderForInstallable:client:installType:metadata:error:](IXPlaceholder, "placeholderForInstallable:client:installType:metadata:error:", v78, 12, 1, v13, &v89);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v89;

  if (!v14)
  {
    v15 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v14, "bundleID");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
    v76 = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:personaUniqueString:", v77, *(_QWORD *)(a1 + 48));
  else
    v76 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v77);
  v36 = [IXPromisedTransferToPath alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App Asset: %@"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IXPromisedTransferToPath initWithName:client:transferPath:diskSpaceNeeded:](v36, "initWithName:client:transferPath:diskSpaceNeeded:", v37, 12, v78, 0);

  if (!v17)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_4();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 344, CFSTR("IXErrorDomain"), 2uLL, 0, 0, CFSTR("Failed to create app asset promise"), v47, (uint64_t)v77);
    v48 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v30 = v8;
    goto LABEL_56;
  }
  if (!*(_BYTE *)(a1 + 80) && !v100[5])
    -[IXPromisedTransferToPath setShouldCopy:](v17, "setShouldCopy:", 1);
  v38 = *(void **)(a1 + 72);
  v88 = v8;
  objc_msgSend(v38, "_coordinatorForIdentity:created:error:", v76, &v106, &v88);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v88;

  if (!v39)
  {
    v15 = 0;
    v16 = 0;
    v8 = v30;
    goto LABEL_15;
  }
  if (v106)
  {
    v15 = v39;
    goto LABEL_46;
  }
  if (objc_msgSend(v39, "creatorIdentifier") != 12)
  {

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_7();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 397, CFSTR("IXErrorDomain"), 0x1DuLL, 0, 0, CFSTR("A coordinated install for %@ (not initiated by IXClientSimpleSPI) is already pending."), v64, (uint64_t)v77);
    v48 = objc_claimAutoreleasedReturnValue();
LABEL_56:
    v8 = (id)v48;
LABEL_65:

    v15 = 0;
    v16 = 0;
    goto LABEL_15;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v109 = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options"
           ":progressBlock:completionWithIdentity:]_block_invoke";
    v110 = 2112;
    v111 = v77;
    _os_log_impl(&dword_1A4BF6000, v59, OS_LOG_TYPE_DEFAULT, "%s: A coordinated install for %@ is already pending. Trying to cancel the existing one to create a new one.", buf, 0x16u);
  }

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 370, CFSTR("IXErrorDomain"), 0x20uLL, 0, 0, CFSTR("IXSimpleInstaller canceling existing coordinator"), v60, (uint64_t)v77);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v87 = v30;
  v61 = objc_msgSend(v39, "cancelForReason:client:error:", v12, 12, &v87);
  v75 = v87;

  if (!v61)
  {

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_6();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 392, CFSTR("IXErrorDomain"), 0x1DuLL, 0, 0, CFSTR("Failed to cancel an already existing coordinator."), v66, v73);
    v67 = objc_claimAutoreleasedReturnValue();
    v30 = v75;
    goto LABEL_83;
  }
  v106 = 0;
  v62 = *(void **)(a1 + 72);
  v86 = v75;
  objc_msgSend(v62, "_coordinatorForIdentity:created:error:", v76, &v106, &v86);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v86;

  if (!v15)
  {
    v8 = v30;
    goto LABEL_64;
  }
  if (!v106)
  {

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_5();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 387, CFSTR("IXErrorDomain"), 0x1DuLL, 0, 0, CFSTR("Failed to re-create a coordinator for %@."), v71, (uint64_t)v77);
    v67 = objc_claimAutoreleasedReturnValue();
LABEL_83:
    v8 = (id)v67;
LABEL_63:

LABEL_64:
    v30 = v12;
    goto LABEL_65;
  }

LABEL_46:
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setBundleID:", v77);
  objc_msgSend(v16, "setCoordinator:", v15);
  objc_msgSend(v16, "setCompletion:", v4);
  objc_msgSend(v16, "setProgressBlock:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v15, "setObserver:", v16);
  if (objc_msgSend(v79, "isUserInitiated"))
  {
    v85 = v30;
    v40 = objc_msgSend(v15, "setImportance:error:", 3, &v85);
    v8 = v85;

    v30 = v8;
    if (!v40)
      goto LABEL_78;
  }
  v84 = v30;
  v41 = objc_msgSend(v15, "setInstallOptions:error:", v79, &v84);
  v8 = v84;

  if (!v41)
  {
LABEL_78:
    if (!v16)
      goto LABEL_15;
LABEL_79:
    objc_msgSend(v16, "setCompletion:", 0);
    goto LABEL_15;
  }
  v83 = v8;
  v42 = objc_msgSend(v15, "setAppAssetPromise:error:", v17, &v83);
  v43 = v83;

  if (!v42)
  {
    v8 = v43;
    goto LABEL_78;
  }
  v82 = v43;
  v44 = objc_msgSend(v15, "setInitialODRAssetPromises:error:", MEMORY[0x1E0C9AA60], &v82);
  v8 = v82;

  if (!v44)
    goto LABEL_78;
  -[IXPromisedTransferToPath setComplete:](v17, "setComplete:", 1);
  v81 = v8;
  v45 = objc_msgSend(v15, "setPlaceholderPromise:error:", v14, &v81);
  v18 = v81;

  if (v45)
  {
    _AddDelegateToMap(v16);
    goto LABEL_33;
  }
  v8 = v18;
  if (v16)
    goto LABEL_79;
LABEL_15:
  v18 = v8;
  if (!v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_2(v20, (uint64_t)buf, v19);
    }

    objc_msgSend(*(id *)(a1 + 32), "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completionWithIdentity:]_block_invoke", 463, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("An unknown error occured while installing %@"), v22, (uint64_t)v21);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v15)
  {
    objc_msgSend(v15, "setObserver:", 0);
    objc_msgSend(v15, "cancelForReason:client:error:", v18, 12, 0);
  }
  if (v14)
    objc_msgSend(v14, "cancelForReason:client:error:", v18, 12, 0);
  if (v17)
    -[IXDataPromise cancelForReason:client:error:](v17, "cancelForReason:client:error:", v18, 12, 0);
  v23 = v100[5];
  if (v23)
  {
    v80 = 0;
    v24 = objc_msgSend(v3, "removeItemAtURL:error:", v23, &v80);
    v25 = v80;
    if ((v24 & 1) == 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v100[5], "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_1(v27, (uint64_t)v25, (uint64_t)v107, v26);
      }

    }
    v28 = (void *)v100[5];
    v100[5] = 0;

  }
  if (*(_QWORD *)(a1 + 56))
    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v18);
LABEL_33:

  _Block_object_dispose(&v99, 8);
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 32);
    v20 = 0;
    v9 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v20);
    v10 = v20;
    if ((v9 & 1) == 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_2((id *)(a1 + 40), (uint64_t)v10, v11);

    }
  }
  else
  {
    v10 = 0;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    v13 = *(void **)(a1 + 32);
    v19 = v10;
    v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v19);
    v15 = v19;

    if ((v14 & 1) == 0)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_1(a1 + 56, (uint64_t)v15, v16);

    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

  }
  else
  {
    v15 = v10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "installApplication:consumeSource:options:legacyProgressBlock:completion:", a3, a4, a5, 0, a6);
}

+ (void)installApplication:(id)a3 options:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "installApplication:consumeSource:options:completion:", a3, 1, a4, a5);
}

+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v7 = a7;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:]", 512, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is not supported on this platform."), v9, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:options:completion:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_options_completion___block_invoke;
    block[3] = &unk_1E4DC4098;
    v14 = v7;
    v13 = v10;
    dispatch_async(v11, block);

  }
}

uint64_t __104__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v7 = a7;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:]", 526, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is not supported on this platform."), v9, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:options:completion:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_options_completion___block_invoke;
    block[3] = &unk_1E4DC4098;
    v14 = v7;
    v13 = v10;
    dispatch_async(v11, block);

  }
}

uint64_t __116__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toURL:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v8 = a8;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:]", 540, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is not supported on this platform."), v10, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toURL:consumeSource:shouldOverrideGatekeeper:options:completion:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke;
    block[3] = &unk_1E4DC4098;
    v15 = v8;
    v14 = v11;
    dispatch_async(v12, block);

  }
}

uint64_t __129__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toURL_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

+ (void)installApplication:(id)a3 toTargetDirectory:(id)a4 consumeSource:(BOOL)a5 shouldOverrideGatekeeper:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;

  v8 = a8;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:].cold.1();

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:]", 554, CFSTR("IXErrorDomain"), 0x22uLL, 0, 0, CFSTR("%s is not supported on this platform."), v10, (uint64_t)"+[IXAppInstallCoordinator(IXSimpleInstaller) installApplication:toTargetDirectory:consumeSource:shouldOverrideGatekeeper:options:completion:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = sAppInstallCoordinatorQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __141__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke;
    block[3] = &unk_1E4DC4098;
    v15 = v8;
    v14 = v11;
    dispatch_async(v12, block);

  }
}

uint64_t __141__IXAppInstallCoordinator_IXSimpleInstaller__installApplication_toTargetDirectory_consumeSource_shouldOverrideGatekeeper_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

+ (void)installApplication:(id)a3 consumeSource:(BOOL)a4 options:(id)a5 legacyProgressBlock:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  v9 = a4;
  v12 = a6;
  v13 = a7;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke;
  v22 = &unk_1E4DC4F40;
  v23 = v12;
  v24 = v13;
  v14 = v13;
  v15 = v12;
  v16 = a5;
  v17 = a3;
  v18 = (void *)MEMORY[0x1A85A58E8](&v19);
  objc_msgSend(a1, "_beginInstallForURL:forPersonaUniqueString:consumeSource:options:progressBlock:completion:", v17, 0, v9, v16, v15, v18, v19, v20, v21, v22);

}

void __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && *(_QWORD *)(a1 + 32))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31[0] = &v30;
    v31[1] = 0x3032000000;
    v31[2] = __Block_byref_object_copy__5;
    v31[3] = __Block_byref_object_dispose__5;
    v32 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = ___CreateLegacyCallbackErrorDict_block_invoke;
    v28 = &unk_1E4DC4F68;
    v29 = &v30;
    v10 = v8;
    v11 = *MEMORY[0x1E0CB3388];
    v12 = v10;
    do
    {
      if (!v27((uint64_t)&v25, v12))
        break;
      objc_msgSend(v12, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v11);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    while (v14);

    v15 = *(void **)(v31[0] + 40);
    if (v15)
    {
      objc_msgSend(v15, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LegacyErrorString"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v18 = v17;
      if (!v17)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke_cold_1((uint64_t)v31, v19);

        v18 = CFSTR("APIInternalError");
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("Error"), v24, v25, v26);
      objc_msgSend(*(id *)(v31[0] + 40), "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D3ACD0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("ErrorDetail"));
      objc_msgSend(*(id *)(v31[0] + 40), "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("ErrorDescription"));

    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("APIInternalError"), CFSTR("Error"));
      objc_msgSend(v10, "description");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("ErrorDescription"));
    }

    _Block_object_dispose(&v30, 8);
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  IXApplicationIdentity *v14;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a3;
  v14 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v13);

  objc_msgSend(a1, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:completion:", v14, a4, v8, v7, v12);
}

+ (void)_demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 returnEarlyForTesting:(BOOL)a7 completion:(id)a8
{
  id v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  id *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  _QWORD block[4];
  _QWORD v30[2];

  v13 = a3;
  v14 = a8;
  if (sAppInstallCoordinatorQueueOnce_0 != -1)
    dispatch_once(&sAppInstallCoordinatorQueueOnce_0, &__block_literal_global_8);
  if (a4 - 1 >= 3)
  {
    v20 = sAppInstallCoordinatorQueue_0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2;
    block[3] = &unk_1E4DC52E8;
    v17 = (id *)v30;
    v30[0] = v14;
    v30[1] = a4;
    v21 = v14;
    dispatch_async(v20, block);
  }
  else
  {
    v15 = a4 + 6;
    v16 = sAppInstallCoordinatorQueue_0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100;
    v22[3] = &unk_1E4DC5310;
    v26 = a5;
    v17 = &v23;
    v18 = v13;
    v27 = a7;
    v23 = v18;
    v24 = v14;
    v28 = a6;
    v25 = v15;
    v19 = v14;
    dispatch_async(v16, v22);

  }
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v0 = objc_opt_new();
  v1 = (void *)sOutstandingDelegates_0;
  sOutstandingDelegates_0 = v0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.installcoordination.downgrade_to_placeholder_coordinator", v4);
  v3 = (void *)sAppInstallCoordinatorQueue_0;
  sAppInstallCoordinatorQueue_0 = (uint64_t)v2;

}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_cold_1(a1, v2, v3);

  _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 108, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Invalid IXAppInstallCoordinatorDemotionReason %lu passed to %s"), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  int v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  char v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWaitForDeletion:", *(unsigned __int8 *)(a1 + 56));
  v4 = (id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  v54 = 0;
  +[IXAppInstallCoordinator processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:](IXDemotingAppInstallCoordinator, "processScopedCoordinatorForAppWithIdentity:withClientID:createIfNotExisting:created:error:", v3, 12, 1, &v55, &v54);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v54;
  if (!v5)
    goto LABEL_32;
  if (v55)
  {
    if (IXBuildHasInternalDiagnostics() && *(_BYTE *)(a1 + 57))
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_7(v7);

      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 147, CFSTR("IXErrorDomain"), 0x36uLL, 0, 0, CFSTR("Triggered early return intended for testing."), v8, v44);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_44;
    }
    v53 = v6;
    v15 = objc_msgSend(v5, "setImportance:error:", 3, &v53);
    v16 = v53;

    if (v15)
    {
      if (*(_BYTE *)(a1 + 58))
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *v4;
          *(_DWORD *)buf = 136315394;
          v57 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReaso"
                "n:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
          v58 = 2112;
          v59 = v18;
          _os_log_impl(&dword_1A4BF6000, v17, OS_LOG_TYPE_DEFAULT, "%s: Client requested to ignore removability while demoting %@", buf, 0x16u);
        }

        goto LABEL_15;
      }
      v26 = *v4;
      v52 = v16;
      v27 = +[IXAppInstallCoordinator removabilityForAppWithIdentity:error:](IXAppInstallCoordinator, "removabilityForAppWithIdentity:error:", v26, &v52);
      v6 = v52;

      if (v27 == 1)
      {
        v16 = v6;
LABEL_15:
        v19 = objc_alloc(MEMORY[0x1E0CA5870]);
        objc_msgSend(*v4, "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v16;
        v13 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:allowPlaceholder:error:", v20, 1, &v51);
        v21 = v51;

        if (v13)
        {
          if (objc_msgSend(v13, "isPlaceholder"))
          {
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_5();

            _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 180, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("Cannot demote app with identity %@ because it is a placeholder"), v23, (uint64_t)*v4);
          }
          else
          {
            objc_msgSend(v13, "URL");
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v12 = (void *)v35;
              v36 = *(_QWORD *)(a1 + 48);
              v50 = v21;
              +[IXPlaceholder placeholderForInstallable:client:installType:metadata:error:](IXPlaceholder, "placeholderForInstallable:client:installType:metadata:error:", v35, 12, v36, 0, &v50);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = v50;

              if (v11)
              {
                v14 = (void *)objc_opt_new();
                objc_msgSend(*v4, "bundleID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setBundleID:", v37);

                objc_msgSend(v14, "setCoordinator:", v5);
                objc_msgSend(v5, "setObserver:", v14);
                v49 = v6;
                v46 = objc_msgSend(v5, "setInstallOptions:error:", v2, &v49);
                v9 = v49;

                if (v46)
                {
                  v38 = v9;
                  v48 = v9;
                  v47 = objc_msgSend(v5, "setPlaceholderPromise:error:", v11, &v48);
                  v9 = v48;

                  if (v47)
                  {
                    _AddDelegateToMap_0(v14);
                    objc_msgSend(v14, "setCompletion:", *(_QWORD *)(a1 + 40));
                    goto LABEL_44;
                  }
                }
                v6 = v9;
                if (v14)
                  objc_msgSend(v14, "setCompletion:", 0);
              }
              else
              {
                v14 = 0;
              }
              goto LABEL_34;
            }
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_6();

            _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 186, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("LSApplicationProxy for %@ did not contain a bundleURL during demotion"), v43, (uint64_t)*v4);
          }
          v6 = (id)objc_claimAutoreleasedReturnValue();

          v14 = 0;
          goto LABEL_33;
        }
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_4();

        _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 175, CFSTR("IXErrorDomain"), 1uLL, v21, 0, CFSTR("No LSApplicationRecord found for %@ during demotion"), v31, (uint64_t)*v4);
        v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        v14 = 0;
        v13 = 0;
LABEL_33:
        v12 = 0;
        v11 = 0;
        goto LABEL_34;
      }
      if (!v27)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *v4;
          *(_DWORD *)buf = 136315650;
          v57 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReaso"
                "n:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
          v58 = 2112;
          v59 = v29;
          v60 = 2112;
          v61 = v6;
          _os_log_impl(&dword_1A4BF6000, v28, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch removability for app with identity %@: %@", buf, 0x20u);
        }

        goto LABEL_32;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_3((uint64_t *)(a1 + 32), v27, v39);

      v40 = *v4;
      IXStringForAppRemovability(v27);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 166, CFSTR("IXErrorDomain"), 0x25uLL, 0, 0, CFSTR("Cannot demote app with identity %@ because removability is %@"), v41, (uint64_t)v40);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {

    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_2();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 140, CFSTR("IXErrorDomain"), 0x1DuLL, 0, 0, CFSTR("A demotion for %@ is already pending."), v25, (uint64_t)*v4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v5 = 0;
  }
  v14 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v6 = v16;
LABEL_34:
  v9 = v6;
  if (!v6)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_1();

    _CreateError((uint64_t)"+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke", 222, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("An unknown error occured while demoting %@"), v33, (uint64_t)*v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    objc_msgSend(v5, "setObserver:", 0);
    objc_msgSend(v5, "cancelForReason:client:error:", v9, 12, 0);
  }
  if (v11)
    objc_msgSend(v11, "cancelForReason:client:error:", v9, 12, 0);
  v34 = *(_QWORD *)(a1 + 40);
  if (v34)
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v9);
LABEL_44:

}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(a1, "demoteAppToPlaceholderWithBundleID:forReason:waitForDeletion:error:", a3, a4, 0, a5);
}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  IXApplicationIdentity *v11;

  v7 = a5;
  v10 = a3;
  v11 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v10);

  LOBYTE(a6) = objc_msgSend(a1, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:", v11, a4, v7, 0, a6);
  return (char)a6;
}

+ (void)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a1, "_demoteAppToPlaceholderWithBundleID:forReason:waitForDeletion:ignoreRemovability:completion:", a3, a4, a5, 0, a6);
}

+ (BOOL)demoteAppToPlaceholderWithBundleID:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  IXApplicationIdentity *v13;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v12);

  LOBYTE(a7) = objc_msgSend(a1, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:error:", v13, a4, v9, v8, a7);
  return (char)a7;
}

+ (void)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 completion:(id)a7
{
  objc_msgSend(a1, "_demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:", a3, a4, a5, a6, 0, a7);
}

+ (BOOL)demoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 ignoreRemovability:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  BOOL v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  v13 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __147__IXAppInstallCoordinator_IXDemoteToPlaceholder__demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_error___block_invoke;
  v19[3] = &unk_1E4DC5338;
  v21 = &v23;
  v22 = &v29;
  v14 = v13;
  v20 = v14;
  v15 = (void *)MEMORY[0x1A85A58E8](v19);
  objc_msgSend(a1, "demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:completion:", v12, a4, v9, v8, v15);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v16 = *((unsigned __int8 *)v30 + 24);
  if (a7 && !*((_BYTE *)v30 + 24))
  {
    *a7 = objc_retainAutorelease((id)v24[5]);
    v16 = *((unsigned __int8 *)v30 + 24);
  }
  v17 = v16 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void __147__IXAppInstallCoordinator_IXDemoteToPlaceholder__demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity:(id)a3 forReason:(unint64_t)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  BOOL v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __134__IXAppInstallCoordinator_IXDemoteToPlaceholderTesting__testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity_forReason_error___block_invoke;
  v15[3] = &unk_1E4DC5338;
  v17 = &v19;
  v18 = &v25;
  v10 = v9;
  v16 = v10;
  v11 = (void *)MEMORY[0x1A85A58E8](v15);
  objc_msgSend(a1, "_demoteAppToPlaceholderWithApplicationIdentity:forReason:waitForDeletion:ignoreRemovability:returnEarlyForTesting:completion:", v8, a4, 0, 0, 1, v11);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v12 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((_BYTE *)v26 + 24))
  {
    *a5 = objc_retainAutorelease((id)v20[5]);
    v12 = *((unsigned __int8 *)v26 + 24);
  }
  v13 = v12 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __134__IXAppInstallCoordinator_IXDemoteToPlaceholderTesting__testReturnEarlyDemoteAppToPlaceholderWithApplicationIdentity_forReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __72__IXAppInstallCoordinator__conveyCurrentPriorityBoostReplacingExisting___block_invoke_6_cold_1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_19();
  _os_log_debug_impl(&dword_1A4BF6000, v0, OS_LOG_TYPE_DEBUG, "%s: Completion block called in client for priority boost conveyance for coordinator UUID %@ : %@", (uint8_t *)v1, 0x20u);
  OUTLINED_FUNCTION_10();
}

+ (void)_validatePreconditionForIntent:(unint64_t)a1 matchesCurrentInstallStateForBundleID:(NSObject *)a2 .cold.1(unint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _StringForIXCoordinatorIntent(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_24(&dword_1A4BF6000, a2, v4, "%s: Unknown intent: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_10();
}

+ (void)_validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_24(&dword_1A4BF6000, v0, v1, "%s: Warning: client is attempting to create a promoting coordinator for %@, which is not currently installed at all.", (uint8_t *)v2);
  OUTLINED_FUNCTION_12();
}

+ (void)_validatePreconditionForIntent:(os_log_t)log matchesCurrentInstallStateForBundleID:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "+[IXAppInstallCoordinator _validatePreconditionForIntent:matchesCurrentInstallStateForBundleID:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_FAULT, "%s: Warning: client is attempting to create a promoting coordinator for %@, which is not currently a placeholder (%@).", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_10();
}

+ (void)_coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Expected a non-nil application identity : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)_coordinatorForAppWithIdentity:(_DWORD *)a3 targetingInstallationDomain:withClientID:intent:createIfNotExisting:requireMatchingIntent:scopeRequirement:created:error:.cold.2(void *a1, void *a2, _DWORD *a3)
{
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14((uint64_t)a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v7, v5, "%s: Failed to find class for coordinator intent %@ for coordinator %@ : %@", v6);

  OUTLINED_FUNCTION_16();
}

void __179__IXAppInstallCoordinator__coordinatorForAppWithIdentity_targetingInstallationDomain_withClientID_intent_createIfNotExisting_requireMatchingIntent_scopeRequirement_created_error___block_invoke_20_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a2, "intent");
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Expected to create coordinator with intent %lu but created object had intent %lu : %@", v4, v5, v6, v7, 2u);
}

+ (void)coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s must be called on a concrete subclass, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)coordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s must be called on concrete subclasses, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)processScopedCoordinatorForAppWithIdentity:targetingInstallationDomain:withClientID:createIfNotExisting:created:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s must be called on a concrete subclass, not the abstract superclass : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Async enumeration block reference somehow became nil while enumerating install coordinators : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to get next seed while enumerating install coordinators : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_3(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  _StringForIXCoordinatorIntent(objc_msgSend(a1, "intent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Failed to find class for coordinator intent %@ for coordinator %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_42_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create coordinator object : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __84__IXAppInstallCoordinator__asynchronouslyEnumerateCoordinatorsForIntent_usingBlock___block_invoke_4_54_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a2, v4, "%s: Unexpectedly created coordinator for %@ while enumerating; canceling it : %@",
    (uint8_t *)v5);

  OUTLINED_FUNCTION_23();
}

void __71__IXAppInstallCoordinator_uninstallAppWithIdentity_options_completion___block_invoke_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to uninstall identity:%@ with error:%@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

void __82__IXAppInstallCoordinator_revertAppWithIdentity_resultingApplicationRecord_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to contact daemon : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)updateSINFForAppWithIdentity:wrapperURL:sinfData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)updateiTunesMetadataForAppWithIdentity:wrapperURL:plistData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)updateiTunesMetadataForAppWithIdentity:plistData:options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Unable to decode supplied plist data : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

+ (void)updateiTunesMetadata:forAppWithIdentity:wrapperURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: Reason passed to %s was nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: Failed to create termination request for identifier %@ : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.3()
{
  NSObject *v0;
  int v1[14];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to look up container for identifier %@: container error = %llu : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_23();
}

+ (void)refreshDataContainerForBundleID:reason:error:.cold.4()
{
  NSObject *v0;
  int v1[14];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v0, (uint64_t)v0, "%s: Failed to refresh data container for identifier %@: container error = %llu : %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_23();
}

+ (void)refreshContainerTypes:forApplicationIdentity:reason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: Reason passed to %s was nil : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __85__IXAppInstallCoordinator_refreshContainerTypes_forApplicationIdentity_reason_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to contact daemon : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)cancelForReason:client:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Reason passed to -[IXAppInstallCoordinator cancelForReason:client:error:] was nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)cancelForReason:client:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -[IXAppInstallCoordinator cancelForReason:client:error:] was called with client of IXClientNone which is invalid : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setPlaceholderPromise:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: placeholderPromise argument to %s was nil : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setPlaceholderPromise:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: App extension placeholder promise passed to %s instead of app placeholder promise : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __55__IXAppInstallCoordinator_placeholderPromiseWithError___block_invoke_137_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for a placeholder data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __52__IXAppInstallCoordinator_appAssetPromiseWithError___block_invoke_148_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an owned data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

- (void)setAppAssetPromiseResponsibleClient:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Client IXClientNone was passed to -setAppAssetPromiseResponsibleClient:error:, but that doesn't make sense : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setInstallOptions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Options argument to -setInstallOptions:error: was nil : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)setInstallOptions:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create data promise for serialized install options : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)initialODRAssetPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Failed to initialize promise class %@ from seed %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)initialODRAssetPromisesWithError:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_17();
  *v1 = 136315906;
  OUTLINED_FUNCTION_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Object %@ should have been for an opaque data promise subclass but was instead for class %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)initialODRAssetPromisesWithError:.cold.3()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_17();
  *v1 = 136315906;
  OUTLINED_FUNCTION_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __52__IXAppInstallCoordinator_userDataPromiseWithError___block_invoke_188_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __55__IXAppInstallCoordinator_preparationPromiseWithError___block_invoke_196_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201_cold_1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_21();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v2, v3, "%s: Failed to initialize promise class %@ with seed %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_0();
}

void __58__IXAppInstallCoordinator_deviceSecurityPromiseWithError___block_invoke_201_cold_2()
{
  uint64_t v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_22();
  v1 = (objc_class *)OUTLINED_FUNCTION_20(v0, *MEMORY[0x1E0C80C00]);
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1A4BF6000, v3, v4, "%s: Seed object %@ should have been for an out of band transfer data promise subclass but was instead for class %@ : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_6_0();
}

- (void)essentialAssetPromisesWithError:(_DWORD *)a3 .cold.1(void *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136315906;
  OUTLINED_FUNCTION_14((uint64_t)a1, a2, (uint64_t)a3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Failed to initialize promise class %@ from seed %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)essentialAssetPromisesWithError:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_17();
  *v1 = 136315906;
  OUTLINED_FUNCTION_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Object %@ should have been for an opaque data promise subclass but was instead for class %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)essentialAssetPromisesWithError:.cold.3()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_17();
  *v1 = 136315906;
  OUTLINED_FUNCTION_11(v2, (uint64_t)v1, v3);
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, v6, v4, "%s: Seed object %@ should have been for an opaque data promise seed subclass but was instead for class %@ : %@", v5);

  OUTLINED_FUNCTION_16();
}

- (void)setInstallTargetDirectoryURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)installTargetDirectoryURLWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setTargetBundleURL:preservingTargetBundleNameOnUpdate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)targetBundleURLWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setAppQuitPromise:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)appQuitPromiseWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setManagedInstallUUID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)managedInstallUUIDWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)setShouldOverrideGatekeeper:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

- (void)getShouldOverrideGatekeeperValue:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: %s is unsupported on this platform. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to contact daemon: %@", v2, v3, v4, v5, 2u);
}

void __99__IXAppInstallCoordinator_IXDiskImageMounter__registerContentsForDiskImageAtURL_options_withError___block_invoke_1_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_1A4BF6000, v2, v3, "%s: Failed to register contents on disk image at %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to contact daemon: %@", v2, v3, v4, v5, 2u);
}

void __101__IXAppInstallCoordinator_IXDiskImageMounter__unregisterContentsForDiskImageAtURL_options_withError___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4(&dword_1A4BF6000, v2, v3, "%s: Failed to unregister contents on disk image at %@ : %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315650;
  *(_QWORD *)(a3 + 4) = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeS"
                        "ource:options:progressBlock:completionWithIdentity:]_block_invoke";
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a4, a3, "%s: Failed to clean up extracted content at %@ : %@", (uint8_t *)a3);

}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315650;
  *(_QWORD *)(a2 + 4) = "+[IXAppInstallCoordinator(IXSimpleInstaller) _beginInstallForURL:forPersonaUniqueString:consumeS"
                        "ource:options:progressBlock:completionWithIdentity:]_block_invoke";
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  *(_WORD *)(a2 + 22) = 2112;
  *(_QWORD *)(a2 + 24) = 0;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a3, (uint64_t)a3, "%s: An unknown error occured while installing %@ : %@", (uint8_t *)a2);

}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, a2, a3, "%s: Failed to create directory for extraction : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to create app asset promise : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: Failed to re-create a coordinator for %@. : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: Failed to cancel an already existing coordinator. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, v0, v1, "%s: A coordinated install for %@ (not initiated by IXClientSimpleSPI) is already pending. : %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_10();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_117_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: This SPI can only install apps : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a3, v5, "%s: Failed to remove extracted content at %@ : %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_1_1();
}

void __148__IXAppInstallCoordinator_IXSimpleInstaller___beginInstallForURL_forPersonaUniqueString_consumeSource_options_progressBlock_completionWithIdentity___block_invoke_119_cold_2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a3, v5, "%s: Failed to remove installable at %@ : %@", (uint8_t *)v6);

  OUTLINED_FUNCTION_1_1();
}

void __125__IXAppInstallCoordinator_IXSimpleInstallerPrivate__installApplication_consumeSource_options_legacyProgressBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 136315394;
  v4 = "_CreateLegacyCallbackErrorDict";
  v5 = 2112;
  v6 = v2;
  _os_log_debug_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_DEBUG, "%s: Failed to get legacy error string from NSError %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_12();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136315906;
  v5 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke_2";
  v6 = 2048;
  v7 = v3;
  v8 = 2080;
  v9 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke_2";
  v10 = 2112;
  v11 = 0;
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, a2, a3, "%s: Invalid IXAppInstallCoordinatorDemotionReason %lu passed to %s : %@", (uint8_t *)&v4);
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: An unknown error occured while demoting %@ : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: A demotion for %@ is already pending. : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_3(uint64_t *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  IXStringForAppRemovability(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315906;
  v8 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = 0;
  OUTLINED_FUNCTION_4(&dword_1A4BF6000, a3, v6, "%s: Cannot demote app with identity %@ because removability is %@ : %@", (uint8_t *)&v7);

}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  v3 = 136315650;
  v4 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  v5 = 2112;
  v6 = v0;
  v7 = 2112;
  v8 = v1;
  _os_log_error_impl(&dword_1A4BF6000, v2, OS_LOG_TYPE_ERROR, "%s: No LSApplicationRecord found for %@ during demotion : %@", (uint8_t *)&v3, 0x20u);
  OUTLINED_FUNCTION_10();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: Cannot demote app with identity %@ because it is a placeholder : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1A4BF6000, v0, v1, "%s: LSApplicationProxy for %@ did not contain a bundleURL during demotion : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_10();
}

void __175__IXAppInstallCoordinator_IXDemoteToPlaceholder___demoteAppToPlaceholderWithApplicationIdentity_forReason_waitForDeletion_ignoreRemovability_returnEarlyForTesting_completion___block_invoke_2_100_cold_7(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "+[IXAppInstallCoordinator(IXDemoteToPlaceholder) _demoteAppToPlaceholderWithApplicationIdentity:forReason:waitFor"
       "Deletion:ignoreRemovability:returnEarlyForTesting:completion:]_block_invoke";
  v3 = 2112;
  v4 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: Triggered early return intended for testing. : %@", (uint8_t *)&v1, 0x16u);
}

@end
