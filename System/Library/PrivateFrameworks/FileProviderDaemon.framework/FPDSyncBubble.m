@implementation FPDSyncBubble

- (FPDSyncBubble)initWithExtensionManager:(id)a3
{
  id v6;
  FPDSyncBubble *v7;
  FPDSyncBubble *v8;
  dispatch_group_t v9;
  OS_dispatch_group *startupGroup;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *syncQueue;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FPDSyncBubble;
  v7 = -[FPDSyncBubble init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_extensionManager, a3);
    v9 = dispatch_group_create();
    startupGroup = v8->_startupGroup;
    v8->_startupGroup = (OS_dispatch_group *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("sync bubble task queue", v11);
    syncQueue = v8->_syncQueue;
    v8->_syncQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("FILEPROVIDER_SYNC_BUBBLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17 != objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("FPDSyncBubble.m"), 39, CFSTR("UserManager thinks we're running in the sync bubble, but environment variables disagree"));

    }
  }

  return v8;
}

- (void)startupFinished
{
  dispatch_group_leave((dispatch_group_t)self->_startupGroup);
}

- (void)start
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *syncQueue;
  NSObject *startupGroup;
  id v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter((dispatch_group_t)self->_startupGroup);
  if (objc_msgSend(v3, "isSharedIPad"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble");
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fp_shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        v9 = "[INFO] shared iPad: running in sync bubble, checking in. Home directory is %@";
LABEL_7:
        _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, v9, buf, 0xCu);

      }
    }
    else if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fp_shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      v9 = "[INFO] shared iPad: checking in for running in sync bubble later. Home directory is %@";
      goto LABEL_7;
    }

    objc_msgSend(v3, "registerUserSyncStakeholder:withMachServiceName:", self, CFSTR("com.apple.FileProvider.usermanager.sync"));
    objc_msgSend(MEMORY[0x1E0DC5F10], "taskWithName:reason:", CFSTR("com.apple.FileProvider.startup"), CFSTR("checking if there's anything to sync"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "begin");
    startupGroup = self->_startupGroup;
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__FPDSyncBubble_start__block_invoke;
    block[3] = &unk_1E8C75E48;
    v15 = v10;
    v13 = v10;
    dispatch_group_notify(startupGroup, syncQueue, block);

  }
}

uint64_t __22__FPDSyncBubble_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: sync bubble checkin finished", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "end");
}

- (void)retryLaterWithError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  FPDSyncBubble *v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPDSyncBubble_retryLaterWithError___block_invoke;
  block[3] = &unk_1E8C75850;
  v8 = v4;
  v9 = self;
  v5 = retryLaterWithError__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&retryLaterWithError__onceToken, block);

}

void __37__FPDSyncBubble_retryLaterWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __37__FPDSyncBubble_retryLaterWithError___block_invoke_cold_1(a1, v2);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("encountered error domain %@ code %ld"), v6, objc_msgSend(*(id *)(a1 + 32), "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterStakeHolder:status:reason:", v5, 1, v7);

}

