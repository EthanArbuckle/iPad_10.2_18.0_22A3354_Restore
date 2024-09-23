@implementation HMDAppleAccountManager

- (BOOL)isLoggedInToPrimaryAccount
{
  return self->_loggedIn;
}

- (HMDAppleAccountContext)accountContext
{
  HMDAppleAccountContext *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_accountContext;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDAccount)account
{
  HMDAccount *v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_account;
  os_unfair_recursive_lock_unlock();
  return v3;
}

+ (HMDAppleAccountManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__HMDAppleAccountManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_106327 != -1)
    dispatch_once(&sharedManager_onceToken_106327, block);
  return (HMDAppleAccountManager *)(id)sharedManager_accountManager;
}

- (HMDAppleAccountManager)init
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

- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  HMDAppleAccountManagerDefaultDataSource *v12;
  HMDAppleAccountManager *v13;

  v6 = a4;
  v7 = a3;
  HMDispatchQueueNameString();
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);

  v12 = -[HMDAppleAccountManagerDefaultDataSource initWithQueue:]([HMDAppleAccountManagerDefaultDataSource alloc], "initWithQueue:", v11);
  v13 = -[HMDAppleAccountManager initWithIDSService:activityBroadcaster:dataSource:](self, "initWithIDSService:activityBroadcaster:dataSource:", v7, v6, v12);

  return v13;
}

- (HMDAppleAccountManager)initWithIDSService:(id)a3 activityBroadcaster:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAppleAccountManager *v12;
  uint64_t v13;
  OS_os_log *logger;
  uint64_t v15;
  OS_dispatch_queue *queue;
  void *v17;
  void *v18;
  HMDAccountChangeObserver *v19;
  HMDAccountChangeObserver *accountChangeObserver;
  HMDAccountChangeObserver *v21;
  uint64_t v22;
  HMDAPSConnection *pushConnection;
  uint64_t v24;
  NSNotificationCenter *notificationCenter;
  uint64_t v26;
  HMDACAccountStore *accountStore;
  uint64_t v28;
  HMFExponentialBackoffTimer *accountChangeBackoffTimer;
  void *v30;
  void *v31;
  uint64_t v32;
  HMFTimer *devicesChangeBackoffTimer;
  uint64_t v34;
  HMDWatchManager *watchManager;
  void *v36;
  void *v37;
  HMDAppleAccountManager *v38;
  HMDAppleAccountManager *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v44.receiver = self;
    v44.super_class = (Class)HMDAppleAccountManager;
    v12 = -[HMDAppleAccountManager init](&v44, sel_init);
    if (v12)
    {
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      logger = v12->_logger;
      v12->_logger = (OS_os_log *)v13;

      v12->_loggedIn = 0;
      objc_msgSend(v11, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v15;

      objc_storeStrong((id *)&v12->_service, a3);
      objc_storeStrong((id *)&v12->_activityBroadcaster, a4);
      objc_msgSend(v11, "accountChangeObserver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      accountChangeObserver = v12->_accountChangeObserver;
      v12->_accountChangeObserver = v19;
      v21 = v19;

      objc_msgSend(v11, "apsConnection");
      v22 = objc_claimAutoreleasedReturnValue();
      pushConnection = v12->_pushConnection;
      v12->_pushConnection = (HMDAPSConnection *)v22;

      -[HMDAPSConnection setDelegate:](v12->_pushConnection, "setDelegate:", v12);
      objc_msgSend(v11, "notificationCenter");
      v24 = objc_claimAutoreleasedReturnValue();
      notificationCenter = v12->_notificationCenter;
      v12->_notificationCenter = (NSNotificationCenter *)v24;

      objc_msgSend(v11, "accountStore");
      v26 = objc_claimAutoreleasedReturnValue();
      accountStore = v12->_accountStore;
      v12->_accountStore = (HMDACAccountStore *)v26;

      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28578]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 3, 1, 1.0, 86400.0);
      accountChangeBackoffTimer = v12->_accountChangeBackoffTimer;
      v12->_accountChangeBackoffTimer = (HMFExponentialBackoffTimer *)v28;

      -[HMDAppleAccountManager accountChangeBackoffTimer](v12, "accountChangeBackoffTimer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDelegate:", v12);

      -[HMDAppleAccountManager accountChangeBackoffTimer](v12, "accountChangeBackoffTimer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDelegateQueue:", v12->_queue);

      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 2, 15.0);
      devicesChangeBackoffTimer = v12->_devicesChangeBackoffTimer;
      v12->_devicesChangeBackoffTimer = (HMFTimer *)v32;

      +[HMDWatchManager sharedManager](HMDWatchManager, "sharedManager");
      v34 = objc_claimAutoreleasedReturnValue();
      watchManager = v12->_watchManager;
      v12->_watchManager = (HMDWatchManager *)v34;

      -[HMDAppleAccountManager devicesChangeBackoffTimer](v12, "devicesChangeBackoffTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDelegate:", v12);

      -[HMDAppleAccountManager devicesChangeBackoffTimer](v12, "devicesChangeBackoffTimer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setDelegateQueue:", v12->_queue);

      __updateAccountContext(v12);
    }
    v38 = v12;
    v39 = v38;
  }
  else
  {
    v40 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v42;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Service is required", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v40);
    v39 = 0;
  }

  return v39;
}

