@implementation ABCPersistentStoreController

- (ABCPersistentStoreController)initWithName:(id)a3 inDirectory:(id)a4
{
  id v6;
  id v7;
  ABCPersistentStoreController *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *storeQueue;
  void *v12;
  NSObject *v13;
  NSObject *p_super;
  uint8_t v16[16];
  _QWORD block[4];
  ABCPersistentStoreController *v18;
  id v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ABCPersistentStoreController;
  v8 = -[ABCPersistentStoreController init](&v20, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.autobugcapture.persistentStore", v9);
    storeQueue = v8->storeQueue;
    v8->storeQueue = (OS_dispatch_queue *)v10;

    -[ABCPersistentStoreController prepareDataDirectoryWithName:containerPath:](v8, "prepareDataDirectoryWithName:containerPath:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = v8->storeQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__ABCPersistentStoreController_initWithName_inDirectory___block_invoke;
      block[3] = &unk_1EA3B5010;
      v18 = v8;
      v19 = v12;
      dispatch_async(v13, block);

      p_super = &v18->super;
    }
    else
    {
      persistenceLogHandle();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1DBAE1000, p_super, OS_LOG_TYPE_ERROR, "Unable to prepare data directory. Will NOT initialize persistent storage", v16, 2u);
      }
    }

  }
  return v8;
}

uint64_t __57__ABCPersistentStoreController_initWithName_inDirectory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareWorkspaceWithDirectoryPath:", *(_QWORD *)(a1 + 40));
}

- (ABCPersistentStoreController)initWithDirectory:(id)a3
{
  return -[ABCPersistentStoreController initWithName:inDirectory:](self, "initWithName:inDirectory:", 0, a3);
}

- (ABCPersistentStoreController)init
{
  void *v3;
  void *v4;
  ABCPersistentStoreController *v5;

  +[ABCConfigurationManager autoBugCapturePrefix](ABCConfigurationManager, "autoBugCapturePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABCConfigurationManager defaultLibraryDirectory](ABCConfigurationManager, "defaultLibraryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ABCPersistentStoreController initWithName:inDirectory:](self, "initWithName:inDirectory:", v3, v4);

  return v5;
}

- (AnalyticsWorkspace)workspace
{
  AnalyticsWorkspace *workspace;

  workspace = self->_workspace;
  if (workspace && self->workspaceReady)
    return workspace;
  else
    return (AnalyticsWorkspace *)0;
}

- (id)prepareDataDirectoryWithName:(id)a3 containerPath:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
    v10 = v8;
    v17 = 0;
    v11 = -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v17);
    v12 = v17;
    persistenceLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "ABC data directory is ready at: %@", buf, 0xCu);
      }

      v9 = v10;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "localizedFailureReason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Unable to create ABC data directory: %@ (%@)", buf, 0x16u);

      }
      v9 = 0;
    }

  }
  else
  {
    persistenceLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Invalid container directory specified: %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)prepareWorkspaceWithDirectoryPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  AnalyticsWorkspace *v7;
  AnalyticsWorkspace *tempWorkspace;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *storeQueue;
  NSObject *v18;
  _QWORD block[5];
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->tempWorkspace)
  {
    persistenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Preparing workspace", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsWorkspace workspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:](AnalyticsWorkspace, "workspaceWithName:atPath:objectModelName:objectModelBundle:useReadOnly:", CFSTR("autobugcapture"), v4, CFSTR("AutoBugCapture"), v6, 0);
    v7 = (AnalyticsWorkspace *)objc_claimAutoreleasedReturnValue();
    tempWorkspace = self->tempWorkspace;
    self->tempWorkspace = v7;

  }
  ++prepareWorkspaceWithDirectoryPath__attempts;
  persistenceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "Bootstrapping persistent store", buf, 2u);
  }

  v10 = -[AnalyticsWorkspace save](self->tempWorkspace, "save");
  if (v10)
  {
    objc_storeStrong((id *)&self->_workspace, self->tempWorkspace);
    self->workspaceReady = 1;
    persistenceLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "Workspace and persistent store is ready for use", buf, 2u);
    }

    -[ABCPersistentStoreController delegate](self, "delegate");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[__CFString persistentStoreControllerReadyForUse:](v12, "persistentStoreControllerReadyForUse:", self);
  }
  else
  {
    if (prepareWorkspaceWithDirectoryPath__attempts < 2)
    {
      v12 = &stru_1EA3B8F58;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%ld attempts)"), prepareWorkspaceWithDirectoryPath__attempts);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    persistenceLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = (unint64_t)v12;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Workspace and persistent store failed to initialize.%@", buf, 0xCu);
    }

    if ((unint64_t)prepareWorkspaceWithDirectoryPath__attempts > 0x13)
    {
      persistenceLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, "Exhausted retry attempts. Unable to provide a functioning workspace and persistent store", buf, 2u);
      }

    }
    else
    {
      v14 = (unint64_t)(pow(1.5, (double)(prepareWorkspaceWithDirectoryPath__attempts - 1)) * 5.0);
      persistenceLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = v14;
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "Retrying persistent store initialization after %lu seconds", buf, 0xCu);
      }

      v16 = dispatch_time(0, 1000000000 * v14);
      storeQueue = self->storeQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__ABCPersistentStoreController_prepareWorkspaceWithDirectoryPath___block_invoke;
      block[3] = &unk_1EA3B5010;
      block[4] = self;
      v21 = v4;
      dispatch_after(v16, storeQueue, block);

    }
  }

  return v10;
}

