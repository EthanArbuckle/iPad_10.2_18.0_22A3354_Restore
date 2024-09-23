@implementation HMDAccessorySettingsController

- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8 settingOwner:(BOOL)a9 migrationOwner:(BOOL)a10 factory:(id)a11 rootGroup:(id)a12 notificationCenter:(id)a13
{
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDAccessorySettingsController *v24;
  uint64_t v25;
  OS_os_log *logger;
  uint64_t v27;
  NSMapTable *groupsMap;
  uint64_t v29;
  NSMapTable *settingsMap;
  uint64_t v31;
  NSMutableArray *allChildrenIdentifiers;
  HMDAccessorySettingsBackingStoreTransactionReceiver *v33;
  HMDBackingStoreObjectProtocol *transactionReceiver;
  uint64_t v35;
  NSMutableSet *dependantControllers;
  uint64_t v37;
  HMDAccessorySettingsMessageHandler *messageHandler;
  uint64_t v39;
  NSMutableSet *constraintItemsMarkedForRemoval;
  NSOperationQueue *v41;
  NSOperationQueue *constraintModifyOperationQueue;
  uint64_t v43;
  HMFTimer *languageChangeDebounceTimer;
  id v46;
  id v47;
  id v48;
  id v49;
  id obj;
  objc_super v51;

  v20 = a3;
  obj = a4;
  v21 = a5;
  v49 = a6;
  v48 = a7;
  v47 = a8;
  v22 = a11;
  v23 = v21;
  v46 = a13;
  v51.receiver = self;
  v51.super_class = (Class)HMDAccessorySettingsController;
  v24 = -[HMDAccessorySettingsController init](&v51, sel_init);
  if (v24)
  {
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    logger = v24->_logger;
    v24->_logger = (OS_os_log *)v25;

    objc_storeStrong((id *)&v24->_workQueue, a3);
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v24->_delegate, obj);
    objc_storeWeak((id *)&v24->_dataSource, v23);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v27 = objc_claimAutoreleasedReturnValue();
    groupsMap = v24->_groupsMap;
    v24->_groupsMap = (NSMapTable *)v27;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v29 = objc_claimAutoreleasedReturnValue();
    settingsMap = v24->_settingsMap;
    v24->_settingsMap = (NSMapTable *)v29;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = objc_claimAutoreleasedReturnValue();
    allChildrenIdentifiers = v24->_allChildrenIdentifiers;
    v24->_allChildrenIdentifiers = (NSMutableArray *)v31;

    v33 = -[HMDAccessorySettingsBackingStoreTransactionReceiver initWithDelegate:]([HMDAccessorySettingsBackingStoreTransactionReceiver alloc], "initWithDelegate:", v24);
    transactionReceiver = v24->_transactionReceiver;
    v24->_transactionReceiver = (HMDBackingStoreObjectProtocol *)v33;

    objc_storeStrong((id *)&v24->_parentUUID, a6);
    objc_storeStrong((id *)&v24->_codingKey, a7);
    objc_storeStrong((id *)&v24->_logEventSubmitter, a8);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v35 = objc_claimAutoreleasedReturnValue();
    dependantControllers = v24->_dependantControllers;
    v24->_dependantControllers = (NSMutableSet *)v35;

    v24->_isSettingOwner = a9;
    v24->_isMigrationOwner = a10;
    v24->_hasCreatedUnprocessedRootGroup = 0;
    objc_msgSend(v22, "createMessageHandlerWithQueue:delegate:", v20, v24);
    v37 = objc_claimAutoreleasedReturnValue();
    messageHandler = v24->_messageHandler;
    v24->_messageHandler = (HMDAccessorySettingsMessageHandler *)v37;

    objc_storeStrong((id *)&v24->_factory, a11);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v39 = objc_claimAutoreleasedReturnValue();
    constraintItemsMarkedForRemoval = v24->_constraintItemsMarkedForRemoval;
    v24->_constraintItemsMarkedForRemoval = (NSMutableSet *)v39;

    v41 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    constraintModifyOperationQueue = v24->_constraintModifyOperationQueue;
    v24->_constraintModifyOperationQueue = v41;

    -[NSOperationQueue setUnderlyingQueue:](v24->_constraintModifyOperationQueue, "setUnderlyingQueue:", v20);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v24->_constraintModifyOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[HMDAccessorySettingsControllerDependencyFactory timerWithReason:interval:](v24->_factory, "timerWithReason:interval:", 3, 5.0);
    v43 = objc_claimAutoreleasedReturnValue();
    languageChangeDebounceTimer = v24->_languageChangeDebounceTimer;
    v24->_languageChangeDebounceTimer = (HMFTimer *)v43;

    -[HMFTimer setDelegate:](v24->_languageChangeDebounceTimer, "setDelegate:", v24);
    objc_storeStrong((id *)&v24->_notificationCenter, a13);
  }

  return v24;
}

- (HMDAccessorySettingsController)initWithQueue:(id)a3 delegate:(id)a4 dataSource:(id)a5 parentUUID:(id)a6 codingKey:(id)a7 logEventSubmitter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDAccessorySettingsControllerDependencyFactory *v20;
  void *v21;
  HMDAccessorySettingsController *v22;
  uint64_t v24;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(HMDAccessorySettingsControllerDependencyFactory);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v24) = 0;
  v22 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:](self, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:", v19, v18, v17, v16, v15, v14, v24, v20, 0, v21);

  return v22;
}

- (HMDAccessorySettingsController)initWithParentUUID:(id)a3 codingKey:(id)a4
{
  id v6;
  id v7;
  HMDAccessorySettingGroup *v8;
  uint64_t v9;
  void *v10;
  HMDAccessorySettingGroup *v11;
  void *v12;
  HMDAccessorySettingsController *v13;
  uint64_t v15;

  v6 = a4;
  v7 = a3;
  v8 = [HMDAccessorySettingGroup alloc];
  v9 = *MEMORY[0x1E0CB7EF8];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDAccessorySettingGroup initWithName:identifier:parentIdentifier:](v8, "initWithName:identifier:parentIdentifier:", v9, v10, v7);

  -[HMDAccessorySettingGroup setDataSource:](v11, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v15) = 0;
  v13 = -[HMDAccessorySettingsController initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:](self, "initWithQueue:delegate:dataSource:parentUUID:codingKey:logEventSubmitter:settingOwner:migrationOwner:factory:rootGroup:notificationCenter:", 0, 0, 0, v7, v6, 0, v15, 0, v11, v12);

  return v13;
}

- (BOOL)shouldEncodeSetting:(id)a3 withCoder:(id)a4 forAccessorySettingGroup:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "hmd_isForNonAdminSharedUser"))
  {
    v9 = -[HMDAccessorySettingsController shouldEncodeForNonAdminSharedUserForSetting:](self, "shouldEncodeForNonAdminSharedUserForSetting:", v7);
  }
  else
  {
    if (!objc_msgSend(v8, "hmd_isForXPCTransport"))
    {
      v10 = 1;
      goto LABEL_7;
    }
    v9 = -[HMDAccessorySettingsController shouldEncodeForXPCTransportForSetting:](self, "shouldEncodeForXPCTransportForSetting:", v7);
  }
  v10 = v9;
LABEL_7:

  return v10;
}

- (BOOL)shouldEncodeForNonAdminSharedUserForSetting:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(&unk_1E8B32220, "containsObject:", v3);

  return v4;
}