- (void)_registerForRapportNotifications
{
  NSObject *queue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  HMDAppleAccountManager *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[HMDAppleAccountManager isRapportIdentitiesChangedNotificationTokenValid](self, "isRapportIdentitiesChangedNotificationTokenValid"))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __58__HMDAppleAccountManager__registerForRapportNotifications__block_invoke;
    v16 = &unk_1E89B9FB8;
    objc_copyWeak(&v17, &location);
    v4 = notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_rapportIdentitiesChangedNotificationToken, queue, &v13);
    v8 = v4;
    if ((_DWORD)v4)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0](v4, v5, v6, v7);
      v10 = self;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v12;
        v21 = 2080;
        v22 = "com.apple.rapport.identitiesChanged";
        v23 = 1024;
        v24 = v8;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for %s: %d", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      -[HMDAppleAccountManager setRapportIdentitiesChangedNotificationTokenValid:](self, "setRapportIdentitiesChangedNotificationTokenValid:", 1, v13, v14, v15, v16);
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_deregisterForRapportNotifications
{
  if (-[HMDAppleAccountManager isRapportIdentitiesChangedNotificationTokenValid](self, "isRapportIdentitiesChangedNotificationTokenValid"))
  {
    notify_cancel(-[HMDAppleAccountManager rapportIdentitiesChangedNotificationToken](self, "rapportIdentitiesChangedNotificationToken"));
    -[HMDAppleAccountManager setRapportIdentitiesChangedNotificationTokenValid:](self, "setRapportIdentitiesChangedNotificationTokenValid:", 0);
  }
}

- (ACAccountStore)accountStore
{
  HMDACAccountStore *v2;
  HMDACAccountStore *v3;
  ACAccountStore *v4;

  v2 = self->_accountStore;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)configureWithBackingStore:(id)a3
{
  HMDBackingStore *v4;
  HMDBackingStore *v5;

  v4 = (HMDBackingStore *)a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if (!self->_backingStore)
    {
      self->_backingStore = v5;
      os_unfair_recursive_lock_unlock();
      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  _HMFPreconditionFailure();
  __break(1u);
}

- (HMDBackingStore)backingStore
{
  HMDBackingStore *backingStore;
  HMDBackingStore *v4;
  HMDBackingStore *result;

  os_unfair_recursive_lock_lock_with_options();
  backingStore = self->_backingStore;
  if (backingStore)
  {
    v4 = backingStore;
    os_unfair_recursive_lock_unlock();
    return v4;
  }
  else
  {
    result = (HMDBackingStore *)_HMFPreconditionFailure();
    __break(1u);
  }
  return result;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  -[HMDAppleAccountManager backingStore](self, "backingStore");

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__HMDAppleAccountManager_start__block_invoke;
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
  block[2] = __30__HMDAppleAccountManager_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__localDataReset:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDAppleAccountManager___localDataReset___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__handleModifiedAccount:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDAppleAccountManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAppleAccountManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMDAppleAccountManager isMonitoring](self, "isMonitoring");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification account was modified", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    __updateAccountContext(v7);
    -[HMDAppleAccountManager settings](v7, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synchronize");

    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("kPrimaryAccountWasModifiedRequestKey")) & 1) == 0)
    {
      -[HMDAppleAccountManager account](v7, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        __createAccount(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          __addAccount(v7, v13, 0);
        }
        else
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = v7;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543362;
            v21 = v18;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create account", (uint8_t *)&v20, 0xCu);

          }
          objc_autoreleasePoolPop(v15);
        }

      }
    }
    -[HMDAppleAccountManager notificationCenter](v7, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("HMDAppleAccountManagerAccountModifiedNotification"), v7);

    objc_msgSend(v4, "respondWithPayload:", 0);
    -[HMDAppleAccountManager __updateMergeIDOnAccount](v7, "__updateMergeIDOnAccount");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring account notification", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)__handleRemovedAccountMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HMDAppleAccountManager___handleRemovedAccountMessage___block_invoke;
  v6[3] = &unk_1E89C2350;
  v7 = v4;
  v5 = v4;
  -[HMDAppleAccountManager __handleRemovedAccountWithCompletion:](self, "__handleRemovedAccountWithCompletion:", v6);

}

