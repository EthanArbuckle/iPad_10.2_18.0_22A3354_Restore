@implementation HMDUserManagementOperationManager

- (HMDUserManagementOperationManager)init
{
  return -[HMDUserManagementOperationManager initWithOperations:](self, "initWithOperations:", 0);
}

- (HMDUserManagementOperationManager)initWithOperations:(id)a3
{
  id v4;
  HMDUserManagementOperationManager *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *clientQueue;
  uint64_t v11;
  HMFTimer *saveTimer;
  void *v13;
  uint64_t v14;
  NSMutableArray *operations;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSHashTable *observedAccessories;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMDUserManagementOperationManager;
  v5 = -[HMDUserManagementOperationManager init](&v34, sel_init);
  if (v5)
  {
    HMDispatchQueueNameString();
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 15.0);
    saveTimer = v5->_saveTimer;
    v5->_saveTimer = (HMFTimer *)v11;

    -[HMDUserManagementOperationManager saveTimer](v5, "saveTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    operations = v5->_operations;
    v5->_operations = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reverseObjectEnumerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nextObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        do
        {
          if (objc_msgSend(v20, "isAuditOperation"))
          {
            objc_msgSend(v16, "addObject:", v20);
          }
          else
          {
            objc_msgSend(v20, "user");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "pairingIdentity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "accessory");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 && v24)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v25)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, v24);
              }
              if ((objc_msgSend(v25, "containsObject:", v22) & 1) == 0)
              {
                objc_msgSend(v25, "addObject:", v22);
                objc_msgSend(v16, "addObject:", v20);
              }

            }
          }
          objc_msgSend(v18, "nextObject");
          v26 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v26;
        }
        while (v26);
      }
      objc_msgSend(v16, "reverseObjectEnumerator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nextObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        do
        {
          -[NSMutableArray addObject:](v5->_operations, "addObject:", v29);
          objc_msgSend(v27, "nextObject");
          v30 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v30;
        }
        while (v30);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v31 = objc_claimAutoreleasedReturnValue();
    observedAccessories = v5->_observedAccessories;
    v5->_observedAccessories = (NSHashTable *)v31;

    -[HMDUserManagementOperationManager __registerIfNeededForReachablityChangeNotifications](v5, "__registerIfNeededForReachablityChangeNotifications");
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDUserManagementOperationManager;
  -[HMDUserManagementOperationManager dealloc](&v4, sel_dealloc);
}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMDUserManagementOperationManager operations](self, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, Operations = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMDUserManagementOperationManager operations](self, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Operations = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)operations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)_filteredOperationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserManagementOperationManager operations](self, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (!v4
          || (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "accessory", (_QWORD)v17),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v4, "isEqual:", v13),
              v13,
              v14))
        {
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v17);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (id)_filteredOperationsWithDependency:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserManagementOperationManager operations](self, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (!v12
          || (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "dependencies", (_QWORD)v17),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "containsObject:", v4),
              v13,
              v14))
        {
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v17);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (void)_cleanPriorOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDUserManagementOperationManager *v28;
  void *v29;
  id obj;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v4;
  objc_msgSend(v4, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = self;
  obj = (id)-[NSMutableArray copy](self->_operations, "copy");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", v14) & 1) != 0)
        {
          objc_msgSend(v12, "user");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "pairingIdentity");
          v16 = v7;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v29, "isEqual:", v17);

          v7 = v16;
          if (!v18)
            continue;
          v19 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserManagementOperationManager shortDescription](v28, "shortDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v37 = v21;
            v38 = 2112;
            v39 = v22;
            v40 = 2112;
            v41 = v12;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Dropping prior operation: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v19);
          -[NSMutableArray removeObject:](v28->_operations, "removeObject:", v12);
          objc_msgSend(v12, "setOperationManager:", 0);
          -[HMDUserManagementOperationManager homeManager](v28, "homeManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "backingStore");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "transaction:options:", CFSTR("kUserManagementOperationRemovedKey"), v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "modelObjectWithChangeType:", 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "add:", v26);

          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __59__HMDUserManagementOperationManager__cleanPriorOperations___block_invoke;
          v31[3] = &unk_1E89C2350;
          v31[4] = v28;
          objc_msgSend(v13, "save:", v31);
          -[HMDUserManagementOperationManager _handleRemovedOperation:](v28, "_handleRemovedOperation:", v12);
        }
        else
        {

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v9);
  }

}

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableArray containsObject:](self->_operations, "containsObject:", v5) & 1) == 0
      && (objc_msgSend(v5, "isFinished") & 1) == 0)
    {
      -[HMDUserManagementOperationManager _cleanPriorOperations:](self, "_cleanPriorOperations:", v5);
    }
    -[NSMutableArray addObject:](self->_operations, "addObject:", v5);
    objc_msgSend(v5, "setOperationManager:", self);
    -[HMDUserManagementOperationManager _handleAddedOperation:](self, "_handleAddedOperation:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)_handleAddedOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HMDUserManagementOperationManager__handleAddedOperation___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeOperationWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_operations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v4);

          if ((v11 & 1) != 0)
          {
            v12 = v9;

            if (v12)
            {
              -[NSMutableArray removeObject:](self->_operations, "removeObject:", v12);
              objc_msgSend(v12, "setOperationManager:", 0);
              -[HMDUserManagementOperationManager _handleRemovedOperation:](self, "_handleRemovedOperation:", v12);
            }
            goto LABEL_13;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

    v12 = 0;
LABEL_13:

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)removeOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableArray containsObject:](self->_operations, "containsObject:", v5))
    {
      -[NSMutableArray removeObject:](self->_operations, "removeObject:", v5);
      objc_msgSend(v5, "setOperationManager:", 0);
      -[HMDUserManagementOperationManager _handleRemovedOperation:](self, "_handleRemovedOperation:", v5);
    }
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)_handleRemovedOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HMDUserManagementOperationManager__handleRemovedOperation___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelAllOperations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDUserManagementOperationManager operations](self, "operations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)operationCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUserManagementOperationManager_operationCancelled___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)operationStoppedBackingOff:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMDUserManagementOperationManager_operationStoppedBackingOff___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__executeOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isReady"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Executing ready operation: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__HMDUserManagementOperationManager___executeOperation___block_invoke;
    v10[3] = &unk_1E89C21C0;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v11, "executeWithCompletionQueue:completionHandler:", v9, v10);

  }
}

