@implementation CALNLaunchServicesURLHandler

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CALNLaunchServicesURLHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, block);
  return (id)sharedInstance_instance;
}

void __46__CALNLaunchServicesURLHandler_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = v0;

}

- (void)openURL:(id)a3 response:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)os_transaction_create();
  if (v6)
  {
    objc_msgSend(v6, "notificationRecord");
    v8 = objc_claimAutoreleasedReturnValue();
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject sourceIdentifier](v8, "sourceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sourceClientIdentifier](v8, "sourceClientIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Opening url for response, source identifier = %{public}@, source client identifier = %{public}@, action identifier = %{public}@, url = %@", buf, 0x2Au);

    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Opening url: %@", buf, 0xCu);
    }
  }

  v13 = objc_alloc_init(MEMORY[0x24BDC15A0]);
  objc_msgSend((id)objc_opt_class(), "_openApplicationOptionsForResponse:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrontBoardOptions:", v14);

  objc_msgSend(v6, "targetConnectionEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTargetConnectionEndpoint:", v15);

  objc_msgSend(v13, "setSensitive:", 1);
  if (objc_msgSend(v5, "isFileURL"))
    objc_msgSend(v5, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke;
  v19[3] = &unk_24D484F38;
  v20 = v5;
  v21 = v7;
  v17 = v7;
  v18 = v5;
  objc_msgSend(v16, "openURL:configuration:completionHandler:", v18, v13, v19);

}

void __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke_cold_1((uint64_t)v6, a1, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isFileURL"))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");

}

+ (id)_openApplicationOptionsForResponse:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x24BE38320];
  v11[0] = *MEMORY[0x24BE38310];
  v11[1] = v6;
  v12[0] = MEMORY[0x24BDBD1C8];
  v12[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  objc_msgSend(v4, "originIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE382E0]);

  return v8;
}

void __49__CALNLaunchServicesURLHandler_openURL_response___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Could not open url, error = %@, url = %@", (uint8_t *)&v4, 0x16u);
}

@end
