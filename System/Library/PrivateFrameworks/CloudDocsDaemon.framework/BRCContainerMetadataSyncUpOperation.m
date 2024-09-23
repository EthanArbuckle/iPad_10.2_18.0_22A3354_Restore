@implementation BRCContainerMetadataSyncUpOperation

- (BRCContainerMetadataSyncUpOperation)initWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCContainerMetadataSyncUpOperation *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "syncContextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSyncContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BRCContainerMetadataSyncUpOperation;
  v7 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v9, sel_initWithName_syncContext_sessionContext_, CFSTR("sync-up/container-metadata"), v6, v4);

  return v7;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync-up/container-metadata", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)performAfterSavingRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  id v26;
  BRCContainerMetadataSyncUpOperation *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v4 = a3;
  -[BRCSyncContext session](self->super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxRecordCountInClientZoneModifyRecordsOperation");
  objc_msgSend(v5, "containerScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerMetadataPersistedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v9, "allocateNextRequestID");
  objc_msgSend(v5, "_containerMetadataRecordsToSaveWithBatchSize:requestID:", v7, v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    self->_shouldPerformAnotherBatch = objc_msgSend(v10, "count") >= v7;
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BRCContainerMetadataSyncUpOperation performAfterSavingRecords:].cold.2(v11, (uint64_t)v12, v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v11, 0);
    objc_msgSend(v14, "setSavePolicy:", 0);
    objc_msgSend(v14, "setAtomic:", 1);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "setConfiguration:", v15);

    v16 = *MEMORY[0x1E0D10DA0];
    objc_msgSend(v14, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceApplicationBundleIdentifier:", v16);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v30, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setClientChangeTokenData:", v18);

    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke;
    v28[3] = &unk_1E8761BA8;
    v29 = v4;
    objc_msgSend(v14, "setModifyRecordsCompletionBlock:", v28);
    objc_msgSend(v5, "clientTruthWorkloop");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_12;
    block[3] = &unk_1E875D448;
    v25 = v5;
    v26 = v14;
    v27 = self;
    v21 = v14;
    dispatch_async(v20, block);

  }
  else
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[BRCContainerMetadataSyncUpOperation performAfterSavingRecords:].cold.1((uint64_t)v22, v23);

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v6, "count");
    v14 = CFSTR("success");
    v15 = 134218498;
    v16 = v13;
    if (v7)
      v14 = v7;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] completed sync up for %lu records: %@%@", (uint8_t *)&v15, 0x20u);
  }

  brc_bread_crumbs();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v6, "count");
    v15 = 134218242;
    v16 = v12;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] saved %lu containers metadata in the cloud%@", (uint8_t *)&v15, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_12(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2;
  v5[3] = &unk_1E875D470;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "scheduleFlushWithCheckpoint:whenFlushed:", 0, v5);

}

uint64_t __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "addSubOperation:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "brc_isResetError") & 1) != 0
    || !objc_msgSend(v4, "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCContainerMetadataSyncUpOperation;
    v5 = -[_BRCOperation shouldRetryForError:](&v7, sel_shouldRetryForError_, v4);
  }

  return v5;
}

- (void)main
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] ┏%llx Sync: syncing up container metadata%@", v1);
  OUTLINED_FUNCTION_2();
}

uint64_t __43__BRCContainerMetadataSyncUpOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->_shouldPerformAnotherBatch;
}

- (void)performAfterSavingRecords:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] no records to save%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)performAfterSavingRecords:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v4, "[DEBUG] preparing to send %lu records%@", v5);
}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v0, (uint64_t)v0, "[DEBUG] adding sub-operation to save the records: %@%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