- (void)__handleRemovedAccountWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  BOOL v5;
  void *v6;
  HMDAppleAccountManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAppleAccountManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDAppleAccountManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDAppleAccountManager *v26;
  NSObject *v27;
  void *v28;
  HMDAccount *account;
  HMDAppleAccountContext *accountContext;
  HMDAccount *v31;
  void *v32;
  HMDAppleAccountManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  HMDAccount *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[HMDAppleAccountManager isMonitoring](self, "isMonitoring");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification account was removed", (uint8_t *)&v39, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_primaryAppleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v7;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543362;
        v40 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_FAULT, "%{public}@Got primary iCloud account removed notification even though user is still signed in", (uint8_t *)&v39, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v14;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543362;
        v40 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Got primary iCloud account removed notification even though user is still signed in", (uint8_t *)&v39, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2721);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v21);

    }
    else
    {
      +[HMDPersistentStore resetConfiguration:](HMDPersistentStore, "resetConfiguration:", 2);
      v24 = os_unfair_recursive_lock_lock_with_options();
      v25 = (void *)MEMORY[0x1D17BA0A0](v24);
      v26 = v7;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        account = v26->_account;
        v39 = 138543618;
        v40 = v28;
        v41 = 2112;
        v42 = account;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Current account: %@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      accountContext = v26->_accountContext;
      v26->_accountContext = 0;

      v26->_loggedIn = 0;
      v31 = v26->_account;
      if (v31)
        __removeAccount(v26, v26->_account);
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v26;
      HMFGetOSLogHandle();
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543362;
        v40 = v35;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Primary apple account is removed & logged out", (uint8_t *)&v39, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      os_unfair_recursive_lock_unlock();
      if (!v31)
      {
        +[HMDMainDriver driver](HMDMainDriver, "driver");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "homeManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_eraseLocalHomeConfigurationAfterSignOut");

      }
      -[HMDAppleAccountManager settings](v33, "settings");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "synchronize");

      v4[2](v4, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v22;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring account notification", (uint8_t *)&v39, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v23);

  }
}

- (void)__handleUpdatedName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *queue;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D28518]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__HMDAppleAccountManager___handleUpdatedName___block_invoke;
    v9[3] = &unk_1E89C2328;
    v9[4] = self;
    v10 = v7;
    dispatch_async(queue, v9);

  }
}

- (void)__handleMigrationUpdated:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDAppleAccountManager___handleMigrationUpdated___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setAccount:(id)a3
{
  __setAccount(self, a3, 0);
}

