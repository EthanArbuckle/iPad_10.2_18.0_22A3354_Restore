@implementation HDMHPromptedAssessmentsManagerServer

- (void)remote_getPromptedAssessmentsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__HDMHPromptedAssessmentsManagerServer_remote_getPromptedAssessmentsWithCompletion___block_invoke;
  v8[3] = &unk_2511A2050;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __84__HDMHPromptedAssessmentsManagerServer_remote_getPromptedAssessmentsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "promptedAssessmentsWithError:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  int v6;
  HDMHPromptedAssessmentsManagerServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_2416F5000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for extension changes", (uint8_t *)&v6, 0xCu);
  }
  -[HDMHPromptedAssessmentsManager registerObserver:queue:](self->_manager, "registerObserver:queue:", self, 0);
  v4[2](v4, 1, 0);

}

- (void)remote_stopObservingChanges
{
  NSObject *v3;
  int v4;
  HDMHPromptedAssessmentsManagerServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_2416F5000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for extension changes", (uint8_t *)&v4, 0xCu);
  }
  -[HDMHPromptedAssessmentsManager unregisterObserver:](self->_manager, "unregisterObserver:", self);
}

- (void)promptedAssessmentsManagerDidUpdatePromptedAssessments:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  HDMHPromptedAssessmentsManagerServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_2416F5000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of prompted assessment update", (uint8_t *)&v6, 0xCu);
  }
  -[HDMHPromptedAssessmentsManagerServer _clientRemoteObjectProxy](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_promptedAssessmentsManagerDidUpdatePromptedAssessments");

}

- (id)_clientRemoteObjectProxy
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "client");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "connection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  HDMHPromptedAssessmentsManagerServer *v21;
  HDMHPromptedAssessmentsManager *v22;
  void *v23;
  uint64_t v24;
  HDMHPromptedAssessmentsManager *manager;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BE65D60]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    goto LABEL_13;
  }
  v17 = *MEMORY[0x24BDD2E50];
  objc_msgSend(v16, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x24BDD2E50]);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a7, 110, CFSTR("No availability extension found for %@"), v17);
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  v19 = *MEMORY[0x24BDD2E98];
  objc_msgSend(v16, "featureAvailabilityExtensionForFeatureIdentifier:", *MEMORY[0x24BDD2E98]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDMHPromptedAssessmentsManagerServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v22 = [HDMHPromptedAssessmentsManager alloc];
    objc_msgSend(v13, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDMHPromptedAssessmentsManager initWithProfile:periodicAssessmentsAvailability:loggingPatternEscalationsAvailability:](v22, "initWithProfile:periodicAssessmentsAvailability:loggingPatternEscalationsAvailability:", v23, v18, v20);
    manager = v21->_manager;
    v21->_manager = (HDMHPromptedAssessmentsManager *)v24;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a7, 110, CFSTR("No availability extension found for %@"), v19);
    v21 = 0;
  }

LABEL_14:
  return v21;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
