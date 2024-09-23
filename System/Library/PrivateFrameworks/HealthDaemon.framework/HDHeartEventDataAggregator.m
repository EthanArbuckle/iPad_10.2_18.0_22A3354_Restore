@implementation HDHeartEventDataAggregator

- (id)_categoryType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB6378];
  v6 = a3;
  -[HDHeartEventDataAggregator _categoryType](self, "_categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v6[6], *MEMORY[0x1E0CB72B0]);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v5, "_categorySamplesSplittingDurationWithType:value:startDate:endDate:device:metadata:", v7, 0, v9, v11, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)didPersistObjects:(id)a3 lastDatum:(id)a4 collector:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id *v25;
  void *v26;
  BOOL v27;
  void *v28;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v11, "associatedSampleUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "hk_appendBytesWithUUID:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v10, "count") == 1)
  {
    v38 = v12;
    objc_msgSend(v10, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataAggregator dataCollectionManager](self, "dataCollectionManager");
    v21 = a6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[HDAssociationEntity insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:](HDAssociationEntity, "insertEntriesWithAssociationUUID:objectUUIDsData:type:destinationSubObjectReference:profile:error:", v20, v13, 0, 0, v23, v21);

    v25 = v21;
    if (!v24)
    {
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        v34 = v26;
        v35 = (void *)objc_opt_class();
        v36 = *v21;
        *(_DWORD *)buf = 138543874;
        v45 = v35;
        v46 = 2112;
        v47 = v11;
        v48 = 2114;
        v49 = v36;
        v37 = v35;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to associate heart event sample from sensor datum '%@': %{public}@", buf, 0x20u);

      }
    }
    v39.receiver = self;
    v39.super_class = (Class)HDHeartEventDataAggregator;
    v12 = v38;
    v27 = -[HDDataAggregator didPersistObjects:lastDatum:collector:error:](&v39, sel_didPersistObjects_lastDatum_collector_error_, v10, v11, v38, v25);

  }
  else
  {
    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v30 = v28;
      v31 = (void *)objc_opt_class();
      v32 = *a6;
      *(_DWORD *)buf = 138544130;
      v45 = v31;
      v46 = 2112;
      v47 = v10;
      v48 = 2112;
      v49 = v11;
      v50 = 2114;
      v51 = v32;
      v33 = v31;
      _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Not persisting unexpected objects [%@] from sensor datum'%@': %{public}@", buf, 0x2Au);

    }
    v27 = 0;
  }

  return v27;
}

- (void)triggerImmediateCloudSyncWithReason:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "dataCollectionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudSyncManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB6430]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
    v9 = (void *)objc_msgSend(v7, "initWithChangesSyncRequest:", v8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HDHeartEventDataAggregator_triggerImmediateCloudSyncWithReason___block_invoke;
    v10[3] = &unk_1E6CEB718;
    v10[4] = a1;
    v11 = v3;
    objc_msgSend(v6, "syncWithRequest:reason:completion:", v9, v11, v10);

  }
}

void __66__HDHeartEventDataAggregator_triggerImmediateCloudSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  v7 = *MEMORY[0x1E0CB52A8];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2114;
    v15 = v5;
    v11 = v13;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to complete cloud sync request with %{public}@", (uint8_t *)&v12, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(a1 + 40);
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v10;
    v11 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
LABEL_4:

  }
LABEL_6:

}

@end
