@implementation _ML3MultiUserDaemonAccountChangeOperation

- (_ML3MultiUserDaemonAccountChangeOperation)initWithInitialDSID:(id)a3 finalDSID:(id)a4 accountChangeObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ML3MultiUserDaemonAccountChangeOperation *v11;
  uint64_t v12;
  NSString *initialDSID;
  uint64_t v14;
  NSString *finalDSID;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_ML3MultiUserDaemonAccountChangeOperation;
  v11 = -[MSVAsyncOperation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    initialDSID = v11->_initialDSID;
    v11->_initialDSID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    finalDSID = v11->_finalDSID;
    v11->_finalDSID = (NSString *)v14;

    objc_storeStrong((id *)&v11->_accountChangeObserver, a5);
  }

  return v11;
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  char v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  _ML3MultiUserDaemonAccountChangeOperation *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserDaemonAccountChangeOperation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Missing delegate - unable to perform operation", buf, 0xCu);
    }

    -[MSVAsyncOperation finish](self, "finish");
  }
  v19 = 0;
  v5 = objc_msgSend(v3, "shouldExecuteAccountChangeOperation:reason:", self, &v19);
  v6 = v19;
  v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      -[_ML3MultiUserDaemonAccountChangeOperation initialDSID](self, "initialDSID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ML3MultiUserDaemonAccountChangeOperation finalDSID](self, "finalDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2114;
      v23 = v9;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting account change operation from %{public}@ to %{public}@", buf, 0x20u);

    }
    v11 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[_ML3MultiUserDaemonAccountChangeOperation accountChangeObserver](self, "accountChangeObserver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ - Active account changed - Performing dabase path change with observer %{public}@", buf, 0x16u);

    }
    -[_ML3MultiUserDaemonAccountChangeOperation finalDSID](self, "finalDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "databasePathForDSID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "accountChangeOperationWillStartPerformingDatabasePathChange:newDatabasePath:", self, v14);
    -[_ML3MultiUserDaemonAccountChangeOperation accountChangeObserver](self, "accountChangeObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52___ML3MultiUserDaemonAccountChangeOperation_execute__block_invoke;
    v17[3] = &unk_1E5B65B40;
    v17[4] = self;
    v18 = v14;
    v16 = v14;
    objc_msgSend(v15, "performDatabasePathChange:completion:", v16, v17);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - No account change operation to perform - reason=%{public}@", buf, 0x16u);
    }

    -[MSVAsyncOperation finish](self, "finish");
  }

}

- (NSString)initialDSID
{
  return self->_initialDSID;
}

- (NSString)finalDSID
{
  return self->_finalDSID;
}

- (_ML3MultiUserDaemonAccountChangeOperationDelegate)delegate
{
  return (_ML3MultiUserDaemonAccountChangeOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finalDSID, 0);
  objc_storeStrong((id *)&self->_initialDSID, 0);
}

@end
