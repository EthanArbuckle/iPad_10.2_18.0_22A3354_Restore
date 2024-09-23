@implementation HMBLocalZone

- (id)observersForModelWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMBLocalZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone modelObserversByModelID](self, "modelObserversByModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  -[HMBLocalZone observersForAllModels](self, "observersForAllModels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  os_unfair_lock_unlock(&self->_propertyLock);
  v11 = (void *)MEMORY[0x1D17B6230]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v14;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Notifying observers for model ID %@: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

- (void)queueIncompleteProcesses
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMBLocalZone *v6;
  NSObject *v7;
  void *v8;
  HMBLocalSQLIteratorRowRollbackBlock *v9;
  void *v10;
  HMBLocalSQLIteratorRowRollbackBlock *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  HMBLocalZone *v18;
  NSObject *v19;
  void *v20;
  HMBLocalSQLIteratorRowInputBlock *v21;
  void *v22;
  HMBLocalSQLIteratorRowInputBlock *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  HMBLocalZone *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  HMBLocalZone *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMBLocalSQLIteratorRowInputBlock *v41;
  HMBLocalSQLIteratorRowRollbackBlock *obj;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[HMBLocalZone sql](self, "sql");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke;
  v52[3] = &unk_1E8933B28;
  v52[4] = self;
  objc_msgSend(v3, "sqlBlockWithActivity:block:", 0, v52);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v8;
      v57 = 2112;
      v58 = v4;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete null items/blocks: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  v40 = (void *)v4;
  v9 = [HMBLocalSQLIteratorRowRollbackBlock alloc];
  -[HMBLocalZone sql](self, "sql");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMBLocalSQLIteratorRowRollbackBlock initWithSQLContext:zoneRow:](v9, "initWithSQLContext:zoneRow:", v10, -[HMBLocalZone zoneRow](self, "zoneRow"));

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v11;
  v12 = -[HMBLocalSQLIteratorRowRollbackBlock countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D17B6230]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v20;
          v57 = 2112;
          v58 = (uint64_t)v16;
          _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Rolling back block: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        __rollbackBlock(v18, v16);
      }
      v13 = -[HMBLocalSQLIteratorRowRollbackBlock countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v13);
  }

  v21 = [HMBLocalSQLIteratorRowInputBlock alloc];
  -[HMBLocalZone sql](self, "sql");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMBLocalSQLIteratorRowInputBlock initWithSQLContext:zoneRow:](v21, "initWithSQLContext:zoneRow:", v22, -[HMBLocalZone zoneRow](self, "zoneRow"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v41 = v23;
  v24 = -[HMBLocalSQLIteratorRowInputBlock countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v41);
        v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1D17B6230]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v56 = v32;
          v57 = 2112;
          v58 = (uint64_t)v28;
          _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Processing input block: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        v33 = objc_alloc_init(MEMORY[0x1E0D519D8]);
        __processRecords(v30, (void *)objc_msgSend(v28, "blockRow"), v33);

      }
      v25 = -[HMBLocalSQLIteratorRowInputBlock countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v25);
  }

  -[HMBLocalZone sql](self, "sql");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke_80;
  v43[3] = &unk_1E8933B28;
  v43[4] = self;
  objc_msgSend(v34, "sqlBlockWithActivity:block:", 0, v43);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x1D17B6230]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v39;
      v57 = 2112;
      v58 = (uint64_t)v35;
      _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete zombie records: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
  }

}

- (id)triggerProcessForBlockRow:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void **);
  void *v16;
  id v17;
  id v18[2];
  id location;

  v5 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  objc_initWeak(&location, self);
  -[HMBLocalZone localDatabase](self, "localDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB34C8];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __51__HMBLocalZone_Process__triggerProcessForBlockRow___block_invoke;
  v16 = &unk_1E8931380;
  objc_copyWeak(v18, &location);
  v9 = v5;
  v17 = v9;
  v18[1] = (id)a3;
  objc_msgSend(v8, "blockOperationWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v10, v13, v14, v15, v16);

  objc_msgSend(v9, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  return v11;
}

void __51__HMBLocalZone_Process__triggerProcessForBlockRow___block_invoke(void **a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    __processRecords(WeakRetained, a1[6], a1[4]);
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_ERROR, "%{public}@lost self for processing block!", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v7 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:", v8);

  }
}

id __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v10 = 0;
  objc_msgSend(v4, "_deleteNullItemsWithZoneRow:error:", objc_msgSend(v3, "zoneRow"), &v10);
  v5 = v10;
  v6 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v9 = v5;
  objc_msgSend(v4, "_deleteNullBlocksWithZoneRow:error:", v6, &v9);

  v7 = v9;
  return v7;
}

id __49__HMBLocalZone_Process__queueIncompleteProcesses__block_invoke_80(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = 0;
  objc_msgSend(v3, "_deleteZombieRecordsWithZoneRow:error:", objc_msgSend(v2, "zoneRow"), &v5);

  return v5;
}

+ (id)outputBlockRowForTuple:(id)a3 activity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  id v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "previousContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  if (!v11)
    v11 = (void *)objc_opt_class();
  if (objc_msgSend(v11, "hmbExcludeFromCloudStorage"))
  {
    v12 = MEMORY[0x1D17B6230]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v33 = v12;
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v7;
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmbModelID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        objc_msgSend(v10, "hmbModelID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138544130;
      v38 = v15;
      v39 = 2114;
      v40 = v17;
      v41 = 2112;
      v42 = v19;
      v43 = 2048;
      v44 = objc_msgSend(v6, "itemRow");
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Skipping mirror output push for model ID %@ and row %ld since the model is set to exclude cloud storage", buf, 0x2Au);
      if (!v18)

      v12 = v33;
      v7 = v34;
    }

    v20 = (void *)v12;
  }
  else
  {
    objc_msgSend(v10, "hmbSetProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __57__HMBLocalZone_Process__outputBlockRowForTuple_activity___block_invoke;
    v36[3] = &__block_descriptor_40_e18_B16__0__NSString_8lu32l8;
    v36[4] = v11;
    v22 = objc_msgSend(v21, "na_all:", v36);

    if (!v22)
    {
      objc_msgSend(v6, "outputBlockRow");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v23 = MEMORY[0x1D17B6230]();
    v24 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shortDescription");
      v35 = v7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmbModelID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v6, "itemRow");
      *(_DWORD *)buf = 138544130;
      v38 = v26;
      v39 = 2114;
      v40 = v28;
      v41 = 2112;
      v42 = v29;
      v43 = 2048;
      v44 = v30;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Skipping mirror output push for updated model ID %@ and row %ld since the only set properties are excluded from cloud storage", buf, 0x2Au);

      v7 = v35;
    }

    v20 = (void *)v23;
  }
  objc_autoreleasePoolPop(v20);
  v31 = 0;
LABEL_17:

  return v31;
}

+ (BOOL)shouldMirrorInputExternalData:(id)a3 overwriteExistingExternalData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v39 = 0;
      objc_msgSend(MEMORY[0x1E0C95048], "recordFromExternalData:error:", v6, &v39);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v39;
      if (v9)
      {
        v38 = v10;
        objc_msgSend(MEMORY[0x1E0C95048], "recordFromExternalData:error:", v8, &v38);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v38;

        v13 = (void *)MEMORY[0x1D17B6230]();
        v14 = a1;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v11)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "modificationDate");
            v37 = v12;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "modificationDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v17;
            v42 = 2112;
            v43 = v18;
            v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_INFO, "%{public}@Comparing mirror input modification date %@ with existing record modification date %@", buf, 0x20u);

            v12 = v37;
          }

          objc_autoreleasePoolPop(v13);
          objc_msgSend(v9, "modificationDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "modificationDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "compare:", v21) == 1;

        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v35;
            v42 = 2112;
            v43 = v12;
            _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from existing external data: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          v22 = 1;
        }

        v10 = v12;
      }
      else
      {
        v31 = (void *)MEMORY[0x1D17B6230]();
        v32 = a1;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v34;
          v42 = 2112;
          v43 = v10;
          _os_log_impl(&dword_1CCD48000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from mirror input external data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
        v22 = 0;
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17B6230]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_INFO, "%{public}@Existing external data was nil when comparing against mirror input external data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      v22 = 1;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Mirror input external data was nil when comparing against existing external data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return v22;
}

