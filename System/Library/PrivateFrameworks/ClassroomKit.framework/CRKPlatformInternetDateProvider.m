@implementation CRKPlatformInternetDateProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken_0 != -1)
    dispatch_once(&sharedProvider_onceToken_0, &__block_literal_global_115);
  return (id)sharedProvider_sharedProvider;
}

void __49__CRKPlatformInternetDateProvider_sharedProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = v0;

}

- (CRKPlatformInternetDateProvider)init
{
  CRKPlatformInternetDateProvider *v2;
  uint64_t v3;
  NSMutableArray *completionQueue;
  uint64_t v5;
  CRKInternetDateFetching *dateFetchingProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKPlatformInternetDateProvider;
  v2 = -[CRKPlatformInternetDateProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (NSMutableArray *)v3;

    v2->_uptimeAtInternetDateAndTimeFetch = -1.0;
    v5 = objc_opt_new();
    dateFetchingProvider = v2->_dateFetchingProvider;
    v2->_dateFetchingProvider = (CRKInternetDateFetching *)v5;

  }
  return v2;
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v5 = (void (**)(id, void *, _QWORD))a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKPlatformInternetDateProvider.m"), 60, CFSTR("%@ must be called from the main thread"), v15);

  }
  -[CRKPlatformInternetDateProvider fetchExistingInternetDate](self, "fetchExistingInternetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _CRKLogGeneral_20();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Cached time found. No attempt to fetch the internet date and time will be made.", buf, 2u);
    }

    v5[2](v5, v6, 0);
  }
  else
  {
    -[CRKPlatformInternetDateProvider completionQueue](self, "completionQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x219A226E8](v5);
    objc_msgSend(v8, "addObject:", v9);

    -[CRKPlatformInternetDateProvider completionQueue](self, "completionQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    _CRKLogGeneral_20();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v11 < 2)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "No cached time found. Attempting to fetch the internet date and time for the first time.", buf, 2u);
      }

      -[CRKPlatformInternetDateProvider dateFetchingProvider](self, "dateFetchingProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke;
      v16[3] = &unk_24D9CA9C8;
      v16[4] = self;
      -[NSObject fetchInternetDateWithCompletion:](v12, "fetchInternetDateWithCompletion:", v16);
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "No cached time found, but a fetch for the internet date and time is already in-flight. No attempt to fetch the internet date and time will be made again.", buf, 2u);
    }

  }
}

void __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CRKLogGeneral_20();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke_cold_1(v6, v8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v5;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Fetched the internet date and time: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setInternetDateAndTime:", v5);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject systemUptime](v8, "systemUptime");
    objc_msgSend(*(id *)(a1 + 32), "setUptimeAtInternetDateAndTimeFetch:");
  }

  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      break;
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id, id))v12)[2](v12, v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "completionQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", 0);

  }
}

- (id)fetchExistingInternetDate
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[CRKPlatformInternetDateProvider internetDateAndTime](self, "internetDateAndTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKPlatformInternetDateProvider uptimeAtInternetDateAndTimeFetch](self, "uptimeAtInternetDateAndTimeFetch");
  v5 = 0;
  if (v3)
  {
    v6 = v4;
    if (v4 >= 0.0)
    {
      objc_msgSend(v3, "timeIntervalSince1970");
      v8 = v7;
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemUptime");
      v11 = v10;

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v8 + v11 - v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

- (CRKInternetDateFetching)dateFetchingProvider
{
  return self->_dateFetchingProvider;
}

- (void)setDateFetchingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dateFetchingProvider, a3);
}

- (NSDate)internetDateAndTime
{
  return self->_internetDateAndTime;
}

- (void)setInternetDateAndTime:(id)a3
{
  objc_storeStrong((id *)&self->_internetDateAndTime, a3);
}

- (double)uptimeAtInternetDateAndTimeFetch
{
  return self->_uptimeAtInternetDateAndTimeFetch;
}

- (void)setUptimeAtInternetDateAndTimeFetch:(double)a3
{
  self->_uptimeAtInternetDateAndTimeFetch = a3;
}

- (NSMutableArray)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_internetDateAndTime, 0);
  objc_storeStrong((id *)&self->_dateFetchingProvider, 0);
}

void __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedFailureReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch the internet date and time with error: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
