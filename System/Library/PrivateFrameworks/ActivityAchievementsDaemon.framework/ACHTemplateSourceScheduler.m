@implementation ACHTemplateSourceScheduler

- (ACHTemplateSourceScheduler)initWithClient:(id)a3 assertionClient:(id)a4 templateStore:(id)a5 achievementStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ACHTemplateSourceScheduler *v15;
  ACHTemplateSourceScheduler *v16;
  uint64_t v17;
  OS_dispatch_queue *serialQueue;
  NSMutableSet *v19;
  NSMutableSet *templateSources;
  NSDictionary *lastRunDateByTemplateSourceIdentifier;
  uint64_t v22;
  NSCalendar *gregorianCalendar;
  const char *v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  objc_super v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)ACHTemplateSourceScheduler;
  v15 = -[ACHTemplateSourceScheduler init](&v33, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_client, a3);
    objc_storeStrong((id *)&v16->_assertionClient, a4);
    objc_storeStrong((id *)&v16->_templateStore, a5);
    objc_storeStrong((id *)&v16->_achievementStore, a6);
    -[ACHAchievementStoring addObserver:](v16->_achievementStore, "addObserver:", v16);
    HKCreateSerialDispatchQueue();
    v17 = objc_claimAutoreleasedReturnValue();
    serialQueue = v16->_serialQueue;
    v16->_serialQueue = (OS_dispatch_queue *)v17;

    v16->_initialRunComplete = 0;
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    templateSources = v16->_templateSources;
    v16->_templateSources = v19;

    lastRunDateByTemplateSourceIdentifier = v16->_lastRunDateByTemplateSourceIdentifier;
    v16->_lastRunDateByTemplateSourceIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v22 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v16->_gregorianCalendar;
    v16->_gregorianCalendar = (NSCalendar *)v22;

    objc_initWeak(&location, v16);
    v24 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
    v25 = v16->_serialQueue;
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __92__ACHTemplateSourceScheduler_initWithClient_assertionClient_templateStore_achievementStore___block_invoke;
    v30 = &unk_24D13A2C0;
    objc_copyWeak(&v31, &location);
    notify_register_dispatch(v24, &v16->_protectedDataToken, v25, &v27);
    -[ACHTemplateSourceScheduler _startUp](v16, "_startUp", v27, v28, v29, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __92__ACHTemplateSourceScheduler_initWithClient_assertionClient_templateStore_achievementStore___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "_runAllTemplateSources");

  }
}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHTemplateSourceScheduler;
  -[ACHTemplateSourceScheduler dealloc](&v3, sel_dealloc);
}

- (ACHTemplateSourceScheduler)initWithProfile:(id)a3 templateStore:(id)a4 achievementStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  ACHTemplateSourceScheduler *v11;
  ACHTemplateSourceScheduler *v12;
  uint64_t v13;
  OS_dispatch_queue *serialQueue;
  NSMutableSet *v15;
  NSMutableSet *templateSources;
  NSDictionary *lastRunDateByTemplateSourceIdentifier;
  uint64_t v18;
  NSCalendar *gregorianCalendar;
  id WeakRetained;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)ACHTemplateSourceScheduler;
  v11 = -[ACHTemplateSourceScheduler init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_templateStore, a4);
    objc_storeStrong((id *)&v12->_achievementStore, a5);
    -[ACHAchievementStoring addObserver:](v12->_achievementStore, "addObserver:", v12);
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v13;

    v12->_initialRunComplete = 0;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    templateSources = v12->_templateSources;
    v12->_templateSources = v15;

    lastRunDateByTemplateSourceIdentifier = v12->_lastRunDateByTemplateSourceIdentifier;
    v12->_lastRunDateByTemplateSourceIdentifier = (NSDictionary *)MEMORY[0x24BDBD1B8];

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v18 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v12->_gregorianCalendar;
    v12->_gregorianCalendar = (NSCalendar *)v18;

    WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerForDaemonReady:", v12);

  }
  return v12;
}