- (void)createSyncBubbleTasksIfNecessary
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v35[6];
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: creating sync bubble tasks", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPDRequest requestForXPCConnection:](FPDRequest, "requestForXPCConnection:", v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  -[FPDExtensionManager allProviders](self->_extensionManager, "allProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v42;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v32 = v4;
        v5 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v4);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v5, "relevantDomainsByID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "allValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v38 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              if ((objc_msgSend(v12, "isUsingFPFS") & 1) == 0)
              {
                fp_current_or_default_log();
                v18 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                  goto LABEL_29;
                objc_msgSend(v12, "providerDomainID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v25;
                v26 = v18;
                v27 = "[INFO] shared iPad: skipping %@ (doesn't use FPFS)";
LABEL_25:
                _os_log_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);

                goto LABEL_29;
              }
              objc_msgSend(v12, "provider");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "fp_isiCloudDriveIdentifier");

              if ((v15 & 1) == 0)
              {
                fp_current_or_default_log();
                v18 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                  goto LABEL_29;
                objc_msgSend(v12, "providerDomainID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v25;
                v26 = v18;
                v27 = "[INFO] shared iPad: skipping %@ (not supported in sync bubble)";
                goto LABEL_25;
              }
              v16 = (void *)MEMORY[0x1E0DC5F10];
              objc_msgSend(v12, "providerDomainID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "taskWithName:reason:forBundleID:", CFSTR("com.apple.FileProvider.uploads"), CFSTR("syncup to server"), v17);
              v18 = objc_claimAutoreleasedReturnValue();

              LODWORD(v17) = objc_msgSend(MEMORY[0x1E0CAAC18], "runningInSyncBubble");
              fp_current_or_default_log();
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
              if ((_DWORD)v17)
              {
                if (v20)
                {
                  objc_msgSend(v12, "providerDomainID");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v46 = v21;
                  _os_log_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_INFO, "[INFO] shared iPad: requesting stabilization in sync bubble for domain %@", buf, 0xCu);

                }
                -[NSObject begin](v18, "begin");
                fp_current_or_default_log();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v12, "defaultBackend");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v46 = v12;
                  v47 = 2112;
                  v48 = v23;
                  _os_log_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_INFO, "[INFO] domain: %@, backend: %@", buf, 0x16u);

                }
                objc_msgSend(v12, "defaultBackend");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke;
                v35[3] = &unk_1E8C75358;
                v35[4] = v12;
                v35[5] = self;
                v18 = v18;
                v36 = v18;
                objc_msgSend(v24, "waitForStabilizationForRequest:completionHandler:", v33, v35);

              }
              else
              {
                if (v20)
                {
                  objc_msgSend(v12, "providerDomainID");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v46 = v28;
                  _os_log_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_INFO, "[INFO] shared iPad: scheduling finalization in sync bubble for domain %@", buf, 0xCu);

                }
                -[NSObject begin](v18, "begin");
              }
LABEL_29:

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          }
          while (v9);
        }

        v4 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v31);
  }

}

void __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke_cold_1(a1, (uint64_t)v3, v5);

    objc_msgSend(*(id *)(a1 + 40), "retryLaterWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_INFO, "[INFO] shared iPad: sync bubble stabilization finished successfully for %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "end");

}

- (void)willSwitchUser
{
  NSObject *v3;
  void *v4;
  NSObject *startupGroup;
  NSObject *syncQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: received notification that we're switching users", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC5F10], "taskWithName:reason:", CFSTR("com.apple.FileProvider.check"), CFSTR("check for upload task creation during user switch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "begin");
  startupGroup = self->_startupGroup;
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__FPDSyncBubble_willSwitchUser__block_invoke;
  v8[3] = &unk_1E8C75850;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(startupGroup, syncQueue, v8);

}

uint64_t __31__FPDSyncBubble_willSwitchUser__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "createSyncBubbleTasksIfNecessary");
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: tasks for switching users created", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "end");
}

- (void)uploadContent
{
  NSObject *v3;
  void *v4;
  NSObject *startupGroup;
  NSObject *syncQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_INFO, "[INFO] shared iPad: received request to sync", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC5F10], "taskWithName:reason:", CFSTR("com.apple.FileProvider.check"), CFSTR("check for upload task creation during upload request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "begin");
  startupGroup = self->_startupGroup;
  syncQueue = self->_syncQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__FPDSyncBubble_uploadContent__block_invoke;
  v8[3] = &unk_1E8C75850;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(startupGroup, syncQueue, v8);

}

uint64_t __30__FPDSyncBubble_uploadContent__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "createSyncBubbleTasksIfNecessary");
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_INFO, "[INFO] shared iPad: tasks for request to sync created", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "end");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_startupGroup, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
}

void __37__FPDSyncBubble_retryLaterWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] shared iPad: Encountered an error forcing us to try to retry the sync bubble later - %@", (uint8_t *)&v3, 0xCu);
}

void __49__FPDSyncBubble_createSyncBubbleTasksIfNecessary__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CF55F000, log, OS_LOG_TYPE_ERROR, "[ERROR] shared iPad: sync bubble stabilization finished for %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end
