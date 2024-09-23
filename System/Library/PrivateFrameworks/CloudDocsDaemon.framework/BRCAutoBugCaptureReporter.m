@implementation BRCAutoBugCaptureReporter

+ (id)sharedABCReporter
{
  if (sharedABCReporter_onceToken != -1)
    dispatch_once(&sharedABCReporter_onceToken, &__block_literal_global_12);
  return (id)sharedABCReporter_reporter;
}

void __46__BRCAutoBugCaptureReporter_sharedABCReporter__block_invoke()
{
  BRCAutoBugCaptureReporter *v0;
  void *v1;

  v0 = objc_alloc_init(BRCAutoBugCaptureReporter);
  v1 = (void *)sharedABCReporter_reporter;
  sharedABCReporter_reporter = (uint64_t)v0;

}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5 waitForCompletion:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__onceToken != -1)
    dispatch_once(&captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
  objc_sync_enter(v13);
  objc_msgSend((id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "longLongValue");
    v17 = brc_interval_to_nsec();
    if (v17 + v16 < brc_current_date_nsec())
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413314;
        v29 = v9;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v11;
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v18;
        _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Not sending recently rejected ABC report with signature: type = %@, subtype = %@, subtype context = %@, rejected time = %@%@", buf, 0x34u);
      }

      objc_sync_exit(v13);
      goto LABEL_14;
    }
    objc_msgSend((id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle, "removeObjectForKey:", v12);
  }

  objc_sync_exit(v13);
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v20;
    _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Sending ABC report with signature: type = %@, subtype = %@, subtype context = %@%@", buf, 0x2Au);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  objc_msgSend(v13, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("iCloudDrive"), v9, v10, v11, CFSTR("bird"), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_11;
  v25[3] = &unk_1E875F8E0;
  v26 = v12;
  v24 = v23;
  v27 = v24;
  objc_msgSend(v13, "snapshotWithSignature:duration:events:payload:actions:reply:", v22, 0, 0, 0, v25, 15.0);
  if (v6)
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

LABEL_14:
}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  BRCLRUDictionary *v4;
  void *v5;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "autoBugCaptureReporterThrottlePeriod");
  captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottlePeriod = v1;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autoBugCaptureReporterThrottleCapacity");

  v4 = -[BRCLRUDictionary initWithMaximumCapacity:]([BRCLRUDictionary alloc], "initWithMaximumCapacity:", v3);
  v5 = (void *)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
  captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle = (uint64_t)v4;

}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_11_cold_1((uint64_t)v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", brc_current_date_nsec());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0090]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0098]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138413314;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ABC report got rejected - error code = %@, description = %@ adding throttle (%@, %@)%@", (uint8_t *)&v13, 0x34u);

    }
    v7 = (id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle;
    objc_sync_enter(v7);
    objc_msgSend((id)captureLogsForOperationType_ofSubtype_withContext_waitForCompletion__reporterOperationRejectedThrottle, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
    objc_sync_exit(v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 withContext:(id)a5
{
  -[BRCAutoBugCaptureReporter captureLogsForOperationType:ofSubtype:withContext:waitForCompletion:](self, "captureLogsForOperationType:ofSubtype:withContext:waitForCompletion:", a3, a4, a5, 0);
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5
{
  -[BRCAutoBugCaptureReporter captureLogsForOperationType:ofSubtype:forError:waitForCompletion:](self, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", a3, a4, a5, 0);
}

- (void)captureLogsForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5 waitForCompletion:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a6;
  v15 = a3;
  v10 = a4;
  objc_msgSend(a5, "brc_telemetryReportableErrorWithRecordName:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:](self, "_shouldIgnoreReportForOperationType:ofSubtype:forError:", v15, v10, v11))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%ld"), v13, objc_msgSend(v11, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCAutoBugCaptureReporter captureLogsForOperationType:ofSubtype:withContext:waitForCompletion:](self, "captureLogsForOperationType:ofSubtype:withContext:waitForCompletion:", v15, v10, v14, v6);
  }

}

- (BOOL)_shouldIgnoreReportForOperationType:(id)a3 ofSubtype:(id)a4 forError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char *v16;
  NSObject *v17;
  BOOL v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("SyncHealth"))
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("SyncUp")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("SyncDown"))
    || (objc_msgSend(v9, "domain"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C947D8]),
        v10,
        !v11))
  {
LABEL_9:
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SyncHealth"))
      && objc_msgSend(v8, "isEqualToString:", CFSTR("SyncDown"))
      && objc_msgSend(v9, "brc_isCloudKitErrorZoneMigrated"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "ignoreCKCZMigrationAlreadyDoneErrorForABC"))
      {
        brc_bread_crumbs();
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:].cold.2(v9, v16);
        goto LABEL_22;
      }

    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SyncHealth"))
      && objc_msgSend(v8, "isEqualToString:", CFSTR("Upload"))
      && objc_msgSend(v9, "brc_isCloudKitMMCSItemNotAvailable"))
    {
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "ignoreCKMMCSItemNotAvailableErrorForABC"))
      {
        brc_bread_crumbs();
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:].cold.3(v9, v16);
        goto LABEL_22;
      }

    }
    v18 = 0;
    goto LABEL_25;
  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ignoredCKErrorsForABC");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (!v15)
  {

    goto LABEL_9;
  }
  brc_bread_crumbs();
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[BRCAutoBugCaptureReporter _shouldIgnoreReportForOperationType:ofSubtype:forError:].cold.1(v9, v16);
LABEL_22:

  v18 = 1;
LABEL_25:

  return v18;
}

void __97__BRCAutoBugCaptureReporter_captureLogsForOperationType_ofSubtype_withContext_waitForCompletion___block_invoke_11_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Sent ABC report successfully%@", (uint8_t *)&v2, 0xCu);
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:(const char *)a2 forError:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_3(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] Ignoring expected CK error %ld%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:(const char *)a2 forError:.cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_3(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] Ignoring expected CK 'cross-zone migration already done' error %ld%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)_shouldIgnoreReportForOperationType:(void *)a1 ofSubtype:(const char *)a2 forError:.cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_3(a1, a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] Ignoring CloudKit open error (Operation not permitted) protected class error %ld%@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

@end
