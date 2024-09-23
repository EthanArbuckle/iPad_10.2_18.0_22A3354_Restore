@implementation BRCFetchRecordsWrapperOperation

- (BRCFetchRecordsWrapperOperation)initWithCKFetchRecordsOperation:(id)a3 group:(id)a4 serverZone:(id)a5 isUserWaiting:(BOOL)a6 sessionContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BRCFetchRecordsWrapperOperation *v22;
  _BOOL4 v24;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v24 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v12;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_INFO, "[INFO] Request to wrap and run CKFetchRecordsOperation: [%@]%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("fetch-records-wrapper/"), "stringByAppendingString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "metadataSyncContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)BRCFetchRecordsWrapperOperation;
  v22 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v25, sel_initWithName_syncContext_sessionContext_, v20, v21, v15);

  if (v22)
  {
    -[_BRCOperation setGroup:](v22, "setGroup:", v13);
    -[_BRCOperation setNonDiscretionary:](v22, "setNonDiscretionary:", v24);
    objc_storeStrong((id *)&v22->_serverZone, a5);
    objc_storeStrong((id *)&v22->_fetchRecordsOperation, a3);
  }

  return v22;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "sync/fetch-records-wrapper", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  NSObject *v4;
  CKFetchRecordsOperation *fetchRecordsOperation;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  CKFetchRecordsOperation *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    fetchRecordsOperation = self->_fetchRecordsOperation;
    *(_DWORD *)buf = 138412546;
    v15 = fetchRecordsOperation;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_INFO, "[INFO] Running CKFetchRecordsOperation: [%@]%@", buf, 0x16u);
  }

  -[CKFetchRecordsOperation fetchRecordsCompletionBlock](self->_fetchRecordsOperation, "fetchRecordsCompletionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__BRCFetchRecordsWrapperOperation_main__block_invoke;
  v11 = &unk_1E87684C0;
  objc_copyWeak(&v13, (id *)buf);
  v7 = v6;
  v12 = v7;
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](self->_fetchRecordsOperation, "setFetchRecordsCompletionBlock:", &v8);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", self->_fetchRecordsOperation, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __39__BRCFetchRecordsWrapperOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = WeakRetained[64];
    v11 = 138412802;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_INFO, "[INFO] finished running CKFetchRecordsOperation [%@] with error [%@]%@", (uint8_t *)&v11, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRecordsOperation, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

@end
