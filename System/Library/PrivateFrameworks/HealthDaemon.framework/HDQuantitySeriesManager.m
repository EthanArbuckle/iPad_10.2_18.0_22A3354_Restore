@implementation HDQuantitySeriesManager

- (HDQuantitySeriesManager)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDQuantitySeriesManager)initWithProfile:(id)a3
{
  id v4;
  HDQuantitySeriesManager *v5;
  HDQuantitySeriesManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *observerLock_observersByType;
  NSMutableDictionary *v9;
  NSMutableDictionary *observerLock_synchronousObserversByType;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDQuantitySeriesManager;
  v5 = -[HDQuantitySeriesManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_observerLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observerLock_observersByType = v6->_observerLock_observersByType;
    v6->_observerLock_observersByType = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observerLock_synchronousObserversByType = v6->_observerLock_synchronousObserversByType;
    v6->_observerLock_synchronousObserversByType = v9;

  }
  return v6;
}

- (BOOL)insertValues:(id)a3 series:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  HDQuantitySeriesManager *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HDQuantitySeriesManager *v23;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke;
  v20[3] = &unk_1E6CEB3F8;
  v21 = v8;
  v22 = v9;
  v23 = self;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_3;
  v16[3] = &unk_1E6CF9FB8;
  v17 = v21;
  v18 = v22;
  v19 = self;
  v13 = v22;
  v14 = v21;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDQuantitySampleSeriesEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v11, a5, v20, v16);

  return (char)a5;
}

uint64_t __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(a1[6], "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HDQuantitySampleSeriesEntity insertValues:series:profile:error:](HDQuantitySampleSeriesEntity, "insertValues:series:profile:error:", v6, v7, v8, a3);

  if (v9
    && (v10 = a1[5],
        objc_msgSend(a1[6], "profile"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        +[HDDataEntity dataEntityForObject:profile:error:](HDQuantitySampleSeriesEntity, "dataEntityForObject:profile:error:", v10, v11, a3), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, v12))
  {
    v14 = a1[5];
    v13 = (os_unfair_lock_s *)a1[6];
    v15 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "persistentID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQuantitySeriesManager _synchronousNotifyForValues:series:anchor:journaled:](v13, v15, v14, v16);

    objc_msgSend(v5, "protectedDatabase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_2;
    v21[3] = &unk_1E6CECCA8;
    v21[4] = a1[6];
    v22 = a1[4];
    v23 = a1[5];
    v24 = v12;
    v18 = v12;
    objc_msgSend(v17, "onCommit:orRollback:", v21, 0);

    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_synchronousNotifyForValues:(os_unfair_lock_s *)a1 series:(void *)a2 anchor:(void *)a3 journaled:(void *)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v8, "quantityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQuantitySeriesManager _synchronousObserversForType:](a1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__HDQuantitySeriesManager__synchronousNotifyForValues_series_anchor_journaled___block_invoke;
    v12[3] = &unk_1E6CFA030;
    v12[4] = a1;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    v16 = 0;
    objc_msgSend(v11, "notifyObservers:", v12);

  }
}

void __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(os_unfair_lock_s **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 56), "persistentID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySeriesManager _notifyForValues:series:anchor:journaled:](v1, v2, v3, v4, 0);

}

- (void)_notifyForValues:(void *)a3 series:(void *)a4 anchor:(char)a5 journaled:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  char v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    objc_msgSend(v10, "quantityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQuantitySeriesManager _observersForType:](a1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__HDQuantitySeriesManager__notifyForValues_series_anchor_journaled___block_invoke;
    v14[3] = &unk_1E6CFA030;
    v14[4] = a1;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = a5;
    objc_msgSend(v13, "notifyObservers:", v14);

  }
}

