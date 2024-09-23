@implementation HDDateRangeQueryServer

- (HDDateRangeQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDDateRangeQueryServer *v11;
  NSMutableSet *v12;
  NSMutableSet *sampleTypesToReFetch;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDDateRangeQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    sampleTypesToReFetch = v11->_sampleTypesToReFetch;
    v11->_sampleTypesToReFetch = v12;

    objc_msgSend(v10, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryQueue](v11, "queryQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addProtectedDataObserver:queue:", v11, v16);

  }
  return v11;
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
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v8.receiver = self;
  v8.super_class = (Class)HDDateRangeQueryServer;
  -[HDQueryServer _queue_start](&v8, sel__queue_start);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  +[HDSampleEntity dateIntervalsForSampleTypes:profile:error:](HDSampleEntity, "dateIntervalsForSampleTypes:profile:error:", 0, v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v6)
  {
    objc_storeStrong((id *)&self->_dateIntervalsBySampleType, v6);
    self->_resultsDirty = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke;
    v9[3] = &unk_1E6CE80E8;
    v9[4] = self;
    -[HDQueryServer onQueue:](self, "onQueue:", v9);
  }
  else
  {
    -[HDDateRangeQueryServer _deliverErrorToClient:](self, v5);
  }

}

- (void)_deliverErrorToClient:(void *)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "clientProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client_deliverError:forQuery:", v3, v4);

  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HDDateRangeQueryServer_samplesAdded_anchor___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[HDQueryServer onQueue:](self, "onQueue:", v7);

}

void __46__HDDateRangeQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  int *v21;
  _BYTE *v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  char isKindOfClass;
  id obj;
  _BYTE *v45;
  int v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v1 = *(_BYTE **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v45 = v1;
  if (!v1)
    goto LABEL_36;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v9, "sampleType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11 || (objc_msgSend(v9, "_startTimestamp"), v13 = v12, objc_msgSend(v11, "_startTimestamp"), v13 < v14))
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);
        objc_msgSend(v50, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_msgSend(v9, "_endTimestamp"), v17 = v16, objc_msgSend(v15, "_endTimestamp"), v17 > v18))
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v6);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (!v49)
  {

    goto LABEL_35;
  }
  v42 = v2;
  v20 = 0;
  v47 = *(_QWORD *)v52;
  v48 = v3;
  v21 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
  v22 = v45;
  obj = v19;
  do
  {
    for (j = 0; j != v49; ++j)
    {
      if (*(_QWORD *)v52 != v47)
        objc_enumerationMutation(obj);
      v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
      objc_msgSend(v3, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&v22[v21[568]], "objectForKeyedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v25, "startDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "endDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v38, "initWithStartDate:endDate:", v39, v40);

        objc_msgSend(*(id *)&v22[v21[568]], "setObject:forKeyedSubscript:", v28, v24);
        v20 = 1;
        goto LABEL_30;
      }
      v28 = v27;
      v46 = v20;
      v29 = v21;
      objc_msgSend(v27, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "earlierDate:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "laterDate:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "isEqualToDate:", v32))
      {
        objc_msgSend(v28, "endDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "isEqualToDate:", v35) & 1) != 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          v22 = v45;
          v20 = v46;
          if ((isKindOfClass & 1) == 0)
            goto LABEL_29;
          goto LABEL_28;
        }

      }
      v22 = v45;
LABEL_28:
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v32, v35);
      objc_msgSend(*(id *)&v22[v29[568]], "setObject:forKeyedSubscript:", v41, v24);

      v20 = 1;
LABEL_29:

      v21 = v29;
LABEL_30:

      v3 = v48;
    }
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  }
  while (v49);

  v2 = v42;
  if ((v20 & 1) != 0)
  {
    v22[200] = 1;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke;
    v59[3] = &unk_1E6CE80E8;
    v59[4] = v22;
    objc_msgSend(v22, "onQueue:", v59);
  }
LABEL_35:

LABEL_36:
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HDDateRangeQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[HDQueryServer onQueue:](self, "onQueue:", v7);

}

void __59__HDDateRangeQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  int v4;
  id v5;

  v1 = *(id **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isProtectedDataAvailable");

    if (v4)
      -[HDDateRangeQueryServer _queue_updateTimePeriodsForSampleTypes:]((uint64_t)v1, v5);
    else
      objc_msgSend(v1[27], "addObjectsFromArray:", v5);
  }

}

- (void)_queue_updateTimePeriodsForSampleTypes:(uint64_t)a1
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  _BYTE buf[24];
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x1E0CB5348];
  v5 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = a1;
    _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Updating periods for sample types", buf, 0xCu);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 208), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  objc_msgSend((id)a1, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  +[HDSampleEntity dateIntervalsForSampleTypes:profile:error:](HDSampleEntity, "dateIntervalsForSampleTypes:profile:error:", v6, v11, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;

  if (v12)
  {
    v22 = v13;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v12, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v12, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 208), "setObject:forKeyedSubscript:", v20, v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v16);
    }

    *(_BYTE *)(a1 + 200) = 1;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke;
    v35 = &unk_1E6CE80E8;
    v36 = a1;
    objc_msgSend((id)a1, "onQueue:", buf);
    v13 = v22;
  }
  else
  {
    _HKInitializeLogging();
    v21 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Error reading intervals from sample types: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(v13, "hk_isDatabaseAccessibilityError"))
      objc_msgSend(*(id *)(a1 + 216), "addObjectsFromArray:", v6);
    else
      -[HDDateRangeQueryServer _deliverErrorToClient:]((void *)a1, v13);
  }

}

void __59__HDDateRangeQueryServer__queue_sendUpdatedResultsToClient__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 200))
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 208);
      v9 = v2;
      v10 = 138543618;
      v11 = v7;
      v12 = 2048;
      v13 = objc_msgSend(v8, "count");
      _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Sending %lu updated results to client", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "clientProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[26];
    objc_msgSend(v4, "queryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverDateIntervals:forQuery:", v5, v6);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  id v7;

  v4 = a4;
  -[HDQueryServer queryQueue](self, "queryQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self && v4)
  {
    if (-[NSMutableSet count](self->_sampleTypesToReFetch, "count"))
    {
      -[NSMutableSet allObjects](self->_sampleTypesToReFetch, "allObjects");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeAllObjects](self->_sampleTypesToReFetch, "removeAllObjects");
      -[HDDateRangeQueryServer _queue_updateTimePeriodsForSampleTypes:]((uint64_t)self, v7);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTypesToReFetch, 0);
  objc_storeStrong((id *)&self->_dateIntervalsBySampleType, 0);
}

@end
