@implementation APRequestHandler

+ (void)addRequestWithURL:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = (id)objc_opt_class();
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    v13 = v21;
    _os_log_impl(&dword_2195F6000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Add request. URL: %{public}@, account: %{public}@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__APRequestHandler_addRequestWithURL_account_completion___block_invoke;
  v17[3] = &unk_24DB1AFC0;
  objc_copyWeak(&v19, (id *)buf);
  v16 = v10;
  v18 = v16;
  objc_msgSend(v15, "addRequestWithURL:account:completion:", v8, v9, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __57__APRequestHandler_addRequestWithURL_account_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v3;
      v8 = v15;
      v9 = "%{public}@: Add request failure. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v8 = v15;
      v9 = "%{public}@: Add request success";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

+ (void)presentApprovalSheetWithRequestIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v6;
    v10 = v18;
    _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Present Approval Sheet. Request identifier: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__APRequestHandler_presentApprovalSheetWithRequestIdentifier_completion___block_invoke;
  v14[3] = &unk_24DB1AFC0;
  objc_copyWeak(&v16, (id *)buf);
  v13 = v7;
  v15 = v13;
  objc_msgSend(v12, "presentApprovalSheetWithRequestIdentifier:completion:", v6, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __73__APRequestHandler_presentApprovalSheetWithRequestIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v3;
      v8 = v15;
      v9 = "%{public}@: Present approval sheet failure. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v8 = v15;
      v9 = "%{public}@: Present approval sheet success";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

+ (void)getRequestWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v6;
    v10 = v18;
    _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Get Request Data. Request identifier: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__APRequestHandler_getRequestWithIdentifier_completion___block_invoke;
  v14[3] = &unk_24DB1AFE8;
  objc_copyWeak(&v16, (id *)buf);
  v13 = v7;
  v15 = v13;
  objc_msgSend(v12, "getRequestWithIdentifier:completion:", v6, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __56__APRequestHandler_getRequestWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v11 = v18;
      v12 = "%{public}@: Get Request Data failure. Error: %{public}@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else
  {
    if (!v8)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v11 = v18;
      v12 = "%{public}@: Get Request Data Success";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 12;
      goto LABEL_10;
    }
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);

}

+ (void)getMatchingRequestsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v6;
    v10 = v18;
    _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Get Matching Requests. Request identifier: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__APRequestHandler_getMatchingRequestsWithIdentifier_completion___block_invoke;
  v14[3] = &unk_24DB1B010;
  objc_copyWeak(&v16, (id *)buf);
  v13 = v7;
  v15 = v13;
  objc_msgSend(v12, "getMatchingRequestsWithIdentifier:completion:", v6, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __65__APRequestHandler_getMatchingRequestsWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v6;
      v11 = v18;
      v12 = "%{public}@: Get Matching Requests failure. Error: %{public}@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v13, v14, v12, (uint8_t *)&v17, v15);

    }
  }
  else
  {
    if (!v8)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = (id)objc_opt_class();
      v11 = v18;
      v12 = "%{public}@: Get Matching Requests Success";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 12;
      goto LABEL_10;
    }
  }

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);

}

+ (void)checkDownloadQueueWithContentType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2050;
    v15 = a3;
    v7 = v13;
    _os_log_impl(&dword_2195F6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking download queue. Content type: %{public}ld.", buf, 0x16u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__APRequestHandler_checkDownloadQueueWithContentType___block_invoke;
  v10[3] = &unk_24DB1AE40;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v9, "checkDownloadQueueWithContentType:completion:", a3, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __54__APRequestHandler_checkDownloadQueueWithContentType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v3;
      v8 = v14;
      v9 = "%{public}@: Checking download queue failed. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = (id)objc_opt_class();
      v8 = v14;
      v9 = "%{public}@: Checking download queue succeeded.";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

}

