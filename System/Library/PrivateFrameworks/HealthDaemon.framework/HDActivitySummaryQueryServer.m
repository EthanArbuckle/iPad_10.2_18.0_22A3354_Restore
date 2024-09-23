@implementation HDActivitySummaryQueryServer

- (HDActivitySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDActivitySummaryQueryServer *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HDSQLitePredicate *filterPredicate;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDActivitySummaryQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v11->_deliversUpdates = objc_msgSend(v10, "shouldDeactivateAfterInitialResults") ^ 1;
    -[HDQueryServer filter](v11, "filter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer profile](v11, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateWithProfile:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    filterPredicate = v11->_filterPredicate;
    v11->_filterPredicate = (HDSQLitePredicate *)v14;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  HDActivitySummaryQueryHelper *queryHelper;
  dispatch_semaphore_t v4;
  HDActivitySummaryQueryHelper *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  HDActivitySummaryQueryHelper *v10;
  HDActivitySummaryQueryHelper *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  id location;

  v16.receiver = self;
  v16.super_class = (Class)HDActivitySummaryQueryServer;
  -[HDQueryServer _queue_start](&v16, sel__queue_start);
  queryHelper = self->_queryHelper;
  if (queryHelper)
  {
    -[HDActivitySummaryQueryHelper start](queryHelper, "start");
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v5 = [HDActivitySummaryQueryHelper alloc];
    -[HDQueryServer profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer filter](self, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke;
    v21[3] = &unk_1E6CEBC28;
    objc_copyWeak(&v23, &location);
    v9 = v4;
    v22 = v9;
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke_2;
    v19[3] = &unk_1E6CEBC50;
    objc_copyWeak(&v20, &location);
    v10 = -[HDActivitySummaryQueryHelper initWithProfile:filter:batchedInitialResultsHandler:batchedUpdateHandler:](v5, "initWithProfile:filter:batchedInitialResultsHandler:batchedUpdateHandler:", v6, v7, v21, v19);
    v11 = self->_queryHelper;
    self->_queryHelper = v10;

    v18.receiver = self;
    v18.super_class = (Class)HDActivitySummaryQueryServer;
    -[HDQueryServer configuration](&v18, sel_configuration);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)HDActivitySummaryQueryServer;
    -[HDQueryServer client](&v17, sel_client);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

    if ((_DWORD)v14)
    {
      v15 = objc_msgSend(v12, "shouldIncludeActivitySummaryPrivateProperties");
      v14 = objc_msgSend(v12, "shouldIncludeActivitySummaryStatistics");
    }
    else
    {
      v15 = 0;
    }
    -[HDActivitySummaryQueryHelper setShouldIncludePrivateProperties:](self->_queryHelper, "setShouldIncludePrivateProperties:", v15);
    -[HDActivitySummaryQueryHelper setShouldIncludeStatistics:](self->_queryHelper, "setShouldIncludeStatistics:", v14);
    -[HDActivitySummaryQueryHelper setOrderByDateAscending:](self->_queryHelper, "setOrderByDateAscending:", objc_msgSend(v12, "orderByDateAscending"));
    -[HDActivitySummaryQueryHelper setLimit:](self->_queryHelper, "setLimit:", objc_msgSend(v12, "limit"));
    -[HDActivitySummaryQueryHelper start](self->_queryHelper, "start");
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    -[HDQueryServer setDataCount:](self, "setDataCount:", -[HDActivitySummaryQueryHelper enumeratedSummaryCount](self->_queryHelper, "enumeratedSummaryCount"));

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

- (void)_queue_stop
{
  int64_t v3;
  HDActivitySummaryQueryHelper *queryHelper;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDActivitySummaryQueryServer;
  -[HDQueryServer _queue_stop](&v5, sel__queue_stop);
  v3 = -[HDQueryServer queryState](self, "queryState");
  queryHelper = self->_queryHelper;
  if (v3 == 3)
    -[HDActivitySummaryQueryHelper pause](queryHelper, "pause");
  else
    -[HDActivitySummaryQueryHelper stop](queryHelper, "stop");
}

- (void)_queue_deliverResultsWithActivitySummaries:(uint64_t)a3 isFinalBatch:(uint64_t)a4 clearPendingBatches:(void *)a5 error:
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v9 = a5;
  v10 = v9;
  if (a1)
  {
    if (v9)
    {
      -[HDActivitySummaryQueryServer _queue_deliverErrorToClient:](a1, v9);
      goto LABEL_14;
    }
    v11 = v18;
    objc_msgSend(MEMORY[0x1E0CB6288], "activitySummaryType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(a1, "readAuthorizationStatusForType:error:", v12, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;

    if (v13)
    {
      if ((objc_msgSend(v13, "canRead") & 1) == 0)
      {
        if (a1[232])
        {
LABEL_13:

          goto LABEL_14;
        }

        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      objc_msgSend(a1, "clientProxy", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "queryUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "client_deliverActivitySummaries:isFinalBatch:clearPendingBatches:queryUUID:", v11, a3, a4, v16);

      a1[232] = 1;
    }
    else
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v14;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve authorization status for activity summary type: %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, CFSTR("Unable to determine authorization."), v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDActivitySummaryQueryServer _queue_deliverErrorToClient:](a1, v15);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_queue_deliverErrorToClient:(void *)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(a1, "clientProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);

}

intptr_t __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  _BYTE *WeakRetained;

  v9 = (id *)(a1 + 40);
  v10 = a5;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  -[HDActivitySummaryQueryServer _queue_deliverResultsWithActivitySummaries:isFinalBatch:clearPendingBatches:error:](WeakRetained, v11, a3, a4, v10);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__HDActivitySummaryQueryServer__setUpInitialQueryHelper__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  _BYTE *WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  -[HDActivitySummaryQueryServer _queue_deliverResultsWithActivitySummaries:isFinalBatch:clearPendingBatches:error:](WeakRetained, v10, a3, a4, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHelper, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end
