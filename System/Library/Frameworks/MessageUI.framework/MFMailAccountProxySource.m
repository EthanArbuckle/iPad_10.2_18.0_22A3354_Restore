@implementation MFMailAccountProxySource

void __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  MFMailAccountProxy *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[MFMailAccountProxy log](MFMailAccountProxy, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke_cold_1(v8, buf, v7);
    }
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v13 = [MFMailAccountProxy alloc];
          v14 = -[MFMailAccountProxy _initWithProperties:](v13, "_initWithProperties:", v12, (_QWORD)v15);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __58___MFMailAccountProxySource__registerForNotifications_nts__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetAccountsChanged:", 1);

}

void __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "error retrieving account information: %{public}@", buf, 0xCu);

}

@end
