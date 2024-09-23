@implementation EDSearchableIndexDiagnosticsController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__EDSearchableIndexDiagnosticsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_76 != -1)
    dispatch_once(&log_onceToken_76, block);
  return (OS_os_log *)(id)log_log_76;
}

void __45__EDSearchableIndexDiagnosticsController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_76;
  log_log_76 = (uint64_t)v1;

}

- (EDSearchableIndexDiagnosticsController)initWithPersistence:(id)a3
{
  id v4;
  EDSearchableIndexDiagnosticsController *v5;
  EDSearchableIndexDiagnosticsController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDSearchableIndexDiagnosticsController;
  v5 = -[EDSearchableIndexDiagnosticsController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_persistence, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[EDSearchableIndexDiagnosticsController _stopCollection](self, "_stopCollection");
  v3.receiver = self;
  v3.super_class = (Class)EDSearchableIndexDiagnosticsController;
  -[EDSearchableIndexDiagnosticsController dealloc](&v3, sel_dealloc);
}

- (void)scheduleRecurringActivity
{
  NSObject *v3;
  uint8_t v4[16];

  +[EDSearchableIndexDiagnosticsController log](EDSearchableIndexDiagnosticsController, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Starting background collection of indexing diagnostics", v4, 2u);
  }

  -[EDSearchableIndexDiagnosticsController _startLoggingDebuggingDiagnostics](self, "_startLoggingDebuggingDiagnostics");
  -[EDSearchableIndexDiagnosticsController _registerDebuggingDiagnosticsCaptureHandler](self, "_registerDebuggingDiagnosticsCaptureHandler");
}

- (void)_stopCollection
{
  NSObject *v3;
  uint8_t v4[16];

  +[EDSearchableIndexDiagnosticsController log](EDSearchableIndexDiagnosticsController, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Stopping background collection of indexing diagnostics", v4, 2u);
  }

  -[EDSearchableIndexDiagnosticsController _unregisterDebuggingDiagnosticsCaptureHandler](self, "_unregisterDebuggingDiagnosticsCaptureHandler");
  -[EDSearchableIndexDiagnosticsController _stopLoggingDebuggingDiagnostics](self, "_stopLoggingDebuggingDiagnostics");
}

- (id)_localDiagnosticsFromStatistics:(id)a3
{
  id v3;
  EDSearchableIndexDiagnosticsSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  EDSearchableIndexDiagnosticsSnapshot *v8;

  v3 = a3;
  v4 = [EDSearchableIndexDiagnosticsSnapshot alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DEF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DF50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDSearchableIndexDiagnosticsSnapshot initWithDate:indexableMessages:messagesIndexed:turboMode:](v4, "initWithDate:indexableMessages:messagesIndexed:turboMode:", v5, v6, v7, +[EDSearchableIndexScheduler isTurboModeIndexingEnabled](EDSearchableIndexScheduler, "isTurboModeIndexingEnabled"));

  return v8;
}

- (id)_remoteDiagnosticsFromStatistics:(id)a3
{
  id v3;
  EDSearchableIndexDiagnosticsSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  EDSearchableIndexDiagnosticsSnapshot *v8;

  v3 = a3;
  v4 = [EDSearchableIndexDiagnosticsSnapshot alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DF00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DF90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDSearchableIndexDiagnosticsSnapshot initWithDate:indexableMessages:messagesIndexed:turboMode:](v4, "initWithDate:indexableMessages:messagesIndexed:turboMode:", v5, v6, v7, 0);

  return v8;
}

- (void)_logDebuggingDiagnostics:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1D824B334]();
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithArray:", v9);

  if ((unint64_t)objc_msgSend(v10, "count") >= 0x151)
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
  objc_msgSend(v14, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v12, "setObject:forKey:", v13, v5);

  objc_autoreleasePoolPop(v6);
}

- (void)_startLoggingDebuggingDiagnostics
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if ((v4 & 1) != 0)
  {
    -[EDSearchableIndexDiagnosticsController indexingDiagnosticsScheduler](self, "indexingDiagnosticsScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", CFSTR("com.apple.mail.searchableIndex.indexingDiagnosticsCollector"));
      objc_msgSend(v5, "setQualityOfService:", 9);
      objc_msgSend(v5, "setRepeats:", 1);
      objc_msgSend(v5, "setInterval:", 1800.0);
      objc_msgSend(v5, "setTolerance:", 300.0);
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __75__EDSearchableIndexDiagnosticsController__startLoggingDebuggingDiagnostics__block_invoke;
      v9 = &unk_1E949CA58;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "scheduleWithBlock:", &v6);
      -[EDSearchableIndexDiagnosticsController setIndexingDiagnosticsScheduler:](self, "setIndexingDiagnosticsScheduler:", v5, v6, v7, v8, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

void __75__EDSearchableIndexDiagnosticsController__startLoggingDebuggingDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, uint64_t);

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchableIndexStatistics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "_localDiagnosticsFromStatistics:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_logDebuggingDiagnostics:forKey:", v7, CFSTR("InternalIndexingDiagnostics"));

      objc_msgSend(v4, "_remoteDiagnosticsFromStatistics:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_logDebuggingDiagnostics:forKey:", v8, CFSTR("InternalRemoteIndexingDiagnostics"));

    }
    v9[2](v9, 1);

  }
}

- (void)_registerDebuggingDiagnosticsCaptureHandler
{
  void *v3;
  void *v4;

  EFLogRegisterStateCaptureBlock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexDiagnosticsController setStateCancelable:](self, "setStateCancelable:", v3);

  EFLogRegisterStateCaptureBlock();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexDiagnosticsController setStateCancelable:](self, "setStateCancelable:", v4);

}

id __85__EDSearchableIndexDiagnosticsController__registerDebuggingDiagnosticsCaptureHandler__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("InternalIndexingDiagnostics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("InternalIndexingDiagnostics"));

  v3 = (void *)objc_msgSend(v0, "copy");
  return v3;
}

id __85__EDSearchableIndexDiagnosticsController__registerDebuggingDiagnosticsCaptureHandler__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("InternalRemoteIndexingDiagnostics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("InternalRemoteIndexingDiagnostics"));

  v3 = (void *)objc_msgSend(v0, "copy");
  return v3;
}

- (void)_stopLoggingDebuggingDiagnostics
{
  id v2;

  -[EDSearchableIndexDiagnosticsController indexingDiagnosticsScheduler](self, "indexingDiagnosticsScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_unregisterDebuggingDiagnosticsCaptureHandler
{
  void *v3;

  -[EDSearchableIndexDiagnosticsController stateCancelable](self, "stateCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[EDSearchableIndexDiagnosticsController setStateCancelable:](self, "setStateCancelable:", 0);
}

- (EFCancelable)stateCancelable
{
  return self->_stateCancelable;
}

- (void)setStateCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_stateCancelable, a3);
}

- (NSBackgroundActivityScheduler)indexingDiagnosticsScheduler
{
  return self->_indexingDiagnosticsScheduler;
}

- (void)setIndexingDiagnosticsScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_indexingDiagnosticsScheduler, a3);
}

- (EDPersistence)persistence
{
  return (EDPersistence *)objc_loadWeakRetained((id *)&self->_persistence);
}

- (void)setPersistence:(id)a3
{
  objc_storeWeak((id *)&self->_persistence, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_persistence);
  objc_storeStrong((id *)&self->_indexingDiagnosticsScheduler, 0);
  objc_storeStrong((id *)&self->_stateCancelable, 0);
}

@end
