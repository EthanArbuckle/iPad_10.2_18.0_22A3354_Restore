@implementation HDNotificationInstructionQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  HDNotificationInstructionDiagnostics *v11;
  void *v12;
  HDNotificationInstructionDiagnostics *v13;
  id v14;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t *v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  objc_super v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[HDQueryServer configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v5 = (id *)MEMORY[0x1E0CB5330];
  v6 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    v8 = *(id *)&buf[4];
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Started", buf, 0x16u);

  }
  v39.receiver = self;
  v39.super_class = (Class)HDNotificationInstructionQueryServer;
  -[HDQueryServer _queue_start](&v39, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v45 = __Block_byref_object_copy__199;
  v46 = __Block_byref_object_dispose__199;
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v11 = [HDNotificationInstructionDiagnostics alloc];
  -[HDQueryServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDNotificationInstructionDiagnostics initWithProfile:](v11, "initWithProfile:", v12);

  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__HDNotificationInstructionQueryServer__queue_start__block_invoke;
  v23[3] = &unk_1E6D0FA48;
  v23[4] = self;
  v25 = &v31;
  v26 = buf;
  v14 = v10;
  v24 = v14;
  v27 = &v35;
  v28 = v30;
  v15 = -[HDNotificationInstructionDiagnostics enumerateAllNotificationInstructionsWithError:enumerationHandler:](v13, "enumerateAllNotificationInstructionsWithError:enumerationHandler:", &v29, v23);
  v16 = v29;
  if (!*((_BYTE *)v32 + 24))
  {
    if (v15)
    {
      v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v18 = *((unsigned __int8 *)v36 + 24);
      -[HDQueryServer queryUUID](self, "queryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "client_deliverNotificationInstructions:clearPending:isFinalBatch:queryUUID:", v17, v18 != 0, 1, v19);
    }
    else
    {
      -[HDQueryServer queryUUID](self, "queryUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "client_deliverError:forQuery:", v16, v19);
    }

  }
  _HKInitializeLogging();
  v20 = *v5;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_opt_class();
    *(_DWORD *)v40 = 138543618;
    v41 = v21;
    v42 = 2114;
    v43 = v4;
    v22 = v21;
    _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Query Finished", v40, 0x16u);

  }
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(buf, 8);

}

uint64_t __52__HDNotificationInstructionQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 128, CFSTR("Query suspended or aborted"));
    v6 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0xC8)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v9 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "queryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "client_deliverNotificationInstructions:clearPending:isFinalBatch:queryUUID:", v7, v8, 0, v10);

      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v6 = 1;
  }

  return v6;
}

@end
