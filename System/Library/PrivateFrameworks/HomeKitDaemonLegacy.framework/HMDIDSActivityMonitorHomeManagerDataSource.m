@implementation HMDIDSActivityMonitorHomeManagerDataSource

- (HMDIDSActivityMonitorHomeManagerDataSource)initWithHomeManager:(id)a3
{
  id v5;
  void *v6;
  HMDIDSActivityMonitorHomeManagerDataSource *v7;
  HMDIDSActivityMonitorHomeManagerDataSource *v8;
  HMDIDSActivityMonitorHomeManagerDataSource *result;
  HMDIDSActivityMonitorHomeManagerDataSource *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDIDSActivityMonitorHomeManagerDataSource;
    v7 = -[HMDIDSActivityMonitorHomeManagerDataSource init](&v12, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_homeManager, a3);

    return v8;
  }
  else
  {
    v10 = (HMDIDSActivityMonitorHomeManagerDataSource *)_HMFPreconditionFailure();
    -[HMDIDSActivityMonitorHomeManagerDataSource start](v10, v11);
  }
  return result;
}

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDIDSActivityMonitorHomeManagerDataSource startWithNotificationCenter:](self, "startWithNotificationCenter:", v3);

}

- (void)startWithNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDIDSActivityMonitorHomeManagerDataSource *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting to monitor devices for account %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleDeviceAdded_, CFSTR("HMDAccountAddedDeviceNotification"), v6);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleDeviceAdded_, CFSTR("HMDAppleAccountManagerDeviceUpdatedNotification"), v6);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleDeviceRemoved_, CFSTR("HMDAccountRemovedDeviceNotification"), v6);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleRegistrationUpdated_, CFSTR("HMDUserDidUpdateIDSActivityRegistration"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleRegistrationUpdated_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", v8, sel_handleRegistrationUpdated_, CFSTR("HMDNotificationHomeAddedAccessory"), 0);

}

- (id)currentDevice
{
  void *v2;
  void *v3;
  void *v4;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  HMDIDSActivityMonitorHomeManagerDataSource *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDIDSActivityMonitorHomeManagerDataSource *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  HMDIDSActivityMonitorHomeManagerDataSource *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDIDSActivityMonitorHomeManagerDataSource *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDIDSActivityMonitorHomeManagerDataSource *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD);
  id v57;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  HMDIDSActivityMonitorHomeManagerDataSource *v64;
  id v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v57 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  -[HMDIDSActivityMonitorHomeManagerDataSource currentDevice](self, "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v10;
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch tokens, currentDevice unavailable", buf, 0xCu);

      v13 = 0;
    }

    objc_autoreleasePoolPop(v14);
    v12[2](v12, MEMORY[0x1E0C9AA60]);
    v10 = v63;
  }
  v56 = (void (**)(_QWORD, _QWORD))v12;
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v78 = v21;
    v79 = 2112;
    v80 = v22;
    v81 = 2112;
    v82 = v11;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching tokens for observers of %@ on subActivity %@", buf, 0x20u);

    v10 = v63;
  }

  objc_autoreleasePoolPop(v18);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](v19, "homeManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "homes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)v23;
  obj = v25;
  v61 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v61)
  {
    v60 = *(_QWORD *)v72;
    v64 = v19;
    v65 = v11;
    v58 = v13;
    v66 = (void *)v23;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v72 != v60)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v27);
        objc_msgSend(v28, "residentEnabledDevices");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", v13);

        v62 = v27;
        if ((v30 & 1) != 0)
        {
          v26 = v66;
          if ((objc_msgSend(v28, "isResidentFirstAccessoryCommunicationEnabled") & 1) != 0
            || -[HMDIDSActivityMonitorHomeManagerDataSource homeHasCamera:](v19, "homeHasCamera:", v28))
          {
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            objc_msgSend(v28, "users");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v68;
              do
              {
                for (i = 0; i != v33; ++i)
                {
                  if (*(_QWORD *)v68 != v34)
                    objc_enumerationMutation(v31);
                  v36 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                  if ((objc_msgSend(v28, "isResidentFirstAccessoryCommunicationEnabled") & 1) != 0
                    || (objc_msgSend(v36, "isRemoteAccessAllowed") & 1) != 0)
                  {
                    objc_msgSend(v36, "pushTokensForDevicesObservingSubjectDevice:subActivity:", v10, v11);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "addObjectsFromArray:", v37);

                  }
                  else
                  {
                    v38 = (void *)MEMORY[0x1D17BA0A0]();
                    v39 = v64;
                    HMFGetOSLogHandle();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "displayName");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v78 = v41;
                      v79 = 2112;
                      v80 = v42;
                      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_INFO, "%{public}@User %@ does not have remote access, filtering out", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v38);
                    v10 = v63;
                    v11 = v65;
                    v26 = v66;
                  }
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
              }
              while (v33);
            }

            v13 = v58;
            v19 = v64;
          }
          else
          {
            v49 = (void *)MEMORY[0x1D17BA0A0]();
            v50 = v19;
            HMFGetOSLogHandle();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "name");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v78 = v52;
              v79 = 2112;
              v80 = v53;
              _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_INFO, "%{public}@Home %@ did not contain a camera capable of recording, filtering out", buf, 0x16u);

              v10 = v63;
            }

            objc_autoreleasePoolPop(v49);
            v26 = v66;
          }
        }
        else
        {
          v43 = (void *)MEMORY[0x1D17BA0A0]();
          v44 = v19;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "shortDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "name");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v78 = v46;
            v79 = 2112;
            v80 = v47;
            v81 = 2112;
            v82 = v48;
            _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Current device %@ is not a resident in home %@, filtering out", buf, 0x20u);

            v10 = v63;
          }

          objc_autoreleasePoolPop(v43);
          v11 = v65;
          v26 = v66;
        }
        v27 = v62 + 1;
      }
      while (v62 + 1 != v61);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      v61 = v54;
    }
    while (v54);
  }

  v55 = (void *)objc_msgSend(v26, "copy");
  ((void (**)(_QWORD, void *))v56)[2](v56, v55);

}

