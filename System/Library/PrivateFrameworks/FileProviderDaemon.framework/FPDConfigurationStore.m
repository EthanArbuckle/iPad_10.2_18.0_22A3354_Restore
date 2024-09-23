@implementation FPDConfigurationStore

+ (id)defaultStore
{
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_0);
  return (id)defaultStore;
}

- (int)maxLookupDepth
{
  return self->_maxLookupDepth;
}

- (int)sqlDatabaseOnNextDurableFlushTriggerThreshold
{
  return self->_sqlDatabaseOnNextDurableFlushTriggerThreshold;
}

void __37__FPDConfigurationStore_defaultStore__block_invoke()
{
  FPDConfigurationStore *v0;
  void *v1;

  v0 = objc_alloc_init(FPDConfigurationStore);
  v1 = (void *)defaultStore;
  defaultStore = (uint64_t)v0;

}

+ (void)__test_only_reloadDefaultStore
{
  FPDConfigurationStore *v2;
  void *v3;

  v2 = objc_alloc_init(FPDConfigurationStore);
  v3 = (void *)defaultStore;
  defaultStore = (uint64_t)v2;

}

- (FPDConfigurationStore)init
{
  FPDConfigurationStore *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  const __CFString **p_trialTreatment;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int pendingSetMaxItemCount;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  unint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  unint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  NSMutableDictionary *temporaryFileTrackingDelayPerVariant;
  NSObject *v50;
  time_t v51;
  time_t v53;
  FPDConfigurationStore *v54;
  NSMutableDictionary *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  uint8_t v62[128];
  uint8_t buf[4];
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)FPDConfigurationStore;
  v2 = -[FPDConfigurationStore init](&v61, sel_init);
  if (v2)
  {
    v53 = time(0);
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 224);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_trialClientLoadedSuccessfully = v3 != 0;
    objc_msgSend(v3, "experimentIdentifiersWithNamespaceName:", CFSTR("COREOS_FPFS_CONFIG"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "treatmentId");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_1E8C795D8;
    p_trialTreatment = (const __CFString **)&v2->_trialTreatment;
    objc_storeStrong((id *)&v2->_trialTreatment, v7);

    objc_msgSend(v3, "experimentIdentifiersWithNamespaceName:", CFSTR("COREOS_FPFS_CONFIG"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "experimentId");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1E8C795D8;
    v13 = v3;
    objc_storeStrong((id *)&v2->_trialExperiment, v12);

    v2->_trialTestFactor = fp_configuration_store_int_check(v3, CFSTR("testFactor"), 1, 1u, 0x7FFFFFFF);
    if (v2->_trialClientLoadedSuccessfully)
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Trial Client not loaded", buf, 2u);
      }

    }
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *p_trialTreatment;
      if (!*p_trialTreatment)
        v16 = CFSTR("none");
      *(_DWORD *)buf = 138412290;
      v64 = v16;
      _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_INFO, "[INFO] Trial Treatment is %@", buf, 0xCu);
    }

    v2->_hardConcurrentOperationLimit = fp_configuration_store_int_check(v3, CFSTR("hardConcurrentOperationLimit"), 128, 1u, 0x7FFFFFFF);
    v2->_softConcurrentOperationLimit = fp_configuration_store_int_check(v3, CFSTR("softConcurrentOperationLimit"), 32, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentContentUpdateLimit = fp_configuration_store_int_check(v3, CFSTR("hardConcurrentContentUpdateLimit"), 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentContentUpdateLimit = fp_configuration_store_int_check(v3, CFSTR("softConcurrentContentUpdateLimit"), 16, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentMetadataOnlyUpdateLimit = fp_configuration_store_int_check(v3, CFSTR("hardConcurrentMetadataOnlyUpdateLimit"), 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentMetadataOnlyUpdateLimit = fp_configuration_store_int_check(v3, CFSTR("softConcurrentMetadataOnlyUpdateLimit"), 16, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentProvideFileLimit = fp_configuration_store_int_check(v3, CFSTR("hardConcurrentProvideFileLimit"), 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentProvideFileLimit = fp_configuration_store_int_check(v3, CFSTR("softConcurrentProvideFileLimit"), 16, 1u, 0x7FFFFFFF);
    objc_msgSend(v3, "levelForFactor:withNamespaceName:", CFSTR("userExtensionPackageAllowlist"), CFSTR("COREOS_FPFS_CONFIG"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(";"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (void *)v19;
    else
      v21 = (void *)*MEMORY[0x1E0CAAE60];
    objc_storeStrong((id *)&v2->_userPackageExtensions, v21);

    v2->_hasUpcallExecutionTimeLimits = fp_configuration_store_BOOL_check(v13, (uint64_t)CFSTR("hasUpcallExecutionTimeLimits"), 1);
    v2->_upcallExecutionTimeLimitBase = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("upcallExecutionTimeLimitBase"), 180.0, 0.0, 86400.0);
    v2->_upcallExecutionTimeLimitPerKiloByte = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("upcallExecutionTimeLimitPerKiloByte"), 0.005, 0.0, 3600.0);
    v2->_upcallExcutionTimeLimitStaleProgress = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("upcallExcutionTimeLimitStaleProgress"), 600.0, 0.0, 86400.0);
    v2->_upcallExcutionTimeLimitProgressCancellationGracePeriod = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("upcallExcutionTimeLimitProgressCancellationGracePeriod"), 15.0, 0.0, 3600.0);
    v2->_errorGenerationUpdateSeconds = fp_configuration_store_int_check(v13, CFSTR("errorGenerationUpdateSeconds"), 30, 1u, 600);
    v2->_lowPrioritySignalProviderChangesIntervalSeconds = fp_configuration_store_int_check(v13, CFSTR("lowPrioritySignalProviderChangesIntervalSeconds"), 2, 1u, 60);
    v2->_vfsDirectoryListerLimit = fp_configuration_store_int_check(v13, CFSTR("vfsDirectoryListerLimit"), 200, 1u, 1000);
    v2->_maxFSEventQueueSize = fp_configuration_store_int_check(v13, CFSTR("maxFSEventQueueSize"), 1024, 0x80u, 10240);
    v2->_fseventProcessBatchSize = fp_configuration_store_int_check(v13, CFSTR("fseventProcessBatchSize"), 64, 8u, 256);
    v2->_fseventsAggregationDelay = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("fseventsAggregationDelay"), 0.2, 0.0, 3600.0);
    v2->_maxLookupDepth = fp_configuration_store_int_check(v13, CFSTR("maxLookupDepth"), 5, 1u, 9);
    v2->_sqlDatabaseFlushIntervalMilliseconds = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseFlushIntervalMilliseconds"), 100, 0xAu, 1000);
    v2->_sqlDatabaseVacuumBatchSize = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseVacuumBatchSize"), 10485760, 0x100000u, 104857600);
    v2->_sqlDatabaseBatchDelay = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("sqlDatabaseBatchDelay"), 0.5, 0.05, 5.0);
    v2->_sqlDatabaseBatchChangeCount = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseBatchChangeCount"), 100000, 0x2710u, 1000000);
    v2->_sqlDatabaseOnNextDurableFlushTriggerThreshold = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseOnNextDurableFlushTriggerThreshold"), 220, 0x64u, 800);
    v2->_sqlDatabaseStatementCacheMaxCount = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseStatementCacheMaxCount"), 300, 0xAu, 0x7FFFFFFF);
    v2->_sqlDatabaseStatementWarnTime = fp_configuration_store_int_check(v13, CFSTR("sqlDatabaseStatementWarnTime"), 100000, 0, 0x7FFFFFFF);
    v2->_pendingSetMaxItemCount = fp_configuration_store_int_check(v13, CFSTR("pendingSetMaxItemCount"), 1000, 2u, 0x7FFFFFFF);
    v2->_pendingSetRefreshInterval = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("pendingSetRefreshInterval"), 1.0, 1.0, 86400.0);
    pendingSetMaxItemCount = v2->_pendingSetMaxItemCount;
    if (pendingSetMaxItemCount >= 0)
      v23 = v2->_pendingSetMaxItemCount;
    else
      v23 = pendingSetMaxItemCount + 1;
    v2->_pendingSetRegatherThreshold = fp_configuration_store_int_check(v13, CFSTR("pendingSetRegatherThreshold"), (v23 >> 1), v23 >> 1, pendingSetMaxItemCount);
    v2->_perfTelemetrySubSamplingPercentage = fp_configuration_store_int_check(v13, CFSTR("perfTelemetrySubSamplingPercentage"), 80, 0, 100);
    objc_msgSend(v13, "levelForFactor:withNamespaceName:", CFSTR("dynamicErrorSampleRatePerProvider"), CFSTR("COREOS_FPFS_CONFIG"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(";"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = &unk_1E8C95D48;
    objc_storeStrong((id *)&v2->_dynamicErrorSampleRatePerProvider, v28);

    v2->_maxFPCKDatabaseChecks = fp_configuration_store_int_check(v13, CFSTR("maxFPCKDatabaseChecks"), 60000, 0, 0x7FFFFFFF);
    v2->_maxFPCKDatabaseChecksDiagnostic = fp_configuration_store_int_check(v13, CFSTR("maxFPCKDatabaseChecksDiagnostic"), 2000, 0, 0x7FFFFFFF);
    v2->_avoidNilErrorItemsForDetailedPayload = fp_configuration_store_BOOL_check(v13, (uint64_t)CFSTR("avoidNilErrorItemsForDetailedPayload"), 0);
    v2->_hangingDownloadCancellationPromptEnabled = 0;
    v2->_minimumDiskSpaceRequiredToBeGreedy = fp_configuration_store_int64_check(v13, CFSTR("diskSpaceMinimumRequiredToBeGreedy_ios"), 0x80000000, 1, 0x7FFFFFFFFFFFFFFFLL);
    v2->_relativeDiskSpaceRequiredToBeGreedy = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("diskSpaceRequiredToBeGreedyRelative_ios"), 0.1, 0.0, 1.0);
    v2->_diskSpaceRequiredToReturnToGreedyState = fp_configuration_store_int64_check(v13, CFSTR("diskSpaceRequiredToReturnToGreedyState_ios"), 0x200000000, 1, 0x7FFFFFFFFFFFFFFFLL);
    v2->_relativeDiskSpaceRequiredToReturnToGreedyState = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("diskSpaceRequiredToReturnToGreedyStateRelative_ios"), 0.15, 0.0, 1.0);
    v2->_diskSpaceCheckInterval = fp_configuration_store_int_check(v13, CFSTR("diskSpaceCheckInterval"), 30, 0, 0x7FFFFFFF);
    v2->_minTimeBetweenSpeculativeDownloadsPurgeSession = fp_configuration_store_int_check(v13, CFSTR("minTimeBetweenSpeculativeDownloadsPurgeSession_ios"), 1200, 0, 0x7FFFFFFF);
    v54 = v2;
    v2->_minTimeToPreventDownloadsAfterReturningToGreedyState = fp_configuration_store_int_check(v13, CFSTR("minTimeToPreventDownloadsAfterReturningToGreedyState_ios"), 86400, 0, 0x7FFFFFFF);
    v55 = (NSMutableDictionary *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v29 = objc_msgSend(&unk_1E8C95D60, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v58;
      v32 = CFSTR("temporaryFileTrackingDelay.%@");
      v33 = 0x1E0CB3000uLL;
      v34 = CFSTR("COREOS_FPFS_CONFIG");
      do
      {
        v35 = 0;
        v56 = v30;
        do
        {
          if (*(_QWORD *)v58 != v31)
            objc_enumerationMutation(&unk_1E8C95D60);
          v36 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v35);
          objc_msgSend(*(id *)(v33 + 2368), "stringWithFormat:", v32, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "levelForFactor:withNamespaceName:", v37, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38 && objc_msgSend(v38, "levelOneOfCase") == 15)
          {
            v40 = v31;
            v41 = v34;
            v42 = v32;
            v43 = v33;
            v44 = v13;
            objc_msgSend(v39, "doubleValue");
            v46 = v45;
            v47 = 1.0;
            if (v46 > 1.0)
            {
              v47 = v46;
              if (v46 >= 86400.0)
                v47 = 86400.0;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v48, v36);

            v13 = v44;
            v33 = v43;
            v32 = v42;
            v34 = v41;
            v31 = v40;
            v30 = v56;
          }

          ++v35;
        }
        while (v30 != v35);
        v30 = objc_msgSend(&unk_1E8C95D60, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v30);
    }
    v2 = v54;
    temporaryFileTrackingDelayPerVariant = v54->_temporaryFileTrackingDelayPerVariant;
    v54->_temporaryFileTrackingDelayPerVariant = v55;

    v54->_defaultTemporaryFileTrackingDelay = fp_configuration_store_double_check(v13, (uint64_t)CFSTR("temporaryFileTrackingDelay"), 60.0, 1.0, 86400.0);
    v54->_speculativeSetRecencyDays = fp_configuration_store_int_check(v13, CFSTR("speculativeSetRecencyDays"), 90, 0, 1000);
    v54->_speculativeSetPageSize = fp_configuration_store_int_check(v13, CFSTR("speculativeSetPageSize"), 100, 1u, 1000);
    v54->_speculativeSetRefreshInterval = fp_configuration_store_int64_check(v13, CFSTR("speculativeSetRefreshInterval"), 60, 0, 86400);
    v54->_speculativeSetMaximumDownloadsAllowed = fp_configuration_store_int_check(v13, CFSTR("speculativeSetMaximumDownloadsAllowed"), 1000000, 0, 1000000);
    v54->_speculativeSetMaximumDownloadsRefreshInterval = fp_configuration_store_int64_check(v13, CFSTR("speculativeSetMaximumDownloadsRefreshInterval"), 86400, 0, 2592000);
    v54->_speculativeSetCancelDownloadDelay = fp_configuration_store_int64_check(v13, CFSTR("speculativeSetCancelDownloadDelay"), 10, 0, 86400);
    v54->_speculativeRefreshInheritedContentPolicyMaximumJobs = fp_configuration_store_int64_check(v13, CFSTR("_speculativeRefreshInheritedContentPolicyMaximumJobs"), 10, 1, 100);
    fp_current_or_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = time(0);
      *(_DWORD *)buf = 134217984;
      v64 = (const __CFString *)(v53 - v51);
      _os_log_impl(&dword_1CF55F000, v50, OS_LOG_TYPE_INFO, "[INFO] Configuration store startup completed in %lu seconds", buf, 0xCu);
    }

  }
  return v2;
}

- (double)temporaryFileTrackingDelayForVariant:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double defaultTemporaryFileTrackingDelay;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryFileTrackingDelayPerVariant, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    defaultTemporaryFileTrackingDelay = v6;
  }
  else
  {
    defaultTemporaryFileTrackingDelay = self->_defaultTemporaryFileTrackingDelay;
  }

  return defaultTemporaryFileTrackingDelay;
}

