@implementation HMDRemoteAccountManager

- (HMDRemoteAccountManager)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDRemoteAccountManager)initWithIDSService:(id)a3
{
  id v5;
  HMDRemoteAccountManager *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableSet *accounts;
  uint64_t v14;
  NSMutableArray *resolveOperations;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDRemoteAccountManager;
  v6 = -[HMDRemoteAccountManager init](&v17, sel_init);
  if (v6)
  {
    HMDispatchQueueNameString();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    accounts = v6->_accounts;
    v6->_accounts = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    resolveOperations = v6->_resolveOperations;
    v6->_resolveOperations = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v6;
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDRemoteAccountManager accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Accounts"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMDRemoteAccountManager_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMDRemoteAccountManager_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMDRemoteAccountManager_reset__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (NSArray)accounts
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_accounts, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (id)accountForIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_accounts;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)accountForHandle:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_accounts;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "handles", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)accountForModelIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_accounts;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "modelIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)accountForDeviceHandle:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_accounts;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v18 = *(_QWORD *)v24;
    do
    {
      v17 = v6;
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "devices");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "handles");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "containsObject:", v4);

              if ((v14 & 1) != 0)
              {
                v15 = v8;

                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v15 = 0;
    }
    while (v6);
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  os_unfair_recursive_lock_unlock();
  return v15;
}

- (void)setAccounts:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *accounts;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    accounts = self->_accounts;
    self->_accounts = v5;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setManager:", self, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[NSMutableSet removeAllObjects](self->_accounts, "removeAllObjects");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)addAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  HMDRemoteAccountManager *v11;
  NSObject *v12;
  void *v13;
  HMDRemoteAccountManager *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  HMDRemoteAccountManager *v21;
  id v22;
  NSObject *queue;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  HMDRemoteAccountManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDRemoteAccountManager *v36;
  NSObject *v37;
  void *v38;
  NSMutableSet *obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  _BYTE buf[24];
  void *v59;
  HMDRemoteAccountManager *v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_43;
  os_unfair_recursive_lock_lock_with_options();
  if ((-[NSMutableSet containsObject:](self->_accounts, "containsObject:", v4) & 1) != 0)
  {
LABEL_42:
    os_unfair_recursive_lock_unlock();
    goto LABEL_43;
  }
  v40 = v4;
  if (!objc_msgSend(v4, "isAuthenticated"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = self->_accounts;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((objc_msgSend(v20, "isAuthenticated") & 1) != 0
            && objc_msgSend(v20, "isRelatedToAccount:", v40))
          {
            v35 = (void *)MEMORY[0x1D17BA0A0]();
            v36 = self;
            HMFGetOSLogHandle();
            v37 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v38;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v40;
              _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Unable to add account: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v35);

            v4 = v40;
            goto LABEL_42;
          }
        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
        if (v17)
          continue;
        break;
      }
    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableSet count](self->_accounts, "count"));
  obj = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = (void *)-[NSMutableSet copy](self->_accounts, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v6; ++j)
      {
        if (*(_QWORD *)v50 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        if (objc_msgSend(v9, "isRelatedToAccount:", v40))
        {
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = self;
          HMFGetOSLogHandle();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v9;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing related account: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v10);
          -[NSMutableSet removeObject:](self->_accounts, "removeObject:", v9);
          objc_msgSend(v9, "manager");
          v14 = (HMDRemoteAccountManager *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == v11;

          if (v15)
            objc_msgSend(v9, "setManager:", 0);
          __deleteAccountModel(v11, v9);
          -[NSMutableSet addObject:](obj, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v6);
  }

  if (!-[NSMutableSet count](obj, "count"))
  {
LABEL_28:
    v16 = 0;
    goto LABEL_29;
  }
  v16 = (void *)-[NSMutableSet copy](obj, "copy");
LABEL_29:

  -[NSMutableSet addObject:](self->_accounts, "addObject:", v40);
  objc_msgSend(v40, "setManager:", self);
  v21 = self;
  v22 = v40;
  queue = v21->_queue;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ____addAccountModel_block_invoke;
  v59 = &unk_1E89C2328;
  v60 = v21;
  v61 = v22;
  v24 = v22;
  dispatch_async(queue, buf);

  os_unfair_recursive_lock_unlock();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v16;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v25);
        __notifyDelegateAccountRemoved_120148(v21, *(void **)(*((_QWORD *)&v41 + 1) + 8 * k));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    }
    while (v26);
  }

  v29 = (void *)MEMORY[0x1D17BA0A0]();
  v30 = v21;
  HMFGetOSLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Account added: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v29);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = CFSTR("HMDAccountNotificationKey");
  v54 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("HMDRemoteAccountManagerAddedAccountNotification"), v30, v34);

  v4 = v40;