- (void)registerTemplateSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateSourceScheduler *v9;

  v4 = a3;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D70E88);
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler adding template source with identifier %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "templateSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 32));

    v8 = objc_msgSend(*(id *)(a1 + 40), "initialRunComplete");
    ACHLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        objc_msgSend(*v2, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler running new template source with identifier %{public}@", buf, 0xCu);

      }
      v11 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v11, "_queue_runTemplateSources:requiringRunnableForDate:error:", v12, 1, &v16);
      v5 = v16;

      if (v5)
      {
        ACHLogTemplates();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v2, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v18 = v14;
          v19 = 2112;
          v20 = v5;
          _os_log_impl(&dword_21407B000, v13, OS_LOG_TYPE_DEFAULT, "Unable to run template source with identifier: %@; %@",
            buf,
            0x16u);

        }
      }
    }
    else if (v9)
    {
      objc_msgSend(*v2, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler not running new template source with identifier %{public}@ because initial run is not complete", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke_cold_1();
  }

}

- (void)deregisterTemplateSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ACHTemplateSourceScheduler *v9;

  v4 = a3;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke;
  v7[3] = &unk_24D13A360;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke(uint64_t a1)
{
  id *v2;
  int v3;
  void *v4;
  int v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_254D70E88);
  objc_msgSend(v2[1], "templateSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *v2);

  if (v3)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if ((v3 & 1) != 0)
    {
      if ((v5 & 1) != 0)
        return;
      ACHLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_1();
    }
    else
    {
      ACHLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_2();
    }
  }
  else
  {
    ACHLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*v2, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Template Source scheduler removing template source with identifier %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "templateSources");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObject:](v7, "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

- (void)runImmediatelyForTemplateSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Template Source scheduler immediate run requested for source: %{public}@", buf, 0xCu);

  }
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke;
  v9[3] = &unk_24D13A360;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "templateSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "initialRunComplete") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 40));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);
      v9 = 0;
      objc_msgSend(v5, "_queue_runTemplateSources:requiringRunnableForDate:error:", v4, 0, &v9);
      v6 = v9;
      if (v6)
      {
        ACHLogTemplates();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v11 = v8;
          v12 = 2112;
          v13 = v6;
          _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Unable to run template source with identifier %@; %@",
            buf,
            0x16u);

        }
      }

    }
    else
    {
      ACHLogDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Template Source scheduler not honoring request, initial run hasn't completed", buf, 2u);
      }
    }
  }
  else
  {
    ACHLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke_cold_1();
  }

}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;

  -[ACHTemplateSourceScheduler profile](self, "profile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addProtectedDataObserver:", self);

  -[ACHTemplateSourceScheduler _startUp](self, "_startUp");
}

- (BOOL)_isProtectedDataAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[ACHTemplateSourceScheduler client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ACHTemplateSourceScheduler client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v4, "isProtectedDataAvailable");
  }
  else
  {
    -[ACHTemplateSourceScheduler profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isProtectedDataAvailable");

  }
  return v5;
}

- (void)_startUp
{
  if (-[ACHTemplateSourceScheduler _isProtectedDataAvailable](self, "_isProtectedDataAvailable")
    && -[ACHTemplateSourceScheduler achievementStoreDidFinishInitialFetch](self, "achievementStoreDidFinishInitialFetch"))
  {
    -[ACHTemplateSourceScheduler _runAllTemplateSources](self, "_runAllTemplateSources");
  }
  else if (!-[ACHTemplateSourceScheduler achievementStoreDidFinishInitialFetch](self, "achievementStoreDidFinishInitialFetch"))
  {
    -[ACHTemplateSourceScheduler setShouldScheduleAfterInitialFetch:](self, "setShouldScheduleAfterInitialFetch:", 1);
  }
  -[ACHTemplateSourceScheduler _listenForSignificantTimeChanges](self, "_listenForSignificantTimeChanges");
}

