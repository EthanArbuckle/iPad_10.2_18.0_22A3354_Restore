@implementation HDMCDaySummaryQueryServer

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
  v31.super_class = (Class)HDMCDaySummaryQueryServer;
  -[HDQueryServer _queue_start](&v31, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCDaySummaryQueryServer objectTypes](self, "objectTypes");
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
    v24[2] = __41__HDMCDaySummaryQueryServer__queue_start__block_invoke;
    v24[3] = &unk_24DB22628;
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
  v16 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v33 = v18;
    v34 = 2114;
    v35 = v8;
    v19 = v18;
    _os_log_impl(&dword_21961B000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);

  }
  -[HDQueryServer queryUUID](self, "queryUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", MEMORY[0x24BDBD1A8], 0, 1, 0, v20);
LABEL_19:

}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  HKMCDaySummarySampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __41__HDMCDaySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceDaySummariesWithError:");
}

- (HDMCDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDMCDaySummaryQueryServer *v12;
  HDMCDaySummaryQueryServer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMCDaySummaryQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_configuration, a4);

  return v13;
}

- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  HDMCDaySummaryEnumerator *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  HDMCDaySummaryEnumerator *v18;
  id v19;
  id v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD *v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD v42[4];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  char v57[32];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__7;
  v55 = __Block_byref_object_dispose__7;
  v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v30 = -[HKMCDaySummaryQueryConfiguration limit](self->_configuration, "limit");
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BE40BC0];
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v6, "hdmc_daySummaryAnchorWithHealthDatabase:error:", v8, &v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v41;

  if (!v9 && v10)
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      -[HDMCDaySummaryQueryServer _queue_surfaceDaySummariesWithError:].cold.1(v12, (uint64_t)v10, (uint64_t)v57, v11);
    }

  }
  v13 = objc_alloc_init(MEMORY[0x24BDD3968]);
  v14 = [HDMCDaySummaryEnumerator alloc];
  -[HDQueryServer profile](self, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKMCDaySummaryQueryConfiguration dayIndexRange](self->_configuration, "dayIndexRange");
  LOBYTE(v29) = 0;
  v18 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v14, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v15, v13, v16, v17, -[HKMCDaySummaryQueryConfiguration ascending](self->_configuration, "ascending"), 0, v29);

  v40 = v10;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __65__HDMCDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke;
  v32[3] = &unk_24DB22650;
  v32[4] = self;
  v35 = &v43;
  v36 = &v51;
  v19 = v5;
  v33 = v19;
  v37 = &v47;
  v20 = v9;
  v34 = v20;
  v38 = v42;
  v39 = v30;
  v21 = -[HDMCDaySummaryEnumerator enumerateWithError:handler:](v18, "enumerateWithError:handler:", &v40, v32);
  v22 = v40;

  if (!*((_BYTE *)v44 + 24))
  {
    if (v21)
    {
      v23 = v52[5];
      v24 = *((unsigned __int8 *)v48 + 24);
      -[HDQueryServer queryUUID](self, "queryUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", v23, v24 != 0, 1, v20, v25);
    }
    else
    {
      -[HDQueryServer queryUUID](self, "queryUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "client_deliverError:forQuery:", v22, v25);
    }

  }
  v26 = v22;
  v27 = v26;
  if (v26)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v26);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v21;
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
        v11 = *MEMORY[0x24BDD3300],
        v12 = objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x24BDD3300]),
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

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

void __65__HDMCDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") >= 0x190)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", v5, v6, 0, v7, v9);

    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v14);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v13 = *(_QWORD *)(a1 + 88);
  if (v13 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) >= v13)
    goto LABEL_4;
LABEL_5:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_queue_surfaceDaySummariesWithError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_error_impl(&dword_21961B000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving analysis anchor: %{public}@", (uint8_t *)a3, 0x16u);

}

@end