- (BOOL)shouldEncodeForXPCTransportForSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  char v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySettingsController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "keyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("root.locationServices.enabled"));

    if (v8)
    {
      -[HMDAccessorySettingsController parentUUID](self, "parentUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(self) = objc_msgSend(v6, "shouldEncodeLegacyLocationServiceSettingForSettingsParentUUID:", v9);

      goto LABEL_14;
    }
    objc_msgSend(v4, "keyPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("root.music.playbackInfluencesForYou")) & 1) == 0)
    {
      objc_msgSend(v4, "keyPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "isEqualToString:", CFSTR("root.music.soundCheck")))
      {
        objc_msgSend(v4, "keyPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("root.music.allowExplicitContent"));

        if ((v22 & 1) == 0)
        {
          LOBYTE(self) = 1;
          goto LABEL_14;
        }
        goto LABEL_11;
      }

    }
LABEL_11:
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    self = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "keyPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supportsUserMediaSettings");
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Filtering out keyPath = %@, filtered? = %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    LODWORD(self) = objc_msgSend(v5, "supportsUserMediaSettings") ^ 1;
    goto LABEL_14;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  self = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v12;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode xpc settings for controller due to no home for data source: %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  LOBYTE(self) = 0;
LABEL_14:

  return (char)self;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessorySettingsController parentUUID](self, "parentUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessorySettingsController parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDAccessorySettingsController isMigrationOwner](self, "isMigrationOwner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p HMDAccessorySettingsController %@: owner:%@, migrationOwner: %@>"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isSettingOwner
{
  HMDAccessorySettingsController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isSettingOwner;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsSettingOwner:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isSettingOwner = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasCreatedUnprocessedRootGroup
{
  HMDAccessorySettingsController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasCreatedUnprocessedRootGroup;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasCreatedUnprocessedRootGroup:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasCreatedUnprocessedRootGroup = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isProxy
{
  return !-[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner");
}

- (BOOL)hasDependants
{
  void *v2;
  BOOL v3;

  -[HMDAccessorySettingsController dependantControllers](self, "dependantControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMapTable)groupsMap
{
  os_unfair_lock_s *p_lock;
  NSMapTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_groupsMap;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setGroupsMap:(id)a3
{
  NSMapTable *v4;
  NSMapTable *groupsMap;

  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  groupsMap = self->_groupsMap;
  self->_groupsMap = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)settingsMap
{
  os_unfair_lock_s *p_lock;
  NSMapTable *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_settingsMap;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSettingsMap:(id)a3
{
  NSMapTable *v4;
  NSMapTable *settingsMap;

  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  settingsMap = self->_settingsMap;
  self->_settingsMap = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAccessorySettingGroup)rootGroup
{
  os_unfair_lock_s *p_lock;
  HMDAccessorySettingGroup *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rootGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRootGroup:(id)a3
{
  HMDAccessorySettingGroup *v4;
  HMDAccessorySettingGroup *rootGroup;

  v4 = (HMDAccessorySettingGroup *)a3;
  os_unfair_lock_lock_with_options();
  rootGroup = self->_rootGroup;
  self->_rootGroup = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_keyPathsForSettings
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSettingAlgorithm allSettingsFromRootGroup:](HMDSettingAlgorithm, "allSettingsFromRootGroup:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "keyPath", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (void)settingsHierarchyDidChange
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  HMDAccessorySettingGroup *rootGroup;
  NSMapTable *groupsMap;
  NSMapTable *settingsMap;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[9];
  _QWORD v12[9];
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__147676;
  v19[4] = __Block_byref_object_dispose__147677;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__147676;
  v17[4] = __Block_byref_object_dispose__147677;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__147676;
  v15[4] = __Block_byref_object_dispose__147677;
  v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__147676;
  v13[4] = __Block_byref_object_dispose__147677;
  p_lock = &self->_lock;
  v14 = 0;
  v4 = os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1D17BA0A0](v4);
  rootGroup = self->_rootGroup;
  groupsMap = self->_groupsMap;
  settingsMap = self->_settingsMap;
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke;
  v12[3] = &unk_1E89B9AC8;
  v12[4] = self;
  v12[5] = v19;
  v12[6] = v17;
  v12[7] = v15;
  v12[8] = v13;
  +[HMDSettingAlgorithm findChangedSettingsWithRootGroup:currentGroups:currentSettings:completion:](HMDSettingAlgorithm, "findChangedSettingsWithRootGroup:currentGroups:currentSettings:completion:", rootGroup, groupsMap, settingsMap, v12);
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke_2;
  v11[3] = &unk_1E89B9AF0;
  v11[4] = self;
  v11[5] = v19;
  v11[6] = v17;
  v11[7] = v15;
  v11[8] = v13;
  dispatch_async(v10, v11);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

- (void)_scheduleAuditWithReason:(unint64_t)a3
{
  void *v5;
  HMDAccessorySettingsController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessorySettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySettingsController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMDAccessorySettingsAuditReasonAsString(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received audit with reason %@", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDAccessorySettingsController hasCreatedUnprocessedRootGroup](v6, "hasCreatedUnprocessedRootGroup"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Not scheduling audit as the root group has been created but not processed yet", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[HMDAccessorySettingsController auditSettingsTimer](v6, "auditSettingsTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@There is already an fix setting request in queue, kicking it again", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDAccessorySettingsController auditSettingsTimer](v16, "auditSettingsTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "kick");
    }
    else
    {
      -[HMDAccessorySettingsController factory](v6, "factory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timerWithReason:interval:", 1, 15.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingsController setAuditSettingsTimer:](v6, "setAuditSettingsTimer:", v21);

      -[HMDAccessorySettingsController auditSettingsTimer](v6, "auditSettingsTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setDelegate:", v6);

      -[HMDAccessorySettingsController auditSettingsTimer](v6, "auditSettingsTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");
    }

  }
}

- (void)scheduleAuditWithReason:(unint64_t)a3 from:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  -[HMDAccessorySettingsController ownerController](self, "ownerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "scheduleAuditWithReason:from:", a3, v6);
  }
  else
  {
    -[HMDAccessorySettingsController workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMDAccessorySettingsController_scheduleAuditWithReason_from___block_invoke;
    block[3] = &unk_1E89BE2F0;
    block[4] = self;
    v12 = a3;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

- (void)_performSettingsAudit
{
  NSObject *v3;
  void *v4;
  HMDAccessorySettingsController *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessorySettingsController hasDependants](self, "hasDependants"))
  {
    if (!-[HMDAccessorySettingsController isMigrationOwner](self, "isMigrationOwner"))
    {
      -[HMDAccessorySettingsController _reevaluateDependantSettings](self, "_reevaluateDependantSettings");
      return;
    }
    if (!-[HMDAccessorySettingsController hasCreatedUnprocessedRootGroup](self, "hasCreatedUnprocessedRootGroup"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke;
      v11[3] = &unk_1E89C02B8;
      v11[4] = self;
      -[HMDAccessorySettingsController _migrateSettingsWithCompletion:](self, "_migrateSettingsWithCompletion:", v11);
      return;
    }
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      v8 = "%{public}@Not performing audit as the root group has been created but not processed yet";
      v9 = v6;
      v10 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1CD062000, v9, v10, v8, buf, 0xCu);

    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      v8 = "%{public}@No longer setting owner or don't have dependents not auditing.";
      v9 = v6;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_reevaluateDependantSettings
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner"))
    -[HMDAccessorySettingsController scheduleDependantFixup](self, "scheduleDependantFixup");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDAccessorySettingsController dependantControllers](self, "dependantControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[HMDAccessorySettingsController _keyPathsForSettings](self, "_keyPathsForSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didChangeDependantSettings:ownerSettingsKeyPaths:", self, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HMDAccessorySettingsController *v12;
  id v13;

  v4 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__HMDAccessorySettingsController_timerDidFire___block_invoke;
  v11 = &unk_1E89C2328;
  v12 = self;
  v6 = v4;
  v13 = v6;
  dispatch_async(v5, &v8);

  -[HMDAccessorySettingsController languageChangeDebounceTimer](self, "languageChangeDebounceTimer", v8, v9, v10, v11, v12);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[HMDAccessorySettingsController handleLanguageChangeTimerFired](self, "handleLanguageChangeTimerFired");

}

- (void)_createSettings
{
  NSObject *v3;
  void *v4;
  HMDAccessorySettingsController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *logger;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  HMDAccessorySettingsController *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Is setting migration owner will create settings.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessorySettingsController dataSource](v5, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController parentUUID](v5, "parentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelsToMakeSettingsForController:parentUUID:", v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDAccessorySettingsController setHasCreatedUnprocessedRootGroup:](v5, "setHasCreatedUnprocessedRootGroup:", 1);
    objc_msgSend(v8, "backingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[HMDAccessorySettingsController parentUUID](v5, "parentUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("addRootSettings-%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transaction:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v16, "add:withMessage:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 0);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    logger = v5->_logger;
    if (os_signpost_enabled(logger))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SettingsCreate", ", buf, 2u);
    }
    objc_msgSend(v8, "currentAccessorySetupMetricDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "markSetupBeginStage:error:", 5, 0);

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __49__HMDAccessorySettingsController__createSettings__block_invoke;
    v30[3] = &unk_1E89BE7B8;
    v30[4] = v5;
    v24 = v8;
    v31 = v24;
    v32 = 0xEEEEB0B5B2B2EEEELL;
    objc_msgSend(v16, "run:", v30);
    objc_msgSend(v24, "setupActivity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "markWithReason:", CFSTR("HMDAccessorySettingsController._createSettings.complete"));

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = v5;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Did not find any models to create settings.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }

}

- (void)_migrateSettingsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySettingsController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessorySettingsController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Check if migration is required.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessorySettingsController dataSource](v7, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelsToMigrateSettingsForController:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v16;
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Have settings to migrate. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v10, "backingStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transaction:options:", CFSTR("updateRootGroup"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "add:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v24++));
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v22);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__HMDAccessorySettingsController__migrateSettingsWithCompletion___block_invoke;
    v25[3] = &unk_1E89BFC88;
    v25[4] = v14;
    v26 = v4;
    objc_msgSend(v19, "run:", v25);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)mergeWithSettingsMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessorySettingTransform mergeWithGroupMetadata:group:](HMDAccessorySettingTransform, "mergeWithGroupMetadata:group:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeDependant:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessorySettingsController dependantControllers](self, "dependantControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(v6, "didBecomeIndependantOwner");
}

- (void)_performDependantFixup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingsController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSettingAlgorithm allSettingsFromRootGroup:](HMDSettingAlgorithm, "allSettingsFromRootGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v12, "value");
        else
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keyPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v9);
  }

  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v19;
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Performing dependent fixup with %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDAccessorySettingsController dependantControllers](v17, "dependantControllers", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "owner:didUpdateSettings:", v17, v6);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v22);
  }

}

- (void)scheduleDependantFixup
{
  NSObject *v3;
  _QWORD block[5];

  if (-[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner"))
  {
    if (-[HMDAccessorySettingsController hasDependants](self, "hasDependants"))
    {
      -[HMDAccessorySettingsController workQueue](self, "workQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__HMDAccessorySettingsController_scheduleDependantFixup__block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = self;
      dispatch_async(v3, block);

    }
  }
}

- (void)owner:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessorySettingsController_owner_didUpdateSettings___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)haveGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (id)settingForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if ((v14 & 1) != 0)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)groupForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if ((v14 & 1) != 0)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (void)onMessageUpdateValue:(id)a3 settingIdentifier:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDAccessorySettingsController _updateValue:forSetting:senderVersion:senderProductClass:completion:](self, "_updateValue:forSetting:senderVersion:senderProductClass:completion:", v12, v18, v14, a6, v15);
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for identifier %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v23);

  }
}

- (void)onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessorySettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[HMDAccessorySettingsController _updateValue:forSetting:senderVersion:senderProductClass:completion:](self, "_updateValue:forSetting:senderVersion:senderProductClass:completion:", v12, v17, v14, a6, v15);
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v22);

  }
}

- (void)_onMessageUpdateValue:(id)a3 settingKeyPath:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessorySettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[HMDAccessorySettingsController _updateValue:forSetting:senderVersion:senderProductClass:completion:](self, "_updateValue:forSetting:senderVersion:senderProductClass:completion:", v12, v17, v14, a6, v15);
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for keyPath %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v22);

  }
}

- (void)_updateValue:(id)a3 forSetting:(id)a4 senderVersion:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessorySettingsController *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAccessorySettingsController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  HMDAccessorySettingsController *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDAccessorySettingsController *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  HMDAccessorySettingsController *v60;
  id v61;
  _QWORD block[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  int64_t v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  -[HMDAccessorySettingsController ownerController](self, "ownerController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17
    || (objc_msgSend(v13, "keyPath"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "settingForKeyPath:", v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    -[HMDAccessorySettingsController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDAccessorySettingsController isProxy](self, "isProxy"))
    {
      if (a6 == 6)
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v70 = v29;
          v71 = 2112;
          v72 = v13;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay update value on setting(%@) to a second AudioAccessory", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        -[HMDAccessorySettingsController factory](v27, "factory");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "assertWithCondition:message:", 0, CFSTR("Cannot reforward settings update value to a second homepod"));

        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Cannot relay to an AudioAccessory multiple times"), CFSTR("Failed to handle relay."), 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v31);
        goto LABEL_19;
      }
      v53 = v14;
      objc_msgSend(v13, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "remoteMessageDestinationForAccessorySettingsController:target:", self, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1D17BA0A0]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v44;
        v71 = 2112;
        v72 = v31;
        _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Forwarding update value message to owner device %@.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      -[HMDAccessorySettingsController messageHandler](v42, "messageHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_94;
      v58[3] = &unk_1E89B9B40;
      v61 = v15;
      v59 = v13;
      v60 = v42;
      objc_msgSend(v45, "relayUpdateValue:keyPath:destination:completion:", v12, v46, v31, v58);

      v39 = v61;
    }
    else
    {
      -[HMDAccessorySettingsController legacySettingsAdaptor](self, "legacySettingsAdaptor");
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v47 = v14;
        objc_msgSend(v13, "value");
        v48 = v12;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = HMFEqualObjects();

        if (v50)
        {
          (*((void (**)(id, id, uint64_t, _QWORD))v15 + 2))(v15, v48, objc_msgSend(v13, "configurationVersion"), 0);
          v31 = 0;
          v12 = v48;
          v14 = v47;
        }
        else
        {
          v14 = v47;
          if (objc_msgSend(v13, "shouldBlockSettingUpdateFromVersion:isMultiUserEnabled:", v47, objc_msgSend(v25, "isMultiUserEnabledForAccessorySettingsController:", self)))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v51);

            v31 = 0;
            v12 = v48;
          }
          else
          {
            v12 = v48;
            -[HMDAccessorySettingsController _runUpdateTransactionWithValue:setting:completion:](self, "_runUpdateTransactionWithValue:setting:completion:", v48, v13, v15);
            v31 = 0;
          }
        }
        goto LABEL_19;
      }
      v31 = (void *)v32;
      v52 = v12;
      v53 = v14;
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "keyPath");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v36;
        v71 = 2114;
        v72 = v37;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Delegating update for %{public}@ to adaptor", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(v13, "keyPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_98;
      v54[3] = &unk_1E89C25C8;
      v54[4] = v34;
      v55 = v13;
      v56 = v52;
      v57 = v15;
      objc_msgSend(v31, "updateSettingWithKeyPath:settingValue:completion:", v38, v56, v54);

      v12 = v52;
      v39 = v55;
    }

    v14 = v53;
