@implementation DiagnosticCaseManager

+ (int)symptomDiagnosticErrorForDiagnosticCaseDampeningType:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 2;
  if (v4 >= 0xB)
  {
    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Unrecognized dampeningType value: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    v5 = &kSymptomDiagnosticErrorNotSupported;
  }
  else
  {
    v5 = (int *)*(&off_1EA3B6100 + v4);
  }
  return *v5;
}

- (DiagnosticCaseManager)initWithWorkspace:(id)a3 liaison:(id)a4
{
  id v6;
  id v7;
  DiagnosticCaseManager *v8;
  NSMutableArray *v9;
  NSMutableArray *activeCases;
  NSMutableArray *v11;
  NSMutableArray *totalCases;
  NSMutableArray *v13;
  NSMutableArray *pendingStatisticsUpdateCases;
  NSMutableDictionary *v15;
  NSMutableDictionary *reportGenerators;
  NSMutableSet *v17;
  NSMutableSet *reportOutlets;
  NSMutableArray *v19;
  NSMutableArray *requestedReportGenerators;
  uint64_t v21;
  NSMutableDictionary *activeProbes;
  void *v23;
  void *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *queue;
  NSObject *v28;
  _QWORD v30[4];
  DiagnosticCaseManager *v31;
  id v32;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DiagnosticCaseManager;
  v8 = -[DiagnosticCaseManager init](&v33, sel_init);
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeCases = v8->_activeCases;
    v8->_activeCases = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    totalCases = v8->_totalCases;
    v8->_totalCases = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingStatisticsUpdateCases = v8->_pendingStatisticsUpdateCases;
    v8->_pendingStatisticsUpdateCases = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    reportGenerators = v8->_reportGenerators;
    v8->_reportGenerators = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    reportOutlets = v8->_reportOutlets;
    v8->_reportOutlets = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestedReportGenerators = v8->_requestedReportGenerators;
    v8->_requestedReportGenerators = v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    activeProbes = v8->activeProbes;
    v8->activeProbes = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v8->_liaison, a4);
    -[DiagnosticLiaison setDelegate:](v8->_liaison, "setDelegate:", v8);
    casemanagementLogHandle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CaseDampeningExceptions setLoggingHandle:](CaseDampeningExceptions, "setLoggingHandle:", v23);

    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CaseDampeningExceptions setNPIDevice:](CaseDampeningExceptions, "setNPIDevice:", objc_msgSend(v24, "npiDevice"));

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("com.apple.autobugcapture.diagnosticCaseManagement", v25);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v26;

    v28 = v8->_queue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__DiagnosticCaseManager_initWithWorkspace_liaison___block_invoke;
    v30[3] = &unk_1EA3B5010;
    v31 = v8;
    v32 = v6;
    dispatch_async(v28, v30);

  }
  return v8;
}

uint64_t __51__DiagnosticCaseManager_initWithWorkspace_liaison___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureWithWorkspace:", *(_QWORD *)(a1 + 40));
}

- (void)configureWithWorkspace:(id)a3
{
  AnalyticsWorkspace *v4;
  AnalyticsWorkspace *workspace;
  DiagnosticCaseStorageAnalytics *v6;
  DiagnosticCaseStorageAnalytics *caseStorageAnalytics;
  DiagnosticCaseSummaryAnalytics *v8;
  DiagnosticCaseSummaryAnalytics *caseSummaryAnalytics;
  DiagnosticStatisticsManager *v10;
  DiagnosticStatisticsManager *statsManager;
  void *v12;
  int v13;
  CoreAnalyticsReportOutlet *v14;
  void *v15;
  int v16;
  DiagnosticPipelineOutlet *v17;

  v4 = (AnalyticsWorkspace *)objc_msgSend(a3, "copy");
  workspace = self->_workspace;
  self->_workspace = v4;

  v6 = -[DiagnosticCaseStorageAnalytics initWithWorkspace:withCache:]([DiagnosticCaseStorageAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
  caseStorageAnalytics = self->_caseStorageAnalytics;
  self->_caseStorageAnalytics = v6;

  v8 = -[DiagnosticCaseSummaryAnalytics initWithWorkspace:withCache:]([DiagnosticCaseSummaryAnalytics alloc], "initWithWorkspace:withCache:", self->_workspace, 0);
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  self->_caseSummaryAnalytics = v8;

  v10 = -[DiagnosticStatisticsManager initWithWorkspace:queue:]([DiagnosticStatisticsManager alloc], "initWithWorkspace:queue:", self->_workspace, self->_queue);
  statsManager = self->_statsManager;
  self->_statsManager = v10;

  -[DiagnosticCaseManager configManager](self, "configManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "autoBugCaptureSignature");

  if (v13)
  {
    v14 = objc_alloc_init(CoreAnalyticsReportOutlet);
    -[DiagnosticCaseManager addCaseReportOutlet:](self, "addCaseReportOutlet:", v14);

  }
  -[DiagnosticCaseManager configManager](self, "configManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "autoBugCaptureRegularPayloads");

  if (v16)
  {
    v17 = objc_alloc_init(DiagnosticPipelineOutlet);
    -[DiagnosticCaseManager addCaseReportOutlet:](self, "addCaseReportOutlet:", v17);

  }
  -[DiagnosticCaseManager setUpGeneralCaseReportGenerators](self, "setUpGeneralCaseReportGenerators");
}

- (void)addToInternalStateDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableSet *reportOutlets;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[DiagnosticCaseManager hasOpenCases](self, "hasOpenCases"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("hasOpenCases"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DiagnosticCaseManager avgCasesPerDay](self, "avgCasesPerDay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("avgCasesPerDay"));

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  reportOutlets = self->_reportOutlets;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__DiagnosticCaseManager_addToInternalStateDictionary___block_invoke;
  v12[3] = &unk_1EA3B5B88;
  v13 = v8;
  v11 = v8;
  -[NSMutableSet enumerateObjectsUsingBlock:](reportOutlets, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("reportOutlets"));

}

void __54__DiagnosticCaseManager_addToInternalStateDictionary___block_invoke(uint64_t a1)
{
  objc_class *v2;
  id v3;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)disableDampening
{
  void *v2;
  char v3;

  -[DiagnosticCaseManager configManager](self, "configManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "arbitratorDisableDampening");

  return v3;
}

- (int64_t)dailyCountLimitForDomain:(id)a3 type:(id)a4 subtype:(id)a5 domainPredicates:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("UIPerformance")))
  {
    casemanagementLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = 10;
      v26 = 2112;
      v27 = CFSTR("UIPerformance");
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@ domain", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain == %@"), CFSTR("UIPerformance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 10;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Performance")))
  {
    casemanagementLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v25 = 7;
      v26 = 2112;
      v27 = CFSTR("Performance");
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@ domain", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain == %@"), CFSTR("Performance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 7;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Responsiveness"))
         && objc_msgSend(v11, "isEqualToString:", CFSTR("CoreAnimation"))
         && objc_msgSend(v12, "isEqualToString:", CFSTR("Stall Tailspin")))
  {
    casemanagementLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v25 = 3;
      v26 = 2112;
      v27 = CFSTR("Responsiveness");
      v28 = 2112;
      v29 = CFSTR("CoreAnimation");
      v30 = 2112;
      v31 = CFSTR("Stall Tailspin");
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@/%@/%@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain == %@ AND caseType == %@ AND caseSubtype == %@"), CFSTR("Responsiveness"), CFSTR("CoreAnimation"), CFSTR("Stall Tailspin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 3;
  }
  else
  {
    -[DiagnosticCaseManager configManager](self, "configManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v19, "arbitratorDailyCountLimit");

    casemanagementLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v16;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_DEFAULT, " Applying default daily case limit of %ld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain != %@"), CFSTR("UIPerformance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain != %@"), CFSTR("Performance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain != %@ AND caseType != %@ AND caseSubtype != %@"), CFSTR("Responsiveness"), CFSTR("CoreAnimation"), CFSTR("Stall Tailspin"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "addObject:", v15);

  return v16;
}

- (DiagnosticsController)diagnosticsController
{
  DiagnosticsController *diagnosticsController;
  void *v4;
  void *v5;
  NSObject *v6;
  DiagnosticsController *v7;
  DiagnosticsController *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  diagnosticsController = self->_diagnosticsController;
  if (!diagnosticsController)
  {
    -[DiagnosticCaseManager configManager](self, "configManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultDiagnosticActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      casemanagementLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "default actions: %@", (uint8_t *)&v10, 0xCu);
      }

      v7 = -[DiagnosticsController initWithConfiguration:]([DiagnosticsController alloc], "initWithConfiguration:", v5);
      v8 = self->_diagnosticsController;
      self->_diagnosticsController = v7;

    }
    diagnosticsController = self->_diagnosticsController;
  }
  return diagnosticsController;
}

- (ABCConfigurationManager)configManager
{
  void *v2;
  void *v3;

  +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ABCConfigurationManager *)v3;
}

- (id)caseStorageAnalytics
{
  return self->_caseStorageAnalytics;
}

- (void)saveAllCases
{
  void *v3;
  int64_t saveCount;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  -[DiagnosticCaseManager queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    saveCount = self->_saveCount;
    self->_saveCount = saveCount + 1;
    if (!saveCount)
    {
      v5 = dispatch_time(0, 3000000000);
      -[DiagnosticCaseManager queue](self, "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__DiagnosticCaseManager_saveAllCases__block_invoke;
      block[3] = &unk_1EA3B4960;
      block[4] = self;
      dispatch_after(v5, v6, block);

    }
  }
  else
  {
    -[DiagnosticCaseManager _saveAllCases](self, "_saveAllCases");
  }
}

uint64_t __37__DiagnosticCaseManager_saveAllCases__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveAllCases");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)_saveAllCases
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  casemanagementLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Saving all cases to storage.", buf, 2u);
  }

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_totalCases, "enumerateObjectsUsingBlock:", &__block_literal_global_13);
  -[DiagnosticCaseManager removeClosedCasesFromTotalCases](self, "removeClosedCasesFromTotalCases");
  -[AnalyticsWorkspace save](self->_workspace, "save");
  if (!-[NSMutableArray count](self->_totalCases, "count") && self->_shouldPurgeStorageAfterSave)
  {
    casemanagementLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "No active cases remain", v8, 2u);
    }

    casemanagementLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "Requesting purge of attachments to meet disk usage limits", v7, 2u);
    }

    -[DiagnosticCaseManager storageDelegate](self, "storageDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "didSaveDiagnosticCases");
    self->_shouldPurgeStorageAfterSave = 0;

  }
}

uint64_t __38__DiagnosticCaseManager__saveAllCases__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareForSaving");
}

- (void)removeClosedCasesFromTotalCases
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_totalCases, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_totalCases;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v9, "caseState", (_QWORD)v10) == 6)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeObjectsInArray:](self->_totalCases, "removeObjectsInArray:", v3);
  }
}

- (void)removeTransientCasesWithSignature:(id)a3 beforeTime:(double)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
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
  id v20;
  id v21;
  int64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 <= 100000000.0)
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v32 = a4;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Invalid timestamp (%.0lf) passed to removeTransientCasesWithSignature:beforeTime:", buf, 0xCu);
    }
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtype"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("caseDampeningType"), 0xFFFFFFFFLL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v7, "addObject:");
    v28 = (void *)v8;
    v24 = v8;
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < %@"), CFSTR("timeStamp"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v7, "addObject:");
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseDomain"), v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v14);

      v13 = v9;
    }
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseType"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v15);

      v13 = v9;
    }
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseSubtype"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v16);

      v13 = v9;
    }
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseDetectedProcess"), v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v7, "addObject:", v17);

      v13 = v9;
    }
    if ((unint64_t)-[NSObject count](v7, "count") >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self->_caseStorageAnalytics, "fetchEntitiesFreeForm:sortDesc:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        -[DiagnosticCaseManager storageDelegate](self, "storageDelegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __70__DiagnosticCaseManager_removeTransientCasesWithSignature_beforeTime___block_invoke;
          v29[3] = &unk_1EA3B5BF0;
          v30 = v20;
          v21 = v20;
          objc_msgSend(v19, "enumerateObjectsUsingBlock:", v29);
          objc_msgSend(v25, "purgeAttachmentsAtPaths:", v21);

        }
        v22 = -[ObjectAnalytics removeEntitiesMatching:](self->_caseStorageAnalytics, "removeEntitiesMatching:", v18);
        casemanagementLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v32 = *(double *)&v22;
          v33 = 2112;
          v34 = v18;
          _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_INFO, "Removed %ld transient cases matching %@", buf, 0x16u);
        }

      }
      v13 = v9;
    }

  }
}

void __70__DiagnosticCaseManager_removeTransientCasesWithSignature_beforeTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "caseAttachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (BOOL)allowDampeningExceptionFor:(id)a3
{
  return +[CaseDampeningExceptions allowDampeningExceptionFor:](CaseDampeningExceptions, "allowDampeningExceptionFor:", a3);
}