- (void)_listenForSignificantTimeChanges
{
  uint64_t v3;
  void *v4;
  const char *v5;
  int *p_significantTimeChangeToken;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke;
  v19[3] = &unk_24D13A2E8;
  objc_copyWeak(&v20, &location);
  v4 = (void *)MEMORY[0x2199C9184](v19);
  v5 = (const char *)objc_msgSend(CFSTR("SignificantTimeChangeNotification"), "UTF8String");
  p_significantTimeChangeToken = &self->_significantTimeChangeToken;
  v7 = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC9B8];
  handler[0] = v3;
  handler[1] = 3221225472;
  handler[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_270;
  handler[3] = &unk_24D13D778;
  v9 = v4;
  v18 = v9;
  notify_register_dispatch(v5, p_significantTimeChangeToken, v7, handler);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDBC9E8];
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_2;
  v15[3] = &unk_24D13D7A0;
  v13 = v9;
  v16 = v13;
  v14 = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, 0, v11, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained, "_isProtectedDataAvailable");
    ACHLogTemplates();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change: Running template sources", buf, 2u);
      }

      objc_msgSend(v2, "_runAllTemplateSources");
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Significant time change: Will run template sources next time protected data is available", v6, 2u);
      }

    }
  }

}

uint64_t __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_270(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__ACHTemplateSourceScheduler__listenForSignificantTimeChanges__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4)
  {
    if (-[ACHTemplateSourceScheduler achievementStoreDidFinishInitialFetch](self, "achievementStoreDidFinishInitialFetch", a3))
    {
      -[ACHTemplateSourceScheduler _runAllTemplateSources](self, "_runAllTemplateSources");
    }
  }
}

- (id)_runnableSourcesInSources:(id)a3 forDate:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__ACHTemplateSourceScheduler__runnableSourcesInSources_forDate_calendar___block_invoke;
  v14[3] = &unk_24D13D7C8;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a3, "hk_filter:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __73__ACHTemplateSourceScheduler__runnableSourcesInSources_forDate_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lastRunDateByTemplateSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "runCadence");
  if (v7 == 2)
  {
    if (!v6 || (objc_msgSend(*(id *)(a1 + 40), "isDate:inSameDayAsDate:", *(_QWORD *)(a1 + 48), v6) & 1) == 0)
      goto LABEL_8;
  }
  else if (v7 == 1 && !v6)
  {
LABEL_8:
    v8 = objc_msgSend(v3, "sourceShouldRunForDate:", *(_QWORD *)(a1 + 48));
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)_runAllTemplateSources
{
  NSObject *v3;
  _QWORD block[5];

  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ACHTemplateSourceScheduler__runAllTemplateSources__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_async(v3, block);

}

void __52__ACHTemplateSourceScheduler__runAllTemplateSources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "templateSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(v2, "_queue_runTemplateSources:requiringRunnableForDate:error:", v3, 1, &v7);
  v5 = v7;

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setInitialRunComplete:", 1);
  if (v5)
  {
    ACHLogTemplates();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_21407B000, v6, OS_LOG_TYPE_DEFAULT, "Error running template sources: %@", buf, 0xCu);
    }

  }
}

- (BOOL)_queue_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  -[ACHTemplateSourceScheduler client](self, "client", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHTemplateSourceScheduler templateSources](self, "templateSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = -[ACHTemplateSourceScheduler _queue_client_runTemplateSources:requiringRunnableForDate:error:](self, "_queue_client_runTemplateSources:requiringRunnableForDate:error:", v7, 1, 0);
  else
    v8 = -[ACHTemplateSourceScheduler _queue_daemon_runTemplateSources:requiringRunnableForDate:error:](self, "_queue_daemon_runTemplateSources:requiringRunnableForDate:error:", v7, 1, 0);
  v9 = v8;

  return v9;
}

