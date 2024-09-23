@implementation DEDDaemon

- (DEDDaemon)init
{
  DEDDaemon *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DEDDaemon;
  v2 = -[DEDDaemon init](&v15, sel_init);
  if (v2)
  {
    +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDDaemon setConfig:](v2, "setConfig:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v4, "setQualityOfService:", 9);
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[DEDDaemon config](v2, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.ded-daemon-bkgd-queue"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v8);

    -[DEDDaemon setBackgroundOpQueue:](v2, "setBackgroundOpQueue:", v4);
    v9 = objc_alloc_init(MEMORY[0x24BDD1710]);

    objc_msgSend(v9, "setQualityOfService:", 25);
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[DEDDaemon config](v2, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.ded-daemon-uinit-queue"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v13);

    -[DEDDaemon setUserInitiatedOpQueue:](v2, "setUserInitiatedOpQueue:", v9);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_2 != -1)
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_9);
  return (id)sharedInstance_shared_1;
}

void __27__DEDDaemon_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_1;
  sharedInstance_shared_1 = v0;

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[DEDDaemon _controller](self, "_controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDDaemon setController:](self, "setController:", v3);

  if (-[DEDDaemon embeddedInApp](self, "embeddedInApp"))
  {
    -[DEDDaemon controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureForEmbedded:", 1);

  }
  -[DEDDaemon controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureForDaemon");

  -[DEDDaemon controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWorkerDelegate:", self);

  -[DEDDaemon controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");

  +[DEDAnalytics didStartDaemon](DEDAnalytics, "didStartDaemon");
  +[DEDDeferredExtensionInfo checkIn](DEDDeferredExtensionInfo, "checkIn");
  objc_msgSend(MEMORY[0x24BE2C998], "checkIn");
  +[DEDCollectionNotification beginListeningForNotification](DEDCollectionNotification, "beginListeningForNotification");
  +[DEDHomeKitManager sharedInstance](DEDHomeKitManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

  +[DEDRapportManager sharedInstance](DEDRapportManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");

  +[DEDDirectoriesCleanup run](DEDDirectoriesCleanup, "run");
  -[DEDDaemon warmUpCaches](self, "warmUpCaches");
}

- (void)warmUpCaches
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDD1478];
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __25__DEDDaemon_warmUpCaches__block_invoke;
  v10 = &unk_24D1E4B90;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "blockOperationWithBlock:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("warmUpCaches"), v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v4);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __25__DEDDaemon_warmUpCaches__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Warming up caches", v8, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "diagnosticCollector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableDiagnosticExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setCachedExtensionsForThisDevice:", v6);

}

- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315906;
    v13 = "-[DEDDaemon finallyStartDiagnosticWithIdentifier:parameters:session:]";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v12, 0x2Au);
  }

  -[DEDDaemon _startDiagnosticWithIdentifier:parameters:session:runSetup:](self, "_startDiagnosticWithIdentifier:parameters:session:runSetup:", v8, v9, v10, 0);
}

- (void)setupDeferredDiagnosticsWithExtensionInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  Log_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDDaemon setupDeferredDiagnosticsWithExtensionInfo:].cold.1(v4, v5);

  -[DEDDaemon diagnosticCollector](self, "diagnosticCollector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareItemsWithDeferredExtensionInfo:", v4);

}

- (void)teardownDeferredDiagnosticsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315906;
    v14 = "-[DEDDaemon teardownDeferredDiagnosticsWithIdentifier:parameters:session:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v13, 0x2Au);
  }

  -[DEDDaemon diagnosticCollector](self, "diagnosticCollector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cleanupItemsWithIdentifier:parameters:session:", v8, v9, v10);

}

- (int64_t)transportType
{
  return 1;
}

- (void)pingSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  Log_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[DEDDaemon pingSession:].cold.1(v5);

  -[DEDDaemon controller](self, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pong");
}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Log_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[DEDDaemon listAvailableExtensionsForSession:]";
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_21469E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] [%{public}@]", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-show-extensions-%@"), v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = (void *)os_transaction_create();
  objc_initWeak((id *)buf, self);
  v8 = (void *)MEMORY[0x24BDD1478];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__DEDDaemon_listAvailableExtensionsForSession___block_invoke;
  v15[3] = &unk_24D1E5008;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  objc_copyWeak(&v19, (id *)buf);
  v11 = v4;
  v18 = v11;
  objc_msgSend(v8, "blockOperationWithBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("show-extensions(%@)"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setName:", v13);

  -[DEDDaemon userInitiatedOpQueue](self, "userInitiatedOpQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addOperation:", v12);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __47__DEDDaemon_listAvailableExtensionsForSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", (uint8_t *)&v10, 0xCu);
  }

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionForIdentifier:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "_extensionsForSession:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "supportsDiagnostics:", v9);
}