LABEL_43:

}

- (void)removeAccount:(id)a3
{
  id v4;
  HMDRemoteAccountManager *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_accounts, "containsObject:", v6))
    {
      -[NSMutableSet removeObject:](self->_accounts, "removeObject:", v6);
      objc_msgSend(v6, "manager");
      v5 = (HMDRemoteAccountManager *)objc_claimAutoreleasedReturnValue();
      if (v5 == self)
        objc_msgSend(v6, "setManager:", 0);
      __deleteAccountModel(self, v6);

      os_unfair_recursive_lock_unlock();
      __notifyDelegateAccountRemoved_120148(self, v6);
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
    v4 = v6;
  }

}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke;
    block[3] = &unk_1E89C1B48;
    block[4] = self;
    v12 = v7;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

- (BOOL)shouldCacheAccount:(id)a3
{
  return objc_msgSend(a3, "isAuthenticated");
}

- (BOOL)shouldSyncAccount:(id)a3
{
  return objc_msgSend(a3, "isAuthenticated");
}

- (BOOL)shouldSyncDevice:(id)a3
{
  void *v4;

  objc_msgSend(a3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDRemoteAccountManager shouldSyncAccount:](self, "shouldSyncAccount:", v4);

  return (char)self;
}

- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5
{
  return 0;
}

- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5
{
  return 1;
}

- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3
{
  return 0;
}

- (void)processAccountModel:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDAccount *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteAccountManager accountForModelIdentifier:](self, "accountForModelIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "transactionObjectUpdated:newValues:message:", 0, v10, v6);
LABEL_5:

    goto LABEL_6;
  }
  v9 = -[HMDAccount initWithObjectModel:]([HMDAccount alloc], "initWithObjectModel:", v10);
  if (v9)
  {
    v8 = v9;
    -[HMDRemoteAccountManager addAccount:](self, "addAccount:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)processAccountModelRemove:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDRemoteAccountManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteAccountManager accountForModelIdentifier:](self, "accountForModelIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDRemoteAccountManager removeAccount:](self, "removeAccount:", v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object model received", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HMDRemoteAccountManager accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (!a6)
  {
    objc_msgSend(v17, "toID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "toID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteAccountManager __handleSendMessageFailureWithError:destination:](self, "__handleSendMessageFailureWithError:destination:", v16, v20);

    }
  }

}

- (HMDIDSService)service
{
  return self->_service;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (NSMutableArray)resolveOperations
{
  return self->_resolveOperations;
}

- (HMDBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_resolveOperations, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDAccountHandleResolveOperation *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v35 = v7;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting to resolve handle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "resolveOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v11 = MEMORY[0x1E0C809B0];
    if (!v10)
    {
LABEL_15:

      goto LABEL_22;
    }
    v12 = *(_QWORD *)v30;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
      objc_msgSend(v14, "handle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 40)))
      {
        v16 = objc_msgSend(v14, "isFinished");

        if ((v16 & 1) == 0)
        {
          v18 = v14;

          if (v18)
          {
            v19 = 0;
            goto LABEL_23;
          }
LABEL_22:
          v18 = -[HMDAccountHandleResolveOperation initWithHandle:]([HMDAccountHandleResolveOperation alloc], "initWithHandle:", *(_QWORD *)(a1 + 40));
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Accounts.Resolve"));
          -[HMFOperation setActivity:](v18, "setActivity:", v20);
          objc_initWeak((id *)buf, *(id *)(a1 + 32));
          objc_initWeak(&location, v18);
          v25[0] = v11;
          v25[1] = 3221225472;
          v25[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_26;
          v25[3] = &unk_1E89B8458;
          objc_copyWeak(&v26, (id *)buf);
          objc_copyWeak(&v27, &location);
          -[HMDAccountHandleResolveOperation setCompletionBlock:](v18, "setCompletionBlock:", v25);
          objc_msgSend(*(id *)(a1 + 32), "resolveOperations");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v18);

          objc_destroyWeak(&v27);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

          v19 = 1;
LABEL_23:
          v22 = *(void **)(a1 + 48);
          if (v22)
          {
            v23[0] = v11;
            v23[1] = 3221225472;
            v23[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_3;
            v23[3] = &unk_1E89B4B38;
            v24 = v22;
            -[HMDAccountHandleResolveOperation addResolveBlock:](v18, "addResolveBlock:", v23);

          }
          if (v19)
            -[HMFOperation start](v18, "start");
LABEL_27:

          return;
        }
      }
      else
      {

      }
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v10)
          goto LABEL_6;
        goto LABEL_15;
      }
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v17;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cannot resolve handle before started", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v18 = (HMDAccountHandleResolveOperation *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_27;
  }
}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_26(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[1];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_2;
    v5[3] = &unk_1E89BE218;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5[4] = v3;
    dispatch_async(v4, v5);
    objc_destroyWeak(&v6);
  }

}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;

  v6 = a2;
  v5 = a3;
  if (!(v6 | v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__HMDRemoteAccountManager__resolveAccountForHandle_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolveOperations");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", WeakRetained);

  }
}

