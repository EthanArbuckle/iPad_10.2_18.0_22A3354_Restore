@implementation HMDAccessoryBulletinNotificationManager

- (HMDAccessoryBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 accountManager:(id)a5 evaluator:(id)a6 notificationCenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDAccessoryBulletinNotificationManager *v17;
  HMDAccessoryBulletinNotificationManager *v18;
  id synchronizeWithPrimaryDebounceTimerFactory;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessoryBulletinNotificationManager;
  v17 = -[HMDAccessoryBulletinNotificationManager init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_home, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_accountManager, a5);
    objc_storeStrong((id *)&v18->_evaluator, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
    synchronizeWithPrimaryDebounceTimerFactory = v18->_synchronizeWithPrimaryDebounceTimerFactory;
    v18->_synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_176132;

  }
  return v18;
}

- (NSArray)serviceRegistrationsForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175964;
  v17 = __Block_byref_object_dispose__175965;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

- (id)_characteristicsRegistrationsFromBulletinRegistrations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__HMDAccessoryBulletinNotificationManager__characteristicsRegistrationsFromBulletinRegistrations___block_invoke;
  v8[3] = &unk_24E78CED8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "na_each:", v8);

  return v6;
}

- (NSArray)accessoryRegistrations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDAccessoryBulletinNotificationManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175964;
  v17 = __Block_byref_object_dispose__175965;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke;
  v9[3] = &unk_24E79C0A8;
  v6 = v3;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v7;
}

- (NSArray)accessoryRegistrationsForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__175964;
  v17 = __Block_byref_object_dispose__175965;
  v18 = (id)MEMORY[0x24BDBD1A8];
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_24E79C0A8;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

- (HMDBulletinNotificationRegistrationSource)source
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDBulletinNotificationRegistrationSource *v10;
  void *v11;
  HMDAccessoryBulletinNotificationManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDAccessoryBulletinNotificationManager *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBulletinNotificationManager accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDAccessoryBulletinNotificationManager home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[HMDBulletinNotificationRegistrationSource initWithUserUUID:deviceAddress:]([HMDBulletinNotificationRegistrationSource alloc], "initWithUserUUID:deviceAddress:", v9, v6);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v10 = 0;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (void)configureWithDeviceIsResidentCapable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDAccessoryBulletinNotificationManager *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, double);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  HMDAccessoryBulletinNotificationManager *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  _QWORD block[5];
  _QWORD v45[5];
  id v46;
  id v47;
  __int128 buf;
  void (*v49)(uint64_t, void *);
  void *v50;
  HMDAccessoryBulletinNotificationManager *v51;
  HMDAccessoryBulletinNotificationManager *v52;
  NSObject *v53;
  id v54;
  _QWORD v55[9];

  v3 = a3;
  v55[7] = *MEMORY[0x24BDAC8D0];
  if (self)
  {
    -[HMDAccessoryBulletinNotificationManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "bulletinBoardNotificationsMigrationFileExistsOnDisk"))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v5, "loadMigrationBulletinBoardNotificationsFromDisk");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    if (v6)
    {
      v8 = v6;
      v9 = (void *)MEMORY[0x24BDBCF20];
      v55[0] = objc_opt_class();
      v55[1] = objc_opt_class();
      v55[2] = objc_opt_class();
      v55[3] = objc_opt_class();
      v55[4] = objc_opt_class();
      v55[5] = objc_opt_class();
      v55[6] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v49 = __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke;
      v50 = &unk_24E78D280;
      v51 = self;
      v14 = (HMDAccessoryBulletinNotificationManager *)v8;
      v52 = v14;
      v15 = v11;
      v53 = v15;
      v16 = v12;
      v54 = v16;
      -[HMDAccessoryBulletinNotificationManager hmf_enumerateWithAutoreleasePoolUsingBlock:](v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &buf);
      if (objc_msgSend(v16, "count"))
      {
        -[HMDAccessoryBulletinNotificationManager home](self, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "backingStore");
        v43 = v7;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "context");
        v42 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "managedObjectContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v13;
        v45[1] = 3221225472;
        v45[2] = __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_93;
        v45[3] = &unk_24E79BBD0;
        v45[4] = self;
        v46 = v16;
        v47 = v20;
        v21 = v20;
        objc_msgSend(v21, "performBlockAndWait:", v45);

        v7 = v43;
        v3 = v42;
      }

    }
    else
    {
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        objc_autoreleasePoolPop(v7);
        goto LABEL_11;
      }
      HMFGetLogIdentifier();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to load bulletin board notifications from migration file", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_12:
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "residentDeviceManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v24);

  -[HMDAccessoryBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager accountManager](self, "accountManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v26);

  -[HMDAccessoryBulletinNotificationManager notificationCenter](self, "notificationCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager accountManager](self, "accountManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_handleCurrentDeviceOrAccountUpdatedNotification_, CFSTR("HMDAppleAccountManagerAccountUpdatedNotification"), v28);

  -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimerFactory](self, "synchronizeWithPrimaryDebounceTimerFactory");
  v29 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v29[2](v29, 28, 5.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager setSynchronizeWithPrimaryDebounceTimer:](self, "setSynchronizeWithPrimaryDebounceTimer:", v30);

  -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDelegate:", self);

  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDelegateQueue:", v32);

  if (v3)
  {
    -[HMDAccessoryBulletinNotificationManager setCurrentPrimary:](self, "setCurrentPrimary:", 0);
    v34 = objc_msgSend(v22, "isCurrentDeviceConfirmedPrimaryResident");
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v34)
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v39;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Configuring as primary resident", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
      -[HMDAccessoryBulletinNotificationManager workQueue](v36, "workQueue");
      v40 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__HMDAccessoryBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = v36;
      dispatch_async(v40, block);

    }
    else
    {
      if (v38)
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Configuring as non-primary resident", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v35);
    }
  }

}

- (id)bulletinBoardNotificationForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  HMDBulletinBoardNotification *v17;
  HMDBulletinBoardNotification *v18;
  void *v19;
  _BOOL4 v20;
  HMDBulletinBoardNotificationServiceGroup *v21;
  _Unwind_Exception *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  HMDAccessoryBulletinNotificationManager *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    v23 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v54, 8);
    _Unwind_Resume(v23);
  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__175964;
  v52 = __Block_byref_object_dispose__175965;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__175964;
  v46 = __Block_byref_object_dispose__175965;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__175964;
  v40 = __Block_byref_object_dispose__175965;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __79__HMDAccessoryBulletinNotificationManager_bulletinBoardNotificationForService___block_invoke;
  v27 = &unk_24E78CFB8;
  v14 = v6;
  v28 = v14;
  v15 = v4;
  v29 = v15;
  v16 = v13;
  v30 = v16;
  v31 = self;
  v32 = &v54;
  v33 = &v48;
  v34 = &v42;
  v35 = &v36;
  objc_msgSend(v16, "performBlockAndWait:", &v24);
  v17 = [HMDBulletinBoardNotification alloc];
  v18 = -[HMDBulletinBoardNotification initWithService:enabled:condition:](v17, "initWithService:enabled:condition:", v15, *((unsigned __int8 *)v55 + 24), v49[5], v24, v25, v26, v27);
  objc_msgSend(v15, "type");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:](HMDBulletinBoardNotification, "supportsBulletinNotificationGroup:", v19);

  if (v20)
  {
    v21 = -[HMDBulletinBoardNotificationServiceGroup initWithBulletinBoardNotification:]([HMDBulletinBoardNotificationServiceGroup alloc], "initWithBulletinBoardNotification:", v18);
    -[HMDBulletinBoardNotification setNotificationServiceGroup:](v18, "setNotificationServiceGroup:", v21);
    -[HMDBulletinBoardNotificationServiceGroup setAssociatedServiceUUIDs:](v21, "setAssociatedServiceUUIDs:", v37[5]);
    -[HMDBulletinBoardNotificationServiceGroup setCameraProfileUUIDs:](v21, "setCameraProfileUUIDs:", v43[5]);

  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v18;
}

