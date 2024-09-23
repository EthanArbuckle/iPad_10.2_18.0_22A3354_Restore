@implementation _HDAWDPeriodicAction

- (void)dealloc
{
  objc_super v3;

  -[HDAssertion invalidate](self->_preparedDatabaseAccessibilityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_HDAWDPeriodicAction;
  -[_HDAWDPeriodicAction dealloc](&v3, sel_dealloc);
}

- (void)_queue_setWaitingToRun:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    *(_QWORD *)(a1 + 128) = a2;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInteger:forKey:", a2, *(_QWORD *)(a1 + 8));

  }
}

- (void)_queue_setIntervalCounter:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    *(_QWORD *)(a1 + 144) = a2;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInteger:forKey:", *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 24));

  }
}

- (void)_queue_setLastSubmissionAttemptDate:(uint64_t)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 136), a2);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 16));

  }
}

- (void)_queue_setLastProcessedDate:(uint64_t)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 152), a2);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 32));

  }
}

- (id)lastProcessedDate
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__100;
  v9 = __Block_byref_object_dispose__100;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 96);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41___HDAWDPeriodicAction_lastProcessedDate__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  xpc_object_t xdict;

  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], self->_repeatInterval);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80790], self->_graceInterval);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  if (self->_requiresClassB)
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808B0], 1);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSString *taskName;
  BOOL v12;
  NSObject *queue;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  NSString *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, int);
  void *v25;
  _HDAWDPeriodicAction *v26;
  id v27;
  _BYTE buf[24];
  void *v29;
  _HDAWDPeriodicAction *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB52C0];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    taskName = self->_taskName;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = taskName;
    *(_WORD *)&buf[22] = 2112;
    v29 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ fired with activity %@", buf, 0x20u);
    v12 = self == 0;
LABEL_5:
    queue = self->_queue;
    *(_QWORD *)buf = v10;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __42___HDAWDPeriodicAction__beginWaitingToRun__block_invoke;
    v29 = &unk_1E6CE80E8;
    v30 = self;
    dispatch_sync(queue, buf);
    goto LABEL_6;
  }
  if (self)
  {
    v12 = 0;
    goto LABEL_5;
  }
  v12 = 1;
LABEL_6:
  v22 = v10;
  v23 = 3221225472;
  v24 = __59___HDAWDPeriodicAction_performPeriodicActivity_completion___block_invoke;
  v25 = &unk_1E6CECC08;
  v26 = self;
  v27 = v7;
  v14 = v7;
  v15 = &v22;
  v16 = v15;
  if (!v12)
  {
    v17 = self->_taskName;
    *(_QWORD *)buf = v10;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __69___HDAWDPeriodicAction__doIfWaitingOnMaintenanceQueueWithCompletion___block_invoke;
    v29 = &unk_1E6CF9B58;
    v30 = self;
    v31 = v15;
    +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", v17, buf, v22, v23, v24, v25, v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "maintenanceWorkCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "enqueueMaintenanceOperation:", v18);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_lastSubmissionAttemptDate, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_lastProcessedDateKey, 0);
  objc_storeStrong((id *)&self->_intervalCounterKey, 0);
  objc_storeStrong((id *)&self->_lastSubmissionAttemptKey, 0);
  objc_storeStrong((id *)&self->_waitingToRunKey, 0);
}

@end
