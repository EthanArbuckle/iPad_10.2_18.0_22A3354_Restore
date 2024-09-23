@implementation APRequestExtension

- (void)checkDownloadQueue
{
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_ERROR, "%{public}@: checkDownloadQueue has not been overriden.", (uint8_t *)&v5, 0xCu);

  }
}

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a4;
  +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v7 = v9;
    _os_log_impl(&dword_2195F6000, v6, OS_LOG_TYPE_ERROR, "%{public}@: requestUpdatedWithResult:completion: has not been overriden.", (uint8_t *)&v8, 0xCu);

  }
  v4[2](v4);

}

- (void)_finish
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[APRequestExtension extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__APRequestExtension__finish__block_invoke;
  v4[3] = &unk_24DB1AF98;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "completeRequestReturningItems:completionHandler:", 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__APRequestExtension__finish__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
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
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Extension finished", (uint8_t *)&v5, 0xCu);

  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  APResult *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  APResult *v13;
  void *v14;
  APResult *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  APResult *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[APRequestExtension setExtensionContext:](self, "setExtensionContext:", v4);
  objc_msgSend(v4, "inputItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v7 = (APResult *)objc_claimAutoreleasedReturnValue();
  +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
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
    v27 = (id)objc_opt_class();
    v28 = 2114;
    v29 = v7;
    v10 = v27;
    _os_log_impl(&dword_2195F6000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Begun extension succesfully. User info: %{public}@", buf, 0x16u);

  }
  -[APResult objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("checkDownloadQueue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    -[APRequestExtension checkDownloadQueue](self, "checkDownloadQueue");
    -[APRequestExtension _finish](self, "_finish");
  }
  else
  {
    v13 = [APResult alloc];
    -[APResult objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[APResult initWithDictionary:](v13, "initWithDictionary:", v14);

    +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15)
    {
      if (!v16)
      {
        +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2114;
        v29 = v15;
        v20 = v19;
        _os_log_impl(&dword_2195F6000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Begun extension succesfully. Result: %{public}@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __55__APRequestExtension_beginRequestWithExtensionContext___block_invoke;
      v24[3] = &unk_24DB1AEB0;
      objc_copyWeak(&v25, (id *)buf);
      -[APRequestExtension requestUpdatedWithResult:completion:](self, "requestUpdatedWithResult:completion:", v15, v24);
      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (!v16)
      {
        +[APLogConfig sharedConfig](APLogConfig, "sharedConfig");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        v23 = v22;
        _os_log_impl(&dword_2195F6000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Context input item doesn't have result", buf, 0xCu);

      }
      -[APRequestExtension _finish](self, "_finish");
    }

  }
}

void __55__APRequestExtension_beginRequestWithExtensionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[APLogConfig sharedExtensionConfig](APLogConfig, "sharedExtensionConfig");
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
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_2195F6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Result observer finished", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "_finish");

}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

@end