- (void)enableBulletinForService:(id)a3 conditions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDAccessoryBulletinNotificationManager *v25;
  SEL v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  HMDAccessoryBulletinNotificationManager *v33;
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v11, "backingStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __90__HMDAccessoryBulletinNotificationManager_enableBulletinForService_conditions_completion___block_invoke;
    v29[3] = &unk_24E799C60;
    v30 = v12;
    v31 = v8;
    v32 = v19;
    v33 = self;
    v34 = v9;
    v35 = v10;
    v20 = v9;
    v21 = v10;
    v22 = v19;
    v23 = v8;
    v24 = v12;
    objc_msgSend(v22, "performBlock:", v29);

  }
  else
  {
    v25 = (HMDAccessoryBulletinNotificationManager *)_HMFPreconditionFailure();
    -[HMDAccessoryBulletinNotificationManager disableBulletinForService:completion:](v25, v26, v27, v28);
  }
}

- (void)disableBulletinForService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  HMDAccessoryBulletinNotificationManager *v20;
  SEL v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  HMDAccessoryBulletinNotificationManager *v27;
  id v28;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v8, "backingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __80__HMDAccessoryBulletinNotificationManager_disableBulletinForService_completion___block_invoke;
    v24[3] = &unk_24E79B3F0;
    v25 = v6;
    v26 = v16;
    v27 = self;
    v28 = v7;
    v17 = v7;
    v18 = v16;
    v19 = v6;
    objc_msgSend(v18, "performBlock:", v24);

  }
  else
  {
    v20 = (HMDAccessoryBulletinNotificationManager *)_HMFPreconditionFailure();
    -[HMDAccessoryBulletinNotificationManager updateServiceGroup:completion:](v20, v21, v22, v23);
  }
}

- (void)updateServiceGroup:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  HMDAccessoryBulletinNotificationManager *v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bulletinBoardNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v8, "backingStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __73__HMDAccessoryBulletinNotificationManager_updateServiceGroup_completion___block_invoke;
    v21[3] = &unk_24E799A68;
    v22 = v10;
    v23 = v18;
    v24 = self;
    v25 = v6;
    v26 = v7;
    v19 = v18;
    objc_msgSend(v19, "performBlock:", v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      (*((void (**)(id, void *))v7 + 2))(v7, v20);

  }
}

- (void)updateRegistrationsWithEnabledCharacteristics:(id)a3 disabledCharacteristics:(id)a4 conditions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  HMDAccessoryBulletinNotificationManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  HMDAccessoryBulletinNotificationManager *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke;
  v41[3] = &unk_24E78CFE0;
  v16 = v14;
  v42 = v16;
  v17 = v12;
  v43 = v17;
  v32 = v10;
  objc_msgSend(v10, "na_map:", v41);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2;
  v39[3] = &unk_24E78D008;
  v19 = v16;
  v40 = v19;
  objc_msgSend(v11, "na_map:", v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v24;
    v46 = 2112;
    v47 = v18;
    v48 = 2112;
    v49 = v20;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic registrations enable: %@ disable: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v19, "backingStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "managedObjectContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_32;
  v33[3] = &unk_24E799A68;
  v34 = v18;
  v35 = v27;
  v36 = v20;
  v37 = v22;
  v38 = v13;
  v28 = v13;
  v29 = v20;
  v30 = v27;
  v31 = v18;
  objc_msgSend(v30, "performBlock:", v33);

}

- (id)accessoryBulletinNotificationRegistrationsForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  HMDAccessoryBulletinNotificationManager *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__175964;
  v19 = __Block_byref_object_dispose__175965;
  v20 = (id)MEMORY[0x24BDBD1A8];
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke;
  v11[3] = &unk_24E79C0A8;
  v8 = v4;
  v12 = v8;
  v13 = self;
  v14 = &v15;
  objc_msgSend(v7, "unsafeSynchronousBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)characteristicsByDestinationForCharacteristics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke;
  v10[3] = &unk_24E78D0A8;
  v10[4] = self;
  objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (id)bulletinCharacteristicsFromChangedCharacteristics:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryBulletinNotificationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryBulletinNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryBulletinNotificationManager *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  HMDAccessoryBulletinNotificationManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDAccessoryBulletinNotificationManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  HMDAccessoryBulletinNotificationManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMDAccessoryBulletinNotificationManager *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDAccessoryBulletinNotificationManager *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  HMDAccessoryBulletinNotificationManager *v67;
  NSObject *v68;
  void *v69;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  HMDAccessoryBulletinNotificationManager *v76;
  uint64_t v77;
  id obj;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v91 = v11;
    v92 = 2112;
    v93 = v6;
    v94 = 2112;
    v95 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Filtering bulletin characteristics from changed characteristics: %@ message: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v6, "count"))
  {
    -[HMDAccessoryBulletinNotificationManager home](v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isCurrentDeviceConfirmedPrimaryResident"))
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v9;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@We are the primary, evaluating registrations directly", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      -[HMDAccessoryBulletinNotificationManager _characteristicsWithPassingLocalRegistrationForCharacteristics:](v15, "_characteristicsWithPassingLocalRegistrationForCharacteristics:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v91 = v22;
        v92 = 2112;
        v93 = v18;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Characteristics to show bulletins for: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v23 = v18;
      v24 = v23;
      goto LABEL_55;
    }
    if (!v7)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v47 = v6;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v81;
        while (2)
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v81 != v50)
              objc_enumerationMutation(v47);
            objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "accessory");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v52, "isSecuritySessionOpen"))
            {
              v61 = (void *)MEMORY[0x227676638]();
              v62 = v9;
              HMFGetOSLogHandle();
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "shortDescription");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v91 = v64;
                v92 = 2112;
                v93 = v65;
                _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Nil message & not primary, directly connected to accessory: %@, should fall back to legacy evaluation", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v61);

              goto LABEL_54;
            }

          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
          if (v49)
            continue;
          break;
        }
      }

      v53 = (void *)MEMORY[0x227676638]();
      v54 = v9;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v56;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Nil message & not primary, should not show bulletins", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v53);
      v23 = (id)MEMORY[0x24BDBD1A8];
      v24 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_55;
    }
    objc_msgSend(v7, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", CFSTR("kCharacterisiticsChangedInternalNotificationKey"));

    if ((v26 & 1) != 0)
    {
      -[HMDAccessoryBulletinNotificationManager _updateReasonsByCharacteristicFromMessage:](v9, "_updateReasonsByCharacteristicFromMessage:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        v71 = v13;
        v72 = v7;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v73 = v6;
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        obj = v6;
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
        if (v79)
        {
          v28 = *(_QWORD *)v85;
          v75 = v27;
          v76 = v9;
          v77 = *(_QWORD *)v85;
          do
          {
            for (j = 0; j != v79; ++j)
            {
              if (*(_QWORD *)v85 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
              objc_msgSend(v27, "objectForKey:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "unsignedIntegerValue");
              objc_msgSend(v30, "service");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "bulletinBoardNotification");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "isEnabled");

              if (v35)
              {
                v36 = (void *)MEMORY[0x227676638]();
                v37 = v9;
                HMFGetOSLogHandle();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "shortDescription");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v91 = v39;
                  v92 = 2112;
                  v93 = v40;
                  _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Notification is enabled for characteristic %@", buf, 0x16u);

                  v27 = v75;
                  v9 = v76;
                }

                objc_autoreleasePoolPop(v36);
                objc_msgSend(v30, "accessory");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v41, "isSecuritySessionOpen")
                  && objc_msgSend(v30, "isNotificationEnabled"))
                {
                  v42 = (void *)MEMORY[0x227676638]();
                  v43 = v37;
                  HMFGetOSLogHandle();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "shortDescription");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v91 = v45;
                    v92 = 2112;
                    v93 = v46;
                    _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Directly connected to accessory: %@ and notification enabled, ignoring remote characteristic change", buf, 0x16u);

                    v9 = v76;
                    v27 = v75;
                  }

                  objc_autoreleasePoolPop(v42);
                }
                else if ((v32 & 1) != 0)
                {
                  objc_msgSend(v74, "addObject:", v30);
                }

                v28 = v77;
              }

            }
            v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
          }
          while (v79);
        }

        v18 = (void *)objc_msgSend(v74, "copy");
        v7 = v72;
        v6 = v73;
        v13 = v71;
        goto LABEL_8;
      }
      v66 = (void *)MEMORY[0x227676638]();
      v67 = v9;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v69;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Message missing update reasons change, should fall back to legacy evaluation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v66);

    }
    else
    {
      v57 = (void *)MEMORY[0x227676638]();
      v58 = v9;
      HMFGetOSLogHandle();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v91 = v60;
        _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Message is not characteristics changed, should fall back to legacy evaluation", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v57);
    }