- (NSString)trialTreatment
{
  return self->_trialTreatment;
}

- (NSString)trialExperiment
{
  return self->_trialExperiment;
}

- (BOOL)trialClientLoadedSuccessfully
{
  return self->_trialClientLoadedSuccessfully;
}

- (int)trialTestFactor
{
  return self->_trialTestFactor;
}

- (int)hardConcurrentOperationLimit
{
  return self->_hardConcurrentOperationLimit;
}

- (int)softConcurrentOperationLimit
{
  return self->_softConcurrentOperationLimit;
}

- (int)hardConcurrentContentUpdateLimit
{
  return self->_hardConcurrentContentUpdateLimit;
}

- (int)softConcurrentContentUpdateLimit
{
  return self->_softConcurrentContentUpdateLimit;
}

- (int)hardConcurrentMetadataOnlyUpdateLimit
{
  return self->_hardConcurrentMetadataOnlyUpdateLimit;
}

- (int)softConcurrentMetadataOnlyUpdateLimit
{
  return self->_softConcurrentMetadataOnlyUpdateLimit;
}

- (int)hardConcurrentProvideFileLimit
{
  return self->_hardConcurrentProvideFileLimit;
}

- (int)softConcurrentProvideFileLimit
{
  return self->_softConcurrentProvideFileLimit;
}

