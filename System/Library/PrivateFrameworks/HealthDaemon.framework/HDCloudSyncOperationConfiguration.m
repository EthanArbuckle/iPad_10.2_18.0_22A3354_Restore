@implementation HDCloudSyncOperationConfiguration

- (HDCloudSyncOperationConfiguration)initWithRepository:(id)a3 operationGroup:(id)a4 syncContainerPrefix:(id)a5 context:(id)a6 accessibilityAssertion:(id)a7 syncIdentifier:(id)a8 syncDate:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HDCloudSyncOperationConfiguration *v21;
  HDCloudSyncOperationConfiguration *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *syncContainerPrefix;
  uint64_t v27;
  NSUUID *syncIdentifier;
  uint64_t v29;
  NSDate *syncDate;
  void *v31;
  uint64_t v32;
  NSString *shortSyncIdentifier;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSString *shortProfileIdentifier;
  HDCloudSyncCachedCloudState *v41;
  HDCloudSyncCachedCloudState *cachedCloudState;
  HDCloudSyncComputedState *v43;
  HDCloudSyncComputedState *computedState;
  void *v46;
  id obj;
  id v49;
  id v50;
  void *v51;
  objc_super v52;

  v16 = a3;
  v50 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v49 = a7;
  v19 = a8;
  v20 = a9;
  v51 = v18;
  if ((objc_msgSend(v18, "options") & 8) != 0 && (objc_msgSend(v18, "options") & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncOperationConfiguration.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!((context.options & HKCloudSyncOptionRebase) && (context.options & HKCloudSyncOptionRebaseProhibited))"));

  }
  v52.receiver = self;
  v52.super_class = (Class)HDCloudSyncOperationConfiguration;
  v21 = -[HDCloudSyncOperationConfiguration init](&v52, sel_init);
  v22 = v21;
  v23 = v16;
  v24 = v17;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_repository, a3);
    objc_storeStrong((id *)&v22->_operationGroup, a4);
    v25 = objc_msgSend(v17, "copy");
    syncContainerPrefix = v22->_syncContainerPrefix;
    v22->_syncContainerPrefix = (NSString *)v25;

    objc_storeStrong((id *)&v22->_context, obj);
    objc_storeStrong((id *)&v22->_accessibilityAssertion, a7);
    v27 = objc_msgSend(v19, "copy");
    syncIdentifier = v22->_syncIdentifier;
    v22->_syncIdentifier = (NSUUID *)v27;

    v29 = objc_msgSend(v20, "copy");
    syncDate = v22->_syncDate;
    v22->_syncDate = (NSDate *)v29;

    objc_msgSend(v19, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "substringToIndex:", 4);
    v32 = objc_claimAutoreleasedReturnValue();
    shortSyncIdentifier = v22->_shortSyncIdentifier;
    v22->_shortSyncIdentifier = (NSString *)v32;

    objc_msgSend(v23, "profile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "profileIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = v23;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "substringToIndex:", 4);
    v39 = objc_claimAutoreleasedReturnValue();
    shortProfileIdentifier = v22->_shortProfileIdentifier;
    v22->_shortProfileIdentifier = (NSString *)v39;

    v23 = v37;
    v41 = -[HDCloudSyncCachedCloudState initWithRepository:accessibilityAssertion:]([HDCloudSyncCachedCloudState alloc], "initWithRepository:accessibilityAssertion:", v22->_repository, v22->_accessibilityAssertion);
    cachedCloudState = v22->_cachedCloudState;
    v22->_cachedCloudState = v41;

    v43 = objc_alloc_init(HDCloudSyncComputedState);
    computedState = v22->_computedState;
    v22->_computedState = v43;

  }
  return v22;
}

- (BOOL)rebaseProhibited
{
  return (-[HDCloudSyncContext options](self->_context, "options") >> 6) & 1;
}

- (id)pushStoresForContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  HDCloudSyncOperationConfiguration *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDCloudSyncRepository cachedOwnerIdentifierForContainer:](self->_repository, "cachedOwnerIdentifierForContainer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v6, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = self;
    v38 = 2114;
    v39 = v8;
    v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Look for a local cloud sync store with owner: %{public}@, container: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v6, "containerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRepository syncIdentityManager](self->_repository, "syncIdentityManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentSyncIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRepository profile](self->_repository, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "legacyRepositoryProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v8;
  +[HDCloudSyncStoreEntity storeIdentifiersForOwnerIdentifier:containerIdentifier:syncIdentity:profile:error:](HDCloudSyncStoreEntity, "storeIdentifiersForOwnerIdentifier:containerIdentifier:syncIdentity:profile:error:", v8, v12, v15, v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  if (v18)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      while (2)
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v21);
          -[HDCloudSyncOperationConfiguration pushStoreWithIdentifier:container:error:](self, "pushStoreWithIdentifier:container:error:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25), v6, a4);
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
          {

            v28 = 0;
            goto LABEL_14;
          }
          v27 = (void *)v26;
          objc_msgSend(v20, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v23)
          continue;
        break;
      }
    }

    v28 = v20;