BOOL __53__HDQuantitySeriesManager_insertValues_series_error___block_invoke_3(void **a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v5 = a1[4];
  v6 = a1[5];
  objc_msgSend(a1[6], "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[HDQuantitySampleSeriesEntity insertValues:series:profile:error:](HDQuantitySampleSeriesEntity, "insertValues:series:profile:error:", v5, v6, v7, a3);

  if (v8)
  {
    -[HDQuantitySeriesManager _synchronousNotifyForValues:series:anchor:journaled:]((os_unfair_lock_s *)a1[6], a1[4], a1[5], 0);
    -[HDQuantitySeriesManager _notifyForValues:series:anchor:journaled:]((os_unfair_lock_s *)a1[6], a1[4], a1[5], 0, 1);
  }
  return v8;
}

- (id)freezeSeries:(id)a3 metadata:(id)a4 endDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:metadata:endDate:profile:error:](HDQuantitySampleSeriesEntity, "freezeSeriesWithIdentifier:metadata:endDate:profile:error:", v12, v11, v10, WeakRetained, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)discardSeries:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  HDDataDeletionConfiguration *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  HDDataDeletionConfiguration *v12;
  _QWORD v14[5];
  id v15;
  HDDataDeletionConfiguration *v16;
  _QWORD v17[5];
  id v18;
  HDDataDeletionConfiguration *v19;

  v6 = a3;
  if (objc_msgSend(v6, "_frozen"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot discard a frozen series."));
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc_init(HDDataDeletionConfiguration);
    -[HDDataDeletionConfiguration setGenerateDeletedObjects:](v8, "setGenerateDeletedObjects:", 0);
    -[HDDataDeletionConfiguration setFailIfNotFound:](v8, "setFailIfNotFound:", 0);
    -[HDDataDeletionConfiguration setNotifyObservers:](v8, "setNotifyObservers:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__HDQuantitySeriesManager_discardSeries_error___block_invoke;
    v17[3] = &unk_1E6CEB3F8;
    v17[4] = self;
    v18 = v6;
    v19 = v8;
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __47__HDQuantitySeriesManager_discardSeries_error___block_invoke_2;
    v14[3] = &unk_1E6CF9FB8;
    v14[4] = self;
    v15 = v18;
    v16 = v19;
    v12 = v19;
    v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDQuantitySampleSeriesEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v10, a4, v17, v14);

  }
  return v7;
}

uint64_t __47__HDQuantitySeriesManager_discardSeries_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "deleteObjectsWithUUIDCollection:configuration:error:", v9, *(_QWORD *)(a1 + 48), a3);

  if ((_DWORD)v10)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "quantityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "samplesOfTypesWereRemoved:anchor:transaction:", v13, 0, v5);

  }
  return v10;
}

uint64_t __47__HDQuantitySeriesManager_discardSeries_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "deleteObjectsWithUUIDCollection:configuration:error:", v8, *(_QWORD *)(a1 + 48), a3);

  if ((_DWORD)v9)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "quantityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "samplesOfTypesWereRemoved:anchor:transaction:", v12, 0, 0);

  }
  return v9;
}

- (void)_notifyObserver:(void *)a3 samplesAdded:(void *)a4 anchor:quantityCount:journaled:
{
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id WeakRetained;
  id v34;
  id obj;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void (**v43)(void);
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v34 = a3;
  v44 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v7, "transactionalQuantityInsertHandlerForProfile:journaled:count:");
    v43 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v34, "lastObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v34;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v38)
      {
        v36 = v7;
        v37 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v52 != v37)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v9, "codableQuantitySample");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "quantitySeriesDatas");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              v40 = i;
              objc_msgSend(v11, "lastObject");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "quantityType");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "canonicalUnit");
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v50 = 0u;
              v39 = v11;
              v41 = v11;
              v14 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              if (v14)
              {
                v15 = v14;
                v45 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    v17 = v12;
                    if (*(_QWORD *)v48 != v45)
                      objc_enumerationMutation(v41);
                    v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
                    v19 = (void *)MEMORY[0x1BCCACAC4]();
                    v20 = (void *)MEMORY[0x1E0CB6A28];
                    objc_msgSend(v18, "value");
                    objc_msgSend(v20, "quantityWithUnit:doubleValue:", v46);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_alloc(MEMORY[0x1E0CB3588]);
                    v23 = (void *)MEMORY[0x1E0C99D68];
                    objc_msgSend(v18, "startDate");
                    objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "endDate");
                    v26 = v25;
                    objc_msgSend(v18, "startDate");
                    v28 = (void *)objc_msgSend(v22, "initWithStartDate:duration:", v24, v26 - v27);

                    v12 = v17;
                    v43[2]();

                    objc_autoreleasePoolPop(v19);
                  }
                  v15 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
                }
                while (v15);
              }

              v7 = v36;
              v11 = v39;
              i = v40;
              v29 = (void *)v46;
            }
            else
            {
              v30 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v9, "startDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "endDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (void *)objc_msgSend(v30, "initWithStartDate:endDate:", v31, v32);

              objc_msgSend(v9, "quantity");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "quantityType");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(void (**)(void), void *, void *, void *, void *, id, BOOL))v43[2])(v43, v13, v29, v12, v9, v44, v42 == v9);
            }

          }
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v38);
      }

    }
  }

}