LABEL_54:
    v24 = 0;
    v23 = (id)MEMORY[0x24BDBD1A8];
LABEL_55:

    goto LABEL_56;
  }
  v24 = (void *)MEMORY[0x24BDBD1A8];
LABEL_56:

  return v24;
}

- (id)conditionsFromPredicate:(id)a3
{
  return +[HMDNotificationConditionConverter conditionsFromPredicate:](HMDNotificationConditionConverter, "conditionsFromPredicate:", a3);
}

- (void)handleDisabledRegistrations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryBulletinNotificationManager *v9;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleEnabledRegistrations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryBulletinNotificationManager *v9;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleRemovedService:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  HMDAccessoryBulletinNotificationManager *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed service: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryBulletinNotificationManager home](v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backingStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke;
  v18[3] = &unk_24E79A910;
  v19 = v10;
  v20 = v4;
  v21 = v14;
  v22 = v6;
  v15 = v14;
  v16 = v4;
  v17 = v10;
  objc_msgSend(v15, "performBlock:", v18);

}

- (void)handleRemovedAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBulletinNotificationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HMDAccessoryBulletinNotificationManager *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed accessory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager home](v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke;
  v18[3] = &unk_24E79AD20;
  v19 = v9;
  v20 = v13;
  v21 = v6;
  v22 = v4;
  v23 = v12;
  v14 = v12;
  v15 = v4;
  v16 = v13;
  v17 = v9;
  objc_msgSend(v14, "unsafeSynchronousBlock:", v18);

}

- (id)_devicesToNotifyForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager accessoryBulletinNotificationRegistrationsForCharacteristic:](self, "accessoryBulletinNotificationRegistrationsForCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__HMDAccessoryBulletinNotificationManager__devicesToNotifyForCharacteristic___block_invoke;
  v11[3] = &unk_24E78D148;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "na_each:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (id)_characteristicsWithPassingLocalRegistrationForCharacteristics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  HMDAccessoryBulletinNotificationManager *v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __106__HMDAccessoryBulletinNotificationManager__characteristicsWithPassingLocalRegistrationForCharacteristics___block_invoke;
  v13 = &unk_24E791F48;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "na_each:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

- (id)_updateReasonsByCharacteristicFromMessage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  id obj;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
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
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v47, "setNumberStyle:", 1);
  v33 = v3;
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("kCharacteristicNotificationsKey"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v58;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v58 != v34)
          objc_enumerationMutation(obj);
        v39 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v4);
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
        -[HMDAccessoryBulletinNotificationManager home](self, "home");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)v6;
        objc_msgSend(v7, "accessoryWithUUID:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
        v10 = v9;

        v48 = v10;
        if (v10)
        {
          objc_msgSend(obj, "hmf_dictionaryForKey:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v54;
            v40 = *(_QWORD *)v54;
            v41 = v11;
            do
            {
              v15 = 0;
              v42 = v13;
              do
              {
                if (*(_QWORD *)v54 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v15);
                objc_msgSend(v11, "hmf_dictionaryForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "numberFromString:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "findService:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                  v20 = v19 == 0;
                else
                  v20 = 1;
                if (!v20)
                {
                  v43 = v19;
                  v44 = v17;
                  v45 = v15;
                  v51 = 0u;
                  v52 = 0u;
                  v49 = 0u;
                  v50 = 0u;
                  v21 = v17;
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v50;
                    do
                    {
                      for (i = 0; i != v23; ++i)
                      {
                        if (*(_QWORD *)v50 != v24)
                          objc_enumerationMutation(v21);
                        v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                        objc_msgSend(v47, "numberFromString:", v26);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v48, "findCharacteristic:forService:", v27, v18);
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v28)
                        {
                          objc_msgSend(v21, "hmf_dictionaryForKey:", v26);
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v29, "objectForKey:", CFSTR("kCharacteristicValueUpdateReasonKey"));
                          v30 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v30)
                          {
                            objc_msgSend(v29, "hmf_numberForKey:", CFSTR("kCharacteristicValueUpdateReasonKey"));
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v46, "setObject:forKey:", v31, v28);

                          }
                        }

                      }
                      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
                    }
                    while (v23);
                  }

                  v14 = v40;
                  v11 = v41;
                  v13 = v42;
                  v19 = v43;
                  v17 = v44;
                  v15 = v45;
                }

                ++v15;
              }
              while (v15 != v13);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
            }
            while (v13);
          }

        }
        v4 = v39 + 1;
      }
      while (v39 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v36);
  }

  return v46;
}

- (void)_handleAccessoryBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  HMDAccessoryBulletinNotificationManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDAccessoryBulletinNotificationManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "registration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hapAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __100__HMDAccessoryBulletinNotificationManager__handleAccessoryBulletinNotificationRegistration_removed___block_invoke;
  v32 = &unk_24E7928E0;
  v10 = v7;
  v33 = v10;
  objc_msgSend(v9, "na_firstObjectPassingTest:", &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "characteristicInstanceID", v29, v30, v31, v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmdCharacteristicForInstanceId:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = !v4;
      v34 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", v18, v19, CFSTR("com.apple.HomeKitDaemon.bulletinNotificationManager"));

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "characteristicInstanceID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v27;
        v37 = 2112;
        v38 = v28;
        v39 = 2112;
        v40 = v11;
        v41 = 2112;
        v42 = v10;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to find characteristic with instance ID: %@ on accessory: %@ and registration: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v24);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638](v12, v13, v14, v15);
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v23;
      v37 = 2112;
      v38 = v10;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP Accessory from registration: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)_handleDeviceBecamePrimary
{
  NSObject *v3;
  void *v4;
  HMDAccessoryBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryBulletinNotificationManager setCurrentPrimary:](v5, "setCurrentPrimary:", 1);
  -[HMDAccessoryBulletinNotificationManager accessoryRegistrations](v5, "accessoryRegistrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__HMDAccessoryBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke;
  v9[3] = &unk_24E78D0D0;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);

}

