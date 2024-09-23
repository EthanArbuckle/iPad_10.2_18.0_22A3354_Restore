@implementation HDObjectTypeAnchorQueryServer

- (HDObjectTypeAnchorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDObjectTypeAnchorQueryServer *v11;
  HDObjectTypeAnchorQueryServer *v12;
  HDCoalescedTaskPoolQuota *v13;
  HDCoalescedTaskPoolQuota *quota;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDObjectTypeAnchorQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v19, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  v12 = v11;
  if (v11)
  {
    v11->_needsRequery = 1;
    v13 = -[HDCoalescedTaskPoolQuota initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:]([HDCoalescedTaskPoolQuota alloc], "initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:", 3, 3, 1.0, 0.25, 0.0);
    quota = v12->_quota;
    v12->_quota = v13;

    objc_msgSend(v10, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryQueue](v12, "queryQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addProtectedDataObserver:queue:", v12, v17);

  }
  return v12;
}

- (void)_queue_fetchAndDeliver
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (a1)
  {
    v13 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__187;
    v19 = __Block_byref_object_dispose__187;
    v20 = 0;
    objc_msgSend((id)a1, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke;
    v14[3] = &unk_1E6CE8D70;
    v14[4] = a1;
    v14[5] = &v15;
    v5 = objc_msgSend(v3, "performTransactionWithContext:error:block:inaccessibilityHandler:", v4, &v13, v14, 0);

    if (v5)
      v6 = (void *)v16[5];
    else
      v6 = 0;
    v7 = v6;
    _Block_object_dispose(&v15, 8);

    v8 = v13;
    v9 = v8;
    if (v7)
    {
      if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 208)) & 1) != 0)
      {
LABEL_10:

        return;
      }
      *(_BYTE *)(a1 + 200) = 0;
      objc_storeStrong((id *)(a1 + 208), v6);
      objc_msgSend((id)a1, "clientProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "queryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "client_deliverAnchor:query:", v7, v11);
    }
    else
    {
      v12 = v8;
      objc_msgSend((id)a1, "clientProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "queryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "client_deliverError:forQuery:", v12, v11);

    }
    goto LABEL_10;
  }
}

- (uint64_t)_queue_unconditionallyScheduleUpdate
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = (void *)result;
    objc_msgSend(*(id *)(result + 216), "consumeQuota");
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __69__HDObjectTypeAnchorQueryServer__queue_unconditionallyScheduleUpdate__block_invoke;
    v2[3] = &unk_1E6CE80E8;
    v2[4] = v1;
    return objc_msgSend(v1, "scheduleDatabaseAccessOnQueueWithBlock:", v2);
  }
  return result;
}

void __69__HDObjectTypeAnchorQueryServer__queue_unconditionallyScheduleUpdate__block_invoke(uint64_t a1)
{
  -[HDObjectTypeAnchorQueryServer _queue_fetchAndDeliver](*(_QWORD *)(a1 + 32));
}

- (void)_queue_scheduleUpdate
{
  double v2;
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (a1 && !*(_BYTE *)(a1 + 200))
  {
    *(_BYTE *)(a1 + 200) = 1;
    objc_msgSend(*(id *)(a1 + 216), "timeUntilNextAvailableTrigger");
    if (v2 <= 0.0)
    {
      -[HDObjectTypeAnchorQueryServer _queue_unconditionallyScheduleUpdate](a1);
    }
    else
    {
      v3 = v2;
      objc_initWeak(&location, (id)a1);
      v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      objc_msgSend((id)a1, "queryQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__HDObjectTypeAnchorQueryServer__queue_scheduleUpdate__block_invoke;
      v6[3] = &unk_1E6CECE78;
      objc_copyWeak(&v7, &location);
      dispatch_after(v4, v5, v6);

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __54__HDObjectTypeAnchorQueryServer__queue_scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDObjectTypeAnchorQueryServer _queue_unconditionallyScheduleUpdate]((uint64_t)WeakRetained);

}

uint64_t __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSyncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = (void *)MEMORY[0x1E0CB3940];
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("WITH RECURSIVE generate_series(value) AS (SELECT 0 UNION ALL SELECT value+1 FROM generate_series WHERE value<%ld) SELECT value, (SELECT MAX(%@) FROM %@ WHERE %@=value) as anchor FROM generate_series WHERE anchor IS NOT NULL;"),
    317,
    CFSTR("data_id"),
    v14,
    CFSTR("data_type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "protectedDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke_3;
  v23[3] = &unk_1E6CE8CF8;
  v17 = v12;
  v24 = v17;
  v18 = objc_msgSend(v16, "executeSQL:error:bindingHandler:enumerationHandler:", v15, a3, &__block_literal_global_221, v23);

  if ((_DWORD)v18)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6FF0]), "initWithAnchors:databaseIdentifier:", v17, v11);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  return v18;
}

uint64_t __56__HDObjectTypeAnchorQueryServer__fetchAnchorsWithError___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1C8](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  return 1;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (BOOL)_shouldObserveAllSampleTypes
{
  return 1;
}

- (void)_queue_start
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDObjectTypeAnchorQueryServer;
  -[HDQueryServer _queue_start](&v3, sel__queue_start);
  -[HDObjectTypeAnchorQueryServer _queue_fetchAndDeliver]((uint64_t)self);
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HDObjectTypeAnchorQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  -[HDQueryServer onQueue:](self, "onQueue:", v4, a4);
}

void __61__HDObjectTypeAnchorQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
  -[HDObjectTypeAnchorQueryServer _queue_scheduleUpdate](*(_QWORD *)(a1 + 32));
}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HDObjectTypeAnchorQueryServer_samplesJournaled_type___block_invoke;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  -[HDQueryServer onQueue:](self, "onQueue:", v4, a4);
}

void __55__HDObjectTypeAnchorQueryServer_samplesJournaled_type___block_invoke(uint64_t a1)
{
  -[HDObjectTypeAnchorQueryServer _queue_scheduleUpdate](*(_QWORD *)(a1 + 32));
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HDObjectTypeAnchorQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  -[HDQueryServer onQueue:](self, "onQueue:", v4, a4);
}

void __66__HDObjectTypeAnchorQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  -[HDObjectTypeAnchorQueryServer _queue_scheduleUpdate](*(_QWORD *)(a1 + 32));
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _QWORD v7[5];

  v4 = a4;
  -[HDQueryServer queryQueue](self, "queryQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v4 && self && self->_needsRequery)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__HDObjectTypeAnchorQueryServer__queue_protectedDataBecameAvailable__block_invoke;
    v7[3] = &unk_1E6CE80E8;
    v7[4] = self;
    -[HDQueryServer scheduleDatabaseAccessOnQueueWithBlock:](self, "scheduleDatabaseAccessOnQueueWithBlock:", v7);
  }
}

void __68__HDObjectTypeAnchorQueryServer__queue_protectedDataBecameAvailable__block_invoke(uint64_t a1)
{
  -[HDObjectTypeAnchorQueryServer _queue_fetchAndDeliver](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quota, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