- (NSArray)userPackageExtensions
{
  return self->_userPackageExtensions;
}

- (BOOL)hasUpcallExecutionTimeLimits
{
  return self->_hasUpcallExecutionTimeLimits;
}

- (double)upcallExecutionTimeLimitBase
{
  return self->_upcallExecutionTimeLimitBase;
}

- (double)upcallExecutionTimeLimitPerKiloByte
{
  return self->_upcallExecutionTimeLimitPerKiloByte;
}

- (double)upcallExcutionTimeLimitStaleProgress
{
  return self->_upcallExcutionTimeLimitStaleProgress;
}

- (double)upcallExcutionTimeLimitProgressCancellationGracePeriod
{
  return self->_upcallExcutionTimeLimitProgressCancellationGracePeriod;
}

- (int)errorGenerationUpdateSeconds
{
  return self->_errorGenerationUpdateSeconds;
}

- (int)lowPrioritySignalProviderChangesIntervalSeconds
{
  return self->_lowPrioritySignalProviderChangesIntervalSeconds;
}

- (int)vfsDirectoryListerLimit
{
  return self->_vfsDirectoryListerLimit;
}

- (int)maxFSEventQueueSize
{
  return self->_maxFSEventQueueSize;
}

- (int)fseventProcessBatchSize
{
  return self->_fseventProcessBatchSize;
}