- (void)_handleDeviceBecameNotPrimary
{
  NSObject *v3;
  void *v4;
  HMDAccessoryBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became non-primary resident", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryBulletinNotificationManager setCurrentPrimary:](v5, "setCurrentPrimary:", 0);
  -[HMDAccessoryBulletinNotificationManager accessoryRegistrations](v5, "accessoryRegistrations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__HMDAccessoryBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke;
  v9[3] = &unk_24E78D0D0;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);

}

- (void)requestSynchronizeRegistrations
{
  void *v3;
  HMDAccessoryBulletinNotificationManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "isRunning");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](v4, "synchronizeWithPrimaryDebounceTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  NSObject *v3;
  void *v4;
  HMDAccessoryBulletinNotificationManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  HMDAccessoryBulletinNotificationManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDAccessoryBulletinNotificationManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAccessoryBulletinNotificationManager *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  __int128 *v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 *p_buf;
  uint8_t v50[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryBulletinNotificationManager source](v5, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__175964;
    v59 = __Block_byref_object_dispose__175965;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBulletinNotificationManager home](v5, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v46[3] = &unk_24E79B5F8;
    v46[4] = v5;
    v47 = v8;
    v13 = v11;
    v48 = v13;
    p_buf = &buf;
    objc_msgSend(v13, "unsafeSynchronousBlock:", v46);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__175964;
    v44 = __Block_byref_object_dispose__175965;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v37[0] = v12;
    v37[1] = 3221225472;
    v37[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_73;
    v37[3] = &unk_24E79C0A8;
    v37[4] = v5;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v14;
    v39 = &v40;
    v15 = (void *)MEMORY[0x227676638](objc_msgSend(v14, "performBlockAndWait:", v37));
    v16 = v5;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v41[5];
      v20 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v50 = 138543874;
      v51 = v18;
      v52 = 2112;
      v53 = v19;
      v54 = 2112;
      v55 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Enabled local characteristic registrations: %@ remote characteristic registrations: %@", v50, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v41[5];
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_76;
    v34[3] = &unk_24E78D1E8;
    v36 = &buf;
    v23 = v21;
    v35 = v23;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "hmf_isEmpty") && objc_msgSend(v24, "hmf_isEmpty"))
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v16;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v50 = 138543362;
        v51 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v50, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      v29 = (void *)objc_msgSend(v23, "copy");
      -[HMDAccessoryBulletinNotificationManager _updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:](v16, "_updateRegistrationsOnPrimaryWithEnabledRegistrations:disabledRegistrations:", v29, v24);

    }
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = v5;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
  }

}

- (void)_handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryBulletinNotificationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  HMDAccessoryBulletinNotificationManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification", (uint8_t *)&v17, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryBulletinNotificationManager requestSynchronizeRegistrations](v7, "requestSynchronizeRegistrations");
  -[HMDAccessoryBulletinNotificationManager home](v7, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCurrentDeviceConfirmedPrimaryResident");

  v12 = -[HMDAccessoryBulletinNotificationManager currentPrimary](v7, "currentPrimary");
  if (v11)
  {
    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v7;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@We are already the primary", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      -[HMDAccessoryBulletinNotificationManager _handleDeviceBecamePrimary](v7, "_handleDeviceBecamePrimary");
    }
  }
  else if (v12)
  {
    -[HMDAccessoryBulletinNotificationManager _handleDeviceBecameNotPrimary](v7, "_handleDeviceBecameNotPrimary");
  }

}

- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryBulletinNotificationManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryBulletinNotificationManager requestSynchronizeRegistrations](v7, "requestSynchronizeRegistrations");

}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAccessoryBulletinNotificationManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBulletinNotificationManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDAccessoryBulletinNotificationManager *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v12;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDAccessoryBulletinNotificationManager home](v10, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "bulletinNotificationsSupported") & 1) != 0)
  {
    -[HMDAccessoryBulletinNotificationManager source](v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __119__HMDAccessoryBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_24E792CD8;
      v24[4] = v10;
      v25 = v14;
      v26 = v6;
      v27 = v7;
      objc_msgSend(v13, "updateBulletinRegistrationOnPrimaryResidentWithSource:enableRegistrations:disableRegistration:completionHandler:", v25, v26, v27, v24);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v10;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (id)currentHomeAccessoryUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_81_175952);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mkfLocalCharacteristicRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDAccessoryBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager currentHomeAccessoryUUIDs](self, "currentHomeAccessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCharacteristicRegistration fetchRequest](MKFLocalBulletinCharacteristicRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __104__HMDAccessoryBulletinNotificationManager__mkfLocalCharacteristicRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_24E78D230;
    v16 = v5;
    objc_msgSend(v7, "na_filter:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local characteristic registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_mkfLocalServiceRegistrationsWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDAccessoryBulletinNotificationManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager currentHomeAccessoryUUIDs](self, "currentHomeAccessoryUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchRequest](MKFLocalBulletinServiceRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __97__HMDAccessoryBulletinNotificationManager__mkfLocalServiceRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_24E78D258;
    v16 = v5;
    objc_msgSend(v7, "na_filter:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service registrations, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (id)_accessoryRegistrationFromMKFRegistrationSafe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryBulletinNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessoryBulletinNotificationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAccessoryBulletinNotificationManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAccessoryBulletinNotificationManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDAccessoryBulletinNotificationManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDAccessoryBulletinNotificationManager *v35;
  NSObject *v36;
  void *v37;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v6, "instanceID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v8, "instanceID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v9, "modelID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromMKFRegistration:](HMDBulletinNotificationRegistrationUtilities, "accessoryRegistrationFromMKFRegistration:", v4);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v34 = (void *)MEMORY[0x227676638]();
              v35 = self;
              HMFGetOSLogHandle();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                HMFGetLogIdentifier();
                v39 = v34;
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v41 = v37;
                v42 = 2112;
                v43 = v4;
                _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_FAULT, "%{public}@Nil accessoryUUID for working store registration: %@", buf, 0x16u);

                v34 = v39;
              }

              objc_autoreleasePoolPop(v34);
              v13 = 0;
            }

          }
          else
          {
            v30 = (void *)MEMORY[0x227676638]();
            v31 = self;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v41 = v33;
              v42 = 2112;
              v43 = v4;
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_FAULT, "%{public}@Nil serviceInstanceID for working store registration: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v30);
            v13 = 0;
          }

        }
        else
        {
          v26 = (void *)MEMORY[0x227676638]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v29;
            v42 = 2112;
            v43 = v4;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_FAULT, "%{public}@Nil characteristicInstanceID for working store registration: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          v13 = 0;
        }

      }
      else
      {
        v22 = (void *)MEMORY[0x227676638]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v25;
          v42 = 2112;
          v43 = v4;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfHAPAccessory for working store registration: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v22);
        v13 = 0;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v21;
        v42 = 2112;
        v43 = v4;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfService for working store registration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v13 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v17;
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfCharacteristic for working store registration: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__HMDAccessoryBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__HMDAccessoryBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDAccessoryBulletinNotificationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBulletinNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAccessoryBulletinNotificationManager synchronizeWithPrimaryDebounceTimer](self, "synchronizeWithPrimaryDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    -[HMDAccessoryBulletinNotificationManager _synchronizeLocalRegistrationsWithPrimaryResident](self, "_synchronizeLocalRegistrationsWithPrimaryResident");
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessoryBulletinNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)currentPrimary
{
  return self->_currentPrimary;
}