+ (id)outputModelFromUpdateModel:(id)a3 mergedModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)objc_opt_class(), "hmbExternalProperties", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_msgSend(v5, "hmbSetProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if ((v14 & 1) == 0)
          objc_msgSend(v6, "hmbUnsetPropertyNamed:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

BOOL __57__HMBLocalZone_Process__outputBlockRowForTuple_activity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hmbProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "excludeFromCloudStorage"))
  {
    objc_msgSend(v5, "externalRecordField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HMBLocalZone)initWithLocalDatabase:(id)a3 zoneID:(id)a4 zoneRow:(unint64_t)a5 configuration:(id)a6 mirror:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMBLocalZone *v16;
  HMBLocalZone *v17;
  uint64_t v18;
  HMBLocalSQLContext *sql;
  uint64_t v20;
  NSHashTable *observersForAllModels;
  uint64_t v22;
  NSMutableDictionary *modelObserversByModelID;
  uint64_t v24;
  NSHashTable *mirrorOutputObservers;
  void *v26;
  uint64_t v27;
  HMBLocalZoneConfiguration *configuration;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  HMBModelContainer *modelContainer;
  objc_super v35;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v35.receiver = self;
  v35.super_class = (Class)HMBLocalZone;
  v16 = -[HMBLocalZone init](&v35, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_localDatabase, v12);
    objc_msgSend(v12, "local");
    v18 = objc_claimAutoreleasedReturnValue();
    sql = v17->_sql;
    v17->_sql = (HMBLocalSQLContext *)v18;

    objc_storeStrong((id *)&v17->_zoneID, a4);
    v17->_zoneRow = a5;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    observersForAllModels = v17->_observersForAllModels;
    v17->_observersForAllModels = (NSHashTable *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    modelObserversByModelID = v17->_modelObserversByModelID;
    v17->_modelObserversByModelID = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v24 = objc_claimAutoreleasedReturnValue();
    mirrorOutputObservers = v17->_mirrorOutputObservers;
    v17->_mirrorOutputObservers = (NSHashTable *)v24;

    objc_storeStrong((id *)&v17->_mirror, a7);
    objc_msgSend(v14, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v17->_delegate, v26);

    v27 = objc_msgSend(v14, "copy");
    configuration = v17->_configuration;
    v17->_configuration = (HMBLocalZoneConfiguration *)v27;

    objc_msgSend(v14, "modelContainer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      v30 = v14;
    else
      v30 = v12;
    objc_msgSend(v30, "modelContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    modelContainer = v17->_modelContainer;
    v17->_modelContainer = (HMBModelContainer *)v32;

    -[HMBModelContainer updateLocalZone:](v17->_modelContainer, "updateLocalZone:", v17);
    if (v15)
      -[HMBModelContainer updateMirror:](v17->_modelContainer, "updateMirror:", v15);
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  HMBLocalZone *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deallocating HMBLocalZone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMBLocalZone;
  -[HMBLocalZone dealloc](&v7, sel_dealloc);
}

- (unint64_t)zoneRow
{
  os_unfair_lock_s *p_propertyLock;
  unint64_t zoneRow;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  zoneRow = self->_zoneRow;
  os_unfair_lock_unlock(p_propertyLock);
  return zoneRow;
}

- (void)setZoneRow:(unint64_t)a3
{
  os_unfair_lock_s *p_propertyLock;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  self->_zoneRow = a3;
  os_unfair_lock_unlock(p_propertyLock);
}

- (void)addObserverForAllModels:(id)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  id v6;

  v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone observersForAllModels](self, "observersForAllModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)addObserver:(id)a3 forModelWithID:(id)a4
{
  id v6;
  os_unfair_lock_s *p_propertyLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone modelObserversByModelID](self, "modelObserversByModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZone modelObserversByModelID](self, "modelObserversByModelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_msgSend(v9, "addObject:", v11);

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)removeObserverForAllModels:(id)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  id v6;

  v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone observersForAllModels](self, "observersForAllModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)removeObserver:(id)a3 forModelWithID:(id)a4
{
  id v6;
  os_unfair_lock_s *p_propertyLock;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone modelObserversByModelID](self, "modelObserversByModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v11);
  if (!objc_msgSend(v9, "count"))
  {
    -[HMBLocalZone modelObserversByModelID](self, "modelObserversByModelID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v6);

  }
  os_unfair_lock_unlock(p_propertyLock);

}

- (id)externalDataForModelID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HMBLocalZone fetchRecordRowWithModelID:returning:error:](self, "fetchRecordRowWithModelID:returning:error:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "externalData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)externalDataForExternalID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HMBLocalZone fetchRecordRowWithExternalID:returning:error:](self, "fetchRecordRowWithExternalID:returning:error:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "externalData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)externalIDForModelID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HMBLocalZone fetchRecordRowWithModelID:returning:error:](self, "fetchRecordRowWithModelID:returning:error:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "externalID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)modelIDForExternalID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[HMBLocalZone fetchRecordRowWithExternalID:returning:error:](self, "fetchRecordRowWithExternalID:returning:error:", a3, 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)setExternalData:(id)a3 forModelID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMBLocalZone sql](self, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__HMBLocalZone_setExternalData_forModelID___block_invoke;
  v13[3] = &unk_1E8933A70;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "sqlBlockWithActivity:block:", 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)setExternalData:(id)a3 forExternalID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMBLocalZone sql](self, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__HMBLocalZone_setExternalData_forExternalID___block_invoke;
  v13[3] = &unk_1E8933A70;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "sqlBlockWithActivity:block:", 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)startUp
{
  os_unfair_lock_s *p_propertyLock;
  BOOL v4;
  void *v5;
  HMBLocalZone *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMBLocalZone hasStartedUp](self, "hasStartedUp");
  -[HMBLocalZone setHasStartedUp:](self, "setHasStartedUp:", 1);
  os_unfair_lock_unlock(p_propertyLock);
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Not starting up local zone that has already started up", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting up local zone", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMBLocalZone migrateUnsupportedModels](v6, "migrateUnsupportedModels");
    -[HMBLocalZone rebuildIndexesIfNeeded](v6, "rebuildIndexesIfNeeded");
    -[HMBLocalZone queueIncompleteProcesses](v6, "queueIncompleteProcesses");
    -[HMBLocalZone mirror](v6, "mirror");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startUpWithLocalZone:", v6);

  }
}

- (BOOL)destroyWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[5];

  if (!-[HMBLocalZone removeAllRecordsWithError:](self, "removeAllRecordsWithError:"))
    return 0;
  -[HMBLocalZone localDatabase](self, "localDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "local");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__HMBLocalZone_destroyWithError___block_invoke;
  v9[3] = &unk_1E8933B28;
  v9[4] = self;
  v7 = objc_msgSend(v6, "sqlTransactionWithActivity:error:block:", 0, a3, v9);

  return v7;
}

- (id)flush
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HMBLocalZone localDatabase](self, "localDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __21__HMBLocalZone_flush__block_invoke;
  v10[3] = &unk_1E89317A8;
  v10[4] = self;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "addOperationWithBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)addModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMBLocalZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  HMBLocalZone *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  HMBLocalSQLContextRowItem *v32;
  void *v33;
  void *v34;
  void *v35;
  HMBLocalSQLContextRowItem *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  HMBLocalZone *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HMBLocalSQLContextRowItem *v59;
  void *v60;
  void *v61;
  HMBLocalSQLContextRowItem *v62;
  void *v63;
  HMBLocalZone *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HMBLocalZone *v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v80;
  HMBLocalZone *v81;
  NSObject *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  HMBLocalZone *v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  _BYTE v107[128];
  _QWORD v108[2];
  _QWORD v109[2];
  _BYTE v110[128];
  uint8_t v111[128];
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  id v117;
  __int16 v118;
  id v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17B6230]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v89 = v12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmbDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmbDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v113 = v14;
    v114 = 2112;
    v115 = (uint64_t)v15;
    v116 = 2112;
    v117 = v16;
    v118 = 2112;
    v119 = v10;
    _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting models to add: %@ model IDs to remove: %@ options: %@", buf, 0x2Au);

    v12 = v89;
  }

  objc_autoreleasePoolPop(v11);
  v106 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v106);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v106;
  if (v18)
  {
    v19 = v18;
    v20 = (void *)MEMORY[0x1D17B6230]();
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v113 = v23;
      v114 = 2112;
      v115 = (uint64_t)v10;
      v116 = 2112;
      v117 = v19;
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive options %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = v17;
    v84 = v10;
    -[HMBLocalZone modelContainer](v12, "modelContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v25, "bestModelEncodingForStorageLocation:", 3);

    v87 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v8, "count"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v85 = v9;
    v26 = v9;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v103 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          v32 = [HMBLocalSQLContextRowItem alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "data");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "data");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](v32, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", 0, v34, 0, 0, v35);

          objc_msgSend(v91, "addObject:", v36);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
      }
      while (v28);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v38 = v8;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
    v88 = v37;
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v99;
      while (2)
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v99 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_msgSend(v43, "hmbModelID");
          v44 = objc_claimAutoreleasedReturnValue();
          if (!v44
            || (v45 = (void *)v44,
                objc_msgSend(v43, "hmbParentModelID"),
                v46 = (void *)objc_claimAutoreleasedReturnValue(),
                v46,
                v45,
                !v46))
          {
            v63 = (void *)MEMORY[0x1D17B6230]();
            v64 = v89;
            HMFGetOSLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v113 = v66;
              v114 = 2112;
              v115 = (uint64_t)v43;
              _os_log_impl(&dword_1CCD48000, v65, OS_LOG_TYPE_ERROR, "%{public}@Cannot update a model with a nil hmbModelID or hmbParentModelID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v63);
            v67 = (void *)MEMORY[0x1E0D519C0];
            v68 = (void *)MEMORY[0x1E0CB35C8];
            v69 = *MEMORY[0x1E0D27FC8];
            v108[0] = CFSTR("info");
            v108[1] = CFSTR("model");
            v109[0] = CFSTR("Cannot update a model with a nil hmbModelID or hmbParentModelID");
            objc_msgSend(v43, "hmbDescription");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v109[1] = v70;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "errorWithDomain:code:userInfo:", v69, 3, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "futureWithError:", v72);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = 0;
            v8 = v87;
            v10 = v84;
            v9 = v85;
            goto LABEL_35;
          }
          objc_msgSend(v43, "hmbModelID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v47);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
        if (v40)
          continue;
        break;
      }
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v48 = v38;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
    v50 = v89;
    if (v49)
    {
      v51 = v49;
      v19 = 0;
      v52 = *(_QWORD *)v95;
      v53 = v90;
      while (2)
      {
        v54 = 0;
        v55 = v19;
        do
        {
          if (*(_QWORD *)v95 != v52)
            objc_enumerationMutation(v48);
          v56 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v54);
          -[HMBLocalZone modelContainer](v50, "modelContainer");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v55;
          objc_msgSend(v57, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v56, v53, 3, v88, &v93);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v93;

          if (!v58)
          {
            v73 = (void *)MEMORY[0x1D17B6230]();
            v74 = v89;
            HMFGetOSLogHandle();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v113 = v76;
              v114 = 2112;
              v115 = (uint64_t)v56;
              v116 = 2112;
              v117 = v19;
              _os_log_impl(&dword_1CCD48000, v75, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v73);
            objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v84;
            v9 = v85;
            v17 = v86;
            v8 = v87;
            goto LABEL_42;
          }
          v59 = [HMBLocalSQLContextRowItem alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "data");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[HMBLocalSQLContextRowItem initWithItemRow:externalID:externalData:modelEncoding:modelData:](v59, "initWithItemRow:externalID:externalData:modelEncoding:modelData:", 0, v61, 0, v90, v58);

          v53 = v90;
          objc_msgSend(v91, "addObject:", v62);

          ++v54;
          v55 = v19;
          v50 = v89;
        }
        while (v51 != v54);
        v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        if (v51)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }

    v92 = v19;
    v17 = v86;
    v77 = -[HMBLocalZone insertBlockWithType:options:items:error:](v50, "insertBlockWithType:options:items:error:", 2, v86, v91, &v92);
    v78 = v92;

    if (v78)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v78);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v78;
      v10 = v84;
      v9 = v85;
      v8 = v87;
    }
    else
    {
      v80 = (void *)MEMORY[0x1D17B6230]();
      v81 = v50;
      HMFGetOSLogHandle();
      v82 = objc_claimAutoreleasedReturnValue();
      v10 = v84;
      v8 = v87;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v113 = v83;
        v114 = 2048;
        v115 = v77;
        _os_log_impl(&dword_1CCD48000, v82, OS_LOG_TYPE_INFO, "%{public}@Submitted models with block row: %lu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v80);
      -[HMBLocalZone triggerProcessForBlockRow:](v81, "triggerProcessForBlockRow:", v77);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v9 = v85;
LABEL_35:
      v17 = v86;
    }
LABEL_42:

  }
  return v24;
}

