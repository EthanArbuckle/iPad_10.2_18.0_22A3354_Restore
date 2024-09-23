@implementation FCFileCoordinatedTodayPrivateDataTransactionQueue

void __87__FCFileCoordinatedTodayPrivateDataTransactionQueue_dequeueTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fc_dequeueTransactions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)initWithFileURL:(id)a3
{
  id v4;
  FCFileCoordinatedTodayPrivateDataTransactionQueue *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  FCFileCoordinatedDictionary *v9;
  FCFileCoordinatedDictionary *fileCoordinatedDictionary;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "fileURL");
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue initWithFileURL:]";
    v16 = 2080;
    v17 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    v18 = 1024;
    v19 = 31;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v13.receiver = self;
  v13.super_class = (Class)FCFileCoordinatedTodayPrivateDataTransactionQueue;
  v5 = -[FCFileCoordinatedTodayPrivateDataTransactionQueue init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[FCFileCoordinatedDictionary initWithFileURL:allowedClasses:]([FCFileCoordinatedDictionary alloc], "initWithFileURL:allowedClasses:", v4, v8);
    fileCoordinatedDictionary = v5->_fileCoordinatedDictionary;
    v5->_fileCoordinatedDictionary = v9;

  }
  return v5;
}

- (void)dequeueTransactionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue dequeueTransactionsWithCompletion:]";
    v12 = 2080;
    v13 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    v14 = 1024;
    v15 = 67;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayPrivateDataTransactionQueue fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__FCFileCoordinatedTodayPrivateDataTransactionQueue_dequeueTransactionsWithCompletion___block_invoke;
  v8[3] = &unk_1E463CA30;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "writeWithAccessor:completion:", v8, 0);

}

- (FCFileCoordinatedDictionary)fileCoordinatedDictionary
{
  return self->_fileCoordinatedDictionary;
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue init]";
    v9 = 2080;
    v10 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFileCoordinatedTodayPrivateDataTransactionQueue init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)enqueueTransaction:(id)a3 withMaxTransactionCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transaction");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue enqueueTransaction:withMaxTransactionCount:completion:]";
    v18 = 2080;
    v19 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    v20 = 1024;
    v21 = 46;
    v22 = 2114;
    v23 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayPrivateDataTransactionQueue fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__FCFileCoordinatedTodayPrivateDataTransactionQueue_enqueueTransaction_withMaxTransactionCount_completion___block_invoke;
  v13[3] = &unk_1E464B7B0;
  v14 = v8;
  v15 = a4;
  v11 = v8;
  objc_msgSend(v10, "writeWithAccessor:completion:", v13, v9);

}

uint64_t __107__FCFileCoordinatedTodayPrivateDataTransactionQueue_enqueueTransaction_withMaxTransactionCount_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_enqueueTransaction:withMaxTransactionCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)peekAtTransactionsSyncWithAccessor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFileCoordinatedTodayPrivateDataTransactionQueue peekAtTransactionsSyncWithAccessor:]";
    v14 = 2080;
    v15 = "FCFileCoordinatedTodayPrivateDataTransactionQueue.m";
    v16 = 1024;
    v17 = 57;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFileCoordinatedTodayPrivateDataTransactionQueue fileCoordinatedDictionary](self, "fileCoordinatedDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__FCFileCoordinatedTodayPrivateDataTransactionQueue_peekAtTransactionsSyncWithAccessor___block_invoke;
  v10[3] = &unk_1E463CA08;
  v11 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "readSyncWithAccessor:", v10);

  return v7;
}

void __88__FCFileCoordinatedTodayPrivateDataTransactionQueue_peekAtTransactionsSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fc_transactions");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = v3;
  else
    v4 = MEMORY[0x1E0C9AA60];
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);

}

- (void)setFileCoordinatedDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCoordinatedDictionary, 0);
}

@end
