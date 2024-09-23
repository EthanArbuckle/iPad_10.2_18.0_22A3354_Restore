@implementation FCWritablePrivateDataStorage

- (FCWritablePrivateDataStorage)init
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
    v8 = "-[FCWritablePrivateDataStorage init]";
    v9 = 2080;
    v10 = "FCWritablePrivateDataStorage.m";
    v11 = 1024;
    v12 = 24;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCWritablePrivateDataStorage init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCWritablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4
{
  id v7;
  id v8;
  FCWritablePrivateDataStorage *v9;
  FCWritablePrivateDataStorage *v10;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "dropbox");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCWritablePrivateDataStorage initWithDropbox:transactionQueue:]";
    v17 = 2080;
    v18 = "FCWritablePrivateDataStorage.m";
    v19 = 1024;
    v20 = 29;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "transactionQueue");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCWritablePrivateDataStorage initWithDropbox:transactionQueue:]";
    v17 = 2080;
    v18 = "FCWritablePrivateDataStorage.m";
    v19 = 1024;
    v20 = 30;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCWritablePrivateDataStorage;
  v9 = -[FCWritablePrivateDataStorage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dropbox, a3);
    objc_storeStrong((id *)&v10->_transactionQueue, a4);
  }

  return v10;
}

- (void)writeSeenHistoryItems:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
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
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "historyItems");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCWritablePrivateDataStorage writeSeenHistoryItems:withCompletion:]";
    v18 = 2080;
    v19 = "FCWritablePrivateDataStorage.m";
    v20 = 1024;
    v21 = 44;
    v22 = 2114;
    v23 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)objc_opt_new();
  +[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:](FCFileCoordinatedTodayDropboxTransaction, "transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCWritablePrivateDataStorage dropbox](self, "dropbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "todayPrivateDataAccessor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__FCWritablePrivateDataStorage_writeSeenHistoryItems_withCompletion___block_invoke;
  v14[3] = &unk_1E4644630;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v10, "depositWithAccessor:completion:", v11, v14);

}

uint64_t __69__FCWritablePrivateDataStorage_writeSeenHistoryItems_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)writeReadHistoryItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  FCTodayMarkAsReadTransaction *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  FCTodayMarkAsReadTransaction *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "historyItem");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCWritablePrivateDataStorage writeReadHistoryItem:withCompletion:]";
    v20 = 2080;
    v21 = "FCWritablePrivateDataStorage.m";
    v22 = 1024;
    v23 = 54;
    v24 = 2114;
    v25 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = [FCTodayMarkAsReadTransaction alloc];
  objc_msgSend(v6, "articleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "maxVersionRead");
  objc_msgSend(v6, "lastVisitedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCTodayMarkAsReadTransaction initWithArticleID:articleVersion:readDate:](v8, "initWithArticleID:articleVersion:readDate:", v9, v10, v11);

  -[FCWritablePrivateDataStorage transactionQueue](self, "transactionQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__FCWritablePrivateDataStorage_writeReadHistoryItem_withCompletion___block_invoke;
  v16[3] = &unk_1E4644630;
  v17 = v7;
  v14 = v7;
  objc_msgSend(v13, "enqueueTransaction:withMaxTransactionCount:completion:", v12, 100, v16);

}

uint64_t __68__FCWritablePrivateDataStorage_writeReadHistoryItem_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (FCFileCoordinatedTodayDropbox)dropbox
{
  return self->_dropbox;
}

- (void)setDropbox:(id)a3
{
  objc_storeStrong((id *)&self->_dropbox, a3);
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_dropbox, 0);
}

@end