- (void)__updateMergeIDOnAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAppleAccountManager *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  OS_dispatch_queue *queue;
  void *v21;
  HMDAppleAccountManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[HMDAppleAccountManager account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Trying to update mergeID on currentAccount: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "_appearsToBeEmail") & 1) != 0)
    {
      v13 = MEMORY[0x1D17B9074](v12);
    }
    else if ((objc_msgSend(v12, "_appearsToBeBusinessID") & 1) != 0)
    {
      v13 = MEMORY[0x1D17B905C](v12);
    }
    else
    {
      v13 = IDSCopyIDForPhoneNumber();
    }
    v15 = (void *)v13;

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDIDSServiceManager sharedIDSServiceName](HMDIDSServiceManager, "sharedIDSServiceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      queue = v7->_queue;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke;
      v26[3] = &unk_1E89B2EB0;
      v26[4] = v7;
      v27 = v15;
      v28 = v3;
      objc_msgSend(v16, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v17, v18, v19, queue, v26);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v24;
        v32 = 2112;
        v33 = v25;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine destination with handle value: %@, account handle: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
    }

  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2112;
      v33 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Account is missing a handle so cannot update mergeID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)updateSenderCorrelationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAppleAccountManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAppleAccountManager *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  HMDAppleAccountManager *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleAccountManager account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "senderCorrelationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "isEqual:", v4))
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@MergeID is the same, not updating", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v6, "setSenderCorrelationIdentifier:", v4));
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v16;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Updated mergeID for currentAccount : %@. Also going to ask IDS about the mergeID.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDAppleAccountManager messageReceiveQueue](v14, "messageReceiveQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__HMDAppleAccountManager_updateSenderCorrelationIdentifier___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v14;
      dispatch_async(v17, block);

    }
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
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Current account went away, not updating", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (BOOL)isServiceActive
{
  void *v2;
  char v3;

  -[HMDAppleAccountManager service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmd_isActive");

  return v3;
}

- (int64_t)IDSAccountRegistrationStatus
{
  void *v2;
  int64_t v3;

  -[HMDAppleAccountManager service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmd_registrationStatus");

  return v3;
}

- (int64_t)IDSAccountRegistrationError
{
  void *v2;
  int64_t v3;

  -[HMDAppleAccountManager service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmd_registrationError");

  return v3;
}

- (void)__deviceAddedToCurrentAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAppleAccountManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDAppleAccountManager___deviceAddedToCurrentAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)__deviceRemovedFromCurrentAccount:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAppleAccountManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HMDAppleAccountManager___deviceRemovedFromCurrentAccount___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (HMDDevice)device
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  -[HMDAppleAccountManager account](self, "account", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isCurrentDevice") & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (HMDDevice *)v4;
}

- (BOOL)shouldCacheAccount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAppleAccountManager account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (BOOL)shouldSyncAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  v7 = 0;
  if (v4)
  {
    -[HMDAppleAccountManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HMFEqualObjects();

    if ((v6 & 1) != 0)
      v7 = 1;
  }

  return v7;
}

- (BOOL)shouldSyncDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  v8 = v4
    && (objc_msgSend(v4, "account"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[HMDAppleAccountManager shouldSyncAccount:](self, "shouldSyncAccount:", v6),
        v6,
        v7)
    && -[HMDAppleAccountManager isCurrentDeviceDataOwnerForDevice:](self, "isCurrentDeviceDataOwnerForDevice:", v5);

  return v8;
}

- (BOOL)shouldAccount:(id)a3 pushbackModel:(id)a4 actions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char isKindOfClass;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMDAppleAccountManager *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  HMDAppleAccountManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDAppleAccountManager *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  id v47;
  id v48;
  id obj;
  id obja;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    if (-[HMDAppleAccountManager shouldSyncAccount:](self, "shouldSyncAccount:", v8))
    {
      v11 = v9;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v13 = v11;
      else
        v13 = 0;
      v52 = v13;

      v14 = v11;
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();
      if ((v15 & 1) != 0)
        v16 = v14;
      else
        v16 = 0;
      v51 = v16;

      if ((isKindOfClass & 1) != 0)
      {
        -[HMDAppleAccountManager service](self, "service");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hmd_isActive");

        if ((v18 & 1) == 0)
        {
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v63 = v40;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Not pushing back account handles while inactive", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v37);
          goto LABEL_53;
        }
        if (objc_msgSend(v10, "source") != 2)
        {
LABEL_53:
          v30 = 0;
          goto LABEL_54;
        }
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v8, "handles");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v19)
        {
          v47 = v10;
          v20 = *(_QWORD *)v58;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v58 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v22, "modelIdentifier", v47);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "uuid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "hmf_isEqualToUUID:", v24);

              if (v25)
              {
                v19 = v22;
                goto LABEL_41;
              }
            }
            v19 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v19)
              continue;
            break;
          }
LABEL_41:
          v10 = v47;
        }

        if (objc_msgSend(v19, "isLocallyTracked"))
        {
          v41 = (void *)MEMORY[0x1D17BA0A0]();
          v42 = self;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v44;
            v64 = 2112;
            v65 = v19;
            v45 = "%{public}@This handle is locally tracked, pushing back -- accountHandle: %@";
LABEL_50:
            _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, v45, buf, 0x16u);

            goto LABEL_51;
          }
          goto LABEL_51;
        }
      }
      else
      {
        if ((v15 & 1) == 0 || objc_msgSend(v10, "source") != 2)
          goto LABEL_53;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v8, "devices");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (v19)
        {
          v48 = v10;
          v31 = *(_QWORD *)v54;
          while (2)
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(_QWORD *)v54 != v31)
                objc_enumerationMutation(obja);
              v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v33, "modelIdentifier", v48);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "uuid");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v34, "hmf_isEqualToUUID:", v35);

              if (v36)
              {
                v19 = v33;
                goto LABEL_46;
              }
            }
            v19 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
            if (v19)
              continue;
            break;
          }
