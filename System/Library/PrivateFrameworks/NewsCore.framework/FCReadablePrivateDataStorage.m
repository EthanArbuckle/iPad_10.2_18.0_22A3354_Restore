@implementation FCReadablePrivateDataStorage

- (FCReadablePrivateDataStorage)init
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
    v8 = "-[FCReadablePrivateDataStorage init]";
    v9 = 2080;
    v10 = "FCReadablePrivateDataStorage.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCReadablePrivateDataStorage init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCReadablePrivateDataStorage)initWithDropbox:(id)a3 transactionQueue:(id)a4
{
  id v7;
  id v8;
  FCReadablePrivateDataStorage *v9;
  FCReadablePrivateDataStorage *v10;
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
    v16 = "-[FCReadablePrivateDataStorage initWithDropbox:transactionQueue:]";
    v17 = 2080;
    v18 = "FCReadablePrivateDataStorage.m";
    v19 = 1024;
    v20 = 31;
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
    v16 = "-[FCReadablePrivateDataStorage initWithDropbox:transactionQueue:]";
    v17 = 2080;
    v18 = "FCReadablePrivateDataStorage.m";
    v19 = 1024;
    v20 = 32;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCReadablePrivateDataStorage;
  v9 = -[FCReadablePrivateDataStorage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dropbox, a3);
    objc_storeStrong((id *)&v10->_transactionQueue, a4);
  }

  return v10;
}

- (void)readPrivateDataSyncWithAccessor:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t v25[128];
  _BYTE buf[24];
  __int128 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "accessor");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCReadablePrivateDataStorage readPrivateDataSyncWithAccessor:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCReadablePrivateDataStorage.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v27) = 46;
    WORD2(v27) = 2114;
    *(_QWORD *)((char *)&v27 + 6) = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v27 = __Block_byref_object_copy__7;
  *((_QWORD *)&v27 + 1) = __Block_byref_object_dispose__7;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  -[FCReadablePrivateDataStorage dropbox](self, "dropbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke;
  v18[3] = &unk_1E463BCC0;
  v18[4] = buf;
  objc_msgSend(v5, "peekSyncWithAccessor:", v18);

  -[FCReadablePrivateDataStorage transactionQueue](self, "transactionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke_2;
  v17[3] = &unk_1E463BCE8;
  v17[4] = &v19;
  objc_msgSend(v7, "peekAtTransactionsSyncWithAccessor:", v17);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (id)v20[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "performWithTodayPrivateData:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v25, 16);
    }
    while (v9);
  }

  v4[2](v4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(buf, 8);
}

void __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __64__FCReadablePrivateDataStorage_readPrivateDataSyncWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

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