- (double)fseventsAggregationDelay
{
  return self->_fseventsAggregationDelay;
}

- (int)sqlDatabaseFlushIntervalMilliseconds
{
  return self->_sqlDatabaseFlushIntervalMilliseconds;
}

- (int)sqlDatabaseVacuumBatchSize
{
  return self->_sqlDatabaseVacuumBatchSize;
}

- (double)sqlDatabaseBatchDelay
{
  return self->_sqlDatabaseBatchDelay;
}

- (int)sqlDatabaseBatchChangeCount
{
  return self->_sqlDatabaseBatchChangeCount;
}

- (int)sqlDatabaseStatementCacheMaxCount
{
  return self->_sqlDatabaseStatementCacheMaxCount;
}

- (int)sqlDatabaseStatementWarnTime
{
  return self->_sqlDatabaseStatementWarnTime;
}

- (int)pendingSetMaxItemCount
{
  return self->_pendingSetMaxItemCount;
}

- (double)pendingSetRefreshInterval
{
  return self->_pendingSetRefreshInterval;
}

- (int)pendingSetRegatherThreshold
{
  return self->_pendingSetRegatherThreshold;
}

- (int)perfTelemetrySubSamplingPercentage
{
  return self->_perfTelemetrySubSamplingPercentage;
}

