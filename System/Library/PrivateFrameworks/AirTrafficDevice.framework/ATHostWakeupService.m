@implementation ATHostWakeupService

- (ATHostWakeupService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATHostWakeupService;
  return -[ATHostWakeupService init](&v3, sel_init);
}

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)stop
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)sendWakeupToHostWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ATHostBrowser *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ATHostWakeupService *v14;
  id v15;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "sending wakeup to host identifier '%@'", (uint8_t *)&buf, 0xCu);
  }

  v9 = objc_alloc_init(ATHostBrowser);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__ATHostWakeupService_sendWakeupToHostWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E927DF58;
  v10 = v6;
  p_buf = &buf;
  v13 = v10;
  v14 = self;
  v11 = v7;
  v15 = v11;
  -[ATHostBrowser browseForHostsWithTimeout:completion:](v9, "browseForHostsWithTimeout:completion:", 10, v12);

  _Block_object_dispose(&buf, 8);
}

- (void)sendWakeupToAllHostsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  ATHostBrowser *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "sending wakeup to all hosts", buf, 2u);
  }

  v6 = objc_alloc_init(ATHostBrowser);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ATHostWakeupService_sendWakeupToAllHostsWithCompletion___block_invoke;
  v8[3] = &unk_1E927DF80;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ATHostBrowser browseForHostsWithTimeout:completion:](v6, "browseForHostsWithTimeout:completion:", 10, v8);

}

- (void)getWakeableHostsWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  ATHostBrowser *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "getting wakeable hosts", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ATHostBrowser);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__ATHostWakeupService_getWakeableHostsWithCompletion___block_invoke;
  v9[3] = &unk_1E927DF80;
  v10 = v5;
  v11 = v3;
  v7 = v3;
  v8 = v5;
  -[ATHostBrowser browseForHostsWithTimeout:completion:](v6, "browseForHostsWithTimeout:completion:", 10, v9);

}

- (void)_wakeupHost:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  sockaddr *v13;
  sockaddr *v14;
  int v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "netService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "sending wakeup to host '%@'", (uint8_t *)&v19, 0xCu);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.atc.idlewake"), 0, 0, 1u);
  v8 = dispatch_time(0, 5000000000);
  dispatch_after(v8, MEMORY[0x1E0C80D38], &__block_literal_global_14);
  objc_msgSend(v3, "netService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject length](v11, "length");
    v13 = (sockaddr *)malloc_type_malloc(v12, 0xC8867B88uLL);
    if (v13)
    {
      v14 = v13;
      v11 = objc_retainAutorelease(v11);
      memcpy(v14, (const void *)-[NSObject bytes](v11, "bytes"), v12);
      *(_WORD *)v14->sa_data = 443;
      v15 = socket(2, 1, 6);
      v16 = connect(v15, v14, v12);
      _ATLogCategoryFramework();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v18)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "failed to connect to host wakeup listener - hope its ok", (uint8_t *)&v19, 2u);
        }

      }
      else
      {
        if (v18)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "Connected to host, closing.", (uint8_t *)&v19, 2u);
        }

        shutdown(v15, 2);
        close(v15);
      }
      free(v14);
    }
  }
  else
  {
    _ATLogCategoryFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "no host address found for service - ignoring", (uint8_t *)&v19, 2u);
    }
  }

}

- (void)environmentMonitorDidChangePower:(id)a3
{
  int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "isCharging");
  if (objc_msgSend(v5, "isRemoteServerLikelyReachable"))
  {
    objc_msgSend(v5, "networkType");
    if ((v4 & ICEnvironmentNetworkTypeIsWiFi()) == 1)
      -[ATHostWakeupService sendWakeupToAllHostsWithCompletion:](self, "sendWakeupToAllHostsWithCompletion:", &__block_literal_global_16);
  }

}

void __35__ATHostWakeupService__wakeupHost___block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.atc.idlewake"), 0, 0, 1u);
}

void __54__ATHostWakeupService_getWakeableHostsWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "libraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATUserDefaults readOnlyDefaults](ATUserDefaults, "readOnlyDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Hosts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("Wakeable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
    {
      _ATLogCategoryFramework();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "netService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "found wakeable host '%@'", (uint8_t *)&v17, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }
  if (a3)
  {
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
  }

}

void __58__ATHostWakeupService_sendWakeupToAllHostsWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "libraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATUserDefaults readOnlyDefaults](ATUserDefaults, "readOnlyDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Hosts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("Wakeable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "_wakeupHost:", v13);
  }
  if (a3)
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
  }

}

void __65__ATHostWakeupService_sendWakeupToHostWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "libraryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_wakeupHost:", v9);
  }
  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        (*(void (**)(_QWORD, _QWORD))(v7 + 16))(*(_QWORD *)(a1 + 48), 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 28, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      }
    }
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4155 != -1)
    dispatch_once(&sharedInstance_onceToken_4155, &__block_literal_global_4156);
  return (id)sharedInstance___sharedInstance_4157;
}

void __37__ATHostWakeupService_sharedInstance__block_invoke()
{
  ATHostWakeupService *v0;
  void *v1;

  v0 = objc_alloc_init(ATHostWakeupService);
  v1 = (void *)sharedInstance___sharedInstance_4157;
  sharedInstance___sharedInstance_4157 = (uint64_t)v0;

}

@end