- (id)updateModels:(id)a3 andRemoveModelIDs:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "setDisallowsModelCreation:", 1);
  -[HMBLocalZone addModels:andRemoveModelIDs:options:](self, "addModels:andRemoveModelIDs:options:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)createModels:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setRequiresModelCreation:", 1);
  -[HMBLocalZone addModels:options:](self, "addModels:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addModels:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZone addModels:andRemoveModelIDs:options:](self, "addModels:andRemoveModelIDs:options:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)updateModels:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setDisallowsModelCreation:", 1);
  -[HMBLocalZone addModels:options:](self, "addModels:options:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removeModelIDs:(id)a3 options:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZone addModels:andRemoveModelIDs:options:](self, "addModels:andRemoveModelIDs:options:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)removeModelsWithParentModelID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBLocalZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  HMBLocalZone *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMBLocalZone *v23;
  NSObject *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v11;
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing models with parent model ID %@ and options %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v28;
  v14 = v13;
  if (v12)
  {
    v27 = v13;
    v15 = -[HMBLocalZone insertBlockToRemoveChildModelsWithType:parentModelID:options:error:](v9, "insertBlockToRemoveChildModelsWithType:parentModelID:options:error:", 2, v6, v12, &v27);
    v16 = v27;

    if (v16)
    {
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v20;
        v31 = 2112;
        v32 = v6;
        v33 = 2112;
        v34 = v16;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for models with parent model ID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HMBLocalZone triggerProcessForBlockRow:](v9, "triggerProcessForBlockRow:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17B6230]();
    v23 = v9;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v25;
      v31 = 2112;
      v32 = v7;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (id)removeModelsAndDescendantModelsWithIDs:(id)a3 depth:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMBLocalZone *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  HMBLocalZone *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMBLocalZone *v26;
  NSObject *v27;
  void *v28;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17B6230]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmbDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2048;
    v37 = a4;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing models and descendant models with IDs: %@ depth: %lu options: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v31;
  v17 = v16;
  if (v15)
  {
    v30 = v16;
    v18 = -[HMBLocalZone insertBlockToRemoveModelsAndDescendantModelsWithType:modelIDs:depth:options:error:](v11, "insertBlockToRemoveModelsAndDescendantModelsWithType:modelIDs:depth:options:error:", 2, v8, a4, v15, &v30);
    v19 = v30;

    if (v19)
    {
      v20 = (void *)MEMORY[0x1D17B6230]();
      v21 = v11;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v23;
        v34 = 2112;
        v35 = v8;
        v36 = 2112;
        v37 = (unint64_t)v19;
        _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for models and descendant models with IDs %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HMBLocalZone triggerProcessForBlockRow:](v11, "triggerProcessForBlockRow:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17B6230]();
    v26 = v11;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v28;
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = (unint64_t)v17;
      _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

- (id)removeAllModelsOfTypes:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBLocalZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMBLocalZone *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMBLocalZone *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmbDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing all models of types %@ and options %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v31;
  if (v13)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __47__HMBLocalZone_removeAllModelsOfTypes_options___block_invoke;
    v30[3] = &unk_1E89317D0;
    v30[4] = v9;
    objc_msgSend(v6, "na_map:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    v16 = -[HMBLocalZone insertBlockToRemoveAllModelsWithType:modelTypes:options:error:](v9, "insertBlockToRemoveAllModelsWithType:modelTypes:options:error:", 2, v15, v13, &v29);
    v17 = v29;

    if (v17)
    {
      v18 = (void *)MEMORY[0x1D17B6230]();
      v19 = v9;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v21;
        v34 = 2112;
        v35 = v6;
        v36 = 2112;
        v37 = v17;
        _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for all models of types %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMBLocalZone triggerProcessForBlockRow:](v9, "triggerProcessForBlockRow:", v16);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v22;

    v14 = v17;
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = v9;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v26;
      v34 = 2112;
      v35 = v7;
      v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode processing options %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (id)createLocalInputWithError:(id *)a3
{
  void *v4;
  HMBLocalZoneLocalInput *v5;

  -[HMBLocalZone createInputBlockWithType:error:](self, "createInputBlockWithType:error:", 2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[HMBLocalZoneInput initWithLocalZone:inputBlock:]([HMBLocalZoneLocalInput alloc], "initWithLocalZone:inputBlock:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)shutdown
{
  os_unfair_lock_s *p_propertyLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone shutdownFuture](self, "shutdownFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __24__HMBLocalZone_shutdown__block_invoke;
    v10[3] = &unk_1E8932450;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZone setShutdownFuture:](self, "setShutdownFuture:", v5);

  }
  -[HMBLocalZone shutdownFuture](self, "shutdownFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_propertyLock);
  if (!v4)
  {
    -[HMBLocalZone localDatabase](self, "localDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleLocalZoneShutdown:", self);

    v8 = (id)objc_msgSend(v6, "recoverIgnoringError");
  }
  return v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMBLocalZone zoneID](self, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBLocalZone localDatabase](self, "localDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Database"), v5);
  v12[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBLocalZone zoneID](self, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Zone ID"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HMBLocalDatabase)localDatabase
{
  return (HMBLocalDatabase *)objc_loadWeakRetained((id *)&self->_localDatabase);
}

- (void)setLocalDatabase:(id)a3
{
  objc_storeWeak((id *)&self->_localDatabase, a3);
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (HMBLocalZoneConfiguration)configuration
{
  return self->_configuration;
}

- (HMBLocalZoneID)zoneID
{
  return self->_zoneID;
}

- (HMBMirrorProtocol)mirror
{
  return self->_mirror;
}

- (HMBLocalZoneDelegate)delegate
{
  return (HMBLocalZoneDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSHashTable)observersForAllModels
{
  return self->_observersForAllModels;
}

- (NSMutableDictionary)modelObserversByModelID
{
  return self->_modelObserversByModelID;
}

- (NSHashTable)mirrorOutputObservers
{
  return self->_mirrorOutputObservers;
}

- (HMBLocalSQLContext)sql
{
  return self->_sql;
}

- (BOOL)hasStartedUp
{
  return self->_hasStartedUp;
}

- (void)setHasStartedUp:(BOOL)a3
{
  self->_hasStartedUp = a3;
}

- (NAFuture)shutdownFuture
{
  return self->_shutdownFuture;
}

- (void)setShutdownFuture:(id)a3
{
  objc_storeStrong((id *)&self->_shutdownFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownFuture, 0);
  objc_storeStrong((id *)&self->_sql, 0);
  objc_storeStrong((id *)&self->_mirrorOutputObservers, 0);
  objc_storeStrong((id *)&self->_modelObserversByModelID, 0);
  objc_storeStrong((id *)&self->_observersForAllModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mirror, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelContainer, 0);
  objc_destroyWeak((id *)&self->_localDatabase);
}

void __24__HMBLocalZone_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mirror");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "recoverIgnoringError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __24__HMBLocalZone_shutdown__block_invoke_2;
  v12[3] = &unk_1E8932780;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v10 = v3;
  v11 = (id)objc_msgSend(v9, "addSuccessBlock:", v12);

}

void __24__HMBLocalZone_shutdown__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "flush");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recoverIgnoringError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "addCompletionBlock:", v3);

}

id __47__HMBLocalZone_removeAllModelsOfTypes_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "modelContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typeNameForModelClass:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __21__HMBLocalZone_flush__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mirror");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "flush");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "addCompletionBlock:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

id __33__HMBLocalZone_destroyWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = 0;
  objc_msgSend(v3, "_deleteZoneWithRow:error:", objc_msgSend(v2, "zoneRow"), &v5);

  return v5;
}

id __46__HMBLocalZone_setExternalData_forExternalID___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v7 = a1[6];
  v9 = 0;
  objc_msgSend(v4, "_updateRecordWithZoneRow:externalID:externalData:error:", v5, v6, v7, &v9);

  return v9;
}

id __43__HMBLocalZone_setExternalData_forModelID___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v7 = a1[6];
  v9 = 0;
  objc_msgSend(v4, "_updateRecordWithZoneRow:modelID:externalData:error:", v5, v6, v7, &v9);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1)
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_1248);
  return (id)logCategory__hmf_once_v26;
}

void __27__HMBLocalZone_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26;
  logCategory__hmf_once_v26 = v0;

}