- (BOOL)_queue_client_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  dispatch_time_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  ACHTemplateSourceScheduler *v58;
  id obj;
  NSObject *group;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  NSObject *v67;
  _QWORD *v68;
  uint8_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint8_t buf[8];
  uint8_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _QWORD v94[4];
  int v95;
  id v96;
  uint64_t v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  uint8_t v101[128];
  uint8_t v102[4];
  void *v103;
  uint64_t v104;

  v5 = a4;
  v104 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v58 = self;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  ACHLogAwardEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "[#mc] _queue_runTemplateSources", buf, 2u);
  }

  v10 = objc_alloc(MEMORY[0x24BDBCF50]);
  v57 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x24BE01538]);
  v11 = objc_msgSend(v57, "BOOLForKey:", *MEMORY[0x24BE01228]);
  v12 = objc_msgSend(v57, "BOOLForKey:", *MEMORY[0x24BE01220]);
  -[ACHTemplateSourceScheduler _currentDate](v58, "_currentDate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  v56 = v13;
  if (((!v5 | v11 | v12) & 1) == 0)
  {
    -[ACHTemplateSourceScheduler gregorianCalendar](v58, "gregorianCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplateSourceScheduler _runnableSourcesInSources:forDate:calendar:](v58, "_runnableSourcesInSources:forDate:calendar:", v56, v61, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v15;
  }
  v55 = v13;
  if (objc_msgSend(v13, "count"))
  {
    -[ACHTemplateSourceScheduler assertionClient](v58, "assertionClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    objc_msgSend(v16, "acquireDatabaseAssertionWithIdentifier:duration:error:", CFSTR("ACHTemplateSourceScheduler"), &v96, 20.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v96;

    v94[0] = 0;
    v94[1] = v94;
    v94[2] = 0x2810000000;
    v94[3] = &unk_21410B3BF;
    v95 = 0;
    *(_QWORD *)buf = 0;
    v89 = buf;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__33;
    v92 = __Block_byref_object_dispose__33;
    v93 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__33;
    v86 = __Block_byref_object_dispose__33;
    v87 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__33;
    v80 = __Block_byref_object_dispose__33;
    v81 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    ACHLogDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v102 = 138412290;
      v103 = v55;
      _os_log_impl(&dword_21407B000, v17, OS_LOG_TYPE_DEFAULT, "Running template sourcing for these sources: %@", v102, 0xCu);
    }

    group = dispatch_group_create();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v55;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v101, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v73;
      v20 = (void *)MEMORY[0x24BDBD1B8];
      do
      {
        v21 = 0;
        v22 = v20;
        do
        {
          if (*(_QWORD *)v73 != v19)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v21);
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __94__ACHTemplateSourceScheduler__queue_client_runTemplateSources_requiringRunnableForDate_error___block_invoke;
          v66[3] = &unk_24D13D7F0;
          v68 = v94;
          v66[4] = v23;
          v69 = buf;
          v70 = &v76;
          v71 = &v82;
          v24 = group;
          v67 = v24;
          v25 = (void *)MEMORY[0x2199C9184](v66);
          dispatch_group_enter(v24);
          objc_msgSend(v23, "templatesForDate:completion:", v61, v25);
          objc_msgSend(v23, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v26;
          v100 = v61;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "hk_dictionaryByAddingEntriesFromDictionary:", v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          ++v21;
          v22 = v20;
        }
        while (v18 != v21);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v101, 16);
      }
      while (v18);
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDBD1B8];
    }

    v29 = dispatch_time(0, 30000000000);
    if (dispatch_group_wait(group, v29))
    {
      ACHLogTemplates();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[ACHTemplateSourceScheduler _queue_client_runTemplateSources:requiringRunnableForDate:error:].cold.1();

      v31 = (void *)MEMORY[0x24BDD1540];
      v97 = *MEMORY[0x24BDD0FC8];
      v98 = CFSTR("Waited for dispatch group and reached timeout. Source scheduling appears to have failed.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v33;
      v35 = v34;
      if (v34)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v34);
        else
          _HKLogDroppedError();
      }

      -[ACHTemplateSourceScheduler assertionClient](v58, "assertionClient");
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v65 = v52;
      objc_msgSend(v39, "invalidateAssertionWithToken:error:", v54, &v65);
      v37 = v65;

      v28 = 0;
      goto LABEL_41;
    }
    -[ACHTemplateSourceScheduler assertionClient](v58, "assertionClient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v52;
    objc_msgSend(v36, "invalidateAssertionWithToken:error:", v54, &v64);
    v37 = v64;

    if (objc_msgSend(*((id *)v89 + 5), "count"))
    {
      objc_msgSend(*((id *)v89 + 5), "firstObject");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        if (a5)
        {
          v40 = objc_retainAutorelease(v38);
LABEL_33:
          v28 = 0;
          *a5 = v40;
LABEL_40:
          v35 = v39;
LABEL_41:

          _Block_object_dispose(&v76, 8);
          _Block_object_dispose(&v82, 8);

          _Block_object_dispose(buf, 8);
          _Block_object_dispose(v94, 8);

          goto LABEL_42;
        }
        _HKLogDroppedError();
      }
    }
    else
    {
      -[ACHTemplateSourceScheduler templateStore](v58, "templateStore");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v77[5];
      v63 = 0;
      objc_msgSend(v41, "removeTemplates:error:", v42, &v63);
      v35 = v63;

      if (!v35)
      {
        -[ACHTemplateSourceScheduler templateStore](v58, "templateStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v83[5];
        v62 = 0;
        objc_msgSend(v44, "addTemplates:databaseContext:error:", v45, 0, &v62);
        v39 = v62;

        v28 = v39 == 0;
        if (v39)
        {
          v46 = v39;
          v47 = v46;
          if (a5)
            *a5 = objc_retainAutorelease(v46);
          else
            _HKLogDroppedError();
        }
        else
        {
          -[ACHTemplateSourceScheduler lastRunDateByTemplateSourceIdentifier](v58, "lastRunDateByTemplateSourceIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "hk_dictionaryByAddingEntriesFromDictionary:", v20);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACHTemplateSourceScheduler setLastRunDateByTemplateSourceIdentifier:](v58, "setLastRunDateByTemplateSourceIdentifier:", v50);

          ACHLogTemplates();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            -[ACHTemplateSourceScheduler lastRunDateByTemplateSourceIdentifier](v58, "lastRunDateByTemplateSourceIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v102 = 138543362;
            v103 = v51;
            _os_log_impl(&dword_21407B000, v47, OS_LOG_TYPE_DEFAULT, "Updated last run dates for template sources to: %{public}@", v102, 0xCu);

          }
        }

        goto LABEL_41;
      }
      v43 = v35;
      v39 = v43;
      if (a5)
      {
        v40 = objc_retainAutorelease(v43);
        goto LABEL_33;
      }
      _HKLogDroppedError();
    }
    v28 = 0;
    goto LABEL_40;
  }
  v28 = 1;
LABEL_42:

  return v28;
}