uint64_t __66__ABCPersistentStoreController_prepareWorkspaceWithDirectoryPath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  persistenceLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Retrying persistent store initialization", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "prepareWorkspaceWithDirectoryPath:", *(_QWORD *)(a1 + 40));
}

- (id)caseStorageAnalytics
{
  void *v3;
  DiagnosticCaseStorageAnalytics *v4;
  void *v5;

  v3 = (void *)caseStorageAnalytics__caseStorageAnalytics;
  if (!caseStorageAnalytics__caseStorageAnalytics)
  {
    if (self->_workspace)
    {
      v4 = -[DiagnosticCaseStorageAnalytics initWithWorkspace:withCache:]([DiagnosticCaseStorageAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
      v5 = (void *)caseStorageAnalytics__caseStorageAnalytics;
      caseStorageAnalytics__caseStorageAnalytics = (uint64_t)v4;

      v3 = (void *)caseStorageAnalytics__caseStorageAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)caseUsageAnalytics
{
  void *v3;
  DiagnosticCaseUsageAnalytics *v4;
  void *v5;

  v3 = (void *)caseUsageAnalytics__caseUsageAnalytics;
  if (!caseUsageAnalytics__caseUsageAnalytics)
  {
    if (self->_workspace)
    {
      v4 = -[DiagnosticCaseUsageAnalytics initWithWorkspace:withCache:]([DiagnosticCaseUsageAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
      v5 = (void *)caseUsageAnalytics__caseUsageAnalytics;
      caseUsageAnalytics__caseUsageAnalytics = (uint64_t)v4;

      v3 = (void *)caseUsageAnalytics__caseUsageAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)uploadRecordAnalytics
{
  void *v3;
  UploadRecordAnalytics *v4;
  void *v5;

  v3 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
  if (!uploadRecordAnalytics__uploadRecordAnalytics)
  {
    if (self->_workspace)
    {
      v4 = -[UploadRecordAnalytics initWithWorkspace:withCache:]([UploadRecordAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
      v5 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
      uploadRecordAnalytics__uploadRecordAnalytics = (uint64_t)v4;

      v3 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)caseSummaryAnalytics
{
  void *v3;
  DiagnosticCaseSummaryAnalytics *v4;
  void *v5;

  v3 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
  if (!caseSummaryAnalytics__caseSummaryAnalytics)
  {
    if (self->_workspace)
    {
      v4 = -[DiagnosticCaseSummaryAnalytics initWithWorkspace:withCache:]([DiagnosticCaseSummaryAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
      v5 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
      caseSummaryAnalytics__caseSummaryAnalytics = (uint64_t)v4;

      v3 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)save
{
  -[ABCPersistentStoreController save:](self, "save:", 0);
}

- (void)save:(BOOL)a3
{
  NSObject *storeQueue;
  _QWORD v5[5];
  _QWORD block[5];

  storeQueue = self->storeQueue;
  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__ABCPersistentStoreController_save___block_invoke;
    block[3] = &unk_1EA3B4960;
    block[4] = self;
    dispatch_sync(storeQueue, block);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__ABCPersistentStoreController_save___block_invoke_2;
    v5[3] = &unk_1EA3B4960;
    v5[4] = self;
    dispatch_async(storeQueue, v5);
  }
}

void __37__ABCPersistentStoreController_save___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "workspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "save");

}

void __37__ABCPersistentStoreController_save___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "workspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "save");

}

- (void)shutdown
{
  -[ABCPersistentStoreController save:](self, "save:", 1);
}

- (void)cleanupDiagnosticCaseUsage
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ABCPersistentStoreController_cleanupDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(storeQueue, block);
}

void __58__ABCPersistentStoreController_cleanupDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  persistenceLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseUsage objects...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -1209600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("lastSeen <= %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "caseUsageAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removeEntitiesMatching:", v5);
  symptomsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v10 = v7;
    v11 = 1024;
    v12 = 14;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Removed %ld DiagnosticCaseUsage object(s) with lastSeen older than %d days.", buf, 0x12u);
  }

}

- (void)cleanupDiagnosticCaseStorage
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ABCPersistentStoreController_cleanupDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(storeQueue, block);
}

void __60__ABCPersistentStoreController_cleanupDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  symptomsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseStorage objects...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -864000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("timeStamp"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "caseStorageAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removeEntitiesMatching:", v5);
  symptomsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v10 = v7;
    v11 = 1024;
    v12 = 10;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "Removed %ld DiagnosticCaseStorage object(s) older than %d days.", buf, 0x12u);
  }

}

- (void)cleanupDiagnosticCaseSummary
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ABCPersistentStoreController_cleanupDiagnosticCaseSummary__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(storeQueue, block);
}

void __60__ABCPersistentStoreController_cleanupDiagnosticCaseSummary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  symptomsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseSummary objects...", (uint8_t *)&v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "caseSummaryAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "submittedCaseSummaryRetentionDays");

  v7 = objc_msgSend(v3, "removeDiagnosticCaseSummariesWithState:olderThan:", 1, v6);
  symptomsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = v7;
    v16 = 2048;
    v17 = v6;
    _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Removed %ld submitted object(s) older than %ld days.", (uint8_t *)&v14, 0x16u);
  }

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsubmittedCaseSummaryRetentionDays");

  v12 = objc_msgSend(v3, "removeDiagnosticCaseSummariesWithState:olderThan:", 0, v11);
  symptomsLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = v12;
    v16 = 2048;
    v17 = v11;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Removed %ld unsubmitted object(s) older than %ld days.", (uint8_t *)&v14, 0x16u);
  }

}

- (void)cleanupUploadRecord
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ABCPersistentStoreController_cleanupUploadRecord__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(storeQueue, block);
}

void __51__ABCPersistentStoreController_cleanupUploadRecord__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  symptomsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cleaning out orphaned UploadRecord objects...", (uint8_t *)&v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseStorage == NULL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uploadRecordAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "removeEntitiesMatching:", v3);
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Removed %ld orphaned UploadRecord object(s)", (uint8_t *)&v7, 0xCu);
  }

}

