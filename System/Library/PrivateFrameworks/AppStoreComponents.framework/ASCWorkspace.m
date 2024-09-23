@implementation ASCWorkspace

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return -[ASCWorkspace openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:](self, "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:", a3, a4, 0);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  ASCWorkspace *v22;
  id v23;
  BOOL v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  v11 = *MEMORY[0x1E0D22DA8];
  v25[0] = *MEMORY[0x1E0D22D88];
  v25[1] = v11;
  v26[0] = MEMORY[0x1E0C9AAB0];
  v26[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13 = (void *)MEMORY[0x1E0CA5838];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke;
    v18[3] = &unk_1E7561938;
    v19 = v8;
    v20 = v12;
    v21 = v10;
    v22 = self;
    v23 = v9;
    v24 = a5;
    objc_msgSend(v13, "getAppLinksWithURL:completionHandler:", v23, v18);

    v14 = v19;
  }
  else
  {
    +[ASCWorkspace log](ASCWorkspace, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1BCB7B000, v15, OS_LOG_TYPE_INFO, "No payload URL; opening application.", v17, 2u);
    }

    v14 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v14, "setFrontBoardOptions:", v12);
    -[ASCWorkspace openApplicationWithBundleIdentifier:configuration:pendingResult:](self, "openApplicationWithBundleIdentifier:configuration:pendingResult:", v8, v14, v10);
  }

  return v10;
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v27 = v6;
    +[ASCWorkspace log](ASCWorkspace, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_3(v5, v8);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
        objc_msgSend(v14, "targetApplicationRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if ((v17 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v11)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v18 = v14;

      if (!v18)
        goto LABEL_17;
      +[ASCWorkspace log](ASCWorkspace, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7B000, v19, OS_LOG_TYPE_INFO, "Found valid universal link, attempting to open", buf, 2u);
      }

      v20 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      objc_msgSend(v20, "setFrontBoardOptions:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v20, "setIgnoreAppLinkEnabledProperty:", 1);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5;
      v28[3] = &unk_1E7561910;
      v21 = *(id *)(a1 + 48);
      v22 = *(_QWORD *)(a1 + 56);
      v29 = v21;
      v30 = v22;
      v31 = *(id *)(a1 + 32);
      v32 = *(id *)(a1 + 64);
      v33 = *(id *)(a1 + 40);
      objc_msgSend(v18, "openWithConfiguration:completionHandler:", v20, v28);

    }
    else
    {
LABEL_12:

LABEL_17:
      +[ASCWorkspace log](ASCWorkspace, "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_2(a1, v23);

      v18 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      objc_msgSend(v18, "setFrontBoardOptions:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 56), "openApplicationWithBundleIdentifier:configuration:pendingResult:", *(_QWORD *)(a1 + 32), v18, *(_QWORD *)(a1 + 48));
    }
    v7 = v27;
    goto LABEL_25;
  }
  v24 = *(unsigned __int8 *)(a1 + 72);
  +[ASCWorkspace log](ASCWorkspace, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_1(v26);

    v18 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v18, "setFrontBoardOptions:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 56), "openApplicationWithBundleIdentifier:configuration:pendingResult:", *(_QWORD *)(a1 + 32), v18, *(_QWORD *)(a1 + 48));
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7B000, v26, OS_LOG_TYPE_INFO, "Found non-universal link, opening via open resource operation", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "openApplicationWithBundleIdentifier:usingOpenResourceOperationWithPayloadURL:options:pendingResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_26:

}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  +[ASCWorkspace log](ASCWorkspace, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BCB7B000, v7, OS_LOG_TYPE_INFO, "Successfully opened universal link", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "openApplicationWithBundleIdentifier:usingOpenResourceOperationWithPayloadURL:options:pendingResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
  }

}

- (void)openApplicationWithBundleIdentifier:(id)a3 usingOpenResourceOperationWithPayloadURL:(id)a4 options:(id)a5 pendingResult:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[16];

  v10 = (void *)MEMORY[0x1E0CA5878];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "defaultWorkspace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v13, v14, 0, 0, 0, 0, v12, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASCWorkspace log](ASCWorkspace, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7B000, v17, OS_LOG_TYPE_INFO, "Enqueuing open resource URL operation", buf, 2u);
  }

  -[ASCWorkspace enqueueOpenApplicationOperation:pendingResult:](self, "enqueueOpenApplicationOperation:pendingResult:", v16, v11);
}

- (void)openApplicationWithBundleIdentifier:(id)a3 configuration:(id)a4 pendingResult:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CA5878];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "defaultWorkspace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke;
  v13[3] = &unk_1E75603C0;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v10, v9, v13);

}

void __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  +[ASCWorkspace log](ASCWorkspace, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BCB7B000, v7, OS_LOG_TYPE_INFO, "Open application with bundle ID succeeded.", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }

}

- (id)openProductURL:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D22DA8];
  v10[0] = *MEMORY[0x1E0D22D88];
  v10[1] = v4;
  v11[0] = MEMORY[0x1E0C9AAB0];
  v11[1] = MEMORY[0x1E0C9AAB0];
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCWorkspace openURL:frontBoardOptions:](self, "openURL:frontBoardOptions:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  +[ASCWorkspace log](ASCWorkspace, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "Open resource URL operation completed", v8, 2u);
  }

  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCWorkspace popPendingResultForOperationName:](self, "popPendingResultForOperationName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "finishWithSuccess");
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[ASCWorkspace log](ASCWorkspace, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ASCWorkspace(ASCAppLaunchTrampolineWorkspace) openResourceOperation:didFailWithError:].cold.1();

  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCWorkspace popPendingResultForOperationName:](self, "popPendingResultForOperationName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "finishWithError:", v6);
}