LABEL_19:

    goto LABEL_20;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v23;
    v71 = 2112;
    v72 = v13;
    v73 = 2112;
    v74 = v17;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Forwarding update value for %@ to owner controller. %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(v17, "workQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke;
  block[3] = &unk_1E89B9B18;
  v63 = v17;
  v64 = v12;
  v65 = v13;
  v66 = v14;
  v68 = a6;
  v67 = v15;
  dispatch_async(v24, block);

  v25 = v63;
LABEL_20:

}

- (void)_runUpdateTransactionWithValue:(id)a3 setting:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDAccessorySettingsController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDAccessorySettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAccessorySettingModel *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingModel *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = a5;
  -[HMDAccessorySettingsController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v14;
    v43 = 2112;
    v44 = v9;
    v45 = 2112;
    v46 = v15;
    v47 = 2112;
    v48 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating %@ value from %@ to %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v16 = objc_msgSend(v10, "isMultiUserEnabledForAccessorySettingsController:", v12);
  objc_msgSend(v10, "supportedMultiUserLanguageCodesForAccessorySettingsController:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v9, "shouldTurnOffPersonalRequestsOnLanguageChangeTo:supportedMultiUserLanguageCodes:isMultiUserEnabled:", v8, v17, v16);

  if ((_DWORD)v16)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v12;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Will remove owner from access control on language change.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v10, "assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v23 = [HMDAccessorySettingModel alloc];
  objc_msgSend(v9, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v23, "initWithObjectChangeType:uuid:parentUUID:", 2, v24, v25);

  encodeRootObject();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setValue:](v26, "setValue:", v27);

  v28 = objc_msgSend(v9, "configurationVersion") + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingModel setConfigurationVersion:](v26, "setConfigurationVersion:", v29);

  -[HMDAccessorySettingsController dataSource](v12, "dataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "backingStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "transaction:options:", CFSTR("Update Setting Value"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "add:", v26);
  if (v22)
    objc_msgSend(v33, "add:", v22);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __84__HMDAccessorySettingsController__runUpdateTransactionWithValue_setting_completion___block_invoke;
  v37[3] = &unk_1E89B9B68;
  v38 = v8;
  v39 = v36;
  v40 = v28;
  v34 = v8;
  v35 = v36;
  objc_msgSend(v33, "run:", v37);

}

- (void)onMessageAddConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  void *v11;
  HMDAccessorySettingsController *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  HMDAccessorySettingsController *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  HMDAccessorySettingConstraintModifyOperation *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v34 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received add constraint request %@ for setting %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__147676;
  v35 = __Block_byref_object_dispose__147677;
  v36 = objc_alloc_init(HMDAccessorySettingConstraintModifyOperation);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke;
  aBlock[3] = &unk_1E89B9B90;
  v16 = v10;
  v31 = v16;
  v32 = buf;
  v17 = _Block_copy(aBlock);
  v22 = v15;
  v23 = 3221225472;
  v24 = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_2;
  v25 = &unk_1E89C0448;
  v26 = v12;
  v18 = v9;
  v27 = v18;
  v19 = v8;
  v28 = v19;
  v20 = v17;
  v29 = v20;
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setExecutionBlock:", &v22);
  -[HMDAccessorySettingsController constraintModifyOperationQueue](v12, "constraintModifyOperationQueue", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
}

- (void)onMessageRemoveConstraint:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  id v10;
  void *v11;
  HMDAccessorySettingsController *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  HMDAccessorySettingsController *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  HMDAccessorySettingConstraintModifyOperation *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    v34 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Received remove constraint request %@ for setting %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__147676;
  v35 = __Block_byref_object_dispose__147677;
  v36 = objc_alloc_init(HMDAccessorySettingConstraintModifyOperation);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke;
  aBlock[3] = &unk_1E89B9B90;
  v16 = v10;
  v31 = v16;
  v32 = buf;
  v17 = _Block_copy(aBlock);
  v22 = v15;
  v23 = 3221225472;
  v24 = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_2;
  v25 = &unk_1E89C0448;
  v26 = v12;
  v18 = v9;
  v27 = v18;
  v19 = v8;
  v28 = v19;
  v20 = v17;
  v29 = v20;
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setExecutionBlock:", &v22);
  -[HMDAccessorySettingsController constraintModifyOperationQueue](v12, "constraintModifyOperationQueue", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
}

- (void)onMessageUpdateConstraints:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDAccessorySettingsController *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDAccessorySettingsController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingsController *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAccessorySettingsController *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  HMDAccessorySettingsController *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  _QWORD v46[4];
  void (**v47)(id, uint64_t);
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v23;
      v55 = 2112;
      v56 = v9;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v11, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("root.mobileTimer.alarms"));

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v18;
      v55 = 2112;
      v56 = v12;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update constraints on atomic setting %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v24 = (void *)v19;
    v10[2](v10, v19);
    goto LABEL_31;
  }
  -[HMDAccessorySettingsController ownerController](self, "ownerController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for updating constraint.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }
  if (-[HMDAccessorySettingsController isProxy](self, "isProxy"))
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v32;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to remove constraints.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, (uint64_t)v33);
  }
  else
  {
    objc_msgSend(v12, "modelsForConstraintsUpdate:", v8);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating constraints", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      -[HMDAccessorySettingsController dataSource](v35, "dataSource");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "backingStore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "transaction:options:", CFSTR("Update Constraints"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v33 = v33;
      v42 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v49 != v44)
              objc_enumerationMutation(v33);
            objc_msgSend(v41, "add:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
          }
          v43 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v43);
      }

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __80__HMDAccessorySettingsController_onMessageUpdateConstraints_keyPath_completion___block_invoke;
      v46[3] = &unk_1E89C1A48;
      v47 = v10;
      objc_msgSend(v41, "run:", v46);

    }
    else
    {
      v10[2](v10, 0);
    }
  }

LABEL_31:
}

- (void)_cacheConstraintAdditions:(id)a3 removals:(id)a4 setting:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessorySettingsController *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@%@ caching additions %@, removals %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10, "addConstraintsInMemory:", v8);
  objc_msgSend(v10, "removeConstraintsInMemory:", v9);

}

- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 settingIdentifier:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a7;
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v15);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "keyPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController onMessageReplaceConstraintsWithAdditions:constraintIdsToRemove:keyPath:senderProductClass:isRemote:completion:](self, "onMessageReplaceConstraintsWithAdditions:constraintIdsToRemove:keyPath:senderProductClass:isRemote:completion:", v17, v16, v20, a6, v8, v14);

}

- (void)onMessageReplaceConstraintsWithAdditions:(id)a3 constraintIdsToRemove:(id)a4 keyPath:(id)a5 senderProductClass:(int64_t)a6 isRemote:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAccessorySettingsController *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  HMDAccessorySettingsController *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  HMDAccessorySettingsController *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDAccessorySettingsController *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HMDAccessorySettingsController *v56;
  NSObject *v57;
  void *v58;
  const char *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDAccessorySettingsController *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  void (**v78)(_QWORD, _QWORD);
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  void (**v83)(_QWORD, _QWORD);
  _QWORD block[5];
  id v85;
  id v86;
  id v87;
  void (**v88)(_QWORD, _QWORD);
  int64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];
  uint64_t v103;

  v9 = a7;
  v73 = a6;
  v103 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v77 = v15;
    v78 = (void (**)(_QWORD, _QWORD))v16;
    v76 = v13;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v75 = v14;
    v20 = v14;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v91;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v91 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v18, "constraintWithIdentifier:", v25, v73);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            if (!-[HMDAccessorySettingsController isProxy](self, "isProxy")
              && (-[HMDAccessorySettingsController ownerController](self, "ownerController"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  v27,
                  !v27)
              || (objc_msgSend(v18, "inMemoryConstraintWithIdentifier:", v25),
                  (v26 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v42 = (void *)MEMORY[0x1D17BA0A0]();
              v43 = self;
              HMFGetOSLogHandle();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "constraints");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "constraintsForCodingXPC");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v95 = v45;
                v96 = 2112;
                v97 = v25;
                v98 = 2112;
                v99 = v46;
                v100 = 2112;
                v101 = v47;
                _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find constraint identifier: %@, currentConstraints: %@, allConstraints: %@", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v42);
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraint not found"), CFSTR("Failed to find constraint"), 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v78;
              ((void (**)(_QWORD, void *))v78)[2](v78, v48);

              v34 = v76;
              goto LABEL_37;
            }
          }
          objc_msgSend(v19, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        if (v22)
          continue;
        break;
      }
    }

    -[HMDAccessorySettingsController ownerController](self, "ownerController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v18, "keyPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "settingForKeyPath:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v76;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v95 = v35;
          v96 = 2112;
          v97 = v18;
          v98 = 2112;
          v99 = v28;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarding replace constraints for %@ to owner controller. %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(v28, "workQueue");
        v36 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke;
        block[3] = &unk_1E89B9B18;
        block[4] = v32;
        v85 = v76;
        v86 = v19;
        v87 = v18;
        v89 = v73;
        v16 = v78;
        v88 = v78;
        dispatch_async(v36, block);

        goto LABEL_36;
      }
    }
    v34 = v76;
    v16 = v78;
    if (-[HMDAccessorySettingsController isProxy](self, "isProxy", v73))
    {
      if (v74 != 6)
      {
        -[HMDAccessorySettingsController messageHandler](self, "messageHandler");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingsController delegate](self, "delegate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "remoteMessageDestinationForAccessorySettingsController:target:", self, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_117;
        v79[3] = &unk_1E89BDE38;
        v79[4] = self;
        v80 = v76;
        v81 = v19;
        v82 = v18;
        v83 = v78;
        objc_msgSend(v60, "relayReplaceConstraints:constraintIdsToRemove:keyPath:destination:completion:", v80, v20, v77, v63, v79);

        v16 = v78;
        v20 = v28;
        goto LABEL_37;
      }
      v49 = (void *)MEMORY[0x1D17BA0A0]();
      v50 = self;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v52;
        v96 = 2112;
        v97 = v77;
        _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay constraint replacement(%@) to a second AudioAccessory", buf, 0x16u);

        v16 = v78;
      }

      objc_autoreleasePoolPop(v49);
      -[HMDAccessorySettingsController factory](v50, "factory");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "assertWithCondition:message:", 0, CFSTR("Cannot reforward settings constraint replacement to a second homepod"));

      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Cannot relay to an AudioAccessory multiple times"), CFSTR("Failed to handle relay."), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v54);
      goto LABEL_35;
    }
    if (!v9
      || !objc_msgSend(v77, "isEqualToString:", CFSTR("root.general.profiles.managedConfigurationProfiles")))
    {
      objc_msgSend(v19, "allObjects");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingsController _replaceConstraintsOnSetting:additions:removals:completion:](self, "_replaceConstraintsOnSetting:additions:removals:completion:", v18, v76, v54, v78);