- (void)setCurrentPrimary:(BOOL)a3
{
  self->_currentPrimary = a3;
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

uint64_t __91__HMDAccessoryBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCurrentDeviceOrAccountUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __83__HMDAccessoryBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePrimaryResidentUpdateNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__HMDAccessoryBulletinNotificationManager__mkfLocalServiceRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __104__HMDAccessoryBulletinNotificationManager__mkfLocalCharacteristicRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "accessoryModelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __68__HMDAccessoryBulletinNotificationManager_currentHomeAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __119__HMDAccessoryBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v19 = 138544386;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v3;
      v12 = "%{public}@Unable to update characteristic registrations on primary resident: source: %@, [enabled : %@], [di"
            "sabled : %@], error: %@";
      v13 = v7;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 52;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, (uint8_t *)&v19, v15);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = 138544130;
    v20 = v8;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v12 = "%{public}@Updating characteristic registrations with primary resident was successful, source: %@, [enabled: %@"
          "], [disabled: %@]";
    v13 = v7;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 42;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[6];

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_characteristicBulletinRegistrationsForSource:context:", v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v7[3] = &unk_24E78D170;
  v5 = *(_QWORD *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = v5;
  objc_msgSend(v6, "na_each:", v7);

}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_73(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCharacteristicRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_74;
  v3[3] = &unk_24E78D198;
  v3[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "na_each:", v3);

}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_77;
  v7[3] = &unk_24E78D1C0;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

uint64_t __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_77(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v3, "serviceInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "serviceInstanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v3, "characteristicInstanceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "characteristicInstanceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

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

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_74(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "accessoryRegistrationFromLocalRegistration:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_accessoryRegistrationFromMKFRegistrationSafe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v4, "registration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store characteristic registration: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

uint64_t __72__HMDAccessoryBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryBulletinNotificationRegistration:removed:", a2, 1);
}

uint64_t __69__HMDAccessoryBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryBulletinNotificationRegistration:removed:", a2, 0);
}

uint64_t __100__HMDAccessoryBulletinNotificationManager__handleAccessoryBulletinNotificationRegistration_removed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __106__HMDAccessoryBulletinNotificationManager__characteristicsWithPassingLocalRegistrationForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bulletinBoardNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEnabled"))
  {
    objc_msgSend(v4, "condition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDNotificationConditionConverter conditionsFromPredicate:](HMDNotificationConditionConverter, "conditionsFromPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "evaluator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "conditionsPass:registrationUser:", v6, v9);

    if (v10)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
}

void __77__HMDAccessoryBulletinNotificationManager__devicesToNotifyForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint32_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "registration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v5;
      v28 = "%{public}@Unable to evaluate registration: %@, no matching user for source: %@";
      v29 = v26;
      v30 = OS_LOG_TYPE_ERROR;
      v31 = 32;
LABEL_13:
      _os_log_impl(&dword_2218F0000, v29, v30, v28, buf, v31);

    }
LABEL_14:

    objc_autoreleasePoolPop(v24);
    goto LABEL_15;
  }
  if ((objc_msgSend(v8, "isAccessCurrentlyAllowedBySchedule") & 1) == 0)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v27;
      v28 = "%{public}@Cannot send the notification as the user is outside schedule";
      v29 = v26;
      v30 = OS_LOG_TYPE_INFO;
      v31 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "evaluator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "conditionsPass:registrationUser:", v10, v8);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v32 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 2112;
    v38 = v3;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Condition(s) passed: %@ for registration: %@", buf, 0x20u);

    v4 = v32;
  }

  objc_autoreleasePoolPop(v12);
  if (v11)
  {
    objc_msgSend(v3, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v22;
      v35 = 2112;
      v36 = v18;
      v37 = 2112;
      v38 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding remote device: %@ to notify for updated characteristic: %@ ", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);

  }
LABEL_15:

}

void __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[MKFLocalBulletinAccessoryRegistration fetchRequest](MKFLocalBulletinAccessoryRegistration, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("accessoryModelID"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);
  objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke_52;
    v24[3] = &unk_24E78D120;
    v5 = *(void **)(a1 + 56);
    v24[4] = *(_QWORD *)(a1 + 48);
    v25 = v5;
    v26 = *(id *)(a1 + 40);
    objc_msgSend(v4, "na_each:", v24);
    v6 = *(void **)(a1 + 64);
    v23 = 0;
    objc_msgSend(v6, "save:", &v23);
    v7 = v23;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v2;
      v13 = v7;
      v14 = v8;
      v15 = v3;
      v16 = *(_QWORD *)(a1 + 56);
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v11;
      v29 = 2112;
      v30 = v16;
      v3 = v15;
      v8 = v14;
      v7 = v13;
      v2 = v12;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing local registrations for removed accessory: %@ was successful: %@ error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not find any local registrations to remove for removed accessory: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

void __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke_52(uint64_t a1, void *a2)
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
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing local registration: %@ for removed accessory: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v3);

}

void __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  objc_msgSend(a1[5], "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v2, v3, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[5], "characteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke_44;
    v22[3] = &unk_24E78D0F8;
    v23 = a1[4];
    v24 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    v25 = v6;
    v26 = v7;
    objc_msgSend(v5, "na_each:", v22);

    objc_msgSend(a1[6], "deleteObject:", v4);
    v8 = a1[6];
    v21 = 0;
    objc_msgSend(v8, "save:", &v21);
    v9 = v21;
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1[7];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[5];
      HMFBooleanToString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v28 = v13;
      v29 = 2112;
      v30 = v4;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      v35 = 2112;
      v36 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing local service registration: %@ for removed service: %@ was successful: %@ error: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(a1[6], "reset");

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1[7];
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a1[5];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to match removed service: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

void __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:](MKFLocalBulletinCharacteristicRegistration, "fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:", v4, v5, v6, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v15 = 138544130;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing local characteristic registration: %@ for characteristic: %@ on removed service: %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 48), "deleteObject:", v7);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did not find local characteristic registration to remove for characteristic: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

uint64_t __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke_2;
  v3[3] = &unk_24E78D0D0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryBulletinNotificationRegistration:removed:", a2, 0);
}

uint64_t __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke_2;
  v3[3] = &unk_24E78D0D0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAccessoryBulletinNotificationRegistration:removed:", a2, 1);
}

id __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_devicesToNotifyForCharacteristic:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke_2;
  v13[3] = &unk_24E78D080;
  v8 = v6;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  objc_msgSend(v7, "na_each:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "remoteDestinationString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMCContext findServiceWithModelID:](HMCContext, "findServiceWithModelID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "instanceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMCContext findCharacteristicWithInstanceID:service:](HMCContext, "findCharacteristicWithInstanceID:service:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "bulletinRegistrations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke_38;
        v22[3] = &unk_24E78CF50;
        v22[4] = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "na_map:", v22);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch service for characteristic: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

