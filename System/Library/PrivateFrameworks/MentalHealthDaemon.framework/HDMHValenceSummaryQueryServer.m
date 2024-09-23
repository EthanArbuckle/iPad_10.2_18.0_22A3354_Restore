@implementation HDMHValenceSummaryQueryServer

- (HDMHValenceSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDMHValenceSummaryQueryServer *v12;
  HDMHValenceSummaryQueryServer *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMHValenceSummaryQueryServer;
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
  v31.super_class = (Class)HDMHValenceSummaryQueryServer;
  -[HDQueryServer _queue_start](&v31, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHValenceSummaryQueryServer objectTypes](self, "objectTypes");
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
    v24[2] = __45__HDMHValenceSummaryQueryServer__queue_start__block_invoke;
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
  objc_msgSend(v4, "client_deliverValenceSummary:queryUUID:", 0, v20);
LABEL_19:

}

uint64_t __45__HDMHValenceSummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceDaySummariesWithError:");
}

- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3
{
  void *v5;
  void *v6;
  HDMHDaySummaryEnumerator *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HDMHDaySummaryEnumerator *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;

  -[HDQueryServer clientProxy](self, "clientProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HDMHDaySummaryEnumerator alloc];
  -[HDQueryServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKMHCountBasedQueryConfiguration dayIndexRange](self->_configuration, "dayIndexRange");
  v11 = v10;
  -[HKMHCountBasedQueryConfiguration gregorianCalendar](self->_configuration, "gregorianCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer predicateForQueryClient](self, "predicateForQueryClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = 1;
  v14 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v7, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v8, v9, v11, v12, v13, 0, v26);

  v15 = objc_alloc(MEMORY[0x24BE65E10]);
  v16 = -[HKMHCountBasedQueryConfiguration dayIndexRange](self->_configuration, "dayIndexRange");
  v18 = (void *)objc_msgSend(v15, "initWithDayIndexRange:", v16, v17);
  v29 = 0;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__HDMHValenceSummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke;
  v27[3] = &unk_2511A21F8;
  v27[4] = self;
  v19 = v18;
  v28 = v19;
  v20 = -[HDMHDaySummaryEnumerator enumerateWithError:handler:](v14, "enumerateWithError:handler:", &v29, v27);
  v21 = v29;
  -[HDQueryServer queryUUID](self, "queryUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v23 = v19;
  else
    v23 = 0;
  objc_msgSend(v6, "client_deliverValenceSummary:queryUUID:", v23, v22);

  v24 = v21;
  if (v24)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v24);
    else
      _HKLogDroppedError();
  }

  return v20;
}

void __69__HDMHValenceSummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    if (a3)
      *a3 = 1;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v5, "momentaryStatesOfMind", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 40), "_addValence:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "valenceClassification"));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "dailyStateOfMind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(*(id *)(a1 + 40), "_addValence:", objc_msgSend(v11, "valenceClassification"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