- (unsigned)dampeningFactorForSignature:(id)a3 caseTime:(id)a4 limit:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unsigned int v53;
  uint8_t buf[4];
  uint64_t v55;
  _QWORD v56[6];
  _QWORD v57[5];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = a4;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v53 = -[DiagnosticCaseManager defaultDampeningFactorForSignature:limit:](self, "defaultDampeningFactorForSignature:limit:", v8, a5);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("domain"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtype"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additional"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("detected"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "timeIntervalSince1970");
  v10 = v9;
  -[DiagnosticCaseManager configManager](self, "configManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dampeningRestrictionFactor");

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v10 + fabs(sqrt((double)v12)) * -86400.0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timeStamp >= %@"), v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("remoteTrigger == %@"), MEMORY[0x1E0C9AAA0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("remoteTrigger == nil"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3528];
  v58[0] = v44;
  v58[1] = v14;
  v33 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orPredicateWithSubpredicates:", v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDomain == %@"), v47);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseType == %@"), v46);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseSubtype == %@"), v45);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseSubtypeContext == %@"), v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDetectedProcess == %@"), v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB3528]);
  v57[0] = v41;
  v57[1] = v40;
  v57[2] = v39;
  v57[3] = v38;
  v57[4] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithType:subpredicates:", 1, v18);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseDampeningType == %@"), &unk_1EA3CFC78);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseAttachments != nil"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("attachmentsIncomplete == %@"), v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0CB3528]);
  v56[0] = v36;
  v56[1] = v35;
  v56[2] = v19;
  v56[3] = v20;
  v56[4] = v21;
  v56[5] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithType:subpredicates:", 1, v24);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("timeStamp"), 0);
  -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self->_caseStorageAnalytics, "fetchEntitiesFreeForm:sortDesc:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = objc_msgSend(v27, "count");
    *(_DWORD *)buf = 134217984;
    v55 = v29;
    _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_INFO, "There are %ld records of accepted cases with logs matching this signature", buf, 0xCu);
  }

  v30 = (void *)MEMORY[0x1DF0B6314]();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke;
  v49[3] = &unk_1EA3B5C40;
  v49[4] = self;
  v49[5] = &v50;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v49);
  objc_autoreleasePoolPop(v30);
  v31 = *((_DWORD *)v51 + 6);

  _Block_object_dispose(&v50, 8);
  return v31;
}

void __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint8_t v39[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "caseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caseAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticCase attachmentsFromStringRepresentation:](DiagnosticCase, "attachmentsFromStringRepresentation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = objc_msgSend(v6, "dpSubmissionState");
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Inspecting case %{public}@ [dbSubmissionState: %d]", buf, 0x12u);
  }

  if (objc_msgSend(v6, "dpSubmissionState") == 1)
  {
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Found case ID %{public}@ which was submitted to DP", buf, 0xCu);
    }

LABEL_15:
    objc_msgSend(v6, "timeStamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = floor(v19 / -86400.0) + 1.0;
    if (v20 == 0.0)
      v21 = 1.0;
    else
      v21 = v20;
    objc_msgSend(*(id *)(a1 + 32), "configManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "dampeningRestrictionFactor");
    v24 = (unint64_t)v21;
    v25 = exp2((double)((unint64_t)v21 - 1));

    v26 = vcvtad_u64_f64(1.0 / v25 * (double)v23);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) *= (_DWORD)v26;
    casemanagementLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2048;
      v34 = v24;
      v35 = 2048;
      v36 = v26;
      v37 = 2048;
      v38 = v28;
      _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_DEFAULT, "Found fully valid case %{public}@ from %@ (within %lu days ago). Adjusted dampening factor by %ld to %ld", buf, 0x34u);
    }

    *a4 = 1;
    goto LABEL_21;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v34) = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke_90;
  v29[3] = &unk_1EA3B5C18;
  v13 = v12;
  v30 = v13;
  v14 = v7;
  v31 = v14;
  v32 = buf;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v29);
  v15 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    casemanagementLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEBUG, "Case ID %{public}@ matched signature with all attachment files present", v39, 0xCu);
    }

  }
  else
  {
    casemanagementLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 138543362;
      v40 = v14;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Case ID %{public}@ matches signature but is missing attachment files on disk", v39, 0xCu);
    }

    objc_msgSend(v6, "setAttachmentsIncomplete:", 1);
  }

  _Block_object_dispose(buf, 8);
  if (v15)
    goto LABEL_15;
LABEL_21:

}

void __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke_90(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E98];
  v7 = a2;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

  v9 = (void *)a1[4];
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v9 & 1) == 0)
  {
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = a1[5];
      objc_msgSend(v8, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Case ID %{public}@ is missing attached logs on disk: %@", (uint8_t *)&v14, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unsigned)defaultDampeningFactorForSignature:(id)a3 limit:(int64_t)a4
{
  unsigned int v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = -[DiagnosticCaseManager avgCasesPerDay](self, "avgCasesPerDay", a3, a4);
  casemanagementLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Configuring initial dampening factor to %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)buildSpecificRestrictionsForSignature:(id)a3 result:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  if (v7)
  {
    +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "internalBuild") & 1) != 0)
    {
      -[DiagnosticCaseManager configManager](self, "configManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "cloudKitEnabled") & 1) == 0)
      {
        -[DiagnosticCaseManager configManager](self, "configManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "submitToDiagnosticPipeline");

        if ((v11 & 1) == 0)
        {
          casemanagementLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Not allowing case due to invalid configuration (no valid upload mechanism configured).", (uint8_t *)&v23, 2u);
          }

          v7[2](v7, 1, 4);
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    if (objc_msgSend(v8, "carrierSeedBuild"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtype"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detected"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Cellular")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Energy")) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", CFSTR("Baseband")) & 1) == 0
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("UIPerformance"))
         || !objc_msgSend(v13, "isEqualToString:", CFSTR("Responsiveness"))
         || !objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.signpost_emitter.emitter_category.emitter_name"))|| (objc_msgSend(v15, "isEqualToString:", CFSTR("signpost_emitter")) & 1) == 0))
      {
        casemanagementLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "logSignatureDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v17;
          _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "Cases not explicitly permitted will be dampened on Carrier Seed builds: %{public}@", (uint8_t *)&v23, 0xCu);

        }
        v7[2](v7, 1, 7);
LABEL_19:

LABEL_37:
        goto LABEL_38;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "customerSeedBuild"))
      {
        if (objc_msgSend(v8, "vendorBuild"))
        {
          casemanagementLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "logSignatureDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 138543362;
            v24 = v20;
            _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_INFO, "All cases will be dampened on Vendor builds: %{public}@", (uint8_t *)&v23, 0xCu);

          }
          v7[2](v7, 1, 6);
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("domain"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subtype"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("additional"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("detected"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((!objc_msgSend(v9, "isEqualToString:", CFSTR("Energy"))
         || (objc_msgSend(v13, "isEqualToString:", CFSTR("CPU")) & 1) == 0)
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("UIPerformance"))
         || (objc_msgSend(v13, "isEqualToString:", CFSTR("Responsiveness")) & 1) == 0)
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Performance")) & 1) == 0
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("Responsiveness"))
         || !objc_msgSend(v13, "isEqualToString:", CFSTR("CoreAnimation"))
         || (objc_msgSend(v14, "isEqualToString:", CFSTR("Stall Tailspin")) & 1) == 0)
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Cellular")) & 1) == 0
        && (objc_msgSend(v9, "isEqualToString:", CFSTR("Telephony")) & 1) == 0
        && (objc_msgSend(v13, "isEqualToString:", CFSTR("IMSReg")) & 1) == 0
        && (objc_msgSend(v13, "isEqualToString:", CFSTR("IMS Call KPI")) & 1) == 0
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("Location"))
         || !objc_msgSend(v13, "isEqualToString:", CFSTR("GNSS"))
         || !objc_msgSend(v14, "isEqualToString:", CFSTR("Emergency"))
         || !objc_msgSend(v15, "isEqualToString:", CFSTR("long_EEM"))
         || (objc_msgSend(v18, "isEqualToString:", CFSTR("locationd")) & 1) == 0)
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("iCloudDrive"))
         || (objc_msgSend(v13, "isEqualToString:", CFSTR("Ciconia")) & 1) == 0)
        && (!objc_msgSend(v9, "isEqualToString:", CFSTR("SpotlightIndex"))
         || (objc_msgSend(v13, "isEqualToString:", CFSTR("IndexCorruption")) & 1) == 0))
      {
        casemanagementLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "logSignatureDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v22;
          _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEFAULT, "Cases not explicitly permitted will be dampened on Seed builds: %{public}@", (uint8_t *)&v23, 0xCu);

        }
        v7[2](v7, 1, 7);

        goto LABEL_19;
      }

    }
LABEL_35:

LABEL_36:
    v7[2](v7, 0, 0);
    goto LABEL_37;
  }
LABEL_38:

}

- (void)caseAllowanceForSignature:(id)a3 timestamp:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint32_t v37;
  NSObject *v38;
  uint32_t v39;
  _BOOL4 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BOOL4 v44;
  NSObject *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  DiagnosticCaseManager *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *context;
  void *v62;
  uint8_t buf[4];
  _BYTE v64[18];
  __int16 v65;
  unint64_t v66;
  _QWORD v67[3];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (v10)
  {
    if (objc_msgSend(v8, "count"))
    {
      context = (void *)MEMORY[0x1DF0B6314]();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("domain"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtype"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v54 = self;
      v59 = (void *)v12;
      v60 = (void *)v11;
      v58 = (void *)v13;
      v47 = -[DiagnosticCaseManager dailyCountLimitForDomain:type:subtype:domainPredicates:](self, "dailyCountLimitForDomain:type:subtype:domainPredicates:", v11, v12, v13, v14);
      objc_msgSend(v9, "timeIntervalSince1970");
      v16 = v15;
      v50 = v9;
      objc_msgSend(v9, "timeIntervalSince1970");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v16 - (double)((unint64_t)v17 % 0x15180));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("timeStamp >= %@"), v62);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("remoteTrigger == %@"), MEMORY[0x1E0C9AAA0]);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("remoteTrigger == nil"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x1E0CB3528]);
      v55 = (void *)v20;
      v56 = (void *)v19;
      v68[0] = v19;
      v68[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithType:subpredicates:", 2, v22);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseClosureType == %@"), &unk_1EA3CFC90);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseClosureType == %@"), &unk_1EA3CFCA8);
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("caseClosureType == %@"), &unk_1EA3CFCC0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x1E0CB3528]);
      v51 = (void *)v25;
      v52 = (void *)v24;
      v67[0] = v24;
      v67[1] = v25;
      v49 = (void *)v26;
      v67[2] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithType:subpredicates:", 2, v28);

      v48 = (void *)v29;
      v53 = (void *)v23;
      v57 = (void *)v18;
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v18, v23, v29, 0);
      if (objc_msgSend(v14, "count"))
        objc_msgSend(v30, "addObjectsFromArray:", v14);
      casemanagementLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      v9 = v50;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v64 = v62;
        *(_WORD *)&v64[8] = 2112;
        *(_QWORD *)&v64[10] = v50;
        _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_DEBUG, "Current window is from %@ to %@ (now)", buf, 0x16u);
      }

      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, v30);
      v33 = -[ObjectAnalytics countEntitiesMatching:](v54->_caseStorageAnalytics, "countEntitiesMatching:", v32);
      casemanagementLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v64 = v33;
        *(_WORD *)&v64[8] = 2112;
        *(_QWORD *)&v64[10] = v62;
        v65 = 2048;
        v66 = v47;
        _os_log_impl(&dword_1DBAE1000, v34, OS_LOG_TYPE_INFO, "Accepted %ld case(s) since %@ (limit = %ld).", buf, 0x20u);
      }

      casemanagementLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v47 <= v33)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v42 = 2;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEFAULT, "Reached daily limit, no more cases can be accepted.", buf, 2u);
        }
        else
        {
          v42 = 2;
        }
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)v64 = v33;
          *(_WORD *)&v64[8] = 2112;
          *(_QWORD *)&v64[10] = v62;
          v65 = 2048;
          v66 = v47;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEBUG, "Found %ld case(s) after %@ (limit = %ld), admissible.", buf, 0x20u);
        }

        v37 = -[DiagnosticCaseManager dampeningFactorForSignature:caseTime:limit:](v54, "dampeningFactorForSignature:caseTime:limit:", v8, v50, v47 - v33);
        casemanagementLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v64 = v37;
          *(_WORD *)&v64[4] = 2048;
          *(_QWORD *)&v64[6] = v47 - v33;
          _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_DEFAULT, "Current dampening probability is %u to %ld against.", buf, 0x12u);
        }

        v39 = arc4random_uniform(v37);
        casemanagementLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        if ((uint64_t)(v47 - v33) > v39)
        {
          if (v40)
          {
            objc_msgSend(v8, "logSignatureDescription");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v64 = v39;
            *(_WORD *)&v64[4] = 2114;
            *(_QWORD *)&v64[6] = v41;
            _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEFAULT, "Randomizer check passed [%d]. Accepting case: %{public}@", buf, 0x12u);

          }
          v42 = 0;
          goto LABEL_36;
        }
        if (v40)
        {
          objc_msgSend(v8, "logSignatureDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v64 = v39;
          *(_WORD *)&v64[4] = 2114;
          *(_QWORD *)&v64[6] = v43;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEFAULT, "Failed to pass randomizer check [%d]. Not accepting this case: %{public}@", buf, 0x12u);

        }
        v42 = 3;
      }

      v44 = +[CaseDampeningExceptions allowDampeningExceptionFor:](CaseDampeningExceptions, "allowDampeningExceptionFor:", v8);
      casemanagementLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      v36 = v45;
      if (v44)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEFAULT, "Dampening Exceptions: Allowing this case is as an exception.", buf, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_INFO, "Dampening Exceptions: This case is not allowed as an exception.", buf, 2u);
        }

        if (!-[DiagnosticCaseManager isAllowedTransientException:](v54, "isAllowedTransientException:", v8))
        {
          v46 = 0;
          goto LABEL_37;
        }
        casemanagementLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_DEFAULT, "Allowing this case as a transient exception.", buf, 2u);
        }
        v42 = -1;
      }
LABEL_36:

      v46 = 1;
LABEL_37:

      objc_autoreleasePoolPop(context);
      v10[2](v10, v46, v42);
      goto LABEL_38;
    }
    v10[2](v10, 0, 4);
  }
LABEL_38:

}