- (id)_extensionsForSession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[DEDDaemon cachedExtensionsForThisDevice](self, "cachedExtensionsForThisDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEDDaemon cachedExtensionsForThisDevice](self, "cachedExtensionsForThisDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DEDDaemon diagnosticCollector](self, "diagnosticCollector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableDiagnosticExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  DEDExtensionIdentifier *v16;
  DEDDeferredExtensionInfo *v17;
  DEDDeferredExtensionInfo *v18;
  double v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  Log_0();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DEDDaemon startDiagnosticWithIdentifier:parameters:deferRunUntil:session:].cold.1();

  Log_0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v20 = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_INFO, "will collect %@, deferred until %@", (uint8_t *)&v20, 0x16u);
  }

  v16 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v10);
  v17 = [DEDDeferredExtensionInfo alloc];
  +[DEDDeferredExtensionInfo recommendedGracePeriodForDate:](DEDDeferredExtensionInfo, "recommendedGracePeriodForDate:", v12);
  v18 = -[DEDDeferredExtensionInfo initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:](v17, "initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:", v13, v16, v12);

  -[DEDDeferredExtensionInfo setParameters:](v18, "setParameters:", v11);
  -[DEDDeferredExtensionInfo schedule](v18, "schedule");
  objc_msgSend(v12, "timeIntervalSinceNow");
  +[DEDAnalytics extensionDidScheduleExtensionWithIdentifier:delay:](DEDAnalytics, "extensionDidScheduleExtensionWithIdentifier:delay:", v10, (unint64_t)v19);
  -[DEDDaemon setupDeferredDiagnosticsWithExtensionInfo:](self, "setupDeferredDiagnosticsWithExtensionInfo:", v18);

}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  -[DEDDaemon _startDiagnosticWithIdentifier:parameters:session:runSetup:](self, "_startDiagnosticWithIdentifier:parameters:session:runSetup:", a3, a4, a5, 1);
}