+ (OS_os_log)log
{
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, &__block_literal_global_31);
  return (OS_os_log *)(id)log_log_9;
}

void __19__ASCWorkspace_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCWorkspace");
  v1 = (void *)log_log_9;
  log_log_9 = (uint64_t)v0;

}

+ (ASCWorkspace)sharedWorkspace
{
  void *v2;

  v2 = (void *)ASCWorkspace_testingWorkspace;
  if (!ASCWorkspace_testingWorkspace)
  {
    if (sharedWorkspace_onceToken != -1)
      dispatch_once(&sharedWorkspace_onceToken, &__block_literal_global_3_2);
    v2 = (void *)sharedWorkspace_sharedWorkspace;
  }
  return (ASCWorkspace *)v2;
}

void __31__ASCWorkspace_sharedWorkspace__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ASCWorkspace _init]([ASCWorkspace alloc], "_init");
  v1 = (void *)sharedWorkspace_sharedWorkspace;
  sharedWorkspace_sharedWorkspace = (uint64_t)v0;

}

- (id)_init
{
  ASCWorkspace *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *stateLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCWorkspace;
  v2 = -[ASCWorkspace init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;

  }
  return v2;
}

+ (void)withSharedWorkspace:(id)a3 perform:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (id)ASCWorkspace_testingWorkspace;
  objc_storeStrong((id *)&ASCWorkspace_testingWorkspace, a3);
  v6[2](v6);
  v8 = (void *)ASCWorkspace_testingWorkspace;
  ASCWorkspace_testingWorkspace = (uint64_t)v7;

}

- (id)openURL:(id)a3
{
  return -[ASCWorkspace openURL:frontBoardOptions:](self, "openURL:frontBoardOptions:", a3, 0);
}

- (id)openURL:(id)a3 frontBoardOptions:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0CFDBA8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  objc_msgSend(v9, "setFrontBoardOptions:", v6);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__ASCWorkspace_openURL_frontBoardOptions___block_invoke;
  v13[3] = &unk_1E7561960;
  v11 = v8;
  v14 = v11;
  objc_msgSend(v10, "openURL:configuration:completionHandler:", v7, v9, v13);

  return v11;
}

uint64_t __42__ASCWorkspace_openURL_frontBoardOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithSuccess");
  else
    return objc_msgSend(v2, "finishWithError:");
}

- (id)openSensitiveURL:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0CFDBA8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  objc_msgSend(v6, "setSensitive:", 1);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__ASCWorkspace_openSensitiveURL___block_invoke;
  v10[3] = &unk_1E7561960;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "openURL:configuration:completionHandler:", v4, v6, v10);

  return v8;
}

uint64_t __33__ASCWorkspace_openSensitiveURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithSuccess");
  else
    return objc_msgSend(v2, "finishWithError:");
}

- (void)enqueueOpenApplicationOperation:(id)a3 pendingResult:(id)a4
{
  id v6;
  void *v7;
  NSOperationQueue *v8;
  NSOperationQueue *openApplicationOperationQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *pendingResults;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[ASCWorkspace stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  if (!self->_openApplicationOperationQueue)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    openApplicationOperationQueue = self->_openApplicationOperationQueue;
    self->_openApplicationOperationQueue = v8;

  }
  if (!self->_pendingResults)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingResults = self->_pendingResults;
    self->_pendingResults = v10;

  }
  -[NSOperationQueue setSuspended:](self->_openApplicationOperationQueue, "setSuspended:", 1);
  objc_msgSend(v18, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setName:", v14);

  }
  -[NSOperationQueue addOperation:](self->_openApplicationOperationQueue, "addOperation:", v18);
  -[ASCWorkspace pendingResults](self, "pendingResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v6, v16);

  -[NSOperationQueue setSuspended:](self->_openApplicationOperationQueue, "setSuspended:", 0);
  -[ASCWorkspace stateLock](self, "stateLock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (id)popPendingResultForOperationName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    -[ASCWorkspace stateLock](self, "stateLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    -[ASCWorkspace pendingResults](self, "pendingResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ASCWorkspace pendingResults](self, "pendingResults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v4);

    }
    -[ASCWorkspace stateLock](self, "stateLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSMutableDictionary)pendingResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)openApplicationOperationQueue
{
  return self->_openApplicationOperationQueue;
}

- (void)setOpenApplicationOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_openApplicationOperationQueue, a3);
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_openApplicationOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingResults, 0);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCB7B000, log, OS_LOG_TYPE_ERROR, "Found non-universal link, opening application", v1, 2u);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(0, "targetApplicationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v3;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1BCB7B000, a2, OS_LOG_TYPE_ERROR, "Found valid universal link with mismatching bundle ID, source %{public}@, target %{public}@", (uint8_t *)&v6, 0x16u);

}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_cold_3(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BCB7B000, a2, OS_LOG_TYPE_DEBUG, "Found %lu matching apps for payload URL", v3, 0xCu);
}

void __118__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, v0, v1, "Failed to open universal link, reason %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __113__ASCWorkspace_ASCAppLaunchTrampolineWorkspace__openApplicationWithBundleIdentifier_configuration_pendingResult___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1BCB7B000, v0, v1, "Open application with bundle ID failed, reason %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