- (BOOL)isAdmissible:(id)a3 dampenedBy:(signed __int16 *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint8_t v21[8];
  _QWORD v22[7];
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v7 = v6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (a4)
    *a4 = 4;
  objc_msgSend(v6, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 0;
    objc_msgSend(v7, "signature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke;
    v22[3] = &unk_1EA3B5C68;
    v22[5] = buf;
    v22[6] = a4;
    v22[4] = &v27;
    -[DiagnosticCaseManager buildSpecificRestrictionsForSignature:result:](self, "buildSpecificRestrictionsForSignature:result:", v9, v22);

    if (v24[24])
    {
LABEL_5:
      v11 = *((_BYTE *)v28 + 24) != 0;
LABEL_25:
      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    if (-[NSMutableArray count](self->_totalCases, "count"))
    {
      if (a4)
        *a4 = 5;
      casemanagementLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "Not allowing a new case while another case is currently active.", v21, 2u);
      }

      v11 = 0;
      goto LABEL_25;
    }
    if (a4)
      *a4 = 0;
    if (-[DiagnosticCaseManager disableDampening](self, "disableDampening"))
    {
      casemanagementLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v15 = "Dampening is disabled, allowing case.";
LABEL_23:
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, v15, v21, 2u);
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isRemoteTrigger"))
      {
        objc_msgSend(v7, "signature");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "caseStorage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeStamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke_135;
        v20[3] = &unk_1EA3B5C90;
        v20[4] = &v27;
        v20[5] = a4;
        -[DiagnosticCaseManager caseAllowanceForSignature:timestamp:result:](self, "caseAllowanceForSignature:timestamp:result:", v17, v19, v20);

        goto LABEL_5;
      }
      casemanagementLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        v15 = "Allowing as a remotely triggered case.";
        goto LABEL_23;
      }
    }

    v11 = 1;
    goto LABEL_25;
  }
  casemanagementLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Not allowing case due to missing signature.", buf, 2u);
  }

  v11 = 0;
LABEL_26:
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke(_QWORD *a1, int a2, uint64_t a3)
{
  _WORD *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (_WORD *)a1[6];
    if (v4)
      *v4 = a3;
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    casemanagementLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "Case denied by restriction, dampening: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
}

uint64_t __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke_135(uint64_t result, char a2, __int16 a3)
{
  _WORD *v3;

  v3 = *(_WORD **)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (v3)
    *v3 = a3;
  return result;
}

- (id)casesDiagnosedInTheLast:(double)a3 from:(double)a4 matchingDomain:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_totalCases, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = a4 - a3;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "caseOpenedTime");
        if (v16 < a4)
        {
          objc_msgSend(v15, "caseOpenedTime");
          if (v17 > v13 && objc_msgSend(v15, "closureType") != 3)
          {
            if (objc_msgSend(v15, "closureType"))
            {
              if (!v8
                || (objc_msgSend(v15, "signature"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("domain")),
                    v19 = (void *)objc_claimAutoreleasedReturnValue(),
                    v20 = objc_msgSend(v8, "isEqualToString:", v19),
                    v19,
                    v18,
                    v20))
              {
                objc_msgSend(v22, "addObject:", v15);
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  return v22;
}

- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL8 v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __int16 v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  char v31;
  uint8_t v32[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      *(_QWORD *)buf = 0;
      v29 = buf;
      v30 = 0x2020000000;
      v31 = 0;
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 4;
      v8 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke;
      v23[3] = &unk_1EA3B5CB8;
      v23[4] = &v24;
      v23[5] = buf;
      -[DiagnosticCaseManager buildSpecificRestrictionsForSignature:result:](self, "buildSpecificRestrictionsForSignature:result:", v6, v23);
      if (v29[24])
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, *((__int16 *)v25 + 12), 0);
      }
      else
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 0;
        if (-[DiagnosticCaseManager disableDampening](self, "disableDampening"))
        {
          *((_BYTE *)v20 + 24) = 1;
          *((_WORD *)v25 + 12) = 0;
          casemanagementLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: Dampening is disabled, allowing case.", v32, 2u);
          }

        }
        else
        {
          v18[0] = v8;
          v18[1] = 3221225472;
          v18[2] = __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke_136;
          v18[3] = &unk_1EA3B5CB8;
          v18[4] = &v19;
          v18[5] = &v24;
          -[DiagnosticCaseManager caseAllowanceForSignature:timestamp:result:](self, "caseAllowanceForSignature:timestamp:result:", v6, 0, v18);
        }
        if (*((_BYTE *)v20 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          casemanagementLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v32 = 138543362;
            v33 = v15;
            _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: Generating group identifier: %{public}@", v32, 0xCu);
          }

          v17 = *((_BYTE *)v20 + 24) != 0;
        }
        else
        {
          v17 = 0;
          v15 = 0;
        }
        (*((void (**)(id, _BOOL8, _QWORD, void *))v7 + 2))(v7, v17, *((__int16 *)v25 + 12), v15);

        _Block_object_dispose(&v19, 8);
      }
      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      casemanagementLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "groupCaseIdentifierForSignature: Denying due to missing signature.", buf, 2u);
      }

      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, 4, 0);
    }
  }

}

void __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    casemanagementLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: case denied by restriction, dampening: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
}

void __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke_136(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  casemanagementLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v6 = "allowed";
    else
      v6 = "denied";
    +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: case: %s, dampening: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

- (id)createDiagnosticCaseWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  DiagnosticCase *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  DiagnosticCase *v36;
  __int16 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = -[DiagnosticCase initWithSignature:flags:events:payload:actions:manager:]([DiagnosticCase alloc], "initWithSignature:flags:events:payload:actions:manager:", v15, a4, v14, v13, v12, self);

  v37 = 0;
  LODWORD(v14) = -[DiagnosticCaseManager isAdmissible:dampenedBy:](self, "isAdmissible:dampenedBy:", v16, &v37);
  casemanagementLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v14)
  {
    if (v18)
    {
      -[DiagnosticCase caseId](v16, "caseId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DiagnosticCase signature](v16, "signature");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logSignatureDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v20;
      v40 = 2114;
      v41 = v22;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Accepting case id %{public}@ with signature %{public}@", buf, 0x16u);

    }
    -[NSMutableArray addObject:](self->_activeCases, "addObject:", v16);
    if (v37 == -1)
      -[DiagnosticCase setDampeningType:](v16, "setDampeningType:", 0xFFFFFFFFLL);
    -[DiagnosticCase setClosureType:](v16, "setClosureType:", 0);
    -[DiagnosticCase setCaseState:](v16, "setCaseState:", 1);
    -[DiagnosticCaseManager promoteTemporaryCase:](self, "promoteTemporaryCase:", v16);
    if (!v16)
      return v16;
    goto LABEL_14;
  }
  if (v18)
  {
    -[DiagnosticCase caseId](v16, "caseId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase signature](v16, "signature");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logSignatureDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[DiagnosticCase descriptionForDampeningType:](DiagnosticCase, "descriptionForDampeningType:", v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v39 = v25;
    v40 = 2114;
    v41 = v27;
    v42 = 2114;
    v43 = v28;
    _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting case id %@{public} with signature %{public}@ (%{public}@)", buf, 0x20u);

  }
  -[DiagnosticCase setDampeningType:](v16, "setDampeningType:", v37);
  -[DiagnosticCase setClosureType:](v16, "setClosureType:", 3);
  -[DiagnosticCaseManager queue](self, "queue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    casemanagementLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_DEFAULT, "No queue assigned! Finalizing case immediately.", buf, 2u);
    }

    -[DiagnosticCase setCaseState:](v16, "setCaseState:", 3);
    if (!v16)
      return v16;
    goto LABEL_14;
  }
  -[DiagnosticCaseManager queue](self, "queue");
  v30 = objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __88__DiagnosticCaseManager_createDiagnosticCaseWithSignature_flags_events_payload_actions___block_invoke;
  v35 = &unk_1EA3B4960;
  v36 = v16;
  dispatch_async(v30, &v32);

  if (v16)
LABEL_14:
    -[NSMutableArray addObject:](self->_totalCases, "addObject:", v16, v32, v33, v34, v35);
  return v16;
}

uint64_t __88__DiagnosticCaseManager_createDiagnosticCaseWithSignature_flags_events_payload_actions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCaseState:", 3);
}

- (id)diagnosticCaseWithId:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  DiagnosticCase *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_totalCases;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      objc_msgSend(v10, "caseId", (_QWORD)v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", v4);

      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Found case with ID %@{public} in totalCases", buf, 0xCu);

    }
    v15 = v10;

    if (v15)
      goto LABEL_16;
  }
  else
  {
LABEL_9:

  }
  casemanagementLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "Looking up case with ID %@{public} from persistent store", buf, 0xCu);

  }
  v15 = -[DiagnosticCase initWithCaseId:manager:]([DiagnosticCase alloc], "initWithCaseId:manager:", v4, self);
LABEL_16:

  return v15;
}

- (BOOL)finalizeDiagnosticCaseWithId:(id)a3 closureType:(signed __int16)a4 onlyIfReady:(BOOL)a5
{
  uint64_t v5;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  NSMutableArray *activeCases;
  _BOOL4 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  NSMutableArray *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v36 = a5;
  v5 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = self->_activeCases;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
      objc_msgSend(v13, "caseId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v7);

      if (v15)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_21;
      }
    }
    if (v36 && !objc_msgSend(v13, "readyToEndSession"))
    {
      casemanagementLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v24;
        _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_INFO, "Case %{public}@ is not yet ready for finalizing.", buf, 0xCu);

      }
      goto LABEL_21;
    }
    casemanagementLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v42 = v17;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "Ready to finalize case %@.", buf, 0xCu);

    }
    if ((_DWORD)v5 == 2 && (objc_msgSend(v13, "isSnapshot") & 1) == 0)
    {
      casemanagementLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "preferredDuration");
        v26 = v25;
        objc_msgSend(v13, "signature");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logSignatureDescription");
        v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "caseId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "UUIDString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        v45 = 2114;
        v46 = v30;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "Timeout exceeded (%.0f) Forcibly removing active case with signature %{public}@ (case ID = %{public}@)", buf, 0x20u);

      }
    }
    else
    {
      casemanagementLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v13, "signature");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logSignatureDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "caseId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v20;
        v43 = 2114;
        v44 = v22;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEBUG, "Removing active case with signature %{public}@ (case ID = %{public}@)", buf, 0x16u);

      }
    }

    objc_msgSend(v13, "setClosureType:", v5);
    objc_msgSend(v13, "setCaseState:", 3);
    v31 = v13;

    if (v31)
    {
      -[NSMutableArray removeObject:](self->_activeCases, "removeObject:", v31);
      v32 = 1;
      goto LABEL_31;
    }
  }
  else
  {
LABEL_21:

  }
  v32 = 0;
  if ((_DWORD)v5 != 2 && !v36)
  {
    casemanagementLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      activeCases = self->_activeCases;
      *(_DWORD *)buf = 138543618;
      v42 = v33;
      v43 = 2112;
      v44 = activeCases;
      _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_INFO, "Couldn't find case %{public}@ in active cases %@", buf, 0x16u);

    }
    v32 = 0;
LABEL_31:

  }
  return v32;
}

- (void)_updateCaseStatisticsWithCase:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *totalCases;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *pendingStatisticsUpdateCases;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  id v39;
  __int128 *v40;
  _QWORD v41[5];
  id v42;
  __int128 *p_buf;
  uint8_t v44[128];
  uint8_t v45[4];
  void *v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseClosureType");

  if (v6 != 4)
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "caseId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Updating statistics for case %@", (uint8_t *)&buf, 0xCu);

    }
    -[NSMutableArray addObject:](self->_pendingStatisticsUpdateCases, "addObject:", v4);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  v51 = 0;
  v10 = MEMORY[0x1E0C809B0];
  totalCases = self->_totalCases;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke;
  v41[3] = &unk_1EA3B5CE0;
  v41[4] = self;
  v12 = v4;
  v42 = v12;
  p_buf = &buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](totalCases, "enumerateObjectsUsingBlock:", v41);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptionWithLocale:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v45 = 138412290;
      v46 = v16;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Oldest unclosed case was created at %@", v45, 0xCu);

    }
  }
  else
  {
    casemanagementLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEBUG, "No unclosed case, using the current time.", v45, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    v13 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  pendingStatisticsUpdateCases = self->_pendingStatisticsUpdateCases;
  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke_143;
  v37[3] = &unk_1EA3B5D08;
  v37[4] = self;
  v29 = v12;
  v38 = v29;
  v40 = &buf;
  v32 = v19;
  v39 = v32;
  -[NSMutableArray enumerateObjectsUsingBlock:](pendingStatisticsUpdateCases, "enumerateObjectsUsingBlock:", v37);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("caseOpenedTime"), 1);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortedArrayUsingDescriptors:");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        casemanagementLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v25, "caseId", v29);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v45 = 138412290;
          v46 = v28;
          _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "Updating statistics for case %@.", v45, 0xCu);

        }
        -[DiagnosticStatisticsManager updateCaseStatisticsWith:](self->_statsManager, "updateCaseStatisticsWith:", v25);
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v22);
  }

  -[NSMutableArray removeObjectsInArray:](self->_pendingStatisticsUpdateCases, "removeObjectsInArray:", v21);
  objc_msgSend(v32, "removeAllObjects");

  _Block_object_dispose(&buf, 8);
}

void __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "statisticsRowForDiagnosticCase:matchesWith:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend(v10, "caseState") != 6)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
        || (objc_msgSend(v10, "caseStorage"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "timeStamp"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v5 = objc_msgSend(v4, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)),
            v4,
            v3,
            v5 == -1))
      {
        objc_msgSend(v10, "caseStorage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeStamp");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
    }
  }

}