- (void)_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5 runSetup:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  DEDExtensionIdentifier *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  DEDExtensionIdentifier *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  DEDExtensionIdentifier *v35;
  id v36;
  id v37;
  BOOL v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  Log_0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v40 = "-[DEDDaemon _startDiagnosticWithIdentifier:parameters:session:runSetup:]";
    v41 = 2114;
    v42 = v12;
    v43 = 2114;
    v44 = v10;
    _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}s] [%{public}@] [%{public}@]", buf, 0x20u);
  }

  +[DEDAnalytics didStartExtensionWithIdentifier:](DEDAnalytics, "didStartExtensionWithIdentifier:", v10);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-collect-%@-%@"), v12, v10);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "UTF8String");
  v16 = (void *)os_transaction_create();
  v17 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v10);
  v18 = (void *)MEMORY[0x24BDD1478];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke;
  v29[3] = &unk_24D1E5058;
  v19 = v16;
  v30 = v19;
  v28 = v15;
  v31 = v28;
  objc_copyWeak(&v37, (id *)buf);
  v20 = v12;
  v32 = v20;
  v21 = v10;
  v33 = v21;
  v22 = v11;
  v34 = v22;
  v38 = a6;
  v23 = v17;
  v35 = v23;
  v24 = v14;
  v36 = v24;
  objc_msgSend(v18, "blockOperationWithBlock:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("collect(%@-%@)"), v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setName:", v26);

  -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOperation:", v25);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BYTE *v52;
  char v53;
  uint8_t v54[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForIdentifier:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(v7, "diagnosticCollector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "extensionForIdentifier:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requiresDataClassBAccessToRun");
  v11 = +[DEDUtils isDataClassBAvailable](DEDUtils, "isDataClassBAvailable");
  Log_0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v11;
    _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_INFO, "[%{public}@] requires Data Class B [%i] is available [%i]", buf, 0x18u);

  }
  v14 = v10 ^ 1 | v11;
  Log_0();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v14 & 1) != 0)
  {
    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_INFO, "starting _startDiagnosticWithIdentifier operation for [%{public}@]", buf, 0xCu);
    }

    if ((objc_msgSend(v6, "shouldCollectDiagnosticWithId:", *(_QWORD *)(a1 + 56)) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy__1;
      v60 = __Block_byref_object_dispose__1;
      v61 = 0;
      v18 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v18, "attachmentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = *(void **)(a1 + 64);
      +[DEDConstants DEDExtensionCompressOnAttach](DEDConstants, "DEDExtensionCompressOnAttach");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v21);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v19, "setCompressOnAttach:", objc_msgSend(v43, "BOOLValue"));
      }
      if (*(_BYTE *)(a1 + 96))
        objc_msgSend(v8, "prepareItemsWithIdentifier:parameters:session:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 72), "extensionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectItemsWithIdentifier:parameters:", v22, *(_QWORD *)(a1 + 64));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v23, "count"))
      {
        Log_0();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(_QWORD *)(a1 + 48);
          v25 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)v54 = 138543618;
          v55 = v25;
          v56 = 2114;
          v57 = v26;
          _os_log_impl(&dword_21469E000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ returned no files for bug session %{public}@", v54, 0x16u);
        }

        v27 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 80));
        +[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:](DEDAnalytics, "extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:", v27, 0, 0, (unint64_t)v29, 3);

      }
      objc_msgSend(v6, "diskAccessQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_74;
      block[3] = &unk_24D1E5030;
      v45 = v8;
      v46 = *(id *)(a1 + 72);
      v47 = *(id *)(a1 + 56);
      v48 = *(id *)(a1 + 64);
      v42 = v23;
      v49 = v42;
      v41 = v19;
      v50 = v41;
      v31 = *(id *)(a1 + 48);
      v53 = v10;
      v51 = v31;
      v52 = buf;
      dispatch_sync(v30, block);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject timeIntervalSinceDate:](v32, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 80));
        v34 = v33;
        v35 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "attachmentItems");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "totalFileSize");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:](DEDAnalytics, "extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:", v35, v37, objc_msgSend(v38, "unsignedIntegerValue"), (unint64_t)v34, 0);

        objc_msgSend(v6, "finishedDiagnosticWithIdentifier:result:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }
      else
      {
        Log_0();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_cold_1(v32);
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      Log_0();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v40;
        _os_log_impl(&dword_21469E000, v39, OS_LOG_TYPE_DEFAULT, "Aborting collection of [%{public}@]", buf, 0xCu);
      }

      objc_msgSend(v6, "didTerminateDiagnosticExtension:info:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_INFO, "Data Class B is required and not available.", buf, 2u);
    }

    objc_msgSend(v6, "scheduleDiagnosticCollectionForClassBAccessWithIdentifier:parameters:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_74(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  +[DEDDevice currentDevice](DEDDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (!v6)
    v7 = *(void **)(a1 + 48);
  v8 = v7;

  v9 = *(void **)(a1 + 56);
  +[DEDConstants DEDAddEmptyFile](DEDConstants, "DEDAddEmptyFile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = *(void **)(a1 + 56);
    +[DEDConstants DEDAddEmptyFile](DEDConstants, "DEDAddEmptyFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue") ^ 1;

  }
  else
  {
    v15 = 1;
  }

  v16 = objc_msgSend(*(id *)(a1 + 64), "count");
  v17 = *(void **)(a1 + 72);
  if (v16 || (v15 & 1) != 0)
  {
    objc_msgSend(v17, "processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v17, "createEmptyMessageFileForDE:extensionName:withSessionIdentifier:device:", *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 80), v2);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  objc_msgSend(MEMORY[0x24BE2C980], "createWithName:rootURL:", v8, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "extensionIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDAttachmentGroup groupWithDEGroup:identifier:](DEDAttachmentGroup, "groupWithDEGroup:identifier:", v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  objc_msgSend(v2, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setDeviceID:", v25);

  objc_msgSend(*(id *)(a1 + 32), "cleanupItemsWithIdentifier:parameters:session:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
  Log_0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "rootURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "attachmentItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543874;
    v34 = v27;
    v35 = 2114;
    v36 = v28;
    v37 = 2048;
    v38 = objc_msgSend(v29, "count");
    _os_log_impl(&dword_21469E000, v26, OS_LOG_TYPE_INFO, "[%{public}@] attached ded group [%{public}@] with item count %lu", (uint8_t *)&v33, 0x20u);

  }
  Log_0();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *(_QWORD *)(a1 + 48);
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v33 = 138543618;
    v34 = v31;
    v35 = 2114;
    v36 = v32;
    _os_log_impl(&dword_21469E000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ attached ded group %{public}@", (uint8_t *)&v33, 0x16u);
  }

}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _BYTE location[12];
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[DEDDaemon terminateExtension:info:session:]";
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", location, 0x2Au);
  }

  objc_initWeak((id *)location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-terminate-%@"), v8);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = (void *)os_transaction_create();
  v14 = (void *)MEMORY[0x24BDD1478];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__DEDDaemon_terminateExtension_info_session___block_invoke;
  v22[3] = &unk_24D1E5080;
  v15 = v13;
  v23 = v15;
  v16 = v8;
  v24 = v16;
  objc_copyWeak(&v27, (id *)location);
  v17 = v10;
  v25 = v17;
  v18 = v9;
  v26 = v18;
  objc_msgSend(v14, "blockOperationWithBlock:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("terminate(%@-%@)"), v17, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", v20);

  -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v19);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);

}

void __45__DEDDaemon_terminateExtension_info_session___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "starting _terminateExtension operation for [%{public}@]", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "attachmentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionForIdentifier:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isRunningDE:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "DE collection has not finished will defer removal", buf, 2u);
    }

  }
  else if (v8)
  {
    objc_msgSend(v8, "diskAccessQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__DEDDaemon_terminateExtension_info_session___block_invoke_82;
    block[3] = &unk_24D1E4930;
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    v15 = *(id *)(a1 + 48);
    dispatch_sync(v10, block);

    objc_msgSend(v8, "didTerminateDiagnosticExtension:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    Log_0();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __45__DEDDaemon_terminateExtension_info_session___block_invoke_cold_1();

    objc_msgSend(v5, "removeDEFiles:withSessionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

uint64_t __45__DEDDaemon_terminateExtension_info_session___block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "removing files for DE [%{public}@]", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "removeDEFiles:withSessionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  Log_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DEDDaemon adoptFiles:forSession:].cold.1();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-adopt-%@"), v7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  v10 = (void *)os_transaction_create();
  v11 = (void *)MEMORY[0x24BDD1478];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __35__DEDDaemon_adoptFiles_forSession___block_invoke;
  v21 = &unk_24D1E50A8;
  v12 = v10;
  v22 = v12;
  objc_copyWeak(&v25, &location);
  v13 = v7;
  v23 = v13;
  v14 = v6;
  v24 = v14;
  objc_msgSend(v11, "blockOperationWithBlock:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adopt(%@)"), v13, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", v16);

  -[DEDDaemon userInitiatedOpQueue](self, "userInitiatedOpQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v15);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __35__DEDDaemon_adoptFiles_forSession___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFString *v31;
  uint64_t v32;
  uint8_t v33[4];
  uint64_t v34;
  NSObject *v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "attachmentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCompressOnAttach:", 0);
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionForIdentifier:", *(_QWORD *)(a1 + 40));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = a1;
  obj = *(id *)(a1 + 48);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "identifierForAdoptingFile:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE2C988]), "initWithPathURL:", v12);
          v35 = v14;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:", v15, *(_QWORD *)(v7 + 40), v13, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(MEMORY[0x24BE2C980], "createWithName:rootURL:", v13, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[DEDAttachmentGroup groupWithDEGroup:identifier:](DEDAttachmentGroup, "groupWithDEGroup:identifier:", v17, v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "didAdoptGroup:", v18);

          }
          else
          {
            Log_0();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __35__DEDDaemon_adoptFiles_forSession___block_invoke_cold_1(v33, v12, &v34, v19);

            objc_msgSend(v24, "addObject:", v12);
          }

        }
        else
        {
          Log_0();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v12;
            _os_log_error_impl(&dword_21469E000, v14, OS_LOG_TYPE_ERROR, "Could not build identifier for adopted file [%{public}@]", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v24, "count"))
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *(_QWORD *)(v7 + 48);
    v31 = CFSTR("failed");
    v32 = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("DEDErrorDomain"), 100, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v25, "didAdoptFilesWithError:", v23);

}