- (void)samplesAdded:(id)a3 type:(id)a4 anchor:(id)a5 transaction:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v30 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySeriesManager.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isKindOfClass:[HKQuantityType class]]"));

  }
  v14 = objc_msgSend(v11, "count");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v19), "codableQuantitySample");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "quantitySeriesDatas");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          v14 = v14 + objc_msgSend(v21, "count") - 1;

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v17);
  }

  -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke;
  v36[3] = &unk_1E6CF9FE0;
  v36[4] = self;
  v24 = v15;
  v37 = v24;
  v25 = v30;
  v38 = v25;
  v39 = v14;
  objc_msgSend(v22, "notifyObservers:", v36);
  v31[0] = v23;
  v31[1] = 3221225472;
  v31[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_2;
  v31[3] = &unk_1E6CE7D90;
  v31[4] = self;
  v32 = v12;
  v33 = v24;
  v34 = v25;
  v35 = v14;
  v26 = v25;
  v27 = v24;
  v28 = v12;
  -[HDQuantitySeriesManager _runOnCommitOfTransaction:block:]((uint64_t)self, v13, v31);

}

- (id)_synchronousObserversForType:(os_unfair_lock_s *)a1
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 6;
    v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
    objc_msgSend(*(id *)(v2 + 16), "objectForKeyedSubscript:", v4);
    v2 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return (id)v2;
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  -[HDQuantitySeriesManager _observersForType:](*(os_unfair_lock_s **)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_3;
  v5[3] = &unk_1E6CF9FE0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v2, "notifyObservers:", v5);

}

- (id)_observersForType:(os_unfair_lock_s *)a1
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 6;
    v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
    objc_msgSend(*(id *)(v2 + 8), "objectForKeyedSubscript:", v4);
    v2 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return (id)v2;
}

void __64__HDQuantitySeriesManager_samplesAdded_type_anchor_transaction___block_invoke_3(uint64_t a1, void *a2)
{
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_runOnCommitOfTransaction:(void *)a3 block:
{
  void (**v5)(_QWORD);
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1)
  {
    if (v6)
      objc_msgSend(v6, "onCommit:orRollback:", v5, &__block_literal_global_110);
    else
      v5[2](v5);
  }

}

- (void)samplesJournaled:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySeriesManager.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isKindOfClass:[HKQuantityType class]]"));

  }
  -[HDQuantitySeriesManager _observersForType:]((os_unfair_lock_s *)self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke;
  v17[3] = &unk_1E6CFA008;
  v17[4] = self;
  v11 = v7;
  v18 = v11;
  objc_msgSend(v9, "notifyObservers:", v17);
  -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke_2;
  v15[3] = &unk_1E6CFA008;
  v15[4] = self;
  v16 = v11;
  v13 = v11;
  objc_msgSend(v12, "notifyObservers:", v15);

}

void __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "count");
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](v2, v4, v3, 0);

}

void __49__HDQuantitySeriesManager_samplesJournaled_type___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "count");
  -[HDQuantitySeriesManager _notifyObserver:samplesAdded:anchor:quantityCount:journaled:](v2, v4, v3, 0);

}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4 transaction:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  HDQuantitySeriesManager *v22;
  SEL v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySeriesManager.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isKindOfClass:[HKQuantityType class]]"));

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        -[HDQuantitySeriesManager _synchronousObserversForType:]((os_unfair_lock_s *)self, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke;
        v24[3] = &unk_1E6CFA008;
        v25 = WeakRetained;
        v26 = v12;
        v15 = WeakRetained;
        objc_msgSend(v14, "notifyObservers:", v24);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_2;
  v20[3] = &unk_1E6CE9C58;
  v22 = self;
  v23 = a2;
  v21 = v7;
  v17 = v7;
  -[HDQuantitySeriesManager _runOnCommitOfTransaction:block:]((uint64_t)self, v18, v20);

}

