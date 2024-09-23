@implementation MTCompanionSyncSession

- (MTCompanionSyncSession)initWithSession:(id)a3 delegate:(id)a4
{
  return -[MTCompanionSyncSession initWithSession:request:delegate:](self, "initWithSession:request:delegate:", a3, 0, a4);
}

- (MTCompanionSyncSession)initWithSession:(id)a3 request:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  NSArray *v11;
  MTCompanionSyncSession *v12;
  MTCompanionSyncSession *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *processedChanges;
  NSObject *v17;
  id WeakRetained;
  uint64_t v19;
  NSArray *pendingChanges;
  NSObject *v21;
  NSArray *v22;
  objc_super v24;
  uint8_t buf[4];
  MTCompanionSyncSession *v26;
  __int16 v27;
  NSArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (NSArray *)a5;
  v24.receiver = self;
  v24.super_class = (Class)MTCompanionSyncSession;
  v12 = -[MTCompanionSyncSession init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    v14 = (void *)objc_opt_new();
    -[SYSession setSerializer:](v13->_session, "setSerializer:", v14);

    -[SYSession setDelegate:](v13->_session, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_request, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_lastIndex = 0;
    v15 = objc_opt_new();
    processedChanges = v13->_processedChanges;
    v13->_processedChanges = (NSMutableArray *)v15;

    MTLogForCategory(6);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with delegate %{public}@", buf, 0x16u);
    }

    if (objc_msgSend(v9, "isSending"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
      objc_msgSend(WeakRetained, "pendingChanges");
      v19 = objc_claimAutoreleasedReturnValue();
      pendingChanges = v13->_pendingChanges;
      v13->_pendingChanges = (NSArray *)v19;

      MTLogForCategory(6);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v13->_pendingChanges;
        *(_DWORD *)buf = 138543618;
        v26 = v13;
        v27 = 2114;
        v28 = v22;
        _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ will enqueue changes %{public}@", buf, 0x16u);
      }

    }
  }

  return v13;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t (**v6)(id, void *);
  NSObject *v7;
  unint64_t lastIndex;
  __int128 v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSUInteger v14;
  NSObject *v15;
  _BOOL4 v16;
  unsigned int v17;
  NSUInteger v18;
  __int128 v20;
  uint8_t buf[4];
  MTCompanionSyncSession *v22;
  __int16 v23;
  NSUInteger v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a4;
  MTLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ ready to enqueue changes", buf, 0xCu);
  }

  lastIndex = self->_lastIndex;
  if (lastIndex < -[NSArray count](self->_pendingChanges, "count"))
  {
    *(_QWORD *)&v9 = 138543618;
    v20 = v9;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_pendingChanges, "objectAtIndexedSubscript:", lastIndex, v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6[2](v6, v10);
      MTLogForCategory(6);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (!v11)
        break;
      if (v13)
      {
        *(_DWORD *)buf = v20;
        v22 = self;
        v23 = 2114;
        v24 = (NSUInteger)v10;
        _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueued %{public}@", buf, 0x16u);
      }

      -[NSMutableArray addObject:](self->_processedChanges, "addObject:", v10);
      ++lastIndex;

      if (lastIndex >= -[NSArray count](self->_pendingChanges, "count"))
        goto LABEL_13;
    }
    if (v13)
    {
      *(_DWORD *)buf = v20;
      v22 = self;
      v23 = 2114;
      v24 = (NSUInteger)v10;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped enqueing at %{public}@", buf, 0x16u);
    }

  }
LABEL_13:
  self->_lastIndex = lastIndex;
  v14 = -[NSArray count](self->_pendingChanges, "count");
  MTLogForCategory(6);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (lastIndex >= v14)
  {
    if (v16)
    {
      v18 = -[NSArray count](self->_pendingChanges, "count");
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2048;
      v24 = v18;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueued all %lu changes", buf, 0x16u);
    }
    v17 = 2;
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ continuing session...", buf, 0xCu);
    }
    v17 = 1;
  }

  return v17;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id WeakRetained;
  NSObject *v18;
  uint64_t v19;
  void (**v20)(id, uint64_t, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  MTCompanionSyncSession *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20 = (void (**)(id, uint64_t, _QWORD))a5;
  MTLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2048;
    v29 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_19AC4E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ has %lu changes to apply", buf, 0x16u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE3E2530))
        {
          v15 = v14;
          MTLogForCategory(6);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v27 = self;
            v28 = 2114;
            v29 = (uint64_t)v15;
            _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ applying %{public}@", buf, 0x16u);
          }

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "applyChange:", v15);

          -[NSMutableArray addObject:](self->_processedChanges, "addObject:", v15);
        }
        else
        {
          MTLogForCategory(6);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v27 = self;
            v28 = 2114;
            v29 = (uint64_t)v14;
            _os_log_error_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_ERROR, "%{public}@ skipping invalid change %{public}@", buf, 0x16u);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  MTLogForCategory(6);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = -[NSMutableArray count](self->_processedChanges, "count");
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2048;
    v29 = v19;
    _os_log_impl(&dword_19AC4E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ finished applying %lu changes", buf, 0x16u);
  }

  v20[2](v20, 1, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  int v9;
  MTCompanionSyncSession *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MTLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ session %{public}@ wants to reset data store", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "resetDataStore");

  return 1;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  MTCompanionSyncSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  WeakRetained = a3;
  MTLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MTCompanionSyncSession syncSession:didEndWithError:].cold.1((uint64_t)self, (uint64_t)v6, v9);

    objc_msgSend(WeakRetained, "isSending");
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = self;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ completed succesfully", (uint8_t *)&v11, 0xCu);
  }

  v10 = objc_msgSend(WeakRetained, "isSending");
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pendingChangesSent:", self->_processedChanges);
LABEL_9:

  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTCompanionSyncSession sessionDescription](self, "sessionDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ >"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)sessionDescription
{
  void *v2;
  int v3;

  -[MTCompanionSyncSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSending");

  if (v3)
    return CFSTR("SEND");
  else
    return CFSTR("RECV");
}

- (NSMutableArray)processedChanges
{
  return self->_processedChanges;
}

- (void)setProcessedChanges:(id)a3
{
  objc_storeStrong((id *)&self->_processedChanges, a3);
}

- (MTCompanionSyncRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (SYSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSArray)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChanges, a3);
}

- (unint64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setLastIndex:(unint64_t)a3
{
  self->_lastIndex = a3;
}

- (MTSyncServiceDelegate)delegate
{
  return (MTSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_processedChanges, 0);
}

- (void)syncSession:(os_log_t)log didEndWithError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_19AC4E000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