void __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "statisticsRowForDiagnosticCase:matchesWith:", v3, *(_QWORD *)(a1 + 40))&& (objc_msgSend(v3, "caseStorage"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "timeStamp"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)), v5, v4, v6 == -1))
  {
    casemanagementLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "caseId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "caseStorage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeStamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "descriptionWithLocale:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v16;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "Candidate case %@ was created at %@, can update its statistics now", (uint8_t *)&v21, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }
  else
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "caseId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "caseStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeStamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptionWithLocale:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Candidate case %@ was created at %@, still blocked", (uint8_t *)&v21, 0x16u);

    }
  }

}

- (int)addToCaseWithId:(id)a3 events:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && (objc_msgSend(v9, "count") || objc_msgSend(v10, "count")))
  {
    v11 = 40;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_activeCases;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v22 = v10;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "caseId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v8);

          if (v19)
          {
            if (objc_msgSend(v9, "count"))
              objc_msgSend(v17, "addEvents:", v9);
            v10 = v22;
            if (objc_msgSend(v22, "count"))
              objc_msgSend(v17, "addPayload:", v22);
            v11 = 0;
            goto LABEL_21;
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
      v10 = v22;
    }
LABEL_21:

  }
  else
  {
    casemanagementLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_INFO, "invalid parameters: event or payload must not be empty (events: %@, payload: %@)", buf, 0x16u);
    }

    v11 = 20;
  }

  return v11;
}

- (int)addSignatureContentToCaseWithId:(id)a3 key:(id)a4 content:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    v11 = 40;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = self->_activeCases;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v26 = v10;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v17, "caseId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v8);

          if (v19)
          {
            objc_msgSend(v17, "signature");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v26;
            if (v22)
              objc_msgSend(v22, "stringByAppendingString:", v26);
            else
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_msgSend(v17, "signature");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKey:", v23, v9);

            }
            v11 = 0;

            goto LABEL_22;
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v14)
          continue;
        break;
      }
      v10 = v26;
    }
LABEL_22:

  }
  else
  {
    casemanagementLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_INFO, "invalid parameters: empty or missing key/content (key: %@, content: %@)", buf, 0x16u);
    }

    v11 = 20;
  }

  return v11;
}

- (int)cancelCaseWithId:(id)a3
{
  id v4;
  int v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = 40;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_activeCases;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "caseId", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            objc_msgSend(v11, "events");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeAllObjects");

            objc_msgSend(v11, "payloads");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeAllObjects");

            objc_msgSend(v11, "setClosureType:", 4);
            objc_msgSend(v11, "finishCase");
            objc_msgSend(v11, "setCaseState:", 6);
            v5 = 0;
            goto LABEL_12;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    casemanagementLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "Missing Case ID", buf, 2u);
    }

    v5 = 20;
  }

  return v5;
}

- (void)setUpGeneralCaseReportGenerators
{
  void *v3;
  int v4;
  GetNetworkInfoReportGenerator *v5;
  FetchCrashesSpinsEtcFilesGenerator *v6;
  FetchLogArchivesReportGenerator *v7;

  -[DiagnosticCaseManager configManager](self, "configManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoBugCaptureRegularPayloads");

  if (v4)
  {
    v5 = -[GetNetworkInfoReportGenerator initWithQueue:]([GetNetworkInfoReportGenerator alloc], "initWithQueue:", self->_queue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportGenerators, "setObject:forKeyedSubscript:", v5, CFSTR("GetNetworkInfoReporter"));

    v6 = -[FetchCrashesSpinsEtcFilesGenerator initWithQueue:]([FetchCrashesSpinsEtcFilesGenerator alloc], "initWithQueue:", self->_queue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportGenerators, "setObject:forKeyedSubscript:", v6, CFSTR("CrashesAndSpinsReporter"));

    v7 = -[FetchLogArchivesReportGenerator initWithQueue:]([FetchLogArchivesReportGenerator alloc], "initWithQueue:", self->_queue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportGenerators, "setObject:forKeyedSubscript:", v7, CFSTR("FetchLogArchiveReporter"));

  }
}

- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "diagCase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", 0);
  objc_msgSend(v10, "setDiagCase:", 0);
  -[NSMutableArray removeObject:](self->_requestedReportGenerators, "removeObject:", v10);
  objc_msgSend(v11, "reportGeneratorEnded:reportInfo:error:isFinalReportGenerator:", v10, v9, v8, -[NSMutableArray count](self->_requestedReportGenerators, "count") == 0);

  if (-[NSMutableArray count](self->_requestedReportGenerators, "count"))
  {
    -[DiagnosticCaseManager startCollectingNextReportForDiagnosticCase:](self, "startCollectingNextReportForDiagnosticCase:", v11);
  }
  else
  {
    casemanagementLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "No more Requested Report Generators", v13, 2u);
    }

  }
}

- (void)addCaseReportOutlet:(id)a3
{
  -[NSMutableSet addObject:](self->_reportOutlets, "addObject:", a3);
}

- (BOOL)hasOpenCases
{
  NSMutableArray *totalCases;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  totalCases = self->_totalCases;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__DiagnosticCaseManager_hasOpenCases__block_invoke;
  v5[3] = &unk_1EA3B5238;
  v5[4] = &v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](totalCases, "enumerateObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__DiagnosticCaseManager_hasOpenCases__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "caseStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseState");

  if (v7 != 6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)addTransactionForCaseID:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *activeTransactions;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    if (!self->_activeTransactions)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      activeTransactions = self->_activeTransactions;
      self->_activeTransactions = v6;

    }
    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v5;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Taking transaction for case identifier: %@", buf, 0xCu);
    }

    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.autobugcapture.case.%@"), v5));
    -[NSObject UTF8String](v9, "UTF8String");
    v10 = (void *)os_transaction_create();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeTransactions, "setObject:forKeyedSubscript:", v10, v5);
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[NSMutableDictionary count](self->_activeTransactions, "count");
      *(_DWORD *)buf = 134217984;
      v14 = v12;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "Currently holding %ld transaction(s)", buf, 0xCu);
    }

  }
  else
  {
    casemanagementLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v5;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Will not add a transaction for an invalid case identifier: %@", buf, 0xCu);
    }
  }

}

- (void)removeTransactionForCaseID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *p_super;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    casemanagementLogHandle();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (uint64_t)v5;
      _os_log_impl(&dword_1DBAE1000, p_super, OS_LOG_TYPE_ERROR, "Unable to remove a transaction for an invalid case identifier: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = (uint64_t)v5;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Releasing transaction for case identifier: %@", (uint8_t *)&v10, 0xCu);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeTransactions, "setObject:forKeyedSubscript:", 0, v5);
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = -[NSMutableDictionary count](self->_activeTransactions, "count");
    v10 = 134217984;
    v11 = v8;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Currently holding %ld transaction(s)", (uint8_t *)&v10, 0xCu);
  }

  if (!-[NSMutableDictionary count](self->_activeTransactions, "count"))
  {
    p_super = &self->_activeTransactions->super.super;
    self->_activeTransactions = 0;
LABEL_11:

  }
}

- (unsigned)avgCasesPerDay
{
  if (self->_avgCasesPerDay)
    return self->_avgCasesPerDay;
  else
    return 20;
}

- (void)setAvgCasesPerDay:(unsigned int)a3
{
  self->_avgCasesPerDay = a3;
}

- (id)lookUpDiagnosticCaseStorageForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[DiagnosticCaseStorageAnalytics diagnosticCaseStorageWithId:](self->_caseStorageAnalytics, "diagnosticCaseStorageWithId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v22 = v8;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Found %ld persisted case(s) for %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__DiagnosticCaseManager_lookUpDiagnosticCaseStorageForUUID___block_invoke;
  v12[3] = &unk_1EA3B5D30;
  v9 = v5;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__DiagnosticCaseManager_lookUpDiagnosticCaseStorageForUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "caseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)caseStorageForCaseID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[DiagnosticCaseManager lookUpDiagnosticCaseStorageForUUID:](self, "lookUpDiagnosticCaseStorageForUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[DiagnosticCaseManager createTemporaryDiagnosticCaseStorageForUUID:](self, "createTemporaryDiagnosticCaseStorageForUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)closeCase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  DiagnosticCaseManager *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caseClosedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "caseStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Encountered a case with a nil caseClosedTime! (caseStorage: %@)", buf, 0xCu);

    }
  }
  queue = self->_queue;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __35__DiagnosticCaseManager_closeCase___block_invoke;
  v20 = &unk_1EA3B5010;
  v21 = self;
  v10 = v4;
  v22 = v10;
  dispatch_async(queue, &v17);
  -[NSMutableArray removeObject:](self->_activeCases, "removeObject:", v10, v17, v18, v19, v20, v21);
  -[DiagnosticCaseManager _updateCaseStatisticsWithCase:](self, "_updateCaseStatisticsWithCase:", v10);
  v11 = objc_msgSend(v10, "closureType");
  if (v11 == 4)
  {
    objc_msgSend(v10, "caseId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCaseManager removeCaseStorageWithID:](self, "removeCaseStorageWithID:", v12);

    -[NSMutableArray removeObject:](self->_totalCases, "removeObject:", v10);
  }
  else
  {
    if (objc_msgSend(v10, "dampeningType") == -1)
    {
      objc_msgSend(v10, "signature");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "caseOpenedTime");
      -[DiagnosticCaseManager removeTransientCasesWithSignature:beforeTime:](self, "removeTransientCasesWithSignature:beforeTime:", v13);

    }
    if ((int)objc_msgSend(v10, "dampeningType") <= 0)
    {
      self->_shouldPurgeStorageAfterSave = 1;
      -[DiagnosticCaseManager saveAllCases](self, "saveAllCases");
      objc_msgSend(v10, "caseId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DiagnosticCaseManager removeTransactionForCaseID:](self, "removeTransactionForCaseID:", v15);

    }
    else
    {
      -[DiagnosticCaseManager removeClosedCasesFromTotalCases](self, "removeClosedCasesFromTotalCases");
    }
  }

  return v11 == 4;
}

uint64_t __35__DiagnosticCaseManager_closeCase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postProcessActionsForClosedCase:", *(_QWORD *)(a1 + 40));
}

- (void)postProcessActionsForClosedCase:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if ((int)objc_msgSend(v7, "dampeningType") >= 1)
  {
    objc_msgSend(v7, "signature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("UIPerformance"));

    if (v6)
      -[DiagnosticLiaison checkForUIImpactScenarioForCase:](self->_liaison, "checkForUIImpactScenarioForCase:", v7);
  }

}

- (unint64_t)collectDiagnosticExtensionLogsWithParameters:(id)a3 options:(id)a4 diagCase:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  casemanagementLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Ready to collect from diagnostic extensions with parameters: %@", buf, 0xCu);
  }

  -[DiagnosticCaseManager diagnosticsController](self, "diagnosticsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCaseManager queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__DiagnosticCaseManager_collectDiagnosticExtensionLogsWithParameters_options_diagCase_reply___block_invoke;
  v20[3] = &unk_1EA3B5D58;
  v21 = v11;
  v17 = v11;
  v18 = objc_msgSend(v15, "collectDiagnosticExtensionFilesForDiagnosticCase:parameters:options:queue:reply:", v12, v10, v13, v16, v20);

  return v18;
}

void __93__DiagnosticCaseManager_collectDiagnosticExtensionLogsWithParameters_options_diagCase_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Received %ld results from Diagnostic Extensions", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)recordDiagnosticCaseSummaryForCase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  casemanagementLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "caseId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logSignatureDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Saving summary for case id %{public}@ with signature %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[DiagnosticCaseSummaryAnalytics insertEntityForDiagnosticCase:](self->_caseSummaryAnalytics, "insertEntityForDiagnosticCase:", v4);
  -[DiagnosticCaseManager saveAllCases](self, "saveAllCases");

}

- (BOOL)requestReportGenerator:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSMutableArray *requestedReportGenerators;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_reportGenerators, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setDefaults");
    objc_msgSend(v7, "count");
    v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("logarchive"));
    requestedReportGenerators = self->_requestedReportGenerators;
    if (v10)
      -[NSMutableArray addObject:](requestedReportGenerators, "addObject:", v9);
    else
      -[NSMutableArray insertObject:atIndex:](requestedReportGenerators, "insertObject:atIndex:", v9, 0);
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("diagext")) & 1) == 0)
  {
    casemanagementLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Could not find requested report generator named %@", (uint8_t *)&v14, 0xCu);
    }

  }
  return v9 != 0;
}

- (void)startCollectingNextReportForDiagnosticCase:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_requestedReportGenerators, "count"))
  {
    -[NSMutableArray firstObject](self->_requestedReportGenerators, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDelegate:](v5, "setDelegate:", self);
    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "About to generate report by %@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v4, "caseId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject generateReportForCase:reportName:](v5, "generateReportForCase:reportName:", v4, v10);

  }
  else
  {
    casemanagementLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_ERROR, "No reports requested, but we were asked to collect reports...?", (uint8_t *)&v11, 2u);
    }
  }

}

- (BOOL)sendReportsForCase:(id)a3
{
  id v4;
  char v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  NSObject *v12;
  const char *v13;
  objc_class *v14;
  void *v15;
  DiagnosticCaseManager *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet count](self->_reportOutlets, "count") != 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = self;
  v6 = self->_reportOutlets;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "publishReportForCase:options:", v4, 0);
        casemanagementLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          if (v11)
            v13 = "Successfully published";
          else
            v13 = "Failed to publish";
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v23 = v13;
          v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "%s report to %@", buf, 0x16u);

        }
        v5 &= v11;
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeObject:](v17->_activeCases, "removeObject:", v4);
  return v5;
}