- (void)__removeOperationAndProcessDependantOperations:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing operation '%@' and processing any dependant operations", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUserManagementOperationManager removeOperation:](self, "removeOperation:", v4);
  v20 = v4;
  -[HMDUserManagementOperationManager _filteredOperationsWithDependency:](self, "_filteredOperationsWithDependency:", v4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = v18;
          v29 = 2112;
          v30 = v19;
          v31 = 2112;
          v32 = v15;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@[%@] Processing dependant operation: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        -[HMDUserManagementOperationManager __executeOperation:](self, "__executeOperation:", v15);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (void)_handleAccessoryIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HMDUserManagementOperationManager__handleAccessoryIsReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__registerIfNeededForReachablityChangeNotifications
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDUserManagementOperationManager operations](self, "operations", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "accessory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserManagementOperationManager __registerIfNeededForReachablityChangeNotificationsForAccessory:](self, "__registerIfNeededForReachablityChangeNotificationsForAccessory:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)__registerIfNeededForReachablityChangeNotificationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserManagementOperationManager observedAccessories](self, "observedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting to observe accessory '%@' for reachability change notifications as we have pending operations for this accessory", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDUserManagementOperationManager observedAccessories](self, "observedAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handleAccessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), v4);

  }
}

- (void)__deregisterIfNeededForReachablityChangeNotificationsForAccessory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserManagementOperationManager observedAccessories](self, "observedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    -[HMDUserManagementOperationManager _filteredOperationsForAccessory:](self, "_filteredOperationsForAccessory:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[%@] No longer observing accessory '%@' for reachability change notifications we we have no pending operations for this accessory", (uint8_t *)&v15, 0x20u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("HMDAccessoryIsReachableNotification"), v4);

      -[HMDUserManagementOperationManager observedAccessories](self, "observedAccessories");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v4);

    }
  }

}

- (void)__save
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserManagementOperationManager shortDescription](self, "shortDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Kicking save timer", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDUserManagementOperationManager saveTimer](self, "saveTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");

}

- (void)_reallySave
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDUserManagementOperationManager clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HMDUserManagementOperationManager__reallySave__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDUserManagementOperationManager saveTimer](self, "saveTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDUserManagementOperationManager _reallySave](self, "_reallySave");
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMFTimer)saveTimer
{
  return self->_saveTimer;
}

- (NSHashTable)observedAccessories
{
  return self->_observedAccessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAccessories, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_operations, 0);
}

void __48__HMDUserManagementOperationManager__reallySave__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "operations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving all pending operations: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v9 = CFSTR("HMDHomeManagerSaveReasonKey");
  v10 = CFSTR("HMDUserManagementOperationManagerSaveReason");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("HMDHomeManagerSaveRequestNotificationKey"), *(_QWORD *)(a1 + 32), v7);

}

void __65__HMDUserManagementOperationManager__handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "shortDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v29 = v4;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1CD062000, v3, OS_LOG_TYPE_INFO, "%{public}@[%@] Received reachability notification: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_filteredOperationsForAccessory:", v7);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "shortDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v29 = v15;
            v30 = 2112;
            v31 = v16;
            v32 = 2112;
            v33 = v12;
            _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@[%@] Processing ready operation due to accessory reachability change: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v13);
          objc_msgSend(*(id *)(a1 + 32), "__executeOperation:", v12);
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Received invalid accessory reachability notification: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

void __56__HMDUserManagementOperationManager___executeOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Execution of operation '%@' failed with error: %@", (uint8_t *)&v10, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "__removeOperationAndProcessDependantOperations:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __64__HMDUserManagementOperationManager_operationStoppedBackingOff___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__executeOperation:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__HMDUserManagementOperationManager_operationCancelled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeOperation:", *(_QWORD *)(a1 + 40));
}

void __61__HMDUserManagementOperationManager__handleRemovedOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "__save");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__deregisterIfNeededForReachablityChangeNotificationsForAccessory:", v3);

}

uint64_t __59__HMDUserManagementOperationManager__handleAddedOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "__save");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__registerIfNeededForReachablityChangeNotificationsForAccessory:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "__executeOperation:", *(_QWORD *)(a1 + 40));
}

void __59__HMDUserManagementOperationManager__cleanPriorOperations___block_invoke(uint64_t a1)
{
  void *v2;
  HMDHomeSaveRequest *v3;

  v3 = -[HMDHomeSaveRequest initWithReason:information:postSyncNotification:]([HMDHomeSaveRequest alloc], "initWithReason:information:postSyncNotification:", CFSTR("kUserManagementOperationRemovedKey"), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveWithRequest:", v3);

}

+ (void)initialize
{
  HMDUserManagementOperationManager *v2;
  void *v3;

  v2 = objc_alloc_init(HMDUserManagementOperationManager);
  v3 = (void *)sharedManager;
  sharedManager = (uint64_t)v2;

}

+ (id)sharedManager
{
  return (id)sharedManager;
}

+ (void)setSharedManager:(id)a3
{
  objc_storeStrong((id *)&sharedManager, a3);
}

@end