LABEL_46:
          v10 = v48;
        }

        if (objc_msgSend(v19, "isCurrentDevice"))
        {
          v41 = (void *)MEMORY[0x1D17BA0A0]();
          v42 = self;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v63 = v44;
            v64 = 2112;
            v65 = v19;
            v45 = "%{public}@This is our current device, pushing back -- device: %@";
            goto LABEL_50;
          }
LABEL_51:

          objc_autoreleasePoolPop(v41);
          v30 = 1;
LABEL_54:

          goto LABEL_55;
        }
      }

      goto LABEL_53;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Manager cannot confirm account model process due to nil parameter.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }
  v30 = 0;
LABEL_55:

  return v30;
}

- (BOOL)shouldDevice:(id)a3 processModel:(id)a4 actions:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  char isKindOfClass;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  HMDAppleAccountManager *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  id v28;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() & 1;
    if (v11)
      v12 = v9;
    else
      v12 = 0;
    v13 = v12;
    v14 = v9;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    if (!v11 && (isKindOfClass & 1) == 0)
      goto LABEL_25;
    if (objc_msgSend(v10, "source") == 2 && objc_msgSend(v8, "isCurrentDevice"))
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v8;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_24:

        objc_autoreleasePoolPop(v18);
LABEL_25:
        v27 = 0;
LABEL_27:

        goto LABEL_28;
      }
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v21;
      v22 = "%{public}@The cloud updated our current device, dropping change.";
    }
    else
    {
      if (objc_msgSend(v10, "source")
        || -[HMDAppleAccountManager isCurrentDeviceDataOwnerForDevice:](self, "isCurrentDeviceDataOwnerForDevice:", v8)
        || !objc_msgSend(v8, "isCloudTracked"))
      {
        v27 = 1;
        goto LABEL_27;
      }
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v8;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v21;
      v22 = "%{public}@This device is tracked by a cloud model, dropping change.";
    }
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v30, 0xCu);

    goto LABEL_24;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543362;
    v31 = v26;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Manager cannot confirm account model process due to nil parameter.", (uint8_t *)&v30, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v27 = 0;
LABEL_28:

  return v27;
}

- (BOOL)isCurrentDeviceDataOwnerForDevice:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_msgSend(v4, "isCurrentDevice") & 1) != 0
    || -[HMDAppleAccountManager isDeviceLocallyPairedWatch:](self, "isDeviceLocallyPairedWatch:", v4);

  return v5;
}

- (BOOL)isDeviceLocallyPairedWatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDAppleAccountManager watchManager](self, "watchManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedWatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HMDAppleAccountManager_isDeviceLocallyPairedWatch___block_invoke;
  v10[3] = &unk_1E89B2ED8;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

- (id)primaryHandleForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    -[HMDAppleAccountManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v5))
    {
      -[HMDAppleAccountManager service](self, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmd_preferredHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "handles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if (v9)
        v10 = v7;
      else
        v10 = 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isModelCurrentAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  -[HMDAppleAccountManager accountContext](self, "accountContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMDAccountIdentifier accountIdentifierForAppleAccountContext:](HMDAccountIdentifier, "accountIdentifierForAppleAccountContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)processAccountModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDAccount *v18;
  void *v19;
  HMDAppleAccountManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAppleAccountManager *v29;
  NSObject *v30;
  void *v31;
  HMDAssertionLogEvent *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAppleAccountManager account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDAppleAccountManager account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v31;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Account update does not match current account identifier", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      v32 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Account update does not match current account identifier"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "submitLogEvent:", v32);

    }
    objc_msgSend(v6, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleAccountManager account](self, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modelIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "hmf_isEqualToUUID:", v15);

    if ((v16 & 1) != 0)
    {
      -[HMDAppleAccountManager account](self, "account");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "transactionObjectUpdated:newValues:message:", 0, v6, v7);

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
        -[HMDAppleAccountManager account](v20, "account");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "modelIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "UUIDString");
        v34 = v19;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v22;
        v37 = 2112;
        v38 = v25;
        v39 = 2112;
        v40 = v27;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Account update does not match current account identifier -- current identifier: %@, received identifier: %@", buf, 0x20u);

        v19 = v34;
      }

      objc_autoreleasePoolPop(v19);
    }
  }
  else
  {
    v18 = -[HMDAccount initWithObjectModel:]([HMDAccount alloc], "initWithObjectModel:", v6);
    if (v18)
      __setAccount(self, v18, 1);

  }
}