id __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_accessoryRegistrationFromMKFRegistrationSafe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

HMDAccessoryBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessoryBulletinNotificationRegistration *v13;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDAccessoryBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:]([HMDAccessoryBulletinNotificationRegistration alloc], "initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:", v9, v11, v12, *(_QWORD *)(a1 + 40));

    return v13;
  }
  else
  {
    v15 = _HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2(v15);
  }
}

HMDAccessoryBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessoryBulletinNotificationRegistration *v13;
  void *v14;
  HMDAccessoryBulletinNotificationRegistration *v15;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "instanceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HMDAccessoryBulletinNotificationRegistration alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDAccessoryBulletinNotificationRegistration initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:](v13, "initWithAccessoryUUID:serviceInstanceID:characteristicInstanceID:conditions:", v9, v11, v12, v14);

    return v15;
  }
  else
  {
    v17 = _HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_32(v17);
  }
}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  int v32;
  _QWORD block[5];
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2_34;
  v39[3] = &unk_24E78D030;
  v5 = *(void **)(a1 + 32);
  v40 = *(id *)(a1 + 40);
  v6 = v2;
  v41 = v6;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_3;
  v35[3] = &unk_24E78D058;
  v7 = *(void **)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  v36 = v8;
  v37 = v9;
  v10 = v3;
  v38 = v10;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);
  if (objc_msgSend(v6, "hmf_isEmpty") && objc_msgSend(v10, "hmf_isEmpty"))
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v43 = v14;
      v44 = 2112;
      v45 = v15;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic registrations enable: %@ disable: %@ resulted in no changes to local store, not saving and not messaging primary", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
      (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);
  }
  else
  {
    v18 = *(void **)(a1 + 40);
    v34 = 0;
    v19 = objc_msgSend(v18, "save:", &v34);
    v20 = v34;
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = v6;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 48);
      HMFBooleanToString();
      v32 = v19;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v43 = v30;
      v44 = 2112;
      v45 = v25;
      v10 = v24;
      v46 = 2112;
      v47 = v26;
      v4 = MEMORY[0x24BDAC760];
      v48 = 2112;
      v49 = v27;
      v50 = 2112;
      v51 = v20;
      v6 = v31;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating local characteristic registrations enable: %@ disable: %@ was successful: %@ error: %@", buf, 0x34u);

      v19 = v32;
    }

    objc_autoreleasePoolPop(v21);
    objc_msgSend(*(id *)(a1 + 40), "reset");
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 56), "workQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_37;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 56);
      dispatch_async(v28, block);

    }
    v29 = *(_QWORD *)(a1 + 64);
    if (v29)
      (*(void (**)(uint64_t, id))(v29 + 16))(v29, v20);

  }
}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2_34(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "serviceInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "characteristicInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:](MKFLocalBulletinCharacteristicRegistration, "fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:", v3, v4, v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 == 0;
  if (!v6)
  {
    v8 = (void *)MEMORY[0x24BDBB658];
    +[MKFLocalBulletinCharacteristicRegistration entity](MKFLocalBulletinCharacteristicRegistration, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertNewObjectForEntityForName:inManagedObjectContext:", v10, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "accessoryUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessoryModelID:", v11);

    objc_msgSend(v22, "serviceInstanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServiceInstanceID:", objc_msgSend(v12, "longLongValue"));

    objc_msgSend(v22, "characteristicInstanceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCharacteristicInstanceID:", objc_msgSend(v13, "longLongValue"));

  }
  if ((objc_msgSend(v6, "enabled") & 1) == 0)
  {
    v7 = 1;
    objc_msgSend(v6, "setEnabled:", 1);
  }
  objc_msgSend(v6, "conditions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(v22, "conditions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqualToSet:", v17);

  if ((v18 & 1) != 0)
  {
    if (!v7)
      goto LABEL_14;
  }
  else
  {
    if (v14)
      objc_msgSend(v6, "removeConditions:", v14);
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v22, "conditions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v6, v19, v20);

  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
LABEL_14:

}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:](MKFLocalBulletinCharacteristicRegistration, "fetchCharacteristicRegistrationForAccessoryUUID:serviceInstanceID:characteristicInstanceID:managedObjectContext:", v4, v5, v6, a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v7, "removeConditions:", v8);
    objc_msgSend(a1[4], "deleteObject:", v7);
    objc_msgSend(a1[6], "addObject:", v3);

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1[5];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Did not find local registration to disable matching registration: %@, skipping", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

uint64_t __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestSynchronizeRegistrations");
}

void __73__HMDAccessoryBulletinNotificationManager_updateServiceGroup_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v3, v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "bulletinServiceGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v38 = v10;
        v39 = 2112;
        v40 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Creating service group for existing service: %@ registration", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      v12 = (void *)MEMORY[0x24BDBB658];
      +[MKFLocalBulletinServiceGroup entity](MKFLocalBulletinServiceGroup, "entity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertNewObjectForEntityForName:inManagedObjectContext:", v14, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setBulletinServiceGroup:", v6);
      objc_msgSend(v6, "setBulletinServiceRegistration:", v5);
    }
    objc_msgSend(*(id *)(a1 + 56), "associatedServiceUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssociatedServiceUUIDs:", v15);

    objc_msgSend(*(id *)(a1 + 56), "cameraProfileUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCameraProfileUUIDs:", v16);

    v17 = *(void **)(a1 + 40);
    v36 = 0;
    objc_msgSend(v17, "save:", &v36);
    v18 = v36;
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "associatedServiceUUIDs");
      v35 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "cameraProfileUUIDs");
      v34 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v38 = v22;
      v39 = 2112;
      v40 = v23;
      v41 = 2112;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = v26;
      v47 = 2112;
      v48 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating local service group %@ with associated service UUIDs: %@ camera profile UUIDs: %@ was successful: %@ error: %@", buf, 0x3Eu);

      v19 = v34;
      v5 = v35;

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 40), "reset");
    v27 = *(_QWORD *)(a1 + 64);
    if (v27)
      (*(void (**)(uint64_t, id))(v27 + 16))(v27, v18);

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v38 = v31;
      v39 = 2112;
      v40 = v32;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration matching service group: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v33 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v6);
  }

}

void __80__HMDAccessoryBulletinNotificationManager_disableBulletinForService_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v3, v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to disable matching service: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
      (*(void (**)(uint64_t, id))(v20 + 16))(v20, v7);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "enabled"))
  {
    objc_msgSend(v5, "setEnabled:", 0);
    v6 = *(void **)(a1 + 40);
    v27 = 0;
    objc_msgSend(v6, "save:", &v27);
    v7 = v27;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Disabling local service registration: %@ was successful: %@ error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 40), "reset");
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
LABEL_11:

    goto LABEL_16;
  }
  v21 = (void *)MEMORY[0x227676638]();
  v22 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v24;
    v30 = 2112;
    v31 = v25;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Disabling local service registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
  v26 = *(_QWORD *)(a1 + 56);
  if (v26)
    (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, 0);
LABEL_16:

}