- (void)migrateUnsupportedModels
{
  HMBLocalZoneQueryResultAllOfTypeRaw *v3;
  unint64_t v4;
  objc_class *v5;
  void *v6;
  HMBLocalZoneQueryResultAllOfTypeRaw *v7;
  void *v8;
  void *v9;
  HMBLocalZone *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = [HMBLocalZoneQueryResultAllOfTypeRaw alloc];
  v4 = -[HMBLocalZone zoneRow](self, "zoneRow");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBLocalZoneQueryResultAllOfTypeRaw initWithLocalZone:zoneRow:modelType:returning:](v3, "initWithLocalZone:zoneRow:modelType:returning:", self, v4, v6, -1);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke;
  v14[3] = &unk_1E8931870;
  v14[4] = self;
  -[HMBSQLQueryIterator enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v14);
  -[HMBSQLQueryIterator error](v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBSQLQueryIterator error](v7, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to iterate through unknown models in zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v27 = 0;
  objc_msgSend(v4, "modelFromRecord:storageLocation:error:", v3, 2, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  if (v5)
  {
    if (objc_msgSend(v5, "hmbIsModelGenericRepresentation"))
    {
      v7 = (void *)MEMORY[0x1D17B6230]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v10;
        v30 = 2112;
        v31 = v5;
        _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Not migrating unsupported model that has a generic representation: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      objc_msgSend(v5, "hmbType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modelContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "schemaHashForModel:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1D17B6230]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v17;
        v30 = 2112;
        v31 = v11;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating model type to %@ and schema to %@ for previously-unsupported model: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(*(id *)(a1 + 32), "sql");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v6;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke_40;
      v22[3] = &unk_1E8933A70;
      v23 = v3;
      v24 = v11;
      v25 = v13;
      v19 = v13;
      v20 = v11;
      objc_msgSend(v18, "sqlBlockWithActivity:error:block:", 0, &v26, v22);
      v21 = v26;

      v6 = v21;
    }
  }

}

id __60__HMBLocalZone_MigrateUnsupported__migrateUnsupportedModels__block_invoke_40(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "recordRow");
  v6 = a1[5];
  v7 = a1[6];
  v9 = 0;
  objc_msgSend(v4, "_updateRecordWithRow:modelType:modelSchema:error:", v5, v6, v7, &v9);

  return v9;
}

- (id)createMirrorInputWithError:(id *)a3
{
  void *v4;
  HMBLocalZoneMirrorInput *v5;

  -[HMBLocalZone createInputBlockWithType:error:](self, "createInputBlockWithType:error:", 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[HMBLocalZoneInput initWithLocalZone:inputBlock:]([HMBLocalZoneMirrorInput alloc], "initWithLocalZone:inputBlock:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (void)addMirrorOutputObserver:(id)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  id v6;

  v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone mirrorOutputObservers](self, "mirrorOutputObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)removeMirrorOutputObserver:(id)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  id v6;

  v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone mirrorOutputObservers](self, "mirrorOutputObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_propertyLock);
}

- (id)allMirrorOutputObservers
{
  void *v3;
  os_unfair_lock_s *p_propertyLock;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBLocalZone mirrorOutputObservers](self, "mirrorOutputObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  os_unfair_lock_unlock(p_propertyLock);
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (id)fetchOptionsForOutputBlock:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  HMBLocalZone *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HMBLocalZone *v19;
  NSObject *v20;
  void *v21;
  id v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  HMBLocalZone *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4043;
  v29 = __Block_byref_object_dispose__4044;
  v30 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__HMBLocalZone_MirrorOutput__fetchOptionsForOutputBlock_error___block_invoke;
  v24[3] = &unk_1E89339F8;
  v24[4] = &v25;
  v24[5] = a3;
  objc_msgSend(v7, "sqlBlockWithActivity:block:", 0, v24);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v12;
      v33 = 2048;
      v34 = a3;
      v35 = 2112;
      v36 = v10;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch options for block at row %lu.%@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      v13 = 0;
      *a4 = v8;
      goto LABEL_16;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_16;
  }
  if (!v26[5])
  {
    v8 = 0;
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x1E0CB3710];
  v15 = objc_opt_class();
  objc_msgSend((id)v26[5], "optionsData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v16, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;

  if (v8)
  {
    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v32 = v21;
      v33 = 2048;
      v34 = a3;
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive transaction options from options data: %lu.%@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v13 = v17;
  }

LABEL_16:
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (id)fetchRecordsForOutputBlock:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  HMBLocalZone *v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryContextsByModelType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4043;
  v38 = __Block_byref_object_dispose__4044;
  v39 = 0;
  -[HMBLocalZone sql](self, "sql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke;
  v33[3] = &unk_1E89328E8;
  v33[6] = a3;
  v33[7] = 7;
  v33[4] = self;
  v33[5] = &v34;
  v11 = objc_msgSend(v9, "sqlBlockWithActivity:error:block:", 0, a4, v33);

  if (v11)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4043;
    v31 = __Block_byref_object_dispose__4044;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v35[5], "count"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4043;
    v25 = __Block_byref_object_dispose__4044;
    v26 = 0;
    v12 = (void *)v35[5];
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke_73;
    v15[3] = &unk_1E8932910;
    v19 = &v21;
    v20 = a3;
    v16 = v8;
    v17 = self;
    v18 = &v27;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
    if (a4)
      *a4 = objc_retainAutorelease((id)v22[5]);
    v13 = (id)v28[5];

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v34, 8);

  return v13;
}

- (id)markGroupAsSentWithOutputBlock:(unint64_t)a3 tuples:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a4;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HMBLocalZone_MirrorOutput__markGroupAsSentWithOutputBlock_tuples___block_invoke;
  v11[3] = &unk_1E8933AD8;
  v12 = v6;
  v13 = a3;
  v8 = v6;
  objc_msgSend(v7, "sqlTransactionWithActivity:block:", 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)removeOutputBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  _QWORD v9[6];

  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HMBLocalZone_MirrorOutput__removeOutputBlockWithRow_error___block_invoke;
  v9[3] = &unk_1E8933AD8;
  v9[4] = self;
  v9[5] = a3;
  LOBYTE(a4) = objc_msgSend(v7, "sqlTransactionWithActivity:error:block:", 0, a4, v9);

  return (char)a4;
}

id __61__HMBLocalZone_MirrorOutput__removeOutputBlockWithRow_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v22 = 0;
  v5 = objc_msgSend(v3, "_resetOutputForRecordsWithBlockRow:error:", v4, &v22);
  v6 = v22;
  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2048;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to reset output for records with output block row %lu: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  v12 = *(_QWORD *)(a1 + 40);
  v21 = v6;
  v13 = objc_msgSend(v3, "_deleteBlockWithRow:error:", v12, &v21);
  v14 = v21;

  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      v25 = 2048;
      v26 = v19;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete block with output block row %lu: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

  return v14;
}

id __68__HMBLocalZone_MirrorOutput__markGroupAsSentWithOutputBlock_tuples___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint32_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  _BYTE v51[128];
  _BYTE buf[12];
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v41 = a1;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v46;
    v43 = v3;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
      v9 = v3;
      v10 = v8;
      objc_msgSend(v10, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v10, "recordRow");
      if (v11)
      {
        objc_msgSend(v10, "externalID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "externalData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        objc_msgSend(v9, "_updateRecordWithRow:externalID:externalData:error:", v12, v13, v14, &v50);
        v15 = v50;

        v16 = objc_msgSend(v10, "recordRow");
        v17 = objc_msgSend(v10, "outputBlockRow");
        v49 = v15;
        v18 = objc_msgSend(v9, "_clearPushForRecordRow:expectedOutputBlockRow:error:", v16, v17, &v49);
        v19 = v49;

        if (v18 == 1)
        {
          v20 = (void *)MEMORY[0x1D17B6230]();
          v21 = v9;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v10, "recordRow");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v23;
          v53 = 2048;
          v54 = v32;
          v25 = v22;
          v26 = OS_LOG_TYPE_INFO;
          v27 = "%{public}@Not clearing output columns for record %lu because it appears to have changed.";
LABEL_22:
          v31 = 22;
          goto LABEL_23;
        }
        if (!v18)
        {
          v20 = (void *)MEMORY[0x1D17B6230]();
          v21 = v9;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v10, "recordRow");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v23;
            v53 = 2048;
            v54 = v24;
            v55 = 2112;
            v56 = v19;
            v25 = v22;
            v26 = OS_LOG_TYPE_ERROR;
            v27 = "%{public}@Unable to clear output columns for pushed record %lu: %@";
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v28 = objc_msgSend(v10, "outputBlockRow");
        v50 = 0;
        v29 = objc_msgSend(v9, "_deleteRecordWithRow:expectedOutputBlockRow:error:", v12, v28, &v50);
        v19 = v50;
        switch(v29)
        {
          case 2:
            objc_msgSend(v10, "queryTable");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v10, "recordRow");
            *(_QWORD *)buf = v19;
            objc_msgSend(v33, "_deleteQueryForRecordRow:error:", v34, buf);
            v35 = *(id *)buf;

            v19 = v35;
            break;
          case 1:
            v20 = (void *)MEMORY[0x1D17B6230]();
            v21 = v9;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              goto LABEL_24;
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v10, "recordRow");
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v23;
            v53 = 2048;
            v54 = v36;
            v25 = v22;
            v26 = OS_LOG_TYPE_INFO;
            v27 = "%{public}@Not removing record %lu because it appears to have changed.";
            goto LABEL_22;
          case 0:
            v20 = (void *)MEMORY[0x1D17B6230]();
            v21 = v9;
            HMFGetOSLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v10, "recordRow");
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v23;
              v53 = 2048;
              v54 = v30;
              v55 = 2112;
              v56 = v19;
              v25 = v22;
              v26 = OS_LOG_TYPE_ERROR;
              v27 = "%{public}@Unable to delete pushed record %lu: %@";
LABEL_16:
              v31 = 32;
LABEL_23:
              _os_log_impl(&dword_1CCD48000, v25, v26, v27, buf, v31);

            }
LABEL_24:

            objc_autoreleasePoolPop(v20);
            v3 = v43;
            break;
        }
      }

      if (v19)
      {
        v38 = v19;

        v39 = v38;
        goto LABEL_30;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v37 = *(_QWORD *)(v41 + 40);
  v44 = 0;
  objc_msgSend(v3, "_deleteBlockWithRow:error:", v37, &v44);
  v38 = v44;
  v39 = 0;
LABEL_30:

  return v39;
}

