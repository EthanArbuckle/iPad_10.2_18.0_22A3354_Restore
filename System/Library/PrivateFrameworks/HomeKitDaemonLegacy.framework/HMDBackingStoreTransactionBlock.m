@implementation HMDBackingStoreTransactionBlock

- (HMDBackingStoreTransactionBlock)initWithBackingStore:(id)a3 options:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  HMDBackingStoreTransactionBlock *v11;
  uint64_t v12;
  NSMutableArray *objects;
  const __CFString *v14;
  HMDBackingStoreTransactionBlock *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDBackingStoreTransactionBlock;
  v11 = -[HMDBackingStoreTransactionBlock init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    objects = v11->_objects;
    v11->_objects = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_options, a4);
    objc_storeWeak((id *)&v11->_backingStore, v8);
    v11->_committed = 0;
    if (v10)
      v14 = v10;
    else
      v14 = CFSTR("anonymous");
    objc_msgSend(v9, "setLabel:", v14);
    v15 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_destroyWeak((id *)&self->_backingStore);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)run:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDBackingStoreTransactionBlock backingStore](self, "backingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commit:run:save:completionHandler:", self, 1, 1, v4);

}

- (HMDBackingStore)backingStore
{
  return (HMDBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (HMDBackingStoreTransactionOptions)options
{
  return self->_options;
}

- (NSMutableArray)objects
{
  return self->_objects;
}

- (BOOL)committed
{
  return self->_committed;
}

- (void)add:(id)a3
{
  -[HMDBackingStoreTransactionBlock add:withMessage:](self, "add:withMessage:", a3, 0);
}

- (void)add:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDBackingStoreTransactionBlock *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDBackingStoreTransactionBlock *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDBackingStoreTransactionBlock *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDBackingStoreTransactionItem *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v39 = (void *)MEMORY[0x1E0C99DA0];
    v40 = *MEMORY[0x1E0C99768];
    v41 = (void *)MEMORY[0x1E0CB3940];
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bsoType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("UUID for a transaction object (%@ / %@) must be set before adding to a transaction."), v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v45, 0);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v46);
  }
  if (-[HMDBackingStoreTransactionBlock committed](self, "committed"))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@adding to a committed transaction block probably indicates a bad state.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v47 = v7;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[HMDBackingStoreTransactionBlock objects](self, "objects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v50)
    {
      v14 = *(_QWORD *)v52;
      v48 = v6;
      v49 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v16, "change");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            v21 = (void *)MEMORY[0x1D17BA0A0]();
            v22 = self;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDBackingStoreTransactionBlock options](v22, "options");
              v25 = v13;
              v26 = self;
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "label");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v56 = v24;
              v57 = 2112;
              v58 = v28;
              _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Just got request to add duplicate model object to transaction %@! (Both will be processed):", buf, 0x16u);

              self = v26;
              v13 = v25;
              v6 = v48;

            }
            objc_autoreleasePoolPop(v21);
            objc_msgSend(v16, "change");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "change");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            changeTypeAsNSString(objc_msgSend(v31, "objectChangeType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("previous (%@)"), v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "dumpWithVerbosity:prefix:logType:", 1, v33, 16);

            v34 = (void *)MEMORY[0x1E0CB3940];
            changeTypeAsNSString(objc_msgSend(v6, "objectChangeType"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("new (%@)"), v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "dumpWithVerbosity:prefix:logType:", 1, v36, 16);

            v14 = v49;
          }
        }
        v50 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v50);
    }

    -[HMDBackingStoreTransactionBlock objects](self, "objects");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v47;
    v38 = -[HMDBackingStoreTransactionItem initWithChange:message:]([HMDBackingStoreTransactionItem alloc], "initWithChange:message:", v6, v47);
    objc_msgSend(v37, "addObject:", v38);

  }
}

- (void)addObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HMDBackingStoreTransactionBlock add:withMessage:](self, "add:withMessage:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)run
{
  -[HMDBackingStoreTransactionBlock run:](self, "run:", 0);
}

- (void)runWithoutSave:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDBackingStoreTransactionBlock backingStore](self, "backingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commit:run:save:archiveInline:completionHandler:", self, 1, 0, 1, v4);

}

- (void)save:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDBackingStoreTransactionBlock backingStore](self, "backingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreTransactionBlock options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commit:run:save:archiveInline:completionHandler:", self, 0, 1, objc_msgSend(v5, "mustSaveArchiveAtomically"), v4);

}

- (void)save
{
  -[HMDBackingStoreTransactionBlock save:](self, "save:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDBackingStoreTransactionBlock options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreTransactionBlock objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDBackingStoreTransaction options:%@ objects:%lu>"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  uint64_t v5;
  void *v7;
  HMDBackingStoreTransactionBlock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  _BOOL4 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v5 = a5;
  v26 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, (os_log_type_t)v5))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreTransactionBlock options](v8, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "debugString:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v10;
    v35 = 2112;
    v36 = v27;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1CD062000, v9, (os_log_type_t)v5, "%{public}@%@options: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDBackingStoreTransactionBlock objects](v8, "objects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[HMDBackingStoreTransactionBlock objects](v8, "objects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v19, "change");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          changeTypeAsNSString(objc_msgSend(v20, "objectChangeType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            v22 = objc_msgSend(v21, "isEqual:", CFSTR("delete")) ^ 1;
          else
            v22 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@:"), v27, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "change");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dumpWithVerbosity:prefix:logType:", v22, v23, v5);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

  }
}

- (void)dumpDebug:(id)a3
{
  -[HMDBackingStoreTransactionBlock dumpWithVerbosity:prefix:logType:](self, "dumpWithVerbosity:prefix:logType:", 0, a3, 1);
}

- (void)dumpDebug
{
  -[HMDBackingStoreTransactionBlock dumpDebug:](self, "dumpDebug:", &stru_1E89C3E38);
}

- (id)logIdentifier
{
  return CFSTR("BackingStore");
}

- (void)setBackingStore:(id)a3
{
  objc_storeWeak((id *)&self->_backingStore, a3);
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

+ (void)sort:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "change", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "objectChangeType");

          if (v13 == 3)
            v14 = v4;
          else
            v14 = v5;
          objc_msgSend(v14, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    __sort(v4);
    __sort(v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v4);
    objc_msgSend(v15, "addObjectsFromArray:", v5);
    objc_msgSend(v6, "setArray:", v15);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_145559 != -1)
    dispatch_once(&logCategory__hmf_once_t4_145559, &__block_literal_global_145560);
  return (id)logCategory__hmf_once_v5_145561;
}

void __46__HMDBackingStoreTransactionBlock_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_145561;
  logCategory__hmf_once_v5_145561 = v0;

}

@end