void __32__HMDRemoteAccountManager_reset__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accounts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "removeAccount:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __31__HMDRemoteAccountManager_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isMonitoring"))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 0);
    objc_msgSend(*(id *)(a1 + 32), "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeDelegate:", *(_QWORD *)(a1 + 32));

  }
}

void __32__HMDRemoteAccountManager_start__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[4];
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoring") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 1);
    objc_msgSend(*(id *)(a1 + 32), "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    v7 = *(id *)(a1 + 32);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v7;
      v9 = v7;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Staring audit", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v9, "accounts");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
      if (v41)
      {
        v40 = *(_QWORD *)v57;
        v43 = v9;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v57 != v40)
              objc_enumerationMutation(obj);
            v42 = v12;
            v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v12);
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v45 = v13;
            objc_msgSend(v13, "devices");
            v44 = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
            if (v14)
            {
              v15 = v14;
              v47 = *(_QWORD *)v53;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v53 != v47)
                    objc_enumerationMutation(v44);
                  v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                  v18 = (void *)MEMORY[0x1D17BA0A0]();
                  v48 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v51 = 0u;
                  v19 = v46;
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                  if (v20)
                  {
                    v21 = v20;
                    v22 = *(_QWORD *)v49;
                    while (2)
                    {
                      for (j = 0; j != v21; ++j)
                      {
                        if (*(_QWORD *)v49 != v22)
                          objc_enumerationMutation(v19);
                        if (objc_msgSend(v17, "isRelatedToDevice:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j)))
                        {
                          v29 = (void *)MEMORY[0x1D17BA0A0]();
                          v30 = v9;
                          HMFGetOSLogHandle();
                          v31 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                          {
                            HMFGetLogIdentifier();
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v17, "shortDescription");
                            v33 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)v60 = 138543618;
                            v61 = v32;
                            v62 = 2112;
                            v63 = v33;
                            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Found duplicate device: %@", v60, 0x16u);

                            v9 = v43;
                          }

                          objc_autoreleasePoolPop(v29);
                          objc_msgSend(v45, "removeDevice:", v17);

                          goto LABEL_31;
                        }
                      }
                      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                      if (v21)
                        continue;
                      break;
                    }
                  }

                  v24 = (void *)MEMORY[0x1D17BA0A0]();
                  v25 = v9;
                  HMFGetOSLogHandle();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    HMFGetLogIdentifier();
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "shortDescription");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v60 = 138543618;
                    v61 = v27;
                    v62 = 2112;
                    v63 = v28;
                    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Audited device: %@", v60, 0x16u);

                    v9 = v43;
                  }

                  objc_autoreleasePoolPop(v24);
                  objc_msgSend(v19, "addObject:", v17);
