@implementation HMDCoreDataCloudStoreTransactionLogEvent

- (HMDCoreDataCloudStoreTransactionLogEvent)initWithChangeSet:(id)a3 transactionAuthor:(id)a4
{
  id v7;
  id v8;
  HMDCoreDataCloudStoreTransactionLogEvent *v9;
  HMDCoreDataCloudStoreTransactionLogEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudStoreTransactionLogEvent;
  v9 = -[HMMLogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reasons, a3);
    objc_storeStrong((id *)&v10->_transactionAuthor, a4);
  }

  return v10;
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (NSCountedSet)reasons
{
  return self->_reasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
}

+ (void)trimChangeSetForUnchangedValues:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 138543618;
    v22 = v8;
    v23 = a1;
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPersistentChangedValues", v22) & 1) == 0)
        {
          v13 = (void *)MEMORY[0x227676638](objc_msgSend(v5, "addObject:", v12));
          v14 = a1;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "entity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "name");
            v18 = v9;
            v19 = v6;
            v20 = v5;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v30 = v16;
            v31 = 2112;
            v32 = v21;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Trimmed: NSManagedObject %@ has no changes to process", buf, 0x16u);

            v5 = v20;
            v6 = v19;
            v9 = v18;

            a1 = v23;
            v10 = v24;
          }

          objc_autoreleasePoolPop(v13);
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "minusSet:", v5);
}

+ (void)countMKFCKEntitiesInChangeSet:(id)a3 entitiesCount:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  __int128 v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v27;
    *(_QWORD *)&v9 = 138543362;
    v23 = v9;
    v24 = a1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "entity", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v14)
        {
          objc_msgSend(v25, "addObject:", v14);
          goto LABEL_16;
        }
        v15 = (void *)MEMORY[0x227676638]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (v14)
        {
          if (v18)
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v19;
            v32 = 2112;
            v33 = v14;
            v20 = v17;
            v21 = "%{public}@NSManagedObject not of type MKFCKModel, name: %@";
            v22 = 22;
LABEL_14:
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);

            a1 = v24;
          }
        }
        else if (v18)
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v31 = v19;
          v20 = v17;
          v21 = "%{public}@NSManagedObject entity has no name";
          v22 = 12;
          goto LABEL_14;
        }

        objc_autoreleasePoolPop(v15);
LABEL_16:

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v10);
  }

}

+ (id)eventForUpdates:(id)a3 inserts:(id)a4 deletes:(id)a5 transactionAuthor:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDCoreDataCloudStoreTransactionLogEvent *v16;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x24BDD14E0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  v15 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "trimChangeSetForUnchangedValues:", v15);
  objc_msgSend((id)objc_opt_class(), "countMKFCKEntitiesInChangeSet:entitiesCount:", v15, v14);
  objc_msgSend((id)objc_opt_class(), "countMKFCKEntitiesInChangeSet:entitiesCount:", v12, v14);

  objc_msgSend((id)objc_opt_class(), "countMKFCKEntitiesInChangeSet:entitiesCount:", v11, v14);
  if (objc_msgSend(v14, "count"))
    v16 = -[HMDCoreDataCloudStoreTransactionLogEvent initWithChangeSet:transactionAuthor:]([HMDCoreDataCloudStoreTransactionLogEvent alloc], "initWithChangeSet:transactionAuthor:", v14, v9);
  else
    v16 = 0;

  return v16;
}

@end