void __90__HMDAccessoryBulletinNotificationManager_enableBulletinForService_conditions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v2, v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "enabled");
    if ((v5 & 1) == 0)
      objc_msgSend(v4, "setEnabled:", 1);
    objc_msgSend(v4, "conditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "isEqualToSet:", *(_QWORD *)(a1 + 64)) & 1) != 0)
      {
        v8 = v9;
        goto LABEL_12;
      }
      objc_msgSend(v4, "removeConditions:", v6);
      v8 = v9;
    }
    else if ((objc_msgSend(v7, "isEqualToSet:", *(_QWORD *)(a1 + 64)) & 1) != 0)
    {
LABEL_12:
      if (v5)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = *(id *)(a1 + 56);
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v19;
          v36 = 2112;
          v37 = v20;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Enabling local service registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        v21 = *(_QWORD *)(a1 + 72);
        if (v21)
          (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
LABEL_24:

        goto LABEL_25;
      }
LABEL_19:
      v23 = *(void **)(a1 + 48);
      v33 = 0;
      objc_msgSend(v23, "save:", &v33);
      v24 = v33;
      v25 = (void *)MEMORY[0x227676638]();
      v26 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = v8;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        v38 = 2112;
        v39 = v30;
        v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Enabling local service registration: %@ was successful: %@ error: %@", buf, 0x2Au);

        v8 = v32;
      }

      objc_autoreleasePoolPop(v25);
      objc_msgSend(*(id *)(a1 + 48), "reset");
      v31 = *(_QWORD *)(a1 + 72);
      if (v31)
        (*(void (**)(uint64_t, id))(v31 + 16))(v31, v24);

      goto LABEL_24;
    }
    v22 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    goto LABEL_19;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to enable matching service: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v15 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
LABEL_25:

}

void __79__HMDAccessoryBulletinNotificationManager_bulletinBoardNotificationForService___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  char v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v2, v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (isHomePod() && v4)
  {
    if (!objc_msgSend(v4, "enabled"))
    {
LABEL_10:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v4, "enabled");
      +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v4);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predicate");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 56);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(a1 + 40);
        HMFBooleanToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138544386;
        v73 = v27;
        v74 = 2112;
        v75 = v28;
        v76 = 2112;
        v77 = v29;
        v78 = 2112;
        v79 = v30;
        v80 = 2112;
        v81 = v31;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Found local registration: %@ for service: %@, setting enabled: %@ condition: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(*(id *)(a1 + 40), "type");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:](HMDBulletinBoardNotification, "supportsBulletinNotificationGroup:", v32);

      if (v33)
      {
        objc_msgSend(v4, "bulletinServiceGroup");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          objc_msgSend(v34, "cameraProfileUUIDs");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v38 = *(void **)(v37 + 40);
          *(_QWORD *)(v37 + 40) = v36;

          objc_msgSend(v35, "associatedServiceUUIDs");
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = v39;

          v42 = (void *)MEMORY[0x227676638]();
          v43 = *(id *)(a1 + 56);
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = *(void **)(a1 + 40);
            v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
            v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
            *(_DWORD *)buf = 138544386;
            v73 = v45;
            v74 = 2112;
            v75 = v35;
            v76 = 2112;
            v77 = v46;
            v78 = 2112;
            v79 = v47;
            v80 = 2112;
            v81 = v48;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Found local service group: %@ for service: %@ with associatedServiceUUIDs: %@ cameraProfileUUIDs: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v42);
        }

      }
      goto LABEL_29;
    }
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v73 = v8;
      v74 = 2112;
      v75 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing bulletin board notification enabled to NO on HomePod for service: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "setEnabled:", 0);
    v10 = *(void **)(a1 + 48);
    v71 = 0;
    objc_msgSend(v10, "save:", &v71);
    v11 = v71;
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v73 = v15;
      v74 = 2112;
      v75 = v4;
      v76 = 2112;
      v77 = v16;
      v78 = 2112;
      v79 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Saving cleaned up local registration: %@ for service was successful: %@ error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 48), "reset");
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "instanceID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:](MKFLocalBulletinServiceRegistration, "fetchServiceRegistrationForAccessoryUUID:serviceInstanceID:managedObjectContext:", v17, v18, *(_QWORD *)(a1 + 48));
    v19 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v19;
  }
  if (v4)
    goto LABEL_10;
  v49 = (void *)MEMORY[0x227676638]();
  v50 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v73 = v52;
    v74 = 2112;
    v75 = v53;
    _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Did not find any local registrations matching service: %@ for bulletin board notification, creating initial registration now", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v49);
  v54 = (void *)MEMORY[0x24BDBB658];
  +[MKFLocalBulletinServiceRegistration entity](MKFLocalBulletinServiceRegistration, "entity");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "insertNewObjectForEntityForName:inManagedObjectContext:", v56, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryModelID:", v57);

  objc_msgSend(*(id *)(a1 + 40), "instanceID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceInstanceID:", objc_msgSend(v58, "longLongValue"));

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConditions:", v59);

  if (isHomePod())
    goto LABEL_23;
  objc_msgSend(*(id *)(a1 + 40), "type");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:serviceType:](HMDBulletinBoard, "isBulletinSupportedForNonSecureCharacteristicType:serviceType:", 0, v60))
  {

    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 40), "type");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = +[HMDBulletinBoard isCriticalNonSecureServiceType:](HMDBulletinBoard, "isCriticalNonSecureServiceType:", v61);

  if (v62)
  {
LABEL_25:
    v63 = 1;
    goto LABEL_26;
  }
LABEL_23:
  v63 = 0;
LABEL_26:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v63;
  objc_msgSend(v4, "setEnabled:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v64 = *(void **)(a1 + 48);
  v70 = 0;
  objc_msgSend(v64, "save:", &v70);
  v20 = v70;
  v65 = (void *)MEMORY[0x227676638]();
  v66 = *(id *)(a1 + 56);
  HMFGetOSLogHandle();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v73 = v68;
    v74 = 2112;
    v75 = v4;
    v76 = 2112;
    v77 = v69;
    v78 = 2112;
    v79 = v20;
    _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_INFO, "%{public}@Saving initial local registration: %@ for bulletin board notification was successful: %@ error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v65);
  objc_msgSend(*(id *)(a1 + 48), "reset");
LABEL_29:

}

uint64_t __80__HMDAccessoryBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceBecamePrimary");
}

void __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *context;
  void *contexta;
  id v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.BBN.A"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (!v8)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v25;
        v52 = 2112;
        v53 = CFSTR("HMD.BBN.A");
        v54 = 2112;
        v55 = v3;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      goto LABEL_44;
    }
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.BBN.S"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (!v11)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v29;
        v52 = 2112;
        v53 = CFSTR("HMD.BBN.S");
        v54 = 2112;
        v55 = v3;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      goto LABEL_43;
    }
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.BBN.E"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (!v14)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v33;
        v52 = 2112;
        v53 = CFSTR("HMD.BBN.E");
        v54 = 2112;
        v55 = v3;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      goto LABEL_42;
    }
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("HMD.BBN.P"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v16;
      else
        v34 = 0;
      v35 = v34;

      if (!v35)
      {
        context = (void *)MEMORY[0x227676638]();
        v47 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v44;
          v52 = 2112;
          v53 = CFSTR("HMD.BBN.P");
          v54 = 2112;
          v55 = v3;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
      }
      v37 = *(_QWORD *)(a1 + 48);
      v49 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v37, v35, &v49, v44);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v49;
      if (!v38)
      {
        v48 = v39;
        v40 = (void *)MEMORY[0x227676638]();
        v41 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          contexta = v40;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v51 = v43;
          v52 = 2112;
          v53 = CFSTR("HMD.BBN.P");
          v54 = 2112;
          v55 = v3;
          v56 = 2112;
          v57 = v48;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive %@: %@, %@", buf, 0x2Au);

          v40 = contexta;
        }

        objc_autoreleasePoolPop(v40);
        goto LABEL_41;
      }

      v16 = (id)v38;
    }

    v35 = (id)objc_opt_new();
    objc_msgSend(v35, "setAccessoryUUID:", v8);
    objc_msgSend(v35, "setServiceInstanceID:", objc_msgSend(v11, "longLongValue"));
    objc_msgSend(v35, "setPredicate:", v16);
    objc_msgSend(v35, "setEnabled:", objc_msgSend(v14, "BOOLValue"));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v35);