id __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v20 = 0;
  objc_msgSend(v3, "_selectRecordsWithBlockRow:returning:error:", v4, v5, &v20);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v20;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v10 && !objc_msgSend(v10, "count"))
  {
    v11 = (void *)MEMORY[0x1D17B6230]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2048;
      v24 = v15;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_INFO, "%{public}@Deleting block with output block row %lu because it has no corresponding records", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = *(_QWORD *)(a1 + 48);
    v19 = v7;
    objc_msgSend(v3, "_deleteBlockWithRow:error:", v16, &v19);
    v17 = v19;

    v7 = v17;
  }

  return v7;
}

void __63__HMBLocalZone_MirrorOutput__fetchRecordsForOutputBlock_error___block_invoke_73(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  HMBMirrorOutputTuple *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  HMBMirrorOutputTuple *v26;
  void *v27;
  HMBMirrorOutputTuple *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  HMBMirrorOutputTuple *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "modelType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v6, "pushEncoding"))
  {
    v37 = v8;
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v6, "pushData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v9, "modelFromData:encoding:storageLocation:recordRowID:error:", v10, objc_msgSend(v6, "pushEncoding"), 1, objc_msgSend(v6, "recordRow"), &v42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v42;
    v13 = v42;

    if (v11)
    {
      v36 = v13;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "allMirrorOutputObservers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v19, "localZone:willPerformMirrorOutputForModel:", *(_QWORD *)(a1 + 40), v11);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v16);
      }

      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v21 = [HMBMirrorOutputTuple alloc];
      v22 = *(_QWORD *)(a1 + 64);
      v23 = objc_msgSend(v6, "recordRow");
      objc_msgSend(v6, "externalID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "externalData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v37;
      v26 = -[HMBMirrorOutputTuple initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:](v21, "initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:", v22, v23, v11, v37, v24, v25);
      objc_msgSend(v20, "addObject:", v26);

      v13 = v36;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v12);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = 0;

      *a4 = 1;
    }

  }
  else
  {
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v28 = [HMBMirrorOutputTuple alloc];
    v29 = *(_QWORD *)(a1 + 64);
    v30 = objc_msgSend(v6, "recordRow");
    objc_msgSend(v6, "externalID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HMBMirrorOutputTuple initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:](v28, "initWithOutputBlockRow:recordRow:model:queryTable:externalID:externalData:", v29, v30, 0, v8, v31, v32);
    objc_msgSend(v27, "addObject:", v33);

  }
}

id __63__HMBLocalZone_MirrorOutput__fetchOptionsForOutputBlock_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v9;

  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(a2, "_selectBlockWithRow:error:", v3, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  return v5;
}

- (id)queryModelsOfType:(Class)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__HMBLocalZone_Queryable__queryModelsOfType_predicate___block_invoke;
  v10[3] = &unk_1E8932E00;
  v11 = v6;
  v7 = v6;
  -[HMBLocalZone queryModelsOfType:filter:](self, "queryModelsOfType:filter:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)queryModelsOfType:(Class)a3 filter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMBLocalZone *v12;
  SEL v13;
  Class v14;
  id v15;
  id v16;

  v6 = a4;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryContextsByClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "performQueryOn:properties:filter:", self, 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    v12 = (HMBLocalZone *)_HMFPreconditionFailure();
    return -[HMBLocalZone queryModelsOfType:properties:filter:](v12, v13, v14, v15, v16);
  }
}

- (id)queryModelsOfType:(Class)a3 properties:(id)a4 filter:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMBLocalZone *v15;
  SEL v16;

  v8 = a4;
  v9 = a5;
  -[HMBLocalZone sql](self, "sql");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryContextsByClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "performQueryOn:properties:filter:", self, v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    v15 = (HMBLocalZone *)_HMFPreconditionFailure();
    return -[HMBLocalZone fetchModels](v15, v16);
  }
}

- (id)fetchModels
{
  HMBLocalZoneQueryResultRecordColumns *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  HMBLocalZoneQueryResultRecordColumns *v7;

  v3 = [HMBLocalZoneQueryResultRecordColumns alloc];
  -[HMBLocalZone sql](self, "sql");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectAllRecordRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  v7 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](v3, "initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:", self, v5, &unk_1E8947790, MEMORY[0x1E0C9AA70], v6);

  return v7;
}

- (id)queryModelsOfType:(Class)a3
{
  HMBLocalZoneQueryResultAllOfType *v5;
  void *v6;
  HMBLocalZoneQueryResultAllOfType *v7;

  v5 = [HMBLocalZoneQueryResultAllOfType alloc];
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBLocalZoneQueryResultAllOfType initWithLocalZone:modelClassName:](v5, "initWithLocalZone:modelClassName:", self, v6);

  return v7;
}

- (id)queryModelsWithParentModelID:(id)a3
{
  id v4;
  HMBLocalZoneQueryResultParentModelID *v5;

  v4 = a3;
  v5 = -[HMBLocalZoneQueryResultParentModelID initWithLocalZone:parentModelID:]([HMBLocalZoneQueryResultParentModelID alloc], "initWithLocalZone:parentModelID:", self, v4);

  return v5;
}

- (id)queryModelsWithParentModelID:(id)a3 ofType:(Class)a4
{
  id v6;
  HMBLocalZoneQueryResultParentModelIDOfType *v7;
  void *v8;
  HMBLocalZoneQueryResultParentModelIDOfType *v9;

  v6 = a3;
  v7 = [HMBLocalZoneQueryResultParentModelIDOfType alloc];
  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMBLocalZoneQueryResultParentModelIDOfType initWithLocalZone:parentModelID:modelClassName:](v7, "initWithLocalZone:parentModelID:modelClassName:", self, v6, v8);

  return v9;
}

- (id)queryModelsRecursivelyStartingWithModelID:(id)a3
{
  id v4;
  HMBLocalZoneQueryResultRecursiveModelID *v5;

  v4 = a3;
  v5 = -[HMBLocalZoneQueryResultRecursiveModelID initWithLocalZone:modelID:]([HMBLocalZoneQueryResultRecursiveModelID alloc], "initWithLocalZone:modelID:", self, v4);

  return v5;
}

- (id)queryModelsUsingQuery:(id)a3
{
  return -[HMBLocalZone queryModelsUsingQuery:arguments:](self, "queryModelsUsingQuery:arguments:", a3, MEMORY[0x1E0C9AA70]);
}

- (id)queryModelsUsingQuery:(id)a3 arguments:(id)a4
{
  return (id)objc_msgSend(a3, "performQueryOn:arguments:", self, a4);
}

- (id)countModelsUsingQuery:(id)a3 arguments:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "countMatchesOn:arguments:error:", self, a4, a5);
}