- (void)processAccountModelRemove:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDAppleAccountManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDAppleAccountManager *v27;
  NSObject *v28;
  void *v29;
  HMDAssertionLogEvent *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAppleAccountManager account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object model received", buf, 0xCu);
LABEL_9:

    }
LABEL_10:

    objc_autoreleasePoolPop(v17);
    goto LABEL_11;
  }
  -[HMDAppleAccountManager account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if ((v12 & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Account update does not match current account identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    v30 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Account update does not match current account identifier"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "submitLogEvent:", v30);

  }
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleAccountManager account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "modelIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "hmf_isEqualToUUID:", v15);

  if ((v16 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleAccountManager account](v18, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "modelIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v32 = v17;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v35 = 2112;
      v36 = v23;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Account update does not match current account identifier -- current identifier: %@, received identifier: %@", buf, 0x20u);

      v17 = v32;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  __setAccount(self, 0, 1);
LABEL_11:

}

- (HMDAppleAccountSettings)settings
{
  return (HMDAppleAccountSettings *)+[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleAccountManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "privateStringForObjectValue:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received push token: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  queue = v9->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__HMDAppleAccountManager_connection_didReceivePublicToken___block_invoke;
  v16[3] = &unk_1E89C2328;
  v16[4] = v9;
  v17 = v7;
  v15 = v7;
  dispatch_async(queue, v16);

}

- (void)_updatePushToken:(id)a3
{
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3)
  {
    -[HMDAppleAccountManager account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      __updateCurrentDevice(self, v5);
      v5 = v6;
    }

  }
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CBA490], "UUID");
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (void)timerDidFire:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HMDAppleAccountManager accountChangeBackoffTimer](self, "accountChangeBackoffTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if (v5)
  {
    __updateAccount(self, 1);
  }
  else
  {
    -[HMDAppleAccountManager devicesChangeBackoffTimer](self, "devicesChangeBackoffTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v6);

    if (v7)
      __updateDevices(self, 1);
  }

}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDAppleAccountManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HMDAppleAccountManager service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received notification that account is active changed", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAppleAccountManager accountChangeBackoffTimer](v10, "accountChangeBackoffTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

    -[HMDAppleAccountManager accountChangeBackoffTimer](v10, "accountChangeBackoffTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reset");

  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleAccountManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification that aliases changed", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAppleAccountManager accountChangeBackoffTimer](v9, "accountChangeBackoffTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  -[HMDAppleAccountManager accountChangeBackoffTimer](v9, "accountChangeBackoffTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reset");

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  HMDAppleAccountManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAppleAccountManager service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification that the current account changed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "accounts", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v19, "addDelegate:queue:", v11, v11->_queue);
          objc_msgSend(v19, "addRegistrationDelegate:queue:", v11, v11->_queue);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    -[HMDAppleAccountManager accountChangeBackoffTimer](v11, "accountChangeBackoffTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resume");

    -[HMDAppleAccountManager accountChangeBackoffTimer](v11, "accountChangeBackoffTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reset");

  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  HMDAppleAccountManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAppleAccountManager service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification that devices changed on the current account", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAppleAccountManager devicesChangeBackoffTimer](v11, "devicesChangeBackoffTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

- (void)accountChangeObserver:(id)a3 observedDeletedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleAccountManager *v9;
  NSObject *v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received notification of removed account %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  queue = v9->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke;
  v14[3] = &unk_1E89C2328;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  dispatch_async(queue, v14);

}

- (BOOL)didProcessAccountSignOut
{
  return self->_didProcessAccountSignOut;
}

- (HMDAccount)lastSignedOutAccount
{
  return self->_lastSignedOutAccount;
}

- (HMDAPSConnection)pushConnection
{
  return self->_pushConnection;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (HMFExponentialBackoffTimer)accountChangeBackoffTimer
{
  return self->_accountChangeBackoffTimer;
}

- (HMFTimer)devicesChangeBackoffTimer
{
  return self->_devicesChangeBackoffTimer;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (int)rapportIdentitiesChangedNotificationToken
{
  return self->_rapportIdentitiesChangedNotificationToken;
}

- (void)setRapportIdentitiesChangedNotificationToken:(int)a3
{
  self->_rapportIdentitiesChangedNotificationToken = a3;
}

- (BOOL)isRapportIdentitiesChangedNotificationTokenValid
{
  return self->_rapportIdentitiesChangedNotificationTokenValid;
}

- (void)setRapportIdentitiesChangedNotificationTokenValid:(BOOL)a3
{
  self->_rapportIdentitiesChangedNotificationTokenValid = a3;
}

- (NSData)pendingPushToken
{
  return self->_pendingPushToken;
}

- (void)setPendingPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPushToken, a3);
}