- (BOOL)statisticsRowForDiagnosticCase:(id)a3 matchesWith:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "caseStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "caseDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    objc_msgSend(v5, "caseStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "caseDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caseStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "caseDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    goto LABEL_5;
  }
  objc_msgSend(v6, "caseStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "caseDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
  v15 = 1;
LABEL_5:
  objc_msgSend(v5, "caseStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "caseType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    objc_msgSend(v6, "caseStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "caseType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_9;
  }
  objc_msgSend(v5, "caseStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "caseType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caseStorage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "caseType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v15 &= objc_msgSend(v21, "isEqualToString:", v23);

LABEL_9:
  objc_msgSend(v5, "caseStorage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "caseSubtype");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {

  }
  else
  {
    objc_msgSend(v6, "caseStorage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "caseSubtype");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_13;
  }
  objc_msgSend(v5, "caseStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "caseSubtype");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caseStorage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "caseSubtype");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v15 &= objc_msgSend(v29, "isEqualToString:", v31);

LABEL_13:
  objc_msgSend(v5, "caseStorage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "caseSubtypeContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {

  }
  else
  {
    objc_msgSend(v6, "caseStorage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "caseSubtypeContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_17;
  }
  objc_msgSend(v5, "caseStorage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "caseSubtypeContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caseStorage");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "caseSubtypeContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v15 &= objc_msgSend(v37, "isEqualToString:", v39);

LABEL_17:
  objc_msgSend(v5, "caseStorage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "caseDetectedProcess");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

LABEL_20:
    objc_msgSend(v5, "caseStorage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "caseDetectedProcess");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caseStorage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "caseDetectedProcess");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v15 &= objc_msgSend(v45, "isEqualToString:", v47);

    goto LABEL_21;
  }
  objc_msgSend(v6, "caseStorage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "caseDetectedProcess");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    goto LABEL_20;
LABEL_21:

  return v15;
}

- (id)diagnosticCaseDictionariesFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5 - 21 <= 0xFFFFFFFFFFFFFFEBLL)
  {
    casemanagementLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v18 = 20;
      v19 = 2048;
      v20 = 20;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Constraining cases listing to a max of %d (was requested %ld)", buf, 0x12u);
    }

    a5 = 20;
  }
  v11 = (void *)MEMORY[0x1DF0B6314]();
  -[DiagnosticCaseStorageAnalytics historicalDiagnosticCaseStorageDictionaryFromIdentifier:withEvents:count:](self->_caseStorageAnalytics, "historicalDiagnosticCaseStorageDictionaryFromIdentifier:withEvents:count:", v8, v6, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__DiagnosticCaseManager_diagnosticCaseDictionariesFromIdentifier_withEvents_count___block_invoke;
  v15[3] = &unk_1EA3B5D80;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  objc_autoreleasePoolPop(v11);
  return v13;
}

void __83__DiagnosticCaseManager_diagnosticCaseDictionariesFromIdentifier_withEvents_count___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    +[DiagnosticCase generateCaseSummaryFromCaseStorageDictionary:](DiagnosticCase, "generateCaseSummaryFromCaseStorageDictionary:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

- (void)getHistoricalDiagnosicCaseDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[DiagnosticCaseManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__DiagnosticCaseManager_getHistoricalDiagnosicCaseDictionaryFromIdentifier_withEvents_count_reply___block_invoke;
  block[3] = &unk_1EA3B5DA8;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __99__DiagnosticCaseManager_getHistoricalDiagnosicCaseDictionaryFromIdentifier_withEvents_count_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(*(id *)(a1 + 32), "diagnosticCaseDictionariesFromIdentifier:withEvents:count:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

  objc_autoreleasePoolPop(v2);
}

- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
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
  -[DiagnosticCaseManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DiagnosticCaseManager_listCaseSummariesWithIdentifiers_reply___block_invoke;
  block[3] = &unk_1EA3B4AC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __64__DiagnosticCaseManager_listCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(*(id *)(a1 + 32), "caseSummariesWithIdentifiers:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

  objc_autoreleasePoolPop(v2);
}

- (id)caseSummariesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1DF0B6314]();
  -[DiagnosticCaseSummaryAnalytics fetchCaseSummariesWithIdentifiers:](self->_caseSummaryAnalytics, "fetchCaseSummariesWithIdentifiers:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__DiagnosticCaseManager_caseSummariesWithIdentifiers___block_invoke;
  v10[3] = &unk_1EA3B5D80;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  objc_autoreleasePoolPop(v6);
  return v8;
}

void __54__DiagnosticCaseManager_caseSummariesWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[DiagnosticCaseSummaryAnalytics listSummaryItemFromCaseSummaryDictionary:](DiagnosticCaseSummaryAnalytics, "listSummaryItemFromCaseSummaryDictionary:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[DiagnosticCaseManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__DiagnosticCaseManager_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke;
  block[3] = &unk_1EA3B5DD0;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __76__DiagnosticCaseManager_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1DF0B6314]();
  objc_msgSend(*(id *)(a1 + 32), "caseSummariesOfType:fromIdentifier:count:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);

  objc_autoreleasePoolPop(v2);
}

- (id)caseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a5 - 21 <= 0xFFFFFFFFFFFFFFEBLL)
  {
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v19 = 20;
      v20 = 2048;
      v21 = 20;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, "Constraining cases listing to a max of %d (was requested %ld)", buf, 0x12u);
    }

    a5 = 20;
  }
  v12 = (void *)MEMORY[0x1DF0B6314]();
  -[DiagnosticCaseSummaryAnalytics fetchCaseSummariesOfType:fromIdentifier:count:](self->_caseSummaryAnalytics, "fetchCaseSummariesOfType:fromIdentifier:count:", v8, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__DiagnosticCaseManager_caseSummariesOfType_fromIdentifier_count___block_invoke;
  v16[3] = &unk_1EA3B5D80;
  v14 = v10;
  v17 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

  objc_autoreleasePoolPop(v12);
  return v14;
}

void __66__DiagnosticCaseManager_caseSummariesOfType_fromIdentifier_count___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[DiagnosticCaseSummaryAnalytics listSummaryItemFromCaseSummaryDictionary:](DiagnosticCaseSummaryAnalytics, "listSummaryItemFromCaseSummaryDictionary:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)_updateSignatureWithBuildVariantInfoAndFlags:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVariant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "This case's buildVariant is %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("build_variant"));
  if (objc_msgSend(v5, "internalBuild"))
  {
    -[DiagnosticCaseManager configManager](self, "configManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDeviceUnderTest");

    if (v9)
    {
      casemanagementLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "Flagging this case as generated from an ABC DUT device.", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(v4, "setObject:forKey:", CFSTR("isABCDUT"), CFSTR("internal_flags"));
    }
  }

  return v4;
}

- (void)_processRemoteIDSTriggers:(id)a3 validFor:(double)a4 signature:(id)a5 sessionID:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  OS_dispatch_queue *queue;
  id *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  _QWORD v26[2];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("groupID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  casemanagementLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEBUG, "Ready to trigger a remote case for session %{public}@", buf, 0xCu);
    }

    if (a4 < 1.0)
      a4 = 3600.0;
    -[DiagnosticCaseManager liaison](self, "liaison");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_159;
    v25[3] = &unk_1EA3B5E20;
    v22 = (id *)v26;
    v23 = v12;
    v26[0] = v23;
    v26[1] = self;
    v27 = v14;
    v28 = v15;
    objc_msgSend(v20, "remotelyTriggerSessionWithSignature:forDestinations:groupIdentifier:validFor:queue:reply:", v13, v23, v16, queue, v25, a4);

    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "Remote case trigger requires a group identifier.", buf, 2u);
  }

  if (v15)
  {
    -[DiagnosticCaseManager queue](self, "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke;
    block[3] = &unk_1EA3B56B0;
    v22 = &v30;
    v30 = v15;
    dispatch_async(v24, block);

LABEL_11:
  }

}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("name");
  v3[1] = CFSTR("result");
  v4[0] = CFSTR("IDSRemoteTrigger");
  v4[1] = CFSTR("failure");
  v3[2] = CFSTR("status");
  v4[2] = CFSTR("Cancelled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_159(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errorObj"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v8)
      goto LABEL_7;
    v9 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v31 = v9;
    v10 = "Remote case trigger for %ld devices was successful";
    v11 = v7;
    v12 = 12;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v13 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134218242;
    v31 = v13;
    v32 = 2112;
    v33 = v6;
    v10 = "Remote case trigger for %ld devices was NOT successful (error: %@)";
    v11 = v7;
    v12 = 22;
  }
  _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  casemanagementLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (uint64_t)v5;
    _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEBUG, "Liaison result was: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IDSMessageIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    v16 = (void *)*((_QWORD *)a1[5] + 15);
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = a1[5];
      v19 = (void *)v18[15];
      v18[15] = v17;

      v16 = (void *)*((_QWORD *)a1[5] + 15);
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", a1[6], v15);
  }
  v20 = a1[5];
  v21 = a1[6];
  objc_msgSend(v20, "queue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_160;
  v28[3] = &unk_1EA3B5DF8;
  v29 = a1[6];
  objc_msgSend(v20, "addToSession:event:payload:queue:reply:", v21, v5, 0, v22, v28);

  if (a1[7])
  {
    objc_msgSend(a1[5], "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_163;
    block[3] = &unk_1EA3B4A28;
    v27 = a1[7];
    v26 = v5;
    dispatch_async(v24, block);

  }
}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(v4, "BOOLValue"))
      v8 = "was successful";
    else
      v8 = "failed";
    v9 = 138543874;
    v10 = v7;
    v11 = 2080;
    v12 = v8;
    v13 = 2048;
    v14 = objc_msgSend(v5, "integerValue");
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Adding remote trigger event status to session %{public}@ %s. (Reason code %ld)", (uint8_t *)&v9, 0x20u);
  }

}

uint64_t __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_163(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_processReportActions:(id)a3 session:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  objc_class *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "BOOLValue");
    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = "disabled";
      if (v7)
        v9 = "enabled";
      *(_DWORD *)buf = 136315138;
      v41 = v9;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "DiagnosticExtensions action is %s by client request", buf, 0xCu);
    }
    v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "enabled";
      v42 = 2112;
      v43 = v10;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "DiagnosticExtensions action is %s by client request with options %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (v6)
  {
    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = (const char *)v6;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for DiagnosticExtensions action parameter. Enabled by default", buf, 0x16u);

    }
    v10 = 0;
    v7 = 1;
    goto LABEL_14;
  }
  v10 = 0;
  v7 = 1;
LABEL_15:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logarchive"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v13, "BOOLValue");
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = "disabled";
      if (v14)
        v16 = "enabled";
      *(_DWORD *)buf = 136315138;
      v41 = v16;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Log archive collection is %s by client request", buf, 0xCu);
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v13)
  {
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = (const char *)v13;
      v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for log archive action parameter. Enabled by default", buf, 0x16u);

    }
    v14 = 1;
    goto LABEL_24;
  }
  v14 = 1;
LABEL_25:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cnslogs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "BOOLValue");
    casemanagementLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = "disabled";
      if (v7)
        v22 = "enabled";
      *(_DWORD *)buf = 136315138;
      v41 = v22;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "Crashes and Spins log collection is %s by client request", buf, 0xCu);
    }
LABEL_34:
    v25 = v7;

    goto LABEL_35;
  }
  if (v19)
  {
    casemanagementLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = (const char *)v19;
      v42 = 2112;
      v43 = v24;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for crashes and spin logs action parameter. Enabled by default", buf, 0x16u);

    }
    v20 = 1;
    goto LABEL_34;
  }
  v25 = v7;
  v20 = 1;
LABEL_35:
  v26 = v6;
  v38 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("gni"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v27, "BOOLValue");
    casemanagementLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = "disabled";
      if (v25)
        v31 = "enabled";
      *(_DWORD *)buf = 136315138;
      v41 = v31;
      _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_INFO, "get-network-info log collection action is %s by client request", buf, 0xCu);
    }
LABEL_44:

    goto LABEL_45;
  }
  if (v27)
  {
    casemanagementLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v41 = (const char *)v27;
      v42 = 2112;
      v43 = v33;
      _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for get-network-info action parameter. Enabled by default", buf, 0x16u);

    }
    v29 = 1;
    goto LABEL_44;
  }
  v29 = 1;
LABEL_45:
  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "customerSeedBuild");

  if (v35)
  {
    casemanagementLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v36, OS_LOG_TYPE_INFO, "Customer Seed installs will only enable DiagnosticExtension collection", buf, 2u);
    }

    v20 = 0;
    v29 = 0;
    v14 = 0;
  }
  if (v25)
    objc_msgSend(v39, "addRequiredAction:option:attachmentType:pattern:", CFSTR("diagext"), v28, CFSTR("diagext"), 0);
  if (v14)
    objc_msgSend(v39, "addRequiredAction:option:attachmentType:pattern:", CFSTR("FetchLogArchiveReporter"), 0, CFSTR("logarchive"), CFSTR("logs-"));
  if (v20)
    objc_msgSend(v39, "addRequiredAction:option:attachmentType:pattern:", CFSTR("CrashesAndSpinsReporter"), 0, CFSTR("cnslogs"), CFSTR("crashes_and_spins"));
  if (v29)
    objc_msgSend(v39, "addRequiredAction:option:attachmentType:pattern:", CFSTR("GetNetworkInfoReporter"), 0, CFSTR("gni"), CFSTR("get_network_info"));

}

- (unint64_t)_processProbeActions:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v7, "caseId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__DiagnosticCaseManager__processProbeActions_session___block_invoke;
    v12[3] = &unk_1EA3B5E48;
    v12[4] = self;
    v13 = v7;
    v14 = &v16;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    v9 = v17[3];

  }
  else
  {
    casemanagementLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Cannot process probe actions for a session with no identifier.", buf, 2u);
    }

    v9 = v17[3];
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __54__DiagnosticCaseManager__processProbeActions_session___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v9;
    v10 = "Found unexpected object %@ of class %@ as key in actions dictionary.";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_8;
  }
  v7 = v5;
  if (!-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("pcap")))
  {
    casemanagementLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      goto LABEL_10;
    }
    v14 = 138412290;
    v15 = v7;
    v10 = "Skip processing actions key %@ (unsupported, or not a probe)";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 12;