LABEL_31:
                  objc_autoreleasePoolPop(v18);
                }
                v15 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
              }
              while (v15);
            }

            v12 = v42 + 1;
          }
          while (v42 + 1 != v41);
          v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
        }
        while (v41);
      }

      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v9;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v60 = 138543362;
        v61 = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Finished audit", v60, 0xCu);

      }
      objc_autoreleasePoolPop(v34);

      v7 = v38;
    }

  }
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDRemoteAccountManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_120181 != -1)
    dispatch_once(&sharedManager_onceToken_120181, block);
  return (id)sharedManager_accountManager_120182;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_120176 != -1)
    dispatch_once(&logCategory__hmf_once_t32_120176, &__block_literal_global_120177);
  return (id)logCategory__hmf_once_v33_120178;
}

void __38__HMDRemoteAccountManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_120178;
  logCategory__hmf_once_v33_120178 = v0;

}

void __40__HMDRemoteAccountManager_sharedManager__block_invoke(uint64_t a1)
{
  HMDRemoteAccountManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = [HMDRemoteAccountManager alloc];
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDRemoteAccountManager initWithIDSService:](v2, "initWithIDSService:", v4);
  v6 = (void *)sharedManager_accountManager_120182;
  sharedManager_accountManager_120182 = v5;

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating an HMDRemoteAccountManager", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
}