- (void)commitSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDDaemon controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("finish(%@)"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "operations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __27__DEDDaemon_commitSession___block_invoke;
    v25[3] = &unk_24D1E50D0;
    v11 = v7;
    v26 = v11;
    objc_msgSend(v9, "ded_findWithBlock:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      Log_0();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v4;
        v14 = "Already finishing [%{public}@]";
LABEL_11:
        _os_log_impl(&dword_21469E000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      }
    }
    else if ((objc_msgSend(v6, "readyToFinish") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-commits-%@"), v4);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[NSObject UTF8String](v13, "UTF8String");
      v15 = (void *)os_transaction_create();
      objc_initWeak((id *)buf, self);
      v16 = (void *)MEMORY[0x24BDD1478];
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __27__DEDDaemon_commitSession___block_invoke_101;
      v20[3] = &unk_24D1E5120;
      v17 = v15;
      v21 = v17;
      v22 = v4;
      v23 = v6;
      objc_copyWeak(&v24, (id *)buf);
      objc_msgSend(v16, "blockOperationWithBlock:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setName:", v11);
      -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addOperation:", v18);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      Log_0();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v4;
        v14 = "Not ready to finish [%{public}@]";
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v4;
    _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Session is nil for identifier [%{public}@]. Cannot commit", buf, 0xCu);
  }
LABEL_13:

}

uint64_t __27__DEDDaemon_commitSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __27__DEDDaemon_commitSession___block_invoke_101(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD handler[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    *(_DWORD *)buf = 138543362;
    v44 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Starting commit operation for [%{public}@]", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  objc_msgSend(a1[6], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "directoryForBugSessionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "_extensionsForSession:", a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v9, "attachmentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "extensionsWithFilesAttachedToSessionWithID:allExtensions:", a1[5], v8);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "requiresDataClassBAccessToRun") & 1) != 0)
        {
          v16 = 0;
          goto LABEL_13;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_13:

  v17 = +[DEDUtils isDataClassBAvailable](DEDUtils, "isDataClassBAvailable");
  Log_0();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v16 & 1) != 0 || v17)
  {
    if (v19)
    {
      v25 = a1[5];
      *(_DWORD *)buf = 138543362;
      v44 = v25;
      _os_log_impl(&dword_21469E000, v18, OS_LOG_TYPE_DEFAULT, "Calling finisher for [%{public}@]", buf, 0xCu);
    }

    objc_msgSend(a1[6], "finisher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a1[6];
    objc_msgSend(v27, "config");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "finishSession:withConfiguration:", v27, v28);

    Log_0();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = a1[5];
      *(_DWORD *)buf = 138543362;
      v44 = v30;
      _os_log_impl(&dword_21469E000, v29, OS_LOG_TYPE_DEFAULT, "Did call finisher for [%{public}@]", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE2C9A0], "findAllfiles:", v6);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(MEMORY[0x24BE2C9A0], "getDirectorySize:", v6);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setUploadStartTime:", v32);

    v33 = objc_msgSend(v24, "count");
    objc_msgSend(a1[6], "config");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[DEDAnalytics finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:](DEDAnalytics, "finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:", v33, v31, objc_msgSend(v34, "finishingMove"));

    objc_msgSend(a1[6], "didCommit");
  }
  else
  {
    if (v19)
    {
      v20 = a1[5];
      *(_DWORD *)buf = 138543362;
      v44 = v20;
      _os_log_impl(&dword_21469E000, v18, OS_LOG_TYPE_DEFAULT, "Device is locked while finishing session that requires access to Class B data [%{public}@]", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd.commit-%@"), a1[5]);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    v23 = (void *)*MEMORY[0x24BDAC5A0];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __27__DEDDaemon_commitSession___block_invoke_105;
    handler[3] = &unk_24D1E50F8;
    v36 = v21;
    v37 = a1[5];
    v24 = v21;
    xpc_activity_register(v22, v23, handler);

  }
}

void __27__DEDDaemon_commitSession___block_invoke_105(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  xpc_activity_state_t v5;
  NSObject *v6;
  xpc_activity_state_t v7;
  NSObject *v8;
  NSObject *v9;
  xpc_activity_state_t v10;
  uint64_t v11;
  int v12;
  xpc_activity_state_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_21469E000, v9, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_RUN [%{public}@]", (uint8_t *)&v12, 0xCu);
    }

    +[DEDDaemon sharedInstance](DEDDaemon, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject commitSession:](v8, "commitSession:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = state;
    if (state)
    {
      Log_0();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = 134218242;
        v13 = v5;
        v14 = 2114;
        v15 = v11;
        _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "[%lu] not handled for activity [%{public}@]", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      Log_0();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_CHECK_IN [%{public}@]", (uint8_t *)&v12, 0xCu);
      }

      v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6B8], 0);
      xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x24BDAC6C8], 1);
      xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
      xpc_activity_set_criteria(v3, v8);
    }
  }

}

