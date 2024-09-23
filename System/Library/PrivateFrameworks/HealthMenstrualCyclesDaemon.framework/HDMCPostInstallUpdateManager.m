@implementation HDMCPostInstallUpdateManager

- (HDMCPostInstallUpdateManager)initWithProfileExtension:(id)a3
{
  id v4;
  HDMCPostInstallUpdateManager *v5;
  HDMCPostInstallUpdateManager *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMCPostInstallUpdateManager;
  v5 = -[HDMCPostInstallUpdateManager init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profileExtension, v4);
    objc_msgSend(v4, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerDaemonReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "postInstallUpdateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerUpdateTaskHandler:queue:", self, 0);

}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  BOOL v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  v14 = 0;
  v6 = -[HDMCPostInstallUpdateManager _updateDeviceScopedStorageWithError:](self, "_updateDeviceScopedStorageWithError:", &v14);
  v7 = v14;
  v8 = v7;
  if (v6)
  {
    v13 = v7;
    v9 = -[HDMCPostInstallUpdateManager _triggerInitialAnalysisWithError:](self, "_triggerInitialAnalysisWithError:", &v13);
    v10 = v13;

    if (v9)
    {
      v11 = 1;
      v12 = 0;
    }
    else
    {
      v11 = 0;
      v12 = v10;
    }
    ((void (**)(id, uint64_t, id))v5)[2](v5, v11, v12);
    v8 = v10;
  }
  else
  {
    ((void (**)(id, uint64_t, id))v5)[2](v5, 0, v7);
  }

}

- (BOOL)_triggerInitialAnalysisWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing due to post install update task", (uint8_t *)&v12, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  objc_msgSend(WeakRetained, "analysisManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyzeWithError:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10 != 0;
}

- (BOOL)_updateDeviceScopedStorageWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating Device-Scoped Storage due to post install update task", (uint8_t *)&v12, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  objc_msgSend(WeakRetained, "deviceScopedStorageManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "updateLocalDeviceValuesNowWithError:", a3);

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profileExtension);
}

@end