LABEL_8:
    _os_log_impl(&dword_1DBAE1000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_processActionsForPacketCaptureProbe:session:", v6, *(_QWORD *)(a1 + 40));
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
LABEL_10:

}

- (void)_processActionsForPacketCaptureProbe:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DiagnosticCaseManager configManager](self, "configManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autoBugCaptureSensitivePayloads");

  if (!v9)
  {
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEFAULT, "Will not collect packet capture since collecting sensitive payloads are not allowed.", (uint8_t *)&v21, 2u);
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = &unk_1EA3CFCD8;
      if (!objc_msgSend(v6, "BOOLValue"))
        goto LABEL_20;
      goto LABEL_14;
    }
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as object in actions dictionary.", (uint8_t *)&v21, 0x16u);

    }
LABEL_19:

    v12 = &unk_1EA3CFCD8;
    goto LABEL_20;
  }
  v10 = v6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("duration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
  }
  else
  {
    casemanagementLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ for value of duration in probe parameter dictionary.", (uint8_t *)&v21, 0x16u);

    }
    v12 = &unk_1EA3CFCD8;
  }

LABEL_14:
  casemanagementLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "caseId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v18;
    _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_DEFAULT, "Packet capture probe requested for case %{public}@", (uint8_t *)&v21, 0xCu);

  }
  -[DiagnosticCaseManager startPacketCaptureForSession:duration:](self, "startPacketCaptureForSession:duration:", v7, v12);
LABEL_20:

}

- (void)startPeriodicTimer
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *periodicTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[16];

  if (!self->periodicTimer)
  {
    casemanagementLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Starting periodic diagnostic session management.", buf, 2u);
    }

    -[DiagnosticCaseManager queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    periodicTimer = self->periodicTimer;
    self->periodicTimer = v5;

    v7 = self->periodicTimer;
    v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xDF8475800uLL, 0x2540BE400uLL);
    v9 = self->periodicTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__DiagnosticCaseManager_startPeriodicTimer__block_invoke;
    handler[3] = &unk_1EA3B4960;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->periodicTimer);
  }
}

uint64_t __43__DiagnosticCaseManager_startPeriodicTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "periodicSessionManagement");
}

- (void)stopPeriodicTimer
{
  NSObject *v3;
  OS_dispatch_source *periodicTimer;
  uint8_t v5[16];

  if (self->periodicTimer)
  {
    casemanagementLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Stopping periodic diagnostic session management.", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->periodicTimer);
    periodicTimer = self->periodicTimer;
    self->periodicTimer = 0;

  }
}

- (void)periodicSessionManagement
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  DiagnosticCaseManager *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCaseManager activeCases](self, "activeCases");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "caseOpenedTime");
        if (v5 > v13 + 900.0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v9);
  }
  if (objc_msgSend(v6, "count"))
  {
    casemanagementLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134217984;
      v31 = v15;
      _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "Found %ld overdue sessions. Force closing...", buf, 0xCu);
    }

    -[DiagnosticCaseManager queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __50__DiagnosticCaseManager_periodicSessionManagement__block_invoke;
    v23 = &unk_1EA3B5010;
    v24 = self;
    v25 = v6;
    dispatch_async(v16, &v20);

  }
  -[DiagnosticCaseManager activeCases](self, "activeCases", v20, v21, v22, v23, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    casemanagementLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_INFO, "No diagnostic sessions are currently active.", buf, 2u);
    }

    -[DiagnosticCaseManager stopPeriodicTimer](self, "stopPeriodicTimer");
    -[NSMutableDictionary removeAllObjects](self->activeProbes, "removeAllObjects");
  }

}

uint64_t __50__DiagnosticCaseManager_periodicSessionManagement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endSessions:forced:", *(_QWORD *)(a1 + 40), 1);
}

- (void)updateSignatureWithBundleIdentifier:(id)a3 reply:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, id))a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("machUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v8, "integerValue");
  if (!objc_msgSend(v6, "length"))
    objc_msgSend(v7, "length");
  v5[2](v5, v9);

}

- (void)startPacketCaptureForSession:(id)a3 duration:(id)a4
{
  id v6;
  id v7;
  TCPDumpProbe *v8;
  void *v9;
  TCPDumpProbe *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  TCPDumpProbe *v30;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  TCPDumpProbe *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  DiagnosticCaseManager *v45;
  id v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [TCPDumpProbe alloc];
  -[DiagnosticCaseManager queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TCPDumpProbe initWithQueue:](v8, "initWithQueue:", v9);

  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  objc_msgSend(v6, "caseId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->activeProbes, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->activeProbes, "setObject:forKeyedSubscript:", v15, v14);
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v12);
  -[TestProbe setDiagSessionUUID:](v10, "setDiagSessionUUID:", v14);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke;
  aBlock[3] = &unk_1EA3B5E98;
  v44 = v12;
  v45 = self;
  v46 = v15;
  v32 = v15;
  v31 = v12;
  v17 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("probe"), CFSTR("type"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, CFSTR("name"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("Requesting"), CFSTR("status"));
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSince1970");
  objc_msgSend(v19, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("timestamp"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("requestedDuration"));
  v47[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v16;
  v41[1] = 3221225472;
  v41[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2;
  v41[3] = &unk_1EA3B5E70;
  v23 = v14;
  v42 = v23;
  -[DiagnosticCaseManager addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v23, v22, 0, v41);

  objc_msgSend(v33, "addRequiredAttachmentType:pattern:", CFSTR("pcap"), CFSTR(".pcapng"));
  objc_msgSend(v7, "doubleValue");
  v25 = v24;

  -[DiagnosticCaseManager configManager](self, "configManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logArchivePath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_185;
  v38[3] = &unk_1EA3B5EE8;
  v38[4] = self;
  v39 = v23;
  v40 = v17;
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_189;
  v34[3] = &unk_1EA3B5F38;
  v34[4] = self;
  v35 = v10;
  v36 = v39;
  v37 = v40;
  v28 = v40;
  v29 = v39;
  v30 = v10;
  -[TCPDumpProbe startTCPDumpWithDuration:destinationPath:tcpDumpStarted:tcpDumpCompleted:](v30, "startTCPDumpWithDuration:destinationPath:tcpDumpStarted:tcpDumpCompleted:", v27, v38, v34, v25);

}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString **v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  switch(a3)
  {
    case 1:
      if ((a4 & 1) != 0)
        goto LABEL_23;
      casemanagementLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ started successfully.", buf, 0xCu);
      }

      v9 = CFSTR("In Progress");
      v10 = 0;
      v11 = 0;
      v12 = 0;
      goto LABEL_24;
    case 2:
      if (!a4)
        goto LABEL_23;
      casemanagementLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ completed successfully.", buf, 0xCu);
      }

      v9 = CFSTR("success");
      v10 = 0;
      v11 = 1;
      goto LABEL_19;
    case 3:
      casemanagementLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ failed.", buf, 0xCu);
      }

      v9 = CFSTR("Finished");
      v11 = 0;
      v10 = 1;
      goto LABEL_19;
    case 4:
      casemanagementLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ cancelled.", buf, 0xCu);
      }

      v9 = CFSTR("Cancelled");
      v10 = 0;
      v11 = 0;
LABEL_19:
      v12 = 1;
      goto LABEL_24;
    case 5:
      casemanagementLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v7;
        _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ pending cancellation.", buf, 0xCu);
      }

      goto LABEL_23;
    default:
      casemanagementLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v34 = v7;
        v35 = 1024;
        v36 = a3;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ returned unexpected status update (%d)", buf, 0x12u);
      }

LABEL_23:
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v9 = 0;
LABEL_24:
      if (-[__CFString length](v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("probe"), CFSTR("type"));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("name"));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("status"));
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        objc_msgSend(v19, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("timestamp"));

        if (v12)
        {
          v22 = kSymptomDiagnosticEventResultSuccess;
          if (!v11)
            v22 = kSymptomDiagnosticEventResultFailure;
          objc_msgSend(v18, "setObject:forKeyedSubscript:", *v22, CFSTR("result"));
        }
        v23 = *(void **)(a1 + 40);
        v32 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_177;
        v30[3] = &unk_1EA3B5E70;
        v31 = v7;
        objc_msgSend(v23, "addToSession:events:payload:reply:", v31, v24, 0, v30);

      }
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
        casemanagementLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_INFO, "TCPDumpProbe is finished.", buf, 2u);
        }

        if (v10)
        {
          casemanagementLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "Canceling session due to TCPDump already being in progress", buf, 2u);
          }

          objc_msgSend(*(id *)(a1 + 40), "cancelSessionWithIdentifier:", v7);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "queue");
          v27 = objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_179;
          v28[3] = &unk_1EA3B5010;
          v28[4] = *(_QWORD *)(a1 + 40);
          v29 = v7;
          dispatch_async(v27, v28);

        }
      }

      return;
  }
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_177(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Result for adding probe status event to %{public}@: %d", (uint8_t *)&v6, 0x12u);
  }

}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_179(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endSessionIfProbesCompletedFor:", *(_QWORD *)(a1 + 40));
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Result for adding probe status event to %@: %d", (uint8_t *)&v6, 0x12u);
  }

}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_185(id *a1, int a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  int v8;

  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_186;
  block[3] = &unk_1EA3B5EC0;
  v6 = a1[5];
  v8 = a2;
  v7 = a1[6];
  dispatch_async(v4, block);

}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_186(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    +[TestProbe testProbeStatusString:](TestProbe, "testProbeStatusString:", *(unsigned int *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "tcpDumpStarted status for session %{public}@: %@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_189(id *a1, int a2)
{
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;

  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_190;
  block[3] = &unk_1EA3B5F10;
  v12 = a2;
  v8 = a1[5];
  v5 = a1[6];
  v6 = a1[4];
  v9 = v5;
  v10 = v6;
  v11 = a1[7];
  dispatch_async(v4, block);

}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_190(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 64) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "probeOutputFilePaths");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    casemanagementLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(v2, "count");
      v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v18 = v4;
      v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Ready to add %ld files generated from a probe as payload to session %{public}@", buf, 0x16u);
    }

    if (objc_msgSend(v2, "count"))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(a1 + 48);
      v15[0] = CFSTR("path");
      v15[1] = CFSTR("sandbox_ext_token_dict");
      v16[0] = v2;
      v16[1] = MEMORY[0x1E0C9AA70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_191;
      v13[3] = &unk_1EA3B5E70;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v6, "addToSession:events:payload:reply:", v7, 0, v8, v13);

    }
  }
  casemanagementLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 40);
    +[TestProbe testProbeStatusString:](TestProbe, "testProbeStatusString:", *(unsigned int *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "tcpDumpCompleted status for session %{public}@: %@", buf, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_191(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Result for adding probe output files to %{public}@: %d", (uint8_t *)&v6, 0x12u);
  }

}

- (void)cancelProbesForSession:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->activeProbes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v18 = objc_msgSend(v5, "count");
      v19 = 2114;
      v20 = v4;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "Cancelling all %lu probes for session: %{public}@", buf, 0x16u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v5, "allValues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "cancelTest:", 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)endSessionIfProbesCompletedFor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->activeProbes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = 134218242;
      v10 = objc_msgSend(v5, "count");
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Waiting for %ld requested probes to complete before ending session %{public}@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    if (v8)
    {
      v9 = 138543362;
      v10 = (uint64_t)v4;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "All requested probes completed for session %{public}@. Ready to end.", (uint8_t *)&v9, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->activeProbes, "setObject:forKeyedSubscript:", 0, v4);
    -[DiagnosticCaseManager endSessionWithIdentifier:forced:onlyIfReady:](self, "endSessionWithIdentifier:forced:onlyIfReady:", v4, 0, 1);
  }

}

- (void)remoteTriggerDeliveryUpdateEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  casemanagementLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "IDS remote trigger send message update: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSMessageIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->activeIDSMessages, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "Found session identifier %@ for IDS message identifier %@", buf, 0x16u);
    }

    -[DiagnosticCaseManager queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__DiagnosticCaseManager_remoteTriggerDeliveryUpdateEvent___block_invoke;
    v11[3] = &unk_1EA3B5DF8;
    v12 = v7;
    -[DiagnosticCaseManager addToSession:event:payload:queue:reply:](self, "addToSession:event:payload:queue:reply:", v12, v4, 0, v10, v11);

    v9 = v12;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "Could not find session identifier for IDS message identifier %{public}@ (most likely received this update after the session was closed)", buf, 0xCu);
  }

}

void __58__DiagnosticCaseManager_remoteTriggerDeliveryUpdateEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (objc_msgSend(v4, "BOOLValue"))
      v8 = "was successful";
    else
      v8 = "failed";
    v9 = 138543874;
    v10 = v7;
    v11 = 2080;
    v12 = v8;
    v13 = 2048;
    v14 = objc_msgSend(v5, "integerValue");
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Adding remote trigger event update to session %{public}@ %s. (Reason code %ld)", (uint8_t *)&v9, 0x20u);
  }

}

- (void)requestSnapshotWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  casemanagementLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_INFO, "Ready to request remotely triggered case with signature: %@", (uint8_t *)&v11, 0xCu);
  }

  -[DiagnosticCaseManager startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:](self, "startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:", v8, a4, v9, 0, 0, &__block_literal_global_193, 0.0);
}