- (void)rebuildIndexesIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[HMBLocalZone sql](self, "sql");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContextsByModelType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke;
  v5[3] = &unk_1E8932E28;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *context;
  id v52;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  uint64_t *v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _BYTE v80[24];
  void *v81;
  id v82;
  id v83;
  _BYTE buf[24];
  void *v85;
  id v86;
  id v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFA39A90))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "localZoneWillReindex:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "context");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sql");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53 != v10)
    _HMFPreconditionFailure();
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  objc_msgSend(*(id *)(a1 + 32), "sql");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke_2;
  v55[3] = &unk_1E8933A20;
  v55[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v56 = v12;
  v57 = &v59;
  v13 = objc_msgSend(v11, "sqlBlockWithActivity:error:block:", 0, &v58, v55);
  v14 = v58;

  if ((v13 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modelType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v85 = v14;
      _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine index state of %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

  if (*((_BYTE *)v60 + 24))
  {
    v20 = v14;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "modelType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localZone:willReindexTableForModel:", v21, v22);

    }
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modelType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_INFO, "%{public}@Preparing to reindex table for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v28 = *(void **)(a1 + 32);
    v54 = v14;
    v29 = v28;
    v30 = v12;
    objc_msgSend(v30, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = ____reindexTable_block_invoke;
    v77[3] = &unk_1E8932F30;
    v32 = v30;
    v78 = v32;
    v33 = v29;
    v79 = v33;
    LODWORD(v29) = objc_msgSend(v31, "sqlBlockWithActivity:error:block:", 0, &v54, v77);

    if ((_DWORD)v29)
    {
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v76 = 1;
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__5118;
      v71 = __Block_byref_object_dispose__5119;
      v72 = 0;
      v63 = 0;
      v64 = &v63;
      v65 = 0x2020000000;
      v66 = 1;
      objc_msgSend(v33, "queryModelsOfType:", objc_msgSend(v32, "modelClass"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____reindexTable_block_invoke_84;
      v85 = &unk_1E8932E78;
      v52 = v32;
      v86 = v52;
      v88 = &v67;
      v35 = v33;
      v87 = v35;
      v89 = &v63;
      v90 = &v73;
      v36 = objc_msgSend(v34, "enumerateObjectsUsingBlock:", buf);
      if (*((_BYTE *)v74 + 24))
      {
        context = (void *)MEMORY[0x1D17B6230](v36);
        v37 = v35;
        HMFGetOSLogHandle();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v48 = v34;
          v49 = v5;
          HMFGetLogIdentifier();
          v50 = (id)objc_claimAutoreleasedReturnValue();
          v39 = v64[3];
          objc_msgSend(v52, "modelType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v80 = 138543874;
          *(_QWORD *)&v80[4] = v50;
          *(_WORD *)&v80[12] = 2048;
          *(_QWORD *)&v80[14] = v39 - 1;
          *(_WORD *)&v80[22] = 2112;
          v81 = v40;
          _os_log_impl(&dword_1CCD48000, v38, OS_LOG_TYPE_INFO, "%{public}@Total of %lu rows re-indexed for %@.", v80, 0x20u);

          v34 = v48;
          v5 = v49;

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v37, "sql");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v80 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v80[8] = 3221225472;
        *(_QWORD *)&v80[16] = ____reindexTable_block_invoke_86;
        v81 = &unk_1E8932F30;
        v82 = v37;
        v83 = v52;
        v42 = objc_msgSend(v41, "sqlBlockWithActivity:error:block:", 0, &v54, v80);

      }
      else
      {
        v54 = objc_retainAutorelease((id)v68[5]);
        v42 = *((_BYTE *)v74 + 24) != 0;
      }

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);

      _Block_object_dispose(&v73, 8);
    }
    else
    {
      v42 = 0;
    }

    v20 = v54;
    if ((v42 & 1) == 0)
    {
      v43 = (void *)MEMORY[0x1D17B6230]();
      v44 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v45 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "modelType");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v47;
        *(_WORD *)&buf[22] = 2112;
        v85 = v20;
        _os_log_impl(&dword_1CCD48000, v45, OS_LOG_TYPE_ERROR, "%{public}@Unable to rebuild index of %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v43);
    }
  }

  _Block_object_dispose(&v59, 8);
}

id __49__HMBLocalZone_Queryable__rebuildIndexesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  objc_msgSend(*(id *)(a1 + 40), "modelType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "_selectIndexSentinelForZoneRow:modelType:error:", v5, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "BOOLValue");

  return v8;
}

uint64_t __55__HMBLocalZone_Queryable__queryModelsOfType_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

- (id)createOutputBlockWithError:(id *)a3
{
  void *v5;
  HMBLocalSQLContextOutputBlock *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  HMBLocalSQLContextOutputBlock *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[HMBLocalZone sql](self, "sql");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__HMBLocalZone_Block__createOutputBlockWithError___block_invoke;
  v13[3] = &unk_1E8933B78;
  v13[4] = self;
  v13[5] = &v14;
  LODWORD(a3) = objc_msgSend(v5, "sqlBlockWithActivity:error:block:", 0, a3, v13);

  if ((_DWORD)a3)
  {
    v6 = [HMBLocalSQLContextOutputBlock alloc];
    -[HMBLocalZone sql](self, "sql");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZone zoneID](self, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMBLocalZone zoneRow](self, "zoneRow");
    v11 = -[HMBLocalSQLContextOutputBlock initWithOwner:identifier:zoneRow:blockRow:](v6, "initWithOwner:identifier:zoneRow:blockRow:", v7, v9, v10, v15[3]);

  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)createInputBlockWithType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  HMBLocalSQLContextInputBlock *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  HMBLocalSQLContextInputBlock *v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HMBLocalZone_Block__createInputBlockWithType_error___block_invoke;
  v15[3] = &unk_1E89336B0;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  LODWORD(a4) = objc_msgSend(v7, "sqlBlockWithActivity:error:block:", 0, a4, v15);

  if ((_DWORD)a4)
  {
    v8 = [HMBLocalSQLContextInputBlock alloc];
    -[HMBLocalZone sql](self, "sql");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZone zoneID](self, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMBLocalZone zoneRow](self, "zoneRow");
    v13 = -[HMBLocalSQLContextInputBlock initWithOwner:identifier:zoneRow:blockRow:type:](v8, "initWithOwner:identifier:zoneRow:blockRow:type:", v9, v11, v12, v17[3], a3);

  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (unint64_t)insertBlockWithType:(unint64_t)a3 options:(id)a4 items:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a4;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[HMBLocalZone sql](self, "sql");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__HMBLocalZone_Block__insertBlockWithType_options_items_error___block_invoke;
  v17[3] = &unk_1E89336D8;
  v20 = &v22;
  v21 = a3;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  LODWORD(a6) = objc_msgSend(v12, "sqlTransactionWithActivity:error:block:", 0, a6, v17);

  if ((_DWORD)a6)
    v15 = v23[3];
  else
    v15 = 0;

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (unint64_t)insertBlockToRemoveAllModelsWithType:(unint64_t)a3 modelTypes:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a4;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[HMBLocalZone sql](self, "sql");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__HMBLocalZone_Block__insertBlockToRemoveAllModelsWithType_modelTypes_options_error___block_invoke;
  v17[3] = &unk_1E89336D8;
  v20 = &v22;
  v21 = a3;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  LODWORD(a6) = objc_msgSend(v12, "sqlTransactionWithActivity:error:block:", 0, a6, v17);

  if ((_DWORD)a6)
    v15 = v23[3];
  else
    v15 = 0;

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (unint64_t)insertBlockToRemoveChildModelsWithType:(unint64_t)a3 parentModelID:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a4;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[HMBLocalZone sql](self, "sql");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__HMBLocalZone_Block__insertBlockToRemoveChildModelsWithType_parentModelID_options_error___block_invoke;
  v17[3] = &unk_1E89336D8;
  v20 = &v22;
  v21 = a3;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  LODWORD(a6) = objc_msgSend(v12, "sqlTransactionWithActivity:error:block:", 0, a6, v17);

  if ((_DWORD)a6)
    v15 = v23[3];
  else
    v15 = 0;

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (unint64_t)insertBlockToRemoveModelsAndDescendantModelsWithType:(unint64_t)a3 modelIDs:(id)a4 depth:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v12 = a4;
  v13 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[HMBLocalZone sql](self, "sql");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__HMBLocalZone_Block__insertBlockToRemoveModelsAndDescendantModelsWithType_modelIDs_depth_options_error___block_invoke;
  v19[3] = &unk_1E8933700;
  v22 = &v25;
  v23 = a3;
  v19[4] = self;
  v15 = v12;
  v20 = v15;
  v24 = a5;
  v16 = v13;
  v21 = v16;
  LODWORD(a7) = objc_msgSend(v14, "sqlTransactionWithActivity:error:block:", 0, a7, v19);

  if ((_DWORD)a7)
    v17 = v26[3];
  else
    v17 = 0;

  _Block_object_dispose(&v25, 8);
  return v17;
}

- (BOOL)_insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:(unint64_t)a3 context:(id)a4 type:(unint64_t)a5 modelIDs:(id)a6 currentDepth:(unint64_t)a7 maximumDepth:(unint64_t)a8 options:(id)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  uint64_t i;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  HMBLocalZone *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  HMBLocalZone *v35;
  NSObject *v36;
  void *v37;
  id v41;
  void *v42;
  unint64_t v43;
  void *v44;
  HMBLocalZone *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v41 = a9;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v16 = v15;
  v47 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v51;
    v42 = v16;
    v43 = a3;
    v45 = self;
    while (2)
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v51 != v46)
          objc_enumerationMutation(v16);
        v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v19 = -[HMBLocalZone zoneRow](self, "zoneRow");
        v49 = 0;
        v20 = objc_msgSend(v14, "_insertDeletionItemWithZoneRow:blockRow:type:modelID:error:", v19, a3, a5, v18, &v49);
        v21 = v49;
        if (!v20)
        {
          v34 = (void *)MEMORY[0x1D17B6230]();
          v35 = self;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v55 = v37;
            v56 = 2048;
            v57 = v43;
            v58 = 2048;
            v59 = a5;
            v60 = 2112;
            v61 = v18;
            v62 = 2112;
            v63 = v21;
            _os_log_impl(&dword_1CCD48000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to insert deletion item with blockRow: %lu type: %lu modelID: %@: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v34);
          v32 = v41;
          if (a10)
            *a10 = objc_retainAutorelease(v21);

          v16 = v42;
          v33 = 0;
          goto LABEL_24;
        }
        v22 = -[HMBLocalZone zoneRow](self, "zoneRow");
        v48 = v21;
        objc_msgSend(v14, "_selectRecordsWithZoneRow:parentModelID:returning:error:", v22, v18, 0, &v48);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v48;

        if (v23)
        {
          objc_msgSend(v23, "na_map:", &__block_literal_global_6025);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObjectsFromArray:", v25);

        }
        else
        {
          v26 = a5;
          v27 = (void *)MEMORY[0x1D17B6230]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = v14;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v55 = v31;
            v56 = 2112;
            v57 = v18;
            v58 = 2112;
            v59 = (unint64_t)v24;
            _os_log_impl(&dword_1CCD48000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to select records with parentModelID: %@: %@", buf, 0x20u);

            v14 = v30;
            v16 = v42;
          }

          objc_autoreleasePoolPop(v27);
          a5 = v26;
          a3 = v43;
        }

        self = v45;
      }
      v47 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      if (v47)
        continue;
      break;
    }
  }

  if (a7 >= a8)
  {
    v33 = 1;
    v32 = v41;
  }
  else
  {
    v32 = v41;
    if (objc_msgSend(v44, "count"))
      v33 = -[HMBLocalZone _insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:context:type:modelIDs:currentDepth:maximumDepth:options:error:](self, "_insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:context:type:modelIDs:currentDepth:maximumDepth:options:error:", a3, v14, a5, v44, a7 + 1, a8, v41, a10);
    else
      v33 = 1;
  }
LABEL_24:

  return v33;
}

- (id)fetchReadyBlocksWithType:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6021;
  v15 = __Block_byref_object_dispose__6022;
  v16 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HMBLocalZone_Block__fetchReadyBlocksWithType_error___block_invoke;
  v10[3] = &unk_1E89336B0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  LODWORD(a4) = objc_msgSend(v7, "sqlTransactionWithActivity:error:block:", 0, a4, v10);

  if ((_DWORD)a4)
    v8 = (id)v12[5];
  else
    v8 = 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchItemsInBlock:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6021;
  v18 = __Block_byref_object_dispose__6022;
  v19 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__HMBLocalZone_Block__fetchItemsInBlock_error___block_invoke;
  v11[3] = &unk_1E8933B78;
  v13 = &v14;
  v8 = v6;
  v12 = v8;
  LODWORD(a4) = objc_msgSend(v7, "sqlBlockWithActivity:error:block:", 0, a4, v11);

  if ((_DWORD)a4)
    v9 = (id)v15[5];
  else
    v9 = 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (BOOL)removeBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  HMBLocalZone *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17B6230](self, a2);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Removing block with row %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMBLocalZone sql](v8, "sql");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__HMBLocalZone_Block__removeBlockWithRow_error___block_invoke;
  v14[3] = &__block_descriptor_40_e37___NSError_16__0__HMBLocalSQLContext_8l;
  v14[4] = a3;
  v12 = objc_msgSend(v11, "sqlBlockWithActivity:error:block:", 0, a4, v14);

  return v12;
}