- (id)accountForSenderContext:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[HMDRemoteAccountManager deviceForSenderContext:](self, "deviceForSenderContext:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)deviceForSenderContext:(id)a3
{
  HMDAccount *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  HMDRemoteAccountManager *v11;
  HMDAccount *v12;
  HMDAccount *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDRemoteAccountManager *v19;
  NSObject *v20;
  id v21;
  HMDAccount *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMDRemoteAccountManager *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  HMDAccount *v33;
  HMDAccount *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  HMDAccount *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  HMDRemoteAccountManager *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  HMDAccount *v50;
  HMDAccount *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDDevice *v58;
  void *v59;
  void *v60;
  void *v61;
  HMDDevice *v62;
  void *v63;
  HMDAccount *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  HMDRemoteAccountManager *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  HMDRemoteAccountManager *v80;
  NSObject *v81;
  id v82;
  HMDAccount *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  HMDDevice *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  HMDDevice *v94;
  HMDRemoteAccountManager *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  HMDAccount *v99;
  HMDAccount *v100;
  HMDAccount *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  void *v106;
  void *v107;
  HMDRemoteAccountManager *v108;
  NSObject *v109;
  void *v110;
  uint64_t v111;
  HMDRemoteAccountManager *v112;
  void *v113;
  HMDRemoteAccountManager *v115;
  void *v116;
  void *v117;
  HMDAccount *v118;
  HMDRemoteAccountManager *v119;
  HMDRemoteAccountManager *v120;
  HMDAccount *v121;
  id obj;
  uint64_t v123;
  HMDAccount *v124;
  uint64_t v125;
  HMDAccount *v126;
  HMDRemoteAccountManager *v127;
  uint64_t j;
  HMDRemoteAccountManager *v129;
  HMDAccount *v130;
  HMDRemoteAccountManager *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  void *v136;
  uint8_t v137[4];
  void *v138;
  __int16 v139;
  void *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE buf[12];
  __int16 v146;
  HMDAccount *v147;
  __int16 v148;
  HMDAccount *v149;
  uint8_t v150[32];
  __int128 v151;
  __int128 v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v4 = (HMDAccount *)a3;
  if (v4)
  {
    v118 = v4;
    -[HMDAccount accountHandle](v4, "accountHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v120 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        v146 = 2112;
        v147 = v118;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot update with sender context: %@", buf, 0x16u);

      }
      v130 = 0;
      goto LABEL_93;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      v146 = 2112;
      v147 = v118;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updating with sender context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    os_unfair_recursive_lock_lock_with_options();
    v11 = v120;
    v12 = v118;
    v119 = v11;
    if (!v11)
    {
      v126 = 0;
      goto LABEL_17;
    }
    v13 = v12;
    -[HMDAccount accountIdentifier](v12, "accountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HMDAccount accountIdentifier](v13, "accountIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteAccountManager accountForIdentifier:](v119, "accountForIdentifier:", v15);
      v126 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDAccount accountHandle](v13, "accountHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v126 = 0;
        goto LABEL_16;
      }
      -[HMDAccount accountHandle](v13, "accountHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteAccountManager accountForHandle:](v119, "accountForHandle:", v15);
      v126 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    v12 = v13;
LABEL_17:
    v121 = v12;

    if (v126)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v119;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDAccount shortDescription](v126, "shortDescription");
        v22 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v21;
        v146 = 2112;
        v147 = v22;
        v148 = 2112;
        v149 = v121;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found an existing account, %@, for sender: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDAccount handles](v126, "handles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount accountHandle](v121, "accountHandle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "containsObject:", v24);

      if ((v25 & 1) == 0)
      {
        -[HMDAccount accountHandle](v121, "accountHandle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        v126 = v126;
        v28 = v26;
        v29 = v28;
        v127 = v27;
        if (v27 && v28)
        {
          v30 = (void *)MEMORY[0x1D17BA0A0]();
          v131 = v127;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "shortDescription");
            v33 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
            -[HMDAccount shortDescription](v126, "shortDescription");
            v34 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v32;
            v146 = 2112;
            v147 = v33;
            v148 = 2112;
            v149 = v34;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding handle, %@, to account: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v30);
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          -[HMDRemoteAccountManager accounts](v131, "accounts");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v142;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v142 != v37)
                  objc_enumerationMutation(v35);
                v39 = *(HMDAccount **)(*((_QWORD *)&v141 + 1) + 8 * i);
                if (v39 != v126)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * i), "handles");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "containsObject:", v29);

                  if (v41)
                  {
                    -[HMDAccount handles](v39, "handles");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = objc_msgSend(v42, "count");

                    v44 = (void *)MEMORY[0x1D17BA0A0]();
                    v45 = v131;
                    HMFGetOSLogHandle();
                    v46 = objc_claimAutoreleasedReturnValue();
                    v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
                    if (v43 == 1)
                    {
                      if (v47)
                      {
                        HMFGetLogIdentifier();
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v150 = 138543618;
                        *(_QWORD *)&v150[4] = v48;
                        *(_WORD *)&v150[12] = 2112;
                        *(_QWORD *)&v150[14] = v39;
                        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Removing account: %@", v150, 0x16u);

                      }
                      objc_autoreleasePoolPop(v44);
                      -[HMDRemoteAccountManager removeAccount:](v45, "removeAccount:", v39);
                    }
                    else
                    {
                      if (v47)
                      {
                        HMFGetLogIdentifier();
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v150 = 138543874;
                        *(_QWORD *)&v150[4] = v49;
                        *(_WORD *)&v150[12] = 2112;
                        *(_QWORD *)&v150[14] = v29;
                        *(_WORD *)&v150[22] = 2112;
                        *(_QWORD *)&v150[24] = v39;
                        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@Removing handle, %@, from account: %@", v150, 0x20u);

                      }
                      objc_autoreleasePoolPop(v44);
                      -[HMDAccount removeHandle:](v39, "removeHandle:", v29);
                    }
                  }
                }
              }
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v141, buf, 16);
            }
            while (v36);
          }

          -[HMDAccount addHandle:](v126, "addHandle:", v29);
        }

      }
    }
    else
    {
      v50 = v121;
      v51 = v50;
      if (v119)
      {
        v52 = (void *)MEMORY[0x1E0C99DE8];
        -[HMDAccount deviceHandle](v50, "deviceHandle");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "arrayWithArray:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccount localDeviceHandle](v51, "localDeviceHandle");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          -[HMDAccount localDeviceHandle](v51, "localDeviceHandle");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v57);

        }
        v58 = [HMDDevice alloc];
        -[HMDAccount deviceHandle](v51, "deviceHandle");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccount deviceVersion](v51, "deviceVersion");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v58, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v60, v55, 0, 0, v61, 0);

        -[HMDAccount accountIdentifier](v51, "accountIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = [HMDAccount alloc];
        if (v63)
        {
          -[HMDAccount accountIdentifier](v51, "accountIdentifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccount accountHandle](v51, "accountHandle");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v141 = v66;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v150 = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = -[HMDAccount initWithIdentifier:handles:devices:](v64, "initWithIdentifier:handles:devices:", v65, v67, v68);
        }
        else
        {
          -[HMDAccount accountHandle](v51, "accountHandle");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDAccountIdentifier accountIdentifierForAccountHandle:](HMDAccountIdentifier, "accountIdentifierForAccountHandle:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccount accountHandle](v51, "accountHandle");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v141 = v67;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v150 = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = -[HMDAccount initWithIdentifier:handles:devices:](v64, "initWithIdentifier:handles:devices:", v66, v68, v69);

        }
      }
      else
      {
        v126 = 0;
      }

      v70 = (void *)MEMORY[0x1D17BA0A0]();
      v71 = v119;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v73;
        v146 = 2112;
        v147 = v126;
        _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_INFO, "%{public}@Adding account: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v70);
      -[HMDRemoteAccountManager addAccount:](v71, "addAccount:", v126);
    }
    -[HMDAccount localDeviceHandle](v121, "localDeviceHandle");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccount deviceHandle](v121, "deviceHandle");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccount deviceForHandle:](v126, "deviceForHandle:", v74);
    v130 = (HMDAccount *)objc_claimAutoreleasedReturnValue();

    if (v130)
    {
      -[HMDAccount deviceVersion](v121, "deviceVersion");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v75)
        goto LABEL_91;
      -[HMDAccount deviceVersion](v121, "deviceVersion");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount version](v130, "version");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = HMFEqualObjects();

      if ((v78 & 1) != 0)
      {
LABEL_91:

        v111 = os_unfair_recursive_lock_unlock();
        v7 = (void *)MEMORY[0x1D17BA0A0](v111);
        v112 = v119;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v113;
          v146 = 2112;
          v147 = v121;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updated with sender context: %@", buf, 0x16u);

        }