void __94__ACHTemplateSourceScheduler__queue_client_runTemplateSources_requiringRunnableForDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock_with_options();
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v9);
  v42 = v9;
  if (v8)
  {
    v43 = v7;
    ACHLogTemplates();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v11;
      v62 = 2048;
      v63 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, removing from template store:", buf, 0x16u);

    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          ACHLogTemplates();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "uniqueName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v61 = v17;
            v62 = 2114;
            v63 = (uint64_t)v19;
            _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v14);
    }

    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v12, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v21);

    v7 = v43;
  }
  v44 = v8;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSourceName:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v24);
  }

  ACHLogTemplates();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 138543618;
    v61 = v30;
    v62 = 2048;
    v63 = v31;
    _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, writing to template store:", buf, 0x16u);

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v32 = v22;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        ACHLogTemplates();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v37, "uniqueName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v61 = v37;
          v62 = 2114;
          v63 = (uint64_t)v39;
          _os_log_impl(&dword_21407B000, v38, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);

        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v34);
  }

  v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v32, "allObjects");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v41);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (BOOL)_queue_daemon_runTemplateSources:(id)a3 requiringRunnableForDate:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  dispatch_time_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  NSObject *group;
  ACHTemplateSourceScheduler *v60;
  void *v61;
  _QWORD v62[6];
  NSObject *v63;
  uint8_t *v64;
  _QWORD *v65;
  __int128 *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _QWORD v72[5];
  id v73;
  uint8_t buf[8];
  uint8_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  uint8_t v84[128];
  uint8_t v85[4];
  void *v86;
  __int128 v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  _QWORD v93[4];

  v5 = a4;
  v93[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v60 = self;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  ACHLogAwardEngine();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21407B000, v9, OS_LOG_TYPE_DEFAULT, "[#mc] _queue_runTemplateSources", buf, 2u);
  }

  v10 = objc_alloc(MEMORY[0x24BDBCF50]);
  v57 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x24BE01538]);
  v11 = objc_msgSend(v57, "BOOLForKey:", *MEMORY[0x24BE01228]);
  v12 = objc_msgSend(v57, "BOOLForKey:", *MEMORY[0x24BE01220]);
  -[ACHTemplateSourceScheduler _currentDate](v60, "_currentDate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v75 = buf;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__33;
  v78 = __Block_byref_object_dispose__33;
  v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__33;
  v72[4] = __Block_byref_object_dispose__33;
  v73 = 0;
  v13 = v7;
  v56 = v13;
  if (((!v5 | v11 | v12) & 1) == 0)
  {
    -[ACHTemplateSourceScheduler gregorianCalendar](v60, "gregorianCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplateSourceScheduler _runnableSourcesInSources:forDate:calendar:](v60, "_runnableSourcesInSources:forDate:calendar:", v56, v61, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v15;
  }
  v55 = v13;
  if (!objc_msgSend(v13, "count"))
  {
    v30 = 0;
    goto LABEL_41;
  }
  -[ACHTemplateSourceScheduler profile](v60, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  +[ACHDatabaseAssertion assertionWithDatabase:identifier:timeout:error:](ACHDatabaseAssertion, "assertionWithDatabase:identifier:timeout:error:", v17, CFSTR("ACHTemplateSourceSchedulerDatabaseAssertion"), &v71, 20.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v71;

  if (v54)
  {
    ACHLogAwardEngine();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ACHTemplateSourceScheduler _queue_daemon_runTemplateSources:requiringRunnableForDate:error:].cold.2();

    goto LABEL_10;
  }
  ACHLogAwardEngine();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v87) = 138543362;
    *(_QWORD *)((char *)&v87 + 4) = v52;
    _os_log_impl(&dword_21407B000, v31, OS_LOG_TYPE_DEFAULT, "Failed to get accessibility assertion with error %{public}@; deferring template source scheduling",
      (uint8_t *)&v87,
      0xCu);
  }

  if (!a5)
  {
LABEL_10:
    *(_QWORD *)&v87 = 0;
    *((_QWORD *)&v87 + 1) = &v87;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__33;
    v90 = __Block_byref_object_dispose__33;
    ACHDatabaseContextWithAccessibilityAssertion(v54);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    ACHLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v85 = 138412290;
      v86 = v55;
      _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Running template sourcing for these sources: %@", v85, 0xCu);
    }

    group = dispatch_group_create();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v55;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v68;
      v22 = (void *)MEMORY[0x24BDBD1B8];
      do
      {
        v23 = 0;
        v24 = v22;
        do
        {
          if (*(_QWORD *)v68 != v21)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v23);
          v62[0] = MEMORY[0x24BDAC760];
          v62[1] = 3221225472;
          v62[2] = __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke;
          v62[3] = &unk_24D13D818;
          v62[4] = v25;
          v62[5] = v60;
          v64 = buf;
          v65 = v72;
          v66 = &v87;
          v26 = group;
          v63 = v26;
          v27 = (void *)MEMORY[0x2199C9184](v62);
          dispatch_group_enter(v26);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v25, "templatesForDate:databaseContext:completion:", v61, *(_QWORD *)(*((_QWORD *)&v87 + 1) + 40), v27);
          else
            objc_msgSend(v25, "templatesForDate:completion:", v61, v27);
          objc_msgSend(v25, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v28;
          v83 = v61;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "hk_dictionaryByAddingEntriesFromDictionary:", v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          ++v23;
          v24 = v22;
        }
        while (v20 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v84, 16);
      }
      while (v20);
    }
    else
    {
      v22 = (void *)MEMORY[0x24BDBD1B8];
    }

    v39 = dispatch_time(0, 30000000000);
    if (dispatch_group_wait(group, v39))
    {
      ACHLogTemplates();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[ACHTemplateSourceScheduler _queue_client_runTemplateSources:requiringRunnableForDate:error:].cold.1();

      v41 = (void *)MEMORY[0x24BDD1540];
      v80 = *MEMORY[0x24BDD0FC8];
      v81 = CFSTR("Waited for dispatch group and reached timeout. Source scheduling appears to have failed.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*((id *)v75 + 5), "addObject:", v30);
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v54, "invalidate");

    v43 = *(void **)(*((_QWORD *)&v87 + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&v87 + 1) + 40) = 0;

    -[ACHTemplateSourceScheduler lastRunDateByTemplateSourceIdentifier](v60, "lastRunDateByTemplateSourceIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "hk_dictionaryByAddingEntriesFromDictionary:", v22);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACHTemplateSourceScheduler setLastRunDateByTemplateSourceIdentifier:](v60, "setLastRunDateByTemplateSourceIdentifier:", v45);

    ACHLogTemplates();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      -[ACHTemplateSourceScheduler lastRunDateByTemplateSourceIdentifier](v60, "lastRunDateByTemplateSourceIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v85 = 138543362;
      v86 = v47;
      _os_log_impl(&dword_21407B000, v46, OS_LOG_TYPE_DEFAULT, "Updated last run dates for template sources to: %{public}@", v85, 0xCu);

    }
    v48 = objc_msgSend(*((id *)v75 + 5), "count");
    v49 = v48;
    if (a5 && v48)
    {
      objc_msgSend(*((id *)v75 + 5), "firstObject");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v87, 8);
    if (v49)
      goto LABEL_40;
LABEL_41:
    v50 = 1;
    goto LABEL_42;
  }
  v32 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v52, "localizedDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("Failed to get accessibility assertion with error %@ deferring template source scheduling"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x24BDD1540];
  v92 = *MEMORY[0x24BDD0FC8];
  v93[0] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ActivityAchievements"), -1, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_retainAutorelease(v37);
  *a5 = v38;

  v30 = 0;
LABEL_40:
  v50 = 0;
LABEL_42:

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(buf, 8);

  return v50;
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v9);
  v50 = v9;
  v51 = v8;
  v52 = a1;
  if (v8)
  {
    v49 = v7;
    ACHLogTemplates();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v11;
      v72 = 2048;
      v73 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, removing from template store:", buf, 0x16u);

    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v64 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          ACHLogTemplates();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v17, "uniqueName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v71 = v17;
            v72 = 2114;
            v73 = (uint64_t)v19;
            _os_log_impl(&dword_21407B000, v18, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 40), "templateStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v22 + 40);
    objc_msgSend(v20, "removeTemplates:error:", v21, &obj);
    objc_storeStrong((id *)(v22 + 40), obj);

    v7 = v49;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      ACHLogTemplates();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_2();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = 0;

    }
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = v7;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "identifier", v49, v50);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setSourceName:", v32);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v28);
  }

  ACHLogTemplates();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 138543618;
    v71 = v34;
    v72 = 2048;
    v73 = v35;
    _os_log_impl(&dword_21407B000, v33, OS_LOG_TYPE_DEFAULT, "Source %{public}@ returned %lu templates, writing to template store:", buf, 0x16u);

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v36 = v26;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v55 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
        ACHLogTemplates();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v41, "uniqueName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v71 = v41;
          v72 = 2114;
          v73 = (uint64_t)v43;
          _os_log_impl(&dword_21407B000, v42, OS_LOG_TYPE_DEFAULT, "%p: %{public}@", buf, 0x16u);

        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v38);
  }

  objc_msgSend(*(id *)(v52 + 40), "templateStore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allObjects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v52 + 72) + 8) + 40);
  v47 = *(_QWORD *)(*(_QWORD *)(v52 + 64) + 8);
  v53 = *(id *)(v47 + 40);
  objc_msgSend(v44, "addTemplates:databaseContext:error:", v45, v46, &v53);
  objc_storeStrong((id *)(v47 + 40), v53);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v52 + 64) + 8) + 40))
  {
    ACHLogTemplates();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_1();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v52 + 64) + 8) + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(v52 + 48));

}