id __48__HMBLocalZone_Block__removeBlockWithRow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v4 = a2;
  objc_msgSend(v4, "_deleteItemsWithBlockRow:error:", v3, &v10);
  v5 = v10;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v4, "_deleteBlockWithRow:error:", v6, &v9);

  v7 = v9;
  return v7;
}

id __47__HMBLocalZone_Block__fetchItemsInBlock_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v10 = 0;
  objc_msgSend(v4, "_selectItemsWithBlockRow:returning:error:", objc_msgSend(v3, "blockRow"), -1, &v10);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = v10;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  return v6;
}

id __54__HMBLocalZone_Block__fetchReadyBlocksWithType_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[6];
  v12 = 0;
  objc_msgSend(v4, "_selectReadyBlocksWithZoneRow:type:error:", v5, v6, &v12);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  return v8;
}

uint64_t __146__HMBLocalZone_Block___insertDeletionItemsForModelsAndDescendantModelsWithBlockRow_context_type_modelIDs_currentDepth_maximumDepth_options_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelID");
}

id __105__HMBLocalZone_Block__insertBlockToRemoveModelsAndDescendantModelsWithType_modelIDs_depth_options_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;
  id v22;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[8];
  v22 = 0;
  v7 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:error:", v5, v6, &v22);
  v8 = v22;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
  v9 = a1[6];
  v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v11 = (void *)a1[4];
  v12 = a1[5];
  v13 = a1[8];
  v14 = a1[9];
  v21 = v8;
  objc_msgSend(v11, "_insertDeletionItemsForModelsAndDescendantModelsWithBlockRow:context:type:modelIDs:currentDepth:maximumDepth:options:error:", v10, v4, v13, v12, 1, v14, v9, &v21);
  v15 = v21;

  v16 = a1[6];
  v17 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v20 = v15;
  objc_msgSend(v4, "_updateBlockWithRow:options:error:", v17, v16, &v20);

  v18 = v20;
  return v18;
}

id __90__HMBLocalZone_Block__insertBlockToRemoveChildModelsWithType_parentModelID_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = *(_QWORD *)(a1 + 64);
  v20 = 0;
  v7 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:error:", v5, v6, &v20);
  v8 = v20;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;
  v9 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v12 = *(_QWORD *)(a1 + 40);
  v19 = v8;
  objc_msgSend(v4, "_insertDeletionItemsWithZoneRow:blockRow:type:parentModelID:error:", v9, v11, v10, v12, &v19);
  v13 = v19;

  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v18 = v13;
  objc_msgSend(v4, "_updateBlockWithRow:options:error:", v15, v14, &v18);

  v16 = v18;
  return v16;
}

id __85__HMBLocalZone_Block__insertBlockToRemoveAllModelsWithType_modelTypes_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v5 = *(_QWORD *)(a1 + 64);
  v28 = 0;
  v6 = objc_msgSend(v3, "_insertBlockWithZoneRow:type:error:", v4, v5, &v28);
  v7 = v28;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        v15 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
        v16 = *(_QWORD *)(a1 + 64);
        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v23 = v13;
        objc_msgSend(v3, "_insertDeletionItemsWithZoneRow:blockRow:type:modelType:error:", v15, v17, v16, v14, &v23);
        v7 = v23;

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v22 = v7;
  objc_msgSend(v3, "_updateBlockWithRow:options:error:", v19, v18, &v22);
  v20 = v22;

  return v20;
}

id __63__HMBLocalZone_Block__insertBlockWithType_options_items_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[8];
  v7 = a1[5];
  v8 = a1[6];
  v12 = 0;
  v9 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:options:items:error:", v5, v6, v7, v8, &v12);

  v10 = v12;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
  return v10;
}

id __54__HMBLocalZone_Block__createInputBlockWithType_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v10;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[6];
  v10 = 0;
  v7 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:error:", v5, v6, &v10);

  v8 = v10;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
  return v8;
}

id __50__HMBLocalZone_Block__createOutputBlockWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v8 = 0;
  v5 = objc_msgSend(v4, "_insertBlockWithZoneRow:type:error:", objc_msgSend(v3, "zoneRow"), 0, &v8);

  v6 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return v6;
}

- (id)modelFromRecord:(id)a3 storageLocation:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend(v7, "modelData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "modelEncoding"))
  {
    -[HMBLocalZone modelFromData:encoding:storageLocation:recordRowID:error:](self, "modelFromData:encoding:storageLocation:recordRowID:error:", v8, objc_msgSend(v7, "modelEncoding"), 2, objc_msgSend(v7, "recordRow"), a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)modelFromData:(id)a3 encoding:(unint64_t)a4 storageLocation:(unint64_t)a5 recordRowID:(unint64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;

  v12 = a3;
  -[HMBLocalZone modelContainer](self, "modelContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "modelFromData:encoding:storageLocation:error:", v12, a4, a5, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHmbRecordRow:", a6);
  return v14;
}

- (id)update:(id)a3 remove:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBLocalZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  HMBLocalZoneRawUpdateEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMBLocalZone *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  id obj;
  _QWORD v33[4];
  id v34;
  HMBLocalZone *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v11;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Asked to update models: %@ remove model IDs: %@", buf, 0x20u);

  }
  v31 = v7;

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    obj = v13;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
        -[HMBLocalZone modelContainer](v9, "modelContainer", v31);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(v19, "dataFromModel:encoding:storageLocation:updatedModelIDs:error:", v18, 2, 3, 0, &v37);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v37;

        if (!v20)
        {
          v26 = (void *)MEMORY[0x1D17B6230]();
          v27 = v9;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v44 = v29;
            v45 = 2112;
            v46 = v18;
            v47 = 2112;
            v48 = v21;
            _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode model %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          v25 = v31;
          v13 = obj;
          v23 = obj;
          goto LABEL_15;
        }
        v22 = -[HMBLocalZoneRawUpdateEntry initWithModel:encoded:]([HMBLocalZoneRawUpdateEntry alloc], "initWithModel:encoded:", v18, v20);
        objc_msgSend(v12, "addObject:", v22);

        ++v17;
      }
      while (v15 != v17);
      v13 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[HMBLocalZone localDatabase](v9, "localDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "local");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __37__HMBLocalZone_Model__update_remove___block_invoke;
  v33[3] = &unk_1E8933A70;
  v34 = v12;
  v35 = v9;
  v25 = v31;
  v36 = v31;
  objc_msgSend(v24, "sqlTransactionWithActivity:block:", 0, v33);
  v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v21;
}

- (id)update:(id)a3
{
  return -[HMBLocalZone update:remove:](self, "update:remove:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)remove:(id)a3
{
  return -[HMBLocalZone update:remove:](self, "update:remove:", MEMORY[0x1E0C9AA60], a3);
}

id __37__HMBLocalZone_Model__update_remove___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  id obj;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a1[4];
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v4 = 0;
  if (v36)
  {
    v5 = *(_QWORD *)v46;
    v29 = *(_QWORD *)v46;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
        v8 = objc_msgSend(a1[5], "zoneRow");
        objc_msgSend(v7, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmbModelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v4;
        objc_msgSend(v3, "_selectRecordWithZoneRow:modelID:returning:error:", v8, v10, 2, &v44);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v44;

        if (v12)
        {
          v27 = v12;

          goto LABEL_21;
        }
        if (v11)
        {
          v13 = objc_msgSend(v11, "recordRow");
          objc_msgSend(v7, "encoded");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v3, "_updateRecordWithRow:modelEncoding:modelData:modelSchema:error:", v13, 2, v14, 0, &v42);
          v4 = v42;
        }
        else
        {
          v32 = objc_msgSend(a1[5], "zoneRow");
          objc_msgSend(v7, "model");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hmbModelID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "model");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "hmbParentModelID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "model");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "hmbType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "encoded");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v17 = objc_msgSend(v3, "_insertRecordWithZoneRow:externalID:externalData:modelID:parentModelID:modelType:modelEncoding:modelData:modelSchema:pushEncoding:pushData:pushBlockRow:error:", v32, 0, 0, v33, v31, v15, 2, v16, 0, 0, 0, 0, &v43);
          v4 = v43;
          objc_msgSend(v7, "model");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setHmbRecordRow:", v17);

          v5 = v29;
        }

        ++v6;
      }
      while (v36 != v6);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v36)
        continue;
      break;
    }
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = a1[6];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      v23 = 0;
      v24 = v4;
      do
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v23);
        v26 = objc_msgSend(a1[5], "zoneRow");
        v37 = v24;
        objc_msgSend(v3, "_deleteRecordWithZoneRow:modelID:error:", v26, v25, &v37);
        v4 = v37;

        ++v23;
        v24 = v4;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v21);
  }

  v27 = v4;
LABEL_21:

  return v27;
}

