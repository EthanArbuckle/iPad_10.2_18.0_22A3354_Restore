@implementation CHProtectedAppProvider

- (CHProtectedAppProvider)init
{
  CHProtectedAppProvider *v2;
  uint64_t v3;
  CHProcessHandle *currentProcessHandle;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHProtectedAppProvider;
  v2 = -[CHProtectedAppProvider init](&v8, sel_init);
  if (v2)
  {
    +[CHProcessHandle processHandle](CHProcessHandle, "processHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    currentProcessHandle = v2->_currentProcessHandle;
    v2->_currentProcessHandle = (CHProcessHandle *)v3;

    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "addMonitor:subjectMask:", v2, 1);

  }
  return v2;
}

- (id)protectedApplicationBundleIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9688], "hiddenApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0CF9688], "lockedApplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v14), "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v12);
  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = v4;
    v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_1B3FA4000, v16, OS_LOG_TYPE_DEFAULT, "CH protectedBundleID hiddenApplications %{public}@ lockedApplications %{public}@", buf, 0x16u);
  }

  -[CHProtectedAppProvider currentProcessHandle](self, "currentProcessHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CHProtectedAppProvider currentProcessHandle](self, "currentProcessHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v20);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CHProtectedAppProvider allowedProtectedAppBundleIDs](self, "allowedProtectedAppBundleIDs", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(v3, "removeObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v25++));
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v23);
  }

  v26 = (void *)objc_msgSend(v3, "copy");
  return v26;
}

- (id)predicateExcludingProtectedApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHProtectedAppProvider protectedApplicationBundleIDs](self, "protectedApplicationBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    objc_msgSend(v6, "addObject:", v4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          +[CHRecentCall predicateForCallsWithServiceProvider:](CHRecentCall, "predicateForCallsWithServiceProvider:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "addObject:", v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v16;
  }
  else
  {
    v14 = v4;
  }

  return v14;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v4;

  -[CHProtectedAppProvider delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protectedAppsChanged");

}

- (CHProtectedAppProviderDelegate)delegate
{
  return (CHProtectedAppProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSSet)allowedProtectedAppBundleIDs
{
  return self->allowedProtectedAppBundleIDs;
}

- (void)setAllowedProtectedAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CHProcessHandle)currentProcessHandle
{
  return self->_currentProcessHandle;
}

- (void)setCurrentProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_currentProcessHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProcessHandle, 0);
  objc_storeStrong((id *)&self->allowedProtectedAppBundleIDs, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
