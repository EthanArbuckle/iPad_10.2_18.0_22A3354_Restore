@implementation HDClientDataCollectionTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4B40];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDClientDataCollectionTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDClientDataCollectionTaskServer *v15;
  uint64_t v16;
  OS_dispatch_queue *queue;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  HKDataCollectorCollectionConfiguration *collectionConfiguration;
  void *v26;
  void *v27;
  uint64_t v28;
  HKSource *clientSource;
  void *v31;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDClientDataCollectionTaskServer.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v32.receiver = self;
  v32.super_class = (Class)HDClientDataCollectionTaskServer;
  v15 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v32, sel_initWithUUID_configuration_client_delegate_, v11, v12, v13, v14);
  if (v15)
  {
    HKCreateSerialDispatchQueue();
    v16 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_configuration, a4);
    v18 = objc_alloc(MEMORY[0x1E0CB6570]);
    -[HKDataCollectorTaskServerConfiguration quantityType](v15->_configuration, "quantityType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "code");
    HKDefaultAggregationIntervalForType();
    v21 = v20;
    -[HKDataCollectorTaskServerConfiguration quantityType](v15->_configuration, "quantityType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "code");
    HKDefaultCollectionLatencyForType();
    v24 = objc_msgSend(v18, "initWithCollectionInterval:collectionLatency:collectionType:", 1, v21, v23);
    collectionConfiguration = v15->_collectionConfiguration;
    v15->_collectionConfiguration = (HKDataCollectorCollectionConfiguration *)v24;

    v26 = (void *)MEMORY[0x1E0CB6C18];
    -[HDStandardTaskServer client](v15, "client");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hd_sourceForClient:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    clientSource = v15->_clientSource;
    v15->_clientSource = (HKSource *)v28;

  }
  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  if (!a3)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("HKDataCollectorTaskServerConfiguration is nil"));
  return a3 != 0;
}

- (void)connectionConfigured
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDClientDataCollectionTaskServer_connectionConfigured__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __56__HDClientDataCollectionTaskServer_connectionConfigured__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataCollectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aggregatorForType:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB52A8];
  v10 = *MEMORY[0x1E0CB52A8];
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(v11 + 88);
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering aggregator for client data collection: %@", (uint8_t *)&v17, 0x16u);
    }
    v13 = objc_alloc_init(MEMORY[0x1E0CB6578]);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "registerDataCollector:state:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 138543362;
    v18 = v16;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: No aggregator available for data collection.", (uint8_t *)&v17, 0xCu);
  }
}

- (void)remote_setCollectionState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HDClientDataCollectionTaskServer_remote_setCollectionState_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __73__HDClientDataCollectionTaskServer_remote_setCollectionState_completion___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 88), "dataCollector:didChangeState:", a1[4], a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)remote_insertDatums:(id)a3 device:(id)a4 metadata:(id)a5 options:(unint64_t)a6 batchUUID:(id)a7 registrationUUID:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *queue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__HDClientDataCollectionTaskServer_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke;
  block[3] = &unk_1E6D0EDD8;
  block[4] = self;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v35 = a6;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  dispatch_sync(queue, block);

}

