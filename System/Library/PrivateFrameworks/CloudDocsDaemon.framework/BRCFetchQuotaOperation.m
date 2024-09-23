@implementation BRCFetchQuotaOperation

- (BRCFetchQuotaOperation)initWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCFetchQuotaOperation *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "syncContextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSyncContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)BRCFetchQuotaOperation;
  v7 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v9, sel_initWithName_syncContext_sessionContext_, CFSTR("fetch-quota"), v6, v4);

  if (v7)
    -[_BRCOperation setNonDiscretionary:](v7, "setNonDiscretionary:", 1);
  return v7;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  id v3;
  _QWORD v4[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C94E70]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__BRCFetchQuotaOperation_main__block_invoke;
  v4[3] = &unk_1E8764348;
  v4[4] = self;
  objc_msgSend(v3, "setFetchUserQuotaCompletionBlock:", v4);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v3);

}

void __30__BRCFetchQuotaOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218498;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched quota %llu - %@%@", (uint8_t *)&v10, 0x20u);
  }

  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v8, "completedWithResult:error:", 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completedWithResult:error:", v9, 0);

  }
}

@end