- (NSArray)dynamicErrorSampleRatePerProvider
{
  return self->_dynamicErrorSampleRatePerProvider;
}

- (BOOL)hangingDownloadCancellationPromptEnabled
{
  return self->_hangingDownloadCancellationPromptEnabled;
}

- (int)maxFPCKDatabaseChecks
{
  return self->_maxFPCKDatabaseChecks;
}

- (int)maxFPCKDatabaseChecksDiagnostic
{
  return self->_maxFPCKDatabaseChecksDiagnostic;
}

- (BOOL)avoidNilErrorItemsForDetailedPayload
{
  return self->_avoidNilErrorItemsForDetailedPayload;
}

- (int64_t)minimumDiskSpaceRequiredToBeGreedy
{
  return self->_minimumDiskSpaceRequiredToBeGreedy;
}

- (double)relativeDiskSpaceRequiredToBeGreedy
{
  return self->_relativeDiskSpaceRequiredToBeGreedy;
}

- (int64_t)diskSpaceRequiredToReturnToGreedyState
{
  return self->_diskSpaceRequiredToReturnToGreedyState;
}

- (double)relativeDiskSpaceRequiredToReturnToGreedyState
{
  return self->_relativeDiskSpaceRequiredToReturnToGreedyState;
}

- (int)diskSpaceCheckInterval
{
  return self->_diskSpaceCheckInterval;
}

- (int)minTimeBetweenSpeculativeDownloadsPurgeSession
{
  return self->_minTimeBetweenSpeculativeDownloadsPurgeSession;
}

- (int)minTimeToPreventDownloadsAfterReturningToGreedyState
{
  return self->_minTimeToPreventDownloadsAfterReturningToGreedyState;
}

- (int)speculativeSetRecencyDays
{
  return self->_speculativeSetRecencyDays;
}

- (int)speculativeSetPageSize
{
  return self->_speculativeSetPageSize;
}

- (int64_t)speculativeSetRefreshInterval
{
  return self->_speculativeSetRefreshInterval;
}

- (int)speculativeSetMaximumDownloadsAllowed
{
  return self->_speculativeSetMaximumDownloadsAllowed;
}

- (int64_t)speculativeSetMaximumDownloadsRefreshInterval
{
  return self->_speculativeSetMaximumDownloadsRefreshInterval;
}

- (int64_t)speculativeSetCancelDownloadDelay
{
  return self->_speculativeSetCancelDownloadDelay;
}

- (int64_t)speculativeRefreshInheritedContentPolicyMaximumJobs
{
  return self->_speculativeRefreshInheritedContentPolicyMaximumJobs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicErrorSampleRatePerProvider, 0);
  objc_storeStrong((id *)&self->_userPackageExtensions, 0);
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_trialTreatment, 0);
  objc_storeStrong((id *)&self->_temporaryFileTrackingDelayPerVariant, 0);
}

@end
