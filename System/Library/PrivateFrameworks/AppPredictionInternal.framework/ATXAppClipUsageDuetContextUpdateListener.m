@implementation ATXAppClipUsageDuetContextUpdateListener

- (void)startListeningWithCallback:(id)a3 clientId:(id)a4
{
  void *v6;
  id appClipUsageHandler;
  id v8;

  v8 = a4;
  v6 = _Block_copy(a3);
  appClipUsageHandler = self->_appClipUsageHandler;
  self->_appClipUsageHandler = v6;

  -[ATXAppClipUsageDuetContextUpdateListener startListeningWithClientId:](self, "startListeningWithClientId:", v8);
}

- (void)startListeningWithClientId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke;
  v15 = &unk_1E82E08E0;
  objc_copyWeak(&v16, &location);
  v6 = _Block_copy(&v12);
  objc_msgSend(CFSTR("com.apple.duetexpertd.ATXAppClipUsageDuetContextUpdateListener"), "stringByAppendingString:", v4, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAppClipLaunch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForChangeAtKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEvaluateOnEveryKeyPathUpdate:", 1);
  objc_msgSend(MEMORY[0x1E0D15C70], "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v7, v10, CFSTR("com.apple.duetexpertd.app-prediction"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCallback:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  ATXAppClipUsageDuetEvent *v7;
  uint64_t v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D15CB8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXAppClipUsageDuetEvent initWithContextValue:]([ATXAppClipUsageDuetEvent alloc], "initWithContextValue:", v6);
    if (v7)
    {
      objc_msgSend(WeakRetained, "appClipUsageHandler");
      v8 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, ATXAppClipUsageDuetEvent *))(v8 + 16))(v8, v7);
    }
    else
    {
      __atxlog_handle_hero();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
        __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke_cold_1((os_log_t)v8);
    }

  }
}

- (id)appClipUsageHandler
{
  return self->_appClipUsageHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appClipUsageHandler, 0);
}

void __71__ATXAppClipUsageDuetContextUpdateListener_startListeningWithClientId___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "Not updating for malformed duet event", v1, 2u);
}

@end