LABEL_41:

LABEL_42:
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v51 = v20;
    v52 = 2112;
    v53 = v3;
    v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object type: %@, %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v17);
LABEL_45:

}

void __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_93(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t v23[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE buf[24];
  void *v28;
  id v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(void **)(a1 + 48);
  v21 = v3;
  v5 = v4;
  v6 = v5;
  if (v2)
  {
    v7 = (void *)MEMORY[0x227676638](objc_msgSend(v5, "hmd_assertIsExecuting"));
    v8 = v2;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating bulletin registrations: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __72__HMDAccessoryBulletinNotificationManager_migrateRegistrations_context___block_invoke;
    v28 = &unk_24E78D2A8;
    v29 = v8;
    v11 = v6;
    v30 = v11;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    if (objc_msgSend(v11, "hasChanges"))
    {
      v22 = 0;
      v12 = objc_msgSend(v11, "hmd_saveWithTransactionAuthor:error:", 7, &v22);
      v13 = v22;
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v8;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if ((v12 & 1) != 0)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v23 = 138543362;
          v24 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated bulletin registrations", v23, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v15, "home");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeBulletinBoardNotificationsMigrationFileFromDisk");

      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v23 = 138543618;
          v24 = v20;
          v25 = 2112;
          v26 = v21;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate bulletin registrations: %@", v23, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(v11, "rollback");
      }

    }
  }

}

void __72__HMDAccessoryBulletinNotificationManager_migrateRegistrations_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  MKFLocalBulletinServiceRegistration *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MKFLocalBulletinServiceRegistration *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  MKFLocalBulletinServiceRegistration *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  MKFLocalBulletinServiceRegistration *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  MKFLocalBulletinServiceRegistration *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2;
  v5 = v2;
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "hmd_assertIsExecuting");
    +[MKFLocalBulletinServiceRegistration fetchRequest](MKFLocalBulletinServiceRegistration, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1758];
    -[MKFLocalBulletinServiceRegistration accessoryUUID](v4, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %lld)"), CFSTR("accessoryModelID"), v9, CFSTR("serviceInstanceID"), -[MKFLocalBulletinServiceRegistration serviceInstanceID](v4, "serviceInstanceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    objc_msgSend(v7, "setResultType:", 1);
    v32 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v7, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (MKFLocalBulletinServiceRegistration *)v32;
    if (!v11)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v3;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch existing registrations: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    if (objc_msgSend(v11, "count"))
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v3;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v20;
        v35 = 2112;
        v36 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Already have a registration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
    }
    else
    {
      v21 = -[MKFLocalBulletinServiceRegistration initWithContext:]([MKFLocalBulletinServiceRegistration alloc], "initWithContext:", v6);
      -[MKFLocalBulletinServiceRegistration accessoryUUID](v4, "accessoryUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFLocalBulletinServiceRegistration setAccessoryModelID:](v21, "setAccessoryModelID:", v22);

      -[MKFLocalBulletinServiceRegistration setServiceInstanceID:](v21, "setServiceInstanceID:", -[MKFLocalBulletinServiceRegistration serviceInstanceID](v4, "serviceInstanceID"));
      if (isHomePod())
        v23 = 0;
      else
        v23 = -[MKFLocalBulletinServiceRegistration enabled](v4, "enabled");
      -[MKFLocalBulletinServiceRegistration setEnabled:](v21, "setEnabled:", v23);
      -[MKFLocalBulletinServiceRegistration predicate](v4, "predicate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "conditionsFromPredicate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:moc:conditions:](HMDBulletinNotificationRegistrationUtilities, "createAndAddLocalConditionsToRegistration:moc:conditions:", v21, v6, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKFLocalBulletinServiceRegistration setConditions:](v21, "setConditions:", v26);

      v27 = (void *)MEMORY[0x227676638]();
      v28 = v3;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = v12;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v30;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Created new registration: %@", buf, 0x16u);

        v12 = v31;
      }

      objc_autoreleasePoolPop(v27);
    }

  }
}

void __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalCharacteristicRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_14_176122);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "accessoryRegistrationFromLocalRegistration:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "users");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_2;
  v21[3] = &unk_24E78CF00;
  v7 = v2;
  v8 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v22 = v7;
  v23 = v8;
  objc_msgSend(v5, "na_each:", v21);

  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v9, "isRestrictedGuestEnabled");

  if ((_DWORD)v5)
  {
    objc_msgSend(v4, "guests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_3;
    v18[3] = &unk_24E78CF28;
    v11 = v16;
    v12 = *(_QWORD *)(a1 + 40);
    v19 = v11;
    v20 = v12;
    objc_msgSend(v10, "na_each:", v18);

  }
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_4;
  v17[3] = &unk_24E78CF50;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v16, "na_map:", v17);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "bulletinRegistrations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_characteristicsRegistrationsFromBulletinRegistrations:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "bulletinRegistrations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_characteristicsRegistrationsFromBulletinRegistrations:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

}

id __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_accessoryRegistrationFromMKFRegistrationSafe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

void __98__HMDAccessoryBulletinNotificationManager__characteristicsRegistrationsFromBulletinRegistrations___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "castIfCharacteristicBulletinRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_mkfLocalServiceRegistrationsWithManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_3_176128);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "enabled"))
  {
    +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:](HMDBulletinNotificationRegistrationUtilities, "serviceRegistrationFromLocalRegistration:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __110__HMDAccessoryBulletinNotificationManager_initWithHome_workQueue_accountManager_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)_characteristicBulletinRegistrationsForSource:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v34 = a4;
  +[_MKFCharacteristicBulletinRegistration fetchRequest](_MKFCharacteristicBulletinRegistration, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "userUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idsIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idsDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("user.modelID"), v8, CFSTR("deviceIdsIdentifier"), v10, CFSTR("deviceIdsDestination"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v13);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v14, "isRestrictedGuestEnabled");

  if ((_DWORD)v9)
  {
    v15 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v5, "userUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "idsDestination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@) && (%K == %@)"), CFSTR("guest.modelID"), v16, CFSTR("deviceIdsIdentifier"), v18, CFSTR("deviceIdsDestination"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD14C0];
    v40[0] = v13;
    v40[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v24);

  }
  v35 = 0;
  objc_msgSend(v34, "executeFetchRequest:error:", v6, &v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v35;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v31;
      v38 = 2112;
      v39 = v5;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic bulletin registrations for source: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v27 = (id)MEMORY[0x24BDBD1A8];
  }

  return v27;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t96 != -1)
    dispatch_once(&logCategory__hmf_once_t96, &__block_literal_global_99_176137);
  return (id)logCategory__hmf_once_v97;
}

void __54__HMDAccessoryBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v97;
  logCategory__hmf_once_v97 = v0;

}

@end