- (id)fetchModelWithRecordRow:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6732;
  v15 = __Block_byref_object_dispose__6733;
  v16 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HMBLocalZone_Record_Internal__fetchModelWithRecordRow_error___block_invoke;
  v10[3] = &unk_1E89339F8;
  v10[4] = &v11;
  v10[5] = a3;
  LODWORD(a3) = objc_msgSend(v7, "sqlBlockWithActivity:error:block:", 0, a4, v10);

  if ((_DWORD)a3)
  {
    -[HMBLocalZone modelFromRecord:storageLocation:error:](self, "modelFromRecord:storageLocation:error:", v12[5], 2, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)fetchModelWithModelID:(id)a3 recordRow:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  if (a4)
    *a4 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6732;
  v21 = __Block_byref_object_dispose__6733;
  v22 = 0;
  -[HMBLocalZone sql](self, "sql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HMBLocalZone_Record_Internal__fetchModelWithModelID_recordRow_error___block_invoke;
  v14[3] = &unk_1E8933A20;
  v16 = &v17;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v11 = objc_msgSend(v9, "sqlBlockWithActivity:error:block:", 0, a5, v14);

  if (v11)
  {
    if (a4)
      *a4 = objc_msgSend((id)v18[5], "recordRow");
    -[HMBLocalZone modelFromRecord:storageLocation:error:](self, "modelFromRecord:storageLocation:error:", v18[5], 2, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (id)fetchRecordRowWithModelID:(id)a3 returning:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6732;
  v21 = __Block_byref_object_dispose__6733;
  v22 = 0;
  -[HMBLocalZone sql](self, "sql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__HMBLocalZone_Record_Internal__fetchRecordRowWithModelID_returning_error___block_invoke;
  v13[3] = &unk_1E8933A48;
  v15 = &v17;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v16 = a4;
  LODWORD(a5) = objc_msgSend(v9, "sqlBlockWithActivity:error:block:", 0, a5, v13);

  if ((_DWORD)a5)
    v11 = (id)v18[5];
  else
    v11 = 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)fetchRecordRowWithExternalID:(id)a3 returning:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6732;
  v21 = __Block_byref_object_dispose__6733;
  v22 = 0;
  -[HMBLocalZone sql](self, "sql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HMBLocalZone_Record_Internal__fetchRecordRowWithExternalID_returning_error___block_invoke;
  v13[3] = &unk_1E8933A48;
  v15 = &v17;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v16 = a4;
  LODWORD(a5) = objc_msgSend(v9, "sqlBlockWithActivity:error:block:", 0, a5, v13);

  if ((_DWORD)a5)
    v11 = (id)v18[5];
  else
    v11 = 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)fetchExternalIDsForModelIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  HMBLocalZone *v17;
  id v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZone sql](self, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke;
  v15[3] = &unk_1E8933A70;
  v9 = v6;
  v16 = v9;
  v17 = self;
  v10 = v7;
  v18 = v10;
  LODWORD(v7) = objc_msgSend(v8, "sqlBlockWithActivity:error:block:", 0, a4, v15);

  v11 = 0;
  if ((_DWORD)v7)
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "na_map:", &__block_literal_global_6735);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)queryAllRowRecordsReturning:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[HMBLocalZone sql](self, "sql");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectAllRecordsWithZoneRow:returning:", -[HMBLocalZone zoneRow](self, "zoneRow"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)setExternalID:(id)a3 externalData:(id)a4 forRecordRow:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  v7 = a3;
  -[HMBLocalZone sql](self, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HMBLocalZone_Record_Internal__setExternalID_externalData_forRecordRow___block_invoke;
  v12[3] = &unk_1E8933AD8;
  v13 = v7;
  v14 = a5;
  v9 = v7;
  objc_msgSend(v8, "sqlBlockWithActivity:block:", 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)removeAllRecordsWithError:(id *)a3
{
  void *v5;
  _QWORD v7[5];

  -[HMBLocalZone sql](self, "sql");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke;
  v7[3] = &unk_1E8933B28;
  v7[4] = self;
  LOBYTE(a3) = objc_msgSend(v5, "sqlTransactionWithActivity:error:block:", 0, a3, v7);

  return (char)a3;
}

id __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  id v16;
  id v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6732;
  v24 = __Block_byref_object_dispose__6733;
  v25 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v5 = (id *)(v21 + 5);
  obj = (id)v21[5];
  objc_msgSend(v3, "_deleteRecordsWithZoneRow:error:", v4, &obj);
  objc_storeStrong(v5, obj);
  v6 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v7 = (id *)(v21 + 5);
  v18 = (id)v21[5];
  objc_msgSend(v3, "_deleteItemWithZoneRow:error:", v6, &v18);
  objc_storeStrong(v7, v18);
  v8 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v9 = (id *)(v21 + 5);
  v17 = (id)v21[5];
  objc_msgSend(v3, "_deleteBlocksWithZoneRow:error:", v8, &v17);
  objc_storeStrong(v9, v17);
  v10 = objc_msgSend(*(id *)(a1 + 32), "zoneRow");
  v11 = (id *)(v21 + 5);
  v16 = (id)v21[5];
  objc_msgSend(v3, "_deleteIndexSentinelsWithZoneRow:error:", v10, &v16);
  objc_storeStrong(v11, v16);
  objc_msgSend(v3, "queryContextsByModelType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke_2;
  v15[3] = &unk_1E8933B00;
  v15[4] = *(_QWORD *)(a1 + 32);
  v15[5] = &v20;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);

  v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __59__HMBLocalZone_Record_Internal__removeAllRecordsWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(v4, "zoneRow");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "_deleteQueryForRecordRow:error:", v6, &obj);

  objc_storeStrong((id *)(v7 + 40), obj);
}

id __73__HMBLocalZone_Record_Internal__setExternalID_externalData_forRecordRow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  objc_msgSend(a2, "_updateRecordWithRow:externalID:externalData:error:", v2, v3, v3, &v5);
  return v5;
}

id __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v12 = objc_msgSend(a1[5], "zoneRow");
        v16 = v10;
        objc_msgSend(v3, "_selectRecordWithZoneRow:modelID:returning:error:", v12, v11, 3, &v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v16;

        if (v7)
          v14 = 1;
        else
          v14 = v13 == 0;
        if (!v14)
          objc_msgSend(a1[6], "addObject:", v13);

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __67__HMBLocalZone_Record_Internal__fetchExternalIDsForModelIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "externalID");
}

id __78__HMBLocalZone_Record_Internal__fetchRecordRowWithExternalID_returning_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v13;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v7 = a1[7];
  v13 = 0;
  objc_msgSend(v4, "_selectRecordWithZoneRow:externalID:returning:error:", v5, v6, v7, &v13);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = v13;
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  return v9;
}

id __75__HMBLocalZone_Record_Internal__fetchRecordRowWithModelID_returning_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v13;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v7 = a1[7];
  v13 = 0;
  objc_msgSend(v4, "_selectRecordWithZoneRow:modelID:returning:error:", v5, v6, v7, &v13);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = v13;
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  return v9;
}

id __71__HMBLocalZone_Record_Internal__fetchModelWithModelID_recordRow_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v12 = 0;
  objc_msgSend(v4, "_selectRecordWithZoneRow:modelID:returning:error:", v5, v6, 2, &v12);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  return v8;
}

id __63__HMBLocalZone_Record_Internal__fetchModelWithRecordRow_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v9;

  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(a2, "_selectRecordWithRow:returning:error:", v3, 2, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  return v5;
}

- (id)fetchModelWithModelID:(id)a3 error:(id *)a4
{
  return -[HMBLocalZone fetchModelWithModelID:recordRow:error:](self, "fetchModelWithModelID:recordRow:error:", a3, 0, a4);
}

- (id)fetchModelWithModelID:(id)a3 ofType:(Class)a4 error:(id *)a5
{
  void *v6;

  -[HMBLocalZone fetchModelWithModelID:recordRow:error:](self, "fetchModelWithModelID:recordRow:error:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v6 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (id)fetchModelsWithParentModelID:(id)a3 ofType:(Class)a4 error:(id *)a5
{
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6732;
  v25 = __Block_byref_object_dispose__6733;
  v26 = 0;
  -[HMBLocalZone sql](self, "sql");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HMBLocalZone_Record__fetchModelsWithParentModelID_ofType_error___block_invoke;
  v17[3] = &unk_1E8933B50;
  v20 = &v21;
  v17[4] = self;
  v12 = v8;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v14 = objc_msgSend(v11, "sqlBlockWithActivity:error:block:", 0, a5, v17);

  if (v14)
  {
    __modelsFromRecords(self, (void *)v22[5], (uint64_t)a4, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (id)fetchModelsWithParentModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6732;
  v19 = __Block_byref_object_dispose__6733;
  v20 = 0;
  -[HMBLocalZone sql](self, "sql");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HMBLocalZone_Record__fetchModelsWithParentModelID_error___block_invoke;
  v12[3] = &unk_1E8933A20;
  v14 = &v15;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = objc_msgSend(v7, "sqlBlockWithActivity:error:block:", 0, a4, v12);

  if (v9)
  {
    __modelsFromRecords(self, (void *)v16[5], 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)fetchAllModelsWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6732;
  v14 = __Block_byref_object_dispose__6733;
  v15 = 0;
  -[HMBLocalZone sql](self, "sql");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__HMBLocalZone_Record__fetchAllModelsWithError___block_invoke;
  v9[3] = &unk_1E8933B78;
  v9[4] = self;
  v9[5] = &v10;
  v6 = objc_msgSend(v5, "sqlBlockWithActivity:error:block:", 0, a3, v9);

  if (v6)
  {
    __modelsFromRecords(self, (void *)v11[5], 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)fetchModelsOfType:(Class)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6732;
  v20 = __Block_byref_object_dispose__6733;
  v21 = 0;
  -[HMBLocalZone sql](self, "sql");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__HMBLocalZone_Record__fetchModelsOfType_error___block_invoke;
  v13[3] = &unk_1E8933A20;
  v15 = &v16;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v10 = objc_msgSend(v8, "sqlBlockWithActivity:error:block:", 0, a4, v13);

  if (v10)
  {
    __modelsFromRecords(self, (void *)v17[5], (uint64_t)a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

id __48__HMBLocalZone_Record__fetchModelsOfType_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v12 = 0;
  objc_msgSend(v4, "_selectRecordsWithZoneRow:modelType:returning:error:", v5, v6, 2, &v12);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  return v8;
}

id __48__HMBLocalZone_Record__fetchAllModelsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v10 = 0;
  objc_msgSend(v4, "_selectRecordsWithZoneRow:returning:error:", objc_msgSend(v3, "zoneRow"), 2, &v10);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = v10;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  return v6;
}

id __59__HMBLocalZone_Record__fetchModelsWithParentModelID_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v12 = 0;
  objc_msgSend(v4, "_selectRecordsWithZoneRow:parentModelID:returning:error:", v5, v6, 2, &v12);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = v12;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  return v8;
}

id __66__HMBLocalZone_Record__fetchModelsWithParentModelID_ofType_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v13;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "zoneRow");
  v6 = a1[5];
  v7 = a1[6];
  v13 = 0;
  objc_msgSend(v4, "_selectRecordWithZoneRow:parentModelID:modelType:returning:error:", v5, v6, v7, 2, &v13);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = v13;
  v10 = *(_QWORD *)(a1[7] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  return v9;
}

@end