void __118__HDClientDataCollectionTaskServer_remote_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id obj;
  id v49;
  id v50;
  id v51;
  void (**v52)(id, uint64_t, _QWORD);
  id v53;
  id v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id location;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v6 = *(void **)(a1 + 80);
  v47 = *(_QWORD *)(a1 + 88);
  v54 = *(id *)(a1 + 40);
  v46 = v3;
  v50 = v3;
  v49 = v2;
  v51 = v4;
  v53 = v5;
  v52 = v6;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    if ((objc_msgSend(v53, "isEqual:", *(_QWORD *)(v1 + 80)) & 1) != 0)
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        HKDiagnosticStringFromUUID();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v1;
        v69 = 2114;
        v70 = v9;
        v71 = 2048;
        v72 = objc_msgSend(v54, "count");
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Batch %{public}@: Received %ld datums.", buf, 0x20u);

      }
      if (objc_msgSend(v54, "count"))
      {
        if (v49)
        {
          v66 = 0;
          v10 = v49;
          objc_msgSend((id)v1, "client");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "hd_validateMetadataKeysAndValuesWithClient:error:", v11, &v66);

          v13 = v66;
          v45 = v13;
          if ((v12 & 1) == 0)
          {
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, CFSTR("Failed to validate provided metadata"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "clientRemote_receivedBatch:error:", v51, v45);

            v52[2](v52, 1, 0);
LABEL_34:

            goto LABEL_35;
          }
        }
        else
        {
          v45 = 0;
        }
        objc_msgSend(*(id *)(v1 + 104), "objectForKeyedSubscript:", v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          obj = v54;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v63;
            while (2)
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v63 != v19)
                  objc_enumerationMutation(obj);
                v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                objc_msgSend(v21, "dateInterval");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "endDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "dateInterval");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "endDate");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v23, "hk_isBeforeOrEqualToDate:", v25);

                if (v26)
                {
                  -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)MEMORY[0x1E0CB35C8];
                  v32 = objc_opt_class();
                  objc_msgSend(v21, "dateInterval");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "endDate");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "dateInterval");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "endDate");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v32, sel__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion_, CFSTR("Out-of-order data received: got an end date of %@ but our last datum was %@"), v34, v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "clientRemote_receivedBatch:error:", v51, v37);

                  v52[2](v52, 1, 0);
                  goto LABEL_33;
                }
              }
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
              if (v18)
                continue;
              break;
            }
          }

        }
        objc_msgSend(*(id *)(v1 + 72), "quantityType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "code") == 5;

        v29 = MEMORY[0x1E0C809B0];
        if (v28)
        {
          objc_msgSend(v54, "hk_map:", &__block_literal_global_230);
          obj = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_2;
          v60[3] = &unk_1E6D0EE40;
          v61 = v49;
          objc_msgSend(v54, "hk_map:", v60);
          obj = (id)objc_claimAutoreleasedReturnValue();

        }
        if (!*(_QWORD *)(v1 + 104))
        {
          v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v39 = *(void **)(v1 + 104);
          *(_QWORD *)(v1 + 104) = v38;

        }
        objc_msgSend(obj, "lastObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 104), "setObject:forKeyedSubscript:", v40, v50);

        objc_initWeak(&location, (id)v1);
        v56[0] = v29;
        v56[1] = 3221225472;
        v56[2] = __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_3;
        v56[3] = &unk_1E6D0EE68;
        objc_copyWeak(&v58, &location);
        v41 = v51;
        v57 = v41;
        objc_msgSend(obj, "lastObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setSaveCompletion:", v56);

        objc_storeStrong((id *)(v1 + 56), v46);
        objc_msgSend(*(id *)(v1 + 88), "dataCollector:didCollectSensorData:device:options:", v1, obj, v50, v47);
        -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "clientRemote_receivedBatch:error:", v41, 0);

        if ((v47 & 1) != 0)
        {
          -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "clientRemote_finishedPersistenceForBatch:error:", v41, 0);

        }
        v52[2](v52, 1, 0);

        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);
LABEL_33:

        goto LABEL_34;
      }
      -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clientRemote_receivedBatch:error:", v51, 0);

      -[HDClientDataCollectionTaskServer _loggingClientProxy]((id)v1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientRemote_finishedPersistenceForBatch:error:", v51, 0);

      v52[2](v52, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 114, CFSTR("Server synchronization failed (expected %@, got %@)"), *(_QWORD *)(v1 + 80), v53);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v52)[2](v52, 0, v15);

    }
  }
LABEL_35:

}

- (void)remote_registerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke;
  v10[3] = &unk_1E6CE8030;
  v10[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke_199;
  v8[3] = &unk_1E6CED3F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "clientRemote_synchronizeWithCompletion:", v8);

}

void __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't flush data to client with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

void __66__HDClientDataCollectionTaskServer_remote_registerWithCompletion___block_invoke_199(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentProtectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceUnlockedSinceBoot");

  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 88))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    }
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(*(id *)(v6 + 72), "quantityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_error:format:", 1301, CFSTR("%@ does not appear to be a collectible type."), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseInaccessibleBeforeFirstUnlockError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (void)remote_synchronizeWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6568], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6568], "clientInterface");
}