+ (void)getCachedRequestsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = (id)objc_opt_class();
    v7 = v15;
    _os_log_impl(&dword_2195F6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching item cache.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__APRequestHandler_getCachedRequestsWithCompletion___block_invoke;
  v11[3] = &unk_24DB1B038;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "getCachedRequestsWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __52__APRequestHandler_getCachedRequestsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    v10 = 138543618;
    v11 = v7;
    v12 = 2048;
    v13 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2195F6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched Items. Count: %lu", (uint8_t *)&v10, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

+ (void)localApproveRequestWithItemIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = (id)objc_opt_class();
    v19 = 2114;
    v20 = v6;
    v10 = v18;
    _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Local approve request. Item identifier: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__APRequestHandler_localApproveRequestWithItemIdentifier_completion___block_invoke;
  v14[3] = &unk_24DB1AFC0;
  objc_copyWeak(&v16, (id *)buf);
  v13 = v7;
  v15 = v13;
  objc_msgSend(v12, "localApproveRequestWithItemIdentifier:completion:", v6, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __69__APRequestHandler_localApproveRequestWithItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v3;
      v8 = v15;
      v9 = "%{public}@: Local approve failure. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v8 = v15;
      v9 = "%{public}@: Local approve success";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

+ (void)restartAPNSConnection
{
  void *v2;
  id v3;

  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restartAPNSConnection");

}

+ (void)updateRequestWithIdentifier:(id)a3 action:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v20 = (id)objc_opt_class();
    v21 = 2114;
    v22 = v8;
    v23 = 2050;
    v24 = a4;
    v12 = v20;
    _os_log_impl(&dword_2195F6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Update request. Identifier: %{public}@, action: %{public}ld", buf, 0x20u);

  }
  objc_initWeak((id *)buf, a1);
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__APRequestHandler_updateRequestWithIdentifier_action_completion___block_invoke;
  v16[3] = &unk_24DB1AFC0;
  objc_copyWeak(&v18, (id *)buf);
  v15 = v9;
  v17 = v15;
  objc_msgSend(v14, "updateRequestWithIdentifier:action:completion:", v8, a4, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __66__APRequestHandler_updateRequestWithIdentifier_action_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v3;
      v8 = v15;
      v9 = "%{public}@: Update request failure. Error: %{public}@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_10:
      _os_log_impl(&dword_2195F6000, v10, v11, v9, (uint8_t *)&v14, v12);

    }
  }
  else
  {
    if (!v5)
    {
      +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v8 = v15;
      v9 = "%{public}@: Update request success";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
      goto LABEL_10;
    }
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);

}

+ (void)resetAccountWithType:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2050;
    v12 = a3;
    v6 = v10;
    _os_log_impl(&dword_2195F6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset account with type: %{public}ld", (uint8_t *)&v9, 0x16u);

  }
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resetAccountWithType:", a3);

}

+ (void)startDaemon
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Start daemon", (uint8_t *)&v7, 0xCu);

  }
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

}

+ (void)presentProductPageWithTitle:(id)a3 body:(id)a4 approve:(id)a5 decline:(id)a6 itemIdentifier:(id)a7 previewURL:(id)a8 offerName:(id)a9 requestString:(id)a10 requestSummary:(id)a11 priceSummary:(id)a12
{
  __CFString *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v33 = a4;
  v17 = (__CFString *)a7;
  v18 = (__CFString *)a8;
  v32 = a12;
  v31 = a11;
  v30 = a10;
  v29 = a9;
  v28 = a6;
  v27 = a5;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    v36 = (id)objc_opt_class();
    v37 = 2114;
    v38 = v34;
    v39 = 2114;
    v40 = v33;
    v41 = 2114;
    v42 = v17;
    v43 = 2114;
    v44 = v18;
    v21 = v36;
    _os_log_impl(&dword_2195F6000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Present product page. Title: %{public}@, body: %{public}@, itemIdentifier: %{public}@, previewURL: %{public}@", buf, 0x34u);

  }
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remoteObjectProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v17)
    v25 = v17;
  else
    v25 = &stru_24DB1B748;
  if (v18)
    v26 = v18;
  else
    v26 = &stru_24DB1B748;
  objc_msgSend(v23, "presentProductPageWithTitle:body:approve:decline:itemIdentifier:previewURL:offerName:requestString:requestSummary:priceSummary:", v34, v33, v27, v28, v25, v26, v29, v30, v31, v32);

}

+ (void)didReceiveStorePushNotificationWithPayload:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[APLogConfig sharedFrameworkConfig](APLogConfig, "sharedFrameworkConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v3;
    v6 = v10;
    _os_log_impl(&dword_2195F6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received store push notification. Payload: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  +[APConnectionNotifier sharedNotifier](APConnectionNotifier, "sharedNotifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didReceiveStorePushNotificationWithPayload:", v3);

}

@end