- (HMDWatchManager)watchManager
{
  return self->_watchManager;
}

- (void)setWatchManager:(id)a3
{
  objc_storeStrong((id *)&self->_watchManager, a3);
}

- (HMDIDSService)service
{
  return self->_service;
}

- (HMDIDSActivityMonitorBroadcaster)activityBroadcaster
{
  return self->_activityBroadcaster;
}

- (HMDCloudCache)cloudCache
{
  return self->_cloudCache;
}

- (void)setCloudCache:(id)a3
{
  objc_storeStrong((id *)&self->_cloudCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudCache, 0);
  objc_storeStrong((id *)&self->_activityBroadcaster, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_watchManager, 0);
  objc_storeStrong((id *)&self->_pendingPushToken, 0);
  objc_storeStrong((id *)&self->_devicesChangeBackoffTimer, 0);
  objc_storeStrong((id *)&self->_accountChangeBackoffTimer, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_lastSignedOutAccount, 0);
  objc_storeStrong((id *)&self->_accountContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke_2;
  v2[3] = &unk_1E89C21C0;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "__handleRemovedAccountWithCompletion:", v2);

}

void __71__HMDAppleAccountManager_accountChangeObserver_observedDeletedAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed handling of removed account %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __59__HMDAppleAccountManager_connection_didReceivePublicToken___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that the push token changed", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "_updatePushToken:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 40), "length");
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@We got the push token before the apple account manager is started. Will process this token once it starts up. token length: %lu", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    return objc_msgSend(*(id *)(a1 + 32), "setPendingPushToken:", *(_QWORD *)(a1 + 40));
  }
}

uint64_t __53__HMDAppleAccountManager_isDeviceLocallyPairedWatch___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "idsIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__HMDAppleAccountManager___deviceRemovedFromCurrentAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "isCurrentDevice");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      __handleUpdatedDevice_106206(*(void **)(a1 + 40), 0);
  }
}

void __56__HMDAppleAccountManager___deviceAddedToCurrentAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "isCurrentDevice");
  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "device");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    __handleUpdatedDevice_106206(v7, v8);

  }
}

uint64_t __60__HMDAppleAccountManager_updateSenderCorrelationIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__updateMergeIDOnAccount");
}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_2;
  v5[3] = &unk_1E89B2E88;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_3;
  v8[3] = &unk_1E89B2E60;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[1] = 3221225472;
  v9 = v7;
  v10 = *(id *)(a1 + 48);
  v11 = a4;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

}

void __50__HMDAppleAccountManager___updateMergeIDOnAccount__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "senderCorrelationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSenderCorrelationIdentifier:", v7);

    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v12;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Found mergeID %@ for destination %@, new attribute %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not get the mergeID after querying IDS: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

}

void __51__HMDAppleAccountManager___handleMigrationUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMigrating");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that migration completed", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "accountChangeBackoffTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

    objc_msgSend(*(id *)(a1 + 32), "accountChangeBackoffTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reset");

    objc_msgSend(*(id *)(a1 + 32), "devicesChangeBackoffTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

void __46__HMDAppleAccountManager___handleUpdatedName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDeviceModel *v14;
  void *v15;
  void *v16;
  HMDDeviceModel *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = HMFEqualObjects();

    if ((v5 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        v18 = 138543618;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating name: %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 0, 2, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "backingStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "transaction:options:", CFSTR("Update Device Name"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = [HMDDeviceModel alloc];
      objc_msgSend(v3, "modelIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "modelParentIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v14, "initWithObjectChangeType:uuid:parentUUID:", 2, v15, v16);

      -[HMDDeviceModel setName:](v17, "setName:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v13, "add:", v17);
      objc_msgSend(v13, "run");

    }
  }

}

uint64_t __56__HMDAppleAccountManager___handleRemovedAccountMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "respondWithError:", a2);
  else
    return objc_msgSend(v2, "respondWithSuccess");
}