LABEL_14:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)pushStoreWithIdentifier:(id)a3 container:(id)a4 error:(id *)a5
{
  HDCloudSyncRepository *repository;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *syncContainerPrefix;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  repository = self->_repository;
  v8 = a4;
  v9 = a3;
  -[HDCloudSyncRepository cachedOwnerIdentifierForContainer:](repository, "cachedOwnerIdentifierForContainer:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncRepository profile](self->_repository, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  syncContainerPrefix = self->_syncContainerPrefix;
  -[HDCloudSyncRepository syncIdentityManager](self->_repository, "syncIdentityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentSyncIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDCloudSyncStore syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:](HDCloudSyncStore, "syncStoreForProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:error:", v12, v9, syncContainerPrefix, v20, v16, v17, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)descriptionForSignpost
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncContext options](self->_context, "options");
  HKCloudSyncOptionsToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncContext reason](self->_context, "reason");
  HKCloudSyncReasonToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKOperationGroup name](self->_operationGroup, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("options=(%@), reason=(%@), groupName=%@, syncCircle=%@"), v4, v5, v6, self->_syncContainerPrefix);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)analyticsDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSString *syncContainerPrefix;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDCloudSyncContext reason](self->_context, "reason"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("options");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HDCloudSyncContext options](self->_context, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = CFSTR("group");
  -[CKOperationGroup name](self->_operationGroup, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("<none>");
  if (v4)
    v6 = (const __CFString *)v4;
  syncContainerPrefix = self->_syncContainerPrefix;
  v19[2] = v6;
  v19[3] = syncContainerPrefix;
  v18[3] = CFSTR("syncContainerPrefix");
  v18[4] = CFSTR("syncIdentifier");
  -[NSUUID UUIDString](self->_syncIdentifier, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  v18[5] = CFSTR("expectedSendSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CKOperationGroup expectedSendSize](self->_operationGroup, "expectedSendSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  v18[6] = CFSTR("expectedReceiveSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CKOperationGroup expectedReceiveSize](self->_operationGroup, "expectedReceiveSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v10;
  v18[7] = CFSTR("hasAccessibilityAssertion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_accessibilityAssertion != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v11;
  v18[8] = CFSTR("manateeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HDCloudSyncRepository repositorySettings](self->_repository, "repositorySettings") & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v12;
  v18[9] = CFSTR("primaryContainer");
  -[HDCloudSyncRepository primaryCKContainer](self->_repository, "primaryCKContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (void)cancelAllOperations
{
  -[HDCloudSyncOperationConfiguration setCanceled:](self, "setCanceled:", 1);
}

- (NSSet)finishedOperationTags
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_finishedTags, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v4)
    v5 = v4;
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v6 = v5;

  return (NSSet *)v6;
}

- (void)didFinishOperationTag:(id)a3
{
  NSMutableSet *finishedTags;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  finishedTags = self->_finishedTags;
  if (!finishedTags)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_finishedTags;
    self->_finishedTags = v5;

    finishedTags = self->_finishedTags;
  }
  -[NSMutableSet addObject:](finishedTags, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)satisfiesOperationTagDependencies:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((-[NSMutableSet containsObject:](self->_finishedTags, "containsObject:", v13) & 1) == 0)
        {
          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v10, "addObject:", v13);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  v14 = objc_msgSend(v10, "count");
  if (v14)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 734, CFSTR("Operation dependencies not satisifed: %@"), v10);

  return v14 == 0;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (NSString)syncContainerPrefix
{
  return self->_syncContainerPrefix;
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (NSUUID)syncIdentifier
{
  return self->_syncIdentifier;
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (NSString)shortSyncIdentifier
{
  return self->_shortSyncIdentifier;
}

- (NSString)shortProfileIdentifier
{
  return self->_shortProfileIdentifier;
}

- (HDCloudSyncCachedCloudState)cachedCloudState
{
  return self->_cachedCloudState;
}

- (HDCloudSyncComputedState)computedState
{
  return (HDCloudSyncComputedState *)objc_getProperty(self, a2, 104, 1);
}

- (void)setComputedState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedState, 0);
  objc_storeStrong((id *)&self->_cachedCloudState, 0);
  objc_storeStrong((id *)&self->_shortProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_shortSyncIdentifier, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_syncContainerPrefix, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_finishedTags, 0);
}

@end