- (void)cancelSession:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  Log_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[DEDDaemon cancelSession:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDDaemon controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  Log_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_21469E000, v7, OS_LOG_TYPE_DEFAULT, "Daemon received notification request for bug session: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (objc_msgSend(v6, "readyToNotify"))
  {
    Log_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21469E000, v8, OS_LOG_TYPE_DEFAULT, "Ready to notify user", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(v6, "presentNotificationOnFilingDevice");
  }

}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DEDDaemon controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionForIdentifier:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clearNotificationOnFilingDevice");
}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEDDaemon controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionForIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-send-data-%@-%@"), v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v15);
  objc_msgSend(v16, "UTF8String");
  v17 = (void *)os_transaction_create();
  v18 = (void *)MEMORY[0x24BDD1478];
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __52__DEDDaemon_addSessionData_withFilename_forSession___block_invoke;
  v31 = &unk_24D1E5148;
  v19 = v17;
  v32 = v19;
  v20 = v12;
  v33 = v20;
  v21 = v8;
  v34 = v21;
  v22 = v9;
  v35 = v22;
  objc_msgSend(v18, "blockOperationWithBlock:", &v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v20, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("send-data(%@-%@)"), v10, v25, v28, v29, v30, v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setName:", v26);
  -[DEDDaemon backgroundOpQueue](self, "backgroundOpQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOperation:", v23);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

}