void __67__DiagnosticCaseManager_requestSnapshotWithSignature_flags_events___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  casemanagementLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (a5)
  {
    if (v12)
    {
      v16 = 138544130;
      v17 = v8;
      v18 = 2114;
      v19 = v9;
      v20 = 1024;
      LODWORD(v21[0]) = a5;
      WORD2(v21[0]) = 2112;
      *(_QWORD *)((char *)v21 + 6) = v10;
      v13 = "RemoteTrigger: Session %{public}@ [groupID: %{public}@] was NOT accepted. (Reason code: %d) (%@)";
      v14 = v11;
      v15 = 38;
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    v16 = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2112;
    v21[0] = v10;
    v13 = "RemoteTrigger: Session %{public}@ [groupID: %{public}@] accepted. (%@)";
    v14 = v11;
    v15 = 32;
LABEL_6:
    _os_log_impl(&dword_1DBAE1000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
  }

}

- (id)responseDictWithSuccess:(BOOL)a3 sessionId:(id)a4 reasonCode:(int64_t)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, CFSTR("success"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("session"));
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("reason"));

  }
  return v10;
}

- (void)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 triggerRemote:(BOOL)a7 queue:(id)a8 reply:(id)a9
{
  _BOOL4 v10;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v10 = a7;
  v16 = a8;
  v17 = a9;
  v18 = v17;
  if (v10)
    v19 = 4;
  else
    v19 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke;
  v22[3] = &unk_1EA3B4DB0;
  v23 = v16;
  v24 = v17;
  v20 = v16;
  v21 = v18;
  -[DiagnosticCaseManager startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:](self, "startSessionWithSignature:flags:preferredTimeout:events:payload:actions:reply:", a3, v19, a5, a6, 0, v22, a4);

}

void __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int v16;

  v8 = a2;
  v9 = a3;
  v10 = v9;
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke_2;
    v12[3] = &unk_1EA3B5FA0;
    v13 = v9;
    v14 = v8;
    v16 = a5;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v12);

  }
}

void __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("groupID"));
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("session"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_DWORD *)(a1 + 56) == 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v2, CFSTR("success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("reason"));

  diagnosticErrorStringForCode(*(_DWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("reasonStr"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4)
  {
    v18 = a4;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = a4;
    objc_msgSend(v16, "arrayWithObjects:count:", &v18, 1);
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[DiagnosticCaseManager addToSession:events:payload:queue:reply:](self, "addToSession:events:payload:queue:reply:", v12, a4, v13, v14, v15, v18, v19);

}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;

  v12 = a3;
  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v13 | v14)
  {
    v18 = (void *)objc_msgSend((id)v13, "copy");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke;
    v21[3] = &unk_1EA3B4E28;
    v23 = v17;
    v22 = v15;
    -[DiagnosticCaseManager addToSession:events:payload:reply:](self, "addToSession:events:payload:reply:", v12, v18, v14, v21);

LABEL_5:
    goto LABEL_6;
  }
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_3;
    block[3] = &unk_1EA3B56B0;
    v20 = v16;
    dispatch_async(v15, block);
    v18 = v20;
    goto LABEL_5;
  }
LABEL_6:

}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  int v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_2;
    v5[3] = &unk_1EA3B5FC8;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v7[0] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_DWORD *)(a1 + 40) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  v7[2] = CFSTR("reasonStr");
  diagnosticErrorStringForCode(*(_DWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C9AAA0];
  v4[0] = CFSTR("success");
  v4[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

- (void)startSessionWithSignature:(id)a3 flags:(unint64_t)a4 preferredTimeout:(double)a5 events:(id)a6 payload:(id)a7 actions:(id)a8 reply:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  unint64_t v38;
  double v39;
  _QWORD v40[3];
  char v41;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v30 = v17;
  v21 = (void *)objc_msgSend(v17, "copy");
  v22 = (void *)objc_msgSend(v18, "copy");
  v23 = (void *)objc_msgSend(v19, "copy");
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  -[DiagnosticCaseManager queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke;
  block[3] = &unk_1EA3B6018;
  block[4] = self;
  v32 = v16;
  v33 = v21;
  v34 = v22;
  v39 = a5;
  v37 = v40;
  v38 = a4;
  v35 = v23;
  v36 = v20;
  v25 = v20;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = v16;
  dispatch_async(v24, block);

  _Block_object_dispose(v40, 8);
}

void __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double v9;
  int64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  id v38;
  id v39;
  int v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateSignatureWithBuildVariantInfoAndFlags:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "createDiagnosticCaseWithSignature:flags:events:payload:actions:", v2, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DiagnosticCaseManager symptomDiagnosticErrorForDiagnosticCaseDampeningType:](DiagnosticCaseManager, "symptomDiagnosticErrorForDiagnosticCaseDampeningType:", objc_msgSend(v3, "dampeningType"));
  if (v3)
  {
    v5 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_checkFileWritingLimits:", v3);
    objc_msgSend(v3, "setPreferredDuration:", *(double *)(a1 + 96));
    if ((int)objc_msgSend(v3, "dampeningType") > 0)
      goto LABEL_30;
    objc_msgSend(v3, "caseId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v46 = *(double *)&v7;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Starting an ABC session with identifier: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addTransactionForCaseID:", v7);
    v9 = *(double *)(a1 + 96);
    if (v9 <= 0.0)
      v10 = 100000000;
    else
      v10 = (uint64_t)(v9 * 1000000000.0);
    v11 = dispatch_time(0, v10);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_195;
    block[3] = &unk_1EA3B4BB8;
    v13 = v7;
    v42 = v13;
    v14 = v3;
    v15 = *(_QWORD *)(a1 + 32);
    v43 = v14;
    v44 = v15;
    dispatch_after(v11, v12, block);

    objc_msgSend(*(id *)(a1 + 32), "_processReportActions:session:", *(_QWORD *)(a1 + 64), v14);
    if (!objc_msgSend(*(id *)(a1 + 64), "count"))
      goto LABEL_29;
    if (!objc_msgSend(v14, "wantsRemote"))
    {
LABEL_27:
      if (objc_msgSend(*(id *)(a1 + 32), "_processProbeActions:session:", *(_QWORD *)(a1 + 64), v14, v34, v35, v36, v37))
      {
        objc_msgSend(*(id *)(a1 + 32), "startPeriodicTimer");
      }
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("idsdest"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 3600.0;
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("remotewindow"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject doubleValue](v18, "doubleValue");
        if (v19 >= 1.0)
        {
          -[NSObject doubleValue](v18, "doubleValue");
          v17 = v20;
          casemanagementLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v46 = v17;
            _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEBUG, "(Remote trigger window is %.0lf seconds)", buf, 0xCu);
          }

        }
      }
      casemanagementLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_INFO, "Ready to trigger remote cases via IDS", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v14, "signature");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_196;
      v37 = &unk_1EA3B5FF0;
      v39 = *(id *)(a1 + 72);
      v38 = v14;
      v40 = v5;
      objc_msgSend(v23, "_processRemoteIDSTriggers:validFor:signature:sessionID:reply:", v16, v24, v13, &v34, v17);

    }
    else
    {
      if (!v16)
      {
LABEL_26:

        goto LABEL_27;
      }
      casemanagementLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v46 = *(double *)&v27;
        v47 = 2112;
        v48 = v16;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_ERROR, "Found unsupported class for remote IDS destinations: %@ (%@)", buf, 0x16u);

      }
    }

    goto LABEL_26;
  }
  casemanagementLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_DEBUG, "DiagnosticCase is nil", buf, 2u);
  }

  v5 = 8;
LABEL_30:
  if (*(_QWORD *)(a1 + 72))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      objc_msgSend(v3, "signature");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("groupID"));
      v29 = objc_claimAutoreleasedReturnValue();

      casemanagementLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v46 = *(double *)&v29;
        _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_DEBUG, "Found group id %{public}@", buf, 0xCu);
      }

      v31 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v3, "caseId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, NSObject *, _QWORD, uint64_t))(v31 + 16))(v31, v33, v29, 0, v5);

LABEL_38:
      goto LABEL_39;
    }
LABEL_36:
    casemanagementLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_INFO, "Waiting for asynchronous operation to finish.", buf, 2u);
    }
    goto LABEL_38;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_36;
LABEL_39:

}

uint64_t __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_195(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "Case duration timer fired for %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "setReadyToEndSession:", 1);
  return objc_msgSend(*(id *)(a1 + 48), "endSessionIfProbesCompletedFor:", *(_QWORD *)(a1 + 32));
}

void __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "signature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    casemanagementLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Found group id %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("failure"));

    if (v9)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("IDSRemoteTrigger"));
      v10 = kSymptomDiagnosticKeyError;
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IDSRemoteTrigger"));
      v10 = kSymptomDiagnosticKeyIDSMessageIdentifier;
    }
    v11 = *v10;
    objc_msgSend(v3, "objectForKeyedSubscript:", *v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "caseId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id, _QWORD))(v13 + 16))(v13, v15, v5, v7, *(unsigned int *)(a1 + 48));

  }
}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  DiagnosticCaseManager *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DiagnosticCaseManager queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__DiagnosticCaseManager_addToSession_events_payload_reply___block_invoke;
  block[3] = &unk_1EA3B6040;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __59__DiagnosticCaseManager_addToSession_events_payload_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v12 = 138543874;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "Adding to session with identifier: %{public}@.\n\tevents: %@\n\tpayload: %@", (uint8_t *)&v12, 0x20u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
  {
    v7 = *(void **)(a1 + 56);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "addToCaseWithId:events:payload:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    result = *(_QWORD *)(a1 + 64);
    if (!result)
      return result;
    v9 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 64))
      return result;
    casemanagementLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "invalid parameters: empty or missing session identifier (%{public}@)", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  return v9();
}

- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  DiagnosticCaseManager *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DiagnosticCaseManager queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__DiagnosticCaseManager_addSignatureContentForSession_key_content_reply___block_invoke;
  block[3] = &unk_1EA3B6040;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = self;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

uint64_t __73__DiagnosticCaseManager_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v12 = 138543874;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "Updating signature of session with identifier: %{public}@. key: %@ content: %@", (uint8_t *)&v12, 0x20u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (result)
  {
    v7 = *(void **)(a1 + 56);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "addSignatureContentToCaseWithId:key:content:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    result = *(_QWORD *)(a1 + 64);
    if (!result)
      return result;
    v9 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 64))
      return result;
    casemanagementLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "invalid parameters: empty or missing session identifier (%{public}@)", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  return v9();
}

- (void)endSession:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticCaseManager cancelProbesForSession:](self, "cancelProbesForSession:", v9);
  casemanagementLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = "";
    if (v5)
      v11 = "(only if ready to end)";
    v15 = 138543618;
    v16 = v9;
    v17 = 2080;
    v18 = v11;
    _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEBUG, "Ending session with identifier: %{public}@ %s", (uint8_t *)&v15, 0x16u);
  }

  if (v6)
    v12 = 2;
  else
    v12 = 1;
  v13 = -[DiagnosticCaseManager finalizeDiagnosticCaseWithId:closureType:onlyIfReady:](self, "finalizeDiagnosticCaseWithId:closureType:onlyIfReady:", v8, v12, v5);

  if (v13)
  {
    -[NSMutableDictionary allKeysForObject:](self->activeIDSMessages, "allKeysForObject:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectsForKeys:](self->activeIDSMessages, "removeObjectsForKeys:", v14);

  }
}

- (void)endSessions:(id)a3 forced:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  DiagnosticCaseManager *v11;
  BOOL v12;

  v6 = a3;
  -[DiagnosticCaseManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__DiagnosticCaseManager_endSessions_forced___block_invoke;
  block[3] = &unk_1EA3B6068;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __44__DiagnosticCaseManager_endSessions_forced___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = CFSTR(" (forced)");
    if (!*(_BYTE *)(a1 + 48))
      v4 = &stru_1EA3B8F58;
    *(_DWORD *)buf = 134218242;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_DEBUG, "Ending %ld sessions%@", buf, 0x16u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "caseId", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endSession:forced:onlyIfReady:", v11, *(unsigned __int8 *)(a1 + 48), 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4
{
  -[DiagnosticCaseManager endSessionWithIdentifier:forced:onlyIfReady:](self, "endSessionWithIdentifier:forced:onlyIfReady:", a3, a4, 0);
}

- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5
{
  objc_class *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  BOOL v15;
  BOOL v16;

  v8 = (objc_class *)MEMORY[0x1E0CB3A28];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithUUIDString:", v9);

  -[DiagnosticCaseManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__DiagnosticCaseManager_endSessionWithIdentifier_forced_onlyIfReady___block_invoke;
  block[3] = &unk_1EA3B6090;
  block[4] = self;
  v14 = v10;
  v15 = a4;
  v16 = a5;
  v12 = v10;
  dispatch_async(v11, block);

}

uint64_t __69__DiagnosticCaseManager_endSessionWithIdentifier_forced_onlyIfReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endSession:forced:onlyIfReady:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (void)cancelSessionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DiagnosticCaseManager *v9;

  v4 = a3;
  -[DiagnosticCaseManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__DiagnosticCaseManager_cancelSessionWithIdentifier___block_invoke;
  v7[3] = &unk_1EA3B5010;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__DiagnosticCaseManager_cancelSessionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Cancelling session with identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "cancelProbesForSession:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 40);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "cancelCaseWithId:", v5);

  }
}

- (void)shutdown
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticCaseManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__DiagnosticCaseManager_shutdown__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __33__DiagnosticCaseManager_shutdown__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  int v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "hasOpenCases");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "configManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autoBugCaptureEnabled");

    v5 = *(void **)(a1 + 32);
    if (v4)
      return objc_msgSend(v5, "forceCloseDiagnosticCaseStorage");
    else
      return objc_msgSend(v5, "removeAllCases");
  }
  return result;
}