void __43__HMDAppleAccountManager___localDataReset___block_invoke(uint64_t a1)
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
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
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
      v16 = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Repushing account transactions", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || (__createAccount(*(void **)(a1 + 32)), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "accountContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        __addAccount(*(void **)(a1 + 32), v6, 1);
LABEL_14:

        return;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-create account", (uint8_t *)&v16, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v6 = 0;
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot add account after local reset", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    goto LABEL_14;
  }
}

void __30__HMDAppleAccountManager_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 138543362;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_deregisterForRapportNotifications");
    objc_msgSend(*(id *)(a1 + 32), "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeDelegate:", *(_QWORD *)(a1 + 32));

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "service", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v13, "removeDelegate:", *(_QWORD *)(a1 + 32));
          objc_msgSend(v13, "removeRegistrationDelegate:", *(_QWORD *)(a1 + 32));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

uint64_t __31__HMDAppleAccountManager_start__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  _QWORD v58[2];
  uint64_t v59;
  __int128 buf;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setMonitoring:", 1);
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v8 = v7;
      +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v10;
      v59 = *MEMORY[0x1E0CB81C0];
      v11 = v59;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:](HMDXPCiCloudSwitchMessagePolicy, "policyWithBundleIdentifiers:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&buf + 1) = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kPrimaryAccountWasModifiedRequestKey"), v8, v14, sel___handleModifiedAccount_);

      +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v11;
      v58[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:](HMDXPCiCloudSwitchMessagePolicy, "policyWithBundleIdentifiers:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kPrimaryAccountWasDeletedRequestKey"), v8, v18, sel___handleRemovedAccountMessage_);

      objc_msgSend(v8, "notificationCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0D28520];
      objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel___handleUpdatedName_, v20, v21);

      objc_msgSend(v8, "notificationCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x1E0D28510];
      objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", v8, sel___handleMigrationUpdated_, v23, v24);

      objc_msgSend(v8, "notificationCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", v8, sel___localDataReset_, CFSTR("HMDBackingStoreLocalDataReset"), 0);

      v26 = *(void **)(a1 + 32);
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(v26, "service");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    objc_msgSend(*(id *)(a1 + 32), "activityBroadcaster");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configureWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "service", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "accounts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v53 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v35, "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
          objc_msgSend(v35, "addRegistrationDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v32);
    }

    __updateAccountContext(*(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "account");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accountContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = *(void **)(a1 + 32);
      if (v36)
      {
        __updateAccount(v38, 0);
        __updateDevices(*(void **)(a1 + 32), 0);
      }
      else
      {
        __createAccount(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          __addAccount(*(void **)(a1 + 32), v39, 0);
        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v43;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to create account", (uint8_t *)&buf, 0xCu);

          }
          objc_autoreleasePoolPop(v40);
        }

      }
    }
    else if (v36)
    {
      __removeAccount(*(void **)(a1 + 32), v36);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingPushToken");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v48;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@We might have a missed the didReceivePublicToken earlier. Let's set the token first.", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      v49 = *(void **)(a1 + 32);
      objc_msgSend(v49, "pendingPushToken");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_updatePushToken:", v50);

      objc_msgSend(*(id *)(a1 + 32), "setPendingPushToken:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "__updateMergeIDOnAccount");
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "postNotificationName:object:", CFSTR("HMDAppleAccountManagerResolved"), *(_QWORD *)(a1 + 32));

    return objc_msgSend(*(id *)(a1 + 32), "_registerForRapportNotifications");
  }
  return result;
}

void __58__HMDAppleAccountManager__registerForRapportNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = WeakRetained;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that rapport identity changed, update current device", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      __updateCurrentDevice(v3, v6);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t106 != -1)
    dispatch_once(&logCategory__hmf_once_t106, &__block_literal_global_106324);
  return (id)logCategory__hmf_once_v107;
}

void __37__HMDAppleAccountManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v107;
  logCategory__hmf_once_v107 = v0;

}

void __39__HMDAppleAccountManager_sharedManager__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  HMDAppleAccountManager *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isResidentCapable");

  if (v4)
  {
    objc_msgSend(v2, "activityBroadcaster");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = [HMDAppleAccountManager alloc];
  objc_msgSend(v2, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDAppleAccountManager initWithIDSService:activityBroadcaster:](v6, "initWithIDSService:activityBroadcaster:", v7, v5);
  v9 = (void *)sharedManager_accountManager;
  sharedManager_accountManager = v8;

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
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating an HMDAppleAccountManager", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v10);

}

@end