uint64_t __52__DEDDaemon_addSessionData_withFilename_forSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_addSessionData:filename:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)getSessionStateWithSession:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-get-status-%@"), v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  v6 = (void *)os_transaction_create();
  v7 = (void *)MEMORY[0x24BDD1478];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __40__DEDDaemon_getSessionStateWithSession___block_invoke;
  v17 = &unk_24D1E5008;
  v8 = v6;
  v18 = v8;
  v9 = v5;
  v19 = v9;
  objc_copyWeak(&v21, &location);
  v10 = v4;
  v20 = v10;
  objc_msgSend(v7, "blockOperationWithBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("getState(%@)"), v10, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", v12);

  -[DEDDaemon userInitiatedOpQueue](self, "userInitiatedOpQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v11);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;
  id v5;
  id v6;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__DEDDaemon_getSessionStateWithSession___block_invoke_2;
  v2[3] = &unk_24D1E5008;
  v3 = a1[4];
  v4 = a1[5];
  objc_copyWeak(&v6, a1 + 7);
  v5 = a1[6];
  _os_activity_initiate(&dword_21469E000, "Getting session state", OS_ACTIVITY_FLAG_DEFAULT, v2);

  objc_destroyWeak(&v6);
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  DEDSessionStateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v16 = 138543362;
    v17 = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", (uint8_t *)&v16, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v6 = (uint64_t *)(a1 + 48);
  objc_msgSend(v5, "sessionForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  DEDSessionStateLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_3();

    objc_msgSend(v8, "stateInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "state");
    DEDSessionStateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *v6;
      if ((unint64_t)(v11 + 1) > 9)
        v14 = "Unknown";
      else
        v14 = off_24D1E5228[v11 + 1];
      v16 = 138543618;
      v17 = v13;
      v18 = 2082;
      v19 = v14;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "Did get session state for session [%{public}@], state [%{public}s]", (uint8_t *)&v16, 0x16u);
    }

    DEDSessionStateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_2();

    objc_msgSend(v8, "didGetState:info:", v11, v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_1();
  }

}

- (void)getSessionStatusWithSession:(id)a3
{
  -[DEDDaemon _syncSessionStatusWithSessionID:withIdentifiers:](self, "_syncSessionStatusWithSessionID:withIdentifiers:", a3, 0);
}

- (void)syncSessionStatusWithSession:(id)a3
{
  -[DEDDaemon _syncSessionStatusWithSessionID:withIdentifiers:](self, "_syncSessionStatusWithSessionID:withIdentifiers:", a3, 1);
}