LABEL_93:

        objc_autoreleasePoolPop(v7);
        v4 = v118;
        goto LABEL_94;
      }
      v79 = (void *)MEMORY[0x1D17BA0A0]();
      v80 = v119;
      HMFGetOSLogHandle();
      v81 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v82 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDAccount deviceVersion](v121, "deviceVersion");
        v83 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v82;
        v146 = 2112;
        v147 = v130;
        v148 = 2112;
        v149 = v83;
        _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with version: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v79);
      -[HMDAccount deviceVersion](v121, "deviceVersion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount updateVersion:](v130, "updateVersion:", v84);
    }
    else
    {
      v85 = (void *)MEMORY[0x1E0C99DE8];
      -[HMDAccount deviceHandle](v121, "deviceHandle");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "arrayWithArray:", v87);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      if (v117)
      {
        -[HMDAccount localDeviceHandle](v121, "localDeviceHandle");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "addObject:", v88);

      }
      v89 = [HMDDevice alloc];
      -[HMDAccount deviceHandle](v121, "deviceHandle");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "identifier");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)objc_msgSend(v116, "copy");
      -[HMDAccount deviceVersion](v121, "deviceVersion");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = -[HMDDevice initWithIdentifier:handles:name:productInfo:version:capabilities:](v89, "initWithIdentifier:handles:name:productInfo:version:capabilities:", v91, v92, 0, 0, v93, 0);

      v95 = v119;
      v124 = v126;
      v130 = v94;
      v115 = v95;
      if (v95 && v124 && v130)
      {
        v96 = (void *)MEMORY[0x1D17BA0A0]();
        v129 = v115;
        HMFGetOSLogHandle();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccount shortDescription](v130, "shortDescription");
          v99 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
          -[HMDAccount shortDescription](v124, "shortDescription");
          v100 = (HMDAccount *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v98;
          v146 = 2112;
          v147 = v99;
          v148 = 2112;
          v149 = v100;
          _os_log_impl(&dword_1CD062000, v97, OS_LOG_TYPE_INFO, "%{public}@Adding device, %@, to the account: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v96);
        v151 = 0u;
        v152 = 0u;
        memset(v150, 0, sizeof(v150));
        -[HMDRemoteAccountManager accounts](v129, "accounts");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v150, buf, 16);
        if (v125)
        {
          v123 = **(_QWORD **)&v150[16];
          do
          {
            for (j = 0; j != v125; ++j)
            {
              if (**(_QWORD **)&v150[16] != v123)
                objc_enumerationMutation(obj);
              v101 = *(HMDAccount **)(*(_QWORD *)&v150[8] + 8 * j);
              if (v101 != v124)
              {
                v134 = 0u;
                v135 = 0u;
                v132 = 0u;
                v133 = 0u;
                -[HMDAccount devices](v101, "devices");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v132, &v141, 16);
                if (v103)
                {
                  v104 = *(_QWORD *)v133;
                  do
                  {
                    for (k = 0; k != v103; ++k)
                    {
                      if (*(_QWORD *)v133 != v104)
                        objc_enumerationMutation(v102);
                      v106 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
                      if (objc_msgSend(v106, "isRelatedToDevice:", v130, v115))
                      {
                        v107 = (void *)MEMORY[0x1D17BA0A0]();
                        v108 = v129;
                        HMFGetOSLogHandle();
                        v109 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v137 = 138543618;
                          v138 = v110;
                          v139 = 2112;
                          v140 = v106;
                          _os_log_impl(&dword_1CD062000, v109, OS_LOG_TYPE_INFO, "%{public}@Removing device: %@", v137, 0x16u);

                        }
                        objc_autoreleasePoolPop(v107);
                        -[HMDAccount removeDevice:](v101, "removeDevice:", v106);
                      }
                    }
                    v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v132, &v141, 16);
                  }
                  while (v103);
                }

              }
            }
            v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v150, buf, 16);
          }
          while (v125);
        }

        -[HMDAccount addDevice:](v124, "addDevice:", v130);
      }

      v84 = v116;
    }

    goto LABEL_91;
  }
  v130 = 0;
