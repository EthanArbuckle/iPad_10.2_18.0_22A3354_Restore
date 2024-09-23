@implementation FedStatsPluginUserProofingConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  intptr_t (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a3;
  if (objc_msgSend(&unk_250C5B140, "containsObject:", v5))
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FedStatsPluginUserProofingConsentChecker checkConsentForClientIdentifier:error:].cold.1(v6);

    v7 = objc_alloc_init(MEMORY[0x24BE1DF00]);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v8 = dispatch_semaphore_create(0);
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __82__FedStatsPluginUserProofingConsentChecker_checkConsentForClientIdentifier_error___block_invoke;
    v18 = &unk_250C58080;
    v20 = &v22;
    v21 = &v28;
    v9 = v8;
    v19 = v9;
    objc_msgSend(v7, "fetchUserConsent:", &v15);
    v10 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User consent check failed after %u seconds"), 15, v15, v16, v17, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        +[FedStatsPluginError errorWithCode:description:](FedStatsPluginError, "errorWithCode:description:", 300, v11);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v12 = 0;
    }
    else
    {
      v13 = (void *)v29[5];
      if (a4 && !v13)
      {
        +[FedStatsPluginError errorWithCode:underlyingError:description:](FedStatsPluginError, "errorWithCode:underlyingError:description:", 300, v23[5], CFSTR("Cannot access CoreIDVUI consent manager"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v13 = (void *)v29[5];
      }
      v12 = v13;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v12 = (id)MEMORY[0x24BDBD1C8];
  }

  return v12;
}

intptr_t __82__FedStatsPluginUserProofingConsentChecker_checkConsentForClientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v4 = objc_msgSend(a3, "copy");
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2 == 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
  }
  v6 = *(_QWORD *)(v5 + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)checkConsentForClientIdentifier:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23B425000, log, OS_LOG_TYPE_DEBUG, "Performing user consent for Mead data access", v1, 2u);
}

@end