- (void)updateAverageCasesPerDay
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DiagnosticCaseManager_updateAverageCasesPerDay__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__DiagnosticCaseManager_updateAverageCasesPerDay__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_calculateAverageCasesPerDayFromDailyAggregatedStatistics");
  v3 = v2;
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 <= 0.0)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "Average cases seen per day is 0.", (uint8_t *)&v8, 2u);
    }

    v6 = 0;
  }
  else
  {
    if (v5)
    {
      v8 = 134217984;
      v9 = v3;
      _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEFAULT, "Average cases seen per day is %.4f", (uint8_t *)&v8, 0xCu);
    }

    LODWORD(v6) = vcvtpd_u64_f64(v3);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setAvgCasesPerDay:", v6);
}

- (void)resetDiagnosticCaseStorage
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticCaseManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DiagnosticCaseManager_resetDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __51__DiagnosticCaseManager_resetDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseStorage", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "removeAllCases");
}

- (void)resetAllForCustomerBuilds
{
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  -[DiagnosticCaseManager configManager](self, "configManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autoBugCaptureAvailable");

  if ((v4 & 1) == 0)
  {
    -[DiagnosticCaseManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__DiagnosticCaseManager_resetAllForCustomerBuilds__block_invoke;
    block[3] = &unk_1EA3B4960;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __50__DiagnosticCaseManager_resetAllForCustomerBuilds__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t buf[16];

  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Remove all storage and all usage except RESOURCE_NOTIFY", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("domain"), CFSTR("RESOURCE_NOTIFY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_removeAllDiagnosticCaseUsageFor:", v3);
  objc_msgSend(*(id *)(a1 + 32), "removeAllCases");

}

- (void)resetAll
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticCaseManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__DiagnosticCaseManager_resetAll__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __33__DiagnosticCaseManager_resetAll__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseUsage and DiagnosticCaseStorage", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_removeAllDiagnosticCaseUsageFor:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "removeAllCases");
}

- (void)payloadsForSignatures:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DiagnosticCaseManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[DiagnosticCaseManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke;
  block[3] = &unk_1EA3B4AC8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *, void *);
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
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
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  casemanagementLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v31 = v4;
    v32 = 2112;
    v33 = v5;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Ready to search for collected cases that match %ld signatures: %@", buf, 0x16u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke_207;
  v15 = &unk_1EA3B60B8;
  v6 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v18 = &v20;
  v7 = v2;
  v17 = v7;
  v19 = &v24;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v12);
  if (!v25[5] && !*((_BYTE *)v21 + 24))
  {
    casemanagementLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Did not find any collected cases that matched the provided signatures: %@", buf, 0xCu);
    }

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    if (objc_msgSend(v7, "count", v12, v13, v14, v15, v16))
      v11 = v7;
    else
      v11 = 0;
    (*(void (**)(uint64_t, id, uint64_t))(v10 + 16))(v10, v11, v25[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke_207(_QWORD *a1, void *a2)
{
  DiagnosticCase *v3;
  DiagnosticCase *v4;
  void *v5;
  DiagnosticCase *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  DiagnosticCase *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  DiagnosticCase *v35;
  DiagnosticCase *v36;
  DiagnosticCase *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  DiagnosticCase *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[DiagnosticCase objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (DiagnosticCase *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("subtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("detected"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticCase objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("window"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = (void *)v9;
    else
      v10 = &unk_1EA3D0198;
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v45 = (uint64_t)v5;
      v46 = 2112;
      v47 = v6;
      v48 = 2112;
      v49 = v7;
      v50 = 2112;
      v51 = v8;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "  Searching for cases matching d:%@ t:%@ st:%@ p:%@", buf, 0x2Au);
    }

    v12 = (void *)a1[4];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v12, "casesMatchingDomain:type:subtype:process:withinLast:", v5, v6, v7, v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "count"))
    {
      v32 = v10;
      v33 = v8;
      v34 = v7;
      v35 = v6;
      v36 = v4;
      v37 = v3;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      casemanagementLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(v38, "count");
        *(_DWORD *)buf = 134217984;
        v45 = v14;
        _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "  Found %ld matching cases.", buf, 0xCu);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = v38;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v21 = -[DiagnosticCase initWithCaseStorage:manager:]([DiagnosticCase alloc], "initWithCaseStorage:manager:", v20, a1[4]);
            casemanagementLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                -[DiagnosticCase attachments](v21, "attachments");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "count");
                *(_DWORD *)buf = 134218242;
                v45 = v25;
                v46 = 2112;
                v47 = v21;
                _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_DEBUG, "    Adding %ld attachments from: %@", buf, 0x16u);

              }
              v26 = (void *)a1[5];
              -[DiagnosticCase attachments](v21, "attachments");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObjectsFromArray:", v23);
            }
            else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v45 = (uint64_t)v20;
              _os_log_impl(&dword_1DBAE1000, v23, OS_LOG_TYPE_ERROR, "  Failed to allocate DiagnosticCase from DiagnosticCaseStorage: %@", buf, 0xCu);
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v17);
      }

      v4 = v36;
      v3 = v37;
      v6 = v35;
      v8 = v33;
      v7 = v34;
      v10 = v32;
    }

  }
  else
  {
    casemanagementLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = (uint64_t)v29;
      v46 = 2112;
      v47 = v3;
      _os_log_impl(&dword_1DBAE1000, v27, OS_LOG_TYPE_ERROR, "Found unexpected object (%@) of class (%@) in signature list.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1[7] + 8);
    v4 = *(DiagnosticCase **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;
  }

}

- (id)createTemporaryDiagnosticCaseStorageForUUID:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ObjectAnalytics createTemporaryEntity](self->_caseStorageAnalytics, "createTemporaryEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Create a temporary case storage entry of %s", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
  {
    objc_msgSend(v5, "setCaseID:", v4);
  }
  else
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      v10 = 136315138;
      v11 = v8;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a temporary case storage entry of %s", (uint8_t *)&v10, 0xCu);
    }

  }
  return v5;
}

- (void)promoteTemporaryCase:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  DiagnosticCaseStorageAnalytics *caseStorageAnalytics;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "caseStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "Promoting temporary case storage to permanent case storage for case %@.", (uint8_t *)&v9, 0xCu);
    }

    caseStorageAnalytics = self->_caseStorageAnalytics;
    objc_msgSend(v4, "caseStorage");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ObjectAnalytics moveTemporaryEntityToMainContext:](caseStorageAnalytics, "moveTemporaryEntityToMainContext:", v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "No temporary DiagnosticCaseStorage for case %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)countOfCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 groupCaseIDIsPresent:(BOOL)a7 withinLast:(double)a8 reply:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  double v34;
  BOOL v35;
  _QWORD v36[4];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  -[DiagnosticCaseManager queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__DiagnosticCaseManager_countOfCasesMatchingDomain_type_subtype_process_groupCaseIDIsPresent_withinLast_reply___block_invoke;
  block[3] = &unk_1EA3B60E0;
  block[4] = self;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v34 = a8;
  v35 = a7;
  v32 = v20;
  v33 = v36;
  v31 = v19;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  dispatch_async(v21, block);

  _Block_object_dispose(v36, 8);
}

uint64_t __111__DiagnosticCaseManager_countOfCasesMatchingDomain_type_subtype_process_groupCaseIDIsPresent_withinLast_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t result;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_predicatesForCasesMatchingDomain:type:subtype:process:withinLast:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 88));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("caseGroupID"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "arrayByAddingObject:", v4);
      v5 = objc_claimAutoreleasedReturnValue();

      casemanagementLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEBUG, "Adding predicate for caseGroupID being non-NULL", buf, 2u);
      }

      v3 = (void *)v5;
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "countEntitiesMatching:", v7);

  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  return result;
}

- (id)casesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7
{
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[DiagnosticCaseManager _predicatesForCasesMatchingDomain:type:subtype:process:withinLast:](self, "_predicatesForCasesMatchingDomain:type:subtype:process:withinLast:", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](self->_caseStorageAnalytics, "fetchEntitiesFreeForm:sortDesc:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    casemanagementLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 134218240;
      v15 = objc_msgSend(v11, "count");
      v16 = 2048;
      v17 = a7;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEBUG, "Found %lu matching case(s) in the past %.0lf seconds.", (uint8_t *)&v14, 0x16u);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_predicatesForCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint8_t buf[4];
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (a7 <= 0.0 && v11 == 0 && v12 == 0 && v13 == 0 && v14 == 0)
  {
    casemanagementLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_ERROR, "No matching criteria provided! Provide at least one criteria to perform a query.", buf, 2u);
    }
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7 <= 0.0)
    {
      casemanagementLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_DEBUG, "No window provided. Using default window of 24 hours.", buf, 2u);
      }

      a7 = 86400.0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a7);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("timeStamp"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v23);
    casemanagementLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v35 = a7;
      _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEBUG, "Adding predicate for window of %.0lf seconds", buf, 0xCu);
    }

    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseDomain"), v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v25);
      casemanagementLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = *(double *)&v11;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEBUG, "Adding predicate for domain %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseType"), v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v27);
      casemanagementLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = *(double *)&v12;
        _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_DEBUG, "Adding predicate for type %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseSubtype"), v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v29);
      casemanagementLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = *(double *)&v13;
        _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_DEBUG, "Adding predicate for subtype %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseDetectedProcess"), v15);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v31);
      casemanagementLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = *(double *)&v15;
        _os_log_impl(&dword_1DBAE1000, v32, OS_LOG_TYPE_DEBUG, "Adding predicate for process %@", buf, 0xCu);
      }

    }
  }

  return v20;
}

- (void)forceCloseDiagnosticCaseStorage
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticCaseManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DiagnosticCaseManager_forceCloseDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __56__DiagnosticCaseManager_forceCloseDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forceCloseDiagnosticCaseStorage");
}

- (void)_forceCloseDiagnosticCaseStorage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "Force closing all un-closed diagnostic cases.", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("caseState"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ObjectAnalytics countEntitiesMatching:](self->_caseStorageAnalytics, "countEntitiesMatching:", v6);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("caseClosedTime"), v11, CFSTR("caseState"), v12, CFSTR("caseClosureType"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[ObjectAnalytics updateEntitiesMatching:properties:](self->_caseStorageAnalytics, "updateEntitiesMatching:properties:", v6, v13);
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v17 = v14;
      v18 = 2048;
      v19 = v8;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEBUG, "Force closed %ld un-closed diagnostic case(s) out of %ld un-closed cases.", buf, 0x16u);
    }

    if (v14)
      -[DiagnosticCaseManager saveAllCases](self, "saveAllCases");

  }
}

- (BOOL)isAllowedTransientException:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("Networking"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("Performance"))
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("AirPlay")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("AirPlay Connection Stalled")));

  return v7;
}

- (void)removeCaseStorageWithID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("caseID"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ObjectAnalytics removeEntitiesMatching:](self->_caseStorageAnalytics, "removeEntitiesMatching:", v6);
}

- (void)removeAllCases
{
  int64_t v3;
  NSObject *v4;
  int64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_activeCases, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_totalCases, "removeAllObjects");
  v3 = -[DiagnosticCaseStorageAnalytics removeAllDiagnosticCaseStorages](self->_caseStorageAnalytics, "removeAllDiagnosticCaseStorages");
  casemanagementLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_INFO, "Removed %ld cases from persistent store", (uint8_t *)&v7, 0xCu);
  }

  v5 = -[DiagnosticCaseSummaryAnalytics removeAllDiagnosticCaseSummaries](self->_caseSummaryAnalytics, "removeAllDiagnosticCaseSummaries");
  casemanagementLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Removed %ld case summaries from persistent store", (uint8_t *)&v7, 0xCu);
  }

  -[DiagnosticCaseManager saveAllCases](self, "saveAllCases");
}

+ (BOOL)isString:(id)a3 inExceptionList:(id)a4
{
  return +[CaseDampeningExceptions isString:inExceptionList:](CaseDampeningExceptions, "isString:inExceptionList:", a3, a4);
}

+ (BOOL)isException:(id)a3 containedInString:(id)a4
{
  return +[CaseDampeningExceptions isException:containedInString:](CaseDampeningExceptions, "isException:containedInString:", a3, a4);
}

- (DiagnosticLiaison)liaison
{
  return self->_liaison;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (DiagnosticStatisticsManager)statsManager
{
  return self->_statsManager;
}

- (NSMutableDictionary)reportGenerators
{
  return self->_reportGenerators;
}

- (NSMutableArray)activeCases
{
  return self->_activeCases;
}

- (NSMutableArray)totalCases
{
  return self->_totalCases;
}

- (DiagnosticCaseManagerStorageDelegate)storageDelegate
{
  return (DiagnosticCaseManagerStorageDelegate *)objc_loadWeakRetained((id *)&self->_storageDelegate);
}

- (void)setStorageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_storageDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageDelegate);
  objc_storeStrong((id *)&self->_totalCases, 0);
  objc_storeStrong((id *)&self->_activeCases, 0);
  objc_storeStrong((id *)&self->_reportGenerators, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->activeIDSMessages, 0);
  objc_storeStrong((id *)&self->activeProbes, 0);
  objc_storeStrong((id *)&self->sessionsWaitingToEnd, 0);
  objc_storeStrong((id *)&self->periodicTimer, 0);
  objc_storeStrong((id *)&self->_liaison, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_statsManager, 0);
  objc_storeStrong((id *)&self->_caseSummaryAnalytics, 0);
  objc_storeStrong((id *)&self->_caseStorageAnalytics, 0);
  objc_storeStrong((id *)&self->_requestedReportGenerators, 0);
  objc_storeStrong((id *)&self->_reportOutlets, 0);
  objc_storeStrong((id *)&self->_pendingStatisticsUpdateCases, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

@end