- (void)achievementStoreDidFinishInitialFetch:(id)a3
{
  -[ACHTemplateSourceScheduler setAchievementStoreDidFinishInitialFetch:](self, "setAchievementStoreDidFinishInitialFetch:", 1);
  if (-[ACHTemplateSourceScheduler shouldScheduleAfterInitialFetch](self, "shouldScheduleAfterInitialFetch"))
  {
    if (-[ACHTemplateSourceScheduler _isProtectedDataAvailable](self, "_isProtectedDataAvailable"))
      -[ACHTemplateSourceScheduler _runAllTemplateSources](self, "_runAllTemplateSources");
  }
}

- (unint64_t)_sourceCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__ACHTemplateSourceScheduler__sourceCount__block_invoke;
  v6[3] = &unk_24D13AC40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__ACHTemplateSourceScheduler__sourceCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "templateSources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)_currentDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[ACHTemplateSourceScheduler currentDateOverride](self, "currentDateOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)_runSynchronouslyWithError:(id *)a3
{
  NSObject *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__33;
  v13 = __Block_byref_object_dispose__33;
  v14 = 0;
  -[ACHTemplateSourceScheduler serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__ACHTemplateSourceScheduler__runSynchronouslyWithError___block_invoke;
  v8[3] = &unk_24D13ACE0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __57__ACHTemplateSourceScheduler__runSynchronouslyWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "templateSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_queue_runTemplateSources:requiringRunnableForDate:error:", v3, 1, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (ACHDatabaseAssertionClient)assertionClient
{
  return self->_assertionClient;
}

- (void)setAssertionClient:(id)a3
{
  objc_storeStrong((id *)&self->_assertionClient, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (ACHAchievementStoring)achievementStore
{
  return self->_achievementStore;
}

- (void)setAchievementStore:(id)a3
{
  objc_storeStrong((id *)&self->_achievementStore, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (BOOL)initialRunComplete
{
  return self->_initialRunComplete;
}

- (void)setInitialRunComplete:(BOOL)a3
{
  self->_initialRunComplete = a3;
}

- (NSMutableSet)templateSources
{
  return self->_templateSources;
}

- (void)setTemplateSources:(id)a3
{
  objc_storeStrong((id *)&self->_templateSources, a3);
}

- (NSDictionary)lastRunDateByTemplateSourceIdentifier
{
  return self->_lastRunDateByTemplateSourceIdentifier;
}

- (void)setLastRunDateByTemplateSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastRunDateByTemplateSourceIdentifier, a3);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianCalendar, a3);
}

- (BOOL)achievementStoreDidFinishInitialFetch
{
  return self->_achievementStoreDidFinishInitialFetch;
}

- (void)setAchievementStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_achievementStoreDidFinishInitialFetch = a3;
}

- (BOOL)shouldScheduleAfterInitialFetch
{
  return self->_shouldScheduleAfterInitialFetch;
}

- (void)setShouldScheduleAfterInitialFetch:(BOOL)a3
{
  self->_shouldScheduleAfterInitialFetch = a3;
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (NSDate)currentDateOverride
{
  return self->_currentDateOverride;
}

- (void)setCurrentDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateOverride, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_lastRunDateByTemplateSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_templateSources, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_achievementStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_assertionClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __53__ACHTemplateSourceScheduler_registerTemplateSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Source scheduler not adding template source %{public}@ because it does not conform to template source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Source scheduler not removing template source %{public}@ because it was not previously registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__ACHTemplateSourceScheduler_deregisterTemplateSource___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Template Source scheduler not removing template source %{public}@ because it does not conform to template source protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__ACHTemplateSourceScheduler_runImmediatelyForTemplateSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_21407B000, v0, v1, "Template Source scheduler couldn't find a matching registered source, not running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_queue_client_runTemplateSources:requiringRunnableForDate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_21407B000, v0, v1, "Waited for dispatch group and reached timeout. Source scheduling appears to have failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_queue_daemon_runTemplateSources:requiringRunnableForDate:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_1();
  _os_log_debug_impl(&dword_21407B000, v0, OS_LOG_TYPE_DEBUG, "Template source scheduler acquired assertion. Excellent.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error storing templates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __94__ACHTemplateSourceScheduler__queue_daemon_runTemplateSources_requiringRunnableForDate_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error removing templates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