- (BOOL)homeHasCamera:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  char isKindOfClass;
  BOOL v16;
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
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a3, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "accessoryProfiles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0 && v14)
              {

                v16 = 1;
                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v18;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v16 = 0;
    }
    while (v5);
  }
  else
  {
    v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)startObservingDevice:(id)a3 subActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSActivityMonitorHomeManagerDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  HMDIDSActivityMonitorHomeManagerDataSource *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for IDS Activity on %@ for subActivity %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDIDSActivityMonitorHomeManagerDataSource currentDevice](v9, "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](v9, "homeManager", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "homes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "currentUser");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "registerIDSActivityObserver:subActivity:subjectDevice:", v13, v7, v6);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to registering for IDS Activity, currentDevice unavailable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)stopObservingDevice:(id)a3 subActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDIDSActivityMonitorHomeManagerDataSource *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  HMDIDSActivityMonitorHomeManagerDataSource *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering for IDS Activity on %@ for subActivity %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDIDSActivityMonitorHomeManagerDataSource currentDevice](v9, "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](v9, "homeManager", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "homes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "currentUser");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deregisterIDSActivityObserver:subActivity:subjectDevice:", v13, v7, v6);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deregister for IDS Activity, currentDevice unavailable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)handleDeviceAdded:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitorHomeManagerDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  HMDIDSActivityMonitorHomeManagerDataSource *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Device was added/updated on account, notifying delegate", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HMDIDSActivityMonitorHomeManagerDataSource currentDevice](v6, "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (HMFEqualObjects())
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](v6, "homeManager", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "homes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v27 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "currentUser");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "updateIDSActivityObserver:", v12);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v17);
      }

      -[HMDIDSActivityMonitorHomeManagerDataSource delegate](v6, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dataSourceDidUpdate:", v6);

    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v6;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to update IDS activity observer, currentDevice unavailable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }

}

- (void)handleDeviceRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDIDSActivityMonitorHomeManagerDataSource *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDDeviceNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ was removed from account, reregistering IDS Activity and notifying delegate", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDIDSActivityMonitorHomeManagerDataSource homeManager](v10, "homeManager", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "currentUser");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deregisterIDSActivityObserver:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

}

- (void)handleRegistrationUpdated:(id)a3
{
  id v4;
  void *v5;
  HMDIDSActivityMonitorHomeManagerDataSource *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registration information changed, calling delegate", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDIDSActivityMonitorHomeManagerDataSource delegate](v6, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceDidUpdate:", v6);

}

- (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate)delegate
{
  return (HMDIDSActivityMonitorBroadcasterPushTokenDataSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_destroyWeak((id *)&self->delegate);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_158485 != -1)
    dispatch_once(&logCategory__hmf_once_t17_158485, &__block_literal_global_158486);
  return (id)logCategory__hmf_once_v18_158487;
}

void __57__HMDIDSActivityMonitorHomeManagerDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18_158487;
  logCategory__hmf_once_v18_158487 = v0;

}

@end
