@implementation HDMHValenceDistributionSummaryQueryServer

- (HDMHValenceDistributionSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDMHValenceDistributionSummaryQueryServer *v12;
  HDMHValenceDistributionSummaryQueryServer *v13;
  uint64_t v14;
  NSCalendar *gregorianCalendar;
  objc_super v17;

  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDMHValenceDistributionSummaryQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v11, a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a4);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v14 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v13->_gregorianCalendar;
    v13->_gregorianCalendar = (NSCalendar *)v14;

  }
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
  v31.super_class = (Class)HDMHValenceDistributionSummaryQueryServer;
  -[HDQueryServer _queue_start](&v31, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMHValenceDistributionSummaryQueryServer objectTypes](self, "objectTypes");
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
    v24[2] = __57__HDMHValenceDistributionSummaryQueryServer__queue_start__block_invoke;
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
  objc_msgSend(v4, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", MEMORY[0x24BDBD1A8], 0, 1, v20);
LABEL_19:

}

uint64_t __57__HDMHValenceDistributionSummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceValenceDistributionSummariesWithError:");
}

- (BOOL)_queue_surfaceValenceDistributionSummariesWithError:(id *)a3
{
  uint64_t v4;
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
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v4 = -[HKMHValenceDistributionSummaryQueryConfiguration limit](self->_configuration, "limit");
  -[HDQueryServer clientProxy](self, "clientProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HDMHDaySummaryEnumerator alloc];
  -[HDQueryServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKMHValenceDistributionSummaryQueryConfiguration dayIndexRange](self->_configuration, "dayIndexRange");
  v11 = v10;
  -[HKMHValenceDistributionSummaryQueryConfiguration gregorianCalendar](self->_configuration, "gregorianCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer predicateForQueryClient](self, "predicateForQueryClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = -[HKMHValenceDistributionSummaryQueryConfiguration ascending](self->_configuration, "ascending");
  v14 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:](v7, "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", v8, v9, v11, v12, v13, 0, v27);

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v37 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __97__HDMHValenceDistributionSummaryQueryServer__queue_surfaceValenceDistributionSummariesWithError___block_invoke;
  v29[3] = &unk_2511A2028;
  v29[4] = self;
  v31 = &v45;
  v32 = &v53;
  v15 = v6;
  v30 = v15;
  v33 = &v49;
  v34 = &v38;
  v35 = v44;
  v36 = v4;
  v16 = -[HDMHDaySummaryEnumerator enumerateWithError:handler:](v14, "enumerateWithError:handler:", &v37, v29);
  v17 = v37;
  v18 = (void *)v39[5];
  if (v18)
  {
    v19 = (void *)v54[5];
    objc_msgSend(v18, "valenceDistributionSummary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
  if (!*((_BYTE *)v46 + 24))
  {
    if (v16)
    {
      v21 = v54[5];
      v22 = *((unsigned __int8 *)v50 + 24);
      -[HDQueryServer queryUUID](self, "queryUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", v21, v22 != 0, 1, v23);
    }
    else
    {
      -[HDQueryServer queryUUID](self, "queryUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverError:forQuery:", v17, v23);
    }

  }
  v24 = v17;
  v25 = v24;
  if (v24)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v24);
    else
      _HKLogDroppedError();
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v16;
}

void __97__HDMHValenceDistributionSummaryQueryServer__queue_surfaceValenceDistributionSummariesWithError___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  HDMHValenceDistributionSummaryBuilder *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery"))
  {
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0xC8)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "queryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverValenceDistributionSummaries:clearPending:isFinalBatch:queryUUID:", v5, v6, 0, v8);

      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
    v12 = objc_msgSend(v26, "dayIndex");
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (v13)
    {
      v14 = objc_msgSend(v13, "dayIndexRange");
      if (v12 >= v14 && v12 - v14 < v15)
      {
LABEL_15:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addDaySummary:", v26);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v25 = *(_QWORD *)(a1 + 88);
        if (v25 && a3 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) >= v25)
          goto LABEL_4;
        goto LABEL_5;
      }
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "valenceDistributionSummary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

    }
    v19 = [HDMHValenceDistributionSummaryBuilder alloc];
    v20 = objc_msgSend(*(id *)(a1 + 32), "_dayIndexRangeWithAnchorIndex:", v12);
    v22 = -[HDMHValenceDistributionSummaryBuilder initWithDayIndexRange:gregorianCalendar:](v19, "initWithDayIndexRange:gregorianCalendar:", v20, v21, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    goto LABEL_15;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (a3)
LABEL_4:
    *a3 = 1;
LABEL_5:

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_dayIndexRangeWithAnchorIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  if ((-[HKMHValenceDistributionSummaryQueryConfiguration options](self->_configuration, "options") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", a3, self->_gregorianCalendar);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar hk_startOfMonthForDate:](self->_gregorianCalendar, "hk_startOfMonthForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);
    -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_gregorianCalendar, "rangeOfUnit:inUnit:forDate:", 16, 8, v7);
    v5 = v8;
LABEL_6:

    goto LABEL_7;
  }
  if ((-[HKMHValenceDistributionSummaryQueryConfiguration options](self->_configuration, "options") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "hk_noonWithDayIndex:calendar:", a3, self->_gregorianCalendar);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:](self->_gregorianCalendar, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", -[NSCalendar firstWeekday](self->_gregorianCalendar, "firstWeekday"), v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);
    v5 = 7;
    goto LABEL_6;
  }
  v5 = 1;
LABEL_7:
  v9 = a3;
  v10 = v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