- (void)caseAttachmentsForAllDiagnosticCasesWithQueue:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *storeQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke;
  block[3] = &unk_1EA3B7240;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(storeQueue, block);

}

void __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "caseStorageAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAllEntityDictionariesWithProperties:", &unk_1EA3D0158);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reset");
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    v6 = *(NSObject **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke_2;
    v7[3] = &unk_1EA3B4A28;
    v9 = v5;
    v8 = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)caseAttachmentsForDiagnosticCaseIDs:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *storeQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    storeQueue = self->storeQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke;
    v12[3] = &unk_1EA3B7268;
    v12[4] = self;
    v13 = v8;
    v15 = v10;
    v14 = v9;
    dispatch_async(storeQueue, v12);

  }
}

void __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "caseStorageAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchEntityDictionariesWithProperties:predicate:", &unk_1EA3D0170, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reset");
  v13 = *(void **)(a1 + 56);
  if (v13)
  {
    v14 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke_2;
    block[3] = &unk_1EA3B4A28;
    v17 = v13;
    v16 = v12;
    dispatch_async(v14, block);

  }
}

uint64_t __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeCaseStoragesWithUUIDs:(id)a3
{
  id v4;
  NSObject *storeQueue;
  _QWORD v6[4];
  id v7;
  ABCPersistentStoreController *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    storeQueue = self->storeQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__ABCPersistentStoreController_removeCaseStoragesWithUUIDs___block_invoke;
    v6[3] = &unk_1EA3B5010;
    v7 = v4;
    v8 = self;
    dispatch_async(storeQueue, v6);

  }
}

void __60__ABCPersistentStoreController_removeCaseStoragesWithUUIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "UUIDString", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeCaseStoragesWithCaseIDs:", v2);
}

- (void)removeCaseStoragesWithCaseIDs:(id)a3
{
  id v4;
  NSObject *storeQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    storeQueue = self->storeQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__ABCPersistentStoreController_removeCaseStoragesWithCaseIDs___block_invoke;
    v6[3] = &unk_1EA3B5010;
    v6[4] = self;
    v7 = v4;
    dispatch_async(storeQueue, v6);

  }
}

void __62__ABCPersistentStoreController_removeCaseStoragesWithCaseIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "caseStorageAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseID == %@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeEntitiesMatching:", v10);

}

- (void)removeCaseStorageWithID:(id)a3
{
  id v4;
  NSObject *storeQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ABCPersistentStoreController *v9;

  v4 = a3;
  storeQueue = self->storeQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__ABCPersistentStoreController_removeCaseStorageWithID___block_invoke;
  v7[3] = &unk_1EA3B5010;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(storeQueue, v7);

}

void __56__ABCPersistentStoreController_removeCaseStorageWithID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("caseID == %@"), v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "caseStorageAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEntitiesMatching:", v5);

}

- (void)removeAllCaseStorages
{
  NSObject *storeQueue;
  _QWORD block[5];

  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ABCPersistentStoreController_removeAllCaseStorages__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(storeQueue, block);
}

void __53__ABCPersistentStoreController_removeAllCaseStorages__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "caseStorageAnalytics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "removeAllDiagnosticCaseStorages");
  casemanagementLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = v2;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Removed %ld cases from persistent store", (uint8_t *)&v4, 0xCu);
  }

}

- (ABCPersistentStoreControllerDelegate)delegate
{
  return (ABCPersistentStoreControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->storeQueue, 0);
  objc_storeStrong((id *)&self->tempWorkspace, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
