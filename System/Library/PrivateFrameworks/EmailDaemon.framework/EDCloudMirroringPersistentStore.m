@implementation EDCloudMirroringPersistentStore

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDCloudMirroringPersistentStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1)
    dispatch_once(&log_onceToken_20, block);
  return (OS_os_log *)(id)log_log_20;
}

void __38__EDCloudMirroringPersistentStore_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;

}

- (EDCloudMirroringPersistentStore)init
{
  EDCloudMirroringPersistentStore *v2;
  dispatch_queue_t v3;
  EDTaskScheduler *v4;
  EDTaskScheduler *exportScheduler;
  EDTaskScheduler *v6;
  EDTaskScheduler *importScheduler;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDCloudMirroringPersistentStore;
  v2 = -[EDCloudMirroringPersistentStore init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mail.EDCloudMirroringPersistentStore.schedulers", 0);
    -[EDCloudMirroringPersistentStore _setupCoreDataStack](v2, "_setupCoreDataStack");
    v4 = -[EDTaskScheduler initWithExecutionQueue:]([EDTaskScheduler alloc], "initWithExecutionQueue:", v3);
    exportScheduler = v2->_exportScheduler;
    v2->_exportScheduler = v4;

    -[EDTaskScheduler setObserveForNetworkReachability:](v2->_exportScheduler, "setObserveForNetworkReachability:", 1);
    -[EDTaskScheduler setInitialDelay:](v2->_exportScheduler, "setInitialDelay:", 5.0);
    v6 = -[EDTaskScheduler initWithExecutionQueue:]([EDTaskScheduler alloc], "initWithExecutionQueue:", v3);
    importScheduler = v2->_importScheduler;
    v2->_importScheduler = v6;

    -[EDTaskScheduler setObserveForNetworkReachability:](v2->_importScheduler, "setObserveForNetworkReachability:", 1);
  }
  return v2;
}

- (void)_setupCoreDataStack
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Failed to locate momd bundle in application. %@", (uint8_t *)&v1, 0xCu);
}

void __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke_cold_1(v5, (uint64_t)v6);
    }

  }
}

- (void)performBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[EDCloudMirroringPersistentStore managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__EDCloudMirroringPersistentStore_performBlock___block_invoke;
  v8[3] = &unk_1E949BD50;
  v6 = v4;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

uint64_t __48__EDCloudMirroringPersistentStore_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[EDCloudMirroringPersistentStore managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__EDCloudMirroringPersistentStore_performBlockAndWait___block_invoke;
  v8[3] = &unk_1E949BD50;
  v7 = v4;
  v9 = v5;
  v10 = v7;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

uint64_t __55__EDCloudMirroringPersistentStore_performBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)requestImportWithCompletionBlock:(id)a3
{
  -[EDCloudMirroringPersistentStore _requestWithKind:completionBlock:](self, "_requestWithKind:completionBlock:", 0, a3);
}

- (void)requestExportWithCompletionBlock:(id)a3
{
  -[EDCloudMirroringPersistentStore _requestWithKind:completionBlock:](self, "_requestWithKind:completionBlock:", 1, a3);
}

- (void)_requestWithKind:(int)a3 completionBlock:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;
  id location;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[EDCloudMirroringPersistentStore _schedulerForKind:](self, "_schedulerForKind:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke;
  v12[3] = &unk_1E949BD78;
  objc_copyWeak(&v14, &location);
  v15 = v4;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke_2;
  v10[3] = &unk_1E949BDA0;
  v9 = v13;
  v11 = v9;
  objc_msgSend(v7, "scheduleTask:canceledCallback:", v12, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_executeRequestWithKind:completionBlock:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

uint64_t __68__EDCloudMirroringPersistentStore__requestWithKind_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_schedulerForKind:(int)a3
{
  if (a3)
    -[EDCloudMirroringPersistentStore exportScheduler](self, "exportScheduler");
  else
    -[EDCloudMirroringPersistentStore importScheduler](self, "importScheduler");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_executeRequestWithKind:(int)a3 completionBlock:(id)a4
{
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  int v11;

  v8 = a4;
  -[EDCloudMirroringPersistentStore _wrapCompletion:forRequestKind:](self, "_wrapCompletion:forRequestKind:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke;
  v9[3] = &unk_1E949BDC8;
  v11 = a3;
  v10 = v6;
  v7 = v6;
  -[EDCloudMirroringPersistentStore performBlockAndWait:](self, "performBlockAndWait:", v9);

}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)(id)objc_opt_class();
  v5 = (void *)objc_msgSend([v4 alloc], "initWithOptions:completionBlock:", 0, *(_QWORD *)(a1 + 32));
  v11 = 0;
  objc_msgSend(v3, "executeRequest:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (!v6)
  {
    if (*(_DWORD *)(a1 + 40))
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "ef_publicDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_2(v9, (uint64_t)v12);
      }
    }
    else
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "ef_publicDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_1(v10, (uint64_t)v12);
      }
    }

  }
}

