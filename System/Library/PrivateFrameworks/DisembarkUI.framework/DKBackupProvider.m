@implementation DKBackupProvider

- (DKBackupProvider)initWithAccount:(id)a3
{
  id v5;
  DKBackupProvider *v6;
  DKBackupProvider *v7;
  id v8;
  void *v9;
  uint64_t v10;
  MBManager *manager;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DKBackupProvider;
  v6 = -[DKBackupProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = objc_alloc(MEMORY[0x24BE66C40]);
    objc_msgSend(v5, "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithDelegate:eventQueue:personaIdentifier:", 0, 0, v9);
    manager = v7->_manager;
    v7->_manager = (MBManager *)v10;

  }
  return v7;
}

- (BOOL)isBackupEnabled
{
  void *v2;
  char v3;

  -[DKBackupProvider manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBackupEnabled");

  return v3;
}

- (BOOL)isBackingUp
{
  void *v2;
  void *v3;

  -[DKBackupProvider manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backupState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "state") - 1 < 3;
  return (char)v2;
}

- (BOOL)isRestoring
{
  void *v2;
  void *v3;

  -[DKBackupProvider manager](self, "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "state") - 1 < 3;
  return (char)v2;
}

- (BOOL)isManualBackupOnCellularAllowed
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  -[DKBackupProvider manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKBackupProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "isManualBackupOnCellularAllowedWithAccount:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    _DKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DKBackupProvider isManualBackupOnCellularAllowed].cold.1(v6, v7);

  }
  return v5;
}

- (void)startBackupWithExpensiveCellularAllowed:(BOOL)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v6 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_24F20E338;
  block[4] = self;
  v11 = v8;
  v32 = v11;
  v12 = v9;
  v33 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v13 = -[DKBackupProvider isBackingUp](self, "isBackingUp");
  _DKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      -[DKBackupProvider account](self, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v16;
      _os_log_impl(&dword_229405000, v14, OS_LOG_TYPE_DEFAULT, "Skipping starting backup; backup already running for %@...",
        buf,
        0xCu);

    }
  }
  else
  {
    if (v15)
    {
      -[DKBackupProvider account](self, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v17;
      _os_log_impl(&dword_229405000, v14, OS_LOG_TYPE_DEFAULT, "Starting backup for %@...", buf, 0xCu);

    }
    v14 = objc_alloc_init(MEMORY[0x24BE66C60]);
    if (-[DKBackupProvider isManualBackupOnCellularAllowed](self, "isManualBackupOnCellularAllowed"))
    {
      if (v6)
        objc_msgSend(MEMORY[0x24BE66C38], "expensiveCellularAccess");
      else
        objc_msgSend(MEMORY[0x24BE66C38], "inexpensiveCellularAccess");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setCellularAccess:](v14, "setCellularAccess:", v18);

    }
    -[DKBackupProvider manager](self, "manager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

    -[DKBackupProvider manager](self, "manager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v21 = objc_msgSend(v20, "startBackupWithOptions:error:", v14, &v30);
    v22 = v30;

    if ((v21 & 1) == 0)
    {
      _DKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if ((_DKIsInternalInstall() & 1) != 0)
        {
          v25 = 0;
          v26 = v22;
        }
        else if (v22)
        {
          v27 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v22, "domain");
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v21, objc_msgSend(v22, "code"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 1;
        }
        else
        {
          v25 = 0;
          v26 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v35 = v26;
        _os_log_error_impl(&dword_229405000, v23, OS_LOG_TYPE_ERROR, "Failed to start backup: %{public}@", buf, 0xCu);
        if (v25)
        {

        }
      }

      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke_5;
      v28[3] = &unk_24F20E428;
      v28[4] = self;
      v29 = v22;
      v24 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], v28);

    }
  }

}

uint64_t __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProgressHandler:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 48));
}

uint64_t __94__DKBackupProvider_startBackupWithExpensiveCellularAllowed_progressHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "setProgressHandler:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
}

- (void)cancel
{
  id v2;

  -[DKBackupProvider manager](self, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  id v8;
  id v9;
  _QWORD block[6];
  float v11;

  v8 = a3;
  -[DKBackupProvider manager](self, "manager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__DKBackupProvider_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke;
    block[3] = &unk_24F20E400;
    v11 = a4;
    block[4] = self;
    block[5] = a5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __69__DKBackupProvider_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD, float);

  objc_msgSend(*(id *)(a1 + 32), "progressHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "progressHandler");
    v3 = (void (**)(id, _QWORD, float))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40), *(float *)(a1 + 48));

  }
}

- (void)managerDidFinishBackup:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  -[DKBackupProvider manager](self, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _DKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229405000, v6, OS_LOG_TYPE_DEFAULT, "Backup did finish!", buf, 2u);
    }

    -[DKBackupProvider manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__DKBackupProvider_managerDidFinishBackup___block_invoke;
    block[3] = &unk_24F20DE18;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __43__DKBackupProvider_managerDidFinishBackup___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[DKBackupProvider manager](self, "manager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    _DKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      if ((_DKIsInternalInstall() & 1) != 0)
      {
        v10 = 0;
        v11 = v6;
      }
      else if (v6)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "domain");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v8, objc_msgSend(v6, "code"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_error_impl(&dword_229405000, v9, OS_LOG_TYPE_ERROR, "Backup did fail: %{public}@", buf, 0xCu);
      if (v10)
      {

      }
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__DKBackupProvider_manager_didFailBackupWithError___block_invoke;
    block[3] = &unk_24F20E428;
    block[4] = self;
    v14 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __51__DKBackupProvider_manager_didFailBackupWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  -[DKBackupProvider manager](self, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _DKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DKBackupProvider managerDidLoseConnectionToService:].cold.1(v6);

    -[DKBackupProvider manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__DKBackupProvider_managerDidLoseConnectionToService___block_invoke;
    block[3] = &unk_24F20DE18;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __54__DKBackupProvider_managerDidLoseConnectionToService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 18, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3);

  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)isManualBackupOnCellularAllowed
{
  void *v2;
  int v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = _DKIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_DWORD *)buf = 138543362;
  v8 = a1;
  _os_log_error_impl(&dword_229405000, a2, OS_LOG_TYPE_ERROR, "Failed to check if backup is supported on cellular: %{public}@", buf, 0xCu);
  if (!v5)
  {

  }
}

- (void)managerDidLoseConnectionToService:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229405000, log, OS_LOG_TYPE_ERROR, "Lost connection to backup!", v1, 2u);
}

@end
