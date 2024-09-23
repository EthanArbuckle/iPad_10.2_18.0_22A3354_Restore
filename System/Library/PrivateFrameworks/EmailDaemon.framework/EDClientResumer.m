@implementation EDClientResumer

- (EDClientResumer)initWithClientBundleIdentifier:(id)a3 hookRegistry:(id)a4 clientState:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDClientResumer *v11;
  uint64_t v12;
  NSString *bundleID;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  EFScheduler *scheduler;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EDClientResumer;
  v11 = -[EDClientResumer init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_clientState, a5);
    objc_storeStrong((id *)&v11->_hookRegistry, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.maild.EDClientResumer", v14);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0D1F070], "dispatchQueueSchedulerWithQueue:", v11->_queue);
    v17 = objc_claimAutoreleasedReturnValue();
    scheduler = v11->_scheduler;
    v11->_scheduler = (EFScheduler *)v17;

    EFRegisterContentProtectionObserver();
    -[EDPersistenceHookRegistry registerProtectedDataReconciliationHookResponder:](v11->_hookRegistry, "registerProtectedDataReconciliationHookResponder:", v11);
  }

  return v11;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__EDClientResumer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_18 != -1)
    dispatch_once(&log_onceToken_18, block);
  return (id)log_log_18;
}

void __22__EDClientResumer_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_18;
  log_log_18 = (uint64_t)v1;

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EDClientResumer_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1)
    dispatch_once(&signpostLog_onceToken, block);
  return (id)signpostLog_log;
}

void __30__EDClientResumer_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  EFUnregisterContentProtectionObserver();
  v3.receiver = self;
  v3.super_class = (Class)EDClientResumer;
  -[EDClientResumer dealloc](&v3, sel_dealloc);
}

- (void)resumeForUpdates
{
  NSObject *v3;
  NSString *bundleID;
  const char *v5;
  char v6;
  _BOOL4 v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((-[EDClientStateReporting isForeground](self->_clientState, "isForeground") & 1) != 0
    || -[EDClientStateReporting isRunningTests](self->_clientState, "isRunningTests"))
  {
    +[EDClientResumer log](EDClientResumer, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = bundleID;
      v5 = "resumeForUpdates - Not Resuming client because device is either in foreground already or running PPT tests: %{public}@";
LABEL_5:
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    }
  }
  else
  {
    v6 = EFProtectedDataAvailable();
    +[EDClientResumer log](EDClientResumer, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if ((v6 & 1) == 0)
    {
      if (!v7)
        goto LABEL_12;
      v13 = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      v5 = "resumeForUpdates - Not Resuming client because device is locked: %{public}@";
      goto LABEL_5;
    }
    if (v7)
    {
      v8 = self->_bundleID;
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "resumeForUpdates - Resuming client: %{public}@", buf, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E0D23158];
    v15 = *MEMORY[0x1E0D22D00];
    v16 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "optionsWithDictionary:", v10);
    v3 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_bundleID;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __35__EDClientResumer_resumeForUpdates__block_invoke;
    v14[3] = &unk_1E949BCE0;
    v14[4] = self;
    objc_msgSend(v11, "openApplication:withOptions:completion:", v12, v3, v14);

  }
LABEL_12:

}

void __35__EDClientResumer_resumeForUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[EDClientResumer log](EDClientResumer, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Resumed process:%@", buf, 0xCu);
    }

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__EDClientResumer_resumeForUpdates__block_invoke_11;
    v13[3] = &unk_1E949B6D0;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    objc_msgSend(v8, "performBlock:", v13);
    v11 = v14;
  }
  else
  {
    +[EDClientResumer log](EDClientResumer, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __35__EDClientResumer_resumeForUpdates__block_invoke_cold_1(v12, buf, v11);
    }
  }

}

void __35__EDClientResumer_resumeForUpdates__block_invoke_11(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:", objc_msgSend(*(id *)(a1 + 32), "pid"), 35, 4, CFSTR("ClientResumeAssertion"));
  +[EDClientResumer signpostLog](EDClientResumer, "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  if (objc_msgSend(v2, "acquire"))
  {
    +[EDClientResumer log](EDClientResumer, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = CFSTR("ClientResumeAssertion");
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Acquired BKSProcessAssertion: %{public}@", buf, 0xCu);
    }

    +[EDClientResumer signpostLog](EDClientResumer, "signpostLog");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v8 = *(const __CFString **)(*(_QWORD *)(a1 + 40) + 8);
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "BKSProcessAssertion", "Start BKSProcessAssertion for %{public}@", buf, 0xCu);
    }

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__EDClientResumer_resumeForUpdates__block_invoke_13;
    v13[3] = &unk_1E949BCB8;
    v10 = v2;
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v15 = v11;
    v16 = v4;
    v12 = (id)objc_msgSend(v9, "afterDelay:performBlock:", v13, 5.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "invalidate");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v2);

  }
}

void __35__EDClientResumer_resumeForUpdates__block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 16);
  if (v3 == *(void **)(a1 + 32))
  {
    *(_QWORD *)(v2 + 16) = 0;

  }
  +[EDClientResumer log](EDClientResumer, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = CFSTR("ClientResumeAssertion");
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated BKSProcessAssertion: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  +[EDClientResumer signpostLog](EDClientResumer, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(const __CFString **)(*(_QWORD *)(a1 + 40) + 8);
    v9 = 138543362;
    v10 = v8;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v6, OS_SIGNPOST_INTERVAL_END, v7, "BKSProcessAssertion", "End BKSProcessAssertion for %{public}@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)invalidate
{
  NSObject *v3;
  NSString *bundleID;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EDClientResumer log](EDClientResumer, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->_bundleID;
    v5 = 138543362;
    v6 = bundleID;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating EDobserverResumer:%{public}@", (uint8_t *)&v5, 0xCu);
  }

  EFUnregisterContentProtectionObserver();
  -[EDPersistenceHookRegistry unregisterHookResponder:](self->_hookRegistry, "unregisterHookResponder:", self);
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v6;
  BKSProcessAssertion *assertion;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) <= 1 && self->_assertion != 0)
  {
    +[EDClientResumer log](EDClientResumer, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = CFSTR("ClientResumeAssertion");
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Releasing BKSProcessAssertion as device is locking/locked: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[BKSProcessAssertion invalidate](self->_assertion, "invalidate");
    assertion = self->_assertion;
    self->_assertion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

void __35__EDClientResumer_resumeForUpdates__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Resumed process failed with error %{public}@", buf, 0xCu);

}

@end