uint64_t __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profile:didDiscardSeriesOfType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("HDQuantitySeriesManager.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isKindOfClass:[HKQuantityType class]]"));

        }
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
        -[HDQuantitySeriesManager _observersForType:](*(os_unfair_lock_s **)(a1 + 40), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v5;
        v13[1] = 3221225472;
        v13[2] = __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_3;
        v13[3] = &unk_1E6CFA008;
        v14 = WeakRetained;
        v15 = v7;
        v10 = WeakRetained;
        objc_msgSend(v9, "notifyObservers:", v13);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

uint64_t __72__HDQuantitySeriesManager_samplesOfTypesWereRemoved_anchor_transaction___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profile:didDiscardSeriesOfType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addObserver:(id)a3 forType:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_observerLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerLock_observersByType, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _HKInitializeLogging();
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("series-observers-%@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithName:loggingCategory:", v12, *MEMORY[0x1E0CB52C0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observerLock_observersByType, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(v10, "registerObserver:queue:", v13, v9);
  os_unfair_lock_unlock(&self->_observerLock);

}

- (void)addSynchronousObserver:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_observerLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerLock_synchronousObserversByType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _HKInitializeLogging();
    v8 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("series-observers-%@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithName:loggingCategory:", v9, *MEMORY[0x1E0CB52C0]);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observerLock_synchronousObserversByType, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "registerObserver:", v10);
  os_unfair_lock_unlock(&self->_observerLock);

}

- (void)removeObserver:(id)a3 forType:(id)a4
{
  os_unfair_lock_s *p_observerLock;
  id v7;
  id v8;
  void *v9;
  void *v10;

  p_observerLock = &self->_observerLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerLock_observersByType, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unregisterObserver:", v8);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerLock_synchronousObserversByType, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unregisterObserver:", v8);
  os_unfair_lock_unlock(p_observerLock);
}

- (void)_notifyObserver:(void *)a3 values:(void *)a4 series:(void *)a5 anchor:(uint64_t)a6 journaled:
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  float v21;
  id v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void (**v34)(void);
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v36 = a5;
  if (a1)
  {
    objc_msgSend(v13, "quantityType");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v11, "transactionalQuantityInsertHandlerForProfile:journaled:count:", WeakRetained, a6, objc_msgSend(v12, "count"));
    v34 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v30 = WeakRetained;
      v32 = v11;
      objc_msgSend(v12, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v31 = v12;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v38 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v20, "hasDuration"))
            {
              objc_msgSend(v20, "duration");
              if (v21 >= 0.0)
              {
                v22 = objc_alloc(MEMORY[0x1E0CB3588]);
                v23 = (void *)MEMORY[0x1E0C99D68];
                objc_msgSend(v20, "timeInterval");
                objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "duration");
                v26 = (void *)objc_msgSend(v22, "initWithStartDate:duration:", v24, v25);

                v27 = (void *)MEMORY[0x1E0CB6A28];
                objc_msgSend(v35, "canonicalUnit");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "value");
                objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                v34[2]();
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v17);
      }

      v12 = v31;
      v11 = v32;
      WeakRetained = v30;
    }

  }
}

void __68__HDQuantitySeriesManager__notifyForValues_series_anchor_journaled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1BCCACAC4]();
  -[HDQuantitySeriesManager _notifyObserver:values:series:anchor:journaled:](*(_QWORD *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  objc_autoreleasePoolPop(v3);

}

void __79__HDQuantitySeriesManager__synchronousNotifyForValues_series_anchor_journaled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1BCCACAC4]();
  -[HDQuantitySeriesManager _notifyObserver:values:series:anchor:journaled:](*(_QWORD *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  objc_autoreleasePoolPop(v3);

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observerLock_synchronousObserversByType, 0);
  objc_storeStrong((id *)&self->_observerLock_observersByType, 0);
}

@end