LABEL_35:

LABEL_36:
      v20 = v28;
LABEL_37:
      v14 = v75;
LABEL_38:

      v15 = v77;
      goto LABEL_39;
    }
    v20 = v28;
    v14 = v75;
    if (objc_msgSend(v76, "count"))
    {
      v55 = (void *)MEMORY[0x1D17BA0A0]();
      v56 = self;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_48:

        objc_autoreleasePoolPop(v55);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v16 + 2))(v16, v72);

        goto LABEL_38;
      }
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v95 = v58;
      v96 = 2112;
      v97 = v76;
      v59 = "%{public}@Add managed configuration profile via replace constraint not supported: %@";
    }
    else
    {
      if (objc_msgSend(v19, "count") == 1)
      {
        objc_msgSend(v19, "allObjects");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "firstObject");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = (void *)MEMORY[0x1D17BA0A0]();
        v67 = self;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v69;
          v96 = 2112;
          v97 = v65;
          _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile for constraint: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v66);
        objc_msgSend(v65, "value");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "value");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingsController _removeManagedConfigurationProfile:completion:](v67, "_removeManagedConfigurationProfile:completion:", v71, v78);

        v16 = v78;
        goto LABEL_38;
      }
      v55 = (void *)MEMORY[0x1D17BA0A0]();
      v56 = self;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v95 = v58;
      v96 = 2112;
      v97 = v19;
      v59 = "%{public}@Only one profile can be removed: %@";
    }
    _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, v59, buf, 0x16u);

    v16 = v78;
    goto LABEL_48;
  }
  v34 = v13;
  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = v16;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v95 = v41;
    v96 = 2112;
    v97 = v15;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    v16 = v40;
  }

  objc_autoreleasePoolPop(v37);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v16 + 2))(v16, v19);
LABEL_39:

}

- (void)_replaceConstraintsOnSetting:(id)a3 additions:(id)a4 removals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAccessorySettingsController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsController *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  HMDAccessorySettingsController *v26;
  uint64_t v27;
  void *v28;
  HMDAccessorySettingConstraintModel *v29;
  uint64_t v30;
  void *v31;
  HMDAccessorySettingConstraintModel *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  HMDAccessorySettingsController *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDAccessorySettingsController *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  const __CFString *v74;
  void *v75;
  HMDAccessorySettingsController *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id obj;
  uint64_t v85;
  id v86;
  void *v87;
  _QWORD v88[5];
  id v89;
  id v90;
  id v91;
  id v92;
  __int128 v93;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v81 = a6;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v114 = v18;
    v115 = 2112;
    v116 = v12;
    v117 = 2112;
    v118 = v11;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing constraints, %@, with constraint, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v16;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v22;
    v115 = 2112;
    v116 = v12;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Removing constraints: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  obj = v23;
  if (v24)
  {
    v25 = v24;
    v85 = *(_QWORD *)v106;
    v82 = v11;
LABEL_7:
    v26 = v20;
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v106 != v85)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v27);
      v29 = [HMDAccessorySettingConstraintModel alloc];
      objc_msgSend(v28, "identifier");
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v29, "initWithObjectChangeType:uuid:parentUUID:", 3, v30, v31);

      objc_msgSend(v10, "constraints");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = objc_msgSend(v33, "containsObject:", v28);

      if ((v30 & 1) == 0)
        break;
      -[HMDAccessorySettingsController constraintItemsMarkedForRemoval](v26, "constraintItemsMarkedForRemoval");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "containsObject:", v35);

      if (v36)
      {
        v75 = (void *)MEMORY[0x1D17BA0A0]();
        v76 = v26;
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v114 = v78;
          v115 = 2112;
          v116 = v28;
          _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_ERROR, "%{public}@Constraint has already been removed %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v75);
        v72 = (void *)MEMORY[0x1E0CB35C8];
        v73 = CFSTR("Constraint already removed");
        v74 = CFSTR("A constraint is already marked for removal");
LABEL_45:
        objc_msgSend(v72, "hmErrorWithCode:description:reason:suggestion:", 2, v73, v74, 0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v81;
        v11 = v82;
        (*((void (**)(id, void *))v81 + 2))(v81, v79);

        v80 = obj;
        goto LABEL_48;
      }
      objc_msgSend(v28, "value");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addObject:", v37);

      objc_msgSend(v14, "addObject:", v32);
      if (v25 == ++v27)
      {
        v23 = obj;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
        v11 = v82;
        v20 = v26;
        if (v25)
          goto LABEL_7;
        goto LABEL_14;
      }
    }
    v68 = (void *)MEMORY[0x1D17BA0A0]();
    v69 = v26;
    HMFGetOSLogHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v114 = v71;
      _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, "%{public}@Didn't find same number of constraints to remove", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v68);
    v72 = (void *)MEMORY[0x1E0CB35C8];
    v73 = CFSTR("Constraints don't match");
    v74 = CFSTR("Didn't find same number of constraints to remove");
    goto LABEL_45;
  }
LABEL_14:

  v38 = (void *)MEMORY[0x1D17BA0A0]();
  v39 = v20;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v41;
    v115 = 2112;
    v116 = v11;
    _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@Adding constraints: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v38);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v42 = v11;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v102;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v102 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v46);
        objc_msgSend(v10, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "modelWithParentIdentifier:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "setObjectChangeType:", 1);
        objc_msgSend(v14, "addObject:", v49);

        ++v46;
      }
      while (v44 != v46);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    }
    while (v44);
  }

  if (objc_msgSend(v14, "count"))
  {
    v83 = v11;
    v86 = v10;
    -[HMDAccessorySettingsController dataSource](v39, "dataSource");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "backingStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "transaction:options:", CFSTR("Replace Constraints"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v54 = v14;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v98;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v98 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(v53, "add:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * v58++));
        }
        while (v56 != v58);
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
      }
      while (v56);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v59 = obj;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v94;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v94 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v63);
          -[HMDAccessorySettingsController constraintItemsMarkedForRemoval](v39, "constraintItemsMarkedForRemoval");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "identifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v66);

          ++v63;
        }
        while (v61 != v63);
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
      }
      while (v61);
    }

    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke;
    v88[3] = &unk_1E89BDE38;
    v88[4] = v39;
    v89 = v87;
    v90 = v59;
    v91 = v42;
    v67 = v81;
    v92 = v81;
    objc_msgSend(v53, "run:", v88);

    v10 = v86;
    v11 = v83;
  }
  else
  {
    v67 = v81;
    (*((void (**)(id, _QWORD))v81 + 2))(v81, 0);
  }
  v80 = obj;
LABEL_48:

}

- (void)_replaceConstraintsOnMessageToChildWithAdditions:(id)a3 removedChildConstraints:(id)a4 settingKeyPath:(id)a5 senderProductClass:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDAccessorySettingsController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDAccessorySettingsController *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDAccessorySettingsController *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDAccessorySettingsController *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int64_t v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *))a7;
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v53 = a6;
    v54 = v14;
    v56 = v12;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v55 = v13;
    v18 = v13;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v58;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v58 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v16, "counterpartConstraintFor:", v23, v53);
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            v34 = (void *)MEMORY[0x1D17BA0A0]();
            v35 = self;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v63 = v37;
              v64 = 2112;
              v65 = v23;
              _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find constraints to remove in Owner Controller %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v34);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraint not found in owner controller"), CFSTR("Did not find constraint in owner controller"), 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v15[2](v15, v38);

            v26 = v18;
            v12 = v56;
            goto LABEL_26;
          }
          v25 = (void *)v24;
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        if (v20)
          continue;
        break;
      }
    }

    v12 = v56;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v56, 1);
    v27 = objc_msgSend(v17, "count");
    if (v27 == objc_msgSend(v18, "count"))
    {
      if (-[HMDAccessorySettingsController isProxy](self, "isProxy"))
      {
        if (v53 != 6)
        {
          objc_msgSend(v17, "na_map:", &__block_literal_global_138_147620);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessorySettingsController messageHandler](self, "messageHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessorySettingsController delegate](self, "delegate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "remoteMessageDestinationForAccessorySettingsController:target:", self, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "relayReplaceConstraints:constraintIdsToRemove:keyPath:destination:completion:", v26, v48, v54, v52, v15);

          v12 = v56;
          v14 = v54;

          v13 = v55;
          goto LABEL_28;
        }
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = self;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        v13 = v55;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v63 = v31;
          v64 = 2112;
          v65 = v16;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay constraint replacement to child for setting(%@) to a second AudioAccessory", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        -[HMDAccessorySettingsController factory](v29, "factory");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "assertWithCondition:message:", 0, CFSTR("Cannot reforward settings constraint replacement for child to a second homepod"));

        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Cannot relay to an AudioAccessory multiple times"), CFSTR("Failed to handle relay."), 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, v33);

LABEL_27:
        v14 = v54;
LABEL_28:

        goto LABEL_29;
      }
      -[HMDAccessorySettingsController _replaceConstraintsOnSetting:additions:removals:completion:](self, "_replaceConstraintsOnSetting:additions:removals:completion:", v16, v26, v17, v15);
    }
    else
    {
      v43 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v46;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find same number of constraints to remove", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Constraints don't match"), CFSTR("Didn't find same number of constraints to remove in media system"), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v47);

    }
LABEL_26:
    v13 = v55;
    goto LABEL_27;
  }
  v39 = (void *)MEMORY[0x1D17BA0A0]();
  v40 = self;
  HMFGetOSLogHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v42;
    v64 = 2112;
    v65 = v14;
    _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for keyPath %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v39);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v17);
LABEL_29:

}