- (void)_syncSessionStatusWithSessionID:(id)a3 withIdentifiers:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  -[DEDDaemon controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEDDaemon _syncSessionStatusWithSession:withIdentifiers:](self, "_syncSessionStatusWithSession:withIdentifiers:", v8, v4);
  }
  else
  {
    Log_0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DEDDaemon _syncSessionStatusWithSessionID:withIdentifiers:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)_syncSessionStatusWithSession:(id)a3 withIdentifiers:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-status-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();
  v13 = (void *)MEMORY[0x24BDD1478];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke;
  v22[3] = &unk_24D1E51E8;
  v14 = v12;
  v23 = v14;
  v15 = v6;
  v24 = v15;
  objc_copyWeak(&v26, &location);
  v16 = v7;
  v25 = v16;
  v27 = a4;
  objc_msgSend(v13, "blockOperationWithBlock:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v15, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("getStatus(%@)"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setName:", v20);

  -[DEDDaemon userInitiatedOpQueue](self, "userInitiatedOpQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v17);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *queue;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  __int128 *p_buf;
  uint8_t v51[128];
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  Log_0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21469E000, v2, OS_LOG_TYPE_INFO, "starting _syncSessionStatusWithSession operation for session [%{public}@]", (uint8_t *)&buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "attachmentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "knownExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || !objc_msgSend(v7, "count"))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v8, "diagnosticCollector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "availableDiagnosticExtensions");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(*(id *)(a1 + 40), "diskAccessQueue");
  queue = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1;
  v55 = __Block_byref_object_dispose__1;
  v11 = MEMORY[0x24BDAC760];
  v56 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_118;
  block[3] = &unk_24D1E5170;
  p_buf = &buf;
  v31 = v5;
  v47 = v31;
  v48 = *(id *)(a1 + 48);
  v34 = v7;
  v49 = v34;
  dispatch_sync(queue, block);
  v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v44[0] = v11;
  v44[1] = 3221225472;
  v44[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_2;
  v44[3] = &unk_24D1E4490;
  v45 = *(id *)(a1 + 40);
  objc_msgSend(v12, "ded_rejectItemsPassingTest:", v44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ongoingExtensionCollectionOperations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scheduledDeferredExtensionCollectionOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") || objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v34, "count"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = v34;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v20, v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v17);
    }

  }
  else
  {
    v15 = 0;
  }
  if (objc_msgSend(v13, "count"))
  {
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_3;
    v38[3] = &unk_24D1E5198;
    v39 = v15;
    objc_msgSend(v13, "ded_mapWithBlock:", v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }
  if (objc_msgSend(v14, "count"))
  {
    +[DEDDeferredExtensionInfo allInfo](DEDDeferredExtensionInfo, "allInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_4;
    v35[3] = &unk_24D1E51C0;
    v24 = v23;
    v36 = v24;
    v37 = v15;
    objc_msgSend(v14, "ded_mapWithBlock:", v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v26;
  }
  Log_0();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_cold_1((uint64_t)v33, (uint64_t)v22, v27);

  v28 = *(unsigned __int8 *)(a1 + 64);
  v29 = *(void **)(a1 + 40);
  if (v28)
  {
    objc_msgSend(v29, "allExtensionIdentifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hasCollected:isCollecting:identifiers:", v33, v22, v30);

  }
  else
  {
    objc_msgSend(v29, "hasCollected:isCollecting:", v33, v22);
  }

  _Block_object_dispose(&buf, 8);
}

void __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "collectedGroupsWithSessionIdentifier:matchingExtensions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(a2, "extensionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "isRunningDE:", v3);
  v5 = v4 | objc_msgSend(*(id *)(a1 + 32), "shouldCollectDiagnosticWithId:", v3) ^ 1;

  return v5;
}

id __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  DEDExtensionIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v3);

  v5 = *(void **)(a1 + 32);
  -[DEDExtensionIdentifier extensionIdentifier](v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setDedExtensionIdentifier:", v4);
  return v8;
}

id __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setDedExtensionIdentifier:", v4);
  return v8;
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[DEDDaemon loadTextDataForExtensions:localization:sessionID:]";
    v33 = 2112;
    v34 = v22;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_debug_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEBUG, "%s %@, $@, %@, %@", location, 0x2Au);

  }
  objc_initWeak((id *)location, self);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.diagnosticextensionsd-load-extension-text-%@"), v10);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = (void *)os_transaction_create();
  v14 = (void *)MEMORY[0x24BDD1478];
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __62__DEDDaemon_loadTextDataForExtensions_localization_sessionID___block_invoke;
  v26 = &unk_24D1E5080;
  v15 = v13;
  v27 = v15;
  v16 = v8;
  v28 = v16;
  objc_copyWeak(&v31, (id *)location);
  v17 = v9;
  v29 = v17;
  v18 = v10;
  v30 = v18;
  objc_msgSend(v14, "blockOperationWithBlock:", &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("loadExtensionText(%@)"), v18, v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", v20);

  -[DEDDaemon userInitiatedOpQueue](self, "userInitiatedOpQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v19);

  if (-[DEDDaemon observesOperations](self, "observesOperations"))
    -[DEDDaemon _logOperations](self, "_logOperations");

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)location);

}