- (id)_wrapCompletion:(id)a3 forRequestKind:(int)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke;
  v10[3] = &unk_1E949BDF0;
  objc_copyWeak(&v12, &location);
  v13 = a4;
  v11 = v6;
  v7 = v6;
  v8 = _Block_copy(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  double v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(v3, "success");
  v6 = *(_DWORD *)(a1 + 48);
  if (v5)
  {
    if (v6)
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      LOWORD(v43) = 0;
      v8 = "Successfully exported CloudKit content.";
    }
    else
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_11;
      LOWORD(v43) = 0;
      v8 = "Successfully imported CloudKit content.";
    }
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v43, 2u);
LABEL_11:

    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
    goto LABEL_29;
  }
  if (v6)
  {
    +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_4(v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_3(v9, v18, v19, v20, v21, v22, v23, v24);
  }

  objc_msgSend(v3, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  CKRetryAfterSecondsForError();
  v29 = v28;

  v30 = *(_DWORD *)(a1 + 48);
  if (v29 <= 0.0)
  {
    if (v30)
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ef_publicDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_2(v36, (uint64_t)&v43, (uint64_t)v34, v35);
      }
    }
    else
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "ef_publicDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_1(v39, (uint64_t)&v43, (uint64_t)v34, v38);
      }
    }

    v40 = *(_QWORD *)(a1 + 32);
    if (v40)
      (*(void (**)(uint64_t, _QWORD))(v40 + 16))(v40, 0);
  }
  else
  {
    if (v30)
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "ef_publicDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 134218242;
        v44 = v29;
        v45 = 2114;
        v46 = v33;
        _os_log_error_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_ERROR, "Failed to export CloudKit content. Rescheduling (%g). %{public}@", (uint8_t *)&v43, 0x16u);

      }
    }
    else
    {
      +[EDCloudMirroringPersistentStore log](EDCloudMirroringPersistentStore, "log");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "error");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "ef_publicDescription");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 134218242;
        v44 = v29;
        v45 = 2114;
        v46 = v42;
        _os_log_error_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_ERROR, "Failed to import CloudKit content. Rescheduling (%g). %{public}@", (uint8_t *)&v43, 0x16u);

      }
    }

    objc_msgSend(WeakRetained, "_schedulerForKind:", *(unsigned int *)(a1 + 48));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rescheduleTask");

  }
LABEL_29:

}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (EDTaskScheduler)importScheduler
{
  return self->_importScheduler;
}

- (void)setImportScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_importScheduler, a3);
}

- (EDTaskScheduler)exportScheduler
{
  return self->_exportScheduler;
}

- (void)setExportScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_exportScheduler, a3);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_exportScheduler, 0);
  objc_storeStrong((id *)&self->_importScheduler, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

void __54__EDCloudMirroringPersistentStore__setupCoreDataStack__block_invoke_cold_1(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Failed to load persistent stores. %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_1(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Import request failed to execute: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__EDCloudMirroringPersistentStore__executeRequestWithKind_completionBlock___block_invoke_cold_2(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v3, v4, "Export request failed to execute: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v6;
  os_log_t v7;
  uint8_t *v8;

  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v6, v7, "Failed to import CloudKit content: %{public}@", v8);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v6;
  os_log_t v7;
  uint8_t *v8;

  OUTLINED_FUNCTION_11((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, v6, v7, "Failed to export CloudKit content: %{public}@", v8);

  OUTLINED_FUNCTION_2_0();
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Request import failed", a5, a6, a7, a8, 0);
}

void __66__EDCloudMirroringPersistentStore__wrapCompletion_forRequestKind___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Request export failed", a5, a6, a7, a8, 0);
}

@end