- (BOOL)canUser:(id)a3 editConstraintsForSettingWithKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  HMDAccessorySettingsController *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (self)
    {
      if (objc_msgSend(v8, "isCollectionType"))
        v10 = 4;
      else
        v10 = 3;
    }
    else
    {
      v10 = 3;
    }
    v11 = HMDUserPrivilegeCompare(objc_msgSend(v6, "privilege"), v10) != -1;
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@User %@ cannot edit accessory setting at key path %@ because it does not exist.", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

- (HMDHome)home
{
  void *v2;
  void *v3;

  -[HMDAccessorySettingsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHome *)v3;
}

- (void)_removeManagedConfigurationProfile:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  HMDAccessorySettingsController *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void *, void *);
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMDAccessorySettingsController dataSource](self, "dataSource");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v8, "removeManagedConfigurationProfileWithProfileData:completion:", v6, v7);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v19;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil datasource.", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      v20 = (void (**)(void *, void *))_Block_copy(v7);
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2](v20, v21);

      }
      v8 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Managed configuration profile data is nil", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v8 = (void (**)(_QWORD, _QWORD))_Block_copy(v7);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v18);

    }
  }

}

- (void)handleUpdatedGroupModel:(id)a3 completion:(id)a4
{
  HMDAccessorySettingGroup *v6;
  void (**v7)(id, void *);
  HMDAccessorySettingGroup *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDAccessorySettingsController *v14;
  NSObject *v15;
  void *v16;
  HMDAccessorySettingGroup *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  HMDAccessorySettingGroup *v27;
  void *v28;
  HMDAccessorySettingsController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDAccessorySettingsController *v35;
  NSObject *v36;
  void *v37;
  HMDAccessorySettingGroup *v38;
  int v39;
  void *v40;
  __int16 v41;
  HMDAccessorySettingGroup *v42;
  __int16 v43;
  HMDAccessorySettingGroup *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (HMDAccessorySettingGroup *)a3;
  v7 = (void (**)(id, void *))a4;
  v8 = -[HMDAccessorySettingGroup initWithModel:]([HMDAccessorySettingGroup alloc], "initWithModel:", v6);
  v9 = -[HMDAccessorySettingGroup setDataSource:](v8, "setDataSource:", self);
  if (!v8)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0](v9);
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v22;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode group from model %@", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 3;
    goto LABEL_20;
  }
  -[HMDAccessorySettingGroup parentUUID](v6, "parentUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController parentUUID](self, "parentUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hmf_isEqualToUUID:", v11);

  if (!v12)
  {
    -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingGroup parentUUID](v6, "parentUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", v26);
    v27 = (HMDAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessorySettingGroup addGroup:](v27, "addGroup:", v8));
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543874;
        v40 = v31;
        v41 = 2112;
        v42 = v8;
        v43 = 2112;
        v44 = v27;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Added group %@ to %@", (uint8_t *)&v39, 0x20u);

      }
      objc_autoreleasePoolPop(v28);

      goto LABEL_15;
    }
    v34 = (void *)MEMORY[0x1D17BA0A0]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingGroup parentUUID](v6, "parentUUID");
      v38 = (HMDAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
      v39 = 138543874;
      v40 = v37;
      v41 = 2112;
      v42 = v38;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Parent group %@ to add group %@ not found", (uint8_t *)&v39, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = 2;
LABEL_20:
    objc_msgSend(v23, "hmErrorWithCode:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v33);
    goto LABEL_21;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingGroup uuid](v6, "uuid");
    v17 = (HMDAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
    v39 = 138543874;
    v40 = v16;
    v41 = 2112;
    v42 = v6;
    v43 = 2112;
    v44 = v17;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Assigning root group from transaction model: %@ id: %@.", (uint8_t *)&v39, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDAccessorySettingsController home](v14, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "isOwnerUser");

  -[HMDAccessorySettingsController setRootGroup:](v14, "setRootGroup:", v8);
  if (-[HMDAccessorySettingsController hasCreatedUnprocessedRootGroup](v14, "hasCreatedUnprocessedRootGroup"))
    -[HMDAccessorySettingsController scheduleAuditWithReason:from:](v14, "scheduleAuditWithReason:from:", 4, v14);
  -[HMDAccessorySettingsController setHasCreatedUnprocessedRootGroup:](v14, "setHasCreatedUnprocessedRootGroup:", 0);
LABEL_15:
  -[HMDAccessorySettingsController settingsHierarchyDidChange](self, "settingsHierarchyDidChange");
  v7[2](v7, 0);
  -[HMDAccessorySettingsController ownerController](self, "ownerController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    objc_msgSend(v32, "scheduleAuditWithReason:from:", 4, self);
LABEL_21:

}

- (void)handleRemovedGroupModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDAccessorySettingsController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "keyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqualToString:", v16);

    if (v17)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySettingsController rootGroup](v19, "rootGroup");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v21;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Root group model %@ was removed %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDAccessorySettingsController setRootGroup:](v19, "setRootGroup:", 0);
    }
    else
    {
      objc_msgSend(v13, "removeGroup:", v10);
    }
    -[HMDAccessorySettingsController settingsHierarchyDidChange](self, "settingsHierarchyDidChange");
    v7[2](v7, 0);
    -[HMDAccessorySettingsController ownerController](self, "ownerController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      objc_msgSend(v24, "scheduleAuditWithReason:from:", 5, self);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v23);

  }
}

- (void)handleUpdatedSettingModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, void *, void *);
  void *v16;
  HMDAccessorySettingsController *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __71__HMDAccessorySettingsController_handleUpdatedSettingModel_completion___block_invoke;
  v16 = &unk_1E89B9BF8;
  v17 = self;
  v18 = v6;
  v11 = v6;
  v12 = _Block_copy(&v13);
  if (v10)
    -[HMDAccessorySettingsController updatedSetting:model:completion:](self, "updatedSetting:model:completion:", v10, v7, v12, v13, v14, v15, v16, v17, v18);
  else
    -[HMDAccessorySettingsController addedSettingModel:completion:](self, "addedSettingModel:completion:", v7, v12, v13, v14, v15, v16, v17, v18);

}

- (void)updatedSetting:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD, id);
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
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
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD, id))a5;
  objc_msgSend(v9, "configurationVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12
    && (v13 = objc_msgSend(v8, "configurationVersion"), objc_msgSend(v8, "setConfigurationVersion:", v12), v12 >= v13)
    && (objc_msgSend(v9, "value"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    v15 = (void *)MEMORY[0x1E0CB3710];
    +[HMDAccessorySetting supportedValueClasses](HMDAccessorySetting, "supportedValueClasses");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v15, "unarchivedObjectOfClasses:fromData:error:", v16, v17, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;

    if (v18)
    {
      v33 = v19;
      objc_msgSend(v9, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      v23 = 0;
      if ((v22 & 1) != 0 || v12 <= v13)
      {
        v19 = v33;
      }
      else
      {
        objc_msgSend(v8, "setValue:", v18);

        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v8;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v27;
          v37 = 2112;
          v38 = v25;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Setting changed %@ value", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        -[HMDAccessorySettingsController didChangeSetting:](self, "didChangeSetting:", v25);
        objc_msgSend(v25, "value");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[HMDAccessorySettingsController messageHandler](self, "messageHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "keyPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "notifyOfUpdatedValue:settingKeyPath:", v19, v28);

        v23 = 1;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v8;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v32;
        v37 = 2112;
        v38 = v19;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting supported value from model's value: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v18 = 0;
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }
  v10[2](v10, v23, 0, v8);

}

- (void)addedSettingModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD, HMDAccessorySetting *);
  HMDAccessorySetting *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  HMDAccessorySetting *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD, HMDAccessorySetting *))a4;
  v8 = -[HMDAccessorySetting initWithModel:]([HMDAccessorySetting alloc], "initWithModel:", v6);
  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "addSetting:", v8);
    -[HMDAccessorySettingsController settingsHierarchyDidChange](self, "settingsHierarchyDidChange");
    v7[2](v7, 1, 0, v8);
    -[HMDAccessorySettingsController ownerController](self, "ownerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      if (!-[HMDAccessorySettingsController hasDependants](self, "hasDependants"))
      {
LABEL_10:

        goto LABEL_11;
      }
      v12 = self;
    }
    objc_msgSend(v12, "scheduleAuditWithReason:from:", 2, self);
    goto LABEL_10;
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Parent group %@ to add setting %@ not found", (uint8_t *)&v20, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *, HMDAccessorySetting *))v7)[2](v7, 1, v19, 0);

LABEL_11:
}

- (void)handleRemovedSettingModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingsController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessorySettingsController groupsMap](self, "groupsMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v13, "removeSetting:", v10);
    -[HMDAccessorySettingsController settingsHierarchyDidChange](self, "settingsHierarchyDidChange");
    v7[2](v7, 0);
    -[HMDAccessorySettingsController ownerController](self, "ownerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "scheduleAuditWithReason:from:", 3, self);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting with id %@ not found", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v21);

  }
}

- (void)handleUpdatedSettingConstraintModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  char v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2C0]), "initWithModel:", v6);
    if (v11)
    {
      objc_msgSend(v10, "constraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v11);

      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v10;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v13 & 1) != 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v18;
          v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Constraint already exists and is not mutable: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v25;
          v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Added accessory settings constraint: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v15;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = v13;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v36 = v26;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v29;
          v39 = 2112;
          v40 = v30;
          v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Added accessory settings constraint: %@, setting: %@", buf, 0x20u);

          v26 = v36;
          v13 = v35;
        }

        objc_autoreleasePoolPop(v26);
        objc_msgSend(v27, "addConstraint:", v11);
        -[HMDAccessorySettingsController didUpdateSettingConstraints:](self, "didUpdateSettingConstraints:", v27);
      }
      v7[2](v7, 0);
      -[HMDAccessorySettingsController ownerController](self, "ownerController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
        v34 = v13;
      else
        v34 = 1;
      if ((v34 & 1) == 0)
        objc_msgSend(v32, "scheduleAuditWithReason:from:", 6, self);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v24);

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting %@ to add constraint %@ not found", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v11);
  }

}

- (void)handleRemovedSettingConstraintModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessorySettingsController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMDAccessorySettingsController settingsMap](self, "settingsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v10;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v17;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v14;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed constraint: %@ from setting: %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v14, "removeConstraint:", v12);
      -[HMDAccessorySettingsController didUpdateSettingConstraints:](self, "didUpdateSettingConstraints:", v14);
      v7[2](v7, 0);
      -[HMDAccessorySettingsController ownerController](self, "ownerController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "scheduleAuditWithReason:from:", 7, self);

    }
    else
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v25;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = v14;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Constraint already removed: %@ from setting: %@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      v7[2](v7, 0);
      v12 = 0;
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v23;
      v28 = 2112;
      v29 = v24;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Setting %@ to remove constraint %@ not found", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v12);
  }

}

- (void)handleLanguageChangeTimerFired
{
  void *v3;
  HMDAccessorySettingsController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Accessory settings language change timer did fire, notifying delegate", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccessorySettingsController delegate](v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languagesChangedForAccessorySettingsController:", v4);

}

