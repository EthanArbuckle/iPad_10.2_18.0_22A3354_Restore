@implementation HDSeriesQuantityEventObserver

- (HDSeriesQuantityEventObserver)initWithProfile:(id)a3
{
  id v4;
  HDSeriesQuantityEventObserver *v5;
  HDSeriesQuantityEventObserver *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSeriesQuantityEventObserver;
  v5 = -[HDSeriesQuantityEventObserver init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "dataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48B8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forDataType:", v6, v9);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48D8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forDataType:", v6, v12);

  }
  return v6;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  NSObject *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  _BYTE buf[24];
  void *v48;
  HDSeriesQuantityEventObserver *v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48B8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48D8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    v10 = *MEMORY[0x1E0CB5CA8];
    v11 = *MEMORY[0x1E0CB5C78];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v13, "_source", v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "_isLocalDevice"))
          goto LABEL_11;
        objc_msgSend(v13, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceNow");
        v17 = v16;

        if (v17 >= -600.0)
        {
          objc_msgSend(v13, "sampleType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v34);

          v20 = v11;
          if ((v19 & 1) != 0
            || (objc_msgSend(v13, "sampleType", v11),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v21, "isEqual:", v33),
                v21,
                v20 = v10,
                v22))
          {
            objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", v20);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);
LABEL_11:

            continue;
          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v8);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = v6;
  v23 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v38 != v25)
          objc_enumerationMutation(v35);
        v27 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * j);
        if (self)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v27;
            _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Observed addition of notification event. Requesting series data of type %{public}@ to get frozen.", buf, 0x16u);
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          objc_msgSend(WeakRetained, "dataCollectionManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __54__HDSeriesQuantityEventObserver__freezeSeriesForType___block_invoke;
          v48 = &unk_1E6CEB718;
          v49 = self;
          v50 = v27;
          objc_msgSend(v30, "requestAggregationThroughDate:types:mode:options:completion:", v31, v32, 0, 3, buf);

        }
      }
      v24 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v24);
  }

}

void __54__HDSeriesQuantityEventObserver__freezeSeriesForType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAppleWatch");

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v10, "nanoSyncManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("audio-exposure-event"), 0);

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error freezing series of type %{public}@. %{public}@", (uint8_t *)&v15, 0x20u);
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
