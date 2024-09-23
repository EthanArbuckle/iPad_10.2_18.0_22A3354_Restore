@implementation HDMHDaySummaryQueryServer

- (HDMHDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDMHDaySummaryQueryServer *v12;
  HDMHDaySummaryQueryServer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMHDaySummaryQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_configuration, a4);

  return v13;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v6 = a4;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD3310];
  v9 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDD3310]);

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "entitlements"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = *MEMORY[0x24BDD3308],
        v12 = objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x24BDD3308]),
        v10,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement: %@ for core apps or %@ for second-party access."), v8, v11);
    v13 = 0;
  }

  return v13;
}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)HDMHDaySummaryQueryServer;
  -[HDQueryServer _queue_start](&v31, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHDaySummaryQueryServer objectTypes](self, "objectTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v6, "readAuthorizationStatusesForTypes:error:", v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;

  if (!v8)
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v20);
    goto LABEL_19;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (!v11)
  {

LABEL_18:
    objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = self;
    v25 = v9;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __41__HDMHDaySummaryQueryServer__queue_start__block_invoke;
    v24[3] = &unk_2511A2000;
    objc_msgSend(v22, "performTransactionWithContext:error:block:inaccessibilityHandler:", v20, &v25, v24, 0);
    v23 = v25;

    v9 = v23;
    goto LABEL_19;
  }
  v12 = v11;
  v13 = *(_QWORD *)v27;
  v14 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v10);
      if ((v14 & 1) != 0)
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "canRead");
      else
        v14 = 0;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  }
  while (v12);

  if ((v14 & 1) != 0)
    goto LABEL_18;
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x24BDD3038];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v18;
    v34 = 2114;
    v35 = v8;
    v19 = v18;
    _os_log_impl(&dword_2416F5000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);

  }
  -[HDQueryServer queryUUID](self, "queryUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x24BDBD1A8], 0, 1, v20);
LABEL_19:

}

uint64_t __41__HDMHDaySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceDaySummariesWithError:");
}

- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  HDMHDaySummaryEnumerator *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  HDMHDaySummaryEnumerator *v14;
  id v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v5 = -[HKMHDaySummaryQueryConfiguration limit](self->_configuration, "limit");
  -[HDQueryServer clientProxy](self, "clientProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [HDMHDaySummaryEnumerator alloc];
  -[HDQueryServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKMHDaySummaryQueryConfiguration dayIndexRange](self->_configuration, "dayIndexRange");
  v12 = v11;
  -[HKMHDaySummaryQueryConfiguration gregorianCalendar](self->_configuration, "gregorianCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = -[HKMHDaySummaryQueryConfiguration ascending](self->_configuration, "ascending");
  v14 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v8, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v9, v10, v12, v13, 0, 0, v24);

  v32 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __65__HDMHDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke;
  v25[3] = &unk_2511A20A0;
  v25[4] = self;
  v27 = &v34;
  v28 = &v42;
  v15 = v7;
  v26 = v15;
  v29 = &v38;
  v30 = v33;
  v31 = v5;
  v16 = -[HDMHDaySummaryEnumerator enumerateWithError:handler:](v14, "enumerateWithError:handler:", &v32, v25);
  v17 = v32;
  if (!*((_BYTE *)v35 + 24))
  {
    if (v16)
    {
      v18 = v43[5];
      v19 = *((unsigned __int8 *)v39 + 24);
      -[HDQueryServer queryUUID](self, "queryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v18, v19 != 0, 1, v20);
    }
    else
    {
      -[HDQueryServer queryUUID](self, "queryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverError:forQuery:", v17, v20);
    }

  }
  v21 = v17;
  v22 = v21;
  if (v21)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

void __65__HDMHDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    if (a3)
LABEL_4:
      *a3 = 1;
  }
  else
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0xC8)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "queryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverDaySummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v13);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v12 = *(_QWORD *)(a1 + 80);
    if (v12 && a3 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) >= v12)
      goto LABEL_4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