- (void)_didAddGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *allChildrenIdentifiers;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  objc_msgSend(v5, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](allChildrenIdentifiers, "addObject:", v7);
}

- (void)_didRemoveGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *allChildrenIdentifiers;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  objc_msgSend(v5, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeObject:](allChildrenIdentifiers, "removeObject:", v7);
}

- (void)_didAddSetting:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *allChildrenIdentifiers;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  objc_msgSend(v5, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](allChildrenIdentifiers, "addObject:", v7);
}

- (void)_didRemoveSetting:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *allChildrenIdentifiers;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  allChildrenIdentifiers = self->_allChildrenIdentifiers;
  objc_msgSend(v5, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray removeObject:](allChildrenIdentifiers, "removeObject:", v7);
}

- (void)didChangeSetting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner"))
  {
    -[HMDAccessorySettingsController scheduleDependantFixup](self, "scheduleDependantFixup");
    objc_msgSend(v8, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDWHASettingEvent eventWithKeyPath:value:](HMDWHASettingEvent, "eventWithKeyPath:value:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessorySettingsController logEventSubmitter](self, "logEventSubmitter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitLogEvent:", v6);

  }
}

- (void)didUpdateSettingConstraints:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  HMDAccessorySettingsController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (-[HMDAccessorySettingsController isSettingOwner](self, "isSettingOwner")
    && -[HMDAccessorySettingsController hasDependants](self, "hasDependants"))
  {
    -[HMDAccessorySettingsController scheduleDependantFixup](self, "scheduleDependantFixup");
  }
  objc_msgSend(v11, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("root.siri.language"));

  if (self && v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory settings languages did change, resuming language change timer", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessorySettingsController languageChangeDebounceTimer](v7, "languageChangeDebounceTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

- (void)didChangeDependantSettings:(id)a3 ownerSettingsKeyPaths:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HMDAccessorySettingsController_didChangeDependantSettings_ownerSettingsKeyPaths___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)didBecomeIndependantOwner
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HMDAccessorySettingsController_didBecomeIndependantOwner__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (HMDAccessorySettingsController)initWithCoder:(id)a3
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController codingKey](self, "codingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (void)decodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessorySettingsController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  -[HMDAccessorySettingsController codingKey](self, "codingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessorySettingsController setNestedGroupsDataSourcesWithGroup:](self, "setNestedGroupsDataSourcesWithGroup:", v7));
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Assigning root group on decode. %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessorySettingsController setRootGroup:](v9, "setRootGroup:", v7);
  -[HMDAccessorySettingsController parentUUID](v9, "parentUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsController rootGroup](v9, "rootGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setParentIdentifier:", v12);

  -[HMDAccessorySettingsController settingsHierarchyDidChange](v9, "settingsHierarchyDidChange");
}

- (void)setNestedGroupsDataSourcesWithGroup:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__HMDAccessorySettingsController_setNestedGroupsDataSourcesWithGroup___block_invoke;
  v6[3] = &unk_1E89B9C20;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);

}

- (NSString)siriLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessorySettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessorySettingsController *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", CFSTR("root.siri.language"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "hmf_isEmpty"))
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse siri language componenets", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = 0;
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch siri language because the HMDAccessorySetting was nil", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return (NSString *)v14;
}

- (NSArray)childrenIdentifiers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_allChildrenIdentifiers, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4
{
  -[HMDAccessorySettingsController configureIsSettingOwner:home:legacySettingsAdaptor:](self, "configureIsSettingOwner:home:legacySettingsAdaptor:", a3, a4, 0);
}

- (void)configureIsSettingOwner:(BOOL)a3 home:(id)a4 legacySettingsAdaptor:(id)a5
{
  -[HMDAccessorySettingsController configureIsSettingOwner:migrationOwner:home:legacySettingsAdaptor:](self, "configureIsSettingOwner:migrationOwner:home:legacySettingsAdaptor:", a3, a3, a4, a5);
}

- (void)configureIsSettingOwner:(BOOL)a3 migrationOwner:(BOOL)a4 home:(id)a5 legacySettingsAdaptor:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  HMDAccessorySettingsController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v7 = a4;
  v8 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingsController rootGroup](v13, "rootGroup");
    v18 = v12;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v37 = v15;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v19;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring settingOwner: %@, migrationOwner: %@, rootGroup: %@", buf, 0x2Au);

    v12 = v18;
    v11 = v29;
  }

  objc_autoreleasePoolPop(v12);
  -[HMDAccessorySettingsController setIsSettingOwner:](v13, "setIsSettingOwner:", v8);
  -[HMDAccessorySettingsController setIsMigrationOwner:](v13, "setIsMigrationOwner:", v7);
  -[HMDAccessorySettingsController setLegacySettingsAdaptor:](v13, "setLegacySettingsAdaptor:", v11);
  objc_msgSend(v11, "setDelegate:", v13);
  if (v7)
  {
    -[HMDAccessorySettingsController workQueue](v13, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__HMDAccessorySettingsController_configureIsSettingOwner_migrationOwner_home_legacySettingsAdaptor___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v13;
    dispatch_async(v20, block);

  }
  else
  {
    -[HMDAccessorySettingsController rootGroup](v13, "rootGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDSettingAlgorithm allSettingsFromRootGroup:](HMDSettingAlgorithm, "allSettingsFromRootGroup:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (!objc_msgSend(v28, "type"))
            +[HMDAccessorySettingTransform changeAccessorySettingType:home:](HMDAccessorySettingTransform, "changeAccessorySettingType:home:", v28, v10);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v25);
    }

  }
}

- (id)modelObjectsForSettings
{
  void *v2;
  void *v3;

  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[HMDAccessorySettingTransform modelsForGroup:](HMDAccessorySettingTransform, "modelsForGroup:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (void)addDependant:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HMDAccessorySettingsController_addDependant___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeDependant:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDAccessorySettingsController_removeDependant___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeAllDependants
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDAccessorySettingsController_removeAllDependants__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)auditOnFirstFetch
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessorySettingsController ownerController](self, "ownerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HMDAccessorySettingsController workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMDAccessorySettingsController_auditOnFirstFetch__block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (void)updateSettingOwner:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HMDAccessorySettingsController_updateSettingOwner___block_invoke;
  v6[3] = &unk_1E89C2758;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__HMDAccessorySettingsController_didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)BOOLSettingForKeyPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingsController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMDAccessorySettingsController_BOOLSettingForKeyPath_completion___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 BOOLValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsController *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "keyPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2114;
        v28 = v18;
        v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting keyPath: %{public}@ on notification from adaptor to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __90__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_BOOLValue___block_invoke;
      v23[3] = &unk_1E89C1AF8;
      v23[4] = v15;
      v24 = v10;
      -[HMDAccessorySettingsController _runUpdateTransactionWithValue:setting:completion:](v15, "_runUpdateTransactionWithValue:setting:completion:", v11, v24, v23);

    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Did not find setting with keyPath: %{public}@ on update from fetched settings adaptor", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 numberValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  HMDAccessorySettingsController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingsController *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAccessorySettingsController *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessorySettingsController settingForKeyPath:](self, "settingForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CBA2D0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scaleDownNumberSettingValue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x1E0CBA2D0], "isKeyPathForTapAssistanceSelectionSettingType:", v9))
      {
        v18 = objc_msgSend(v17, "integerValue");
        objc_msgSend(MEMORY[0x1E0CBA2D0], "tapAssistanceSelectionItemWithIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyPath");
          v34 = v20;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v23;
          v41 = 2114;
          v42 = v24;
          v43 = 2114;
          v44 = v19;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@ to %{public}@", buf, 0x20u);

          v20 = v34;
        }

        objc_autoreleasePoolPop(v20);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke;
        v37[3] = &unk_1E89C1AF8;
        v37[4] = v21;
        v38 = v12;
        -[HMDAccessorySettingsController _runUpdateTransactionWithValue:setting:completion:](v21, "_runUpdateTransactionWithValue:setting:completion:", v19, v38, v37);

      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyPath");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v32;
          v41 = 2114;
          v42 = v33;
          v43 = 2114;
          v44 = v17;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting keyPath: %{public}@ on notification from adaptor to %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v29);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke_153;
        v35[3] = &unk_1E89C1AF8;
        v35[4] = v30;
        v36 = v12;
        -[HMDAccessorySettingsController _runUpdateTransactionWithValue:setting:completion:](v30, "_runUpdateTransactionWithValue:setting:completion:", v17, v36, v35);

      }
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v28;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Did not find setting with keyPath: %{public}@ on update from fetched settings adaptor", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)legacySettingsAdaptor:(id)a3 didLoadSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Did update setting from keyPath:%@ value = %@, availableLanguageList = %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDAccessorySettingsController legacySettingsAdaptor:didUpdateSettingKeyPath:selectedLanguageValue:availableLanguageList:](v15, "legacySettingsAdaptor:didUpdateSettingKeyPath:selectedLanguageValue:availableLanguageList:", v10, v11, v12, v13);

}

- (void)legacySettingsAdaptor:(id)a3 didUpdateSettingKeyPath:(id)a4 selectedLanguageValue:(id)a5 availableLanguageList:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Did update setting from keyPath:%@ value = %@, availableLanguageList = %@", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);

}

- (id)languageValueList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDAccessorySettingsController *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDAccessorySettingsController *v15;
  NSObject *v16;
  void *v17;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySettingsController rootGroup](self, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingWithKeyPath:", CFSTR("root.siri.language"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __51__HMDAccessorySettingsController_languageValueList__block_invoke;
      v19[3] = &unk_1E89B9C48;
      v19[4] = self;
      objc_msgSend(v8, "na_map:", v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v17;
        v22 = 2112;
        v23 = v5;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get language constraints from language setting: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

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
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get language setting from root group: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (HMDBackingStoreObjectProtocol)transactionReceiver
{
  return (HMDBackingStoreObjectProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessorySettingsControllerDependencyFactory)factory
{
  return (HMDAccessorySettingsControllerDependencyFactory *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableArray)allChildrenIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (HMDAccessorySettingsControllerDelegate)delegate
{
  return (HMDAccessorySettingsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)dependantControllers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (HMDAccessorySettingsController)ownerController
{
  return (HMDAccessorySettingsController *)objc_loadWeakRetained((id *)&self->_ownerController);
}

- (void)setOwnerController:(id)a3
{
  objc_storeWeak((id *)&self->_ownerController, a3);
}

- (BOOL)isMigrationOwner
{
  return self->_isMigrationOwner;
}

- (void)setIsMigrationOwner:(BOOL)a3
{
  self->_isMigrationOwner = a3;
}

- (HMFTimer)fixupSettingsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFixupSettingsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (HMFTimer)auditSettingsTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAuditSettingsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 136, 1);
}

- (NSMutableSet)constraintItemsMarkedForRemoval
{
  return self->_constraintItemsMarkedForRemoval;
}

- (void)setConstraintItemsMarkedForRemoval:(id)a3
{
  objc_storeStrong((id *)&self->_constraintItemsMarkedForRemoval, a3);
}

- (BOOL)didInitiateSettingsCreationForOlderSoftwareCounterpart
{
  return self->_didInitiateSettingsCreationForOlderSoftwareCounterpart;
}

- (void)setDidInitiateSettingsCreationForOlderSoftwareCounterpart:(BOOL)a3
{
  self->_didInitiateSettingsCreationForOlderSoftwareCounterpart = a3;
}

- (NSOperationQueue)constraintModifyOperationQueue
{
  return self->_constraintModifyOperationQueue;
}

- (void)setConstraintModifyOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_constraintModifyOperationQueue, a3);
}

- (HMFTimer)languageChangeDebounceTimer
{
  return self->_languageChangeDebounceTimer;
}

- (void)setLanguageChangeDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_languageChangeDebounceTimer, a3);
}

