@implementation HDWorkoutRouteQueryServer

- (HDWorkoutRouteQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDWorkoutRouteQueryServer *v11;
  uint64_t v12;
  HKWorkoutRoute *locationSeries;
  uint64_t v14;
  NSUUID *workoutUUID;
  uint64_t v16;
  NSDateInterval *dateInterval;
  objc_super v19;

  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDWorkoutRouteQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v19, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "workoutRoute");
    v12 = objc_claimAutoreleasedReturnValue();
    locationSeries = v11->_locationSeries;
    v11->_locationSeries = (HKWorkoutRoute *)v12;

    objc_msgSend(v10, "workoutUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    workoutUUID = v11->_workoutUUID;
    v11->_workoutUUID = (NSUUID *)v14;

    objc_msgSend(v10, "dateInterval");
    v16 = objc_claimAutoreleasedReturnValue();
    dateInterval = v11->_dateInterval;
    v11->_dateInterval = (NSDateInterval *)v16;

    v11->_batchThreshold = 100;
  }

  return v11;
}

- (void)unitTest_setBatchThreshold:(unint64_t)a3
{
  self->_batchThreshold = a3;
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
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, _QWORD *);
  void *v17;
  HDWorkoutRouteQueryServer *v18;
  id v19;
  id v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HDWorkoutRouteQueryServer;
  -[HDQueryServer _queue_start](&v30, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6B50], "workoutRouteType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v5, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;

  if (!v6)
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v7, v3);
LABEL_7:
    v13 = v7;
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "canRead") & 1) == 0)
  {
    objc_msgSend(v4, "client_deliverWorkoutRouteLocations:isFinal:query:", MEMORY[0x1E0C9AA60], 1, v3);
    goto LABEL_7;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__116;
  v27 = __Block_byref_object_dispose__116;
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDQueryServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __41__HDWorkoutRouteQueryServer__queue_start__block_invoke;
  v17 = &unk_1E6CF1628;
  v18 = self;
  v21 = &v23;
  v10 = v4;
  v19 = v10;
  v11 = v3;
  v20 = v11;
  v12 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDLocationSeriesSampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, &v22, &v14);
  v13 = v22;

  if (v12)
    objc_msgSend(v10, "client_deliverWorkoutRouteLocations:isFinal:query:", v24[5], 1, v11, v14, v15, v16, v17, v18, v19);
  else
    objc_msgSend(v10, "client_deliverError:forQuery:", v13, v11, v14, v15, v16, v17, v18, v19);

  _Block_object_dispose(&v23, 8);
LABEL_10:

}

uint64_t __41__HDWorkoutRouteQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_class *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  _QWORD *v53;
  id obj;
  void *v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[4];
  id v67;
  _BYTE v68[128];
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v56 = a2;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[26])
  {
    v69 = v5[26];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "client");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], a3);

    if (!v35)
      goto LABEL_26;
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "metadataManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x1E0CB7360];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "predicateWithMetadataKey:value:operatorType:", v38, v39, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = *(_QWORD *)(a1 + 32);
    if (!v33)
    {

      goto LABEL_34;
    }
    v41 = (objc_class *)MEMORY[0x1E0C99DE8];
    v42 = v40;
    v43 = objc_alloc_init(v41);
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", 102);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v33, "profile");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setPredicate:", v42);
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setOrderingTerms:", v48);

    objc_msgSend(v46, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __67__HDWorkoutRouteQueryServer__workoutRoutesMatchingPredicate_error___block_invoke;
    v66[3] = &unk_1E6CF89B8;
    v67 = v43;
    v6 = v43;
    v49 = objc_msgSend(v46, "enumerateWithError:handler:", a3, v66) ? v6 : 0;
    v50 = v49;

    if (!v50)
    {
LABEL_26:
      v33 = 0;
      goto LABEL_34;
    }
  }
  objc_msgSend(v56, "databaseForEntityClass:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v7)
  {
    v8 = v7;
    v53 = a3;
    v9 = *(_QWORD *)v63;
    v10 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
      v13 = v10[410];
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + v13))
        goto LABEL_13;
      objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v11), "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "hk_isBeforeDate:", v15);

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v12, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "hk_isAfterDate:", v18);

        if ((v19 & 1) == 0)
          break;
      }
LABEL_17:
      if (v8 == ++v11)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_19;
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "hk_isAfterDate:", v21);

    if (v22)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_13:
      v23 = 0;
    }
    objc_msgSend(v12, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDLocationSeriesSampleEntity, "anyInDatabase:predicate:error:", v55, v25, &v61);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v61;
    v28 = v27;
    if (!v26)
    {
      if (v27)
      {
        if (v53)
        {
          v28 = objc_retainAutorelease(v27);
          *v53 = v28;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
      else
      {
        v51 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v12, "UUID");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "hk_assignError:code:format:", v53, 100, CFSTR("Did not find the expected sample with UUID=%@"), v28);
      }
LABEL_32:

      v33 = 0;
      goto LABEL_33;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v13), "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __41__HDWorkoutRouteQueryServer__queue_start__block_invoke_2;
    v57[3] = &unk_1E6CFCAA8;
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(void **)(a1 + 40);
    v60 = *(_QWORD *)(a1 + 56);
    v57[4] = v30;
    v58 = v31;
    v59 = *(id *)(a1 + 48);
    v32 = objc_msgSend(v26, "enumerateLocationDataInTransaction:startDate:endDate:error:handler:", v56, v23, v29, v53, v57);

    if ((v32 & 1) == 0)
      goto LABEL_32;

    v10 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
    goto LABEL_17;
  }
LABEL_19:
  v33 = 1;
LABEL_33:

LABEL_34:
  return v33;
}

uint64_t __41__HDWorkoutRouteQueryServer__queue_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200))
  {
    objc_msgSend(*(id *)(a1 + 40), "client_deliverWorkoutRouteLocations:isFinal:query:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0, *(_QWORD *)(a1 + 48));
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v3);

  return 1;
}

uint64_t __67__HDWorkoutRouteQueryServer__workoutRoutesMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_locationSeries, 0);
}

@end