void __62__DEDDaemon_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "diagnosticCollector", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loadExtensionTextDataInExtension:localization:", v7, *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v10 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v10, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionForIdentifier:", *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "didLoadTextDataForExtensions:localization:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)diagnosticCollector
{
  void *v3;
  DEDDiagnosticCollector *v4;

  -[DEDDaemon _diagnosticCollector](self, "_diagnosticCollector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(DEDDiagnosticCollector);
    -[DEDDaemon set_diagnosticCollector:](self, "set_diagnosticCollector:", v4);

  }
  return -[DEDDaemon _diagnosticCollector](self, "_diagnosticCollector");
}

- (id)attachmentHandler
{
  return objc_alloc_init(DEDAttachmentHandler);
}

- (id)_controller
{
  return objc_alloc_init(DEDController);
}

- (BOOL)observesOperations
{
  return 1;
}

- (void)_streamOperationStatus
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__DEDDaemon__streamOperationStatus__block_invoke;
  block[3] = &unk_24D1E4600;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __35__DEDDaemon__streamOperationStatus__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_logOperations");
  return objc_msgSend(*(id *)(a1 + 32), "_streamOperationStatus");
}

- (void)_logOperations
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "backgroundOpQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "backgroundOpQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v5;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13(&dword_21469E000, v3, v9, "%@ operations %@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_4_0();
}

void __27__DEDDaemon__logOperations__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "config");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = os_log_create((const char *)objc_msgSend(v3, "loggingSubsystem"), "ded-op-watch");
  v2 = (void *)_logOperations_opDebugLog;
  _logOperations_opDebugLog = (uint64_t)v1;

}

- (DEDConfiguration)config
{
  return (DEDConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSOperationQueue)backgroundOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundOpQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSOperationQueue)userInitiatedOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserInitiatedOpQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)embeddedInApp
{
  return self->_embeddedInApp;
}

- (void)setEmbeddedInApp:(BOOL)a3
{
  self->_embeddedInApp = a3;
}

- (NSArray)cachedExtensionsForThisDevice
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedExtensionsForThisDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (DEDDiagnosticCollector)_diagnosticCollector
{
  return (DEDDiagnosticCollector *)objc_getProperty(self, a2, 48, 1);
}

- (void)set_diagnosticCollector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (DEDController)controller
{
  return (DEDController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->__diagnosticCollector, 0);
  objc_storeStrong((id *)&self->_cachedExtensionsForThisDevice, 0);
  objc_storeStrong((id *)&self->_userInitiatedOpQueue, 0);
  objc_storeStrong((id *)&self->_backgroundOpQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setupDeferredDiagnosticsWithExtensionInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bugSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "-[DEDDaemon setupDeferredDiagnosticsWithExtensionInfo:]";
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  _os_log_debug_impl(&dword_21469E000, a2, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v8, 0x2Au);

}

- (void)pingSession:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21469E000, log, OS_LOG_TYPE_DEBUG, "... daemon does work here, then responds back through bug session ...", v1, 2u);
}

- (void)startDiagnosticWithIdentifier:parameters:deferRunUntil:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DEDDaemon startDiagnosticWithIdentifier:parameters:deferRunUntil:session:]";
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13(&dword_21469E000, v0, v1, "%s %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21469E000, log, OS_LOG_TYPE_FAULT, "could not crate ded group", v1, 2u);
}

void __45__DEDDaemon_terminateExtension_info_session___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "_terminateExtension called while session is nil for identifier [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)adoptFiles:forSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[DEDDaemon adoptFiles:forSession:]";
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13(&dword_21469E000, v0, v1, "%s %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __35__DEDDaemon_adoptFiles_forSession___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_21469E000, a4, OS_LOG_TYPE_ERROR, "Could not copy adopted file: %@", a1, 0xCu);

}

- (void)cancelSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a1, a3, "This class should not receive [%{public}s]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "No session for session id [%{public}@]. Cannot sync state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_21469E000, v1, (uint64_t)v1, "Session [%{public}@], state info [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "Getting session state for session [%{public}@]", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_syncSessionStatusWithSessionID:(uint64_t)a3 withIdentifiers:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "No session for session id [%{public}@]. Cannot sync status", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_13(&dword_21469E000, a3, (uint64_t)a3, "has collected %@ ongoing %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