- (HMDLegacyAccessorySettingsAdaptor)legacySettingsAdaptor
{
  return self->_legacySettingsAdaptor;
}

- (void)setLegacySettingsAdaptor:(id)a3
{
  objc_storeStrong((id *)&self->_legacySettingsAdaptor, a3);
}

- (HMDAccessorySettingsControllerDataSource)dataSource
{
  return (HMDAccessorySettingsControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (HMDAccessorySettingsMessageHandler)messageHandler
{
  return (HMDAccessorySettingsMessageHandler *)objc_getProperty(self, a2, 192, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_legacySettingsAdaptor, 0);
  objc_storeStrong((id *)&self->_languageChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_constraintModifyOperationQueue, 0);
  objc_storeStrong((id *)&self->_constraintItemsMarkedForRemoval, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_auditSettingsTimer, 0);
  objc_storeStrong((id *)&self->_fixupSettingsTimer, 0);
  objc_destroyWeak((id *)&self->_ownerController);
  objc_storeStrong((id *)&self->_dependantControllers, 0);
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allChildrenIdentifiers, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_transactionReceiver, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

id __51__HMDAccessorySettingsController_languageValueList__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") > 2)
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      if ((unint64_t)objc_msgSend(v8, "count") >= 5)
      {
        objc_msgSend(v8, "objectAtIndex:", 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA810]), "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v18, v19, v20, v21);

    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v12;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get expected language code count from legacy language setting encoding: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v13 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v3;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get legacy langage setting encoding from language constaint: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

void __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@ with error %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

void __92__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_numberValue___block_invoke_153(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __90__HMDAccessorySettingsController_legacySettingsAdaptor_didUpdateSettingKeyPath_BOOLValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updated setting keyPath: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __67__HMDAccessorySettingsController_BOOLSettingForKeyPath_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "settingForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2 && objc_msgSend(v2, "type") == 2)
  {
    objc_msgSend(v6, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "BOOLValue");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __92__HMDAccessorySettingsController_didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isMigrationOwner") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "rootGroup");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "didInitiateSettingsCreationForOlderSoftwareCounterpart");
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138543362;
          v11 = v8;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Already initiated settings creation for older software counterpart. Will not attempt again", (uint8_t *)&v10, 0xCu);

        }
        objc_autoreleasePoolPop(v4);
      }
      else
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138543362;
          v11 = v9;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Detected no settings with older software counterpart. Will create settings.", (uint8_t *)&v10, 0xCu);

        }
        objc_autoreleasePoolPop(v4);
        objc_msgSend(*(id *)(a1 + 32), "_createSettings");
        objc_msgSend(*(id *)(a1 + 32), "setDidInitiateSettingsCreationForOlderSoftwareCounterpart:", 1);
      }
    }
  }
}

uint64_t __53__HMDAccessorySettingsController_updateSettingOwner___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isSettingOwner");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)result)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Updating setting owner to %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "setIsSettingOwner:", *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __51__HMDAccessorySettingsController_auditOnFirstFetch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleAuditWithReason:", 1);
}

void __53__HMDAccessorySettingsController_removeAllDependants__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dependantControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_removeDependant:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __50__HMDAccessorySettingsController_removeDependant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeDependant:", *(_QWORD *)(a1 + 40));
}

void __47__HMDAccessorySettingsController_addDependant___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dependantControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "scheduleDependantFixup");
  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(v5 + 8);
  objc_msgSend(v3, "_keyPathsForSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didChangeDependantSettings:ownerSettingsKeyPaths:", v3, v6);

}

uint64_t __100__HMDAccessorySettingsController_configureIsSettingOwner_migrationOwner_home_legacySettingsAdaptor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_migrateSettingsWithCompletion:", 0);
  else
    return objc_msgSend(v3, "_createSettings");
}

uint64_t __70__HMDAccessorySettingsController_setNestedGroupsDataSourcesWithGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNestedGroupsDataSourcesWithGroup:", a2);
}

void __59__HMDAccessorySettingsController_didBecomeIndependantOwner__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setOwnerController:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "settingsMap", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "settingsMap");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setReflected:", 0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessorySettingsController:saveWithReason:", *(_QWORD *)(a1 + 32), CFSTR("Parent for reflected settings removed"));

}

void __83__HMDAccessorySettingsController_didChangeDependantSettings_ownerSettingsKeyPaths___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
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
  v2 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setOwnerController:", *(_QWORD *)(a1 + 40)));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_keyPathsForSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Evaluating dependents from %@ to current %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = *(id *)(a1 + 48);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v9)
    goto LABEL_17;
  v11 = v9;
  v12 = 0;
  v13 = *(_QWORD *)v23;
  *(_QWORD *)&v10 = 138543618;
  v21 = v10;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v23 != v13)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(a1 + 32), "settingForKeyPath:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v21, (_QWORD)v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isReflected") & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v28 = v20;
          v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Setting %@ became reflected", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v12 = 1;
        objc_msgSend(v16, "setReflected:", 1);
      }

    }
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v11);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessorySettingsController:saveWithReason:", *(_QWORD *)(a1 + 32), CFSTR("Dependent reflected settings changed"));
LABEL_17:

  }
}

void __71__HMDAccessorySettingsController_handleUpdatedSettingModel_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      objc_msgSend(v8, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = CFSTR("HMDAccessorySettingsControllerSettingsUpdateNotificationSettingValueCodingKey");
        v15[1] = CFSTR("HMDAccessorySettingsControllerSettingsUpdateNotification");
        v16[0] = v9;
        objc_msgSend(v9, "keyPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HMDAccessorySettingsControllerSettingsUpdateNotification"), v12, v14);

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __152__HMDAccessorySettingsController__replaceConstraintsOnMessageToChildWithAdditions_removedChildConstraints_settingKeyPath_senderProductClass_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke_2;
  v8[3] = &unk_1E89C0790;
  v5 = a1[5];
  v6 = a1[4];
  v9 = v5;
  v10 = v6;
  v11 = v3;
  v12 = a1[6];
  v13 = a1[7];
  v14 = a1[8];
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __93__HMDAccessorySettingsController__replaceConstraintsOnSetting_additions_removals_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "constraintItemsMarkedForRemoval", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v4);
  }

  if (!*(_QWORD *)(a1 + 48))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully replaced %@ constraints with %@ constraints.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "ownerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_2;
  v7[3] = &unk_1E89C1558;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_replaceConstraintsOnMessageToChildWithAdditions:removedChildConstraints:settingKeyPath:senderProductClass:completion:", v3, v4, v5, v6, v7);

}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_117(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (!v6)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cacheConstraintAdditions:removals:setting:", v4, v5, *(_QWORD *)(a1 + 56));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __144__HMDAccessorySettingsController_onMessageReplaceConstraintsWithAdditions_constraintIdsToRemove_keyPath_senderProductClass_isRemote_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Got response from owner failing current %@.", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

uint64_t __80__HMDAccessorySettingsController_onMessageUpdateConstraints_keyPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  HMDAccessorySettingConstraintModel *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDAccessorySettingConstraintModel *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settingForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v47 = v6;
    v48 = 2112;
    v49 = v7;
    v50 = 2112;
    v51 = v2;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Executing remove constraint request %@ for setting %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if (!v2)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v47 = v19;
      v48 = 2112;
      v49 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v2, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("root.mobileTimer.alarms"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v13;
      v48 = 2112;
      v49 = v2;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove constraint on atomic setting %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = (void *)v15;
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
    goto LABEL_26;
  }
  objc_msgSend(*(id *)(a1 + 32), "ownerController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for removing constraint.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isProxy"))
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to remove constraints.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v30 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
    v31 = (HMDAccessorySettingConstraintModel *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, HMDAccessorySettingConstraintModel *))(v30 + 16))(v30, v31);
  }
  else
  {
    if (!objc_msgSend(v2, "canRemoveConstraint:", *(_QWORD *)(a1 + 48)))
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
      goto LABEL_26;
    }
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v47 = v35;
      v48 = 2112;
      v49 = v36;
      v50 = 2112;
      v51 = v2;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing constraint %@ from setting %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v32);
    v37 = [HMDAccessorySettingConstraintModel alloc];
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v37, "initWithObjectChangeType:uuid:parentUUID:", 3, v38, v39);

    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "backingStore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "transaction:options:", CFSTR("Remove Constraint"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "add:", v31);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_108;
    v44[3] = &unk_1E89C1A48;
    v45 = *(id *)(a1 + 56);
    objc_msgSend(v43, "run:", v44);

  }
LABEL_26:

}

uint64_t __79__HMDAccessorySettingsController_onMessageRemoveConstraint_keyPath_completion___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settingForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v53 = v6;
    v54 = 2112;
    v55 = v7;
    v56 = 2112;
    v57 = v2;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Executing add constraint request %@ for setting %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  if (!v2)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v53 = v19;
      v54 = 2112;
      v55 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v2, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("root.mobileTimer.alarms"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v13;
      v54 = 2112;
      v55 = v2;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot add constraint on atomic setting %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v21 = (void *)v15;
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
    goto LABEL_28;
  }
  objc_msgSend(*(id *)(a1 + 32), "ownerController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Ignoring owner controller for adding constraint.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isProxy"))
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Only the setting owner is allowed to add constraints.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v30 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v30 + 16))(v30, v31);
  }
  else
  {
    v32 = *(_QWORD *)(a1 + 48);
    v51 = 0;
    v33 = objc_msgSend(v2, "canAddConstraint:error:", v32, &v51);
    v31 = v51;
    v34 = (void *)MEMORY[0x1D17BA0A0]();
    v35 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if ((v33 & 1) != 0)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v53 = v38;
        v54 = 2112;
        v55 = v39;
        v56 = 2112;
        v57 = v2;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Adding constraint %@ on setting %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      v40 = *(void **)(a1 + 48);
      objc_msgSend(v2, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "modelWithParentIdentifier:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "setObjectChangeType:", 1);
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "backingStore");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "transaction:options:", CFSTR("Add Constraint"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "add:", v42);
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_104;
      v49[3] = &unk_1E89C1A48;
      v50 = *(id *)(a1 + 56);
      objc_msgSend(v46, "run:", v49);

    }
    else
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v53 = v47;
        v54 = 2112;
        v55 = v48;
        v56 = 2112;
        v57 = v2;
        v58 = 2112;
        v59 = v31;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Constraint %@ cannot be added to setting %@. error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v34);
      (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v31);
    }
  }