LABEL_94:

  return v130;
}

- (void)__handleSendMessageFailureWithError:(id)a3 destination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDRemoteAccountManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  HMDRemoteAccountManager *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDRemoteAccountManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDRemoteAccountManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDRemoteAccountManager *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  HMDRemoteAccountManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDRemoteAccountManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id location;
  _BYTE buf[24];
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55[3];

  v55[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v51 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Received notification of failed message to, %@, with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D34028]);

    if (v14)
    {
      if ((objc_msgSend(v6, "code") & 0xFFFFFFFFFFFFFFFELL) != 2)
        goto LABEL_40;
LABEL_10:
      v17 = v10;
      v18 = v8;
      if (!v17)
      {
LABEL_39:

        goto LABEL_40;
      }
      +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accountHandleFromString:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = v17;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2160;
          *(_QWORD *)&buf[14] = 1752392040;
          *(_WORD *)&buf[22] = 2112;
          v51 = v18;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown account handle: %{mask.hash}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v27);
        goto LABEL_38;
      }
      -[HMDRemoteAccountManager accountForHandle:](v17, "accountForHandle:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v22;
      if (v22)
      {
        if ((objc_msgSend(v22, "isGlobal") & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = v17;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v51 = v48;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from non-global handle: %{mask.hash}@", buf, 0x20u);

          }
          goto LABEL_19;
        }
        if (!v21)
        {
          -[HMDRemoteAccountManager accountForDeviceHandle:](v17, "accountForDeviceHandle:", v48);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            v43 = (void *)MEMORY[0x1D17BA0A0]();
            v44 = v17;
            HMFGetOSLogHandle();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v46;
              *(_WORD *)&buf[12] = 2160;
              *(_QWORD *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              v51 = v48;
              _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from device handle with no account %{mask.hash}@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v43);
            goto LABEL_37;
          }
        }
        objc_msgSend(v21, "deviceForHandle:", v48);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v47)
        {
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = v17;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v51 = v48;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown device handle: %{mask.hash}@", buf, 0x20u);

          }
LABEL_19:

          objc_autoreleasePoolPop(v23);
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
      }
      else
      {
        if (!v21)
        {
          v39 = (void *)MEMORY[0x1D17BA0A0]();
          v40 = v17;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v42;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v51 = v18;
            _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Received unregistration from unknown destination: %{mask.hash}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v39);
          goto LABEL_37;
        }
        v47 = 0;
      }
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v17;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        v51 = v18;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Received unregistration from destination: %{mask.hash}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v31);
      objc_initWeak(&location, v32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____handleUnregisteredDestination_block_invoke;
      v51 = &unk_1E89B4B80;
      objc_copyWeak(v55, &location);
      v35 = v21;
      v52 = v35;
      v36 = v20;
      v53 = v36;
      v37 = v47;
      v54 = v37;
      -[HMDRemoteAccountManager _resolveAccountForHandle:completionHandler:](v32, "_resolveAccountForHandle:completionHandler:", v36, buf);

      objc_destroyWeak(v55);
      objc_destroyWeak(&location);

      goto LABEL_37;
    }
    objc_msgSend(v6, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D34118]);

    if (v16 && objc_msgSend(v6, "code") == 1)
      goto LABEL_10;
  }
LABEL_40:

}

@end