- (void)connectionInvalidated
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HDStandardTaskServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTerminating");

  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[HDClientDataCollectionTaskServer description](self, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDataCollectorTaskServerConfiguration bundleIdentifier](self->_configuration, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDataAggregator description](self->_aggregator, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Unregistering data collector %{public}@ with bundle identifier %{public}@ from data aggregator: %{public}@", buf, 0x20u);

    }
    -[HDDataAggregator unregisterDataCollector:](self->_aggregator, "unregisterDataCollector:", self);
    v11.receiver = self;
    v11.super_class = (Class)HDClientDataCollectionTaskServer;
    -[HDStandardTaskServer connectionInvalidated](&v11, sel_connectionInvalidated);
  }
}

- (id)_loggingClientProxy
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[5];

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "client");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__HDClientDataCollectionTaskServer__loggingClientProxy__block_invoke;
    v5[3] = &unk_1E6CE8030;
    v5[4] = v1;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HDHeartRateSensorDatum quantityDatumWithHKQuantityDatum:](HDHeartRateSensorDatum, "quantityDatumWithHKQuantityDatum:", a2);
}

HDQuantityDatum *__118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HDQuantityDatum quantityDatumWithHKQuantityDatum:metadata:](HDQuantityDatum, "quantityDatumWithHKQuantityDatum:metadata:", a2, *(_QWORD *)(a1 + 32));
}

void __118__HDClientDataCollectionTaskServer__queue_insertDatums_device_metadata_options_batchUUID_registrationUUID_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _QWORD *WeakRetained;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = (id *)(a1 + 40);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = *(id *)(a1 + 32);
  v7 = v5;
  if (WeakRetained)
  {
    v8 = WeakRetained[5];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__HDClientDataCollectionTaskServer__didFinishPersistenceForBatch_error___block_invoke;
    block[3] = &unk_1E6CE7FB8;
    block[4] = WeakRetained;
    v11 = v6;
    v12 = v7;
    dispatch_async(v8, block);

  }
}

void __72__HDClientDataCollectionTaskServer__didFinishPersistenceForBatch_error___block_invoke(uint64_t a1)
{
  id v2;

  -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientRemote_finishedPersistenceForBatch:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __55__HDClientDataCollectionTaskServer__loggingClientProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error during XPC call to client proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)beginCollectionForDataAggregator:(id)a3 lastPersistedSensorDatum:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__HDClientDataCollectionTaskServer_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __94__HDClientDataCollectionTaskServer_beginCollectionForDataAggregator_lastPersistedSensorDatum___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52A8];
  v4 = *MEMORY[0x1E0CB52A8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v13 = 138543362;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring duplicate registration request", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning collection for aggregator: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = v8;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6A30], "quantityDatumWithHDQuantityDatum:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientRemote_beginCollectionWithConfiguration:lastPersistedDatum:registrationUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

  }
}

- (void)dataAggregator:(id)a3 wantsCollectionWithConfiguration:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HDClientDataCollectionTaskServer_dataAggregator_wantsCollectionWithConfiguration___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __84__HDClientDataCollectionTaskServer_dataAggregator_wantsCollectionWithConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  -[HDClientDataCollectionTaskServer _loggingClientProxy](*(id *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "collectionInterval");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCollectionInterval:");
  objc_msgSend(*(id *)(a1 + 40), "collectionLatency");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCollectionLatency:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCollectionType:", objc_msgSend(*(id *)(a1 + 40), "collectionType"));
  objc_msgSend(v2, "clientRemote_collectionConfigurationDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

}

- (id)identifierForDataAggregator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HKDataCollectorTaskServerConfiguration bundleIdentifier](self->_configuration, "bundleIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataCollectorTaskServerConfiguration quantityType](self->_configuration, "quantityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sourceForDataAggregator:(id)a3
{
  return self->_clientSource;
}

- (Class)sensorDatumClassForAggregator:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)dataAggregator:(id)a3 didPersistDatums:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v9 = a4;
  v10 = a6;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__HDClientDataCollectionTaskServer_dataAggregator_didPersistDatums_success_error___block_invoke;
  v14[3] = &unk_1E6CEDB28;
  v17 = a5;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v14);

}

