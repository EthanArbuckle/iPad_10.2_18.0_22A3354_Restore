@implementation HDDeviceQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  _QWORD aBlock[7];
  _QWORD v22[3];
  char v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HDDeviceQueryServer;
  -[HDQueryServer _queue_start](&v28, sel__queue_start);
  -[HDQueryServer objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__75;
  v26[4] = __Block_byref_object_dispose__75;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__75;
  v24[4] = __Block_byref_object_dispose__75;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 1;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HDDeviceQueryServer__queue_start__block_invoke;
  aBlock[3] = &unk_1E6CF58A0;
  aBlock[4] = self;
  aBlock[5] = v24;
  aBlock[6] = v22;
  v5 = _Block_copy(aBlock);
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_188;
  v15[3] = &unk_1E6CF58F0;
  v15[4] = self;
  v9 = v3;
  v16 = v9;
  v18 = v26;
  v19 = v24;
  v10 = v5;
  v17 = v10;
  v11 = objc_msgSend(v8, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, &v20, v15, 0);
  v12 = v20;

  if (v11)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
  else
  {
    -[HDQueryServer clientProxy](self, "clientProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryUUID](self, "queryUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "client_deliverError:forQuery:", v12, v14);

  }
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

void __35__HDDeviceQueryServer__queue_start__block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_2;
  v14[3] = &unk_1E6CF5878;
  v4 = a1[4];
  v5 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v14[1] = 3221225472;
  v14[4] = v4;
  objc_msgSend(v5, "hk_map:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (void *)a1[4];
  if (v10)
  {
    objc_msgSend(v10, "clientProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)a1[4];
  }
  else
  {
    v11 = 0;
  }
  v12 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  objc_msgSend(v10, "queryUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientRemote_deliverDevices:done:reset:query:", v6, a2, v12, v13);

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
}

id __35__HDDeviceQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "deviceForPersistentID:error:", v3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (!v6)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v13 = v10;
      v14 = 2114;
      v15 = v3;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup device for ID %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v6;
}

uint64_t __35__HDDeviceQueryServer__queue_start__block_invoke_188(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  __int128 v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationOracle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "readAuthorizationStatusForType:error:", *(_QWORD *)(a1 + 40), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, "authorizationStatus") == 103 || objc_msgSend(v9, "authorizationStatus") == 101)
      && !objc_msgSend(v9, "authorizationMode"))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "additionalAuthorizationPredicateForObjectType:error:", v12, a3);
      v13 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v13;
      if (v13)
      {
        v33 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dataObjectClass"), "hd_dataEntityClass");
        objc_msgSend(*(id *)(a1 + 32), "profile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deviceManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "deviceEntityForNoDeviceWithError:", a3);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v36, "persistentID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateWithProperty:notEqualToValue:", CFSTR("data_provenances.device_id"), v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HDSampleEntityPredicateForDataType(v18);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "filter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "profile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "predicateWithProfile:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v21;
        objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v35, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v23, v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v24, v37);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_alloc_init(MEMORY[0x1E0D298A0]);
        objc_msgSend(v26, "setEntityClass:", v33);
        objc_msgSend(v26, "setPredicate:", v25);
        v27 = objc_alloc(MEMORY[0x1E0D29898]);
        objc_msgSend(v5, "databaseForEntityClass:", v33);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v27, "initWithDatabase:descriptor:", v28, v26);

        v42[0] = CFSTR("data_provenances.device_id");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __35__HDDeviceQueryServer__queue_start__block_invoke_2_198;
        v39[3] = &unk_1E6CF58C8;
        v31 = *(_QWORD *)(a1 + 64);
        v39[4] = *(_QWORD *)(a1 + 32);
        v41 = v31;
        v34 = *(_OWORD *)(a1 + 48);
        v32 = (id)v34;
        v40 = v34;
        v10 = objc_msgSend(v29, "enumerateProperties:error:enumerationHandler:", v30, a3, v39);

        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 4, CFSTR("Client is not authorized for this query."));
    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

uint64_t __35__HDDeviceQueryServer__queue_start__block_invoke_2_198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldStopProcessingQuery") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "_shouldSuspendQuery") & 1) != 0)
  {
    return 0;
  }
  MEMORY[0x1BCCAB1C8](a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= 0x64)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);
  }

  return 1;
}

@end
