@implementation HMDBackingStoreCacheFetchMigratedResult

- (HMDBackingStoreCacheFetchMigratedResult)initWithGroup:(id)a3 update:(BOOL)a4 migration:(BOOL)a5 fetchResult:(id)a6
{
  id v11;
  id v12;
  HMDBackingStoreCacheFetchMigratedResult *v13;
  HMDBackingStoreCacheFetchMigratedResult *v14;
  void *v15;
  id fetchResult;
  HMDBackingStoreCacheFetchMigratedResult *v17;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackingStoreCacheFetchMigratedResult;
  v13 = -[HMDBackingStoreOperation init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_group, a3);
    v14->_update = a4;
    v14->_migration = a5;
    v15 = _Block_copy(v12);
    fetchResult = v14->_fetchResult;
    v14->_fetchResult = v15;

    v17 = v14;
  }

  return v14;
}

- (id)mainReturningError
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  HMDBackingStoreCacheFetchMigratedResult *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  id v35[2];
  _QWORD aBlock[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  id v40[2];
  id location;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchMigratedResult group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "groupID");

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v7 = v6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__23149;
  v46 = __Block_byref_object_dispose__23150;
  v47 = 0;
  objc_initWeak(&location, self);
  v8 = -[HMDBackingStoreCacheFetchMigratedResult migration](self, "migration");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke;
    aBlock[3] = &unk_24E778668;
    objc_copyWeak(v40, &location);
    v38 = &v42;
    v10 = v30;
    v40[1] = v5;
    v37 = v10;
    v39 = &v48;
    v11 = _Block_copy(aBlock);
    -[HMDBackingStoreOperation store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "local");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_fetchRecordTypeSchemaWithGroupID:callback:", v5, v11);

    objc_destroyWeak(v40);
  }
  if (!-[HMDBackingStoreCacheFetchMigratedResult migration](self, "migration") || *((_BYTE *)v49 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)v43[5];
    v43[5] = 0;

    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke_353;
    v31[3] = &unk_24E778690;
    objc_copyWeak(v35, &location);
    v34 = &v42;
    v35[1] = v5;
    v32 = v30;
    v3 = v14;
    v33 = v3;
    v16 = _Block_copy(v31);
    -[HMDBackingStoreOperation store](self, "store");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "local");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_fetchRecordsWithGroupID:callback:", v5, v16);

    objc_destroyWeak(v35);
  }
  v19 = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v21 = v20;
  v22 = (void *)MEMORY[0x227676638](v19);
  v23 = self;
  HMFGetOSLogHandle();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v25;
    v54 = 2048;
    v55 = v21 - v7;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@time to fetch migrated records: %.4f s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  if (v43[5])
  {

    v3 = 0;
  }
  -[HMDBackingStoreCacheFetchMigratedResult fetchResult](v23, "fetchResult");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[HMDBackingStoreCacheFetchMigratedResult fetchResult](v23, "fetchResult");
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v27)[2](v27, v3, v43[5]);

  }
  v28 = (id)v43[5];
  objc_destroyWeak(&location);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v28;
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (BOOL)update
{
  return self->_update;
}

- (BOOL)migration
{
  return self->_migration;
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

uint64_t __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSString *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
LABEL_3:
    v12 = 0;
    goto LABEL_4;
  }
  v12 = 1;
  if (v7 && WeakRetained)
  {
    +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nameToClassTransform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_msgSend(v15, "objectForKey:", v7);

    if (v16 || (v16 = NSClassFromString(v7)) != 0)
    {
      if (-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", objc_opt_class()))
      {
        v17 = [v16 alloc];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithUUID:", v18);

        if (v19)
        {
          objc_msgSend(*(id *)(a1 + 32), "schemaHashForObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8 || (objc_msgSend(v8, "isEqual:", v20) & 1) == 0)
          {
            v21 = (void *)MEMORY[0x227676638]();
            v22 = v11;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v26 = v21;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = *(_QWORD *)(a1 + 64);
              *(_DWORD *)buf = 138543618;
              v28 = v24;
              v29 = 2048;
              v30 = v25;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@detected migrations is need for %lu", buf, 0x16u);

              v21 = v26;
            }

            objc_autoreleasePoolPop(v21);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_3;
          }

        }
      }
    }
    v12 = 1;
  }
LABEL_4:

  return v12;
}

uint64_t __61__HMDBackingStoreCacheFetchMigratedResult_mainReturningError__block_invoke_353(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id WeakRetained;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  void *v43;
  void *context;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  v18 = a3;
  v19 = a5;
  v52 = a6;
  v51 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v24 = WeakRetained;
  if (v22)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a10);
    v25 = 1;
    goto LABEL_22;
  }
  v25 = 0;
  if (v17 && WeakRetained)
  {
    v53 = 0;
    +[HMDBackingStoreModelObject objectFromData:encoding:record:error:](HMDBackingStoreModelObject, "objectFromData:encoding:record:error:", v19, a4, v18, &v53);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v53;
    if (v50 || !v26)
    {
      v49 = v26;
      v47 = (void *)MEMORY[0x227676638]();
      v36 = v24;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 138543874;
        v55 = v38;
        v40 = (void *)v38;
        v56 = 2048;
        v57 = v39;
        v58 = 2112;
        v59 = v17;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@unable to decode object for %lu / %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v47);
      v25 = 0;
      v26 = v49;
      goto LABEL_21;
    }
    if (objc_msgSend(v24, "migration"))
    {
      objc_msgSend(*(id *)(a1 + 32), "schemaHashForObject:", v26);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21 || (objc_msgSend(v21, "isEqual:", v46) & 1) == 0)
      {
        v48 = v26;
        context = (void *)MEMORY[0x227676638]();
        v45 = v24;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v28 = objc_claimAutoreleasedReturnValue();
          v42 = *(_QWORD *)(a1 + 64);
          v43 = (void *)v28;
          v29 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138544642;
          v55 = v28;
          v56 = 2048;
          v57 = v42;
          v58 = 2112;
          v59 = v17;
          v60 = 2112;
          v61 = v29;
          v62 = 2112;
          v63 = v21;
          v64 = 2112;
          v65 = v46;
          v30 = v29;
          _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@detected a schema change for %lu / %@/%@ from %@ to %@", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(context);
        v26 = v48;
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v48);
        if (objc_msgSend(v45, "update"))
        {
          objc_msgSend(v45, "store");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "local");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "_updateRecordWithGroupID:name:schema:", *(_QWORD *)(a1 + 64), v17, v46);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v35 = *(void **)(v34 + 40);
          *(_QWORD *)(v34 + 40) = v33;

          v26 = v48;
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          {

            v25 = 1;
LABEL_21:

            goto LABEL_22;
          }
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v26);
    }
    v25 = 0;
    goto LABEL_21;
  }
LABEL_22:

  return v25;
}

@end