void __82__HDClientDataCollectionTaskServer_dataAggregator_didPersistDatums_success_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v22;
      v7 = (os_log_t *)MEMORY[0x1E0CB52A8];
      *(_QWORD *)&v4 = 138543362;
      v20 = v4;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v2);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            objc_msgSend(v10, "saveCompletion");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              _HKInitializeLogging();
              v12 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
              {
                v13 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = v20;
                v27 = v13;
                _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling completion for datum(s) inserted via HKDataCollector", buf, 0xCu);
              }
              objc_msgSend(v10, "saveCompletion", v20, (_QWORD)v21);
              v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v14[2](v14, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

            }
          }
          ++v8;
        }
        while (v5 != v8);
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v5);
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v2 = v15;
    v18 = objc_msgSend(v16, "count");
    v19 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v27 = v17;
    v28 = 2048;
    v29 = v18;
    v30 = 2114;
    v31 = v19;
    _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failed persistence for %ld datums: %{public}@", buf, 0x20u);
LABEL_15:

  }
}

- (void)dataAggregator:(id)a3 requestsCollectionThroughDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *queue;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  HDClientDataCollectionTaskServer *v30;
  id v31;
  id v32;
  int v33;
  _QWORD aBlock[5];
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  char v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__194;
  v42 = __Block_byref_object_dispose__194;
  v43 = 0;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke;
  aBlock[3] = &unk_1E6D0EE90;
  aBlock[4] = self;
  v36 = v44;
  v37 = &v38;
  v12 = v10;
  v35 = v12;
  v13 = _Block_copy(aBlock);
  -[HDStandardTaskServer client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "process");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "processIdentifier");
  v17 = objc_alloc(MEMORY[0x1E0CFE308]);
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2;
  v28[3] = &unk_1E6D0EEB8;
  v18 = v15;
  v33 = v16;
  v29 = v18;
  v30 = self;
  v19 = v13;
  v32 = v19;
  v20 = v9;
  v31 = v20;
  v21 = objc_msgSend(v17, "initWithPID:flags:reason:name:withHandler:", v16, 3, 4, CFSTR("HealthKit Background Data Collection Flush"), v28);
  v22 = (void *)v39[5];
  v39[5] = v21;

  v23 = dispatch_time(0, 2000000000);
  queue = self->_queue;
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_4;
  v26[3] = &unk_1E6CE7DE0;
  v27 = v19;
  v25 = v19;
  dispatch_after(v23, queue, v26);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);

}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 40));
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "invalidate");
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52A8];
  v5 = *MEMORY[0x1E0CB52A8];
  if (!a2)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v15 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v15, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 1024;
    v24 = v16;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Failed to acquire data collection flush assertion for %{public}@ (%d)", buf, 0x12u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 1024;
    v24 = v9;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "Acquired data collection flush assertion for %{public}@ (%d)", buf, 0x12u);
LABEL_4:

  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_228;
  v19[3] = &unk_1E6CECF40;
  v19[4] = *(_QWORD *)(a1 + 40);
  v20 = *(id *)(a1 + 56);
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2_230;
  v17[3] = &unk_1E6CED3F8;
  v14 = *(_QWORD *)(a1 + 48);
  v17[4] = *(_QWORD *)(a1 + 40);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v13, "clientRemote_collectThroughDate:completion:", v14, v17);

}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to request data collection flush from client: %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_229;
  v9[3] = &unk_1E6CE8C48;
  v10 = v3;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v6, v9);

}

uint64_t __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_2_230(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_3;
  block[3] = &unk_1E6CEBC78;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_sync(v7, block);

}

uint64_t __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __92__HDClientDataCollectionTaskServer_dataAggregator_requestsCollectionThroughDate_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 103, CFSTR("Failed to finish client-side flush in a timely fashion."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return -[HKDataCollectorTaskServerConfiguration canResumeFromLastDatum](self->_configuration, "canResumeFromLastDatum");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataCollectorTaskServerConfiguration bundleIdentifier](self->_configuration, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataCollectorTaskServerConfiguration quantityType](self->_configuration, "quantityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSource, 0);
  objc_storeStrong((id *)&self->_lastDatumByDevice, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_registrationUUID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_dataCollectorState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
