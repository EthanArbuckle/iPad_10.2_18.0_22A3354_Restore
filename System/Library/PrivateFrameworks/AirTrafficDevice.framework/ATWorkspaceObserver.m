@implementation ATWorkspaceObserver

- (void)startObserving
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- start observing", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)stopObserving
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- stop observing", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (ATWorkspaceObserverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  LSApplicationWorkspaceObserverProtocol *delegate;
  _DWORD v8[2];
  __int16 v9;
  LSApplicationWorkspaceObserverProtocol *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Prioritization Changed [Ordered: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  -[LSApplicationWorkspaceObserverProtocol applicationInstallsDidPrioritize:](self->_delegate, "applicationInstallsDidPrioritize:", v4);
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  LSApplicationWorkspaceObserverProtocol *delegate;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  LSApplicationWorkspaceObserverProtocol *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "count");
    v10 = objc_msgSend(v7, "count");
    delegate = self->_delegate;
    v12[0] = 67109634;
    v12[1] = v9;
    v13 = 1024;
    v14 = v10;
    v15 = 2114;
    v16 = delegate;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Prioritization notification arrived [Ordered: %d] [Paused: %d] [Delegate: %{public}@]", (uint8_t *)v12, 0x18u);
  }

  -[LSApplicationWorkspaceObserverProtocol applicationInstallsArePrioritized:arePaused:](self->_delegate, "applicationInstallsArePrioritized:arePaused:", v6, v7);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  LSApplicationWorkspaceObserverProtocol *delegate;
  _DWORD v8[2];
  __int16 v9;
  LSApplicationWorkspaceObserverProtocol *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs canceled [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  -[LSApplicationWorkspaceObserverProtocol applicationInstallsDidCancel:](self->_delegate, "applicationInstallsDidCancel:", v4);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  LSApplicationWorkspaceObserverProtocol *delegate;
  _DWORD v8[2];
  __int16 v9;
  LSApplicationWorkspaceObserverProtocol *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs completed [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  -[LSApplicationWorkspaceObserverProtocol applicationsDidInstall:](self->_delegate, "applicationsDidInstall:", v4);
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  LSApplicationWorkspaceObserverProtocol *delegate;
  _DWORD v8[2];
  __int16 v9;
  LSApplicationWorkspaceObserverProtocol *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "count");
    delegate = self->_delegate;
    v8[0] = 67109378;
    v8[1] = v6;
    v9 = 2114;
    v10 = delegate;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "ATWorkspaceObserver -- Installs changed [Applications: %d] [Delegate: %{public}@]", (uint8_t *)v8, 0x12u);
  }

  -[LSApplicationWorkspaceObserverProtocol applicationInstallsDidChange:](self->_delegate, "applicationInstallsDidChange:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