LABEL_28:
}

uint64_t __76__HMDAccessorySettingsController_onMessageAddConstraint_keyPath_completion___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__HMDAccessorySettingsController__runUpdateTransactionWithValue_setting_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[5] + 16))(a1[5], a1[4], a1[6], a2);
}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "keyPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_onMessageUpdateValue:settingKeyPath:senderVersion:senderProductClass:completion:", v3, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_94(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7;
  id v8;
  void (*v9)(void);
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "configurationVersion") >= a3)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(*(id *)(a1 + 32), "configurationVersion");
        v26 = 138543874;
        v27 = v21;
        v28 = 2048;
        v29 = a3;
        v30 = 2048;
        v31 = v22;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Not changing locally as the new config version isnt higher %tu (current %tu)", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HMFEqualObjects();

      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if ((v11 & 1) != 0)
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v16;
          v28 = 2112;
          v29 = (unint64_t)v17;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating the value from %@ as the new value is same", (uint8_t *)&v26, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
      }
      else
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543874;
          v27 = v23;
          v28 = 2112;
          v29 = (unint64_t)v24;
          v30 = 2112;
          v31 = (uint64_t)v7;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating the value locally from %@ to %@", (uint8_t *)&v26, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(*(id *)(a1 + 32), "setValue:", v7);
      }
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "accessorySettingsController:saveWithReason:", *(_QWORD *)(a1 + 40), CFSTR("Update value from remote"));

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v9();

}

void __102__HMDAccessorySettingsController__updateValue_forSetting_senderVersion_senderProductClass_completion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Adaptor update result keyPath:%{public}@ error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if (v3)
  {
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_runUpdateTransactionWithValue:setting:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }

}

void __58__HMDAccessorySettingsController_owner_didUpdateSettings___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  __int128 v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    *(_DWORD *)buf = 138543618;
    v51 = v5;
    v52 = 2112;
    v53 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Owner %@ sent fix settings request", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(a1[4], "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transaction:options:", CFSTR("fixupAccessorySetting"), v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = a1[6];
  v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v45)
  {
    v12 = 0;
    v44 = *(_QWORD *)v47;
    *(_QWORD *)&v11 = 138544130;
    v40 = v11;
    v42 = v10;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v47 != v44)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(a1[4], "settingForKeyPath:", v14, v40);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(a1[6], "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {

            v16 = 0;
          }
          objc_msgSend(v15, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = HMFEqualObjects();

          if ((v20 & 1) == 0)
          {
            v21 = (void *)MEMORY[0x1D17BA0A0]();
            v22 = a1[4];
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = v21;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = a1[5];
              objc_msgSend(v15, "value");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v51 = v24;
              v52 = 2112;
              v53 = v15;
              v54 = 2112;
              v55 = v25;
              v56 = 2112;
              v57 = v26;
              v58 = 2112;
              v59 = v16;
              _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Comparing between %@ and owner %@, Values are not matching: %@, %@", buf, 0x34u);

              v21 = v41;
            }

            objc_autoreleasePoolPop(v21);
            objc_msgSend(a1[4], "factory");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "parentIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "configurationVersion") + 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "settingModelForUpdateWithIdentifier:parent:value:configNumber:", v28, v29, v16, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "add:", v31);
            v12 = 1;
            v10 = v42;
          }
          if (objc_msgSend(v15, "isCollectionType"))
          {
            objc_msgSend(a1[5], "settingForKeyPath:", v14);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "constraints");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            +[HMDAccessorySettingTransform modelsForChangedConstraints:fromSetting:](HMDAccessorySettingTransform, "modelsForChangedConstraints:fromSetting:", v33, v15);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v34, "count"))
            {
              v35 = (void *)MEMORY[0x1D17BA0A0]();
              v36 = a1[4];
              HMFGetOSLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = a1[5];
                *(_DWORD *)buf = v40;
                v51 = v38;
                v52 = 2112;
                v53 = v34;
                v54 = 2112;
                v55 = v15;
                v56 = 2112;
                v57 = v39;
                _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Added constraints %@ in fixup %@ and owner %@.", buf, 0x2Au);

              }
              objc_autoreleasePoolPop(v35);
              objc_msgSend(v43, "addObjects:", v34);
              v12 = 1;
              v10 = v42;
            }

          }
        }

      }
      v45 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v45);

    if ((v12 & 1) != 0)
      objc_msgSend(v43, "run");
  }
  else
  {

  }
}

void __56__HMDAccessorySettingsController_scheduleDependantFixup__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dependantControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received request to fix settings for dependents: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "fixupSettingsTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@There is already an fix setting request in queue, kicking it again", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "fixupSettingsTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "kick");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "factory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timerWithReason:interval:", 2, 3.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFixupSettingsTimer:", v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "fixupSettingsTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v15);

    objc_msgSend(*(id *)(a1 + 32), "fixupSettingsTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");
  }

}

void __65__HMDAccessorySettingsController__migrateSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished migrating settings.", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);

}

void __49__HMDAccessorySettingsController__createSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  double v22;
  __uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  NSObject *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  double v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished creating settings.", (uint8_t *)&v34, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "setupActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("error.code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("domain");
  v39[0] = v9;
  objc_msgSend(v3, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_1E89C3E38;
  if (v10)
    v12 = (const __CFString *)v10;
  v39[1] = v12;
  v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);

  objc_msgSend(*(id *)(a1 + 40), "setupActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "end");

  v15 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 48);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(v34) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v16, OS_SIGNPOST_INTERVAL_END, v17, "SettingsCreate", ", (uint8_t *)&v34, 2u);
  }

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setupStartTimestamp");
    v34 = 138543618;
    v35 = v21;
    v36 = 2048;
    v37 = v22;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Setup start timestamp %f", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  v23 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v24 = objc_msgSend(*(id *)(a1 + 40), "setupStartTimestamp");
  v26 = v25;
  v27 = (void *)MEMORY[0x1D17BA0A0](v24);
  v28 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (double)(v23 / 0x3B9ACA00) - v26;
    if (v30 >= 0.0)
      v31 = (double)(v23 / 0x3B9ACA00) - v26;
    else
      v31 = -v30;
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543618;
    v35 = v32;
    v36 = 2048;
    v37 = v31;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Settings creation latency %f", (uint8_t *)&v34, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(*(id *)(a1 + 40), "setSetupStartTimestamp:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "currentAccessorySetupMetricDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "markSetupEndStage:error:", 5, v3);

}

void __47__HMDAccessorySettingsController_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fixupSettingsTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Fix settings timer has fired, issuing fix settings", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "_performDependantFixup");
    objc_msgSend(*(id *)(a1 + 32), "setFixupSettingsTimer:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "auditSettingsTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);

    if (v4 == v5)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Audit settings timer has fired, issuing audit for settings", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "_performSettingsAudit");
      objc_msgSend(*(id *)(a1 + 32), "setAuditSettingsTimer:", 0);
    }
  }
}

void __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke_2;
    block[3] = &unk_1E89C2730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v3, block);

  }
}

uint64_t __55__HMDAccessorySettingsController__performSettingsAudit__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reevaluateDependantSettings");
}

uint64_t __63__HMDAccessorySettingsController_scheduleAuditWithReason_from___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMDAccessorySettingsAuditReasonAsString(*(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received audit with reason %@ from %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleAuditWithReason:", *(_QWORD *)(a1 + 48));
}

void __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v68;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v68 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(a1 + 32), "_didAddSetting:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v20);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v23 = v18;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v64;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v64 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(a1 + 32), "_didRemoveSetting:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v25);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v28 = v15;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v60;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v60 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(a1 + 32), "_didAddGroup:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v32++));
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v30);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v33 = v17;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v56;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v56 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(a1 + 32), "_didRemoveGroup:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v37++), (_QWORD)v55);
      }
      while (v35 != v37);
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v35);
  }

  v38 = *(_QWORD *)(a1 + 32);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = v14;
  v40 = v14;

  v41 = *(_QWORD *)(a1 + 32);
  v42 = *(void **)(v41 + 32);
  *(_QWORD *)(v41 + 32) = v13;
  v43 = v13;

  v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v45 = *(void **)(v44 + 40);
  *(_QWORD *)(v44 + 40) = v28;
  v46 = v28;

  v47 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v48 = *(void **)(v47 + 40);
  *(_QWORD *)(v47 + 40) = v16;
  v49 = v16;

  v50 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v51 = *(void **)(v50 + 40);
  *(_QWORD *)(v50 + 40) = v33;
  v52 = v33;

  v53 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v54 = *(void **)(v53 + 40);
  *(_QWORD *)(v53 + 40) = v23;

}

void __60__HMDAccessorySettingsController_settingsHierarchyDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    v50 = v5;
    v51 = 2112;
    v52 = v6;
    v53 = 2112;
    v54 = v7;
    v55 = 2112;
    v56 = v8;
    v57 = 2112;
    v58 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Added groups: %@, settings: %@. Removed groups: %@, settings: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
        objc_msgSend(*(id *)(a1 + 32), "messageHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_QWORD *)(a1 + 32))
          v18 = objc_msgSend(v15, "isCollectionType");
        else
          v18 = 0;
        objc_msgSend(v16, "configureForSetting:allowSharedAdminEditConstraints:", v17, v18);

        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accessorySetupMetricDispatcher");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if ((objc_msgSend(v20, "submitted") & 1) == 0)
          {
            objc_msgSend(v20, "markFirstSettingObserved");
            objc_msgSend(v15, "keyPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqual:", CFSTR("root.siri.language"));

            if (v22)
            {
              objc_msgSend(v20, "markLanguageSettingObserved");
              objc_msgSend(v20, "submit");
            }
          }
        }

        ++v14;
      }
      while (v12 != v14);
      v23 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      v12 = v23;
    }
    while (v23);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v28);
        objc_msgSend(*(id *)(a1 + 32), "messageHandler", (_QWORD)v39);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "unconfigureFromSetting:", v31);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v26);
  }

  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rootGroup");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "settingsMap");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "groupsMap");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v50 = v35;
    v51 = 2112;
    v52 = v36;
    v53 = 2112;
    v54 = v37;
    v55 = 2112;
    v56 = v38;
    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Current root:%@, settings: %@, groups: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v32);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_147791 != -1)
    dispatch_once(&logCategory__hmf_once_t3_147791, &__block_literal_global_147792);
  return (id)logCategory__hmf_once_v4_147793;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __45__HMDAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_147793;
  logCategory__hmf_once_v4_147793 = v0;

}

@end
